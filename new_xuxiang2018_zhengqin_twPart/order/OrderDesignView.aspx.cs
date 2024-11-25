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
using System.Data.SqlClient;
using System.Reflection;


using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.business;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.System;
using Utility;
using WorkFlow.Model.Standard;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for OrderAdd.
    /// </summary>
    public class OrderDesignView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_HiddenModuleId;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
        protected System.Web.UI.WebControls.RequiredFieldValidator Requiredfieldvalidator2;
        protected System.Web.UI.WebControls.RequiredFieldValidator Requiredfieldvalidator4;
        protected System.Web.UI.WebControls.TextBox txt_moduleid;
        protected System.Web.UI.WebControls.Label lab_price;
        protected System.Web.UI.WebControls.TextBox txt_price;
        //protected System.Web.UI.WebControls.Label lab_customerModuleId;
        protected System.Web.UI.WebControls.DropDownList dpl_customerModuleId;
        protected System.Web.UI.WebControls.Label lab_signPrice;
        protected System.Web.UI.WebControls.TextBox txt_signPrice;
        protected System.Web.UI.WebControls.Label lab_creater;
        protected System.Web.UI.WebControls.TextBox txt_creater;
        protected System.Web.UI.WebControls.Label lab_ton;
        protected System.Web.UI.WebControls.TextBox txt_ton;
        protected System.Web.UI.WebControls.Label lab_referencePictureDate;
        protected System.Web.UI.WebControls.TextBox txt_referencePictureDate;
        protected System.Web.UI.WebControls.Label lab_lastPictureDate;
        protected System.Web.UI.WebControls.Label lab_tryDate3;
        protected System.Web.UI.WebControls.TextBox txt_tryDate3;
        protected System.Web.UI.WebControls.Label lab_YingYeDanDang;
        protected System.Web.UI.WebControls.DropDownList dpl_ProductTypeList;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_Status;
        protected System.Web.UI.WebControls.DropDownList dpl_customerid;
        protected System.Web.UI.WebControls.Label func;
        protected System.Web.UI.WebControls.TextBox txt_productname;
        protected System.Web.UI.WebControls.DropDownList dpl_material;
        protected System.Web.UI.WebControls.Label Label_HiddenFuncMode;
        protected System.Web.UI.WebControls.TextBox txt_lockManager;
        protected System.Web.UI.WebControls.TextBox txt_equipMent;
        protected System.Web.UI.WebControls.TextBox txt_hole;
        protected System.Web.UI.WebControls.TextBox txt_extractRate;
        protected System.Web.UI.WebControls.TextBox txt_YingYeDanDang;
        protected System.Web.UI.WebControls.TextBox txt_comment;
        protected System.Web.UI.WebControls.DropDownList dpl_isPart;
        protected System.Web.UI.WebControls.TextBox txt_startDate;
        protected System.Web.UI.WebControls.Label lab_companyProductId;
        protected System.Web.UI.WebControls.TextBox txt_companyProductId;
        protected System.Web.UI.WebControls.Label lab_hasPrice;
        protected System.Web.UI.WebControls.DropDownList dpl_hasprice;
        protected System.Web.UI.WebControls.Label lab_tryPrice;
        protected System.Web.UI.WebControls.TextBox txt_tryPrice;
        protected System.Web.UI.WebControls.Label lab_designEndDate;
        protected System.Web.UI.WebControls.TextBox txt_designEndDate;
        protected System.Web.UI.WebControls.TextBox txt_designStart;
        protected System.Web.UI.WebControls.Label lab_tryDate0;
        protected System.Web.UI.WebControls.TextBox txt_tryDate0;
        protected System.Web.UI.WebControls.Label lab_tryDate1;
        protected System.Web.UI.WebControls.TextBox txt_tryDate1;
        protected System.Web.UI.WebControls.Label lab_tryDate2;
        protected System.Web.UI.WebControls.TextBox txt_tryDate2;
        protected System.Web.UI.WebControls.TextBox txt_T3;
        protected System.Web.UI.WebControls.Label lab_tryDateF;
        protected System.Web.UI.WebControls.Table Table4;
        protected System.Web.UI.WebControls.TextBox txt_tryDateF;
        //protected System.Web.UI.WebControls.TextBox TextBox_Picture;
        protected System.Web.UI.WebControls.Label lab_checker;
        protected System.Web.UI.WebControls.TextBox txt_checker;
        protected System.Web.UI.WebControls.Label lab_checkDate;
        protected System.Web.UI.WebControls.TextBox txt_checkDate;
        protected System.Web.UI.WebControls.TextBox txt_ordersingle;
        protected System.Web.UI.WebControls.Label lab_merchindiseenddate;
        protected System.Web.UI.WebControls.TextBox txt_merchindiseEndDate;
        protected System.Web.UI.WebControls.Label lab_productenddate;
        protected System.Web.UI.WebControls.TextBox txt_productEndDate;
        protected System.Web.UI.WebControls.TextBox txt_productEndDate_time;
        protected System.Web.UI.WebControls.Label lab_gradeid;
        protected System.Web.UI.WebControls.TextBox txt_gradeid;
        //protected System.Web.UI.WebControls.DropDownList dpl_customerModuleid;
        protected System.Web.UI.WebControls.DropDownList dpl_priority;
        protected string moduleidshow = "";
        private ModuleWorkFlow.BLL.User user;
        private ModuleWorkFlow.BLL.NewOrder.PartOrderDesign partOrderDesign;
        protected System.Web.UI.WebControls.DropDownList dpl_difficultlevel;
        protected Label lab_customerid;
        protected Label lab_pageindex;
        protected Label lab_producttype;
        protected Label lab_modifyid;
        protected Label lab_startdate;
        protected Label lab_enddate;
        protected Label lab_customermoduleid;
        protected Label lab_overstatus;
        protected Label lab_key;
        protected Label lab_datetype;

        protected System.Web.UI.WebControls.TextBox txt_prductSize;
        protected System.Web.UI.WebControls.TextBox txt_avgThick;
        protected System.Web.UI.WebControls.TextBox txt_moldStruct;
        protected System.Web.UI.WebControls.TextBox txt_productApprance;
        protected System.Web.UI.WebControls.DropDownList dpl_cavMaterial;
        protected System.Web.UI.WebControls.DropDownList dpl_corMaterial;
        protected System.Web.UI.WebControls.TextBox txt_projectManager1;
        protected System.Web.UI.WebControls.TextBox txt_projectManager2;
        protected System.Web.UI.WebControls.DropDownList dpl_projectDepartMent;
        protected System.Web.UI.WebControls.DropDownList dpl_tryPlant;
        protected System.Web.UI.WebControls.DropDownList dpl_batchPlant;

        protected System.Web.UI.WebControls.DropDownList dpl_slideMaterial;
        protected System.Web.UI.WebControls.TextBox txt_pinNumber;
        protected System.Web.UI.WebControls.TextBox txt_slideCount;

        protected System.Web.UI.WebControls.FileUpload TextBox_Picture;

        protected UpdatePanel UpdatePanel1;


        protected string newname = "";
        protected System.Web.UI.WebControls.Label lab_picturename;

        protected System.Web.UI.WebControls.TextBox txt_toolingWeight;
        protected System.Web.UI.WebControls.TextBox txt_toolingSize;
        protected System.Web.UI.WebControls.DropDownList dpl_modelType;
        protected System.Web.UI.WebControls.TextBox txt_projectManager3;
        protected System.Web.UI.WebControls.TextBox txt_copyfrom;
        protected System.Web.UI.WebControls.Label lab_oldstatusid;
        private string menuid = "B01";

        protected string menuname;

        private void Page_Load(object sender, System.EventArgs e)
        {

            //this.
            //SystemInterFace sysinterface = new SystemInterFace();
            //IList orderdesigns = sysinterface.getNEWInterSchema("order");
            partOrderDesign = new ModuleWorkFlow.BLL.NewOrder.PartOrderDesign();
            user = new ModuleWorkFlow.BLL.User();
            
            if (!this.IsPostBack)
            {
                
                TmenuInfo mi = new Tmenu().findbykey(menuid);
                if (this.Master != null && this.Master is DefaultSub)
                {
                    DefaultSub master = (DefaultSub)this.Master;

                    master.Menuname = mi.Menuname;

                    menuname = mi.Menuname;
                }

                BindData();

                Label_Message.Text = "";

                lab_customerid.Text = Request.Params["customerid"];
                lab_pageindex.Text = Request.Params["pageindex"];
                lab_producttype.Text = Request.Params["producttype"];
                lab_modifyid.Text = Request.Params["modifyid"];
                lab_startdate.Text = Request.Params["startdate"];
                lab_enddate.Text = Request.Params["enddate"];
                lab_customermoduleid.Text = Request.Params["customermoduleid"];
                lab_overstatus.Text = Request.Params["overstatus"];
                lab_key.Text = Request.Params["key"];
                lab_datetype.Text = Request.Params["datetype"];


                string moduleid = Request.Params["moduleid"];

                if (moduleid != null)
                {
                    Label_HiddenModuleId.Text = moduleid;
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                    {
                        OrderDesignInfo orderDesigninfo = new OrderDesignInfo();
                        OrderDesign orderdesign = new OrderDesign();

                        orderDesigninfo = orderdesign.GetOrderDesignByNo(moduleid);
                        func.Text = "Edit";
                        initialEdit(orderDesigninfo);
                    }
                }
                else
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
                    {
                        InitalAddPage();
                    }
                }
                
              

            }
        }

        private void initpage()
        {

            string moduleid = Request.Params["moduleid"];

            ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
            IList ilist = ct.getControlTableByTableNameByIsVisible("tb_order", 0);
            int i = 1;
            TableRow tr = new TableRow();
            foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
            {
                bool only = false;
               
                if (cti.Isreadonly == 1)
                {
                    only = true;
                }

                
                TableCell tc = new TableCell();
                if (cti.IsVisible == 1)
                {
                    tc.Text = cti.TableValue;
                    tr.Cells.Add(tc);
                }
                tc = new TableCell();
                switch (cti.TableDateField)
                {
                    case "string":
                        TextBox tb = new TextBox();
                        tb.ID = cti.ControlName;
                       
                        tb.CssClass = cti.CssClass;
                        

                       
                        tb.CssClass = cti.CssClass;
                        
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                            tb.ReadOnly = only;
                        }
                        else
                        {
                            tb.Visible = false;
                        }

                      
                        tc.Controls.Add(tb);

                        if (!string.IsNullOrEmpty(cti.AssemblyPath) && !string.IsNullOrEmpty(cti.InstanceName) && !string.IsNullOrEmpty(cti.BindMethod))
                        {
                            tb.TextChanged += new EventHandler(trigger_event);
                            tb.AutoPostBack = true;
                            AsyncPostBackTrigger txtTrigger = new AsyncPostBackTrigger();
                            txtTrigger.ControlID = tb.ID;
                            txtTrigger.EventName = "TextChanged";
                            UpdatePanel1.Triggers.Add(txtTrigger);
                        }

                            
                        break;
                    case "userajx":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        tb.CssClass = cti.CssClass;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                            tb.ReadOnly = only;
                        }
                        else
                        {
                            tb.Visible = false;
                        }
                        AjaxControlToolkit.AutoCompleteExtender ace = new AjaxControlToolkit.AutoCompleteExtender();
                        ace.TargetControlID = cti.ControlName;
                        ace.ID = "AutoComplete_" + cti.ControlName;
                        ace.CompletionSetCount = 10;
                        ace.ServiceMethod = "GetCompleteList";
                        if (cti.TableField.Trim().Equals("CustomerId"))
                        {
                            ace.ServicePath = "../selectCustomer.asmx";
                        }
                        else
                        {
                            ace.ServicePath = "../selectUser.asmx";
                        }
                        ace.MinimumPrefixLength = 1;
                        ace.Enabled = true;
                        tc.Text = "<div class=ajaxposition></div>";
                        tc.Attributes.Add("class", "ajaxposition");
                        tc.Controls.Add(tb);
                        tc.Controls.Add(ace);

                        break;
                    case "modelajx":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;

                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                            tb.ReadOnly = only;
                        }
                        else
                        {
                            tb.Visible = false;
                        }
                        AjaxControlToolkit.AutoCompleteExtender mace = new AjaxControlToolkit.AutoCompleteExtender();
                        mace.TargetControlID = cti.ControlName;
                        mace.ID = "AutoComplete_" + cti.ControlName;
                        mace.CompletionSetCount = 10;
                        mace.ServiceMethod = "GetCompleteList";
                        mace.UseContextKey = true;
                        mace.ServicePath = "../selectModel.asmx";




                        mace.MinimumPrefixLength = 0;
                        mace.Enabled = true;
                        tc.Text = "<div class=ajaxposition></div>";
                        tc.Attributes.Add("class", "ajaxposition");
                        tc.Controls.Add(tb);
                        tc.Controls.Add(mace);

                        break;
                    case "moduleajx":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                            tb.ReadOnly = only;
                        }
                        else
                        {
                            tb.Visible = false;
                        }
                        AjaxControlToolkit.AutoCompleteExtender moduleauto = new AjaxControlToolkit.AutoCompleteExtender();
                        moduleauto.TargetControlID = cti.ControlName;
                        moduleauto.ID = "AutoComplete_" + cti.ControlName;
                        moduleauto.CompletionSetCount = 10;
                        moduleauto.ServiceMethod = "getModuleidlist";
                        //mace.UseContextKey = true;
                        moduleauto.ServicePath = "../selectModuleId.asmx";


                        moduleauto.MinimumPrefixLength = 0;
                        moduleauto.Enabled = true;
                        tc.Text = "<div class=ajaxposition></div>";
                        tc.Attributes.Add("class", "ajaxposition");
                        tc.Controls.Add(tb);
                        tc.Controls.Add(moduleauto);

                        break;
                    case "DateTime":
                        TextBox ic = new TextBox();
                        ic.ID = cti.ControlName;
                        ic.CssClass = cti.CssClass;
                        ic.Text = "";
                        if (!only)
                        {
                            AjaxControlToolkit.CalendarExtender cal = new AjaxControlToolkit.CalendarExtender();
                            cal.ID = "cal_" + cti.ControlName;
                            cal.TargetControlID = cti.ControlName;
                            cal.Format = "yy-MM-dd";
                            tc.Controls.Add(cal);
                        }
                        if (cti.IsVisible == 1)
                        {
                            ic.Visible = true;
                            ic.ReadOnly = only;
                        }
                        else
                        {
                            ic.Visible = false;
                        }

                        tc.Controls.Add(ic);
                        if (cti.TableField.Equals("TryDate0"))
                        {
                            IList hours = new ArrayList();
                            for (int j = 0; j < 24; j++)
                                hours.Add(j.ToString());

                            DropDownList drp_hours = new DropDownList();
                            drp_hours.ID = "drp_hours";
                            drp_hours.DataSource = hours;
                            drp_hours.DataBind();
                            tc.Controls.Add(drp_hours);

                            IList minuutes = new ArrayList();
                            minuutes.Add("00");
                            minuutes.Add("30");
                            DropDownList drp_minutes = new DropDownList();
                            drp_minutes.ID = "drp_minutes";
                            drp_minutes.DataSource = minuutes;
                            drp_minutes.DataBind();
                            tc.Controls.Add(drp_minutes);


                        }

                        if (!string.IsNullOrEmpty(cti.AssemblyPath) && !string.IsNullOrEmpty(cti.InstanceName) && !string.IsNullOrEmpty(cti.BindMethod))
                        {
                            ic.TextChanged += new EventHandler(trigger_event);
                            ic.AutoPostBack = true;
                            AsyncPostBackTrigger txtTrigger = new AsyncPostBackTrigger();
                            txtTrigger.ControlID = ic.ID;
                            txtTrigger.EventName = "TextChanged";
                            UpdatePanel1.Triggers.Add(txtTrigger);
                        }
                        break;
                    case "DateTimePick":
                        ic = new TextBox();
                        ic.ID = cti.ControlName;
                        ic.CssClass = cti.CssClass;
                        ic.Text = "";
                        if (!only)
                        {
                            AjaxControlToolkit.CalendarExtender cal = new AjaxControlToolkit.CalendarExtender();
                            cal.ID = "cal_" + cti.ControlName;
                            cal.TargetControlID = cti.ControlName;
                            cal.Format = "yy-MM-dd";
                            tc.Controls.Add(cal);
                        }
                       
                        tc.Controls.Add(ic);
                        break;
                    case "Int":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                            tb.ReadOnly = only;
                        }
                        else
                        {
                            tb.Visible = false;
                        }

                        tc.Controls.Add(tb);

                        break;
                    case "Double":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                            tb.ReadOnly = only;
                        }
                        else
                        {
                            tb.Visible = false;
                        }

                        tc.Controls.Add(tb);
                        break;
                    case "DropDownList":
                        DropDownList ddl = new DropDownList();
                        ddl.CssClass = cti.CssClass;
                        ddl.ID = cti.ControlName;
                        ddl.AutoPostBack = true;
                        //tb.c = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            ddl.Visible = true;
                            ddl.Enabled = !only;
                        }
                        else
                        {
                            ddl.Visible = false;
                        }

                        if (cti.ControlName.Equals("dpl_priority") && ddl.Visible)
                        {
                            ddl.SelectedIndex = 1;
                        }

                        if (cti.ControlName.Equals("dpl_ProductTypeList") && ddl.Visible)
                        {
                            ddl.AutoPostBack = false;
                            DropDownList parentddl = new DropDownList();
                            parentddl.ID = "dpl_parentTypeId";
                            parentddl.AutoPostBack = true;
                            tc.Controls.Add(parentddl);
                        }

                        if (cti.CssClass != null && !cti.CssClass.Equals(""))
                        {
                            ddl.CssClass = cti.CssClass;
                        }

                        //if (cti.ControlName.Equals("dpl_difficultLevel") && ddl.Visible)
                        //{
                        //    ListItem itema = new ListItem("A", "A");
                        //    ListItem itemb = new ListItem("B", "B");
                        //    ListItem itemc = new ListItem("C", "C");
                        //    ListItem itemd = new ListItem("D", "D");
                        //    ddl.AutoPostBack = false;
                        //    ddl.Items.Add(itema);
                        //    ddl.Items.Add(itemb);
                        //    ddl.Items.Add(itemc);
                        //    ddl.Items.Add(itemd);
                        //    ddl.DataBind();
                        //}
                        if (cti.TableField.Equals("ClientModuleId"))
                        {
                            ddl.SelectedIndexChanged += new System.EventHandler(this.dpl_SelectedIndexChanged);
                            ddl.AutoPostBack = true;
                        }
                        tc.Controls.Add(ddl);

                        if (!string.IsNullOrEmpty(cti.AssemblyPath) && !string.IsNullOrEmpty(cti.InstanceName) && !string.IsNullOrEmpty(cti.BindMethod))
                        {
                            ddl.SelectedIndexChanged += new System.EventHandler(this.trigger_event);

                            ddl.AutoPostBack = true;

                            AsyncPostBackTrigger ddlTrigger = new AsyncPostBackTrigger();
                            ddlTrigger.ControlID = ddl.ID;
                            ddlTrigger.EventName = "SelectedIndexChanged";
                            UpdatePanel1.Triggers.Add(ddlTrigger);
                        }

                      

                        break;
                    case "Image":
                        FileUpload fu = new FileUpload();
                        fu.ID = cti.ControlName;
                        if (cti.IsVisible == 1)
                        {
                            fu.Visible = true;
                            fu.Enabled = !only;
                        }
                        else
                        {
                            fu.Visible = false;
                        }

                        tc.Controls.Add(fu);
                        //Button btn = new Button();
                        //btn.ID = "btn_up";
                        //btn.Text = "上傳圖片";




                        tc.Attributes.Add("width", "30px");
                        //tc.Controls.Add(btn);
                        break;

                    case "checkbox":
                        CheckBox chk = new CheckBox();
                        chk.ID = cti.ControlName;
                        if (cti.IsVisible == 1)
                        {
                            chk.Visible = true;
                        }
                        else
                        {
                            chk.Visible = false;
                        }
                        tc.Controls.Add(chk);
                        break;

                }
                tr.Cells.Add(tc);
                if (i % 2 == 0)
                {
                    Table4.Rows.Add(tr);
                    tr = new TableRow();
                }
                if ((i >= ilist.Count) && (i + 1) % 2 == 0)
                {
                    Table4.Rows.Add(tr);
                    tr = new TableRow();
                }

                i++;
            }
            TableRow trvisible = new TableRow();
            ilist = ct.getControlTableByTableNameByNoIsVisible("tb_order");
            foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
            {
                TableCell tc = new TableCell();
                if (cti.IsVisible == 1)
                {
                    tc.Text = cti.TableValue;
                    trvisible.Cells.Add(tc);
                }
                tc = new TableCell();
                switch (cti.TableDateField)
                {
                    case "string":
                        TextBox tb = new TextBox();
                        tb.ID = cti.ControlName;
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                        }
                        else
                        {
                            tb.Visible = false;
                        }

                        tc.Controls.Add(tb);
                        break;
                    case "userajx":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                        }
                        else
                        {
                            tb.Visible = false;
                        }
                        tc.Controls.Add(tb);
                        //if (cti.IsVisible == 1)
                        //{
                        //    str += "<div class=ajaxposition><ajaxToolkit:AutoCompleteExtender ID=AutoComplete" + cti.ControlName + " runat=server ServiceMethod=GetCompleteList ServicePath=../selectUser.asmx Enabled=true MinimumPrefixLength=1 CompletionSetCount=10 TargetControlID=" + cti.ControlName + "></ajaxToolkit:AutoCompleteExtender></div>";
                        //}
                        //else
                        //{
                        //    str += "<div class=ajaxposition></asp:textbox><ajaxToolkit:AutoCompleteExtender ID=AutoComplete" + cti.ControlName + " runat=server ServiceMethod=GetCompleteList ServicePath=../selectUser.asmx Enabled=true MinimumPrefixLength=1 CompletionSetCount=10 TargetControlID=" + cti.ControlName + "></ajaxToolkit:AutoCompleteExtender></div>";
                        //}
                        //pg.Controls.Add(tb);
                        break;
                    case "modelajx":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                        }
                        else
                        {
                            tb.Visible = false;
                        }
                        tc.Controls.Add(tb);
                        if (cti.IsVisible == 1)
                        {
                            AjaxControlToolkit.AutoCompleteExtender AutoCompleteExtender2 = new AjaxControlToolkit.AutoCompleteExtender();
                            AutoCompleteExtender2.ID = "AutoCompleteExtender2";
                            AutoCompleteExtender2.ServiceMethod = "getModuleidlist";
                            AutoCompleteExtender2.ServicePath = "~/selectModuleId.asmx";
                            AutoCompleteExtender2.Enabled = true;
                            AutoCompleteExtender2.MinimumPrefixLength = 1;
                            AutoCompleteExtender2.CompletionSetCount = 10;
                            tc.Controls.Add(AutoCompleteExtender2);
                        }
                        //else
                        //{
                        //    str += "<div class=ajaxposition></asp:textbox><ajaxToolkit:AutoCompleteExtender ID=AutoComplete" + cti.ControlName + " runat=server ServiceMethod=GetCompleteList ServicePath=../selectUser.asmx Enabled=true MinimumPrefixLength=1 CompletionSetCount=10 TargetControlID=" + cti.ControlName + "></ajaxToolkit:AutoCompleteExtender></div>";
                        //}
                        //pg.Controls.Add(tb);
                        break;
                    case "DateTime":
                        TextBox ic = new TextBox();
                        ic.ID = cti.ControlName;
                        ic.Text = "";

                        if (cti.IsVisible == 1)
                        {
                            ic.Visible = true;

                        }
                        else
                        {
                            ic.Visible = false;
                        }
                        tc.Controls.Add(ic);
                        break;
                    case "DateTimePick":
                        ic = new TextBox();
                        ic.ID = cti.ControlName;
                        ic.Text = "";
                        TextBox tic = new TextBox();
                        tic.ID = cti.ControlName + "_time";
                        tic.Text = "00:00";
                        tic.CssClass = "timepicker";
                        if (cti.IsVisible == 1)
                        {
                            ic.Visible = true;
                            tic.Visible = true;

                        }
                        else
                        {
                            ic.Visible = false;
                        }
                        tc.Controls.Add(ic);
                        tc.Controls.Add(tic);
                        break;
                    case "Int":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                        }
                        else
                        {
                            tb.Visible = false;
                        }
                        tc.Controls.Add(tb);

                        break;
                    case "Double":
                        tb = new TextBox();
                        tb.ID = cti.ControlName;
                        //tb.Location = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            tb.Visible = true;
                        }
                        else
                        {
                            tb.Visible = false;
                        }
                        tc.Controls.Add(tb);
                        break;
                    case "DropDownList":
                        DropDownList ddl = new DropDownList();
                        ddl.ID = cti.ControlName;
                        //tb.c = new Point(100, 200);//
                        if (cti.IsVisible == 1)
                        {
                            ddl.Visible = true;
                        }
                        else
                        {
                            ddl.Visible = false;
                        }

                        tc.Controls.Add(ddl);
                        break;
                    case "Image":
                        FileUpload fu = new FileUpload();
                        fu.ID = cti.ControlName;
                        if (cti.IsVisible == 1)
                        {
                            fu.Visible = true;
                        }
                        else
                        {
                            fu.Visible = false;
                        }

                        tc.Controls.Add(fu);
                        tc.Attributes.Add("width", "30px");

                        break;
                    case "checkbox":
                        CheckBox chk = new CheckBox();
                        chk.ID = cti.ControlName;
                        if (cti.IsVisible == 1)
                        {
                            chk.Visible = true;
                        }
                        else
                        {
                            chk.Visible = false;
                        }
                        tc.Controls.Add(chk);
                        break;
                }
                trvisible.Cells.Add(tc);


            }
            Table4.Rows.Add(trvisible);


        }

       

        protected void trigger_event(object sender, EventArgs e)
        {
            ControlTable ct = new ControlTable();
            

            ControlTableInfo cti = ct.GetTableByControlName("tb_order", (sender as WebControl).ID);
            
            
            if (cti.AssemblyPath != null && cti.InstanceName != null && cti.BindMethod != null)
            {
                Object[] args;
                if (!string.IsNullOrEmpty(cti.ParamControl))
                {
                    string[] controlName = cti.ParamControl.Split(',');
                    args = new Object[controlName.Length];

                    for (int i = 0; i < controlName.Length; i++)
                    {
                        if (((TextBox)Table4.FindControl(controlName[i])) != null)
                            args[i] = ((TextBox)Table4.FindControl(controlName[i])).Text;
                    }
                }
                else
                {
                    args = new Object[1];
                    if (sender is TextBox)
                        args[0] = (sender as TextBox).Text;
                    else
                        args[0] = (sender as DropDownList).SelectedValue;
                }

                Object dataBind = Assembly.Load(cti.AssemblyPath).CreateInstance(cti.InstanceName);
                string EffectiveControl = cti.EffectiveControl;
                if (EffectiveControl.IndexOf("dpl_") > -1)
                    ((DropDownList)Table4.FindControl(EffectiveControl)).SelectedValue = Reflector.CallMethod(dataBind, cti.BindMethod, args).ToString();
                else
                    ((TextBox)Table4.FindControl(EffectiveControl)).Text = Reflector.CallMethod(dataBind, cti.BindMethod, args).ToString();

            }

           
        }

        private void InitalAddPage()
        {
            string initalDate = string.Format("{0:yyyy-MM-dd}", (DateTime.Now));
            ((TextBox)Table4.FindControl("txt_checkDate")).Text = initalDate;

            //Table4.Rows.c
            if (((TextBox)Table4.FindControl("txt_referencePictureDate")) != null)
            {
                ((TextBox)Table4.FindControl("txt_referencePictureDate")).Text = initalDate;
            }

            //txt_lastPictureDate.Text = initalDate;
            if (((TextBox)Table4.FindControl("txt_tryDate0")) != null)
            {
                ((TextBox)Table4.FindControl("txt_tryDate0")).Text = initalDate;
                trigger_event(((TextBox)Table4.FindControl("txt_tryDate0")), EventArgs.Empty);
            }

            if (((DropDownList)Table4.FindControl("drp_hours")) != null)
            {
                ((DropDownList)Table4.FindControl("drp_hours")).SelectedValue = "23";
            }

            if (((DropDownList)Table4.FindControl("drp_minutes")) != null)
            {
                ((DropDownList)Table4.FindControl("drp_minutes")).SelectedValue = "30";
            }

            //.Text = initalDate;
            if (((TextBox)Table4.FindControl("txt_tryDate1")) != null)
            {
                ((TextBox)Table4.FindControl("txt_tryDate1")).Text = initalDate;
            }
            //.Text = initalDate;
            if (((TextBox)Table4.FindControl("txt_tryDate2")) != null)
            {
                ((TextBox)Table4.FindControl("txt_tryDate2")).Text = initalDate;
            }
            //.Text = initalDate;
            if (((TextBox)Table4.FindControl("txt_tryDate3")) != null)
            {
                ((TextBox)Table4.FindControl("txt_tryDate3")).Text = initalDate;
            }
            //.Text = initalDate;
            if (((TextBox)Table4.FindControl("txt_tryDateF")) != null)
            {
                ((TextBox)Table4.FindControl("txt_tryDateF")).Text = initalDate;
            }
            //.Text = initalDate;
            //			txt_approdeDate.Text=initalDate;
            if (((TextBox)Table4.FindControl("txt_startDate")) != null)
            {
                ((TextBox)Table4.FindControl("txt_startDate")).Text = initalDate;
            }
            //.Text=initalDate;
            //			txt_merchindiseEndDate.Text=initalDate;
            if (((TextBox)Table4.FindControl("txt_designEndDate")) != null)
            {
                ((TextBox)Table4.FindControl("txt_designEndDate")).Text = initalDate;
            }

            if (((TextBox)Table4.FindControl("txt_designStart")) != null)
            {
                ((TextBox)Table4.FindControl("txt_designStart")).Text = initalDate;
            }

            //.Text=initalDate;
            //			txt_productEndDate.Text=initalDate;
            if (((TextBox)Table4.FindControl("txt_T3")) != null)
            {
                ((TextBox)Table4.FindControl("txt_T3")).Text = initalDate;
            }
            //.Text=initalDate;
            //txt_flashCheckDate.Text = initalDate;
            if (((TextBox)Table4.FindControl("txt_merchindiseEndDate")) != null)
            {
                ((TextBox)Table4.FindControl("txt_merchindiseEndDate")).Text = initalDate;
            }
            //.Text=initalDate;
            //if (((TextBox)Table4.FindControl("txt_productEndDate")) != null)
            //{
            //    ((TextBox)Table4.FindControl("txt_productEndDate")).Text = initalDate;
            //}

            if (Session["userid"] != null && ((TextBox)Table4.FindControl("txt_creater")) != null)
            {
                ((TextBox)Table4.FindControl("txt_creater")).Text = Session["userid"].ToString();
            }

                


            //.Text=initalDate;

            //string orderNoFormate = System.Configuration.ConfigurationSettings.AppSettings["OrderNoFormat"];

            string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["ERPInterface"];
            if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()) && Label_Message.Text.Trim().Equals(""))
            {
                ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
                IList ilist = ct.getControlTableByNewModuleList("tb_order");
                Hashtable hList = new Hashtable();
                foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
                {
                    hList.Add(cti.TableField, cti);
                }
                foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
                {
                    if (cti.TableDateField.Equals("DropDownList") && cti.TableField.Equals("ClientModuleId"))
                    {
                        bindDropDownList(cti, hList);
                        DropDownList ddl = Table4.FindControl(cti.ControlName) as DropDownList;

                        initialOutSystem(ddl.SelectedValue);
                        ddl.Enabled = true;
                    }

                    if (cti.TableDateField.Equals("DropDownList") && cti.TableField.Equals("difficultlevel"))
                    {
                        bindDropDownList(cti, hList);
                        DropDownList ddl = Table4.FindControl(cti.ControlName) as DropDownList;

                        ddl.SelectedValue = "3";
                        ddl.Enabled = true;
                    }


                }
            }
        }

        private void bindDropDownList(ControlTableInfo cti, Hashtable hList)
        {
            DropDownList ddl = Table4.FindControl(cti.ControlName) as DropDownList;

            if (cti.AssemblyPath != null && cti.InstanceName != null && cti.BindMethod != null)
            {
                Object dataBind = Assembly.Load(cti.AssemblyPath).CreateInstance(cti.InstanceName);
                Object dataSource;

                string[] controlName = cti.ParamControl.Split(',');
                Object[] args = new Object[controlName.Length];
                for (int i = 0; i < controlName.Length; i++)
                {
                    args[i] = controlName[i];
                }
                dataSource = Reflector.CallMethod(dataBind, cti.BindMethod, args);


                ddl.DataSource = dataSource;
                ddl.DataTextField = cti.DataTextField;
                ddl.DataValueField = cti.DataValueField;
                ddl.DataBind();


            }


        }

        private void dpl_SelectedIndexChanged(object sender, System.EventArgs e)
        {

            initialOutSystem((sender as DropDownList).SelectedValue);

        }

        private void initialOutSystem(string value)
        {
            SystemInterFace sysInterface = new SystemInterFace();
            IList sysInterfaceDetails = new SystemInterfaceDetail().GetSystemInterfaceDetailInfosByName("order");
            string systemkeycolumn = null;
            foreach (SystemInterfaceDetailInfo sidi in sysInterfaceDetails)
            {
                if (Convert.ToBoolean(sidi.IsOutSystemKey))
                {
                    systemkeycolumn = sidi.OutSystemColumnName;
                    break;
                }
            }
            if (systemkeycolumn != null)
            {
                OrderDesignInfo odi = sysInterface.getInterSchemaObjectInfoFromOut("order", systemkeycolumn, value) as OrderDesignInfo;
                initialEdit(odi);
            }
        }


        private void ClearView()
        {
            DropDownList dpl_isPart = Table4.FindControl("dpl_isPart") as DropDownList;
            //DropDownList dpl_Customer = Table4.FindControl("dpl_Customer") as DropDownList;
            DropDownList dpl_hasprice = Table4.FindControl("dpl_hasprice") as DropDownList;
            DropDownList dpl_ProductTypeList = Table4.FindControl("dpl_ProductTypeList") as DropDownList;

            DropDownList dpl_material = Table4.FindControl("dpl_material") as DropDownList;
            DropDownList Dropdownlist_Status = Table4.FindControl("Dropdownlist_Status") as DropDownList;

            TextBox txt_price = (TextBox)Table4.FindControl("txt_price");
            TextBox txt_moduleid = (TextBox)Table4.FindControl("txt_moduleid");
            TextBox txt_ordersingle = (TextBox)Table4.FindControl("txt_ordersingle");
            DropDownList dpl_customerModuleId = (DropDownList)Table4.FindControl("dpl_customerModuleId");
            TextBox txt_companyProductId = (TextBox)Table4.FindControl("txt_companyProductId");
            TextBox txt_signPrice = (TextBox)Table4.FindControl("txt_signPrice");
            TextBox txt_tryPrice = (TextBox)Table4.FindControl("txt_tryPrice");
            TextBox txt_creater = (TextBox)Table4.FindControl("txt_creater");
            TextBox txt_checker = (TextBox)Table4.FindControl("txt_checker");
            //FileUpload TextBox_Picture = (FileUpload)Table4.FindControl("TextBox_Picture");
            TextBox txt_equipMent = (TextBox)Table4.FindControl("txt_equipMent");
            TextBox txt_hole = (TextBox)Table4.FindControl("txt_hole");
            TextBox txt_extractRate = (TextBox)Table4.FindControl("txt_extractRate");
            DropDownList dpl_customerid = (DropDownList)Table4.FindControl("dpl_customerid");
            TextBox txt_startDate = (TextBox)Table4.FindControl("txt_startDate");
            TextBox txt_merchindiseEndDate = (TextBox)Table4.FindControl("txt_merchindiseEndDate");
            TextBox txt_designEndDate = (TextBox)Table4.FindControl("txt_designEndDate");
            TextBox txt_designStart = (TextBox)Table4.FindControl("txt_designStart");
            TextBox txt_productEndDate = (TextBox)Table4.FindControl("txt_productEndDate");
            TextBox txt_T3 = (TextBox)Table4.FindControl("txt_T3");
            TextBox txt_checkDate = (TextBox)Table4.FindControl("txt_checkDate");
            TextBox txt_tryDate0 = (TextBox)Table4.FindControl("txt_tryDate0");
            TextBox txt_referencePictureDate = (TextBox)Table4.FindControl("txt_referencePictureDate");
            TextBox txt_tryDate1 = (TextBox)Table4.FindControl("txt_tryDate1");
            TextBox txt_tryDate3 = (TextBox)Table4.FindControl("txt_tryDate3");
            TextBox txt_tryDate2 = (TextBox)Table4.FindControl("txt_tryDate2");
            TextBox txt_tryDateF = (TextBox)Table4.FindControl("txt_tryDateF");
            TextBox txt_comment = (TextBox)Table4.FindControl("txt_comment");
            TextBox txt_productname = (TextBox)Table4.FindControl("txt_productname");
            TextBox txt_ton = (TextBox)Table4.FindControl("txt_ton");
            TextBox txt_lockManager = (TextBox)Table4.FindControl("txt_lockManager");
            TextBox txt_gradeid = (TextBox)Table4.FindControl("txt_gradeid");
            TextBox txt_YingYeDanDang = (TextBox)Table4.FindControl("txt_YingYeDanDang");

            TextBox txt_prductSize = (TextBox)Table4.FindControl("txt_prductSize");
            TextBox txt_avgThick = (TextBox)Table4.FindControl("txt_avgThick");
            TextBox txt_moldStruct = (TextBox)Table4.FindControl("txt_moldStruct");
            TextBox txt_productApprance = (TextBox)Table4.FindControl("txt_productApprance");
            TextBox txt_projectManager1 = (TextBox)Table4.FindControl("txt_projectManager1");
            TextBox txt_projectManager2 = (TextBox)Table4.FindControl("txt_projectManager2");
            //TextBox txt_tryPlant = (TextBox)Table4.FindControl("txt_tryPlant");
            //TextBox txt_batchPlant = (TextBox)Table4.FindControl("txt_batchPlant");
            TextBox txt_pinNumber = (TextBox)Table4.FindControl("txt_pinNumber");
            TextBox txt_slideCount = (TextBox)Table4.FindControl("txt_slideCount");
            TextBox txt_projectManager3 = (TextBox)Table4.FindControl("txt_projectManager3");

            DropDownList dpl_cavMaterial = Table4.FindControl("dpl_cavMaterial") as DropDownList;
            DropDownList dpl_corMaterial = Table4.FindControl("dpl_corMaterial") as DropDownList;
            DropDownList dpl_batchPlant = Table4.FindControl("dpl_batchPlant") as DropDownList;
            DropDownList dpl_tryPlant = Table4.FindControl("dpl_tryPlant") as DropDownList;
            DropDownList dpl_slideMaterial = Table4.FindControl("dpl_slideMaterial") as DropDownList;
            DropDownList dpl_projectDepartMent = Table4.FindControl("dpl_projectDepartMent") as DropDownList;

            TextBox txt_toolingWeight = (TextBox)Table4.FindControl("txt_toolingWeight");
            TextBox txt_toolingSize = (TextBox)Table4.FindControl("txt_toolingSize");

            DropDownList dpl_modelType = Table4.FindControl("dpl_modelType") as DropDownList;

            if (txt_price != null)
            { txt_price.Text = ""; }

            txt_moduleid.Text = "";


            txt_companyProductId.Text = "";
            //			txt_rate.Text="";

            //			txt_signPricePercent.Text="";
            txt_signPrice.Text = "";
            //			txt_tryPercent.Text="";
            txt_tryPrice.Text = "";
            //			txt_finishedPercent.Text="";
            txt_creater.Text = "";
            txt_checker.Text = "";
            txt_checkDate.Text = "";
            //			txt_approver.Text="";
            txt_comment.Text = "";
            txt_productname.Text = "";

            txt_ton.Text = "";
            if (txt_referencePictureDate != null)
            {
                txt_referencePictureDate.Text = "";
            }

            //txt_lastPictureDate.Text="";
            txt_lockManager.Text = "";
            txt_tryDate0.Text = "";
            txt_tryDate1.Text = "";
            txt_tryDate2.Text = "";
            txt_tryDate3.Text = "";
            txt_tryDateF.Text = "";
            //txt_flashCheckDate.Text="";
            //ddl_dsnManager.Text = "";
            //txt_YingYeDanDang.Text="";

            //TextBox_Picture. = "";
            //txt_merchindiser.Text="";
            //txt_producter.Text="";
            //			txt_orderSingle.Text="";

            txt_prductSize.Text = "";
            txt_avgThick.Text = "";
            txt_moldStruct.Text = "";
            txt_productApprance.Text = "";
            txt_projectManager1.Text = "";
            txt_projectManager2.Text = "";
            //txt_tryPlant.Text = "";
            //txt_batchPlant.Text = "";
            txt_pinNumber.Text = "";

            txt_slideCount.Text = "";

            txt_toolingWeight.Text = "";
            txt_toolingSize.Text = "";
            txt_projectManager3.Text = "";


            func.Text = "";

            InitalAddPage();
        }



        private void bindProductType()
        {
            WorkFlow.BLL.Standard.StandProcessType standProcessType = new WorkFlow.BLL.Standard.StandProcessType();
            DropDownList dpl_parentTypeId = Table4.FindControl("dpl_parentTypeId") as DropDownList;
            if (dpl_parentTypeId != null)
            {
                try
                {



                    IList sptlist = standProcessType.GetStandProcessType(true);
                    IList newsptlist = new ArrayList();
                    foreach (StandProcessTypeInfo spt in sptlist)
                    {
                        if (spt.ParentId.Equals(0))
                        {
                            newsptlist.Add(spt);
                        }
                    }
                    dpl_parentTypeId.DataSource = newsptlist;
                    dpl_parentTypeId.DataTextField = "TypeName";
                    dpl_parentTypeId.DataValueField = "Id";
                    dpl_parentTypeId.DataBind();
                    dpl_parentTypeId.Items.Insert(0, "");
                }
                catch { }
            }

        }  





        private void bindChildProductTypeWithoutParent()
        {
            WorkFlow.BLL.Standard.StandProcessType standProcessType = new WorkFlow.BLL.Standard.StandProcessType();
            DropDownList dpl_ProductTypeList = Table4.FindControl("dpl_ProductTypeList") as DropDownList;
            try
            {

                IList sptlist = standProcessType.GetStandProcessType(true);
                IList newsptlist = new ArrayList();
                foreach (StandProcessTypeInfo spt in sptlist)
                {
                    if (!spt.ParentId.Equals(0))
                    {
                        newsptlist.Add(spt);
                    }
                }

                dpl_ProductTypeList.DataSource = newsptlist;
                dpl_ProductTypeList.DataTextField = "TypeName";
                dpl_ProductTypeList.DataValueField = "Id";
                dpl_ProductTypeList.DataBind();
                dpl_ProductTypeList.Items.Insert(0, "");
            }
            catch { }

        }






        private void bindUser()
        {
            BLL.User user = new User();

        }

        private void initialEdit(OrderDesignInfo orderDesigninfo)
        {

            Hashtable hcontroltables = new ControlTable().getHashTableByTableName("tb_order");

            bindChildProductTypeWithoutParent();

            ModuleWorkFlow.Model.CustomerInfo customerinfo = new ModuleWorkFlow.Model.CustomerInfo();
            ModuleWorkFlow.BLL.Customer customer = new ModuleWorkFlow.BLL.Customer();

            DropDownList dpl_isPart = Table4.FindControl("dpl_isPart") as DropDownList;
            //DropDownList dpl_Customer = Table4.FindControl("dpl_Customer") as DropDownList;
            DropDownList dpl_hasprice = Table4.FindControl("dpl_hasprice") as DropDownList;
            DropDownList dpl_ProductTypeList = Table4.FindControl("dpl_ProductTypeList") as DropDownList;
            DropDownList dpl_parentTypeId = null;
            if (dpl_ProductTypeList != null && dpl_ProductTypeList.Visible)
                dpl_parentTypeId = Table4.FindControl("dpl_parentTypeId") as DropDownList;


            DropDownList dpl_material = Table4.FindControl("dpl_material") as DropDownList;
            DropDownList Dropdownlist_Status = Table4.FindControl("Dropdownlist_Status") as DropDownList;
            DropDownList dpl_customerid = (DropDownList)Table4.FindControl("dpl_customerid");

            TextBox txt_price = (TextBox)Table4.FindControl("txt_price");
            TextBox txt_moduleid = (TextBox)Table4.FindControl("txt_moduleid");
            TextBox txt_ordersingle = (TextBox)Table4.FindControl("txt_ordersingle");
            DropDownList dpl_customerModuleId = (DropDownList)Table4.FindControl("dpl_customerModuleId");
            TextBox txt_companyProductId = (TextBox)Table4.FindControl("txt_companyProductId");
            TextBox txt_signPrice = (TextBox)Table4.FindControl("txt_signPrice");
            TextBox txt_tryPrice = (TextBox)Table4.FindControl("txt_tryPrice");
            TextBox txt_creater = (TextBox)Table4.FindControl("txt_creater");
            TextBox txt_checker = (TextBox)Table4.FindControl("txt_checker");
            FileUpload TextBox_Picture = (FileUpload)Table4.FindControl("TextBox_Picture");
            TextBox txt_equipMent = (TextBox)Table4.FindControl("txt_equipMent");
            TextBox txt_hole = (TextBox)Table4.FindControl("txt_hole");
            TextBox txt_extractRate = (TextBox)Table4.FindControl("txt_extractRate");
            TextBox txt_productNumber = (TextBox)Table4.FindControl("txt_ProductNumber");
            TextBox txt_startDate = (TextBox)Table4.FindControl("txt_startDate");
            TextBox txt_merchindiseEndDate = (TextBox)Table4.FindControl("txt_merchindiseEndDate");
            TextBox txt_designEndDate = (TextBox)Table4.FindControl("txt_designEndDate");
            TextBox txt_designStart = (TextBox)Table4.FindControl("txt_designStart");
            TextBox txt_productEndDate = (TextBox)Table4.FindControl("txt_productEndDate");
            TextBox txt_T3 = (TextBox)Table4.FindControl("txt_T3");
            TextBox txt_checkDate = (TextBox)Table4.FindControl("txt_checkDate");
            TextBox txt_tryDate0 = (TextBox)Table4.FindControl("txt_tryDate0");
            DropDownList drp_hours = Table4.FindControl("drp_hours") as DropDownList;
            DropDownList drp_minutes = Table4.FindControl("drp_minutes") as DropDownList;
            TextBox txt_referencePictureDate = (TextBox)Table4.FindControl("txt_referencePictureDate");
            TextBox txt_tryDate1 = (TextBox)Table4.FindControl("txt_tryDate1");
            TextBox txt_tryDate3 = (TextBox)Table4.FindControl("txt_tryDate3");
            TextBox txt_tryDate2 = (TextBox)Table4.FindControl("txt_tryDate2");
            TextBox txt_tryDateF = (TextBox)Table4.FindControl("txt_tryDateF");
            TextBox txt_comment = (TextBox)Table4.FindControl("txt_comment");
            TextBox txt_productname = (TextBox)Table4.FindControl("txt_productname");
            TextBox txt_ton = (TextBox)Table4.FindControl("txt_ton");
            TextBox txt_lockManager = (TextBox)Table4.FindControl("txt_lockManager");
            TextBox txt_gradeid = (TextBox)Table4.FindControl("txt_gradeid");
            TextBox txt_YingYeDanDang = (TextBox)Table4.FindControl("txt_YingYeDanDang");
            TextBox txt_clientModuleId = (TextBox)Table4.FindControl("txt_clientModuleId");
            DropDownList dpl_ClientModuleId = (DropDownList)Table4.FindControl("dpl_ClientModuleId");
            TextBox txt_model = (TextBox)Table4.FindControl("txt_model");
            DropDownList dpl_priority = (DropDownList)Table4.FindControl("dpl_priority");
            DropDownList dpl_difficultlevel = (DropDownList)Table4.FindControl("dpl_difficultlevel");

            TextBox txt_prductSize = (TextBox)Table4.FindControl("txt_prductSize");
            TextBox txt_avgThick = (TextBox)Table4.FindControl("txt_avgThick");
            TextBox txt_moldStruct = (TextBox)Table4.FindControl("txt_moldStruct");
            TextBox txt_productApprance = (TextBox)Table4.FindControl("txt_productApprance");
            TextBox txt_projectManager1 = (TextBox)Table4.FindControl("txt_projectManager1");
            TextBox txt_projectManager2 = (TextBox)Table4.FindControl("txt_projectManager2");
            //TextBox txt_tryPlant = (TextBox)Table4.FindControl("txt_tryPlant");
            //TextBox txt_batchPlant = (TextBox)Table4.FindControl("txt_batchPlant");
            TextBox txt_pinNumber = (TextBox)Table4.FindControl("txt_pinNumber");

            TextBox txt_slideCount = (TextBox)Table4.FindControl("txt_slideCount");
            DropDownList dpl_cavMaterial = Table4.FindControl("dpl_cavMaterial") as DropDownList;
            DropDownList dpl_corMaterial = Table4.FindControl("dpl_corMaterial") as DropDownList;
            DropDownList dpl_tryPlant = Table4.FindControl("dpl_tryPlant") as DropDownList;
            DropDownList dpl_batchPlant = Table4.FindControl("dpl_batchPlant") as DropDownList;
            DropDownList dpl_slideMaterial = Table4.FindControl("dpl_slideMaterial") as DropDownList;
            DropDownList dpl_projectDepartMent = Table4.FindControl("dpl_projectDepartMent") as DropDownList;

            TextBox txt_toolingWeight = (TextBox)Table4.FindControl("txt_toolingWeight");
            TextBox txt_toolingSize = (TextBox)Table4.FindControl("txt_toolingSize");
            TextBox txt_projectManager3 = (TextBox)Table4.FindControl("txt_projectManager3");
            TextBox txt_DFMModuleId = (TextBox)Table4.FindControl("txt_DFMModuleId");
            TextBox txt_businessStatus = (TextBox)Table4.FindControl("txt_businessStatus");

            DropDownList dpl_modelType = Table4.FindControl("dpl_modelType") as DropDownList;

            TextBox txt_copyfrom = (TextBox)Table4.FindControl("txt_copyfrom");



            TextBox txt_manufactureCost = (TextBox)Table4.FindControl("lab_manufactureCost");

            CheckBox chk_isoutsource = (CheckBox)Table4.FindControl("chk_isoutsource");


            WorkFlow.BLL.Standard.StandProcessType spt = new WorkFlow.BLL.Standard.StandProcessType();


            if (orderDesigninfo != null)
            {
                try
                {
                    dpl_isPart.SelectedValue = orderDesigninfo.isPart.ToString().Trim();
                }
                catch
                {
                    Label_Message.Text = Lang.TXT_OPERATIONERROR;
                }
                if (txt_price != null)
                {
                    txt_price.Text = Convert.ToString(orderDesigninfo.Price);
                }
                if (txt_moduleid != null)
                {
                    txt_moduleid.Text = orderDesigninfo.ModuleId;
                }
                if (txt_moduleid != null && !txt_moduleid.Text.Equals(""))
                {
                    txt_moduleid.ReadOnly = true;
                }

                if (orderDesigninfo.OrderSingle != null)
                {
                    txt_ordersingle.Text = orderDesigninfo.OrderSingle;
                }

                if (dpl_customerid != null)
                {
                    if (orderDesigninfo.CustomerId == 0)
                    {
                        if (orderDesigninfo.CustomerName != null)
                        {
                            dpl_customerid.Items.Insert(0, new ListItem(orderDesigninfo.CustomerName, "0"));
                        }
                        else
                        {
                            dpl_customerid.Items.Insert(0, new ListItem("", "0"));
                        }
                    }
                    dpl_customerid.SelectedValue = orderDesigninfo.CustomerId.ToString();

                }


                BindDataCusomerModel();
                //IList parts = new ModuleWorkFlow.BLL.Part().GetAllPartNo(txt_moduleid.Text);
                //if (dpl_ProductTypeList != null)
                //{
                //    if (parts.Count > 0)
                //    {
                //        dpl_ProductTypeList.Enabled = false;
                //    }
                //}

                if (dpl_parentTypeId != null)
                {
                    dpl_parentTypeId.Enabled = dpl_ProductTypeList.Enabled;
                }

                if (func.Text.Equals("Edit"))
                {
                    if (dpl_ProductTypeList != null)
                    {
                        dpl_ProductTypeList.Enabled = false;
                    }

                    if (dpl_parentTypeId != null)
                    {
                        dpl_parentTypeId.Enabled = false;
                    }
                
                }

                if (orderDesigninfo.ProductTypeId != 0 && !orderDesigninfo.ProductTypeId.Equals("0") && dpl_ProductTypeList != null && dpl_ProductTypeList.Visible)
                {

                    try
                    {
                        dpl_ProductTypeList.SelectedValue = Convert.ToString(orderDesigninfo.ProductTypeId);
                        StandProcessTypeInfo spin = spt.FindProcessTypeId(orderDesigninfo.ProductTypeId);
                        dpl_parentTypeId.SelectedValue = spin.ParentId.ToString();

                    }
                    catch
                    {

                    }
                }
                if (dpl_customerModuleId != null)
                {
                    if (orderDesigninfo.CustomerModuleId == 0)
                    {
                        if (orderDesigninfo.CustomerModuleIdName != null)
                        {
                            dpl_customerModuleId.Items.Insert(0, new ListItem(orderDesigninfo.CustomerModuleIdName, "0"));
                        }
                        else
                        {
                            dpl_customerModuleId.Items.Insert(0, new ListItem("", "0"));
                        }
                    }
                    dpl_customerModuleId.SelectedValue = orderDesigninfo.CustomerModuleId.ToString();
                }

                if (orderDesigninfo.CompanyProductId != null)
                    txt_companyProductId.Text = orderDesigninfo.CompanyProductId;

                dpl_hasprice.SelectedValue = Convert.ToString(orderDesigninfo.HasPrice);

                txt_signPrice.Text = Convert.ToString(orderDesigninfo.SignPrice);

                txt_tryPrice.Text = Convert.ToString(orderDesigninfo.TryPrice);
                if (txt_creater != null)
                {
                    txt_creater.Text = orderDesigninfo.Creater;
                }


                txt_checker.Text = user.getajaxNameToTXT(orderDesigninfo.Checker);//設定相應創建人

                //TextBox_Picture. = orderDesigninfo.FinishPicture;
                lab_picturename.Text = orderDesigninfo.FinishPicture;
                if (orderDesigninfo.EquipMent != null)
                {
                    txt_equipMent.Text = orderDesigninfo.EquipMent;
                }
                if (txt_hole != null)
                {
                    txt_hole.Text = orderDesigninfo.Hole;
                }


                if (txt_extractRate != null)
                {
                    txt_extractRate.Text = orderDesigninfo.ExtractRate;
                }


                if (txt_startDate != null)
                {
                    if (!orderDesigninfo.StartDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        txt_startDate.Text = orderDesigninfo.StartDate.ToShortDateString();
                    }
                    else
                    {
                        txt_startDate.Text = "";
                    }
                }

                if (!orderDesigninfo.MerchindiseEndDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    txt_merchindiseEndDate.Text = orderDesigninfo.MerchindiseEndDate.ToShortDateString();
                }
                else
                {
                    txt_merchindiseEndDate.Text = "";
                }
                if (txt_designEndDate != null)
                {
                    if (!orderDesigninfo.DesignEndDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        txt_designEndDate.Text = orderDesigninfo.DesignEndDate.ToShortDateString();
                    }
                    else
                    {
                        txt_designEndDate.Text = "";
                    }
                }

                if (txt_designStart != null)
                {
                    if (!orderDesigninfo.DesignStart.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        txt_designStart.Text = orderDesigninfo.DesignStart.ToShortDateString();
                    }
                    else
                    {
                        txt_designStart.Text = "";
                    }
                }
                if (txt_productEndDate != null)
                {
                    if (!orderDesigninfo.ProductEndDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                    {
                        txt_productEndDate.Text = orderDesigninfo.ProductEndDate.ToShortDateString();
                        if ((TextBox)Table4.FindControl("txt_productEndDate_time") != null)
                        {
                            ((TextBox)Table4.FindControl("txt_productEndDate_time")).Text = orderDesigninfo.ProductEndDate.ToString("HH:mm");
                        }

                    }
                    else
                    {
                        txt_productEndDate.Text = "";
                    }
                }


                if (!orderDesigninfo.T3.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    txt_T3.Text = orderDesigninfo.T3.ToShortDateString();
                }
                else
                {
                    txt_T3.Text = "";
                }

                if (!orderDesigninfo.CheckDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    txt_checkDate.Text = orderDesigninfo.CheckDate.ToShortDateString();
                }
                else
                {
                    txt_checkDate.Text = "";
                }


                if (txt_comment != null)
                { txt_comment.Text = orderDesigninfo.Comment; }

                txt_productname.Text = orderDesigninfo.ProductName;
                try
                {
                    dpl_material.SelectedValue = Convert.ToString(orderDesigninfo.Material);
                }
                catch
                {
                }
                if (txt_ton != null)
                {
                    txt_ton.Text = orderDesigninfo.Ton;
                }
                if (txt_referencePictureDate != null && !orderDesigninfo.ReferencePictureDate.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    txt_referencePictureDate.Text = orderDesigninfo.ReferencePictureDate.ToShortDateString();
                }


                if (txt_lockManager != null)
                {
                    if (orderDesigninfo.LockManager != null)
                    {
                        txt_lockManager.Text = orderDesigninfo.LockManager.Trim();
                    }
                    else
                    {
                        txt_lockManager.Text = "";
                    }
                }
                if (!orderDesigninfo.TryDate0.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    if (txt_tryDate0 != null)
                    {
                        txt_tryDate0.Text = orderDesigninfo.TryDate0.ToShortDateString();
                    }

                    if (drp_hours != null)
                    {
                        drp_hours.SelectedValue = orderDesigninfo.TryDate0.Hour.ToString();
                    }
                    if (drp_minutes != null)
                    {
                        drp_minutes.SelectedValue = orderDesigninfo.TryDate0.Minute.ToString();
                    }

                }
                else
                {
                    txt_tryDate0.Text = "";
                }
                if (!orderDesigninfo.TryDate1.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    txt_tryDate1.Text = orderDesigninfo.TryDate1.ToShortDateString();
                }
                else
                {
                    txt_tryDate1.Text = "";
                }
                if (!orderDesigninfo.TryDate2.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    txt_tryDate2.Text = orderDesigninfo.TryDate2.ToShortDateString();
                }
                else
                {
                    txt_tryDate2.Text = "";
                }
                if (!orderDesigninfo.TryDate3.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    if (txt_tryDate3 != null)
                    {
                        txt_tryDate3.Text = orderDesigninfo.TryDate3.ToShortDateString();
                    }

                }
                else
                {
                    txt_tryDate3.Text = "";
                }
                if (!orderDesigninfo.TryDateF.ToShortDateString().Equals(DateTime.MinValue.ToShortDateString()))
                {
                    txt_tryDateF.Text = orderDesigninfo.TryDateF.ToShortDateString();
                }
                else
                {
                    txt_tryDateF.Text = "";
                }

                txt_gradeid.Text = orderDesigninfo.GradeId.ToString();

                if (orderDesigninfo.ProductNumber == 0)
                    txt_productNumber.Text = "";
                else
                    txt_productNumber.Text = orderDesigninfo.ProductNumber.ToString();

                try
                {
                    if (txt_YingYeDanDang != null)
                    {
                        if (hcontroltables.Contains(txt_YingYeDanDang.ID))
                        {
                            ControlTableInfo cti = hcontroltables[txt_YingYeDanDang.ID] as ControlTableInfo;
                            if (cti.TableDateField.Equals("userajx"))
                            {
                                txt_YingYeDanDang.Text = user.getajaxTXTtoName(orderDesigninfo.YingYeDanDang.Trim());//設定相應創建人
                            }
                            else
                            {
                                txt_YingYeDanDang.Text = orderDesigninfo.YingYeDanDang;
                            }
                        }
                    }
                }
                catch
                {
                    //Label_Message.Text=lib.lang.TXT_OPERATIONERROR;
                }
                try
                {
                    Dropdownlist_Status.SelectedValue = orderDesigninfo.StatusId;
                    lab_oldstatusid.Text = orderDesigninfo.StatusId;
                }
                catch
                {
                    //Label_Message.Text=lib.lang.TXT_OPERATIONERROR;
                }

                TextBox txt_customerModuleId = Table4.FindControl("txt_customerModuleId") as TextBox;
                if (txt_customerModuleId != null)
                {
                    txt_customerModuleId.Text = orderDesigninfo.MoldName;
                }

                if (txt_clientModuleId != null)
                {
                    txt_clientModuleId.Text = orderDesigninfo.ClientModuleId;
                }

                if (dpl_ClientModuleId != null)
                {
                    if (orderDesigninfo.ClientModuleId != null)
                    {
                        dpl_ClientModuleId.Items.Insert(0, new ListItem(orderDesigninfo.ClientModuleId, orderDesigninfo.ClientModuleId));
                    }
                    dpl_ClientModuleId.SelectedValue = orderDesigninfo.ClientModuleId;
                }

                txt_model.Text = orderDesigninfo.Model;
                if (orderDesigninfo.Priority != 0)
                {
                    dpl_priority.SelectedValue = orderDesigninfo.Priority.ToString();
                }
                if (txt_projectManager3 != null)
                { txt_projectManager3.Text = orderDesigninfo.ProjectManager3; }

                //}
                //catch
                //{
                //}
                if (txt_prductSize != null)
                { txt_prductSize.Text = orderDesigninfo.ProductSize; }

                if (txt_prductSize != null)
                { txt_avgThick.Text = orderDesigninfo.AvgThick; }

                if (txt_businessStatus != null)
                {
                    txt_businessStatus.Text = orderDesigninfo.businessStatus;
                }
                txt_moldStruct.Text = orderDesigninfo.MoldStruct;
                txt_productApprance.Text = orderDesigninfo.ProductApprance;
                txt_projectManager1.Text = orderDesigninfo.ProjectManager1;
                txt_projectManager2.Text = orderDesigninfo.ProjectManager2;
                //txt_tryPlant.Text = Convert.ToString(orderDesigninfo.TryPlant);
                //txt_batchPlant.Text = Convert.ToString(orderDesigninfo.BatchPlant);
                txt_pinNumber.Text = orderDesigninfo.PinNumber;

                txt_slideCount.Text = orderDesigninfo.SlideCount;
                txt_toolingWeight.Text = orderDesigninfo.ToolingWeight;
                txt_toolingSize.Text = orderDesigninfo.ToolingSize;


                //try
                //{
                if (orderDesigninfo.CavMaterial != 0)
                {
                    dpl_cavMaterial.SelectedValue = Convert.ToString(orderDesigninfo.CavMaterial);
                }
                if (orderDesigninfo.CorMaterial != 0)
                {
                    dpl_corMaterial.SelectedValue = Convert.ToString(orderDesigninfo.CorMaterial);
                }
                if (orderDesigninfo.ProjectDepartMent != 0)
                {
                    dpl_projectDepartMent.SelectedValue = Convert.ToString(orderDesigninfo.ProjectDepartMent);
                }
                if (orderDesigninfo.TryPlant != 0)
                {
                    dpl_tryPlant.SelectedValue = Convert.ToString(orderDesigninfo.TryPlant);
                }
                if (dpl_batchPlant != null && orderDesigninfo.BatchPlant != 0)
                {
                    dpl_batchPlant.SelectedValue = Convert.ToString(orderDesigninfo.BatchPlant);
                }
                if (orderDesigninfo.SlideMaterial != 0)
                {
                    dpl_slideMaterial.SelectedValue = Convert.ToString(orderDesigninfo.SlideMaterial);
                }
                if (orderDesigninfo.ModelType == 0)
                {
                    if (orderDesigninfo.ModelTypeName != null)
                    {
                        dpl_modelType.Items.Insert(0, new ListItem(orderDesigninfo.ModelTypeName, "0"));
                    }
                    else
                    {
                        dpl_modelType.Items.Insert(0, new ListItem("", "0"));
                    }
                }
                else
                {
                    dpl_modelType.SelectedValue = orderDesigninfo.ModelType.ToString();
                }

                if (txt_DFMModuleId != null && orderDesigninfo.DFMModuleId != null)
                {
                    txt_DFMModuleId.Text = orderDesigninfo.DFMModuleId;
                }

                if (orderDesigninfo.Difficultlevel != 0)
                {
                    dpl_difficultlevel.SelectedValue = Convert.ToString(orderDesigninfo.Difficultlevel);
                }

                if (txt_copyfrom != null && orderDesigninfo.Copyfrom != null)
                {
                    txt_copyfrom.Text = orderDesigninfo.Copyfrom;
                }
                if (txt_manufactureCost != null && orderDesigninfo.ManufactureCost != null)
                {
                    txt_manufactureCost.Text = orderDesigninfo.ManufactureCost.ToString();
                }

                if (chk_isoutsource != null)
                {

                    if (orderDesigninfo.Isoutsource.Equals(1))
                    {
                        chk_isoutsource.Checked = true;
                    }
                    else
                    {
                        chk_isoutsource.Checked = false;
                    }
                }


                string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["ERPInterface"];
                if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
                {
                    Hashtable hcontrols = new ControlTable().getHashFieldTableByTableName("tb_order");
                    IList details = new SystemInterfaceDetail().GetSystemInterfaceDetailInfosByNameIsOutSystem("order");
                    foreach (SystemInterfaceDetailInfo sdi in details)
                    {
                        if (hcontrols.ContainsKey(sdi.AMDColumnName) && sdi.IsOutSystemKey == 0)
                        {
                            ControlTableInfo cti = hcontrols[sdi.AMDColumnName] as ControlTableInfo;
                            if (cti.TableDateField.Equals("DropDownList"))
                            {
                                (Table4.FindControl(cti.ControlName) as DropDownList).Enabled = false;
                            }
                            else
                            {
                                (Table4.FindControl(cti.ControlName) as TextBox).ReadOnly = true;
                                (Table4.FindControl(cti.ControlName) as TextBox).Enabled = false;
                            }
                        }
                    }
                }

            }
            else
            {
                string msg = "初始化訂單失敗";
                string url = "OrderDesignList.aspx?moduleid=" + txt_moduleid.Text.Trim() + "&msg=" + Server.UrlEncode(msg) + "&customerid=" + lab_customerid.Text +
                      "&pageindex=" + lab_pageindex.Text + "&producttype=" + lab_producttype.Text + "&modifyid=" + lab_modifyid.Text +
                      "&startdate=" + lab_startdate.Text + "&enddate=" + lab_enddate.Text + "&customermoduleid=" + lab_customermoduleid.Text +
                      "&overstatus=" + lab_overstatus.Text + "&key=" + lab_key.Text + "&datetype=" + lab_datetype.Text;
                Response.Redirect(url);

            }
        }


        private void BindDataCusomerModel()
        {
            DropDownList dpl_customerid = Table4.FindControl("dpl_customerid") as DropDownList;
            DropDownList dpl_customerModuleId = Table4.FindControl("dpl_customerModuleId") as DropDownList;
            if (dpl_customerModuleId != null && dpl_customerid != null)
            {
                dpl_customerModuleId.DataSource = new ModuleWorkFlow.BLL.System.Model().GetModelByCustomerId(Convert.ToInt32(dpl_customerid.SelectedValue), 1);
                dpl_customerModuleId.DataTextField = "moldName";
                dpl_customerModuleId.DataValueField = "id";
                dpl_customerModuleId.DataBind();
            }



        }

        private void BindDataMaterialProduction()
        {
            DropDownList dpl_isPart = Table4.FindControl("dpl_isPart") as DropDownList;
            DropDownList dpl_material = Table4.FindControl("dpl_material") as DropDownList;
            if (dpl_isPart != null && dpl_material != null)
            {
                if (dpl_isPart.SelectedValue.Trim().Equals("0"))
                {
                    dpl_material.DataSource = new Material().GetMaterial("Production");
                }
                else
                {
                    dpl_material.DataSource = new Material().GetMaterial("Part");
                }
                dpl_material.DataTextField = "name";
                dpl_material.DataValueField = "id";
                dpl_material.DataBind();
                dpl_material.AutoPostBack = false;
            }
        }


        private void BindDataMaterialPart()
        {
            DropDownList dpl_isPart = Table4.FindControl("dpl_isPart") as DropDownList;
            DropDownList dpl_cavMaterial = Table4.FindControl("dpl_cavMaterial") as DropDownList;
            DropDownList dpl_corMaterial = Table4.FindControl("dpl_corMaterial") as DropDownList;
            DropDownList dpl_slideMaterial = Table4.FindControl("dpl_slideMaterial") as DropDownList;

            if (dpl_isPart != null && dpl_cavMaterial != null && dpl_corMaterial != null && dpl_slideMaterial != null)
            {
                if (dpl_isPart.SelectedValue.Trim().Equals("0"))
                {
                    dpl_cavMaterial.DataSource = new Material().GetMaterial("Part");
                    dpl_corMaterial.DataSource = new Material().GetMaterial("Part");
                    dpl_slideMaterial.DataSource = new Material().GetMaterial("Part");
                }
                else
                {
                    dpl_cavMaterial.DataSource = new Material().GetMaterial("Production");
                    dpl_corMaterial.DataSource = new Material().GetMaterial("Production");
                    dpl_slideMaterial.DataSource = new Material().GetMaterial("Production");
                }
                dpl_cavMaterial.DataTextField = "name";
                dpl_corMaterial.DataTextField = "name";
                dpl_slideMaterial.DataTextField = "name";
                dpl_cavMaterial.DataValueField = "id";
                dpl_corMaterial.DataValueField = "id";
                dpl_slideMaterial.DataValueField = "id";
                dpl_cavMaterial.DataBind();
                dpl_corMaterial.DataBind();
                dpl_slideMaterial.DataBind();
                dpl_cavMaterial.AutoPostBack = false;
                dpl_cavMaterial.AutoPostBack = false;
                dpl_slideMaterial.AutoPostBack = false;

            }
        }

        private void BindDatafactoryType()
        {
            DropDownList dpl_tryPlant = Table4.FindControl("dpl_tryPlant") as DropDownList;
            DropDownList dpl_batchPlant = Table4.FindControl("dpl_batchPlant") as DropDownList;
            if (dpl_tryPlant != null && dpl_batchPlant != null)
            {
                dpl_tryPlant.DataSource = new Supply().GetSupply("try");
                dpl_batchPlant.DataSource = new Supply().GetSupply("product");
                dpl_tryPlant.DataTextField = "supplierName";
                dpl_batchPlant.DataTextField = "supplierName";
                dpl_tryPlant.DataValueField = "id";
                dpl_batchPlant.DataValueField = "id";
                dpl_tryPlant.DataBind();
                dpl_batchPlant.DataBind();
                dpl_tryPlant.AutoPostBack = false;
                dpl_batchPlant.AutoPostBack = false;
            }

        }

        private void BindDataDepartMent()
        {
            DropDownList dpl_projectDepartMent = Table4.FindControl("dpl_projectDepartMent") as DropDownList;
            if (dpl_projectDepartMent != null)
            {
                dpl_projectDepartMent.DataSource = new DepartMent().GetAllDepartment();
                dpl_projectDepartMent.DataTextField = "DepartmentName";
                dpl_projectDepartMent.DataValueField = "DepartmentId";
                dpl_projectDepartMent.DataBind();
                dpl_projectDepartMent.AutoPostBack = false;
            }

        }

        private void BindDatadifficultlevel()
        {
            DropDownList dpl_difficultlevel = Table4.FindControl("dpl_difficultlevel") as DropDownList;
            if (dpl_difficultlevel != null)
            {
                dpl_difficultlevel.DataSource = new Difficult().GetDifficultInfos();
                dpl_difficultlevel.DataTextField = "Name";
                dpl_difficultlevel.DataValueField = "Id";
                dpl_difficultlevel.DataBind();
                dpl_difficultlevel.AutoPostBack = false;
            }
        }

        private void BindDatamodelType()
        {
            DropDownList dpl_modelType = Table4.FindControl("dpl_modelType") as DropDownList;
            if (dpl_modelType != null)
            {
                dpl_modelType.DataSource = new ModelType().getModelTypeInfo();
                dpl_modelType.DataTextField = "typename";
                dpl_modelType.DataValueField = "TypeId";
                dpl_modelType.DataBind();

                dpl_modelType.SelectedIndex = 0;

                trigger_event(dpl_modelType, EventArgs.Empty);


            }
        }


        private void BindDataPriority()
        {
            DropDownList dpl_priority = Table4.FindControl("dpl_priority") as DropDownList;
            if (dpl_priority != null)
            {
                DataSet ds = Priority.getPriorityView();
                //DataTable dt = ds.Tables[0];
                //DataRow dr = ds.Tables[0].NewRow();
                //dr["priorityid"] = 40;
                //dr["priorityname"] = "2";
                //ds.Tables[0].Rows.InsertAt(dr,0);
                //ds.Tables[0].Rows.RemoveAt(2);


                dpl_priority.DataSource = ds;
                dpl_priority.DataTextField = "Priorityname";
                dpl_priority.DataValueField = "Priorityid";
                dpl_priority.DataBind();
                dpl_priority.AutoPostBack = false;
            }

        }




        public void bindusername()
        {
            if (Session["userid"] != null)
            {
                string userno = Session["userid"].ToString();
                ModuleWorkFlow.BLL.User u = new ModuleWorkFlow.BLL.User();
                string username = u.getUserInfo(userno).Name;

                TextBox txt_creater = (TextBox)Table4.FindControl("txt_creater");
                if (txt_creater != null)
                {
                    txt_creater.Text = username;
                }

            }
        }

        public void bindCustomer()
        {
            DropDownList dpl_customerid = Table4.FindControl("dpl_customerid") as DropDownList;
            if (dpl_customerid != null)
            {
                dpl_customerid.DataSource = new CustomerDesign().GetCustomerDesignInfos();
                dpl_customerid.DataTextField = "CustomerName";
                dpl_customerid.DataValueField = "CustomerId";
                dpl_customerid.DataBind();
            }

        }

        private void BindData()
        {
            bindusername();

            
            bindProductType();

            bindCustomer();


            bindUser();
            DropDownList dpl_isPart = Table4.FindControl("dpl_isPart") as DropDownList;
            try
            {
                dpl_isPart.Items.Clear();
                ListItem ispart = new ListItem("模具", "0");
                dpl_isPart.Items.Add(ispart);
                ispart = new ListItem("零件", "1");
                dpl_isPart.Items.Add(ispart);
            }
            catch { }

            DropDownList dpl_hasprice = Table4.FindControl("dpl_hasprice") as DropDownList;
            try
            {

                dpl_hasprice.Items.Clear();
                ListItem hasprice = new ListItem("無酬", "0");
                dpl_hasprice.Items.Add(hasprice);
                hasprice = new ListItem("有酬", "1");
                dpl_hasprice.Items.Add(hasprice);
            }
            catch { }

            //DropDownList dpl_priority = Table4.FindControl("dpl_priority") as DropDownList;
            //try
            //{

            //    dpl_priority.Items.Clear();
            //    ListItem priority3 = new ListItem("3", "100");
            //    dpl_priority.Items.Add(priority3);
            //    ListItem priority2 = new ListItem("2", "60");
            //    dpl_priority.Items.Add(priority2);
            //    ListItem priority1 = new ListItem("1", "30");
            //    dpl_priority.Items.Add(priority1);

            //}
            //catch { }

            DropDownList Dropdownlist_Status = Table4.FindControl("Dropdownlist_Status") as DropDownList;
            try
            {
                Dropdownlist_Status.Items.Clear();
                ListItem li = new ListItem("就緒", "Ready");
                Dropdownlist_Status.Items.Add(li);
                li = new ListItem("暫停", "Holdon");
                Dropdownlist_Status.Items.Add(li);
                li = new ListItem("取消", "Cancel");
                Dropdownlist_Status.Items.Add(li);
            }
            catch { }
            BindDataMaterialProduction();
            BindDataMaterialPart();
            BindDataCusomerModel();
            BindDatafactoryType();
            BindDataDepartMent();
            BindDataPriority();
            BindDatadifficultlevel();
            BindDatamodelType();
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
            initpage();
            if (((DropDownList)Table4.FindControl("dpl_isPart")) != null)
            {
                ((DropDownList)Table4.FindControl("dpl_isPart")).SelectedIndexChanged += new System.EventHandler(this.dpl_isPart_SelectedIndexChanged);
            }

            if (((DropDownList)Table4.FindControl("dpl_customerId")) != null)
            {
                ((DropDownList)Table4.FindControl("dpl_customerId")).SelectedIndexChanged += new EventHandler(dpl_CustomerId_SelectedIndexChanged);
            }

            if (((DropDownList)Table4.FindControl("dpl_parentTypeId")) != null)
            {
                ((DropDownList)Table4.FindControl("dpl_parentTypeId")).SelectedIndexChanged += new EventHandler(dpl_parentTypeId_SelectedIndexChanged);
            }
            //((Button)Table4.FindControl("btn_up")).Click += new System.EventHandler(this.Picture_FileUpload_Click);

         

            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion




        private void dpl_isPart_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindDataMaterialProduction();
        }

        private void dpl_CustomerId_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            AjaxControlToolkit.AutoCompleteExtender AutoComplete_txt_customerModuleId = Table4.FindControl("AutoComplete_txt_customerModuleId") as AjaxControlToolkit.AutoCompleteExtender;
            if (AutoComplete_txt_customerModuleId != null)
            {
                AutoComplete_txt_customerModuleId.ContextKey = (sender as DropDownList).SelectedValue;
            }
            BindDataCusomerModel();
        }

        private void dpl_parentTypeId_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            bindChildType();
        }

        private void bindChildType()
        {
            DropDownList dpl_ProductTypeList = Table4.FindControl("dpl_ProductTypeList") as DropDownList;
            DropDownList dpl_parentTypeId = Table4.FindControl("dpl_parentTypeId") as DropDownList;

            if (!dpl_parentTypeId.SelectedValue.Equals("0"))
            {
                WorkFlow.BLL.Standard.StandProcessType standProcessType = new WorkFlow.BLL.Standard.StandProcessType();
                dpl_ProductTypeList.DataSource = standProcessType.GetStandProcessTypeByParentId(true, Convert.ToInt32(dpl_parentTypeId.SelectedValue));
                dpl_ProductTypeList.DataTextField = "typeName";
                dpl_ProductTypeList.DataValueField = "id";
                dpl_ProductTypeList.DataBind();
            }
        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {

            Hashtable hcontroltables = new ControlTable().getHashTableByTableName("tb_order");
            DropDownList dpl_isPart = Table4.FindControl("dpl_isPart") as DropDownList;
            //DropDownList dpl_Customer = Table4.FindControl("dpl_Customer") as DropDownList;
            DropDownList dpl_hasprice = Table4.FindControl("dpl_hasprice") as DropDownList;
            DropDownList dpl_ProductTypeList = Table4.FindControl("dpl_ProductTypeList") as DropDownList;

            DropDownList dpl_material = Table4.FindControl("dpl_material") as DropDownList;
            DropDownList Dropdownlist_Status = Table4.FindControl("Dropdownlist_Status") as DropDownList;

            DropDownList dpl_customerid = (DropDownList)Table4.FindControl("dpl_customerid");

            TextBox txt_price = (TextBox)Table4.FindControl("txt_price");
            if (txt_price != null)
            {
                if (!checkImportent(txt_price, hcontroltables))
                {
                    return;
                }
            }

            TextBox txt_moduleid = (TextBox)Table4.FindControl("txt_moduleid");
            TextBox txt_ordersingle = (TextBox)Table4.FindControl("txt_ordersingle");
            if (txt_ordersingle != null)
            {
                if (!checkImportent(txt_ordersingle, hcontroltables))
                {
                    return;
                }
            }
            DropDownList dpl_customerModuleId = (DropDownList)Table4.FindControl("dpl_customerModuleId");

            TextBox txt_customerModuleId = (TextBox)Table4.FindControl("txt_customerModuleId");

            TextBox txt_companyProductId = (TextBox)Table4.FindControl("txt_companyProductId");
            TextBox txt_signPrice = (TextBox)Table4.FindControl("txt_signPrice");
            TextBox txt_tryPrice = (TextBox)Table4.FindControl("txt_tryPrice");
            TextBox txt_creater = (TextBox)Table4.FindControl("txt_creater");
            if (txt_creater != null)
            {
                if (!checkImportent(txt_creater, hcontroltables))
                {
                    return;
                }
            }
            TextBox txt_checker = (TextBox)Table4.FindControl("txt_checker");

            TextBox txt_equipMent = (TextBox)Table4.FindControl("txt_equipMent");
            TextBox txt_hole = (TextBox)Table4.FindControl("txt_hole");
            TextBox txt_extractRate = (TextBox)Table4.FindControl("txt_extractRate");
            if (txt_extractRate != null)
            {
                if (!checkImportent(txt_extractRate, hcontroltables))
                {
                    return;
                }
            }


            TextBox txt_productNumber = (TextBox)Table4.FindControl("txt_ProductNumber");
            TextBox txt_startDate = (TextBox)Table4.FindControl("txt_startDate");
            if (txt_startDate != null)
            {
                if (!checkImportent(txt_startDate, hcontroltables))
                {
                    return;
                }
            }


            TextBox txt_merchindiseEndDate = (TextBox)Table4.FindControl("txt_merchindiseEndDate");
            TextBox txt_designEndDate = (TextBox)Table4.FindControl("txt_designEndDate");
            TextBox txt_designStart = (TextBox)Table4.FindControl("txt_designStart");
            TextBox txt_productEndDate = (TextBox)Table4.FindControl("txt_productEndDate");
            if (txt_productEndDate != null)
            {
                if (!checkImportent(txt_productEndDate, hcontroltables))
                {
                    return;
                }
            }
            

            TextBox txt_T3 = (TextBox)Table4.FindControl("txt_T3");
            TextBox txt_checkDate = (TextBox)Table4.FindControl("txt_checkDate");
            TextBox txt_tryDate0 = (TextBox)Table4.FindControl("txt_tryDate0");
            if (txt_tryDate0 != null)
            {
                if (!checkImportent(txt_tryDate0, hcontroltables))
                {
                    return;
                }
            }

            DropDownList drp_hours = Table4.FindControl("drp_hours") as DropDownList;
            DropDownList drp_minutes = Table4.FindControl("drp_minutes") as DropDownList;
            TextBox txt_referencePictureDate = (TextBox)Table4.FindControl("txt_referencePictureDate");
            TextBox txt_tryDate1 = (TextBox)Table4.FindControl("txt_tryDate1");
            TextBox txt_tryDate3 = (TextBox)Table4.FindControl("txt_tryDate3");

            if (txt_tryDate3 != null)
            {
                if (!checkImportent(txt_tryDate3, hcontroltables))
                {
                    return;
                }
            }

            TextBox txt_tryDate2 = (TextBox)Table4.FindControl("txt_tryDate2");
            TextBox txt_tryDateF = (TextBox)Table4.FindControl("txt_tryDateF");
            TextBox txt_comment = (TextBox)Table4.FindControl("txt_comment");
            TextBox txt_productname = (TextBox)Table4.FindControl("txt_productname");
            if (txt_productname != null)
            {
                if (!checkImportent(txt_productname, hcontroltables))
                {
                    return;
                }
            }
            TextBox txt_ton = (TextBox)Table4.FindControl("txt_ton");
            if (txt_ton != null)
            {
                if (!checkImportent(txt_ton, hcontroltables))
                {
                    return;
                }
            }

            TextBox txt_lockManager = (TextBox)Table4.FindControl("txt_lockManager");
            TextBox txt_gradeid = (TextBox)Table4.FindControl("txt_gradeid");
            TextBox txt_YingYeDanDang = (TextBox)Table4.FindControl("txt_YingYeDanDang");
            TextBox txt_clientModuleId = (TextBox)Table4.FindControl("txt_clientModuleId");
            DropDownList dpl_ClientModuleId = (DropDownList)Table4.FindControl("dpl_ClientModuleId");
            TextBox txt_model = (TextBox)Table4.FindControl("txt_model");
            DropDownList dpl_priority = (DropDownList)Table4.FindControl("dpl_priority");
            DropDownList dpl_difficultlevel = (DropDownList)Table4.FindControl("dpl_difficultlevel");

            TextBox txt_prductSize = (TextBox)Table4.FindControl("txt_prductSize");
            TextBox txt_avgThick = (TextBox)Table4.FindControl("txt_avgThick");
            TextBox txt_moldStruct = (TextBox)Table4.FindControl("txt_moldStruct");
            TextBox txt_productApprance = (TextBox)Table4.FindControl("txt_productApprance");
            TextBox txt_projectManager1 = (TextBox)Table4.FindControl("txt_projectManager1");
            TextBox txt_projectManager2 = (TextBox)Table4.FindControl("txt_projectManager2");
            //TextBox txt_tryPlant = (TextBox)Table4.FindControl("txt_tryPlant");
            //TextBox txt_batchPlant = (TextBox)Table4.FindControl("txt_batchPlant");
            TextBox txt_pinNumber = (TextBox)Table4.FindControl("txt_pinNumber");
            TextBox txt_slideCount = (TextBox)Table4.FindControl("txt_slideCount");


            DropDownList dpl_cavMaterial = Table4.FindControl("dpl_cavMaterial") as DropDownList;
            DropDownList dpl_corMaterial = Table4.FindControl("dpl_corMaterial") as DropDownList;
            DropDownList dpl_projectDepartMent = Table4.FindControl("dpl_projectDepartMent") as DropDownList;
            DropDownList dpl_tryPlant = Table4.FindControl("dpl_tryPlant") as DropDownList;
            DropDownList dpl_batchPlant = Table4.FindControl("dpl_batchPlant") as DropDownList;
            DropDownList dpl_slideMaterial = Table4.FindControl("dpl_slideMaterial") as DropDownList;
            DropDownList dpl_modelType = Table4.FindControl("dpl_modelType") as DropDownList;



            FileUpload TextBox_Picture = (FileUpload)Table4.FindControl("TextBox_Picture");

            TextBox txt_toolingWeight = (TextBox)Table4.FindControl("txt_toolingWeight");
            TextBox txt_toolingSize = (TextBox)Table4.FindControl("txt_toolingSize");
            TextBox txt_projectManager3 = (TextBox)Table4.FindControl("txt_projectManager3");
            TextBox txt_overUser = (TextBox)Table4.FindControl("txt_overUser");
            TextBox txt_copyfrom = (TextBox)Table4.FindControl("txt_copyfrom");
            TextBox txt_manufactureCost = (TextBox)Table4.FindControl("lab_manufactureCost");

            CheckBox chk_isoutsource = (CheckBox)Table4.FindControl("chk_isoutsource");

            PartOrderDesignInfo orderDesigninfo = new PartOrderDesignInfo();


            if (txt_moduleid.Text.Trim().Equals(""))
            {
                Label_Message.Text = "模具編號不能為空";
                return;
            }

            if (func.Text.Equals("Edit"))
            {
                orderDesigninfo = new OrderDesign().GetOrderDesignByNo(txt_moduleid.Text);
                if (orderDesigninfo == null)
                {
                    Label_Message.Text = "模具已被刪除，請重新選擇";
                    return;
                }
            }


            if (txt_moduleid.Text.Substring(0, 1).Equals("0"))
            {
                Label_Message.Text = "模具編號第一位不能為0";
                return;
            }
            if (dpl_isPart.SelectedValue.Trim().Equals("0"))
            {
                orderDesigninfo.isPart = 0;
            }
            else
            {
                orderDesigninfo.isPart = 1;
            }

            if (txt_price != null)
            {
                if (!txt_price.Text.Trim().Equals(""))
                {
                    try
                    {

                        orderDesigninfo.Price = Convert.ToDouble(txt_price.Text);
                    }
                    catch
                    {
                        Label_Message.Text = txt_price.Text + Lang.NO_ERROR;
                        return;
                    }
                }
                else
                {
                    orderDesigninfo.Price = 0;

                }
            }

            if (!txt_ordersingle.Text.Trim().Equals(""))
            {
                orderDesigninfo.OrderSingle = txt_ordersingle.Text.Trim();
            }
            if (!txt_moduleid.ReadOnly)
            {
                if (ConvertString.ConvertToModuleId(txt_moduleid.Text.Trim()))
                {
                    orderDesigninfo.ModuleId = txt_moduleid.Text.ToUpper().Trim();
                }
                else
                {
                    Label_Message.Text = txt_moduleid.Text + " 模具編號只能輸入數字，英文及~";
                    return;
                }
            }
            else
            {
                orderDesigninfo.ModuleId = txt_moduleid.Text.Trim();
            }
            if (dpl_customerid.SelectedValue.Trim().Equals(""))
            {
                Label_Message.Text = "客戶不能為空";
                return;
            }
            else
            {
                orderDesigninfo.CustomerId = Convert.ToInt32(dpl_customerid.SelectedValue);
                orderDesigninfo.CustomerName = dpl_customerid.SelectedItem.Text;
            }

            if (dpl_customerModuleId != null && dpl_customerModuleId.Visible && dpl_customerModuleId.SelectedValue.Equals(""))
            {
                Label_Message.Text = "請選擇機種";
                return;
            }




            int customerModuleId = 0;

            if (txt_customerModuleId != null && txt_customerModuleId.Visible && txt_customerModuleId.Text.Equals(""))
            {
                if (!checkImportent(txt_customerModuleId, hcontroltables))
                {
                    Label_Message.Text = "請選擇機種";
                    return;
                }

            }

            if (txt_customerModuleId != null && dpl_customerid != null && dpl_ClientModuleId != null)
            {
                ModelInfo mi = new ModuleWorkFlow.BLL.System.Model().GetModelByNo(txt_customerModuleId.Text.Trim(), Convert.ToInt32(dpl_customerid.SelectedValue));
                if (mi == null)
                {
                    Label_Message.Text = "客戶\"" + dpl_customerid.SelectedItem + "\"中不存此幾種 \"" + txt_customerModuleId.Text + "\"";
                    return;
                }
                else
                {
                    customerModuleId = mi.Id;
                }
            }

            if (!func.Text.Equals("Edit"))
            {
                if (checkImportentbydpl(dpl_ProductTypeList, hcontroltables))
                {
                    try
                    {
                        orderDesigninfo.ProductTypeId = Convert.ToInt32(dpl_ProductTypeList.SelectedValue);
                    }
                    catch
                    {
                        //Label_Message.Text = dpl_ProductTypeList.SelectedValue + Lang.NO_ERROR;
                        //return;
                    }
                }
                else
                {
                    return;
                }
            }


            if (dpl_customerModuleId != null)
            {
                orderDesigninfo.CustomerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);
                orderDesigninfo.MoldName = dpl_customerModuleId.SelectedItem.Text;
            }

            if (txt_customerModuleId != null)
            {
                orderDesigninfo.CustomerModuleId = customerModuleId;
                orderDesigninfo.MoldName = txt_customerModuleId.Text;
            }



            orderDesigninfo.CompanyProductId = txt_companyProductId.Text;
            try
            {
                orderDesigninfo.ProductNumber = Convert.ToInt32(txt_productNumber.Text.Trim());
            }
            catch
            {
                orderDesigninfo.ProductNumber = 0;
            }
            try
            {
                orderDesigninfo.Priority = Convert.ToInt32(dpl_priority.SelectedValue);
            }
            catch
            {
                orderDesigninfo.Priority = 60;
            }

            if (!dpl_difficultlevel.SelectedValue.Equals(""))
            {
                orderDesigninfo.Difficultlevel = Convert.ToInt32(dpl_difficultlevel.SelectedValue);
            }

            if (!dpl_modelType.SelectedValue.Equals(""))
                orderDesigninfo.ModelType = Convert.ToInt32(dpl_modelType.SelectedValue);


            if (!dpl_hasprice.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.HasPrice = Convert.ToInt32(dpl_hasprice.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_hasprice.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.HasPrice = 0;
            }

            if (!txt_signPrice.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.SignPrice = Convert.ToDouble(txt_signPrice.Text);
                }
                catch
                {
                    Label_Message.Text = txt_signPrice.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.SignPrice = 0;
            }

            if (!txt_tryPrice.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.TryPrice = Convert.ToDouble(txt_tryPrice.Text);
                }
                catch
                {
                    Label_Message.Text = txt_tryPrice.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.TryPrice = 0;
            }

            if (!txt_creater.Text.Trim().Equals(""))
            {
                if (!user.getajaxTXTtoName(txt_creater.Text).Equals(""))
                {
                    orderDesigninfo.Creater = txt_creater.Text;
                }
                else
                {
                    Label_Message.Text = "用戶名和用戶編號不符合,請重新輸入";
                    return;
                }
            }
            //else
            //{
            //    Label_Message.Text = "制單人不能為空";
            //    return;
            //}
            if (!txt_checker.Text.Trim().Equals(""))
            {

                try
                {

                    if (!user.getajaxTXTtoName(txt_checker.Text).Equals(""))
                    {
                        orderDesigninfo.Checker = user.getajaxTXTtoName(txt_checker.Text);
                    }
                    else
                    {
                        Label_Message.Text = "用戶名和用戶編號不符合,請重新輸入";
                        return;
                    }

                }
                catch
                {
                }
            }

            if (!txt_checkDate.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.CheckDate = Convert.ToDateTime(txt_checkDate.Text);
                }
                catch
                {
                    Label_Message.Text = txt_checkDate.Text + Lang.NO_ERROR;
                    return;
                }
            }


            orderDesigninfo.Comment = txt_comment.Text;
            orderDesigninfo.ProductName = txt_productname.Text;
            if (!dpl_material.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.Material = dpl_material.SelectedValue;
                    orderDesigninfo.MaterialName = dpl_material.SelectedItem.Text;
                }
                catch
                {
                    Label_Message.Text = dpl_material.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.Material = "0";
            }
            orderDesigninfo.Ton = txt_ton.Text;
            if (txt_referencePictureDate != null && !txt_referencePictureDate.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.ReferencePictureDate = Convert.ToDateTime(txt_referencePictureDate.Text);
                }
                catch
                {
                    Label_Message.Text = txt_referencePictureDate.Text + Lang.NO_ERROR;
                    return;
                }
            }

            if (!txt_lockManager.Text.Trim().Equals(""))
            {
                try
                {

                    orderDesigninfo.LockManager = txt_lockManager.Text.Trim();
                }
                catch
                {

                }
            }
            else
            {
                orderDesigninfo.LastPictureDate = DateTime.MinValue;
            }
            if (!txt_tryDate0.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.TryDate0 = Convert.ToDateTime(txt_tryDate0.Text);
                    if (drp_hours != null)
                    {
                        orderDesigninfo.TryDate0 = orderDesigninfo.TryDate0.AddHours(Convert.ToDouble(drp_hours.SelectedValue));
                    }

                    if (drp_minutes != null)
                    { orderDesigninfo.TryDate0 = orderDesigninfo.TryDate0.AddMinutes(Convert.ToDouble(drp_minutes.SelectedValue)); }

                }
                catch
                {
                    Label_Message.Text = txt_tryDate0.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                Label_Message.Text = "T0不能為空";
                return;
            }
            if (!txt_tryDate1.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.TryDate1 = Convert.ToDateTime(txt_tryDate1.Text);
                }
                catch
                {
                    Label_Message.Text = txt_tryDate1.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.TryDate1 = DateTime.MinValue;
            }
            if (!txt_tryDate2.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.TryDate2 = Convert.ToDateTime(txt_tryDate2.Text);
                }
                catch
                {
                    Label_Message.Text = txt_tryDate2.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.TryDate2 = DateTime.MinValue;
            }
            if (!txt_tryDate3.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.TryDate3 = Convert.ToDateTime(txt_tryDate3.Text.Trim());
                }
                catch
                {
                    Label_Message.Text = txt_tryDate3.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {

            }

            if (!txt_tryDateF.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.TryDateF = Convert.ToDateTime(txt_tryDateF.Text);
                }
                catch
                {
                    Label_Message.Text = txt_tryDateF.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.TryDateF = DateTime.MinValue;
            }


            Picture_FileUpload();



            if (File.Exists(Server.MapPath("../uploadimages/") + newname))
            {
                orderDesigninfo.FinishPicture = newname;
            }
            else
            {
                orderDesigninfo.FinishPicture = lab_picturename.Text;
            }


            if (checkUser(txt_YingYeDanDang, hcontroltables))
            {
                orderDesigninfo.YingYeDanDang = txt_YingYeDanDang.Text;
            }
            else
            {
                Label_Message.Text = "承制人輸入錯誤,請重新輸入";
                return;
            }

            orderDesigninfo.StatusId = Dropdownlist_Status.SelectedValue;
            orderDesigninfo.EquipMent = txt_equipMent.Text;
            orderDesigninfo.Hole = txt_hole.Text;

            orderDesigninfo.ExtractRate = txt_extractRate.Text;

            if (txt_startDate != null && !txt_startDate.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.StartDate = Convert.ToDateTime(txt_startDate.Text);
                }
                catch
                {
                    Label_Message.Text = txt_startDate.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                //Label_Message.Text = "起始日期" + Lang.NO_SPACES;
                //return;
                orderDesigninfo.StatusId = "Pending";

            }
            if (!txt_merchindiseEndDate.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.MerchindiseEndDate = Convert.ToDateTime(txt_merchindiseEndDate.Text);
                }
                catch
                {
                    Label_Message.Text = lab_merchindiseenddate.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.MerchindiseEndDate = DateTime.MinValue;
            }
            if (!txt_designEndDate.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.DesignEndDate = Convert.ToDateTime(txt_designEndDate.Text);
                }
                catch
                {
                    Label_Message.Text = txt_designEndDate.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.DesignEndDate = DateTime.MinValue;
            }
            if (txt_designStart != null && !txt_designStart.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.DesignStart = Convert.ToDateTime(txt_designStart.Text);
                }
                catch
                {
                    Label_Message.Text = txt_designStart.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.DesignStart = DateTime.MinValue;
            }


            if (!txt_productEndDate.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.ProductEndDate = Convert.ToDateTime(txt_productEndDate.Text);
                    
                }
                catch
                {
                    Label_Message.Text = lab_productenddate.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.ProductEndDate = DateTime.MinValue;
            }
            if (!txt_T3.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.T3 = Convert.ToDateTime(txt_T3.Text);
                }
                catch
                {
                    Label_Message.Text = txt_T3.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.T3 = DateTime.MinValue;
            }

            if (!txt_gradeid.Text.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.GradeId = Convert.ToInt32(txt_gradeid.Text);
                }
                catch
                {
                    Label_Message.Text = lab_gradeid.Text + Lang.INPUT_NUMBER;
                    return;
                }
            }

            if (txt_clientModuleId != null)
            {
                ModuleWorkFlow.BLL.System.Model model = new ModuleWorkFlow.BLL.System.Model();
                ModelInfo mi = model.GetModelByNo(txt_clientModuleId.Text, Convert.ToInt32(dpl_customerid.SelectedValue));
                if (mi != null)
                {
                    orderDesigninfo.ClientModuleId = mi.Id.ToString();
                }
                else
                {
                    orderDesigninfo.ClientModuleId = txt_clientModuleId.Text.Trim();
                }
            }
            if (dpl_ClientModuleId != null)
            {
                orderDesigninfo.ClientModuleId = dpl_ClientModuleId.SelectedValue;
            }

            if (txt_overUser != null)
            {
                orderDesigninfo.OverUser = txt_overUser.Text;
            }
            orderDesigninfo.Model = txt_model.Text;

            orderDesigninfo.ProductSize = txt_prductSize.Text;
            orderDesigninfo.AvgThick = txt_avgThick.Text;
            orderDesigninfo.MoldStruct = txt_moldStruct.Text;
            orderDesigninfo.ProductApprance = txt_productApprance.Text;
            orderDesigninfo.ProjectManager1 = txt_projectManager1.Text;
            orderDesigninfo.ProjectManager2 = txt_projectManager2.Text;
            //orderDesigninfo.TryPlant = Convert.ToInt32(txt_tryPlant.Text);
            //orderDesigninfo.BatchPlant = Convert.ToInt32(txt_batchPlant.Text);
            orderDesigninfo.PinNumber = txt_pinNumber.Text;
            orderDesigninfo.SlideCount = txt_slideCount.Text;
            orderDesigninfo.ProjectManager3 = txt_projectManager3.Text;
            orderDesigninfo.ToolingWeight = txt_toolingWeight.Text;
            orderDesigninfo.ToolingSize = txt_toolingSize.Text;


            if (!dpl_cavMaterial.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.CavMaterial = Convert.ToInt32(dpl_cavMaterial.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_cavMaterial.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.CavMaterial = 0;
            }

            if (!dpl_corMaterial.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.CorMaterial = Convert.ToInt32(dpl_corMaterial.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_corMaterial.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.CorMaterial = 0;
            }


            if (!dpl_tryPlant.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.TryPlant = Convert.ToInt32(dpl_tryPlant.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_tryPlant.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.TryPlant = 0;
            }

            if (dpl_batchPlant != null && !dpl_batchPlant.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.BatchPlant = Convert.ToInt32(dpl_batchPlant.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_batchPlant.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.BatchPlant = 0;
            }

            if (!dpl_projectDepartMent.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.ProjectDepartMent = Convert.ToInt32(dpl_projectDepartMent.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_projectDepartMent.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.ProjectDepartMent = 0;
            }

            if (!dpl_slideMaterial.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    orderDesigninfo.SlideMaterial = Convert.ToInt32(dpl_slideMaterial.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_slideMaterial.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                orderDesigninfo.SlideMaterial = 0;
            }


            //驗證copyfrom的moduleid是否存在

            if (txt_copyfrom != null)
            {
                OrderInfo odi = new ModuleWorkFlow.BLL.Order().GetOrderInfo(txt_copyfrom.Text.Trim());
                if (odi == null && !txt_copyfrom.Text.Trim().Equals(""))
                {
                    Label_Message.Text = "複製模不存在";
                    return;
                }
                else
                {
                    orderDesigninfo.Copyfrom = txt_copyfrom.Text.Trim();
                }
            }


            try
            {
                if (txt_manufactureCost != null && !txt_manufactureCost.Text.Trim().Equals(""))
                {
                    orderDesigninfo.ManufactureCost = Convert.ToDouble(txt_manufactureCost.Text);
                }
            }
            catch
            {
                Label_Message.Text = "模具重量格式不正確";
                return;
            }

            if (chk_isoutsource != null)
            {
                if (chk_isoutsource.Checked == true)
                {
                    orderDesigninfo.Isoutsource = 1;
                }
                else
                {
                    orderDesigninfo.Isoutsource = 0;
                }
            }





            string msg = "";
            string ERPInterface = System.Configuration.ConfigurationSettings.AppSettings["ERPInterface"];
            string PDMInterface = System.Configuration.ConfigurationSettings.AppSettings["PDMInterface"];

            Label_Message.Text = Lang.SAVE_SUCCESS;
            if (!func.Text.Equals("Edit"))
            {
                if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()))
                {
                    hcontroltables = new ControlTable().getHashFieldTableByTableName("tb_order");
                    IList outSystemDetails = new SystemInterfaceDetail().GetSystemInterfaceDetailInfosByNameIsOutSystem("order");
                    foreach (SystemInterfaceDetailInfo sdi in outSystemDetails)
                    {
                        if (sdi.AMDForignProperty != null && hcontroltables.ContainsKey(sdi.AMDForignProperty))
                        {
                            ControlTableInfo cti = hcontroltables[sdi.AMDForignProperty] as ControlTableInfo;
                            DropDownList foreignControl = ((DropDownList)Table4.FindControl(cti.ControlName));
                            if (foreignControl != null)
                            {
                                if (foreignControl.SelectedValue.Equals("") || foreignControl.SelectedValue.Equals("0"))
                                {
                                    if (sdi.IsAMDAutoAdd == 1)
                                    {
                                        Reflector.SetProperty(orderDesigninfo, sdi.AMDForignTextProperty, foreignControl.SelectedItem.Text);
                                    }
                                    else
                                    {
                                        Label_Message.Text = "請先增添" + cti.TableValue;
                                        return;
                                    }
                                }
                            }

                        }
                    }
                    SystemInterFace erppdminterface = new SystemInterFace();
                    Label_Message.Text = erppdminterface.insertToAmd(orderDesigninfo, "order", new SendAlert());
                    if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                    {
                        DateTime T1 = orderDesigninfo.TryDate0;
                        DateTime TF = orderDesigninfo.TryDateF;
                        orderDesigninfo.TryDate0 = new DateTime();
                        orderDesigninfo.TryDateF = new DateTime();
                        orderDesigninfo.ProductNumber = 0;
                        orderDesigninfo.ERPTransStatus = "HOLD";
                        Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, null, "order", false, "U");
                        if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                        {
                            orderDesigninfo.TryDate0 = T1;
                            orderDesigninfo.TryDateF = TF;
                            Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, null, "order", false, "U");
                            if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                            {
                                Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, null, "orderpart", false, "D");
                                if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                                {
                                    Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, null, "orderpart", false, "I");
                                }
                            }
                        }
                    }

                    if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS) && PDMInterface != null && Convert.ToBoolean(PDMInterface.Trim()))
                    {
                        erppdminterface = new SystemInterFace();
                        Label_Message.Text = erppdminterface.insertNewToOutsource(orderDesigninfo, "ordertopdm");
                    }

                }



                if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS) && (ERPInterface == null || !Convert.ToBoolean(ERPInterface.Trim())))
                {
                    Label_Message.Text = partOrderDesign.insertOrderDesign(orderDesigninfo, new SendAlert());
                }


                //orderDesign.insertOrderDesignPLM(orderDesigninfo);
                msg = Label_Message.Text;


            }
            else
            {
                Label_Message.Text = Lang.SAVE_SUCCESS;
                SystemInterFace erppdminterface = new SystemInterFace();
                PartOrderDesignInfo oldinfo = new PartOrderDesign().GetOrderDesignByNo(orderDesigninfo.ModuleId);
                string createModule = System.Configuration.ConfigurationSettings.AppSettings["createModule"];
                string lastparameter = orderDesigninfo.ModuleId.Trim().Substring(orderDesigninfo.ModuleId.Trim().Length - 1, 1).ToUpper();

                if (ERPInterface != null && Convert.ToBoolean(ERPInterface.Trim()) && !createModule.Contains(lastparameter))
                {
                    SystemInterFace erpinterface = new SystemInterFace();
                    orderDesigninfo.ProductNumber = 0;
                    orderDesigninfo.ERPTransStatus = "HOLD";
                    Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, oldinfo, "order", true, "U");

                    if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                    {
                        Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, null, "orderpart", false, "D");
                        if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                        {
                            Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, null, "orderpart", false, "I");
                        }
                    }

                    if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS) && PDMInterface != null && Convert.ToBoolean(PDMInterface.Trim()))
                    {
                        Label_Message.Text = erppdminterface.updateFromAmd(orderDesigninfo, oldinfo, "ordertopdm", false, "U");
                    }
                }



                if ((createModule.Contains(lastparameter) || ERPInterface == null || !Convert.ToBoolean(ERPInterface.Trim())) && (createModule.Contains(lastparameter) || PDMInterface == null || !Convert.ToBoolean(PDMInterface.Trim())))
                {
                    Label_Message.Text = partOrderDesign.updateOrderDesign(orderDesigninfo);
                }
                if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                {
                    if (!(String.IsNullOrEmpty(lab_oldstatusid.Text)))
                    {
                        WorkFlow.BLL.Standard.StandProcessType standProcessType = new WorkFlow.BLL.Standard.StandProcessType();
                        Hashtable htable = new Hashtable();
                        htable.Add("Ready", "就緒");
                        htable.Add("Holdon", "暫停");
                        htable.Add("Cancelled", "取消");


                        if (!lab_oldstatusid.Text.Trim().Equals(orderDesigninfo.StatusId))
                        {
                            orderDesigninfo.StatusId = htable[orderDesigninfo.StatusId].ToString();
                            string subject = "模具編號：" + orderDesigninfo.ModuleId + "狀態由" + htable[lab_oldstatusid.Text.Trim()].ToString() + "改為" + orderDesigninfo.StatusId;
                            IList source = new ArrayList();
                            source.Add(orderDesigninfo);
                            new SendAlert().sendAlert("OrderAddNotice", source, subject);
                        }
                    }

                    msg = Lang.SAVE_SUCCESS;
                }
                else
                {
                    return;
                }
            }
            if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
            {
                ClearView();
                string url = "OrderDesignList.aspx?moduleid=" + txt_moduleid.Text.Trim() + "&msg=" + Server.UrlEncode(Label_Message.Text) + "&customerid=" + lab_customerid.Text +
                       "&pageindex=" + lab_pageindex.Text + "&producttype=" + lab_producttype.Text + "&modifyid=" + lab_modifyid.Text +
                       "&startdate=" + lab_startdate.Text + "&enddate=" + lab_enddate.Text + "&customermoduleid=" + lab_customermoduleid.Text +
                       "&overstatus=" + lab_overstatus.Text + "&key=" + lab_key.Text + "&datetype=" + lab_datetype.Text;
                Response.Redirect(url);
            }
            else
            {
                partOrderDesign.deleteOrderDesign(txt_moduleid.Text.Trim());
            }
        }
        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            string url = "OrderDesignList.aspx?menuid=" + menuid + "&customerid=" + lab_customerid.Text + "&pageindex=" + lab_pageindex.Text +
                         "&producttype=" + lab_producttype.Text + "&modifyid=" + lab_modifyid.Text +
                         "&startdate=" + lab_startdate.Text + "&enddate=" + lab_enddate.Text + "&customermoduleid=" + lab_customermoduleid.Text +
                         "&overstatus=" + lab_overstatus.Text + "&key=" + lab_key.Text + "&datetype=" + lab_datetype.Text;

            Response.Redirect(url);

        }

        private bool checkImportent(TextBox tx, Hashtable hControtable)
        {
           
            bool successful = true;
            if (hControtable.ContainsKey(tx.ID) )
            {
                ControlTableInfo cti = hControtable[tx.ID] as ControlTableInfo;
                if (cti.important == 1 && tx.Text.Trim().Equals(""))
                {
                    Label_Message.Text = cti.TableValue + "為必填項！";
                    successful = false;
                }
            }

            return successful;
        }

        private bool checkImportentbydpl(DropDownList dpl, Hashtable hControtable)
        {
            //TextBox txt_moduleid = (TextBox)Table4.FindControl("txt_moduleid");
            // string createModule = System.Configuration.ConfigurationSettings.AppSettings["createModule"];
            // string lastparameter = txt_moduleid.Text.Trim().Substring(txt_moduleid.Text.Trim().Length - 1, 1).ToUpper();
            bool successful = true;
            if (hControtable.ContainsKey(dpl.ID))
            {
                ControlTableInfo cti = hControtable[dpl.ID] as ControlTableInfo;
                if (cti.important == 1 && dpl.SelectedValue.Trim().Equals(""))
                {
                    Label_Message.Text = cti.TableValue + "為必填項！";
                    successful = false;
                }
            }

            return successful;
        }



        private bool checkUser(TextBox tx, Hashtable hcontroltables)
        {
            bool successful = true;
            User user = new User();
            if (hcontroltables.Contains(tx.ID))
            {
                ControlTableInfo cti = hcontroltables[tx.ID] as ControlTableInfo;

                if (cti.TableDateField.Equals("userajx"))
                {
                    if (tx.Text.Trim().Equals(""))
                    {
                        if (cti.important == 0)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        string username = user.getajaxTXTtoName(tx.Text);
                        if (username.Equals(""))
                        {
                            successful = false;
                        }
                        else
                        {
                            tx.Text = username;
                        }
                    }
                }
            }

            return successful;
        }





        private void Picture_FileUpload()
        {

            FileUpload TextBox_Picture = Table4.FindControl("TextBox_Picture") as FileUpload;

            if (TextBox_Picture.FileName.Length != 0 && System.IO.Path.GetExtension(TextBox_Picture.FileName).ToLower().Equals(".jpg") && TextBox_Picture.PostedFile.ContentLength <= 1048576)
            {
                string filename = TextBox_Picture.PostedFile.FileName;
                string ext = System.IO.Path.GetExtension(TextBox_Picture.PostedFile.FileName).ToLower();
                newname = DateTime.Now.ToString("yyyyMMddHHmmss") + ext;
                string path = Server.MapPath("../uploadimages/");
                TextBox_Picture.SaveAs(path + newname);
            }
            else
            {
                Label_Message.Text = "請正確選擇圖片(jpg格式，最大容量為1024KB)";
                return;
            }

        }

        [System.Web.Services.WebMethod]

        public static string UpdateModuleId(string customerId, string modelTypeId)
        {
            string val = "";
            CustomerDesign customerDesign = new CustomerDesign();
            CustomerDesignInfo cdi = customerDesign.findbykey(Convert.ToInt32(customerId));
            if (cdi != null)
            {
                val += cdi.CustomerNumber;
            }

            ModelTypeInfo mti = new ModelType().findByKey(Convert.ToInt32(modelTypeId));
            if (mti != null)
            {
                val += mti.Abbr;
            }

            //string json = "{ \"val\": \"" +val +"\" }";
            //context.Response.Write(json);    
            return val;




        }
    }
}
