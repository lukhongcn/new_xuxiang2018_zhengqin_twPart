using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.BLL.InventorySystem;
using ModuleWorkFlow.Model.InventorySystem;


using ModuleWorkFlow.BLL.StupidReport;
using Utility;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class OutSourceDetailList : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlTable Table1;

        private ModuleWorkFlow.BLL.Outsource.OutSourceDetail outSourceDetail;

        private string menuid = "D811";
        protected System.Web.UI.WebControls.Label lab_print;
        protected System.Web.UI.WebControls.DataGrid dg_OutSourceDetail;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Button btn_search;
        protected WebControlLibrary.OneClickButton lnkbutton_mail;
        protected System.Web.UI.WebControls.TextBox txt_moduleId;
        protected System.Web.UI.WebControls.DropDownList dpl_moduleId;
        protected System.Web.UI.WebControls.Label lab_moduleId;
        protected DropDownList dpl_outsourceType;
        protected TextBox txt_esendDate;
        protected TextBox txt_ssendDate;
        protected TextBox txt_srequiredDate;
        protected TextBox txt_erequiredDate;
        protected TextBox txt_sconfirmDate;
        protected TextBox txt_econfirmDate;
        protected TextBox txt_applyno;
        protected Label Lab_applyNo;
        protected DropDownList dpl_status;
        protected Label lab_pricetype;
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (Request.Params["pricetype"] != null)
            {
                lab_pricetype.Text = Request.Params["pricetype"];
            }

            string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["ERPInterface"];
            if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
            {
                //SystemInterFace systemInterface = new SystemInterFace();
                //SystemInterFaceInfo si = new SystemInterFace().GetSystemInterFaceInfosByName("outsource");
                //systemInterface.SystemInterFaceInitial("outsourcedate");

                //si = new SystemInterFace().GetSystemInterFaceInfosByName("outsourcesys");
                //InterFaceSchema schema = new InterFaceSchema();
                //string strwhere = " where ((mesLastUpdatedDate<erpLastChangedDate or (mesLastUpdatedDate is null and erpLastChangedDate is not null) or mesUpdateErrorCode>-1) and DML_STATUS='M') ";

                //IList details = schema.GetInterfaceSchema(si, strwhere);

                //IList updateDetails = getLastVersion(details);
                //Object[] args = new Object[1];
                //ArrayList argsdetails = new ArrayList();
                //argsdetails.AddRange(updateDetails);
                //args[0] = argsdetails;
                //systemInterface.updateToAmd(updateDetails, "outsourcedate", si.SourceConnectStr, args);
                dg_OutSourceDetail.Columns[4].Visible = true;

            }
            else
            {
                dg_OutSourceDetail.Columns[4].Visible = false;
            }

            outSourceDetail = new ModuleWorkFlow.BLL.Outsource.OutSourceDetail();
            if (!this.IsPostBack)
            {
                CheckStandProcessInfo cpi = new CheckStandProcess().GetCheckStandProcessInfosByProcessid("IOutSource1");
                if (cpi == null)
                {
                    Lab_applyNo.Visible = false;
                    txt_applyno.Visible = false;
                }
                else
                {
                    Lab_applyNo.Visible = true;
                    txt_applyno.Visible = true;
                }
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    binddpl();
                    if (Request.Params["moduleid"] != null)
                        dpl_moduleId.SelectedValue = Request.Params["moduleid"];
                    bindOutSourceDetail(dpl_moduleId.SelectedValue);
                    ApproveSystem approve = new ApproveSystem();
                    ApproveSystemInfo asi = approve.getApproveSystemByApproveAbbr("OS");

                    if ((asi != null && asi.ApproveText.Equals("Y")) || cpi != null)
                    {
                        dg_OutSourceDetail.Columns[dg_OutSourceDetail.Columns.Count - 1].Visible = true;
                        dg_OutSourceDetail.Columns[dg_OutSourceDetail.Columns.Count - 2].Visible = true;
                        dg_OutSourceDetail.Columns[dg_OutSourceDetail.Columns.Count - 3].Visible = true;

                    }
                    else
                    {
                        dg_OutSourceDetail.Columns[dg_OutSourceDetail.Columns.Count - 1].Visible = false;
                        dg_OutSourceDetail.Columns[dg_OutSourceDetail.Columns.Count - 2].Visible = false;
                        dg_OutSourceDetail.Columns[dg_OutSourceDetail.Columns.Count - 3].Visible = false;
                    }

                    if (cpi == null)
                    {
                        dg_OutSourceDetail.Columns[0].Visible = false;
                        dg_OutSourceDetail.Columns[1].Visible = false;
                    }
                    else
                    {
                        dg_OutSourceDetail.Columns[0].Visible = true;
                        dg_OutSourceDetail.Columns[1].Visible = true;
                    }
                }
            }
        }

        private IList getLastVersion(IList details)
        {
            IList updateDetails = new ArrayList();
            Hashtable hdetails = new Hashtable();
            foreach (OutSourceDetailInfo bsdi in details)
            {
                string key = bsdi.OutsourceApplyNo + "|" + bsdi.SerNo;
                if (hdetails.ContainsKey(key))
                {
                    continue;
                }


                updateDetails.Add(bsdi);
                hdetails.Add(key, bsdi);
            }
            return updateDetails;

        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dpl_moduleId.SelectedIndexChanged += new System.EventHandler(this.dpl_moduleId_SelectedIndexChanged);

            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void bindOutSourceDetail(string moduleid)
        {
            DateTime ssendDate = new DateTime();
            DateTime esendDate = new DateTime();
            DateTime srequiredDate = new DateTime();
            DateTime erequiredDate = new DateTime();
            DateTime sconfirmDate = new DateTime();
            DateTime econfirmDate = new DateTime();
            Label_Message.Text = "";

            try
            {
                if (!txt_ssendDate.Text.Trim().Equals(""))
                {
                    ssendDate = Convert.ToDateTime(txt_ssendDate.Text);
                }
                if (!txt_esendDate.Text.Trim().Equals(""))
                {
                    esendDate = Convert.ToDateTime(txt_esendDate.Text);
                }
            }
            catch
            {
                Label_Message.Text = Translate.translateString("出廠日期請填入適當的日期格式");
                return;
            }







            try
            {
                if (!txt_srequiredDate.Text.Trim().Equals(""))
                {
                    srequiredDate = Convert.ToDateTime(txt_srequiredDate.Text);
                }
                if (!txt_erequiredDate.Text.Trim().Equals(""))
                {
                    erequiredDate = Convert.ToDateTime(txt_erequiredDate.Text);
                }
            }
            catch
            {
                Label_Message.Text = Translate.translateString("回廠日期請填入適當的日期格式");
                return;
            }




            if ((ssendDate.Ticks == 0 && esendDate.Ticks != 0) || (esendDate.Ticks == 0 && ssendDate.Ticks != 0) || (esendDate.Ticks < ssendDate.Ticks))
            {
                Label_Message.Text = Translate.translateString("出廠結束日期必須大於開始日期且必須都填寫");
                return;
            }

            if ((srequiredDate.Ticks == 0 && erequiredDate.Ticks != 0) || (erequiredDate.Ticks == 0 && srequiredDate.Ticks != 0) || (erequiredDate.Ticks < srequiredDate.Ticks))
            {
                Label_Message.Text = Translate.translateString("回廠結束日期必須大於開始日期且必須都填寫");
                return;
            }

            try
            {
                if (!txt_sconfirmDate.Text.Trim().Equals(""))
                {
                    sconfirmDate = Convert.ToDateTime(txt_sconfirmDate.Text);
                }
                if (!txt_econfirmDate.Text.Trim().Equals(""))
                {
                    econfirmDate = Convert.ToDateTime(txt_econfirmDate.Text);
                }
            }
            catch
            {
                Label_Message.Text = Translate.translateString("回廠日期請填入適當的日期格式");
                return;
            }

            if (dpl_moduleId.SelectedValue.Equals("") && txt_moduleId.Text.Trim().Equals("") && ssendDate.Ticks == 0 && esendDate.Ticks == 0 && srequiredDate.Ticks == 0 && erequiredDate.Ticks == 0 && txt_applyno.Text.Trim().Equals(""))
            {
                Label_Message.Text = Translate.translateString("搜索條件至少填入一項");
                return;
            }
            //int ispartoutsource = 0;
            //if (dpl_outsourceType.SelectedValue.Equals("1"))
            //{
            //    ispartoutsource = 0;
            //}
            //else
            //{
            //    ispartoutsource = 1;
            //}

            IList source = outSourceDetail.GetOutSourceDetailInfosByModuleid(moduleid, null, null, txt_applyno.Text.Trim(), ssendDate, esendDate, srequiredDate, erequiredDate, sconfirmDate, econfirmDate, dpl_status.SelectedValue);
            IList newsource = new ArrayList();
            if (lab_pricetype == null)
            {
                foreach (OutSourceDetailInfo osdi in source)
                {
                    if (!osdi.PriceType.Equals("programe"))
                    {
                        newsource.Add(osdi);
                    }
                }
            }

            dg_OutSourceDetail.DataSource = newsource;
            dg_OutSourceDetail.DataKeyField = "Id";
            dg_OutSourceDetail.DataBind();
        }

        private void binddpl()
        {
            dpl_moduleId.DataSource = outSourceDetail.GetModuleInOutSource();
            dpl_moduleId.DataBind();
            dpl_moduleId.Items.Insert(0, new ListItem("", ""));
        }

        private void dpl_moduleId_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            dg_OutSourceDetail.CurrentPageIndex = 0;
            bindOutSourceDetail(dpl_moduleId.SelectedValue.Trim());
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            dg_OutSourceDetail.CurrentPageIndex = 0;
            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                try
                {
                    dpl_moduleId.SelectedValue = txt_moduleId.Text.Trim();
                }
                catch
                {
                    Label_Message.Text = Translate.translateString("模具編號錯誤，請輸入正確的模具編號");
                    return;
                }
                bindOutSourceDetail(txt_moduleId.Text.Trim());
            }
            else
            {
                bindOutSourceDetail(dpl_moduleId.SelectedValue.Trim());
            }
        }

        protected void dg_OutSourceDetail_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_OutSourceDetail.CurrentPageIndex = e.NewPageIndex;
            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                bindOutSourceDetail(txt_moduleId.Text.Trim());
            }
            else
            {
                bindOutSourceDetail(dpl_moduleId.SelectedValue.Trim());
            }
        }

        protected void lnkbutton_confirmedit_Click(object sender, EventArgs e)
        {
            Response.Redirect("OutSourceConfirmView.aspx?menuid=" + menuid + "&moduleid=" + dpl_moduleId.SelectedValue + "&applyNo=" + txt_applyno.Text.Trim());
        }
        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            CheckStandProcessInfo cpi = new CheckStandProcess().GetCheckStandProcessInfosByProcessid("IOutSource1");

            IList processes = new Process().GetProcessInfo();
            string processid = "";
            foreach (ModuleWorkFlow.Model.ProcessInfo pi in processes)
            {
                if (pi.PriceType.Equals("PARTOUTSOURCE"))
                {
                    processid = pi.ProcessId;
                    break;
                }
            }

            if (cpi == null)
            {
                if (dpl_outsourceType.SelectedValue.Equals("2"))
                {
                    if (processid.Equals(""))
                    {
                        Label_Message.Text = Translate.translateString("沒有工藝設定為全零件委外");
                    }
                    else
                    {
                        Response.Redirect("OutSourcePartView.aspx?processid=" + processid + "&menuid=" + menuid + "&moduleid=" + dpl_moduleId.SelectedValue);
                    }
                }
                else
                {
                    Response.Redirect("OutSourceView.aspx?menuid=" + menuid + "&moduleid=" + dpl_moduleId.SelectedValue);
                }

            }
            else
            {
                foreach (DataGridItem item in dg_OutSourceDetail.Items)
                {
                    CheckBox CheckBox_Select = item.FindControl("CheckBox_Select") as CheckBox;
                    Label dg_lab_OutsourceApplyNo = item.FindControl("dg_lab_OutsourceApplyNo") as Label;
                    if (CheckBox_Select.Checked)
                    {
                        if (dpl_outsourceType.SelectedValue.Equals("2"))
                        {
                            if (processid.Equals(""))
                            {
                                Label_Message.Text = Translate.translateString("沒有工藝設定為全零件委外");
                            }
                            else
                            {
                                Response.Redirect("OutSourcePartView.aspx?processid=" + processid + "&menuid=" + menuid + "&moduleid=" + dpl_moduleId.SelectedValue + "&applyNo=" + dg_lab_OutsourceApplyNo.Text.Trim());
                            }
                        }
                        else
                        {
                            Response.Redirect("OutSourceView.aspx?menuid=" + menuid + "&moduleid=" + dpl_moduleId.SelectedValue + "&applyNo=" + dg_lab_OutsourceApplyNo.Text.Trim());
                        }


                        break;
                    }
                }
            }

        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            CheckStandProcessInfo cpi = new CheckStandProcess().GetCheckStandProcessInfosByProcessid("IOutSource1");
            IList processes = new Process().GetProcessInfo();
            string processid = "";
            foreach (ModuleWorkFlow.Model.ProcessInfo pi in processes)
            {
                if (pi.PriceType.Equals("PARTOUTSOURCE"))
                {
                    processid = pi.ProcessId;
                }
            }
            if (dpl_outsourceType.SelectedValue.Equals("2"))
            {
                if (processid.Equals(""))
                {
                    Label_Message.Text = Translate.translateString("沒有工藝設定為全零件委外");
                }
                else
                {
                    Response.Redirect("OutSourcePartView.aspx?processid=" + processid);
                }
            }
            else
            {
                Response.Redirect("OutSourceView.aspx");
            }



        }

        protected void dg_OutSourceDetail_ItemCreated(object sender, DataGridItemEventArgs e)
        {

        }

        protected void dg_OutSourceDetail_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label dg_lab_erppartNo = e.Item.FindControl("dg_lab_erppartNo") as Label;
                Label dg_lab_partNo = e.Item.FindControl("dg_lab_partNo") as Label;
                Label dg_lab_moduleId = e.Item.FindControl("dg_lab_moduleId") as Label;
                BomDetailInfo bdi = new BomDetail().GetBomDetailByNoPartNo(dg_lab_moduleId.Text.Trim(), dg_lab_partNo.Text.Trim());
                if (bdi != null && bdi.MaterialUsedWay != null)
                {
                    dg_lab_erppartNo.Text = bdi.MaterialUsedWay;
                }

                Label lab_approveDate = e.Item.FindControl("dg_lab_approveDate") as Label;
                Label lab_factStartDate = e.Item.FindControl("dg_lab_factStartDate") as Label;
                Label lab_factEndDate = e.Item.FindControl("dg_lab_factEndDate") as Label;
                Label lab_requireDate = e.Item.FindControl("dg_lab_requireDate") as Label;
                Label lab_confirmDate = e.Item.FindControl("dg_lab_confirmDate") as Label;
                Label lab_sendDate = e.Item.FindControl("dg_lab_sendDate") as Label;
                if (lab_approveDate.Text.Equals("01-1-1"))
                {
                    lab_approveDate.Text = "";
                }

                if (lab_factStartDate.Text.Equals("01-1-1"))
                {
                    lab_factStartDate.Text = "";
                }

                if (lab_factEndDate.Text.Equals("01-1-1"))
                {
                    lab_factEndDate.Text = "";
                }

                if (lab_requireDate.Text.Equals("01-1-1"))
                {
                    lab_requireDate.Text = "";
                }

                if (lab_confirmDate.Text.Equals("01-1-1"))
                {
                    lab_confirmDate.Text = "";
                }

                if (lab_sendDate.Text.Equals("01-1-1"))
                {
                    lab_sendDate.Text = "";
                }

                Label dg_lab_OutsourceApplyNo = e.Item.FindControl("dg_lab_OutsourceApplyNo") as Label;
                CheckBox CheckBox_Select = e.Item.FindControl("CheckBox_Select") as CheckBox;
                Label dg_lab_ApproveStatus = e.Item.FindControl("dg_lab_ApproveStatus") as Label;
                if (!dg_lab_OutsourceApplyNo.Text.Trim().Equals("") && (dg_lab_ApproveStatus.Text.Trim().Equals("CheckWait") || dg_lab_ApproveStatus.Text.Trim().Equals("Checking") || dg_lab_ApproveStatus.Text.Trim().Equals("checkPass")))
                {

                    CheckSheetProcess chkProcess = new CheckSheetProcess();
                    IList sheets = chkProcess.GetAllCheckSheetProcessInfoByNo(dg_lab_OutsourceApplyNo.Text.Trim());
                    foreach (CheckSheetProcessInfo psi in sheets)
                    {
                        if (psi.StatusId.Equals("checkUnPass") && psi.ProcessOrder == 1)
                        {
                            CheckBox_Select.Enabled = true;
                        }
                        else
                        {
                            CheckBox_Select.Enabled = false;
                        }
                        if (!psi.StatusId.Equals("checkPass") || (psi.StatusId.Equals("checkPass") && sheets.IndexOf(psi) == sheets.Count - 1))
                        {

                            Label dg_lab_approver = e.Item.FindControl("dg_lab_approver") as Label;
                            StatusInfo si = (new Status().getStatusInfoById(psi.StatusId)[0]) as StatusInfo;
                            dg_lab_ApproveStatus.Text = psi.ProcessName + si.StatusDesc;
                            if (psi.FactStartDate.Ticks > 0)
                            {
                                lab_approveDate.Text = psi.FactStartDate.ToString("yy-M-d");
                            }
                            if (psi.Responsible != null && !psi.Responsible.Equals(""))
                            {
                                UserInfo ui = new User().getUserInfo(psi.Responsible);
                                if (ui != null)
                                {
                                    dg_lab_approver.Text = ui.Name;
                                }
                            }
                            break;
                        }
                    }
                }
            }

        }

        protected void lnkbutton_mail_Click(object sender, EventArgs e)
        {
            IList details = new ArrayList();
            Label_Message.Text = Translate.translateString("郵件發送中...請稍待.");
            DateTime ssendDate = new DateTime();
            DateTime esendDate = new DateTime();
            DateTime srequiredDate = new DateTime();
            DateTime erequiredDate = new DateTime();
            if (!txt_esendDate.Text.Equals("") && !txt_ssendDate.Text.Equals(""))
            {
                try
                {
                    ssendDate = Convert.ToDateTime(txt_ssendDate.Text);
                    esendDate = Convert.ToDateTime(txt_esendDate.Text);
                }
                catch
                {
                    Label_Message.Text = Translate.translateString("出廠日期請填入適當的日期格式");
                    return;
                }
            }

            if (!txt_srequiredDate.Text.Equals("") && !txt_erequiredDate.Text.Equals(""))
            {
                try
                {
                    srequiredDate = Convert.ToDateTime(txt_srequiredDate.Text);
                    erequiredDate = Convert.ToDateTime(txt_erequiredDate.Text);
                }
                catch
                {
                    Label_Message.Text = Translate.translateString("回廠日期請填入適當的日期格式");
                    return;
                }
            }

            if ((ssendDate.Ticks == 0 && esendDate.Ticks != 0) || (esendDate.Ticks == 0 && ssendDate.Ticks != 0) || (esendDate.Ticks < ssendDate.Ticks))
            {
                Label_Message.Text = Translate.translateString("出廠結束日期必須大於開始日期且必須都填寫");
                return;
            }

            if ((srequiredDate.Ticks == 0 && erequiredDate.Ticks != 0) || (erequiredDate.Ticks == 0 && srequiredDate.Ticks != 0) || (erequiredDate.Ticks < srequiredDate.Ticks))
            {
                Label_Message.Text = Translate.translateString("回廠結束日期必須大於開始日期且必須都填寫");
                return;
            }
            details = outSourceDetail.GetOutSourceDetailInfosByModuleid(dpl_moduleId.SelectedValue, null, null, ssendDate, esendDate, srequiredDate, erequiredDate);

            if (details.Count > 0)
            {
                SendAlert sa = new SendAlert();
                string msg = sa.sendAlert("OutSourceDetailNotice", details, null);
                Label_Message.Text = msg;
            }
            else
            {
                Label_Message.Text = Translate.translateString("沒有資料,可供發送!");
            }
            lnkbutton_mail.Enabled = true;
        }

        protected void dpl_status_SelectedIndexChanged(object sender, EventArgs e)
        {
            dg_OutSourceDetail.CurrentPageIndex = 0;
            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                try
                {
                    dpl_moduleId.SelectedValue = txt_moduleId.Text.Trim();
                }
                catch
                {
                    Label_Message.Text = Translate.translateString("模具編號錯誤，請輸入正確的模具編號");
                    return;
                }
                bindOutSourceDetail(txt_moduleId.Text.Trim());
            }
            else
            {
                bindOutSourceDetail(dpl_moduleId.SelectedValue.Trim());
            }
        }
    }
}