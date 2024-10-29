
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
using System.Collections.Generic;
using ModuleWorkFlow.business;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.BLL.Report;
using ModuleWorkFlow.BLL.StupidReport;
using ModuleWorkFlow.Model.StupidReport;
using ModuleWorkFlow.IDAL.Report;
using Utility;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.Config;

using System.Web.Services;
using ModuleWorkflow.OutSource.BLL.Interface;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model.Try;
using System.Reflection;

using ModuleWorkFlow.Model.Unnormal;
using ModuleWorkFlow.BLL.Unnormal;
using LibGit2Sharp;
using System.IO;
using ModuleWorkFlow.report;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for OrderList.
    /// </summary>
    public class OrderDesignList : System.Web.UI.Page
    {
        //protected ModuleWorkFlow.controls.Style Style;
        protected System.Web.UI.WebControls.TextBox TextBox_key;
        protected System.Web.UI.WebControls.Button Button_Search;
        protected System.Web.UI.WebControls.Label lab_oldremenber;
        protected System.Web.UI.WebControls.Label lab_orderSingle;
        protected System.Web.UI.WebControls.TextBox txt_orderSingle;
        protected System.Web.UI.WebControls.Button btn_search_orderSingle;
        protected System.Web.UI.WebControls.Label lab_search;
        protected System.Web.UI.WebControls.Label lab_searchsingle;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_overStatus;
        protected System.Web.UI.WebControls.DropDownList dpl_overStatus;
        protected System.Web.UI.WebControls.Button btn_referencePictureDate;
        protected System.Web.UI.WebControls.Label lab_Trydate0;
        protected System.Web.UI.WebControls.Button btn_printReferencePictureDate;
        protected System.Web.UI.WebControls.DropDownList dpl_customer;
        protected System.Web.UI.WebControls.DropDownList dpl_datetime;
        protected TextBox txt_startdatetime;
        protected TextBox txt_endstartdatetime;
        protected System.Web.UI.WebControls.DataGrid DataGridDate;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.DropDownList dpl_productTypeId;
        protected System.Web.UI.WebControls.DropDownList dpl_ismodify;
        protected System.Web.UI.WebControls.DropDownList dpl_customerModuleId;
        protected System.Web.UI.WebControls.Label lab_module;
        protected Label lab_model;
        protected DropDownList dpl_model;

        protected System.Web.UI.WebControls.Label lab_print;
        protected System.Web.UI.WebControls.LinkButton lnkbutton_view;
        protected ModuleWorkFlow.order.controls.OrderDesignView OrderView;
        protected System.Web.UI.WebControls.LinkButton lnkbutton_copy;
        protected System.Web.UI.WebControls.LinkButton lnkbutton_add;
        protected System.Web.UI.WebControls.LinkButton lnkbutton_delete;
        protected System.Web.UI.WebControls.LinkButton lnk_schedule;
        protected Label lab_projectDepartMent;
        protected DropDownList dpl_projectDepartMent;

        protected System.Web.UI.WebControls.Label lab_LastScheduledTime;

        protected System.Web.UI.WebControls.Label lab_productname;
        protected System.Web.UI.WebControls.TextBox txt_productname;
        protected Label lab_sort;
        protected Label lab_total;

        //protected System.Web.UI.WebControls.Label lab_materialCost;
        //protected System.Web.UI.WebControls.Label lab_humanCost;
        //protected System.Web.UI.WebControls.Label lab_manufactureCost;


        private Hashtable hcustomer = new ModuleWorkFlow.BLL.Customer().getCustomerByIDandall();
        private Hashtable hmaterial = new ModuleWorkFlow.BLL.Material().getHashtableMaterial();
        private Hashtable hproducrtype = new ModuleWorkFlow.BLL.System.ProductType().getIdProductTypeInfo();
        protected LinkButton lnkbutton_print_barcode;
        protected string imgpath;
        private double total = 0;
        private double num = 0;
        private string menuid = "B01";

        protected override void LoadViewState(object savedState)
        {
            base.LoadViewState(savedState);


            CreateDataGrid();



        }

        private void CreateDataGrid()
        {
            ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
            IList ilist = ct.getControlTableByList("tb_order", 0);
            int i = 1;





            BoundColumn bcno = new BoundColumn();
            bcno.ItemStyle.Width = 50;

            bcno.HeaderText = "";
            bcno.DataField = "";

            //MainDataGrid.Columns.AddAt(1, bcno);
            //DataGridDate.Columns.AddAt(0, bcno);

            foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
            {
                BoundColumn bc = new BoundColumn();
                bc.HeaderText = cti.TableValue;
                bc.DataField = cti.TableField;
                if (cti.SortDirection != null && !cti.SortDirection.Trim().Equals(""))
                {
                    bc.SortExpression = cti.TableField + "|" + cti.SortDirection;
                }

                switch (cti.TableDateField)
                {
                    case "string":
                     
                        break;
                    case "DateTime":
                        if (!cti.TableField.Equals("tryDate0"))
                            bc.DataFormatString = "{0:yyyy-MM-dd HH:mm}";
                           

                        break;
                    case "DateTimePick":
                        bc.DataFormatString = "{0:yyyy-MM-dd HH:mm}";
                      
                        break;
                    case "Int":
                        //iserr = selectUserNo(content);


                        break;
                    case "Double":
                        bc.DataFormatString = "{0:N}";


                        //iserr = selectUserNo(content);
                        break;


                }
                bc.HeaderStyle.Width = cti.TableValue.Length * 10;
                if (cti.ListShowWidth > 0)
                {
                    bc.ItemStyle.Width = cti.ListShowWidth;
                    bc.HeaderStyle.Width = cti.ListShowWidth;
                }
                else
                {
                    if (cti.TableDateField.Equals("DateTime") || cti.TableDateField.Equals("DateTimePick"))
                    {
                        bc.ItemStyle.Width = 60;
                    }
                    else
                    {
                        bc.ItemStyle.Width = bc.HeaderStyle.Width;
                    }
                   
                }
                  
               
                MainDataGrid.Columns.AddAt(i, bc);
                //DataGridDate.Columns.AddAt(i-1, bc);
                i++;

            }

        }
        private void Page_Load(object sender, System.EventArgs e)
        {
            if ((System.Configuration.ConfigurationSettings.AppSettings["BusinessOrder"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["BusinessOrder"])))
            {
                lnkbutton_add.Visible = false;
                lnkbutton_delete.Visible = false;
            }
            else
            {
                lnkbutton_add.Visible = true;
                lnkbutton_delete.Visible = true;
            }

            string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["ERPInterface"];
            if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
            {
                //SystemInterFace systemInterface = new SystemInterFace();
                //systemInterface.SystemInterFaceInitial("order");
                //int[] updatescount = systemInterface.GetUpdatedSchemasCount("order");
                //if (updatescount[SystemInterFace.NEEDINSERT] == 0)
                //{
                //    lnkbutton_add.Enabled = false;
                //}
                //else
                //{
                //    lnkbutton_add.Enabled = true;
                //}
                //if (updatescount[SystemInterFace.NEEDUPDATED] == 0)
                //{
                //    lnk_schedule.Enabled = false;
                //}
                //else
                //{
                //lnk_schedule.Enabled = true;
                //}
                //lnkbutton_add.ToolTip = "新增/add(" + updatescount[SystemInterFace.NEEDINSERT].ToString() + ")";
                //lnk_schedule.ToolTip = "同步(" + updatescount[SystemInterFace.NEEDUPDATED].ToString() + ")";
                lnkbutton_delete.Visible = false;
                lnkbutton_add.Visible = false;
            }
            else
            {
                lnk_schedule.Visible = false;
                //lnkbutton_delete.Visible = true;
            }
            ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
            IList ilist = ct.getControlTableByList("tb_order", 0);
            int i = 1;





            BoundColumn bcno = new BoundColumn();
            bcno.ItemStyle.Width = 50;

            bcno.HeaderText = "";
            bcno.DataField = "";

            //MainDataGrid.Columns.AddAt(1, bcno);
            //DataGridDate.Columns.AddAt(0, bcno);

            //foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
            //{
            //    BoundColumn bc = new BoundColumn();
            //    bc.HeaderText = cti.TableValue;
            //    bc.DataField = cti.TableField;
            //    if (cti.SortDirection != null && !cti.SortDirection.Trim().Equals(""))
            //    {
            //        bc.SortExpression = cti.TableField + "|" + cti.SortDirection;
            //    }

            //    switch (cti.TableDateField)
            //    {
            //        case "string":


            //            break;
            //        case "DateTime":
            //            if (!cti.TableField.Equals("tryDate0"))
            //                bc.DataFormatString = "{0:d}";


            //            break;
            //        case "Int":
            //            //iserr = selectUserNo(content);


            //            break;
            //        case "Double":
            //            bc.DataFormatString = "{0:N}";


            //            //iserr = selectUserNo(content);
            //            break;


            //    }
            //    MainDataGrid.Columns.AddAt(i, bc);
            //    //DataGridDate.Columns.AddAt(i-1, bc);
            //    i++;

            //}


            IList list = ct.getControlTableByTableNameByIsVisible("tb_order", 0);
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




            // Put user code to initialize the page here
            if (!this.IsPostBack)
            {
                CreateDataGrid();
                ViewState["foo"] = "foo";
                OrderDesignInfo createOrderInfo = new OrderCreate().OrderDesignCreate("createOrderDesign");
                {
                    if (createOrderInfo != null && createOrderInfo.Id == 0)
                    {
                        new OrderDesign().insertOrderDesign(createOrderInfo, new SendAlert());
                    }
                }


                if (System.Configuration.ConfigurationSettings.AppSettings["OrderPrintBarcode"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["OrderPrintBarcode"]))
                {
                    lnkbutton_print_barcode.Visible = true;
                }
                else
                {
                    lnkbutton_print_barcode.Visible = false;
                }
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
                string IsPart = System.Configuration.ConfigurationSettings.AppSettings["IsPart"];
                if (IsPart != null && Convert.ToBoolean(IsPart))
                {
                    lab_module.Visible = false;
                    dpl_productTypeId.Visible = false;
                    dpl_ismodify.Visible = false;
                    lnkbutton_copy.Visible = false;
                    lnkbutton_view.Visible = false;
                }

                cti = ct.GetTableByField("tb_order", "projectDepartMent");
                if (cti != null && cti.IsVisible == 1)
                {
                    lab_projectDepartMent.Text = cti.TableValue;
                    lab_projectDepartMent.Visible = true;
                    dpl_projectDepartMent.Visible = true;
                }
                else
                {
                    dpl_projectDepartMent.Visible = false;
                    if (lab_projectDepartMent != null)
                    {
                        lab_projectDepartMent.Visible = false;
                    }
                }

                lab_module.Text = System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"];
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");
                BindCustomer();
                bindProjectDepartMent();
                BindCustomerModuleId();
                bindproductType();
                bindModelType();
                if (Request.Params["modifyid"] != null)
                {
                    dpl_ismodify.SelectedValue = Request.Params["modifyid"];
                }

                if (Request.Params["datetype"] != null)
                {
                    dpl_datetime.SelectedValue = Request.Params["datetype"];
                }

                if (Request.Params["startdate"] != null)
                {
                    txt_startdatetime.Text = Request.Params["startdate"];
                }

                if (Request.Params["enddate"] != null)
                {
                    txt_endstartdatetime.Text = Request.Params["enddate"];
                }

                if (Request.Params["overstatus"] != null)
                {
                    dpl_overStatus.SelectedValue = Request.Params["overstatus"];
                }

                if (Request.Params["key"] != null)
                {
                    TextBox_key.Text = Request.Params["key"];
                }

                if (Request.Params["pageindex"] == null || Request.Params["pageindex"].Equals(""))
                {
                    bindData(1);
                }
                else
                {
                    bindData(Convert.ToInt16(Request.Params["pageindex"]) + 1);
                }

                //				BindDateTime();
                bindData(1);
            }



            Label_Message.Text = "";
            string msg = Request.Params["msg"];
            if (msg != null && msg.Length > 0) Label_Message.Text = msg;
            lab_search.Text = "false";
            lab_searchsingle.Text = "false";
            DataGridDate.Visible = false;

        }

        public void bindModelType()
        {
            ModelType modelType = new ModelType();
            dpl_model.DataSource = modelType.getModelTypeInfo();
            dpl_model.DataTextField = "TypeName";
            dpl_model.DataValueField = "TypeId";
            dpl_model.DataBind();
            dpl_model.Items.Insert(0, new ListItem("所有類型", "0"));
            if (Request.Params["model"] != null)
                dpl_model.SelectedValue = Request.Params["model"];
        }

        private void bindProjectDepartMent()
        {
            dpl_projectDepartMent.DataSource = new DepartMent().GetAllDepartment(menuid);
            dpl_projectDepartMent.DataTextField = "DepartmentName";
            dpl_projectDepartMent.DataValueField = "DepartmentId";
            dpl_projectDepartMent.DataBind();
            dpl_projectDepartMent.Items.Insert(0, new ListItem("所有部門", "0"));
            dpl_projectDepartMent.AutoPostBack = false;
        }

        public void bindproductType()
        {
            IList li = new ArrayList();
            ModuleWorkFlow.BLL.System.ProductType producttype = new ModuleWorkFlow.BLL.System.ProductType();
            li = producttype.GetProductTypeInfos();
            dpl_productTypeId.DataTextField = "TypeName";
            dpl_productTypeId.DataValueField = "Id";
            dpl_productTypeId.DataSource = li;
            dpl_productTypeId.DataBind();
            dpl_productTypeId.Items.Insert(0, new ListItem("所有類型", "0"));
            if (Request.Params["producttype"] != null)
                dpl_productTypeId.SelectedValue = Request.Params["producttype"];


        }

        private void bindData(int PageCurrent)
        {
            int customeriId = 0;
            int producttype = 0;
            int modifyid = 0;
            if (dpl_customer.SelectedValue.Equals(""))
            {
                customeriId = 0;
            }
            else
            {
                customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
            }
            try
            {
                producttype = Convert.ToInt32(dpl_productTypeId.SelectedValue);
            }
            catch
            { }
            modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);
            DateTime startdate = Convert.ToDateTime("0001/1/1");
            DateTime enddate = Convert.ToDateTime("0001/1/1");
            //try
            //{
            //    if (txt_startdatetime.Text.Equals(""))
            //    {
            //        startdate = Convert.ToDateTime("0001/1/1");
            //    }
            //    else
            //    {
            //        startdate = Convert.ToDateTime(txt_startdatetime.Text);
            //    }
            //    if (txt_endstartdatetime.Text.Equals(""))
            //    {
            //        enddate = Convert.ToDateTime("0001/1/1");
            //    }
            //    else
            //    {
            //        enddate = Convert.ToDateTime(txt_endstartdatetime.Text);
            //    }
            //}
            //catch { }

            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
            int customerModuleId = -1;
            if (!dpl_customerModuleId.SelectedValue.Equals(""))
                customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);
            string sqlstring = "";
            if (dpl_overStatus.SelectedValue.Equals("4"))
            {
                sqlstring = order.getOrderSql("Close", 3, customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, Convert.ToInt32(dpl_model.SelectedValue), Convert.ToInt16(dpl_projectDepartMent.SelectedValue), txt_productname.Text.Trim());
            }
            else
            {
                sqlstring = order.getOrderSql(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, Convert.ToInt32(dpl_model.SelectedValue), Convert.ToInt16(dpl_projectDepartMent.SelectedValue), txt_productname.Text.Trim());
            }


            string sqlorderby = lab_sort.Text;
            string orderdiection = null;
            if (sqlorderby.Trim().Equals(""))
            {
                sqlorderby = order.getOrderOrderBy();
            }
            else
            {
                string[] sort = lab_sort.Text.Split('|');
                sqlorderby = sort[0];
                orderdiection = sort[1];

            }


            IList source = order.GetOrderListFast("tb_order", null, "id", PageCurrent, MainDataGrid.PageSize, "*", sqlorderby, sqlstring, orderdiection);
            if (dpl_ismodify.SelectedValue.Equals("1"))
            {
                Project project = new Project();
                for (int i = 0; i < source.Count; i++)
                {
                    OrderDesignInfo oi = (OrderDesignInfo)source[i];
                    oi.OrderSingle = project.GetProjectInfoByModuleid(oi.ModuleId).ECNO;
                }
            }
            string modulelist = TextBox_key.Text.Trim();
            if (modulelist.Equals(""))
            {
                modulelist = "(";
                for (int i = 0; i < source.Count; i++)
                {
                    OrderDesignInfo oi = (OrderDesignInfo)source[i];
                    modulelist = modulelist + "'" + oi.ModuleId + "'";
                    if (i == source.Count - 1)
                    {
                        modulelist = modulelist + ")";
                    }
                    else
                    {
                        modulelist = modulelist + ",";
                    }
                }
            }
            IList FactSource = new ModuleWorkFlow.BLL.PartProcess().GetLastOrderDesing(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, modulelist, Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, source);

            MainDataGrid.VirtualItemCount = order.getOrderListCount(sqlstring);

            MainDataGrid.DataSource = getColorSource(FactSource);
            lab_total.Text = "共" + MainDataGrid.VirtualItemCount.ToString() + "筆";
            Session["source"] = FactSource;

            if (dpl_overStatus.SelectedValue.Equals("4") || dpl_overStatus.SelectedValue.Equals("3"))
            {
                MainDataGrid.Columns[MainDataGrid.Columns.Count - 1].Visible = false;
                MainDataGrid.Columns[MainDataGrid.Columns.Count - 2].Visible = false;
            }

            MainDataGrid.DataKeyField = "moduleid";
            MainDataGrid.DataBind();

            DateTime lasttime = new ModuleWorkFlow.BLL.Order().getMaxlastScheduledTime();
            if (lasttime.Ticks > 0)
            {
                lab_LastScheduledTime.Text = "最後計算日期：" + lasttime.ToString("yy-MM-dd");
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
            this.dpl_overStatus.SelectedIndexChanged += new System.EventHandler(this.dpl_overStatus_SelectedIndexChanged);
            this.dpl_customer.SelectedIndexChanged += new System.EventHandler(this.dpl_customer_SelectedIndexChanged);
            this.Button_Search.Click += new System.EventHandler(this.Button_Search_Click);
            this.btn_referencePictureDate.Click += new System.EventHandler(this.btn_referencePictureDate_Click);
            this.btn_printReferencePictureDate.Click += new System.EventHandler(this.btn_printReferencePictureDate_Click);
            this.MainDataGrid.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemCreated);
            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
            this.MainDataGrid.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.MainDataGrid_DeleteCommand);
            this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.DataGridDate.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGridDate_PageIndexChanged);
            this.DataGridDate.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGridDate_ItemDataBound);

            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void MainDataGrid_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

            }
        }


        private void dpl_cartype_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            this.BindCustomerModuleId();
        }






        private void MainDataGrid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL");
            string ModuleId = (string)MainDataGrid.DataKeys[e.Item.ItemIndex];
            ModuleWorkFlow.business.Order order = new ModuleWorkFlow.business.Order();
            ModuleWorkFlow.BLL.DesignPartProcess dpp = new DesignPartProcess();
            ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();

            order.setModuleId(ModuleId);

            if (order.CheckOrderForBom(ModuleId) == 0)
            {
                if (dpp.getAllPartProcessByModuleid(ModuleId).Count == 0)
                {
                    if (part.GetAllPartNo(ModuleId).Count == 0)
                    {
                        if (order.Remove() < 1)
                        {
                            Label_Message.Text = Lang.TXT_OPERATIONERROR;
                        }
                        else
                        {
                            Label_Message.Text = Lang.TXT_DELETESUCCESS;
                        }
                    }
                    else
                    {
                        Label_Message.Text = Lang.BomType_Delete;
                    }
                }
                else
                {
                    Label_Message.Text = "存在模具設計,不能刪除;";
                }
            }
            else
            {
                Label_Message.Text = "此訂單已導入BOM，請先清除相關記錄後再刪除訂單";
            }
            MainDataGrid.EditItemIndex = -1;
            int erroypage = MainDataGrid.CurrentPageIndex;

            try
            {
                bindData(MainDataGrid.CurrentPageIndex + 1);
            }
            catch (Exception eemsg)
            {
                string ssmsg = eemsg.Message.ToString();
                MainDataGrid.CurrentPageIndex = erroypage - 1;
                bindData(MainDataGrid.CurrentPageIndex + 1);
            }
        }

        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            Hashtable hPage = new Hashtable();
            IList orders = new ArrayList();
            if (Session["page"] != null && hPage.ContainsKey(MainDataGrid.CurrentPageIndex))
            {
                hPage = Session["page"] as Hashtable;
            }
            foreach (DataGridItem item in MainDataGrid.Items)
            {

                CheckBox chk_datagrid = item.FindControl("chk_datagrid") as CheckBox;
                if (chk_datagrid.Checked)
                {

                    orders.Add(MainDataGrid.DataKeys[item.ItemIndex].ToString());
                }
            }
            hPage.Add(MainDataGrid.CurrentPageIndex, orders);
            Session["page"] = hPage;
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;
            bindData(e.NewPageIndex + 1);
        }

        private void Button_Search_Click(object sender, System.EventArgs e)
        {
            lab_oldremenber.Text = TextBox_key.Text.Trim();
            lab_search.Text = "true";
            lab_searchsingle.Text = "false";
            dpl_overStatus.SelectedValue = "0";
            MainDataGrid.CurrentPageIndex = 0;
            bindData(MainDataGrid.CurrentPageIndex + 1);
        }

        private void btn_search_orderSingle_Click(object sender, System.EventArgs e)
        {
            lab_oldremenber.Text = "";
            lab_search.Text = "false";
            lab_searchsingle.Text = "true";
            MainDataGrid.CurrentPageIndex = 0;
            bindData(MainDataGrid.CurrentPageIndex + 1);
        }

        private void dpl_overStatus_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            Label_Message.Text = "";
            MainDataGrid.CurrentPageIndex = 0;
            bindData(MainDataGrid.CurrentPageIndex + 1);
        }

        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            ModuleWorkFlow.BLL.Customer customer = new ModuleWorkFlow.BLL.Customer();
            ModuleWorkFlow.Model.CustomerInfo customerinfo = new CustomerInfo();
            OverReason overReason = new OverReason();
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {




                ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
                IList ilist = ct.getControlTableByList("tb_order", 0);
                int i = 1;
                foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
                {
                    if (cti.TableDateField.Equals("Image"))
                    {
                        MainDataGrid.Columns[1].Visible = false;
                        MainDataGrid.Columns[MainDataGrid.Columns.Count - 6].Visible = true;
                        Label htmli = (Label)e.Item.FindControl("dg_img_Picture") as Label;
                        Label picture = (Label)e.Item.FindControl("picture") as Label;
                        string src = htmli.Text;

                        if (!src.Equals(""))
                        {
                            imgpath = "../uploadimages/" + src;

                            picture.Text = "<img src=\"" + imgpath + "\" width=\"50px\" height=\"50px\" />";

                        }
                        else
                        {
                            picture.Visible = false;
                        }



                    }

                    if (cti.TableDateField.Equals("DateTime"))
                    {
                        try
                        {
                            DateTime date = Convert.ToDateTime(e.Item.Cells[i].Text);
                            if (date.Ticks == 0 )
                            {
                                e.Item.Cells[i].Text = "";
                            }

                        }
                        catch {
                            e.Item.Cells[i].Text = "";
                        }
                    }

                    if (cti.TableField.Equals("difficultlevel"))
                    {
                        int difficultlevel = Convert.ToInt32(e.Item.Cells[i].Text);
                        DifficultInfo di = new Difficult().findbykey(difficultlevel);
                        if (di != null)
                        {
                            e.Item.Cells[i].Text = di.Name;
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "";
                        }



                    }

                    if (cti.TableField.Equals("CustomerId"))
                    {
                        string customerid = e.Item.Cells[i].Text;
                        string customename = (string)hcustomer[customerid];
                        if (customename != null)
                        {
                            e.Item.Cells[i].Text = customename;
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "&nbsp;";
                        }
                    }

                    if (cti.TableField.Equals("productname"))
                    {
                        if (e.Item.Cells[i].Text.Length > 15)
                            e.Item.Cells[i].Text = e.Item.Cells[i].Text.Substring(0, 14);
                    }

                    if (cti.TableField.Equals("StatusId"))
                    {
                        string StatusId = e.Item.Cells[i].Text;
                        if (StatusId.Equals("Ready"))
                        {
                            e.Item.Cells[i].Text = "就緒";
                        }
                        else if (StatusId.Equals("Holdon"))
                        {
                            e.Item.Cells[i].Text = "暫停";
                        }
                        else if (StatusId.Equals("Cancel"))
                        {
                            e.Item.Cells[i].Text = "取消";
                        }

                    }
                    if (cti.TableField.Equals("ProductTypeId"))
                    {
                        ModuleWorkFlow.BLL.System.ProductType producttype = new ModuleWorkFlow.BLL.System.ProductType();
                        string ProductTypeId = e.Item.Cells[i].Text;
                        ModuleWorkFlow.Model.System.ProductTypeInfo pti = (ModuleWorkFlow.Model.System.ProductTypeInfo)hproducrtype[Convert.ToInt32(ProductTypeId)];
                        if (pti != null)
                        {
                            e.Item.Cells[i].Text = pti.TypeName;
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "&nbsp;";
                        }
                    }
                    if (cti.TableField.Equals("isPart"))
                    {
                        string hasprice = e.Item.Cells[i].Text;
                        if (hasprice.Equals("0"))
                        {
                            e.Item.Cells[i].Text = "模具";
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "零件";
                        }
                    }
                    if (cti.TableField.Equals("hasprice"))
                    {
                        string hasprice = e.Item.Cells[i].Text;
                        if (hasprice.Equals("0"))
                        {
                            e.Item.Cells[i].Text = "無酬";
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "有酬";
                        }
                    }

                    if (cti.TableField.Equals("material"))
                    {
                        string mid = e.Item.Cells[i].Text;
                        Material m = new Material();
                        MaterialInfo mi = (MaterialInfo)hmaterial[mid];
                        if (mi != null)
                        {
                            e.Item.Cells[i].Text = mi.Name;
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "&nbsp;";
                        }
                    }

                    if (cti.TableField.Equals("tryDate0"))
                    {
                        string tryDate0 = e.Item.Cells[i].Text;
                        if (Convert.ToDateTime(tryDate0).Ticks == 0)
                        {
                            e.Item.Cells[i].Text = "";
                        }
                        else
                        {
                            e.Item.Cells[i].Text = Convert.ToDateTime(tryDate0).ToShortDateString();
                        }

                    }


                    Label lab_color = e.Item.FindControl("lab_Color") as Label;
                    if (lab_color.Text.Equals("1"))
                    {
                        e.Item.Style.Add(HtmlTextWriterStyle.Color, "red");
                    }

                    Label lab_overReason = e.Item.FindControl("lab_overReason") as Label;
                    Label lab_overReasonId = e.Item.FindControl("lab_overReasonId") as Label;
                    if (!lab_overReasonId.Text.Trim().Equals(""))
                    {
                        OverReasonInfo ori = overReason.findbykey(Convert.ToInt32(lab_overReasonId.Text.Trim()));
                        if (ori != null)
                        {
                            lab_overReason.Text = ori.Reason;
                        }
                    }


                    i++;
                }

                string versionfor = System.Configuration.ConfigurationSettings.AppSettings["versionfor"];
                string ispart = System.Configuration.ConfigurationSettings.AppSettings["IsPart"];
                if ((ispart != null && Convert.ToBoolean(ispart)) || (versionfor != null && versionfor.Equals("PART")))
                {
                    HyperLink HyperLink_MiddleSchedule = e.Item.FindControl("HyperLink_MiddleSchedule") as HyperLink;
                    HyperLink_MiddleSchedule.Visible = false;
                }


                Label dg_lab_ScheduledEndDate = e.Item.FindControl("dg_lab_ScheduledEndDate") as Label;
                // Label dg_lab_LastScheduledTime = e.Item.FindControl("dg_lab_LastScheduledTime") as Label;
                if (dg_lab_ScheduledEndDate.Text.Equals("01-01-01"))
                {
                    dg_lab_ScheduledEndDate.Text = "";
                }

                //if (dg_lab_LastScheduledTime.Text.Equals("01-01-01"))
                //{
                //    dg_lab_LastScheduledTime.Text = "";
                //}

                //CheckBox cb = new CheckBox();
                //cb.ID = "chk_datagrid";
                //e.Item.Cells[0].Controls.Clear();
                //e.Item.Cells[0].Controls.Add(cb);



                //e.Item.Cells[0].Text = Convert.ToString(e.Item.ItemIndex + 1);

                string moduleid = e.Item.Cells[1].Text;
                Label lab_dg_tn = e.Item.FindControl("lab_dg_tn") as Label;

                ModuleWorkFlow.BLL.Try.TrySchedule trySchedule = new BLL.Try.TrySchedule();
                IList source = trySchedule.GetTryScheduleByModuleId(moduleid);
                int maxtn = 0;
                foreach (TryScheduleInfo tsi in source)
                {
                    if (!tsi.Tn.Equals("") && Convert.ToInt32(tsi.Tn.Substring(1)) > maxtn)
                    {
                        maxtn = Convert.ToInt32(tsi.Tn.Substring(1));
                    }
                }
                if (maxtn != 0)
                {
                    lab_dg_tn.Text = "T" + maxtn;
                }

                //if (!dg_lab_LastScheduledTime.Text.Equals(""))
                //{
                //    lab_LastScheduledTime.Text = "最後計算日期：" + dg_lab_LastScheduledTime.Text;
                //}

            }
        }

        private void BindCustomer()
        {
            ModuleWorkFlow.BLL.Customer customer = new ModuleWorkFlow.BLL.Customer();
            dpl_customer.DataSource = customer.GetCustomer();
            dpl_customer.DataTextField = "ChineseName";
            dpl_customer.DataValueField = "Id";
            dpl_customer.DataBind();
            dpl_customer.Items.Insert(0, "");
            if (Request.Params["customerid"] != null)
                dpl_customer.SelectedValue = Request.Params["customerid"];

        }


        protected void lnkbutton_printbarCode_Click(object sender, EventArgs e)
        {
            ArrayList partlists = new ArrayList();
            ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        string ModuleId = (string)MainDataGrid.DataKeys[item.ItemIndex];
                        IList parts = part.GetAllPartNo(ModuleId);
                        partlists.AddRange(parts);

                    }
                }
            }
            PartBarCodeReport report = new PartBarCodeReport();
            Label_Message.Text = "<a href='..\\excel\\" + report.CreatePartTxtBarReport(partlists, "barcode") + "'>(點擊這裡下載報表文件)</a>";
            bindData(MainDataGrid.CurrentPageIndex + 1);

        }


        private void Bindcartype()
        {

            IList list = new ArrayList();
            ModuleWorkFlow.BLL.System.Model model = new ModuleWorkFlow.BLL.System.Model();
            if (dpl_customer.SelectedValue.Equals(""))
            {
                list = model.GetModelInfosCartype();
            }
            else
            {
                list = model.GetModelByCustomerId(Convert.ToInt32(dpl_customer.SelectedValue));
            }





        }

        private void BindCustomerModuleId()
        {
            IList list = new ArrayList();
            ModuleWorkFlow.BLL.System.Model model = new ModuleWorkFlow.BLL.System.Model();


            if (dpl_customer.SelectedValue.Equals(""))
            {
                list = model.GetModelInfos();
            }
            else
            {
                list = model.GetModelByCustomerId(Convert.ToInt32(dpl_customer.SelectedValue));
            }








            dpl_customerModuleId.DataSource = list;


            dpl_customerModuleId.DataTextField = "moldName";
            dpl_customerModuleId.DataValueField = "Id";
            dpl_customerModuleId.DataBind();
            dpl_customerModuleId.Items.Insert(0, "");

            if (Request.Params["customermoduleid"] != null)
            {
                dpl_customerModuleId.SelectedValue = Request.Params["customermoduleid"];
            }


        }

        private void btn_referencePictureDate_Click(object sender, System.EventArgs e)
        {
            Label_Message.Text = "";
            MainDataGrid.CurrentPageIndex = 0;
            bindData(MainDataGrid.CurrentPageIndex + 1);
            btn_printReferencePictureDate.Visible = true;
        }

        private void BindDateTime()
        {

        }

        private void dpl_customer_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            Label_Message.Text = "";

            BindCustomerModuleId();
            MainDataGrid.CurrentPageIndex = 0;
            bindData(MainDataGrid.CurrentPageIndex + 1);
        }

        private void DataGridDate_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            DataGridDate.CurrentPageIndex = e.NewPageIndex;
            DataGridDateBind();
        }


        private void btn_printReferencePictureDate_Click(object sender, System.EventArgs e)
        {
            DataGridDate.Visible = true;
            DataGridDate.AllowPaging = false;
            DataGridDateBind();
            if (DataGridDate.Items.Count > 0)
            {
                tools.DataGridToExcel(DataGridDate);

            }
            else
            {
                Label_Message.Text = "不能打印空記錄";
                return;
            }
            DataGridDate.AllowPaging = true;
            DataGridDate.Visible = false;
            DataGridDateBind();
        }

        private void DataGridDate_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            ModuleWorkFlow.BLL.Customer customer = new ModuleWorkFlow.BLL.Customer();
            ModuleWorkFlow.Model.CustomerInfo customerinfo = new CustomerInfo();
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
                IList ilist = ct.getControlTableByList("tb_order", 0);
                int i = 1;
                foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
                {
                    if (cti.TableField.Equals("CustomerId"))
                    {
                        string customerid = e.Item.Cells[i].Text;
                        //customerinfo = customer.getCustomerByCustomerId(Convert.ToInt32(customerid));
                        string customename = (string)hcustomer[customerid];
                        if (customename != null)
                        {
                            e.Item.Cells[i].Text = customename;
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "&nbsp;";
                        }
                    }
                    if (cti.TableField.Equals("StatusId"))
                    {
                        string StatusId = e.Item.Cells[i].Text;
                        if (StatusId.Equals("Ready"))
                        {
                            e.Item.Cells[i].Text = "就緒";
                        }
                        else if (StatusId.Equals("Holdon"))
                        {
                            e.Item.Cells[i].Text = "暫停";
                        }
                        else if (StatusId.Equals("Cancel"))
                        {
                            e.Item.Cells[i].Text = "取消";
                        }
                    }



                    //if (cti.TableField.Equals("ProductTypeId"))
                    //{
                    //    ModuleWorkFlow.BLL.System.ProductType producttype = new ModuleWorkFlow.BLL.System.ProductType();
                    //    string ProductTypeId = e.Item.Cells[i].Text;
                    //    //ModuleWorkFlow.Model.System.ProductTypeInfo pti = producttype.findbykey(Convert.ToInt32(ProductTypeId));
                    //    ModuleWorkFlow.Model.System.ProductTypeInfo pti = (ModuleWorkFlow.Model.System.ProductTypeInfo)hproducrtype[Convert.ToInt32(ProductTypeId)];
                    //    if (pti != null)
                    //    {
                    //        e.Item.Cells[i].Text = pti.TypeName;
                    //    }
                    //    else
                    //    {
                    //        e.Item.Cells[i].Text = "&nbsp;";
                    //    }
                    //}
                    if (cti.TableField.Equals("isPart"))
                    {
                        string hasprice = e.Item.Cells[i].Text;
                        if (hasprice.Equals("0"))
                        {
                            e.Item.Cells[i].Text = "模具";
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "零件";
                        }
                    }
                    if (cti.TableField.Equals("hasprice"))
                    {
                        string hasprice = e.Item.Cells[i].Text;
                        if (hasprice.Equals("0"))
                        {
                            e.Item.Cells[i].Text = "無酬";
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "有酬";
                        }
                    }

                    if (cti.TableField.Equals("material"))
                    {
                        string mid = e.Item.Cells[i].Text;
                        Material m = new Material();
                        //MaterialInfo mi = m.GetMaterialInfo(Convert.ToInt32(mid));
                        MaterialInfo mi = (MaterialInfo)hmaterial[mid];
                        if (mi != null)
                        {
                            e.Item.Cells[i].Text = mi.Name;
                        }
                        else
                        {
                            e.Item.Cells[i].Text = "&nbsp;";
                        }
                    }




                    i++;
                }
            }

        }

        private void DataGridDateBind()
        {
            int customeriId = 0;
            if (dpl_customer.SelectedValue.Equals(""))
            {
                customeriId = 0;
            }
            else
            {
                customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
            }
            DateTime startdate = Convert.ToDateTime("0001/1/1");
            DateTime enddate = Convert.ToDateTime("0001/1/1");
            try
            {
                if (txt_startdatetime.Text.Equals(""))
                {
                    startdate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    startdate = Convert.ToDateTime(txt_startdatetime.Text);
                }
                if (txt_endstartdatetime.Text.Equals(""))
                {
                    enddate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    enddate = Convert.ToDateTime(txt_endstartdatetime.Text);
                }
            }
            catch { }
            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
            IList source = order.getOrderList(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, Convert.ToInt32(dpl_productTypeId.SelectedValue), Convert.ToInt32(dpl_ismodify.SelectedValue), TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate);
            DataGridDate.DataSource = source;
            DataGridDate.DataBind();
        }


        public void InstantiateIn(Control container)
        {
            LiteralControl l = new LiteralControl();
            l.DataBinding += new EventHandler(this.OnDataBinding);
            // 
            container.Controls.Add(l);
            // 
        }
        public void OnDataBinding(object sender, EventArgs e)
        {
            LiteralControl l = (LiteralControl)sender;// 
            DataGridItem container = (DataGridItem)l.NamingContainer;
            l.Text = ((DataRowView)container.DataItem)["stuname"].ToString();// 
        }


        public IList getColorSource(IList source)
        {
            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();

            foreach (ModuleWorkFlow.Model.NewOrder.OrderDesignInfo odi in source)
            {
                if (odi.ProductEndDate.Ticks < odi.ScheduledEndDate.Ticks && odi.Overdealt == 0)
                {
                    odi.Color = 1;
                }
                else
                {
                    odi.Color = 0;
                }

            }
            return source;
        }

        protected void btn_print_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "";
            lab_print.Text = "";
            if (dpl_overStatus.SelectedValue.Equals("1"))
            {
                Label_Message.Text = "請選擇" + lab_overStatus.Text;
                bindData(1);
                return;
            }
            if (dpl_datetime.SelectedValue.Equals("0"))
            {
                Label_Message.Text = "請選擇日期類型";
                bindData(1);
                return;
            }
            if (txt_startdatetime.Text.Equals("") || txt_endstartdatetime.Text.Equals(""))
            {
                Label_Message.Text = "請輸入日期";
                bindData(1);
                return;
            }
            DateTime startdate = Convert.ToDateTime(txt_startdatetime.Text.Trim());
            DateTime enddate = Convert.ToDateTime(txt_endstartdatetime.Text.Trim());
            ModuleWorkFlow.BLL.StupidReport.StupidReport report = new ModuleWorkFlow.BLL.StupidReport.StupidReport();
            IList ppilist = new ArrayList();
            Hashtable horderline = new Hashtable();
            ModuleWorkFlow.BLL.PartProcess pp = new ModuleWorkFlow.BLL.PartProcess();
            ppilist = pp.getOrderLine(Convert.ToInt32(dpl_overStatus.SelectedValue), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, 0);
            horderline = pp.getHashtableOrderCompletion(Convert.ToInt32(dpl_overStatus.SelectedValue), 0, 0, 0, "", Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, ppilist);

            foreach (ModuleWorkFlow.Model.PartProcessInfo ppi in ppilist)
            {
                ppi.ReportYearMonth = "月份: " + DateTime.Now.Year + "年" + DateTime.Now.Month + "月";
                if (dpl_overStatus.SelectedValue.Equals("2"))
                {
                    ppi.OverStatuse = "未結案";
                }
                else if (dpl_overStatus.SelectedValue.Equals("3"))
                {
                    ppi.OverStatuse = "已結案";
                }
                ppi.ReportDate = DateTime.Now.ToShortDateString();
                if (ppi.ReferencePictureDate.Ticks > 0)
                {
                    ppi.ReportReferencePictureDate = ppi.ReferencePictureDate.ToShortDateString();
                }
                else
                {
                    ppi.ReportReferencePictureDate = "";
                }
                ppi.ModuleId = ppi.ModuleId;
                ppi.CustomerName = ppi.CustomerName;
                ppi.Completion = horderline[ppi.ModuleId].ToString();
                if (ppi.TryDate0.Ticks > 0)
                {
                    ppi.ReportTryDate0 = ppi.TryDate0.ToString();
                }
                else
                {
                    ppi.ReportTryDate0 = "";
                }
                if (ppi.TryDate3.Ticks > 0)
                {
                    ppi.ReportTryDate3 = ppi.TryDate3.ToShortDateString();
                }
                else
                {
                    ppi.ReportTryDate3 = "";
                }
                ppi.ProcessNeedMinutes = ppi.ProcessNeedMinutes;
                ppi.FactProcessNeedMinutes = ppi.FactProcessNeedMinutes;
            }
            lab_print.Text = "<a href='" + report.CreateReport("orderline", ppilist) + "'>打開報表</a>";
            bindData(1);
        }

        protected void btn_printOrderPrice_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "";
            lab_print.Text = "";
            if (dpl_datetime.SelectedValue.Equals("0"))
            {
                Label_Message.Text = "請選擇日期類型";
                bindData(1);
                return;
            }
            if (txt_startdatetime.Text.Equals("") || txt_endstartdatetime.Text.Equals(""))
            {
                Label_Message.Text = "請輸入日期";
                bindData(1);
                return;
            }
            DateTime startdate = Convert.ToDateTime(txt_startdatetime.Text.Trim());
            DateTime enddate = Convert.ToDateTime(txt_endstartdatetime.Text.Trim());
            ModuleWorkFlow.report.OrderPriceReport opreport = new ModuleWorkFlow.report.OrderPriceReport();
            IList ppilist = new ArrayList();
            Hashtable horderline = new Hashtable();
            ModuleWorkFlow.BLL.PartProcess pp = new ModuleWorkFlow.BLL.PartProcess();
            int customer = 0;
            try
            {
                customer = Convert.ToInt32(dpl_customer.SelectedValue);
            }
            catch
            {
                customer = 0;
            }
            ppilist = pp.getOrderLine(Convert.ToInt32(dpl_overStatus.SelectedValue), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customer);
            horderline = pp.getHashtableOrderCompletion(Convert.ToInt32(dpl_overStatus.SelectedValue), customer, 0, 0, "", Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, ppilist);
            ModuleWorkFlow.BLL.ModulePrice mp = new ModuleWorkFlow.BLL.ModulePrice();
            Hashtable hProcessNeedMinutesPrice = mp.getHashtableOrderPriceByProcessNeedMinutesPrice(ppilist);
            Hashtable hFactProcessNeedMinutesPrice = mp.getHashtableOrderPriceByFactProcessNeedMinutesPrice(ppilist);
            foreach (ModuleWorkFlow.Model.PartProcessInfo ppi in ppilist)
            {
                ppi.Completion = horderline[ppi.ModuleId].ToString();
                ppi.ProcessNeedMinutesPrice = Convert.ToDouble(hProcessNeedMinutesPrice[ppi.ModuleId].ToString());
                ppi.FactProcessNeedMinutesPrice = Convert.ToDouble(hFactProcessNeedMinutesPrice[ppi.ModuleId].ToString());
            }
            lab_print.Text = "<a href='" + opreport.CreatepartReport(Utility.tools.ListToDataSet(ppilist), customer) + "'>打開報表</a>";
            bindData(1);
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {

            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        string value = MainDataGrid.DataKeys[item.ItemIndex].ToString();
                        string url = "OrderDesignView.aspx?func=edit&moduleid=" + value;
                        int customeriId = 0;
                        int producttype = 0;
                        int modifyid = 0;
                        if (dpl_customer.SelectedValue.Equals(""))
                        {
                            customeriId = 0;
                        }
                        else
                        {
                            customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
                        }

                        url = url + "&customerid=" + customeriId.ToString();
                        try
                        {
                            producttype = Convert.ToInt32(dpl_productTypeId.SelectedValue);
                        }
                        catch
                        { }

                        url = url + "&producttype=" + dpl_ismodify.SelectedValue;

                        modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);
                        DateTime startdate = Convert.ToDateTime("0001/1/1");
                        DateTime enddate = Convert.ToDateTime("0001/1/1");
                        try
                        {
                            if (txt_startdatetime.Text.Equals(""))
                            {
                                startdate = Convert.ToDateTime("0001/1/1");
                            }
                            else
                            {
                                startdate = Convert.ToDateTime(txt_startdatetime.Text);
                            }
                            if (txt_endstartdatetime.Text.Equals(""))
                            {
                                enddate = Convert.ToDateTime("0001/1/1");
                            }
                            else
                            {
                                enddate = Convert.ToDateTime(txt_endstartdatetime.Text);
                            }
                        }
                        catch { }

                        url = url + "&startdate=" + txt_startdatetime.Text + "&enddate=" + txt_endstartdatetime.Text + "&modifyid=" + dpl_ismodify.SelectedValue
                             + "&pageindex=" + MainDataGrid.CurrentPageIndex.ToString() + "&customermoduleid=" + dpl_customerModuleId.SelectedValue
                             + "&overstatus=" + dpl_overStatus.SelectedValue + "&key=" + TextBox_key.Text + "&datetype=" + dpl_datetime.SelectedValue;





                        Response.Redirect(url);
                    }

                }


            }

            bindData(MainDataGrid.CurrentPageIndex + 1);

        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        LinkButton lnkbutton = (LinkButton)sender;
                        string value = MainDataGrid.DataKeys[item.ItemIndex].ToString();

                        ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
                        OrderDesignInfo oi = order.GetOrderDesignByModuleId(value);

                        OrderView.bindDate(oi.Id, false);



                        ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "popupDiv('pop-div')", true);
                        break;

                    }

                }

            }

            bindData(MainDataGrid.CurrentPageIndex + 1);
        }
        protected void lnkbutton_project_Click(object sender, EventArgs e)
        {
            string ModuleId = null;
            string ModifyModuleId = null;
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        ModuleId = (string)MainDataGrid.DataKeys[item.ItemIndex];
                        break;
                    }
                }
            }

            if (string.IsNullOrWhiteSpace(ModuleId))
            {
                //resultLabel.Text = "Project name is required.";
                return;
            }

            if (ModuleId.IndexOf("-") > -1)
            {
                ModifyModuleId = ModuleId;
                ModuleId = ModuleId.Substring(0, ModuleId.IndexOf("-"));
            }


            string gitRootPath = @System.Configuration.ConfigurationSettings.AppSettings["GitPath"];
            string repoPath = Path.Combine(gitRootPath, ModuleId.Replace('~','_'));

            if (Directory.Exists(repoPath))
            {
                Label_Message.Text = "Project already exists.";
                return;
            }

            try
            {
                // Create project directory
                Directory.CreateDirectory(repoPath);

                // Initialize the Git repository
                Repository.Init(repoPath, isBare: true);

                new OrderDesign().updateOrderDesignRepository(ModuleId, 1);

                

                Label_Message.Text = "文檔中心項目建立成功";
                //resultLabel.Text = "Project and repository created successfully.";
            }
            catch (TypeInitializationException ex)
            {
                // Log detailed information
                Log.WriteLog("giterror","Type Initialization Exception: " + ex.InnerException?.Message);
                Log.WriteLog("giterror","Stack Trace: " + ex.InnerException?.StackTrace);
            }
            catch (Exception ex)
            {
                new OrderDesign().updateOrderDesignRepository(ModuleId, 0);
                Label_Message.Text = "Error creating project: " + ex.Message;
                //resultLabel.Text = "Error creating project: " + ex.Message;
            }
        }


        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL");

            string ModuleId = null;



            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        ModuleId = (string)MainDataGrid.DataKeys[item.ItemIndex];
                        break;
                    }
                }
            }



            if (ModuleId != null)
            {
                if (System.Configuration.ConfigurationSettings.AppSettings["IsPart"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["IsPart"]))
                {
                    Label_Message.Text = new OrderDesign().deleteOrderDesign(ModuleId);
                }
                else
                {
                    ProjectInfo pi = new Project().GetProjectInfoByModuleid(ModuleId);
                    if (pi != null && pi.MODIFYID != null)
                    {
                        Label_Message.Text = "修模單只能在模具變更中刪除";
                        bindData(MainDataGrid.CurrentPageIndex + 1);
                        return;
                    }
                    ModuleWorkFlow.business.Order order = new ModuleWorkFlow.business.Order();
                    ModuleWorkFlow.BLL.DesignPartProcess dpp = new DesignPartProcess();
                    ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();

                    order.setModuleId(ModuleId);

                    if (order.CheckOrderForBom(ModuleId) == 0)
                    {
                        if (dpp.getAllPartProcessByModuleid(ModuleId).Count == 0)
                        {
                            if (part.GetAllPartNo(ModuleId).Count == 0)
                            {
                                OrderDesignInfo orderDesignInfo = new OrderDesign().GetOrderDesignByNo(ModuleId);
                                if (orderDesignInfo == null)
                                {
                                    Label_Message.Text = "模具已刪除，請刷新后重新選擇";
                                    return;
                                }
                                if (order.Remove() < 1)
                                {
                                    Label_Message.Text = Lang.TXT_OPERATIONERROR;
                                }
                                else
                                {
                                    string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["ERPInterface"];
                                    if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
                                    {

                                        //SystemInterFace erppdminterface = new SystemInterFace();

                                        //Label_Message.Text = erppdminterface.updateFromAmd(orderDesignInfo, null, "order", false, "U");
                                        //if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                                        //{
                                        //    Label_Message.Text = erppdminterface.updateFromAmd(orderDesignInfo, null, "orderpart", false, "U");
                                        //}



                                    }
                                    else
                                    {
                                        Label_Message.Text = Lang.TXT_DELETESUCCESS;
                                    }
                                }
                            }
                            else
                            {
                                Label_Message.Text = Lang.BomType_Delete;
                            }
                        }
                        else
                        {
                            Label_Message.Text = "存在模具設計,不能刪除;";
                        }
                    }
                    else
                    {
                        Label_Message.Text = "此訂單已導入BOM，請先清除相關記錄後再刪除訂單";
                    }

                }

                MainDataGrid.EditItemIndex = -1;
                int erroypage = MainDataGrid.CurrentPageIndex;

                try
                {
                    bindData(MainDataGrid.CurrentPageIndex + 1);
                }
                catch (Exception eemsg)
                {
                    string ssmsg = eemsg.Message.ToString();
                    MainDataGrid.CurrentPageIndex = erroypage - 1;
                    bindData(MainDataGrid.CurrentPageIndex + 1);
                }
            }
            else
            {
                bindData(MainDataGrid.CurrentPageIndex + 1);
            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "";
            MainDataGrid.CurrentPageIndex = 0;
            bindData(MainDataGrid.CurrentPageIndex + 1);
            Session["page"] = null;
        }

        private string createOrderReport()
        {
            ICreateOrderReport createOrder = CreateOrderReportFactory.Create("CreateOrder");
            string outfliename = "";
            ArrayList modules = new ArrayList();
            IList source = new ArrayList();
            foreach (DataGridItem item in MainDataGrid.Items)
            {

                CheckBox chk_datagrid = item.FindControl("chk_datagrid") as CheckBox;
                if (chk_datagrid.Checked)
                {

                    modules.Add(MainDataGrid.DataKeys[item.ItemIndex].ToString());
                }
            }
            if (Session["page"] != null)
            {
                Hashtable hPage = Session["page"] as Hashtable;
                if (hPage.ContainsKey(MainDataGrid.CurrentPageIndex))
                {
                    hPage.Remove(MainDataGrid.CurrentPageIndex);
                }

                foreach (int pageIndex in hPage.Keys)
                {
                    modules.AddRange(hPage[pageIndex] as IList);
                }
            }

            if (modules.Count > 0)
            {
                OrderDesign orderDesign = new OrderDesign();
                foreach (string moduelid in modules)
                {
                    OrderDesignInfo odi = orderDesign.GetOrderDesignByModuleId(moduelid);
                    source.Add(odi);
                }
                outfliename = createOrder.createOrderReprot(source);
            }
            else
            {
                int customeriId = 0;
                int producttype = 0;
                int modifyid = 0;
                if (dpl_customer.SelectedValue.Equals(""))
                {
                    customeriId = 0;
                }
                else
                {
                    customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
                }
                try
                {
                    producttype = Convert.ToInt32(dpl_productTypeId.SelectedValue);
                }
                catch
                { }
                modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);
                DateTime startdate = Convert.ToDateTime("0001/1/1");
                DateTime enddate = Convert.ToDateTime("0001/1/1");
                try
                {
                    if (txt_startdatetime.Text.Equals(""))
                    {
                        startdate = Convert.ToDateTime("0001/1/1");
                    }
                    else
                    {
                        startdate = Convert.ToDateTime(txt_startdatetime.Text);
                    }
                    if (txt_endstartdatetime.Text.Equals(""))
                    {
                        enddate = Convert.ToDateTime("0001/1/1");
                    }
                    else
                    {
                        enddate = Convert.ToDateTime(txt_endstartdatetime.Text);
                    }
                }
                catch { }

                ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
                int customerModuleId = -1;
                if (!dpl_customerModuleId.SelectedValue.Equals(""))
                    customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);
                string sqlstring = "AND " + order.getOrderSql(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, Convert.ToInt32(dpl_model.SelectedValue), Convert.ToInt16(dpl_projectDepartMent.SelectedValue), txt_productname.Text.Trim());


                outfliename = createOrder.createOrderReprot(sqlstring);
            }

            return outfliename;
        }

        protected void lnkbutton_print_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "報表產生中....";
            ReporttemplateInfo rti = new Reporttemplate().GetReporttemplateByNo("OrderSettingInfo.xls");
            if (rti != null)
            {
                string downloadPath = createReport(rti.CreateClass, rti.CreateExeclClass);
                Label_Message.Text = "<a href='" + downloadPath.Replace("//", "/") + "'>打開報表</a>";
            }
            bindData(MainDataGrid.CurrentPageIndex + 1);
        }

        protected string createReport(string createClass, string createExeclClass)
        {
            IList FactSource = getDataByOrderDesign();
            OverReason overReason = new OverReason();

            foreach (OrderDesignInfo ord in FactSource)
            {
                OverReasonInfo ori = overReason.findbykey(Convert.ToInt32(ord.OverreasonId));
                if (ori != null)
                {
                    ord.OverReason = ori.Reason;
                }

                if (ord.StatusId != null)
                {
                    if (ord.StatusId.Equals("Ready"))
                    {
                        ord.StatusId = "就緒";
                    }
                    else if (ord.StatusId.Equals("Holdon"))
                    {
                        ord.StatusId = "暫停";
                    }
                    else if (ord.StatusId.Equals("Cancel"))
                    {
                        ord.StatusId = "取消";
                    }
                }

                if (ord.DistanceT0Day != null)
                {
                    ord.DistanceT0Day = Math.Round(ord.DistanceT0Day, 2);
                }
            }

            //ScheduleInfo titleInfo = new ScheduleInfo();
            ////  titleInfo.ModuleId = "磨具编号";
            //foreach (ScheduleInfo si in source)
            //{
            //    IList subschedules = new Schedule().GetMachineSchedules(si.ProcessId, startdate, enddate, si.MachinId);
            //    // subschedules.Insert(0, titleInfo);
            //    si.SubSchedules = subschedules;
            //}
            string str = null;
            BLL.StupidReport.NOPIStuipReport st = new NOPIStuipReport();
            str = st.CreateReport("OrderSettingInfo.xls", FactSource);
            //MainDatagrid.DataSource = source;
            //MainDatagrid.DataBind();
            return str;
        }

        public IList getDataByOrderDesign()
        {
            ModuleWorkFlow.BLL.StupidReport.StupidReport report = new ModuleWorkFlow.BLL.StupidReport.StupidReport();
            IList source = new ArrayList();

            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();

            ModuleWorkFlow.BLL.Schedule schedule = new ModuleWorkFlow.BLL.Schedule();


            int customeriId = 0;
            int producttype = 0;
            int modifyid = 0;
            if (dpl_customer.SelectedValue.Equals(""))
            {
                customeriId = 0;
            }
            else
            {
                customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
            }
            try
            {
                producttype = Convert.ToInt32(dpl_productTypeId.SelectedValue);
            }
            catch
            { }
            modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);


            DateTime startdate = Convert.ToDateTime("0001/1/1");
            DateTime enddate = Convert.ToDateTime("0001/1/1");
            try
            {
                if (txt_startdatetime.Text.Equals(""))
                {
                    startdate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    startdate = Convert.ToDateTime(txt_startdatetime.Text);
                }
                if (txt_endstartdatetime.Text.Equals(""))
                {
                    enddate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    enddate = Convert.ToDateTime(txt_endstartdatetime.Text);
                }
            }
            catch { }

            int customerModuleId = -1;
            if (!dpl_customerModuleId.SelectedValue.Equals(""))
                customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);
            string sqlstring = "";
            if (dpl_overStatus.SelectedValue.Equals("4"))
            {
                sqlstring = order.getOrderSql("Close", 3, customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, Convert.ToInt32(dpl_model.SelectedValue), Convert.ToInt16(dpl_projectDepartMent.SelectedValue), txt_productname.Text.Trim());
            }
            else
            {
                sqlstring = order.getOrderSql(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, Convert.ToInt32(dpl_model.SelectedValue), Convert.ToInt16(dpl_projectDepartMent.SelectedValue), txt_productname.Text.Trim());
            }

            string sqlorderby = lab_sort.Text;
            string orderdiection = null;
            if (sqlorderby.Trim().Equals(""))
            {
                sqlorderby = order.getOrderOrderBy();
            }
            else
            {
                string[] sort = lab_sort.Text.Split('|');
                sqlorderby = sort[0];
                orderdiection = sort[1];

            }
            // source = order.GetOrderListFast("tb_order", null, "id", MainDataGrid.CurrentPageIndex + 1, MainDataGrid.PageSize, "*", sqlorderby, sqlstring, orderdiection);
            source = order.GetOrderListFast("tb_order", null, "id", 1, MainDataGrid.VirtualItemCount, "*", sqlorderby, sqlstring, orderdiection);

            foreach (OrderDesignInfo odi in source)
            {
                for (int i = 0; i < dpl_customer.Items.Count; i++)
                {
                    if (odi.CustomerId.ToString().Equals(dpl_customer.Items[i].Value))
                    {
                        odi.CustomerName = dpl_customer.Items[i].Text.Trim();
                    }
                }
            }


            string modulelist = TextBox_key.Text.Trim();
            if (modulelist.Equals(""))
            {
                modulelist = "(";
                for (int i = 0; i < source.Count; i++)
                {
                    OrderDesignInfo oi = (OrderDesignInfo)source[i];
                    modulelist = modulelist + "'" + oi.ModuleId + "'";
                    if (i == source.Count - 1)
                    {
                        modulelist = modulelist + ")";
                    }
                    else
                    {
                        modulelist = modulelist + ",";
                    }
                }
            }
            return new ModuleWorkFlow.BLL.PartProcess().GetLastOrderDesing(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, modulelist, Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, source);
        }

        //protected void lnkbutton_printbarCode_Click(object sender, EventArgs e)
        //{
        //ArrayList partlists = new ArrayList();
        //ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();
        //foreach (DataGridItem item in MainDataGrid.Items)
        //{
        //    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //    {

        //        CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
        //        if (cb.Checked)
        //        {
        //            string ModuleId = (string)MainDataGrid.DataKeys[item.ItemIndex];
        //            IList parts = part.GetAllPartNo(ModuleId);
        //            partlists.AddRange(parts);

        //        }
        //    }
        //}

        //// PartBarCodeReport report = new PartBarCodeReport();
        //Label_Message.Text = "<a href='..\\excel\\" + report.CreatePartTxtBarReport(partlists, "barcode") + "'>(點擊這裡下載報表文件)</a>";
        //bindData(MainDataGrid.CurrentPageIndex + 1);

        //}

        protected void lnkbutton_copy_Click(object sender, EventArgs e)
        {
            string ModuleId = null;
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        ModuleId = (string)MainDataGrid.DataKeys[item.ItemIndex];
                        break;
                    }
                }
            }

            if (ModuleId == null)
            {
                Label_Message.Text = "請選擇訂單";
                bindData(MainDataGrid.CurrentPageIndex + 1);
                return;
            }
            else
            {
                Response.Redirect("../OrderCopy.aspx?moduleid=" + ModuleId);
            }
        }



        protected void dpl_customerModuleId_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindData(MainDataGrid.CurrentPageIndex + 1);
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            string url = "OrderDesignView.aspx";
            int customeriId = 0;
            int producttype = 0;
            int modifyid = 0;
            if (dpl_customer.SelectedValue.Equals(""))
            {
                customeriId = 0;
            }
            else
            {
                customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
            }

            url = url + "?customerid=" + customeriId.ToString();
            try
            {
                producttype = Convert.ToInt32(dpl_productTypeId.SelectedValue);
            }
            catch
            { }

            url = url + "&producttype=" + dpl_ismodify.SelectedValue;

            modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);
            DateTime startdate = Convert.ToDateTime("0001/1/1");
            DateTime enddate = Convert.ToDateTime("0001/1/1");
            try
            {
                if (txt_startdatetime.Text.Equals(""))
                {
                    startdate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    startdate = Convert.ToDateTime(txt_startdatetime.Text);
                }
                if (txt_endstartdatetime.Text.Equals(""))
                {
                    enddate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    enddate = Convert.ToDateTime(txt_endstartdatetime.Text);
                }
            }
            catch { }

            url = url + "&startdate=" + txt_startdatetime.Text + "&enddate=" + txt_endstartdatetime.Text + "&modifyid=" + dpl_ismodify.SelectedValue
                 + "&pageindex=" + MainDataGrid.CurrentPageIndex.ToString() + "&customermoduleid=" + dpl_customerModuleId.SelectedValue
                 + "&overstatus=" + dpl_overStatus.SelectedValue + "&key=" + TextBox_key.Text + "&datetype=" + dpl_datetime.SelectedValue;




            Response.Redirect(url);
        }

        protected void lnkbutton_mail_Click(object sender, EventArgs e)
        {
            int customeriId = 0;
            int producttype = 0;
            int modifyid = 0;
            if (dpl_customer.SelectedValue.Equals(""))
            {
                customeriId = 0;
            }
            else
            {
                customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
            }
            try
            {
                producttype = Convert.ToInt32(dpl_productTypeId.SelectedValue);
            }
            catch
            { }
            modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);
            DateTime startdate = Convert.ToDateTime("0001/1/1");
            DateTime enddate = Convert.ToDateTime("0001/1/1");
            try
            {
                if (txt_startdatetime.Text.Equals(""))
                {
                    startdate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    startdate = Convert.ToDateTime(txt_startdatetime.Text);
                }
                if (txt_endstartdatetime.Text.Equals(""))
                {
                    enddate = Convert.ToDateTime("0001/1/1");
                }
                else
                {
                    enddate = Convert.ToDateTime(txt_endstartdatetime.Text);
                }
            }
            catch { }

            ArrayList modules = new ArrayList();
            IList source = new ArrayList();
            foreach (DataGridItem item in MainDataGrid.Items)
            {

                CheckBox chk_datagrid = item.FindControl("chk_datagrid") as CheckBox;
                if (chk_datagrid.Checked)
                {

                    modules.Add(MainDataGrid.DataKeys[item.ItemIndex].ToString());
                }
            }

            if (Session["page"] != null)
            {
                Hashtable hPage = Session["page"] as Hashtable;
                if (hPage.ContainsKey(MainDataGrid.CurrentPageIndex))
                {
                    hPage.Remove(MainDataGrid.CurrentPageIndex);
                }

                foreach (int pageIndex in hPage.Keys)
                {
                    ((ArrayList)modules).AddRange(hPage[pageIndex] as IList);
                }
            }

            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();

            int customerModuleId = -1;
            if (!dpl_customerModuleId.SelectedValue.Equals(""))
                customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);
            string sqlstring = "AND " + order.getOrderSql(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, Convert.ToInt32(dpl_model.SelectedValue), Convert.ToInt16(dpl_projectDepartMent.SelectedValue), txt_productname.Text.Trim());
            if (modules.Count > 0)
            {
                OrderDesign orderDesign = new OrderDesign();
                foreach (string moduelid in modules)
                {
                    OrderDesignInfo odi = orderDesign.GetOrderDesignByModuleId(moduelid);
                    source.Add(odi);
                }
            }
            if (source.Count == 0)
            {
                source = order.GetOrderDesignInfos(sqlstring);
            }
            string subject = dpl_customerModuleId.SelectedItem.Text;

            foreach (OrderDesignInfo odi in source)
            {
                if (source.IndexOf(odi) == 0)
                {
                    if (odi.ModuleId.IndexOf("-") > 0)
                    {
                        subject += "修模通知";
                    }
                    else
                    {
                        subject += "新模通知";
                    }
                }
                subject += "," + odi.MoldName + "-" + odi.ModuleId;

                if (odi.StatusId != null)
                {
                    if (odi.StatusId.Equals("Ready"))
                    {
                        odi.StatusId = "就緒";
                    }
                    else if (odi.StatusId.Equals("Holdon"))
                    {
                        odi.StatusId = "暫停";
                    }
                    else if (odi.StatusId.Equals("Cancel"))
                    {
                        odi.StatusId = "取消";
                    }
                }

                if (odi.ModelType != null)
                {
                    if (odi.ModelType.Equals(0))
                    {
                        odi.ModelTypeName = "模具";
                    }
                    else if (odi.ModelType.Equals(1))
                    {
                        odi.ModelTypeName = "零件";
                    }
                }

                if (odi.Priority != null)
                {
                    odi.Priority = Convert.ToInt32(Priority.getPrioriName(odi.Priority));
                }
            }

            Label_Message.Text = new SendAlert().sendAlert("OrderAddNotice", source, subject);

            bindData(MainDataGrid.CurrentPageIndex + 1);


        }

        protected void lnk_schedule_Click(object sender, EventArgs e)
        {
            SystemInterFace sysInterface = new SystemInterFace();
            //sysInterface.insertNewToAmd()
            Label_Message.Text = sysInterface.updateToAmd("order");
            bindData(MainDataGrid.CurrentPageIndex + 1);
        }

        protected void MainDataGrid_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            lab_sort.Text = e.SortExpression;
            bindData(1);
        }

        [WebMethod]
        public static string getDiscardInfo(string moduleidpartno)
        {

            string tablestyle = "<table border ='0'>";




            string tablesyyleprocess = "";
            string headerstryleprocess = "<table  border ='0'>"; ;
            double totalProcessNeedMinutes = 0.0;
            double totalFinishedMinutes = 0.0;

            Hashtable hfinishedMinutes = new Hashtable();


            string[] strmoduleiepartno = moduleidpartno.Split('|');
            string moduleId = strmoduleiepartno[0];
            string partNoId = strmoduleiepartno[1];
            Hashtable hpartprocess = new Hashtable();
            try
            {
                Discard discard = new Discard();
                IList allDiscards = discard.getListDiscardInfo(moduleId, partNoId);
                int finishedOrder = 0;
                Hashtable hdiscard = new Hashtable();
                Hashtable hFinisheddiscard = new Hashtable();
                foreach (DiscardInfo di in allDiscards)
                {
                    if (!hFinisheddiscard.ContainsKey(di.PartNoId))
                    {
                        hFinisheddiscard.Add(di.PartNoId, finishedOrder);
                    }

                    if (di.FactEndDate.Ticks > 0)
                    {
                        finishedOrder = di.ProcessOrder;
                        hFinisheddiscard[di.PartNoId] = finishedOrder;
                    }
                }
                IList PartProcesses = new ModuleWorkFlow.BLL.PartProcess().getPartProcessInfo(moduleId, partNoId);
                foreach (PartProcessInfo ppi in PartProcesses)
                {
                    totalProcessNeedMinutes += ppi.ProcessNeedMinutes;
                }
                foreach (string key in hFinisheddiscard.Keys)
                {
                    finishedOrder = Convert.ToInt32(hFinisheddiscard[key]);
                    foreach (PartProcessInfo ppi in PartProcesses)
                    {

                        if (ppi.ProcessOrder <= finishedOrder)
                        {
                            totalFinishedMinutes += ppi.ProcessNeedMinutes;
                        }
                        else
                        {
                            break;
                        }
                    }
                    hdiscard.Add(key, Convert.ToDouble(totalFinishedMinutes));
                    totalFinishedMinutes = 0.0;
                }




                ModuleWorkFlow.BLL.Status status = new BLL.Status();

                StatusInfo si = status.getStatusInfoById("Implementation")[0] as StatusInfo;


                ModuleWorkFlow.BLL.Part part = new BLL.Part();


                PartInfo partInfoname = new PartInfo();




                foreach (DiscardInfo di in allDiscards)
                {
                    partInfoname = part.getPartInfo(di.ModuleId, di.OldPartNoId.Substring(0, di.OldPartNoId.IndexOf("-")));

                    if (headerstryleprocess.Equals("<table  border ='0'>"))
                    {
                        headerstryleprocess += "<tr><td>模具編號</td><td>零件編號</td><td>零件名稱</td><td>完成率</td><td>零件小編號</td><td colspan='20' >工序</td>";
                    }



                    if (!hpartprocess.ContainsKey(di.ModuleId.Trim() + "+" + di.PartNoId.Trim()))
                    {
                        //if (totalProcessNeedMinutes == 0.0)
                        //{
                        //    tablesyyleprocess =  "0%";
                        //}
                        //else
                        //{
                        //    tablesyyleprocess = (Math.Round(Convert.ToDouble(hdiscard[di.PartNoId]) / totalProcessNeedMinutes, 3) * 100).ToString() + "%";
                        //}



                        tablesyyleprocess += "</tr>";
                        tablesyyleprocess += "<tr><td>" + di.ModuleId + "</td><td>" + di.OldPartNoId + "</td><td>" + partInfoname.PartName + "</td><td>完成率</td><td>" + di.PartNoId + "</td>";
                        if (totalProcessNeedMinutes == 0.0)
                        {
                            tablesyyleprocess = tablesyyleprocess.Replace("完成率", "0%");
                        }
                        else
                        {
                            tablesyyleprocess = tablesyyleprocess.Replace("完成率", (Math.Round(Convert.ToDouble(hdiscard[di.PartNoId]) / totalProcessNeedMinutes, 3) * 100).ToString() + "%");
                        }
                        totalProcessNeedMinutes = 0.0;
                        IBLLOutSourceDetail outsourceDetail = new OutSourceDetail();



                        PartProcessInfo ppinfo = new PartProcessInfo();
                        ppinfo.ModuleId = di.ModuleId;
                        ppinfo.PartNo = di.OldPartNoId.Substring(0, di.OldPartNoId.IndexOf("-"));
                        ppinfo.ProcessId = di.ProcessId;
                        ppinfo.ProcessName = di.ProcessName;

                        ppinfo.FactStartDate = di.FactStartDate;
                        ppinfo.FactEndDate = di.FactEndDate;
                        string color = "FFFFFF";
                        if (ppinfo.FactEndDate.Ticks > 0)
                        {
                            color = si.StatusColor.Substring(2).Trim();
                            ppinfo.StatusId = "Implementation";
                        }
                        else
                        {
                            ppinfo.StatusId = "Pending";
                        }


                        tablesyyleprocess += "<td bgcolor='#" + color + "' width='25px' height='25px'><a    title='" + new BLL.PartProcess().bindProcess(ppinfo, si, new Hashtable(), outsourceDetail) + "' ><font color='000000'>" + ppinfo.ProcessName + "</font></a><br></td>";
                        hpartprocess.Add(di.ModuleId.Trim() + "+" + di.PartNoId.Trim(), di.OldPartNoId);
                    }
                    else
                    {
                        IBLLOutSourceDetail outsourceDetail = new OutSourceDetail();



                        PartProcessInfo ppinfo = new PartProcessInfo();
                        ppinfo.ModuleId = di.ModuleId;
                        ppinfo.PartNo = di.OldPartNoId.Substring(0, di.OldPartNoId.IndexOf("-"));
                        ppinfo.ProcessId = di.ProcessId;
                        ppinfo.ProcessName = di.ProcessName;
                        ppinfo.FactStartDate = di.FactStartDate;
                        ppinfo.FactEndDate = di.FactEndDate;
                        string color = "FFFFFF";
                        if (ppinfo.FactEndDate.Ticks > 0)
                        {
                            color = si.StatusColor.Substring(2).Trim();
                            ppinfo.StatusId = "Implementation";
                        }
                        else
                        {
                            ppinfo.StatusId = "Pending";
                        }

                        tablesyyleprocess += "<td bgcolor='#" + color + "' width='25px' height='25px'><a    title='" + new BLL.PartProcess().bindProcess(ppinfo, si, new Hashtable(), outsourceDetail) + "' ><font color='000000'>" + ppinfo.ProcessName + "</font></a><br></td>";

                    }








                }


            }
            catch (Exception ex)
            {
                Log.WriteLog("log.txt", "error:" + ex.Message.ToString() + "行號：" + ex.StackTrace.ToString() + "方法:" + ex.TargetSite.ToString());
            }
            tablestyle += "</table>";


            //if (thisProcessNeedMinutes == 0.0)
            //{
            //    tablesyyleprocess = tablesyyleprocess.Replace("完成率", "0%");
            //}
            //else
            //{
            //    tablesyyleprocess = tablesyyleprocess.Replace("完成率", (Math.Round(thisProcessNeedMinutes / totalProcessNeedMinutes, 3) * 100) + "%".ToString());
            //}
            //  tablesyyleprocess += "</tr></table>";
            tablesyyleprocess = headerstryleprocess + tablesyyleprocess + "</tr></table>";
            return tablestyle + tablesyyleprocess;


        }

        [WebMethod]
        public static string getRelationDatabyProcessNo(int processno)
        {

            string tablestyle = "<table border ='1'>";


            //string tablestyle = " <table border ='1'> <tr  style='background-color:#E3E3E4'><td style='width:100px'>關聯零件</td><td>關聯零件名稱</td><td>工藝</td><td>零件狀態</td>" +
            //                   "<td>接單時間</td><td>預計開始</td><td>預計結束</td><td>實際開始</td><td>實際結束</td> <td>預估工時</td><td>關聯零件預估開始</td>" +
            //                   "<td>責任人</td>" +
            //               "</tr>";

            string tablesyyleprocess = "";
            string headerstryleprocess = "<table  border ='1'>"; ;
            Double totalProcessNeedMinutes = 0.0;
            Double thisProcessNeedMinutes = 0.0;

            try
            {
                PartprocessRelation partprocessRelation = new PartprocessRelation();
                IList relations = partprocessRelation.GetPartprocessRelationInfosByprocessno(processno);

                IList checkrelations = new PartprocessRelation().GetPartprocessRelationPartnoId(processno);

                Hashtable hcheckrelations = new Hashtable();
                foreach (PartprocessRelationInfo pprei in checkrelations)
                {
                    if (!hcheckrelations.Contains(pprei.ModuleId + "+" + pprei.PartNoId))
                    {
                        hcheckrelations.Add(pprei.ModuleId + "+" + pprei.PartNoId, pprei.PartNoId);
                    }
                }

                ModuleWorkFlow.BLL.Status status = new BLL.Status();
                StatusInfo si;
                Hashtable hstatus = status.getKeyStatusInfo();

                ModuleWorkFlow.BLL.Part part = new BLL.Part();
                ModuleWorkFlow.BLL.PartProcess partprocess = new BLL.PartProcess();
                Hashtable hpartprocess = new Hashtable();


                foreach (PartprocessRelationInfo ppi in relations)
                {


                    IList newppilist = new ArrayList();

                    PartInfo partInfo = part.getPartInfoById(ppi.PartId);
                    string partnoid = partInfo.PartNo;

                    IList ppilist = partprocess.getListPartProcessInfoByModulePartNo(ppi.ModuleId, partnoid);
                    foreach (PartProcessInfo ppre in ppilist)
                    {
                        if (hcheckrelations.Contains(ppre.ModuleId + "+" + ppre.PartNo_Id))
                        {
                            newppilist.Add(ppre);
                        }
                    }

                    PartInfo partInfoname = new PartInfo();

                    string Relationstartdate = "";
                    string StartDay = "";
                    string EndDay = "";

                    string FactStartDate = "";
                    string FactEndDate = "";
                    int ProcessNeedMinutes = 0;


                    Hashtable hRelation = new Hashtable();

                    Hashtable ht = new BLL.Process().getProcessPriceByNeedSchedule(2);

                    foreach (PartProcessInfo ppinfo in newppilist)
                    {
                        partInfoname = part.getPartInfo(ppinfo.ModuleId, ppinfo.PartNo);
                        if (ht.ContainsKey(ppinfo.CustomerProcessId == null ? "" : ppinfo.CustomerProcessId) || ht.ContainsKey(ppinfo.ProcessId == null ? "" : ppinfo.ProcessId))
                        {
                            if (tablestyle.Equals("<table border ='1'>"))
                            {
                                tablestyle += "  <tr  style='background-color:#E3E3E4'><td style='width:100px'>關聯零件</td><td>關聯零件名稱</td><td>工藝</td><td>零件狀態</td>" +
                                   "<td>接單時間</td><td>預計開始</td><td>預計結束</td><td>實際開始</td><td>實際結束</td> <td>預估工時</td><td>關聯零件預估開始</td>" +
                                   "<td>責任人</td>" +
                               "</tr>";
                            }


                            ProcessNeedMinutes = ppinfo.ProcessNeedMinutes;
                            FactStartDate = ppinfo.FactStartDate.ToString().Equals("0001/1/1 0:00:00") ? "" : ppinfo.FactStartDate.ToString("MM-dd HH:mm");
                            FactEndDate = ppinfo.FactEndDate.ToString().Equals("0001/1/1 0:00:00") ? "" : ppinfo.FactEndDate.ToString("MM-dd HH:mm");
                            StartDay = ppinfo.StartDate.ToString().Equals("0001/1/1 0:00:00") ? "" : ppinfo.StartDate.ToString("MM-dd HH:mm");
                            EndDay = ppinfo.EndDate.ToString().Equals("0001/1/1 0:00:00") ? "" : ppinfo.EndDate.ToString("MM-dd HH:mm");

                            if (!FactStartDate.Equals(""))
                            {
                                StartDay = "";
                            }
                            if (!FactEndDate.Equals(""))
                            {
                                EndDay = "";
                            }

                            PartProcessInfo beRealtionPpi = partprocess.getPartProcessInfo(processno);
                            if (beRealtionPpi.StartDate.Ticks != 0)
                            {
                                Relationstartdate = beRealtionPpi.StartDate.ToString("MM-dd HH:mm");
                            }

                            si = (StatusInfo)hstatus[ppinfo.StatusId];

                            Double ProcessNeedhours = 0.0;
                            if (ProcessNeedMinutes < 6)
                            {
                                ProcessNeedhours = 0.1;
                            }
                            else
                            {
                                ProcessNeedhours = Math.Round(ProcessNeedMinutes / 60.0, 1);
                            }
                            string FactGetTime = ppinfo.FactGetTime.ToString().Equals("0001/1/1 0:00:00") ? "" : ppinfo.FactGetTime.ToString("MM-dd HH:mm");
                            tablestyle += "<tr><td>" + ppinfo.PartNo_Id + "</td><td>" + partInfoname.PartName + "</td><td>" + ppinfo.CustomerProcessId + "</td><td>" + si.StatusDesc +
                                "</td><td>" + FactGetTime + " </td><td>" + StartDay + "</td><td>" + EndDay + "</td><td>" + FactStartDate + "</td><td>" + FactEndDate + "</td>" +
                                "<td>" + ProcessNeedhours + "</td><td>" + Relationstartdate + "</td><td>" + ppinfo.UserName + "</td></tr>";
                        }
                        else
                        {
                            if (headerstryleprocess.Equals("<table  border ='1'>"))
                            {
                                headerstryleprocess += "<tr><td>模具編號</td><td>零件編號</td><td>零件名稱</td><td>完成率</td><td>零件小編號</td><td colspan='20' >工序</td>";
                            }



                            if (!hpartprocess.ContainsKey(ppinfo.ModuleId + "+" + ppinfo.PartNo_Id))
                            {
                                if (hpartprocess.Count > 0)
                                {


                                    if (thisProcessNeedMinutes == 0.0)
                                    {
                                        tablesyyleprocess = tablesyyleprocess.Replace("完成率", "0%");
                                    }
                                    else
                                    {
                                        tablesyyleprocess = tablesyyleprocess.Replace("完成率", (Math.Round(thisProcessNeedMinutes / totalProcessNeedMinutes, 3) * 100) + "%");
                                    }
                                    tablesyyleprocess += "</tr>";
                                    totalProcessNeedMinutes = 0.0;
                                    thisProcessNeedMinutes = 0.0;
                                }
                                tablesyyleprocess += "<tr><td>" + ppinfo.ModuleId + "</td><td>" + ppinfo.PartNo + "</td><td>" + partInfoname.PartName + "</td><td>完成率</td><td>" + ppinfo.PartNo_Id + "</td>";
                                hpartprocess.Add(ppinfo.ModuleId + "+" + ppinfo.PartNo_Id, ppinfo.PartNo_Id);
                            }
                            si = (StatusInfo)hstatus[ppinfo.StatusId];

                            totalProcessNeedMinutes += ppinfo.ProcessNeedMinutes;
                            if (ppinfo.FactEndDate != new DateTime() || ppinfo.FactOutTime != new DateTime())
                            {
                                thisProcessNeedMinutes += ppinfo.ProcessNeedMinutes;
                            }


                            IBLLOutSourceDetail outsourceDetail = new OutSourceDetail();

                            string tempprocessid = "";

                            if (ppinfo.CustomerProcessId == null || ppinfo.CustomerProcessId.Equals(""))
                            {
                                tempprocessid = ppinfo.ProcessId;
                            }
                            else
                            {
                                tempprocessid = ppinfo.CustomerProcessId;

                            }

                            if (ppinfo.NeedProduct == 0)
                            {
                                tablesyyleprocess += "<td bgcolor='#" + si.StatusColor.Substring(2).Trim() + "' width='25px' height='25px'><a    title='" + new BLL.PartProcess().bindProcess(ppinfo, si, hRelation, outsourceDetail) + "' ><font color='FFFFFF'>" + tempprocessid + "</font></a><br></td>";
                            }
                            else
                            {
                                tablesyyleprocess += "<td bgcolor='#" + si.StatusColor.Substring(2).Trim() + "' width='25px' height='25px'><a    title='" + new BLL.PartProcess().bindProcess(ppinfo, si, hRelation, outsourceDetail) + "' ><font color='000000'>" + tempprocessid + "</font></a><br></td>";
                            }
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Log.WriteLog("log.txt", "error:" + ex.Message.ToString() + "行號：" + ex.StackTrace.ToString() + "方法:" + ex.TargetSite.ToString());
            }
            tablestyle += "</table>";


            if (thisProcessNeedMinutes == 0.0)
            {
                tablesyyleprocess = tablesyyleprocess.Replace("完成率", "0%");
            }
            else
            {
                tablesyyleprocess = tablesyyleprocess.Replace("完成率", (Math.Round(thisProcessNeedMinutes / totalProcessNeedMinutes, 3) * 100) + "%".ToString());
            }
            //  tablesyyleprocess += "</tr></table>";
            tablesyyleprocess = headerstryleprocess + tablesyyleprocess + "</tr></table>";
            return tablestyle + tablesyyleprocess;


        }


    }
}
