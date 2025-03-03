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
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;


using ModuleWorkFlow.BLL.Report;
using ModuleWorkFlow.IDAL.Report;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.Config;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkflow.OutSource.BLL.Interface;
namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class BomDetailListCopy : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        private ModuleWorkFlow.BLL.PartBomDetail bomDetail;
        private ModuleWorkFlow.BLL.BomDesign bomDesign;
        protected ModuleWorkFlow.BLL.Inventory.ProductMaterialInventory promatl;
        protected ModuleWorkFlow.Model.Inventory.ProductMaterialInventoryInfo promatlinfo;
        private string menuid = "F11";
        protected System.Web.UI.WebControls.Label lab_print;
        protected Label lab_User;
        protected System.Web.UI.WebControls.DataGrid dg_BomDetail;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Button btn_search;
        protected System.Web.UI.WebControls.TextBox txt_moduleId;
        protected System.Web.UI.WebControls.DropDownList dpl_moduleId;
        protected System.Web.UI.WebControls.Label lab_moduleId;
        protected System.Web.UI.WebControls.DataGrid Datagrid_print;
        protected System.Web.UI.WebControls.TextBox txt_delete_moduleId;
        protected System.Web.UI.WebControls.DropDownList dpl_productTypeId;
        protected System.Web.UI.WebControls.DropDownList dpl_ismodify;

        protected System.Web.UI.WebControls.DropDownList dpl_Customer;
        protected System.Web.UI.WebControls.DropDownList dpl_customerModuleId;

        protected System.Web.UI.WebControls.Label lab_productname;
        protected System.Web.UI.WebControls.TextBox txt_productname;

        protected LinkButton lnkbutton_print;
        protected LinkButton lnkbutton_delete;
        protected LinkButton lnkbutton_delete_detail;
        protected DropDownList dpl_NeedMerchindised;
        protected Label lab_model;
        protected DropDownList dpl_model;
        protected System.Web.UI.WebControls.TextBox txt_from;
        protected System.Web.UI.WebControls.TextBox txt_to;
        protected System.Web.UI.WebControls.TextBox Text_PartNo;
        protected System.Web.UI.WebControls.Label lab_bomstyle;

        protected string menuname;


        private void Page_Load(object sender, System.EventArgs e)
        {
            TmenuInfo mi = new Tmenu().findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
               
            }

            bomDesign = new BomDesign();
            bomDetail = new ModuleWorkFlow.BLL.PartBomDetail();
            if (Session["userid"] != null)
            {
                lab_User.Text = Session["userid"].ToString();
            }
            string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["PDMInterface"];
            if (ERPInterface == null || !Convert.ToBoolean(ERPInterface.Trim()))
            {
                menuid = "F11";
            }


            int mcolumn = dg_BomDetail.Columns.Count;

            if (new SysConfig().findbykey("ProductMaterialCode") == null)
            {
                dg_BomDetail.Columns[mcolumn - 4].Visible = false;
                dg_BomDetail.Columns[mcolumn - 3].Visible = false;
            }
            else
            {
                dg_BomDetail.Columns[mcolumn - 4].Visible = true;
                dg_BomDetail.Columns[mcolumn - 3].Visible = true;
            }


            IList list = new ControlTable().getControlTableByTableNameByIsVisible("tb_order", 0);
            lab_productname.Visible = false;
            txt_productname.Visible = false;
            foreach (ModuleWorkFlow.Model.ControlTableInfo cti in list)
            {
                if (cti.TableField.Equals("productname"))
                {
                    lab_productname.Visible = true;
                    txt_productname.Visible = true;
                    lab_productname.Text = cti.TableValue;
                }

            }




            if (!this.IsPostBack)
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    BindNeedMerchindised();
                    PartType parttype = new PartType();
                    IList parttypes = parttype.GetPartTypeByName("EDM");
                    lnkbutton_print.Visible = false;
                    if (parttypes.Count > 0)
                    {
                        PartTypeInfo pti = parttypes[0] as PartTypeInfo;
                        if (pti.PartnoCreate != null && !pti.PartnoCreate.Trim().Equals(""))
                        {
                            lnkbutton_print.Visible = true;
                        }
                    }
                    ControlTable ct = new ControlTable();
                    ControlTableInfo cti = ct.GetTableByField("tb_order", "modelType");
                    if (cti != null && cti.NewModuleShow == 1)
                    {
                        lab_model.Visible = true;
                        dpl_model.Visible = true;
                    }
                    else
                    {
                        lab_model.Visible = false;
                        dpl_model.Visible = false;
                    }

                    binddpl();
                    bindModelType();
                    string moduleid = Request.Params["moduleid"];
                    if (moduleid != null)
                    {
                        dpl_moduleId.SelectedValue = moduleid;
                    }
                    else
                    {
                        dpl_moduleId.SelectedIndex = 0;
                    }
                    bingBomDesign();

                    if (Request.Params["StyleCustomer"] != null && !Request.Params["StyleCustomer"].Equals(""))
                    {
                        lab_bomstyle.Text = Request.Params["StyleCustomer"];
                    }
                    else
                    {
                        lab_bomstyle.Text = "public";
                    }
                }
            }
            //bindUserInfo();

        }

        //private void bindUserInfo()
        //{
        //    UserInfo ui = new UserInfo();

        //    dpl_Costumer.DataSource = ui.UserName;
        //}

        public void bindModelType()
        {
            ModelType modelType = new ModelType();
            dpl_model.DataSource = modelType.getModelTypeInfo();
            dpl_model.DataTextField = "TypeName";
            dpl_model.DataValueField = "TypeId";
            dpl_model.DataBind();
            dpl_model.Items.Insert(0, new ListItem("所有類型", "0"));

        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            BindCustomer();
            BindCustomerModuleId();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dpl_moduleId.SelectedIndexChanged += new System.EventHandler(this.dpl_moduleId_SelectedIndexChanged);
            this.btn_search.Click += new System.EventHandler(this.btn_search_Click);
            this.dg_BomDetail.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_BomDetail_PageIndexChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void BindCustomer()
        {
            ModuleWorkFlow.BLL.Customer customer = new ModuleWorkFlow.BLL.Customer();
            IList details = customer.GetCustomer();
            dpl_Customer.DataSource = details;
            dpl_Customer.DataTextField = "ChineseName";
            dpl_Customer.DataValueField = "Id";
            dpl_Customer.DataBind();
            dpl_Customer.Items.Insert(0, "");
            if (Request.Params["customerid"] != null)
                dpl_Customer.SelectedValue = Request.Params["customerid"];

        }
        public void dpl_Costumer_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            BindCustomerModuleId();
        }

        private void BindCustomerModuleId()
        {
            IList list = new ArrayList();
            ModuleWorkFlow.BLL.System.Model model = new ModuleWorkFlow.BLL.System.Model();

            if (dpl_Customer.SelectedValue.Equals(""))
            {
                list = model.GetModelInfos();
            }
            else
            {
                list = model.GetModelByCustomerId(Convert.ToInt32(dpl_Customer.SelectedValue));
            }

            dpl_customerModuleId.DataSource = list;

            dpl_customerModuleId.DataTextField = "MoldName";
            dpl_customerModuleId.DataValueField = "Id";
            dpl_customerModuleId.DataBind();
            dpl_customerModuleId.Items.Insert(0, "");

            if (Request.Params["customermoduleid"] != null)
            {
                dpl_customerModuleId.SelectedValue = Request.Params["customermoduleid"];
            }

        }

        private void bingBomDesign()
        {
            BOMStyle bomStype = new BOMStyle();
            BOMStyleInfo bsi = null;
            foreach (DataGridColumn dc in dg_BomDetail.Columns)
            {
                TemplateColumn tc = dc as TemplateColumn;
                if (tc == null)
                    continue;
                if (tc.HeaderText.Equals("Request"))
                {
                    bsi = bomStype.GetBOMStyleNewInfos("Request");
                    if (bsi == null || bsi.RowNo < 0)
                    {
                        dc.Visible = false;
                    }
                    else
                    {
                        dc.Visible = true;
                    }
                }

                if (tc.HeaderText.Equals("weight"))
                {
                    bsi = bomStype.GetBOMStyleNewInfos("weight");
                    if (bsi == null || bsi.RowNo < 0)
                    {
                        dc.Visible = false;
                    }
                    else
                    {
                        dc.Visible = true;
                    }
                }

                if (tc.HeaderText.Equals("requiredDate"))
                {
                    bsi = bomStype.GetBOMStyleNewInfos("requiredDate");
                    if (bsi == null || bsi.RowNo < 0)
                    {
                        dc.Visible = false;
                    }
                    else
                    {
                        dc.Visible = true;
                    }
                }

                if (tc.HeaderText.Equals("refSupplyId"))
                {
                    bsi = bomStype.GetBOMStyleNewInfos("refSupplyId");
                    if (bsi == null || bsi.RowNo < 0)
                    {
                        dc.Visible = false;
                    }
                    else
                    {
                        dc.Visible = true;
                    }
                }

                if (tc.HeaderText.Equals("supplyId"))
                {
                    bsi = bomStype.GetBOMStyleNewInfos("supplyId");
                    if (bsi == null || bsi.RowNo < 0)
                    {
                        dc.Visible = false;
                    }
                    else
                    {
                        dc.Visible = true;
                    }
                }
            }


            string customernid = "";
            if (dpl_Customer.SelectedValue.Trim().Equals("") || dpl_Customer.SelectedValue.Trim().Equals("所有"))
            {
                customernid = "0";
            }
            else
            {
                customernid = dpl_Customer.SelectedValue.Trim();
            }

            int ModelId = 0;
            if (dpl_customerModuleId.SelectedValue.Trim().Equals("") || dpl_customerModuleId.SelectedValue.Trim().Equals("所有"))
            {
                ModelId = 0;
            }
            else
            {
                ModelId = Convert.ToInt32(dpl_customerModuleId.SelectedValue.Trim());
            }


            if (txt_moduleId.Text.Trim().Equals(""))
            {
                dg_BomDetail.DataSource = bomDetail.GetBomDesignDetailByModuleId(dpl_moduleId.SelectedValue, Convert.ToInt32(dpl_NeedMerchindised.SelectedValue), Convert.ToInt32(dpl_model.SelectedValue), customernid, ModelId, txt_productname.Text.Trim(), "", new DateTime(), new DateTime());
            }
            else
            {
                dg_BomDetail.DataSource = bomDetail.GetBomDesignDetailByModuleId(txt_moduleId.Text.Trim(), Convert.ToInt32(dpl_NeedMerchindised.SelectedValue), Convert.ToInt32(dpl_model.SelectedValue), customernid, ModelId, txt_productname.Text.Trim(), "", new DateTime(), new DateTime());
            }
            dg_BomDetail.DataKeyField = "Id";
            dg_BomDetail.DataBind();


        }

        private void bingBomDesign(string moduleId, DateTime startdate, DateTime enddate)
        {
            string customernid = "";
            if (dpl_Customer.SelectedValue.Trim().Equals("") || dpl_Customer.SelectedValue.Trim().Equals("所有"))
            {
                customernid = "0";
            }
            else
            {
                customernid = dpl_Customer.SelectedValue.Trim();
            }

            int ModelId = 0;
            if (dpl_customerModuleId.SelectedValue.Trim().Equals("") || dpl_customerModuleId.SelectedValue.Trim().Equals("所有"))
            {
                ModelId = 0;
            }
            else
            {
                ModelId = Convert.ToInt32(dpl_customerModuleId.SelectedValue.Trim());
            }

            dg_BomDetail.DataSource = bomDetail.GetBomDesignDetailByModuleId(moduleId, Convert.ToInt32(dpl_NeedMerchindised.SelectedValue), Convert.ToInt32(dpl_model.SelectedValue), customernid, ModelId, txt_productname.Text.Trim(), Text_PartNo.Text.Trim(), startdate, enddate);
            dg_BomDetail.DataKeyField = "Id";
            dg_BomDetail.DataBind();
        }

        private void BindNeedMerchindised()
        {

            dpl_NeedMerchindised.Items.Add(new ListItem("全部", "-1"));
            dpl_NeedMerchindised.Items.Add(new ListItem("未處理", "0"));
            dpl_NeedMerchindised.Items.Add(new ListItem("已備料", "1"));
            dpl_NeedMerchindised.Items.Add(new ListItem("已審購", "2"));
            dpl_NeedMerchindised.Items.Add(new ListItem("已就緒", "10"));
            dpl_NeedMerchindised.DataBind();
        }

        private void binddpl()
        {
            bomDesign = new BomDesign();
            dpl_moduleId.DataTextField = "moduleId";
            dpl_moduleId.DataValueField = "moduleId";
            dpl_moduleId.DataSource = bomDesign.GetBomDesignInfos();
            dpl_moduleId.DataBind();
            dpl_moduleId.Items.Insert(0, "");


        }

        private void bingDatagrid_print()
        {
            bomDesign = new BomDesign();
            Datagrid_print.DataSource = bomDesign.GetBomDesignInfos();
            Datagrid_print.DataKeyField = "Id";
            Datagrid_print.DataBind();
        }

        protected void dg_BomDetail_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_BomDetail.CurrentPageIndex = e.NewPageIndex;

            DateTime startdate = new DateTime();
            DateTime enddate = new DateTime();
            if (!txt_from.Text.Equals(""))
            {
                try
                {
                    startdate = Convert.ToDateTime(txt_from.Text);
                }
                catch
                {
                    Label_Message.Text = "請設定正確的日期格式";
                    return;
                }

            }

            if (!txt_to.Text.Equals(""))
            {
                try
                {
                    enddate = Convert.ToDateTime(txt_to.Text);
                }
                catch
                {
                    Label_Message.Text = "請設定正確的日期格式";
                    return;
                }

            }

            if (startdate.Ticks != 0 && enddate.Ticks != 0 && startdate.Ticks > enddate.Ticks)
            {
                Label_Message.Text = "結束日期不能小於開始日期";
                return;
            }

            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                bingBomDesign(txt_moduleId.Text.Trim(), startdate, enddate);
                try
                {
                    dpl_moduleId.SelectedValue = txt_moduleId.Text;
                }
                catch
                {

                }
            }
            else
            {
                bingBomDesign(dpl_moduleId.SelectedValue.Trim(), startdate, enddate);
            }

        }

      

        protected void dg_BomDetail_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            ModuleWorkFlow.BLL.System.Supply supply = new ModuleWorkFlow.BLL.System.Supply();
            ModuleWorkFlow.Model.System.SupplyInfo si = null;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label dg_lab_moduleId = e.Item.FindControl("dg_lab_moduleId") as Label;
                Label dg_lab_PartNo = e.Item.FindControl("dg_lab_PartNo") as Label;
                Label dg_lab_Request = e.Item.FindControl("dg_lab_Request") as Label;
                Label dg_lab_Comment = e.Item.FindControl("dg_lab_Comment") as Label;
                BomDetailInfo bdi = new BomDetail().GetBomDetailByNoPartNo(dg_lab_moduleId.Text.Trim(), dg_lab_PartNo.Text.Trim());
                if (bdi != null)
                {
                    dg_lab_Request.Text = bdi.Request;
                    dg_lab_Comment.Text = bdi.Comment;
                }

                Label dg_lab_BomApplyStatus = e.Item.FindControl("dg_lab_BomApplyStatus") as Label;
                if (!dg_lab_BomApplyStatus.Text.Equals("未處理"))
                {
                    CheckBox chk_datagrid = e.Item.FindControl("chk_datagrid") as CheckBox;
                    chk_datagrid.Enabled = false;
                }

                Label dg_lab_RefSuppply = e.Item.FindControl("dg_lab_RefSuppply") as Label;
                if (!dg_lab_RefSuppply.Text.Trim().Equals(""))
                {
                    si = supply.findbykey(Convert.ToInt32(dg_lab_RefSuppply.Text.Trim()));
                    if (si != null)
                    {
                        dg_lab_RefSuppply.Text = si.SupplierName;
                    }
                    else
                    {
                        dg_lab_RefSuppply.Text = "";
                    }
                }
                else
                {
                    dg_lab_RefSuppply.Text = "";
                }

                Label dg_lab_Suppply = e.Item.FindControl("dg_lab_Suppply") as Label;
                if (!dg_lab_Suppply.Text.Trim().Equals(""))
                {
                    si = supply.findbykey(Convert.ToInt32(dg_lab_Suppply.Text.Trim()));
                    if (si != null)
                    {
                        dg_lab_Suppply.Text = si.SupplierName;
                    }
                    else
                    {
                        dg_lab_Suppply.Text = "";
                    }
                }
                else
                {
                    dg_lab_Suppply.Text = "";
                }

                Label dg_lab_CreatedDate = e.Item.FindControl("dg_lab_CreatedDate") as Label;
                if (dg_lab_CreatedDate.Text.Equals("01-01-01"))
                {
                    dg_lab_CreatedDate.Text = "";
                }

                Label dg_lab_ChangedDate = e.Item.FindControl("dg_lab_ChangedDate") as Label;
                if (dg_lab_ChangedDate.Text.Equals("01-01-01"))
                {
                    dg_lab_ChangedDate.Text = "";
                }

                Label dg_lab_OrderStatus = e.Item.FindControl("dg_lab_OrderStatus") as Label;

                Button pushButton = e.Item.Cells[e.Item.Cells.Count - 1].Controls[0] as Button;

                if (pushButton != null && dg_lab_OrderStatus.Text.Equals("Ready"))
                {
                    pushButton.Enabled = false;
                }
            }

            if (e.Item.ItemType == ListItemType.Header)
            {
                BOMStyleInfo bsi = new BOMStyle().GetBOMStyleNewInfos("Request");
                if (bsi != null && bsi.RowNo > 0)
                {
                    Label dg_haeder_Request = e.Item.FindControl("dg_haeder_Request") as Label;
                    dg_haeder_Request.Text = bsi.RowNameCh;
                }
            }

         
        }










        private void dpl_moduleId_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            dg_BomDetail.CurrentPageIndex = 0;
            bingBomDesign(dpl_moduleId.SelectedValue.Trim(), new DateTime(), new DateTime());
        }

        private void btn_search_Click(object sender, System.EventArgs e)
        {
            dg_BomDetail.CurrentPageIndex = 0;
            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                bingBomDesign(txt_moduleId.Text.Trim(), new DateTime(), new DateTime());
            }
            else
            {
                bingBomDesign(dpl_moduleId.SelectedValue.Trim(), new DateTime(), new DateTime());
            }
        }

        private int getChkedItemKey()
        {
            int keyvalue = -1;
            foreach (DataGridItem item in dg_BomDetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        keyvalue = Convert.ToInt32(dg_BomDetail.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }

            return keyvalue;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                try
                {

                    dpl_moduleId.SelectedValue = txt_moduleId.Text.Trim();
                }
                catch (Exception ex)
                {
                    //int test = 0;
                }
            }

            string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["PDMInterface"];
            if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
            {
                string url = "interface/BomeDetailInterfaceView.aspx?func=Edit";
                Response.Redirect(url);
            }

            if (!dpl_moduleId.SelectedValue.Equals(""))
            {
                string url = "BomDetailViewExcel.aspx?menuid=" + menuid + "&func=edit&moduleid=" + dpl_moduleId.SelectedValue;

                Response.Redirect(url);
            }
            else
            {
                Label_Message.Text = "請選擇模具";
                return;
            }

        }

        protected void lnkbutton_editinput_Click(object sender, EventArgs e)
        {
            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                try
                {

                    dpl_moduleId.SelectedValue = txt_moduleId.Text.Trim();
                }
                catch (Exception ex)
                {
                    //int test = 0;
                }
            }



            if (!dpl_moduleId.SelectedValue.Equals(""))
            {
                string url = "BomDetailViewExcel.aspx?menuid=" + menuid + "&func=edit&moduleid=" + dpl_moduleId.SelectedValue + "&StyleCustomer=" + lab_bomstyle.Text.Trim();

                Response.Redirect(url);
            }
            else
            {
                Label_Message.Text = "請選擇模具";
                return;
            }

        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            string url = "BomDetailViewExcel.aspx";
            string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["PDMInterface"];
            if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
            {
                url = "interface/BomeDetailInterfaceView.aspx";
            }

            Response.Redirect(url);


        }

        protected void lnkbutton_addinput_Click(object sender, EventArgs e)
        {
            string url = "BomDetailViewExcel.aspx?menuid=" + menuid + "&StyleCustomer=" + lab_bomstyle.Text.Trim();
            Response.Redirect(url);


        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                string moduleid = txt_delete_moduleId.Text.Trim();
                if (moduleid.Equals(""))
                {
                    Label_Message.Text = "請輸入模具編號";
                    return;
                }
                BomDesignInfo bdi = new BomDesign().GetBomDesignByModuleid(moduleid);

                if (bdi == null)
                    Label_Message.Text = "此模具編號不存在";
                else
                {
                    Label_Message.Text = bomDesign.deleteBomDesign(bdi.Id, lab_User.Text, new SendAlert(), new OutSourceDetail());
                    binddpl();
                    bingBomDesign();
                }
            }

        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            dg_BomDetail.CurrentPageIndex = 0;
            DateTime startdate = new DateTime();
            DateTime enddate = new DateTime();
            if (!txt_from.Text.Equals(""))
            {
                try
                {
                    startdate = Convert.ToDateTime(txt_from.Text);
                }
                catch
                {
                    Label_Message.Text = "請設定正確的日期格式";
                    return;
                }

            }

            if (!txt_to.Text.Equals(""))
            {
                try
                {
                    enddate = Convert.ToDateTime(txt_to.Text);
                }
                catch
                {
                    Label_Message.Text = "請設定正確的日期格式";
                    return;
                }

            }

            if (startdate.Ticks != 0 && enddate.Ticks != 0 && startdate.Ticks > enddate.Ticks)
            {
                Label_Message.Text = "結束日期不能小於開始日期";
                return;
            }

            if (!txt_moduleId.Text.Trim().Equals(""))
            {
                bingBomDesign(txt_moduleId.Text.Trim(), startdate, enddate);
                try
                {
                    dpl_moduleId.SelectedValue = txt_moduleId.Text;
                }
                catch
                {

                }
            }
            else
            {
                bingBomDesign(dpl_moduleId.SelectedValue.Trim(), startdate, enddate);
            }
        }

        protected void lnkbutton_print_Click(object sender, EventArgs e)
        {
            PartType parttype = new PartType();
            IList parttypes = parttype.GetPartTypeByName("EDM");
            if (parttypes.Count > 0)
            {
                PartTypeInfo pti = parttypes[0] as PartTypeInfo;
                if (pti.PartnoCreate != null && !pti.PartnoCreate.Trim().Equals(""))
                {
                    ICreateEdmReport createEdm = CreateEdmReportFactory.Create(pti.PartnoCreate);
                    string outfliename = "";
                    if (!txt_moduleId.Text.Trim().Equals(""))
                    {
                        outfliename = createEdm.createEdmReprot(txt_moduleId.Text.Trim());
                    }
                    else
                    {
                        outfliename = createEdm.createEdmReprot(dpl_moduleId.SelectedValue);
                    }

                    Label_Message.Text = "<a href=" + outfliename + ">保存報表</a>";
                }
            }



        }

        protected void lnkbutton_edit_detail_Click(object sender, EventArgs e)
        {
            int value = getChkedItemKey();
            if (value > -1)
            {
                BomDetailInfo bdi = new BomDetail().findbykey(value);
                if (bdi == null)
                {
                    Label_Message.Text = "BOM已經被其它用戶修改，請刷新后重新選擇";
                    return;
                }

                if (bdi.PartNo.Equals("999"))
                {
                    Label_Message.Text = "999零件不允許修改明細";
                    return;
                }
                string url = "BomDetailView.aspx?menuid=" + menuid + "&func=edit&id=" + value+"&StyleCustomer=" + lab_bomstyle.Text.Trim();
                Response.Redirect(url);
            }
        }

        protected void lnkbutton_delete_detail_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                int value = getChkedItemKey();
                if (value > -1)
                {
                    Label_Message.Text = new BomDetail().deleteAllBomDetail(value, lab_User.Text, new SendAlert(), new OutSourceDetail());
                    bingBomDesign();
                }
                else
                {
                    Label_Message.Text = "請選擇明細";
                }
            }
        }
    }
}