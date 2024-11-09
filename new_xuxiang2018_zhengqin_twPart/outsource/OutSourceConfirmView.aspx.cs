using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ModuleWorkFlow.business;
using ModuleWorkFlow.report;
using System.IO;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.InventorySystem;
using ModuleWorkFlow.Model.InventorySystem;
using ModuleWorkflow.OutSource.BLL.Interface;
using Utility;
using Part = ModuleWorkFlow.BLL.Part;


namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for PartList.
    /// </summary>
    public class OutSourceConfirmView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.DataGrid dg_OutSourceDetail;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_ModuleId;
        protected System.Web.UI.WebControls.DropDownList drp_SupplyId;
        protected System.Web.UI.WebControls.TextBox txt_moduleid;
        protected TextBox txt_partno;
        protected TextBox txt_confirmDate;

        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.LinkButton lnkbutton_view;
        protected string title;
        protected System.Web.UI.WebControls.TextBox txt_outsourceApplyNo;
        protected Label lab_outsourceApplyNo;


        protected TextBox txt_sendDate;



        private string menuid = "D811";
        private string checkprocessName = "IOutSource";
        private OutSourceDetail outSourceDetail;
        private void Page_Load(object sender, System.EventArgs e)
        {

            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;
                TmenuInfo mi = new Tmenu().findbykey(menuid);
                master.Menuname = mi.Menuname;
                title = mi.Menuname;
            }
           

            outSourceDetail = new OutSourceDetail();

            // Put user code to initialize the page here
            if (!this.IsPostBack)
            {
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
                string moduleid = Request.Params["moduleid"];
                string applyNo = Request.Params["applyNo"];
                txt_outsourceApplyNo.Text = applyNo;
                string msg = Request.Params["msg"];
                if (msg != null)
                {
                    Label_Message.Text = msg;
                }



                //ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                //lab_retrun_designid.Text = id.ToString().Trim();

                //initialEdit(Convert.ToInt32(id));
                txt_moduleid.Text = Request.Params["moduleid"];

                BindModuleOutSource();
                Dropdownlist_ModuleId.SelectedValue = Request.Params["moduleid"];
                bindSupply();







                bindOutSourceDetail(txt_moduleid.Text, txt_outsourceApplyNo.Text);





            }
            Label_Message.Text = "";
            //msg = Request.Params["msg"];
            //if (msg != null && msg.Length > 0) Label_Message.Text = msg;
        }

        private void bindSupply()
        {
            drp_SupplyId.DataSource = new ModuleWorkFlow.BLL.System.Supply().GetSupplyInfos();
            drp_SupplyId.DataTextField = "SupplierId";
            drp_SupplyId.DataValueField = "Id";
            drp_SupplyId.DataBind();
        }

        private void BindModuleOutSource()
        {
            Dropdownlist_ModuleId.DataSource = outSourceDetail.GetModuleInOutSource();
            Dropdownlist_ModuleId.DataBind();
            Dropdownlist_ModuleId.Items.Insert(0, new ListItem(Translate.translateString("全部"), ""));
        }

        private void bindOutSourceDetail(string moduleid, string applyno)
        {
            if (Dropdownlist_ModuleId.SelectedValue.Equals("") && txt_moduleid.Text.Trim().Equals("") && txt_partno.Text.Trim().Equals("") && txt_outsourceApplyNo.Text.Trim().Equals(""))
            {
                Label_Message.Text = Translate.translateString("搜索條件至少填入一項");
                return;
            }
            dg_OutSourceDetail.DataSource = outSourceDetail.GetOutSourceDetailInfosByModuleid(moduleid, txt_partno.Text.Trim(), null, applyno, new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), null);
            dg_OutSourceDetail.DataKeyField = "Id";
            dg_OutSourceDetail.DataBind();
        }






        protected void txt_confirmDate_TextChanged(object sender, EventArgs e)
        {
            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                    if (chk.Checked)
                    {
                        TextBox dg_lab_confirmDate = item.FindControl("dg_lab_confirmDate") as TextBox;
                        dg_lab_confirmDate.Text = txt_confirmDate.Text;
                    }
                }
            }

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


            this.Dropdownlist_ModuleId.SelectedIndexChanged += new System.EventHandler(this.Dropdownlist_ModuleId_SelectedIndexChanged);


            //this.MainDataGrid.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemCreated);
            this.dg_OutSourceDetail.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);

            this.dg_OutSourceDetail.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion





        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dg_OutSourceDetail.CurrentPageIndex = e.NewPageIndex;





            bindOutSourceDetail(txt_moduleid.Text, txt_outsourceApplyNo.Text);
        }




        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                Label dg_lab_requireDate = e.Item.FindControl("dg_lab_requireDate") as Label;
                TextBox dg_lab_confirmDate = e.Item.FindControl("dg_lab_confirmDate") as TextBox;


                if (dg_lab_requireDate.Text.IndexOf("0001") >-1)
                {
                    dg_lab_requireDate.Text = "";
                }

                if ( dg_lab_confirmDate.Text.IndexOf("0001") > -1)
                {
                    dg_lab_confirmDate.Text = "";
                }

                Label dg_lab_OutsourceApplyNo = e.Item.FindControl("dg_lab_OutsourceApplyNo") as Label;
                CheckBox CheckBox_Select = e.Item.FindControl("CheckBox_Select") as CheckBox;

                DropDownList dg_drp_SupplyId = e.Item.FindControl("dg_drp_SupplyId") as DropDownList;
                dg_drp_SupplyId.DataSource = new ModuleWorkFlow.BLL.System.Supply().GetSupplyInfos();
                dg_drp_SupplyId.DataTextField = "SupplierId";
                dg_drp_SupplyId.DataValueField = "Id";
                dg_drp_SupplyId.DataBind();


            }
        }



        private void Dropdownlist_ModuleId_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            dg_OutSourceDetail.CurrentPageIndex = 0;


            bindOutSourceDetail(txt_moduleid.Text, txt_outsourceApplyNo.Text);
        }











        private void clearSession()
        {
            //IList processes = new Process().GetProcessesInPartprocess(ListBox_ModuleList.SelectedValue);
            //foreach (ModuleWorkFlow.Model.ProcessInfo pi in processes)
            //{
            //    Session[pi.ProcessId] = null;
            //}

            Session["processid"] = null;
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            clearSession();
            Response.Redirect("OutSourceView.aspx?menuid=" + menuid + "&moduleid=" + Dropdownlist_ModuleId.Text + "&applyNo=" + txt_outsourceApplyNo.Text.Trim());

        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            IList details = new ArrayList();
            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                    Label lab_id = item.FindControl("dg_lab_outsourceid") as Label;

                    OutSourceDetailInfo odi = outSourceDetail.findbykey(Convert.ToInt32(lab_id.Text));

                    if (chk.Checked)
                    {

                        try
                        {

                            TextBox dg_lab_confirmDate = item.FindControl("dg_lab_confirmDate") as TextBox;
                            odi.ConfirmDate = Convert.ToDateTime(dg_lab_confirmDate.Text);

                        }
                        catch
                        {
                            Label_Message.Text = Translate.translateString("第") + item.ItemIndex.ToString() + Translate.translateString("請填寫正確日期");
                            return;
                        }

                        try
                        {

                            TextBox dg_txt_confirmCount = item.FindControl("dg_txt_confirmCount") as TextBox;
                            odi.ConfirmCount = Convert.ToInt32(dg_txt_confirmCount.Text);
                        }
                        catch
                        {
                            Label_Message.Text = Translate.translateString("第") + item.ItemIndex.ToString() + Translate.translateString("請填寫正確數量");
                            return;
                        }

                        DropDownList dg_drp_SupplyId = item.FindControl("dg_drp_SupplyId") as DropDownList;
                        if (!dg_drp_SupplyId.SelectedValue.Trim().Equals(""))
                        {
                            odi.SupplyId = Convert.ToInt32(dg_drp_SupplyId.SelectedValue);
                        }


                        details.Add(odi);

                    }
                    else
                    {
                        odi.ConfirmDate = new DateTime();
                        odi.SupplyId = 0;
                    }

                   

                }

            }

            if (details.Count == 0)
            {
                Label_Message.Text = Translate.translateString("請至少選擇一個需要確認的產品");
                return;
            }
            ArrayList source = new ArrayList();
            IList addDetailSource = new ArrayList();
            PartSubPart partSubPart = new PartSubPart();
            PartPart partPart = new PartPart();
            PartPartProcess partPartProcess = new PartPartProcess();
            foreach (OutSourceDetailInfo osdi in details)
            {
                if (osdi.ProcessOrder == 1 )
                {
                    PartInfo partInfo = new Part().getPartInfo(osdi.ModuleId, osdi.PartNo);
                    //產生箱號，檢查數量是否合法，如果合法執行下面操作
                    string msg = partSubPart.checkChangeSubPartCount(partInfo,osdi.PartNo_Id, osdi.ConfirmCount);
                    if (!msg.Equals(Lang.SAVE_SUCCESS))
                    {
                        Label_Message.Text = msg;
                        return;
                    }
                    int totalCount = partInfo.LeastCount + partInfo.EachBatchCount;
                    if (totalCount - osdi.ConfirmCount >0)
                    {
                        //update EachBatchCount,LeastCount for part
                        partInfo.EachBatchCount = osdi.ConfirmCount;
                        partInfo.LeastCount = totalCount - partInfo.EachBatchCount;

                        PartProcessInfo ppi = partPartProcess.getPartProcessInfo(osdi.ModuleId, osdi.PartNo_Id, osdi.ProcessOrder);
                        if (ppi.EachBatchCount == 0)
                        {
                            partInfo.PartCount++;

                            OutSourceDetailInfo addOsdi = new OutSourceDetailInfo();
                            tools.CopyObject(osdi, addOsdi);
                            addOsdi.ConfirmCount = 0;
                            addOsdi.ConfirmDate = new DateTime();

                            addOsdi.PartNo_Id = osdi.PartNo + "-" + partInfo.PartCount;
                            addDetailSource.Add(addOsdi);
                        }
                            
                        source.Add(partPart.UpdateAllParts(partInfo));
                        //update EachBatchCount for partNoId
                       
                        source.Add(partPartProcess.UpdataBeachCount(osdi.ModuleId,osdi.PartNo_Id,osdi.ConfirmCount));
                        //add partcount++

                        source.AddRange
                            (partPart.UpdateAllPartPart(partInfo, new OutSourceDetail(), new OutsourceApplyDesignInfo()));
                        

                    }
                }
            }

            source.Add(outSourceDetail.updateAllOutSourceDetail(details));
            source.Add(outSourceDetail.insertAllOutSourceDetail(addDetailSource));


           
            if (new Schedule().SaveSchedule(source))
            {
                //add outsource for new 
                
                Label_Message.Text = Lang.SAVE_SUCCESS;
            }
            else
            {
                Label_Message.Text = Lang.SAVE_FAIL;
            }






        }



        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            dg_OutSourceDetail.CurrentPageIndex = 0;
            if (!txt_moduleid.Text.Trim().Equals(""))
            {
                try
                {
                    Dropdownlist_ModuleId.SelectedValue = txt_moduleid.Text.Trim();
                }
                catch
                {
                    Label_Message.Text = Translate.translateString("模具編號錯誤，請輸入正確的模具編號");
                    return;
                }

                bindOutSourceDetail(txt_moduleid.Text, txt_outsourceApplyNo.Text);
            }
            else
            {
                txt_moduleid.Text = Dropdownlist_ModuleId.SelectedValue;
                bindOutSourceDetail(txt_moduleid.Text, txt_outsourceApplyNo.Text);
            }





        }

        protected void drp_SupplyId_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                    if (chk.Checked)
                    {
                        Label dg_lab_SupplyId = item.FindControl("dg_lab_SupplyId") as Label;
                        dg_lab_SupplyId.Text = drp_SupplyId.SelectedValue;
                        DropDownList dg_drp_SupplyId = item.FindControl("dg_drp_SupplyId") as DropDownList;
                        dg_drp_SupplyId.SelectedValue = drp_SupplyId.SelectedValue;
                    }
                }
            }
        }









    }
}
