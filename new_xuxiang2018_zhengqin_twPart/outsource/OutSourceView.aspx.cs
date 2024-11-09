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
using System.IO;
using AjaxControlToolkit;


using Utility;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.InventorySystem;
using ModuleWorkFlow.Model.InventorySystem;
using ModuleWorkflow.OutSource.BLL.Interface;
namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class OutSourceView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add_edit;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label lab_partName;
        protected System.Web.UI.WebControls.Label lab_pictureNo;
        protected System.Web.UI.WebControls.TextBox txt_pictureNo;
        protected System.Web.UI.WebControls.TextBox txt_spec;
        protected System.Web.UI.WebControls.TextBox txt_comment;
        protected TextBox txt_moduleId;
        protected System.Web.UI.WebControls.DataGrid dg_OutSourceDetail;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Panel panel_detail;


        protected System.Web.UI.WebControls.Label func;


        protected System.Web.UI.WebControls.Label lab_creater;
        protected System.Web.UI.WebControls.Label lab_createDate;
        protected System.Web.UI.WebControls.Label lab_price;
        protected System.Web.UI.WebControls.Label lab_requireCount;
        protected System.Web.UI.WebControls.Label lab_materialId;
        protected System.Web.UI.WebControls.TextBox txt_applyDate;
        protected System.Web.UI.WebControls.Label lab_productno;

        protected System.Web.UI.WebControls.DropDownList ListBox_ModuleList;
        protected System.Web.UI.WebControls.DropDownList dpl_process;


        protected System.Web.UI.WebControls.TextBox txt_productno;
        protected System.Web.UI.WebControls.TextBox txt_requireCount;
        protected System.Web.UI.WebControls.TextBox txt_price;

        protected System.Web.UI.WebControls.Label lab_comment;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.WebControls.Label lab_moduleId;

        protected System.Web.UI.WebControls.Button btn_search;
        protected System.Web.UI.WebControls.Label lab_productmateailid;
        protected System.Web.UI.WebControls.Button btn_select_productmateailid;
        protected System.Web.UI.WebControls.TextBox txt_partname;
        protected ModuleWorkFlow.BLL.Inventory.ProductMaterialInventory promatl;
        protected ModuleWorkFlow.Model.Inventory.ProductMaterialInventoryInfo promatlinfo;
        protected System.Web.UI.WebControls.TextBox txt_name;
        protected System.Web.UI.WebControls.Label lab_spec;
        protected System.Web.UI.WebControls.Button btn_edit_design;
        protected System.Web.UI.WebControls.Label lab_retrun_designid;
        protected System.Web.UI.WebControls.LinkButton lnk_schedule;
        protected System.Web.UI.WebControls.LinkButton lnkbutton_edit;
        protected TextBox txt_sendDate;
        protected TextBox txt_outsourceApplyNo;
        protected Label lab_outsourceApplyNo;
        protected TextBox txt_partno;
        protected Label lab_applyid;


        private string pricetype = "";
        private string menuid = "D811";
        private string checkprocessName = "IOutSource";
        private OutSourceDetail outSourceDetail;
        protected string menuname = "";

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;
                TmenuInfo mi = new Tmenu().findbykey(menuid);
                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
            }

            if (Request.Params["pricetype"] != null)
            {
                pricetype = Request.Params["pricetype"];
            }
            outSourceDetail = new OutSourceDetail();

            if (!this.IsPostBack)
            {

                string moduleid = Request.Params["moduleid"];
                string processid = Request.Params["processid"];
                string msg = Request.Params["msg"];
                if (msg != null)
                {
                    Label_Message.Text = msg;
                }
                CheckStandProcessInfo cpi = new CheckStandProcess().GetCheckStandProcessInfosByProcessid("IOutSource1");
                if (cpi != null)
                {
                    lab_outsourceApplyNo.Visible = true;
                    txt_outsourceApplyNo.Visible = true;
                    lab_comment.Visible = true;
                    txt_comment.Visible = true;
                }
                else
                {
                    lab_outsourceApplyNo.Visible = false;
                    txt_outsourceApplyNo.Visible = false;
                    lab_comment.Visible = false;
                    txt_comment.Visible = false;
                }
                if (moduleid != null)
                {
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                    //lab_retrun_designid.Text = id.ToString().Trim();

                    //initialEdit(Convert.ToInt32(id));
                    lab_moduleId.Text = Request.Params["moduleid"];
                    BindModuleOutSource();
                    ListBox_ModuleList.SelectedValue = Request.Params["moduleid"];
                    ListBox_ModuleList.Enabled = false;

                    if (cpi != null)
                    {



                        lab_applyid.Visible = false;
                        txt_outsourceApplyNo.Text = Request.Params["applyNo"];
                        OutsourceApplyDesignInfo oai = new OutsourceApplyDesign().GetOutsourceApplyDesignByNo(txt_outsourceApplyNo.Text);
                        if (oai != null)
                        {
                            lab_applyid.Text = oai.Id.ToString();
                        }




                        txt_outsourceApplyNo.ReadOnly = true;

                    }

                }
                else
                {
                    SheetNo sheetNo = new SheetNo();

                    int lastserious = sheetNo.GetMaxSheetNo() + 1;
                    txt_outsourceApplyNo.Text = tools.fillString(lastserious.ToString(), 6, '0');
                    txt_outsourceApplyNo.ReadOnly = true;
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
                    BindModule();
                }
                BindProcess();

                if (processid != null)
                {
                    dpl_process.SelectedValue = processid;
                }
                ArrayList source = new ArrayList();
                //for set session
                bindOutSourceDetail(ListBox_ModuleList.SelectedValue);
                //for bind checkbox
                bindOutSourceDetail(ListBox_ModuleList.SelectedValue);


            }
        }

        private void ClearView()
        {

            txt_pictureNo.Text = "";
            txt_name.Text = "";
            txt_partname.Text = "";

            txt_price.Text = "";
            txt_requireCount.Text = "";

            txt_spec.Text = "";

            txt_comment.Text = "";

            func.Text = "";
        }

        private void BindProcess()
        {
            dpl_process.DataSource = new Process().GetProcessesInPartprocess(ListBox_ModuleList.SelectedValue);
            dpl_process.DataTextField = "ProcessName";
            dpl_process.DataValueField = "ProcessId";
            dpl_process.DataBind();
            dpl_process.Items.Insert(0, new ListItem(Translate.translateString("所有需外發"), "NEEDOUTSOURCE"));
            dpl_process.Items.Insert(0, new ListItem(Translate.translateString("所有"), ""));



        }

        private void BindModuleOutSource()
        {
            ListBox_ModuleList.DataSource = outSourceDetail.GetModuleInOutSource();
            ListBox_ModuleList.DataBind();
        }

        private void BindModule()
        {
            
            ListBox_ModuleList.DataSource = new OrderDesign().GetOrderDesignInfos(" and overdealt=0 and  isModifyModuleOrder=1 ");
            ListBox_ModuleList.DataTextField = "moduleid";
            ListBox_ModuleList.DataValueField = "moduleid";
            ListBox_ModuleList.DataBind();
            //ListBox_ModuleList.Items.Insert(0, new ListItem("所有可外發", ""));

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


            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion




        private void btn_select_productmateailid_Click(object sender, System.EventArgs e)
        {
            Response.Write("<script language=\"javascript\">window.open('Apply/BomProductMaterialSearch.aspx','pmis',\"toolbar=no,location=no,directories=yes,status=yes,menubar=yes,resizable=yes,scrollbars=no,idth=400px,height=500px\");</script>");
        }


        private void bindOutSourceDetail(string moduleid)
        {
            IList source = new ArrayList();
            string keyfield = "processno";
            Hashtable hchecked;



            if (Session["processid"] == null)
            {
                hchecked = new Hashtable();
                Session["processid"] = hchecked;
            }

            hchecked = (Hashtable)Session["processid"];

            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                TextBox txt_requireDate = item.FindControl("dg_lab_requireDate") as TextBox;
                TextBox txt_sendDate = item.FindControl("dg_lab_sendDate") as TextBox;
                TextBox txt_Recommand = item.FindControl("dg_lab_comment") as TextBox;
                Label lab_outsourceid = item.FindControl("dg_lab_outsourceid") as Label;
                DropDownList dg_drp_SupplyId = item.FindControl("dg_drp_SupplyId") as DropDownList;
                int id = 0;
                if (!lab_outsourceid.Text.Equals(""))
                    id = Convert.ToInt32(lab_outsourceid.Text);

                DateTime requriedate = new DateTime();
                DateTime sendDate = new DateTime();
                try
                {
                    requriedate = Convert.ToDateTime(txt_requireDate.Text);
                    sendDate = Convert.ToDateTime(txt_sendDate.Text);
                }
                catch
                {
                }
                int processno = Convert.ToInt32(dg_OutSourceDetail.DataKeys[item.ItemIndex]);
                OutSourceDetailInfo odi = new OutSourceDetailInfo();
                if (chk.Checked || id != 0)
                {
                    if (hchecked.ContainsKey(processno))
                    {
                        odi = (OutSourceDetailInfo)hchecked[processno];
                        odi.IsOutsource = chk.Checked;
                        odi.RequireDate = requriedate;
                        odi.SendDate = sendDate;
                        odi.Comment = txt_Recommand.Text;
                        if (!dg_drp_SupplyId.SelectedValue.Equals(""))
                        {
                            odi.SupplyId = Convert.ToInt32(dg_drp_SupplyId.SelectedValue);
                        }
                        odi.Id = id;
                    }
                    else
                    {
                        if (id != 0)
                        {
                            odi = outSourceDetail.findbykey(id);
                            odi.IsOutsource = chk.Checked;
                            odi.RequireDate = requriedate;
                            odi.SendDate = sendDate;
                            odi.Comment = txt_Recommand.Text;
                            if (!dg_drp_SupplyId.SelectedValue.Equals(""))
                            {
                                odi.SupplyId = Convert.ToInt32(dg_drp_SupplyId.SelectedValue);
                            }
                            odi.Id = id;
                        }
                        else
                        {
                            odi.Processno = Convert.ToInt32(dg_OutSourceDetail.DataKeys[item.ItemIndex]);
                            odi.ModuleId = ListBox_ModuleList.SelectedValue;
                            Label lab_processId = item.FindControl("dg_lab_processId") as Label;
                            odi.ProcessId = lab_processId.Text;
                            Label lab_partNoId = item.FindControl("dg_lab_partNoId") as Label;
                            odi.PartNo_Id = lab_partNoId.Text;
                            Label lab_processOrder = item.FindControl("dg_lab_processOrder") as Label;
                            odi.ProcessOrder = Convert.ToInt32(lab_processOrder.Text);
                            Label lab_partNo = item.FindControl("dg_lab_partNo") as Label;
                            odi.PartNo = lab_partNo.Text;
                            try
                            {
                                TextBox txt_requiredDate = item.FindControl("dg_lab_requireDate") as TextBox;
                                odi.RequireDate = Convert.ToDateTime(txt_requiredDate.Text);
                                txt_sendDate = item.FindControl("dg_lab_sendDate") as TextBox;
                                odi.SendDate = Convert.ToDateTime(txt_sendDate.Text);
                            }
                            catch
                            {
                                Label_Message.Text = Translate.translateString("第") + item.ItemIndex.ToString() + Translate.translateString("需求日期請填寫日期");
                                return;
                            }

                            TextBox txt_comment = item.FindControl("dg_lab_comment") as TextBox;
                            odi.Comment = txt_comment.Text;
                            odi.IsOutsource = chk.Checked;
                            if (!dg_drp_SupplyId.SelectedValue.Trim().Equals(""))
                            {
                                odi.SupplyId = Convert.ToInt32(dg_drp_SupplyId.SelectedValue);
                            }
                            odi.Id = id;
                        }
                        hchecked.Add(processno, odi);

                    }
                }

            }


            if (dpl_process.SelectedValue.Equals("") || dpl_process.SelectedValue.Equals("NEEDOUTSOURCE"))
            {
                if (!lab_moduleId.Text.Equals(""))
                {
                    ArrayList allsource = outSourceDetail.GetOutSourceDetailInfo(moduleid, txt_partno.Text, txt_outsourceApplyNo.Text.Trim()) as ArrayList;
                    //ArrayList  allsource = outSourceDetail.GetOutSourceDetailInfosWithPartProcess(moduleid, null,null) as ArrayList;
                    allsource.AddRange(outSourceDetail.GetOutSourceDetailInfosWithPartProcess(moduleid, null, txt_partno.Text, txt_outsourceApplyNo.Text.Trim()));
                    source.Clear();
                    if (dpl_process.SelectedValue.Equals("NEEDOUTSOURCE"))
                    {
                        foreach (OutSourceDetailInfo odi in allsource)
                        {
                            if (odi.PriceType.ToUpper().Equals("OUTSOURCE"))
                            {
                                source.Add(odi);
                            }
                        }
                    }
                    else
                    {

                        ((ArrayList)source).AddRange(allsource);
                    }
                    foreach (OutSourceDetailInfo odi in source)
                        odi.IsOutsource = true;
                }
                else
                {
                    IList allsource = new ModuleWorkFlow.BLL.PartProcess().getListPartProcessInfoCanOutsource(moduleid, txt_partno.Text);
                    source.Clear();
                    if (dpl_process.SelectedValue.Equals("NEEDOUTSOURCE"))
                    {
                        foreach (PartProcessInfo odi in allsource)
                        {
                            if (odi.PriceType.ToUpper().Equals("OUTSOURCE") && odi.NeedProduct == 1)
                            {
                                source.Add(odi);
                            }
                        }
                    }
                    else
                    {
                        foreach (PartProcessInfo odi in allsource)
                        {
                            if (odi.NeedProduct == 1)
                            {
                                source.Add(odi);
                            }
                        }


                    }
                    foreach (PartProcessInfo ppi in source)
                    {
                        ppi.RequireDate = ppi.EndDate;
                        ppi.SendDate = ppi.StartDate;
                        ppi.SerNo = "";
                        //if (ListBox_ModuleList.SelectedValue.Equals(""))
                        //{
                        //    ppi.RequireDate = DateTime.Now.AddMinutes(ppi.ProcessNeedMinutes);
                        //    ppi.SendDate = DateTime.Now;
                        //}
                        ppi.Id = 0;
                    }

                }
            }
            else
            {
                if (!lab_moduleId.Text.Equals(""))
                {
                    source = outSourceDetail.GetOutSourceDetailInfo(moduleid, txt_partno.Text, txt_outsourceApplyNo.Text.Trim());
                    ((ArrayList)source).AddRange(outSourceDetail.GetOutSourceDetailInfosWithPartProcess(moduleid, dpl_process.SelectedValue, txt_partno.Text, txt_outsourceApplyNo.Text.Trim()));
                    foreach (OutSourceDetailInfo odi in source)
                    {

                        odi.IsOutsource = true;
                    }

                }
                else
                {
                    IList allsource = new ModuleWorkFlow.BLL.PartProcess().getListPartProcessInfoCanOutsource(moduleid, txt_partno.Text);
                    source = new ArrayList();
                    foreach (PartProcessInfo ppi in allsource)
                    {
                        if (ppi.ProcessId.Equals(dpl_process.SelectedValue) && ppi.FactStartDate.Ticks == 0 && ppi.NeedProduct == 1)
                        {
                            ppi.Id = 0;
                            ppi.RequireDate = ppi.EndDate;
                            ppi.SendDate = ppi.StartDate;
                            ppi.SerNo = "";
                            //if (ListBox_ModuleList.SelectedValue.Equals(""))
                            //{
                            //    ppi.RequireDate = DateTime.Now.AddMinutes(ppi.ProcessNeedMinutes);
                            //    ppi.SendDate = DateTime.Now;
                            //}
                            source.Add(ppi);
                        }
                    }

                }
            }

            if (source.Count > 1000)
            {
                Label_Message.Text = Translate.translateString("結果數據超出顯示範圍，請增加搜索條件重新搜索");
                return;
            }
            if (source.Count > 0)
            {
                if (source[0] is PartProcessInfo)
                {
                    (source as ArrayList).Sort(new PartProcessInfoProcessOrderCompare());
                }
                if (source[0] is OutSourceDetailInfo)
                {
                    (source as ArrayList).Sort(new OutSourceModuleCompare());
                }
            }

            IList newsource = new ArrayList();
            if (pricetype.Equals(""))
            {
                if (source.Count > 0 && source[0] is PartProcessInfo)
                {
                    foreach (PartProcessInfo ppin in source)
                    {
                        if (!ppin.PriceType.Equals("programe"))
                        {
                            newsource.Add(ppin);
                        }
                    }
                }
                if (source.Count > 0 && source[0] is OutSourceDetailInfo)
                {
                    foreach (OutSourceDetailInfo osin in source)
                    {
                        if (!osin.PriceType.Equals("programe"))
                        {
                            newsource.Add(osin);
                        }
                    }
                }
            }

            dg_OutSourceDetail.DataSource = newsource;
            dg_OutSourceDetail.DataKeyField = keyfield;
            dg_OutSourceDetail.DataBind();


        }

        protected void btn_upload_Click(object sender, EventArgs e)
        {
            Button bts = sender as Button;

            Panel item = bts.Parent as Panel;

            FileUpload fu = item.FindControl("fu") as FileUpload;
            Label lab_path = item.FindControl("lab_path") as Label;
            if (fu.HasFile)
            {
                string fileExt = System.IO.Path.GetExtension(fu.FileName);
                if (fileExt.ToUpper().Equals(".PDF"))
                {
                    string fleUpload = Path.GetExtension(fu.FileName.ToString());
                    string path = lab_path.Text + "/";
                    fu.SaveAs(Server.MapPath(path + fu.FileName.ToString()));
                    Label_Message.Text = "";
                }
                else
                {
                    Label_Message.Text = Translate.translateString("請上傳PDF檔案");
                    return;
                }

            }

            item.Visible = false;
            item.Parent.FindControl("bt_upload").Visible = true;
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            Button bts = sender as Button;


            Panel item = bts.Parent as Panel;
            Label lab_path = item.FindControl("lab_path") as Label;
            string path = lab_path.Text + "/";
            string file = "";
            if (bts.ID.Equals("btn_delete_1"))
            {
                Label lab_file_1 = item.FindControl("lab_file_1") as Label;
                file = lab_file_1.Text.Trim();
                lab_file_1.Text = "";
            }
            else
            {
                Label lab_file_2 = item.FindControl("lab_file_2") as Label;
                file = lab_file_2.Text.Trim();
                lab_file_2.Text = "";
            }

            File.Delete(Server.MapPath(path + file));


            item.Visible = false;
            item.Parent.FindControl("bt_upload").Visible = true;
        }

        private bool checkPartComment()
        {
            string onlyPartComment = "";
            IList alloutPartComments = new OutsourcePartComment().GetOutsourcePartCommentInfos();
            Hashtable honlyPartComment = new Hashtable();
            foreach (OutsourcePartCommentInfo opci in alloutPartComments)
            {
                if (opci.IsOnlyOnce == 1)
                {
                    onlyPartComment = opci.OutsourcePartAbbr;
                }
            }
            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                    if (chk.Checked)
                    {
                        DropDownList dg_drp_PartComment = item.FindControl("dg_drp_PartComment") as DropDownList;
                        Label dg_lab_moduleId = item.FindControl("dg_lab_moduleId") as Label;
                        Label dg_lab_partNoId = item.FindControl("dg_lab_partNoId") as Label;
                        Label dg_lab_serno = item.FindControl("dg_lab_serno") as Label;
                        string key = dg_lab_moduleId.Text.Trim() + "|" + dg_lab_partNoId.Text.Trim();
                        if (dg_drp_PartComment.SelectedValue.Equals(onlyPartComment))
                        {
                            if (honlyPartComment.ContainsKey(key))
                            {
                                return false;
                            }
                            else
                            {
                                IList outsourceDetails = new OutSourceDetail().GetOutSourceDetailInfosByModulePartno("('" + dg_lab_moduleId.Text + "')", "('" + dg_lab_partNoId.Text + "')");
                                foreach (OutSourceDetailInfo osdi in outsourceDetails)
                                {
                                    if (osdi.PartComment != null && osdi.PartComment.Equals(onlyPartComment) && !osdi.OutsourceApplyNo.Equals(txt_outsourceApplyNo.Text) && !osdi.SerNo.Equals(dg_lab_serno.Text))
                                    {
                                        return false;
                                    }
                                }

                                honlyPartComment.Add(key, item);

                            }
                        }



                    }
                }
            }

            return true;
        }


        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {


            OutsourceApplyDesignInfo outsourceApplyDesigninfo = null;
            int outSourceApplyId = 0;


            if (Session["userid"] == null)
            {
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("login.aspx");
                return;
            }

            if (!checkPartComment())
            {
                Label_Message.Text = Translate.translateString("加工方式錯誤，產生重複採購");
                return;
            }

            if (lab_applyid.Text.Trim().Equals(""))
            {
                SheetNo sheetNo = new SheetNo();
                SheetNoInfo si = new SheetNoInfo();
                si.SheetNo = txt_outsourceApplyNo.Text;
                si.SheetType = "OUTSOURCE";
                bool success = sheetNo.insertSheetNo(si);

                //OutsourceApplyDesignInfo oadi = outsourceApplyDesign.GetOutsourceApplyDesignByNo(txt_outsourceApplyNo.Text);
                while (!success)
                {
                    int lastserious = sheetNo.GetMaxSheetNo();
                    txt_outsourceApplyNo.Text = tools.fillString((lastserious + 1).ToString(), 6, '0');
                    si.SheetNo = txt_outsourceApplyNo.Text.Trim();
                    success = sheetNo.insertSheetNo(si);
                }

                OutsourceApplyDesign outsourceApplyDesign = new OutsourceApplyDesign();
                outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                outsourceApplyDesigninfo.OutsourceApplyNo = txt_outsourceApplyNo.Text;

                outsourceApplyDesigninfo.Creater = Session["userid"].ToString();
                outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                outsourceApplyDesigninfo.Comment = txt_comment.Text;
                //outsourceApplyDesigninfo.Status = "CheckWait";


                outSourceApplyId = outsourceApplyDesign.insertOutsourceApplyDesign(outsourceApplyDesigninfo);
                if (outSourceApplyId < 0)
                {
                    Label_Message.Text = Lang.SAVE_FAIL;
                    return;
                }
                else
                {
                    string msg = outsourceApplyDesign.insertCheckSheetProcess(checkprocessName, outsourceApplyDesigninfo.OutsourceApplyNo);
                    if (msg.Equals(Lang.SAVE_FAIL))
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                        return;
                    }
                }

                lab_applyid.Text = outSourceApplyId.ToString();
            }
            else
            {
                outSourceApplyId = Convert.ToInt32(lab_applyid.Text);
            }


            Hashtable hprocessid = (Hashtable)Session["processid"];
            if (hprocessid == null)
                hprocessid = new Hashtable();

            IList details = new ArrayList();
            int lastSerno = outSourceDetail.GetMaxOutsourceDetail(outSourceApplyId);
            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                    Label lab_id = item.FindControl("dg_lab_outsourceid") as Label;
                    int id = 0;
                    if (!lab_id.Text.Equals(""))
                        id = Convert.ToInt32(lab_id.Text);
                    if (chk.Checked || id != 0)
                    {
                        OutSourceDetailInfo odi = new OutSourceDetailInfo();
                        odi.ApplyId = outSourceApplyId;
                        odi.SerNo = tools.fillString((++lastSerno).ToString(), 3, '0');
                        odi.Processno = Convert.ToInt32(dg_OutSourceDetail.DataKeys[item.ItemIndex]);
                        Label dg_lab_moduleId = item.FindControl("dg_lab_moduleId") as Label;
                        odi.ModuleId = dg_lab_moduleId.Text;
                        Label lab_processId = item.FindControl("dg_lab_processId") as Label;
                        odi.ProcessId = lab_processId.Text;
                        Label dg_lab_processName = item.FindControl("dg_lab_processName") as Label;
                        odi.ProcessName = dg_lab_processName.Text;
                        Label lab_partNoId = item.FindControl("dg_lab_partNoId") as Label;
                        odi.PartNo_Id = lab_partNoId.Text;
                        Label lab_processOrder = item.FindControl("dg_lab_processOrder") as Label;
                        odi.ProcessOrder = Convert.ToInt32(lab_processOrder.Text);
                        Label lab_partNo = item.FindControl("dg_lab_partNo") as Label;
                        odi.PartNo = lab_partNo.Text;
                        DropDownList dg_drp_SupplyId = item.FindControl("dg_drp_SupplyId") as DropDownList;
                        if (!dg_drp_SupplyId.SelectedValue.Equals(""))
                        {
                            odi.SupplyId = Convert.ToInt32(dg_drp_SupplyId.SelectedValue);
                        }
                        if (chk.Checked)
                        {
                            try
                            {
                                TextBox txt_requiredDate = item.FindControl("dg_lab_requireDate") as TextBox;
                                odi.RequireDate = Convert.ToDateTime(txt_requiredDate.Text);
                                TextBox txt_sendDate = item.FindControl("dg_lab_sendDate") as TextBox;
                                odi.SendDate = Convert.ToDateTime(txt_sendDate.Text);
                                if (odi.RequireDate.Ticks < odi.SendDate.Ticks)
                                {
                                    Label_Message.Text = Translate.translateString("第") + item.ItemIndex.ToString() + Translate.translateString("入廠日期晚於回廠日期");
                                    return;
                                }
                            }
                            catch
                            {
                                Label_Message.Text = Translate.translateString("第") + item.ItemIndex.ToString() + Translate.translateString("入廠/回廠日期請填寫日期");
                                return;
                            }
                        }

                        DropDownList dg_drp_PartComment = item.FindControl("dg_drp_PartComment") as DropDownList;
                        odi.PartComment = dg_drp_PartComment.SelectedValue;

                        TextBox txt_comment = item.FindControl("dg_lab_comment") as TextBox;
                        odi.Comment = txt_comment.Text;
                        odi.IsOutsource = chk.Checked;
                        odi.Id = id;

                        details.Add(odi);
                        hprocessid.Remove(odi.Processno);
                    }



                }

            }

            foreach (int key in hprocessid.Keys)
            {
                OutSourceDetailInfo odi = (OutSourceDetailInfo)hprocessid[key];
                if (odi.IsOutsource || odi.Id != 0)
                    details.Add(odi);
            }


            Label_Message.Text = outSourceDetail.updateAllPartOutSourceDetail(details);
            clearSession();



            //for set session

            lab_moduleId.Text = ListBox_ModuleList.SelectedValue;

            Response.Redirect("OutSourceView.aspx?menuid=" + menuid + "&moduleid=" + lab_moduleId.Text + "&applyNo=" + txt_outsourceApplyNo.Text.Trim() + "&msg=" + Label_Message.Text);



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

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            int key = getKey();
            if (key == -1)
                Label_Message.Text = Translate.translateString("請選擇外包明細");
            else
            {
                Label_Message.Text = outSourceDetail.deleteOutSourceDetail(key);
                bindOutSourceDetail(ListBox_ModuleList.SelectedValue);

            }
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            clearSession();
            Response.Redirect("OutSourceDetailList.aspx?menuid=" + menuid + "&moduleid=" + ListBox_ModuleList.SelectedValue);
        }

        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("CheckBox_Select");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_OutSourceDetail.DataKeys[item.ItemIndex]);
                        break;
                    }

                }

            }

            return key;
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            BindModule();
            dg_OutSourceDetail.DataSource = new ArrayList();
            dg_OutSourceDetail.DataBind();


            txt_applyDate.Text = "";

        }

        protected void ListBox_ModuleList_SelectedIndexChanged(object sender, EventArgs e)
        {

            BindProcess();
            bindOutSourceDetail(ListBox_ModuleList.SelectedValue);

        }


        protected void dpl_process_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindOutSourceDetail(ListBox_ModuleList.SelectedValue);

        }

        protected void dg_OutSourceDetail_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            if (Label_Message.Text.Equals(""))
            {
                dg_OutSourceDetail.CurrentPageIndex = e.NewPageIndex;
                bindOutSourceDetail(ListBox_ModuleList.SelectedValue);
            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            bindOutSourceDetail(ListBox_ModuleList.SelectedValue);
        }


        protected void lnk_check_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("../login.aspx");
                return;
            }
            string userno = Session["userid"].ToString();
            int outSourceApplyId = Convert.ToInt32(lab_applyid.Text);
            OutsourceApplyDesign outsourceApplyDesign = new OutsourceApplyDesign();
            OutsourceApplyDesignInfo outsourceApplyDesigninfo = outsourceApplyDesign.findbykey(outSourceApplyId);


            CheckStandProcessInfo cpi = new CheckStandProcess().GetCheckStandProcessInfosByProcessid("IOutSource1");

            if (cpi != null)
            {

                IList details = new OutSourceDetail().GetOutSourceByApplyNo(outsourceApplyDesigninfo.OutsourceApplyNo);
                string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["ERPInterface"];
                if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
                {
                    ModuleWorkFlow.BLL.BomDetail bomdetail = new ModuleWorkFlow.BLL.BomDetail();
                    Hashtable hmodule = new Hashtable();
                    foreach (OutSourceDetailInfo odi in details)
                    {
                        if (!hmodule.ContainsKey(odi.ModuleId))
                        {
                            hmodule.Add(odi.ModuleId, odi);
                        }
                    }

                    SystemInterFaceInfo bomsysinterface = new SystemInterFace().GetSystemInterFaceInfosByName("bom");

                    InterFaceSchema schema = new InterFaceSchema();
                    foreach (string key in hmodule.Keys)
                    {
                        IList schedmadetails = schema.GetInterfaceSchema(bomsysinterface, " where IsPass=1 and mm_MoldPN='" + key + "'");
                        IList updateDetails = getLastVersion(schedmadetails, userno);

                        IOutsourceApplyDesignInfo updateOutsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                        outsourceApplyDesigninfo.Creater = userno;
                        outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                        Object[] args = new Object[4];
                        ArrayList argsdetails = new ArrayList();
                        argsdetails.AddRange(updateDetails);
                        args[0] = argsdetails;
                        args[1] = null;
                        args[2] = new OutSourceDetail();
                        args[3] = updateOutsourceApplyDesigninfo;
                        SystemInterFace sysInterface = new SystemInterFace();

                        sysInterface.updateToAmd(updateDetails, "bom", bomsysinterface.SourceConnectStr, args);
                    }

                    foreach (OutSourceDetailInfo odi in details)
                    {
                        ModuleWorkFlow.Model.BomDetailInfo bdi = bomdetail.GetBomDetailByNoPartNo(odi.ModuleId, odi.PartNo);
                        if (bdi == null)
                        {
                            BomApplyDetailInfo badi = new BomApplyDetail().GetBomApplyDetailInfoByModuleId(odi.ModuleId, odi.PartNo);
                            if (badi != null && badi.BeCombinedDetails != null && badi.BeCombinedDetails.Count > 0)
                            {
                                BomApplyDetailInfo combineInfo = badi.BeCombinedDetails[0] as BomApplyDetailInfo;
                                bdi = bomdetail.GetBomDetailByNoPartNo(combineInfo.ModuleId, combineInfo.PartNo);
                            }
                        }
                        if (bdi != null)
                        {
                            odi.PartName = bdi.PartName;
                            if (bdi.MaterialUsedWay == null || bdi.MaterialUsedWay.Trim().Equals(""))
                            {
                                Label_Message.Text = Translate.translateString("非標料號沒有輸入，請重新匯入");
                                return;
                            }
                            else
                            {
                                odi.Materialer = bdi.MaterialUsedWay;
                            }

                        }
                    }
                }

                string msg = outsourceApplyDesign.insertCheckSheetProcess(checkprocessName, outsourceApplyDesigninfo.OutsourceApplyNo);
                if (msg.Equals(Lang.SAVE_FAIL))
                {
                    Label_Message.Text = Lang.SAVE_FAIL;
                    return;
                }
                Hashtable hInfo = new Hashtable();
                hInfo["outsource"] = outsourceApplyDesigninfo;
                string url = Request.Url.ToString();
                string applyno = outsourceApplyDesigninfo.OutsourceApplyNo;
                outsourceApplyDesigninfo.OutsourceApplyNo = "<a href='" + url.Substring(0, url.ToLower().IndexOf("outsource")) + "Login.aspx?ReturnUrl=outsource/SheetCheckOperationDay.aspx" + "'>" + txt_outsourceApplyNo.Text + "</a>";
                hInfo["outsourcedetails"] = details;
                IList AlertReportInfos = new ArrayList();
                AlertReportInfos.Add(hInfo);
                SendAlert sa = new SendAlert();





                if (cpi.Checkerlist != null && !cpi.Checkerlist.Equals("") && !txt_outsourceApplyNo.Text.Trim().Equals(""))
                {
                    IList emailRcpts = new ArrayList();
                    string[] usernames = cpi.Checkerlist.Split(',');
                    for (int i = 0; i < usernames.Length; i++)
                    {
                        UserInfo ui = new User().getUserInfo(usernames[i]);
                        emailRcpts.Add(ui.Email);
                    }


                    ArrayList allFiles = new ArrayList();
                    foreach (OutSourceDetailInfo detailInfo in details)
                    {
                        string attachpath = "~/uploadfiles/" + txt_outsourceApplyNo.Text.Trim() + detailInfo.SerNo;

                        if (Directory.Exists(Server.MapPath(attachpath)))
                        {
                            allFiles.AddRange(System.IO.Directory.GetFiles(Server.MapPath(attachpath), "*", SearchOption.AllDirectories));
                        }
                    }

                    string[] attachefiles = (string[])allFiles.ToArray(typeof(string));
                    msg = sa.sendAlert("OutSourceNotice", AlertReportInfos, Translate.translateString("外包審核，審核單號：") + applyno, emailRcpts, attachefiles);
                    OutsourceApplyDesign outsource = new OutsourceApplyDesign();
                    OutsourceApplyDesignInfo odi = outsource.GetOutsourceApplyDesignByNo(txt_outsourceApplyNo.Text.Trim());
                    odi.Status = "CheckWait";

                    outsource.updateOutsourceApplyDesign(odi);
                    clearSession();
                    Response.Redirect("OutSourceDetailList.aspx?menuid=" + menuid + "&moduleid=" + ListBox_ModuleList.SelectedValue);

                }
                else
                {
                    msg = Translate.translateString("請設定外包核準人員");
                }


                Label_Message.Text = msg;
            }
        }

        private IList getLastVersion(IList details, string userno)
        {
            IList updateDetails = new ArrayList();
            Hashtable hdetails = new Hashtable();
            foreach (BomDetailInfo bdi in details)
            {
                string key = bdi.ModelId + "|" + bdi.PartNo;
                if (hdetails.ContainsKey(key))
                {
                    continue;
                }

                bdi.Changer = userno;
                bdi.ChangedDate = DateTime.Now;
                updateDetails.Add(bdi);
                hdetails.Add(key, bdi);
            }
            return updateDetails;

        }

        protected void dg_OutSourceDetail_ItemDataBound(object sender, DataGridItemEventArgs e)
        {

            MerchindiseDetail merchindisedetial = new MerchindiseDetail();
            ModuleWorkFlow.BLL.PartProcess partprocess = new ModuleWorkFlow.BLL.PartProcess();
            Hashtable hprocessid = (Hashtable)Session["processid"];
            if (hprocessid == null)
                hprocessid = new Hashtable();
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label dg_lab_moduleId = e.Item.FindControl("dg_lab_moduleId") as Label;
                Label dg_lab_partNoId = e.Item.FindControl("dg_lab_partNoId") as Label;
                DropDownList dg_drp_SupplyId = e.Item.FindControl("dg_drp_SupplyId") as DropDownList;
                dg_drp_SupplyId.DataSource = new ModuleWorkFlow.BLL.System.Supply().GetSupplyInfos();
                dg_drp_SupplyId.DataTextField = "SupplierId";
                dg_drp_SupplyId.DataValueField = "Id";
                dg_drp_SupplyId.DataBind();

                DropDownList dg_drp_PartComment = e.Item.FindControl("dg_drp_PartComment") as DropDownList;
                if (lab_applyid.Text.Trim().Equals(""))
                {
                    dg_drp_PartComment.DataSource = new ModuleWorkFlow.BLL.System.OutsourcePartComment().GetOutsourcePartCommentNoOnlyOnce(dg_lab_moduleId.Text.Trim(), dg_lab_partNoId.Text.Trim());
                }
                else
                {
                    dg_drp_PartComment.DataSource = new ModuleWorkFlow.BLL.System.OutsourcePartComment().GetOutsourcePartCommentInfos();
                }
                dg_drp_PartComment.DataTextField = "OutsourcePartComment";
                dg_drp_PartComment.DataValueField = "OutsourcePartAbbr";
                dg_drp_PartComment.DataBind();
                if (dg_drp_PartComment.Items.Count == 0)
                {
                    dg_drp_PartComment.Items.Insert(0, new ListItem("", ""));
                }
                Label dg_lab_PartComment = e.Item.FindControl("dg_lab_PartComment") as Label;
                if (dg_lab_PartComment.Text.Trim().Equals(""))
                {
                    dg_drp_PartComment.SelectedValue = "M";
                }
                else
                {
                    dg_drp_PartComment.SelectedValue = dg_lab_PartComment.Text;
                }


                TextBox txt_requireDate = e.Item.FindControl("dg_lab_requireDate") as TextBox;
                TextBox txt_sendDate = e.Item.FindControl("dg_lab_sendDate") as TextBox;
                CalendarExtender ce = e.Item.FindControl("cal_enddate") as CalendarExtender;
                TextBox txt_Recommand = e.Item.FindControl("dg_lab_comment") as TextBox;
                Label lab_outsourceid = e.Item.FindControl("dg_lab_outsourceid") as Label;
                CheckBox chk = e.Item.FindControl("CheckBox_Select") as CheckBox;
                Label dg_lab_SupplyId = e.Item.FindControl("dg_lab_SupplyId") as Label;
                int id = 0;
                if (!lab_outsourceid.Text.Equals(""))
                    id = Convert.ToInt32(lab_outsourceid.Text);
                if (id != 0)
                {
                    chk.Checked = true;
                }
                int processno = Convert.ToInt32(dg_OutSourceDetail.DataKeys[e.Item.ItemIndex]);
                if (hprocessid.ContainsKey(processno))
                {


                    chk.Checked = Convert.ToBoolean(((OutSourceDetailInfo)hprocessid[processno]).IsOutsource);
                    txt_requireDate.Text = ((OutSourceDetailInfo)hprocessid[processno]).RequireDate.ToShortDateString();
                    txt_sendDate.Text = ((OutSourceDetailInfo)hprocessid[processno]).SendDate.ToShortDateString();
                    txt_Recommand.Text = ((OutSourceDetailInfo)hprocessid[processno]).Comment;

                    dg_lab_SupplyId.Text = ((OutSourceDetailInfo)hprocessid[processno]).SupplyId.ToString();

                    if (id != 0)
                    {
                        chk.Checked = true;
                        OutSourceDetailInfo odi = outSourceDetail.findbykey(id);

                        if ((merchindisedetial.GetMerchindiseDetailByOutsourceId(id).Count > 0) || ((odi != null && odi.Status != null && odi.Status.Equals("CHECK_PASS"))))
                        {
                            chk.Enabled = false;
                            txt_requireDate.ReadOnly = true;
                            txt_sendDate.ReadOnly = true;
                            txt_Recommand.ReadOnly = true;
                            ce.Enabled = false;
                        }
                        PartProcessInfo ppi = partprocess.getPartProcessInfo(processno);
                        if (ppi != null && ppi.FactStartDate.Ticks > 0)
                        {
                            chk.Enabled = false;
                            txt_requireDate.ReadOnly = true;
                            txt_Recommand.ReadOnly = true;
                            ce.Enabled = false;
                        }

                    }
                }



                if (txt_requireDate.Text.IndexOf("0001") >-1 )
                    txt_requireDate.Text = "";

                if (txt_sendDate.Text.IndexOf("0001") > -1)
                    txt_sendDate.Text = "";





                if (!dg_lab_SupplyId.Text.Trim().Equals(""))
                {
                    dg_drp_SupplyId.SelectedValue = dg_lab_SupplyId.Text;
                }

                Label dg_lab_serno = e.Item.FindControl("dg_lab_serno") as Label;

                Button bt_upload = e.Item.FindControl("bt_upload") as Button;
                if (dg_lab_serno.Text.Trim().Equals(""))
                {

                    bt_upload.Visible = false;
                }
                else
                {

                    bt_upload.Visible = true;
                }

            }
        }

        protected void txt_moduleId_TextChanged(object sender, EventArgs e)
        {
            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                try
                {
                    ListBox_ModuleList.SelectedValue = txt_moduleId.Text.Trim();
                    if (dpl_process.SelectedValue.Equals(""))
                    {
                        ListBox_ModuleList_SelectedIndexChanged(sender, e);
                    }
                }
                catch
                {
                    Label_Message.Text = Translate.translateString("請輸入正確的模具編號");
                    dg_OutSourceDetail.DataSource = new ArrayList();
                    dg_OutSourceDetail.DataBind();

                    dpl_process.DataSource = new ArrayList();
                    dpl_process.DataBind();
                    return;
                }
            }
            bindOutSourceDetail(ListBox_ModuleList.SelectedValue);
            Label_Message.Text = "";
        }

        protected void txt_sendDate_TextChanged(object sender, EventArgs e)
        {
            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                    if (chk.Checked)
                    {
                        TextBox dg_lab_sendDate = item.FindControl("dg_lab_sendDate") as TextBox;
                        dg_lab_sendDate.Text = txt_sendDate.Text;
                    }
                }
            }

        }

        protected void txt_applyDate_TextChanged(object sender, EventArgs e)
        {

            foreach (DataGridItem item in dg_OutSourceDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox chk = item.FindControl("CheckBox_Select") as CheckBox;
                    if (chk.Checked)
                    {
                        TextBox dg_lab_requireDate = item.FindControl("dg_lab_requireDate") as TextBox;
                        dg_lab_requireDate.Text = txt_applyDate.Text;
                    }
                }
            }

        }

        protected void dg_OutSourceDetail_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            Button bts = e.CommandSource as Button;


            if (e.CommandName.ToLower() != "upload")
            {
                return;
            }
            DataGridItem item = bts.Parent.Parent as DataGridItem;

            Label dg_lab_serno = item.FindControl("dg_lab_serno") as Label;
            Panel dg_panel = item.FindControl("dg_panel") as Panel;
            Label lab_path = dg_panel.FindControl("lab_path") as Label;
            Label lab_file_1 = dg_panel.FindControl("lab_file_1") as Label;
            Label lab_file_2 = dg_panel.FindControl("lab_file_2") as Label;
            Button btn_delete_1 = dg_panel.FindControl("btn_delete_1") as Button;
            Button btn_delete_2 = dg_panel.FindControl("btn_delete_2") as Button;
            lab_path.Text = "~/uploadfiles/" + txt_outsourceApplyNo.Text.Trim() + dg_lab_serno.Text.Trim();
            dg_panel.Visible = true;
            bts.Visible = false;
            bool folderExists = System.IO.Directory.Exists(Server.MapPath(lab_path.Text));

            if (!folderExists)
            {
                Directory.CreateDirectory(Server.MapPath(lab_path.Text));
            }




            string[] fileName = Directory.GetFiles(Server.MapPath(lab_path.Text));


            if (fileName.Length == 0)
            {
                btn_delete_1.Visible = false;
                btn_delete_2.Visible = false;
            }

            if (fileName.Length == 1)
            {
                lab_file_1.Text = fileName[0].Substring(fileName[0].LastIndexOf("\\") + 1);
                btn_delete_2.Visible = false;
                btn_delete_1.Visible = true;
            }

            if (fileName.Length == 2)
            {
                lab_file_1.Text = fileName[0].Substring(fileName[0].LastIndexOf("\\") + 1);
                lab_file_2.Text = fileName[1].Substring(fileName[0].LastIndexOf("\\") + 1);
                btn_delete_1.Visible = true;
                btn_delete_2.Visible = true;
            }


            //ClientScriptManager.RegisterStartupScript(this.GetType(), "AKey", "MyFunction();", true);


            //if (fleUpload.Trim().ToLower() == ".xls" | fleUpload.Trim().ToLower() == ".xlsx")
            //{
            //    fu.SaveAs(Server.MapPath("~/UpLoadPath/" + fu.FileName.ToString()));
            //    string uploadedFile = (Server.MapPath("~/UpLoadPath/" + fu.FileName.ToString()));
            //    //Someting to do?...
            //}
            //else
            //{
            //    upload = false;
            //    // Something to do?...
            //}
            //if (upload)
            //{
            //    // somthing to do?...
            //}

        }





    }
}