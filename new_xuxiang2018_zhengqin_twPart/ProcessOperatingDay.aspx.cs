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

using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.WebView;
using WebControlLibrary;

using ModuleWorkFlow.BLL.Try;
using ModuleWorkFlow.Model.Try;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.BLL.StupidReport;

using ModuleWorkFlow.BLL.Alert;
using Utility;
using System.Collections.Generic;
using Antlr.Runtime.Misc;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for ProcessOperatingDay.
    /// </summary>
    public class ProcessOperatingDay : System.Web.UI.Page
    {
        //protected ModuleWorkFlow.controls.Style Style;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.DropDownList dpl_status;
        protected DropDownList drp_processlist;
        protected DropDownList dpl_alldepartmentid;
        protected DropDownList dpl_alluserno;
        protected System.Web.UI.WebControls.TextBox txt_searchmodelid;
        protected System.Web.UI.WebControls.DropDownList dpl_customer;
        protected System.Web.UI.WebControls.DropDownList dpl_module;
        protected System.Web.UI.WebControls.DropDownList dpl_allstarthours;
        protected System.Web.UI.WebControls.DropDownList dpl_allstartminutes;
        protected System.Web.UI.WebControls.Label Label_Message;
        private Hashtable huserno = new Hashtable();
        private Hashtable hstatus = new Hashtable();
        private Utility.NoSortHashTable hprocessno;
        protected System.Web.UI.WebControls.Label dg_lab_truedepartmentid;
        protected Label lab_type;
        protected OneClickButton lnkbutton_save;
        protected string menuName;
        protected TextBox txt_partno;

        protected System.Web.UI.WebControls.Label lab_menuid;
        protected IList machines;
        protected string menuname = "";


        private void Page_Load(object sender, System.EventArgs e)
        {
            string menuid = "F23";

            Tmenu menu = new Tmenu();
            TmenuInfo mi = menu.findbykey(menuid);



            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
            }

            if (!this.IsPostBack)
            {
                //權限控制

                if (Request.Params["type"] != null && !Request.Params["type"].Trim().Equals(""))
                {
                    lab_type.Text = Request.Params["type"];
                    if (lab_type.Text.Equals("design"))
                    {
                        menuid = "F074";
                    }
                    if (lab_type.Text.Equals("programe"))
                    {
                        menuid = "F075";
                    }
                    if (lab_type.Text.Equals("batchHold"))
                    {
                        menuid = "F024";
                    }


                }
                else
                {
                    lab_type.Text = "";
                }
                lab_menuid.Text = menuid;
                mi = new Tmenu().findbykey(menuid);
                if (mi != null)
                {
                    menuName = mi.Menuname;
                }
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");
                Session["hprocessno"] = null;
                ModuleWorkFlow.BLL.Process p = new ModuleWorkFlow.BLL.Process();
                hprocessno = new Utility.NoSortHashTable();
                BindProcess();


                Bindstatus();
                BindAlldepartmentid();
                BindAlluserNo();
                BindDataCustomer();
             
                BindDataModule();
                HttpCookie cookie = Request.Cookies["COOKIEGCLICKROCESSID"];
                if (cookie != null)
                {
                    tools.DropDownListChange(drp_processlist, cookie.Value);
                }
                BindDataDBGrid(dpl_alluserno.SelectedValue);
            }
            hstatus = new ModuleWorkFlow.BLL.Status().getKeyStatusInfo();
        }

       
       

        private void BindAlluserNo()
        {
            ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
            UserInfo ui = null;
            if (Session["userid"] != null && !Session["userid"].ToString().Equals(""))
            {
                ui = user.getUserInfo(Session["userid"].ToString());
            }
            if (ui != null)
            {
                try
                {
                    dpl_alldepartmentid.SelectedValue = ui.DepartId.ToString();
                }
                catch
                {

                }
            }
            if (!dpl_alldepartmentid.SelectedValue.Equals(""))
            {
                dpl_alluserno.DataSource = user.getUserInfoByDepartment(Convert.ToInt32(dpl_alldepartmentid.SelectedValue));
                dpl_alluserno.DataTextField = "name";
                dpl_alluserno.DataValueField = "username";
                dpl_alluserno.DataBind();
                dpl_alluserno.Items.Insert(0, "");

                try
                {
                    dpl_alluserno.SelectedValue = ui.UserName;
                }
                catch
                {

                }
            }
        }

        private void BindAlldepartmentid()
        {
            ModuleWorkFlow.BLL.DepartMent department = new DepartMent();
            dpl_alldepartmentid.DataSource = department.GetAllDepartment(lab_menuid.Text);
            dpl_alldepartmentid.DataTextField = "DepartName";
            dpl_alldepartmentid.DataValueField = "DepartMentId";
            dpl_alldepartmentid.DataBind();
        }



        private void BindProcess()
        {
            ModuleWorkFlow.BLL.Process process = new Process();
            ModuleWorkFlow.BLL.PartProcess partprocess = new PartProcess();
            if (lab_type.Text.Equals(""))
            {

                drp_processlist.DataSource = process.getClickProcessInfoExceptDesign();
            }
            else
            {
                if (lab_type.Text.Equals("programe"))
                {
                    drp_processlist.DataSource = process.getProcessInfoDesignGroup("programe", lab_type.Text);
                }
                else
                {
                    if (lab_type.Text.Equals("batchHold"))
                    {
                        drp_processlist.DataSource = process.getallProcessInfoExceptDesign();
                    }
                    else
                    {
                        drp_processlist.DataSource = process.getProcessInfoDesignGroup("design", lab_type.Text);
                    }
                }

            }
            drp_processlist.DataTextField = "ProcessName";
            drp_processlist.DataValueField = "ProcessId";
            drp_processlist.DataBind();
        }


        private void Bindstatus()
        {
            IList list = new ArrayList();
            StatusInfo si1 = new StatusInfo();
            si1.StatusId = "Ready";
            si1.StatusDesc = "開始";
            list.Insert(0, si1);

            StatusInfo si2 = new StatusInfo();
            si2.StatusId = "Holdon";
            si2.StatusDesc = "暫停";
            list.Insert(1, si2);

            StatusInfo si3 = new StatusInfo();
            si3.StatusId = "Implementation";
            si3.StatusDesc = "結束";
            list.Insert(2, si3);

            if (lab_type.Text.Equals("batchHold"))
            {
                list.RemoveAt(2);
            }

            dpl_status.DataSource = list;
            dpl_status.DataTextField = "StatusDesc";
            dpl_status.DataValueField = "StatusId";
            dpl_status.DataBind();
        }


        private void BindDataCustomer()
        {
            ModuleWorkFlow.BLL.Customer cust = new Customer();
            dpl_customer.DataTextField = "ChineseName";
            dpl_customer.DataValueField = "Id";
            dpl_customer.DataSource = cust.GetCustomer();
            dpl_customer.DataBind();
            dpl_customer.Items.Insert(0, (new ListItem("", "0")));
        }

        private void BindDataModule()
        {
            ModuleWorkFlow.BLL.NewOrder.OrderDesign ordn = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
            dpl_module.DataTextField = "moduleid";
            dpl_module.DataValueField = "moduleid";
            int customerModuleId = 0;
            ModuleWorkFlow.Model.ProcessInfo pi = new ModuleWorkFlow.BLL.Process().GetProcessInfoById(drp_processlist.SelectedValue);
            string readyStatus = "";
            if (pi != null)
            {
                if (pi.StartDirectly)
                {
                    readyStatus = "Ready";
                }
                else
                {
                    readyStatus = "JIEDAN";
                }
            }

            if (!dpl_customer.SelectedValue.Equals(""))
            {
               
                if (dpl_status.SelectedValue.Equals("Ready"))
                {
                    dpl_module.DataSource = ordn.getListOrderInfoUnOverByCustmoerId(Convert.ToInt32(dpl_customer.SelectedValue), customerModuleId, true);
                }
                else
                {
                    dpl_module.DataSource = ordn.getListOrderInfoUnOverByCustmoerId(Convert.ToInt32(dpl_customer.SelectedValue), customerModuleId, false);
                }

            }
            else
                dpl_module.DataSource = new ArrayList();
            dpl_module.DataBind();
            dpl_module.Items.Insert(0, new ListItem("所有", ""));
        }

        private void BindDataDBGrid(string userno)
        {
            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
            if (pi.NeedSchedule == 1)
            {
                Machine machine = new Machine();
                machines = machine.GetAllMachineList(drp_processlist.SelectedValue);
                if (dpl_status.SelectedValue.Trim().Equals("Ready"))
                {
                    machines = machine.GetAllMachineListCanUsed(drp_processlist.SelectedValue);
                }
            }



            ModuleWorkFlow.BLL.PartPartProcess partprocess = new ModuleWorkFlow.BLL.PartPartProcess();
            List<PartPartProcessInfo> partprocesses = new List<PartPartProcessInfo>();
            List<PartPartProcessInfo> details = new List<PartPartProcessInfo>();
            string moduleid = dpl_module.SelectedValue;
            int customerId = 0;
            int customerModuleId = 0;

            if (!txt_searchmodelid.Text.Equals(""))
            {
                moduleid = txt_searchmodelid.Text;
            }

            if (!dpl_customer.SelectedValue.Equals(""))
            {
                customerId = Convert.ToInt32(dpl_customer.SelectedValue);
            }

           


            if (!drp_processlist.SelectedValue.Equals(""))
            {
                if (dpl_status.SelectedValue.Trim().Equals("Ready"))
                {
                    partprocesses = new List<PartPartProcessInfo>();
                    if (new Process().GetProcessInfoById(drp_processlist.SelectedValue).StartDirectly || new Process().GetProcessInfoById(drp_processlist.SelectedValue).FinishedDirectly)
                        partprocesses.AddRange(partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "Ready", drp_processlist.SelectedValue, txt_partno.Text.Trim(), userno));

                    partprocesses.AddRange(partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "JIEDAN", drp_processlist.SelectedValue, txt_partno.Text.Trim(), userno));

                    partprocesses.AddRange(partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "Holdon", drp_processlist.SelectedValue, txt_partno.Text.Trim(), userno));
                    bool canexchange = System.Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["canExchanged"]);

                    if (lab_type.Text.Equals("design") || lab_type.Text.Equals("programe") || (!txt_partno.Text.Trim().Equals("") && !txt_searchmodelid.Text.Trim().Equals("") && canexchange))
                    {
                        IList pendings = partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "Pending", drp_processlist.SelectedValue, txt_partno.Text.Trim());
                        ArrayList workings = new ArrayList();
                        workings.AddRange(partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "JIEDAN", null, txt_partno.Text.Trim()));
                        workings.AddRange(partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "Working", null, txt_partno.Text.Trim()));
                        workings.AddRange(partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "Holdon", null, txt_partno.Text.Trim()));
                        workings.AddRange(partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "Implementation", null, txt_partno.Text.Trim()));
                        Hashtable hworkings = new Hashtable();
                        foreach (PartProcessInfo ppi in workings)
                        {
                            if (!hworkings.ContainsKey(ppi.ModuleId + "|" + ppi.PartNo_Id))
                            {
                                hworkings.Add(ppi.ModuleId + "|" + ppi.PartNo_Id, ppi);
                            }
                        }

                        foreach (PartPartProcessInfo ppi in pendings)
                        {
                            if (ppi.NeedProduct == 1 && !hworkings.ContainsKey(ppi.ModuleId + "|" + ppi.PartNo_Id))
                            {
                                partprocesses.Add(ppi);
                            }
                        }



                    }

                    partprocesses = partprocess.getPartProcessInfoOrderPartReadyOnly(partprocesses) ;

                    if (MainDataGrid.AllowPaging)
                    {
                        if (MainDataGrid.CurrentPageIndex > partprocesses.Count / MainDataGrid.PageSize)
                        {
                            MainDataGrid.CurrentPageIndex = partprocesses.Count / MainDataGrid.PageSize;
                        }

                        details = Utility.tools.GetPageDetailInfos(MainDataGrid.CurrentPageIndex, MainDataGrid.PageSize, partprocesses);
                        MainDataGrid.VirtualItemCount = partprocesses.Count;
                    }
                    else
                    {
                        details = partprocesses;
                    }
                }
                else
                {
                    partprocesses = partprocess.getPartProcessInfolike(moduleid, customerModuleId, customerId, "Working", drp_processlist.SelectedValue, txt_partno.Text.Trim());
                    if (MainDataGrid.AllowPaging)
                    {
                        if (MainDataGrid.CurrentPageIndex > partprocesses.Count / MainDataGrid.PageSize)
                        {
                            MainDataGrid.CurrentPageIndex = partprocesses.Count / MainDataGrid.PageSize;
                        }

                        details = Utility.tools.GetPageDetailInfos(MainDataGrid.CurrentPageIndex, MainDataGrid.PageSize, partprocesses);
                        MainDataGrid.VirtualItemCount = partprocesses.Count;
                    }
                    else
                    {
                        details = partprocesses;
                    }
                }
            }

            //((ArrayList)details).Sort(new ProcessOperationDayCompare());
            MainDataGrid.DataSource = details;
            MainDataGrid.DataKeyField = "processno";
            MainDataGrid.DataBind();


            if (pi != null && pi.NeedSchedule == 1)
            {
                MainDataGrid.Columns[13].Visible = true;
            }
            else
            {
                MainDataGrid.Columns[13].Visible = false;
            }


            if (dpl_status.SelectedValue.Trim().Equals("Ready") || dpl_status.SelectedValue.Trim().Equals("allstart") || dpl_status.SelectedValue.Trim().Equals("Implementation"))
            {

                MainDataGrid.Columns[MainDataGrid.Columns.Count - 1].Visible = false;
            }
            else
            {
                MainDataGrid.Columns[MainDataGrid.Columns.Count - 1].Visible = true;
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
            this.dpl_customer.SelectedIndexChanged += new System.EventHandler(this.dpl_customer_SelectedIndexChanged);
            this.dpl_module.SelectedIndexChanged += new System.EventHandler(this.dpl_module_SelectedIndexChanged);
            this.dpl_status.SelectedIndexChanged += new System.EventHandler(this.dpl_status_SelectedIndexChanged);
            this.drp_processlist.SelectedIndexChanged += new System.EventHandler(this.drp_processlist_SelectedIndexChanged);
            this.dpl_alldepartmentid.SelectedIndexChanged += new System.EventHandler(this.dpl_alldepartmentid_SelectedIndexChanged);
            this.dpl_alluserno.SelectedIndexChanged += new System.EventHandler(this.dpl_alluserno_SelectedIndexChanged);
            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
            this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void dpl_alldepartmentid_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            User user = new User();
            dpl_alluserno.DataSource = user.getUserInfoByDepartment(Convert.ToInt32(dpl_alldepartmentid.SelectedValue));
            dpl_alluserno.DataTextField = "name";
            dpl_alluserno.DataValueField = "username";
            dpl_alluserno.DataBind();
            dpl_alluserno.Items.Insert(0, "");
        }

        private void dpl_alluserno_SelectedIndexChanged(object sender, System.EventArgs e)
        {

            BindDataDBGrid(dpl_alluserno.SelectedValue);
            foreach (DataGridItem gdi in MainDataGrid.Items)
            {
                TextBox txt_userno = gdi.FindControl("dpl_txt_user") as TextBox;
                txt_userno.Text = dpl_alluserno.SelectedValue;
            }

        }

        protected void dpl_customerModuleId_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindDataModule();
            BindDataDBGrid(dpl_alluserno.SelectedValue);
        }

        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                // 获取表头中的 Label 控件
                Label lblHeaderCount = (Label)e.Item.FindControl("dg_header_Count");

                if (dpl_status.SelectedValue.Equals("Ready"))
                {
                    // 设置表头 Label 的文本
                    lblHeaderCount.Text = "開始數量";
                }
            }

            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
                //if (Convert.ToDateTime(e.Item.Cells[10].Text.Trim()).Ticks == 0) e.Item.Cells[10].Text = "&nbsp;";//

                //if (Convert.ToDateTime(e.Item.Cells[11].Text.Trim()).Ticks == 0) e.Item.Cells[11].Text = "&nbsp;";//

                //if (Convert.ToDateTime(e.Item.Cells[9].Text.Trim()).Ticks == 0) e.Item.Cells[9].Text = "&nbsp;";//

                //if (Convert.ToDateTime(e.Item.Cells[8].Text.Trim()).Ticks == 0) e.Item.Cells[8].Text = "&nbsp;";//

                TextBox dg_txt_QRCode = e.Item.FindControl("dg_txt_QRCode") as TextBox;

                Label dg_lab_ProcessOrder = e.Item.FindControl("dg_lab_ProcessOrder") as Label;

                Label statusid = e.Item.FindControl("dg_lab_statusid") as Label;

                Label dg_lab_Count = e.Item.FindControl("dg_lab_Count") as Label;

                if (Convert.ToInt32(dg_lab_ProcessOrder.Text) == 1 && Convert.ToString(statusid.Text).Equals("Ready") && dg_txt_QRCode.Text.Equals(""))
                {
                    dg_txt_QRCode.ReadOnly = false;
                }
                else
                {
                    dg_txt_QRCode.ReadOnly = true;
                }

                if (dpl_status.SelectedValue.Equals("Ready"))
                {
                    if (statusid.Text.Equals("Ready"))
                    {
                        Label dg_lab_readyCount = e.Item.FindControl("dg_lab_readyCount") as Label;
                        dg_lab_Count.Text = dg_lab_readyCount.Text;


                        if (pi.FinishedDirectly && pi.EndDirectly)
                        {
                            Label dg_lab_startCount = e.Item.FindControl("dg_lab_startCount") as Label;
                            dg_lab_Count.Text = dg_lab_startCount.Text;
                        }

                    }
                    if (statusid.Text.Equals("Holdon"))
                    {
                        Label dg_lab_holdCount = e.Item.FindControl("dg_lab_holdCount") as Label;
                        dg_lab_Count.Text = dg_lab_holdCount.Text;
                    }

                }
                if (dpl_status.SelectedValue.Equals("Holdon") || dpl_status.SelectedValue.Equals("Implementation"))
                {
                    Label dg_lab_startCount = e.Item.FindControl("dg_lab_startCount") as Label;
                    dg_lab_Count.Text = dg_lab_startCount.Text;
                }

                    ColorConverter cc = new ColorConverter();
                if (!Methods.TranslateStatusColor(statusid.Text.Trim()).Equals(""))
                {
                    Color c = (Color)cc.ConvertFromString("#" + Methods.TranslateStatusColor(statusid.Text.Trim()).Substring(2).Trim());
                    statusid.BackColor = c;
                    statusid.Text = Methods.TranslateStatusName(statusid.Text.Trim());
                }


                Label dg_lab_ProcessNo = e.Item.FindControl("dg_lab_ProcessNo") as Label;
                int processno = Convert.ToInt32(dg_lab_ProcessNo.Text);
                ModuleWorkFlow.BLL.PartProcess pp = new PartProcess();
                PartProcessInfo ppi = new PartProcessInfo();
                ppi = pp.getPartProcessInfo(processno);
             

                DropDownList dpl_departmentid = (DropDownList)e.Item.FindControl("dg_dpl_departmentid");
                ModuleWorkFlow.BLL.DepartMent department = new DepartMent();
                IList idepartmentid = department.GetAllDepartment(lab_menuid.Text);
                dpl_departmentid.DataSource = idepartmentid;
                dpl_departmentid.DataTextField = "DepartName";
                dpl_departmentid.DataValueField = "DepartMentId";
                dpl_departmentid.DataBind();

                DropDownList dpl_user = (DropDownList)e.Item.FindControl("dg_dpl_user");
                ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
                if (!dpl_departmentid.SelectedValue.Equals(""))
                {
                    IList iuser = user.getUserInfoByDepartment(Convert.ToInt32(dpl_departmentid.SelectedValue));//user.getListUserInfo()
                    dpl_user.DataSource = iuser;
                    dpl_user.DataTextField = "name";
                    dpl_user.DataValueField = "username";
                    dpl_user.DataBind();
                }

                //deal machine 

              
                TextBox txt_user = e.Item.FindControl("dpl_txt_user") as TextBox;
                if (ppi.UserId != null && !ppi.UserId.Equals("") && !dpl_status.SelectedValue.Equals("Ready"))
                {
                    txt_user.Text = ppi.UserId;
                }
                else
                {
                    if (Session["userid"] != null && dpl_alluserno.SelectedValue.Equals(""))
                    {
                        txt_user.Text = Session["userid"].ToString();
                    }
                    else
                    {
                        txt_user.Text = dpl_alluserno.SelectedValue;
                    }
                }
                DropDownList dpl_machineId = e.Item.FindControl("dpl_machineId") as DropDownList;
                if (pi.NeedSchedule == 1)
                {

                    //Machine machine = new Machine();
                    //IList machines = machine.GetAllMachineList(drp_processlist.SelectedValue);
                    //if  (dpl_status.SelectedValue.Trim().Equals("Ready")){
                    //    machines = machine.GetAllMachineListCanUsed(drp_processlist.SelectedValue);
                    //}
                    IList responsiblers = new ArrayList();
                    Hashtable hmachineResponsibles = new Hashtable();
                    if (!txt_user.Text.Equals(""))
                    {
                        MachineUser mu = new MachineUser();
                        responsiblers = mu.GetMachineIdFilter(drp_processlist.SelectedValue, txt_user.Text, machines);
                        foreach (MachineUserInfo mui in responsiblers)
                        {
                            hmachineResponsibles.Add(mui.MachineId, mui);
                        }
                    }

                    foreach (MachineInfo mi in machines)
                    {
                        if (!hmachineResponsibles.ContainsKey(mi.Id))
                        {
                            MachineUserInfo mui = new MachineUserInfo();
                            mui.MachineId = mi.Id;
                            responsiblers.Add(mui);
                        }
                    }


                    dpl_machineId.DataSource = responsiblers;
                    dpl_machineId.DataTextField = "MachineId";
                    dpl_machineId.DataValueField = "MachineId";
                    dpl_machineId.DataBind();
                }

                ImageButton dg_btn_user = e.Item.FindControl("dg_btn_user") as ImageButton;


                if (!lab_type.Text.Equals("batchHold"))
                {
                    if (dpl_status.SelectedValue.Trim().Equals("Holdon") || dpl_status.SelectedValue.Trim().Equals("Implementation"))
                    {

                        if (MainDataGrid.Columns[13].Visible)
                        {
                            dpl_machineId.SelectedValue = ppi.DesignateMachineId;
                            dpl_machineId.Enabled = false;
                        }
                    }
                }
                else
                {
                    TextBox txt_hold_comment = e.Item.FindControl("txt_hold_comment") as TextBox;

                    if (lab_type.Text.Equals("batchHold"))
                    {
                        txt_hold_comment.Text = "休息";
                        txt_hold_comment.ReadOnly = true;
                    }
                    dg_btn_user.Visible = false;
                    txt_user.ReadOnly = true;
                    if (MainDataGrid.Columns[13].Visible)
                    {
                        dpl_machineId.SelectedValue = ppi.DesignateMachineId;
                        dpl_machineId.Enabled = false;
                    }
                }


                Label lab_partno = e.Item.FindControl("dg_lab_partno") as Label;
                ModuleWorkFlow.BLL.Part part = new Part();
                ModuleWorkFlow.Model.PartInfo partinfo = new PartInfo();
                partinfo = part.getPartInfo(ppi.ModuleId, ppi.PartNo);
                if (partinfo != null)
                {
                    lab_partno.Text = partinfo.PartName;
                }


            }
        }

        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;

            BindDataDBGrid(dpl_alluserno.SelectedValue);
        }

        private void dpl_status_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            if (!dpl_status.SelectedValue.Equals("Ready"))
            {
                foreach (DataGridColumn column in MainDataGrid.Columns)
                {
                    // 根据列的类型或 HeaderText 隐藏列
                    if (column is TemplateColumn || column.HeaderText == "QRCode")
                    {
                        column.Visible = false; // 设置列不可见
                    }
                }
            }
          
            MainDataGrid.CurrentPageIndex = 0;
            BindDataDBGrid(dpl_alluserno.SelectedValue);
            Label_Message.Text = "";
        }

        private void drp_processlist_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("COOKIEGCLICKROCESSID", drp_processlist.SelectedValue);
            Response.Cookies.Add(cookie);

            MainDataGrid.CurrentPageIndex = 0;


            BindDataDBGrid(dpl_alluserno.SelectedValue);
            Label_Message.Text = "";
        }

        public void chkall_onchanged(object sender, System.EventArgs e)
        {
            CheckBox checkall = (CheckBox)sender;
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox chk = (CheckBox)MainDataGrid.Items[i].FindControl("CheckBox_Select");
                chk.Checked = checkall.Checked;
            }
        }

        private void bnt_submission_Click(object sender, System.EventArgs e)
        {
            bool needMachine = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["needMachine"]);
            Schedule schedule = new Schedule();
            Label_Message.Text = "";
            PartScanBar scanbar = new PartScanBar();
            ModuleWorkFlow.BLL.PartProcess partprocess = new ModuleWorkFlow.BLL.PartProcess();
            IList checkpartprocess = new ArrayList();
            huserno = new ModuleWorkFlow.BLL.User().getUserName();

            ModuleWorkFlow.BLL.User u = new ModuleWorkFlow.BLL.User();

            string userno = "";
            string username = "";


            IList usermsg = new ArrayList();

            DateTime StartDate = DateTime.Now;
            DateTime scanTime = DateTime.Now;

            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);


            bool ret = false;
            Label_Message.Text = "";
            int partcount = 1;
            string groupprocessno = "";
            string actionid = "";
            string actionvalue = "";
            switch (dpl_status.SelectedValue)
            {
                case "Ready":
                    actionid = "KAISHI";
                    actionvalue = "開始";
                    if (pi.FinishedDirectly && pi.EndDirectly)
                    {
                        actionid = "JIEDAN";
                        actionvalue = "接單";
                    }
                    break;
                case "Holdon":
                    actionid = "ZANTING";
                    actionvalue = "暫停";
                    break;
                case "Implementation":
                    actionid = "JIESHU";
                    actionvalue = "結束";
                    break;
                default:
                    break;
            }
            Hashtable hprprocessno = new Hashtable();

            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox CheckBox_Select = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;

                bool isSelect = CheckBox_Select.Checked;
                if (isSelect)
                {
                    TextBox txt_user = MainDataGrid.Items[i].FindControl("dpl_txt_user") as TextBox;
                    userno = txt_user.Text.Trim();
                    if (!userno.Equals(""))
                    {
                        if (hasDuplicateUserNo(userno))
                        {
                            Label_Message.Text = Label_Message.Text + "用戶不可重複且必須存在";
                            return;
                        }
                        else
                        {
                            if (!checkRoleProcess(userno))
                            {
                                return;
                            }
                        }
                    }
                    else
                    {
                        Label_Message.Text = Label_Message.Text + "用戶不能為空";
                        return;

                    }
                }
            }


            List<PartPartProcessInfo> source = new List<PartPartProcessInfo>();
            List<PartPartProcessInfo> QRCodeSource = new List<PartPartProcessInfo>();
            Hashtable hMachine = new Hashtable();
            ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
            IList partProcessHolds = new ArrayList();
            string ModuleId = "";
            string PartNo = "";
            Hashtable hsameprocessno = new Hashtable();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                //source.Clear();
                CheckBox CheckBox_Select = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;

                bool isSelect = CheckBox_Select.Checked;


                ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour ppddw = new ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour();

                //MYD0123-3
                int processno = Convert.ToInt32((MainDataGrid.Items[i].FindControl("dg_lab_ProcessNo") as Label).Text);
                Label dg_lab_ProcessOrder = MainDataGrid.Items[i].FindControl("dg_lab_ProcessOrder") as Label;
                if (hsameprocessno.ContainsKey(processno))
                {
                    continue;
                }



                if (isSelect)
                {
                    TextBox dg_txt_QRCode = MainDataGrid.Items[i].FindControl("dg_txt_QRCode") as TextBox;
                    PartPartProcessInfo ppi = pp.getPartProcessInfo(processno);
                    if (!dg_txt_QRCode.ReadOnly)
                    {
                        if (Convert.ToInt32(dg_lab_ProcessOrder.Text) == 1 && string.IsNullOrEmpty(dg_txt_QRCode.Text))
                        {
                            Label_Message.Text = $@"{(MainDataGrid.Items[i].FindControl("dg_lab_partnoId") as Label).Text} 必須要綁定箱子條碼;";
                            return;
                        }
                        PartPartProcessInfo partPartProcessInfo = new PartPartProcessInfo();
                        partPartProcessInfo.ModuleId = ppi.ModuleId;
                        partPartProcessInfo.PartNo_Id = ppi.PartNo_Id;
                        partPartProcessInfo.QRCode = dg_txt_QRCode.Text;
                        QRCodeSource.Add(partPartProcessInfo);
                    }

                 

                    Label dg_lab_readyCount = MainDataGrid.Items[i].FindControl("dg_lab_readyCount") as Label;
                    ppi.ReadyCount = Convert.ToInt32(dg_lab_readyCount.Text);
                    ppi.GetCount = ppi.ReadyCount;

                    Label dg_lab_startCount = MainDataGrid.Items[i].FindControl("dg_lab_startCount") as Label;
                    ppi.StartCount = Convert.ToInt32(dg_lab_startCount.Text);

                    Label dg_lab_holdCount = MainDataGrid.Items[i].FindControl("dg_lab_holdCount") as Label;
                    ppi.HoldCount = Convert.ToInt32(dg_lab_holdCount.Text);

                    Label dg_lab_finishedCount = MainDataGrid.Items[i].FindControl("dg_lab_finishedCount") as Label;
                    ppi.FinishedCount = Convert.ToInt32(dg_lab_finishedCount.Text);
                    ppi.OutCount = ppi.FinishedCount;

                    if (pi.FinishedDirectly && pi.EndDirectly)
                    {
                        ppi.OutCount = ppi.GetCount;
                    }


                    if (!hprprocessno.Contains(processno))
                    {
                        hprprocessno.Add(processno, processno);
                    }


                    TextBox txt_user = MainDataGrid.Items[i].FindControl("dpl_txt_user") as TextBox;


                    usermsg = this.CheckUserNo(txt_user.Text.Trim());
                    if (usermsg.Count > 0)
                    {
                        foreach (string m in usermsg)
                        {
                            Label_Message.Text += m + "<br>";
                        }
                        usermsg.Clear();
                        break;
                    }

                    userno = txt_user.Text.Trim();




                    string[] usernos = userno.Split(',');
                    username = "";
                    for (int j = 0; j < usernos.Length; j++)
                    {
                        if (huserno.ContainsKey(usernos[j]))
                        {
                            username += huserno[usernos[j]].ToString() + ",";
                        }
                        else
                        {
                            username += usernos[j] + ",";
                        }
                    }

                    if (username.IndexOf(',') > -1)
                    {
                        username = username.Substring(0, username.Length - 1);
                    }



                  
                    ppi.UserId = userno;
                    ppi.UserName = username;

                    source.Add(ppi);

                    if (actionid.Equals("KAISHI") && ppi.StatusId.Equals("Holdon"))
                    {
                        PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                        partProcessHoldInfo.ModuleId = ppi.ModuleId;
                        partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                        partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                        partProcessHoldInfo.Enddate = DateTime.Now;
                        partProcessHolds.Add(partProcessHoldInfo);
                    }

                    if (actionid.Equals("ZANTING"))
                    {
                        TextBox txt_hold_comment = MainDataGrid.Items[i].FindControl("txt_hold_comment") as TextBox;
                        PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                        partProcessHoldInfo.ModuleId = ppi.ModuleId;
                        partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                        partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                        partProcessHoldInfo.Startdate = DateTime.Now;
                        partProcessHoldInfo.Comment = txt_hold_comment.Text;
                        partProcessHoldInfo.Processno = ppi.ProcessNo;
                        partProcessHoldInfo.Status = "Holdon";
                        partProcessHolds.Add(partProcessHoldInfo);

                        if (ppi.SameProcessNo != null)
                        {
                            hsameprocessno.Add(ppi.ProcessNo, ppi);
                            string[] sameprocessnos = ppi.SameProcessNo.Split(',');
                            if (ppi.SameProcessNo.IndexOf("/") > -1)
                            {
                                sameprocessnos = ppi.SameProcessNo.Substring(ppi.SameProcessNo.LastIndexOf("/") + 1).Split(',');
                            }

                            for (int sameIndex = 0; sameIndex < sameprocessnos.Length - 1; sameIndex++)
                            {
                                if (hsameprocessno.ContainsKey(Convert.ToInt32(sameprocessnos[sameIndex])))
                                {
                                    continue;
                                }

                                PartPartProcessInfo sameppi = pp.getPartProcessInfo(Convert.ToInt32(sameprocessnos[sameIndex]));
                                if (!hprprocessno.Contains(Convert.ToInt32(sameprocessnos[sameIndex])))
                                {
                                    hprprocessno.Add(Convert.ToInt32(sameprocessnos[sameIndex]), Convert.ToInt32(sameprocessnos[sameIndex]));
                                }

                                sameppi.UserId = userno;
                                sameppi.UserName = username;
                                source.Add(sameppi);
                                hsameprocessno.Add(sameppi.ProcessNo, sameppi);


                                PartProcessHoldInfo samepartProcessHoldInfo = new PartProcessHoldInfo();
                                samepartProcessHoldInfo.ModuleId = sameppi.ModuleId;
                                samepartProcessHoldInfo.ProcessOrder = sameppi.ProcessOrder;
                                samepartProcessHoldInfo.PartNo_Id = sameppi.PartNo_Id;
                                samepartProcessHoldInfo.Startdate = DateTime.Now;
                                samepartProcessHoldInfo.Comment = txt_hold_comment.Text;
                                samepartProcessHoldInfo.Processno = sameppi.ProcessNo;
                                samepartProcessHoldInfo.Status = "Holdon";
                                partProcessHolds.Add(samepartProcessHoldInfo);
                            }




                        }
                    }

                    ModuleId = ppi.ModuleId;
                    PartNo = ppi.PartNo;

                }

            }
            string msg = "";
            if (source.Count > 0)
            {
                IList updateQRCode = new ArrayList();
                updateQRCode.Add(new PartPartProcess().addAllPartProcessQRCode(QRCodeSource));
                if (new Schedule().SaveSchedule(updateQRCode))
                {
                    msg = scanbar.updatePartProcessInfo(source, actionid, actionvalue, pi, 8, 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                }
                else
                {
                    Label_Message.Text = "條碼綁定錯誤";
                    return;
                }
             
            }
            else
            {
                Label_Message.Text = "請選擇零件";
                return;
            }

            if (!msg.Equals(Utility.Translate.translateString("保存成功")))
            {
                Label_Message.Text = ModuleId + "," + PartNo + "及以後保存失敗," + msg;
            }


            if (Label_Message.Text.Equals(""))
            {
                Label_Message.Text = Utility.Translate.translateString("保存成功");
            }



            MainDataGrid.CurrentPageIndex = 0;
            BindDataDBGrid(dpl_alluserno.SelectedValue);

        }

        private bool hasDuplicateUserNo(string userno)
        {
            bool result = false;
            User user = new User();
            string[] users = userno.Split(',');
            for (int i = 0; i < users.Length; i++)
            {
                if (user.getUserInfo(users[i]) == null)
                {
                    result = true;
                    break;
                }

                for (int j = i + 1; j < users.Length; j++)
                {
                    if (users[i].Equals(users[j]))
                    {
                        result = true;
                        break;
                    }
                }


            }


            return result;
        }


        private string checkinnput(string userno)
        {
            string msg = "";
            ModuleWorkFlow.BLL.User user = new User();

            if (user.getUserInfo(userno) == null)
            {
                msg = msg + userno + " " + Lang.NO_User;
                return msg;
            }

            return msg;
        }

        public void dpl_userno_SelectedIndexChanged(object sender, System.EventArgs e)
        {

            DropDownList list = (DropDownList)sender;
            TableCell cell = list.Parent as TableCell;
            DataGridItem item = cell.Parent as DataGridItem;
            int i = item.ItemIndex;
            Label lab_userno = MainDataGrid.Items[i].FindControl("dg_lab_departmentshow") as Label;
            DropDownList dpl_userno = MainDataGrid.Items[i].FindControl("dg_dpl_user") as DropDownList;
            Label lab_departmentid = MainDataGrid.Items[i].FindControl("dg_lab_usershow") as Label;
            DropDownList dpl_departmentid = MainDataGrid.Items[i].FindControl("dg_dpl_departmentid") as DropDownList;
            TextBox txt_userno = MainDataGrid.Items[i].FindControl("dpl_txt_user") as TextBox;
            ImageButton btn_user = MainDataGrid.Items[i].FindControl("dg_btn_user") as ImageButton;
            Label dg_lab_truedepartmentid = MainDataGrid.Items[i].FindControl("dg_lab_truedepartmentid") as Label;
            btn_user.Visible = false;
            if (!txt_userno.Text.Equals(""))
            {
                txt_userno.Text += "," + dpl_userno.SelectedValue;
            }
            else
            {
                txt_userno.Text = dpl_userno.SelectedValue;
            }
            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
            if (pi.NeedSchedule == 1)
            {
                DropDownList dpl_machineId = MainDataGrid.Items[i].FindControl("dpl_machineId") as DropDownList;
                Machine machine = new Machine();
                IList machines = machine.GetAllMachineList(drp_processlist.SelectedValue);
                if (dpl_status.SelectedValue.Trim().Equals("Ready"))
                {
                    machines = machine.GetAllMachineListCanUsed(drp_processlist.SelectedValue);
                }
                ArrayList responsiblers = new ArrayList();
                Hashtable hmachineResponsibles = new Hashtable();
                MachineUser mu = new MachineUser();
                if (!txt_userno.Text.Equals(""))
                {
                    string[] users = txt_userno.Text.Split(',');
                    for (int j = 0; j < users.Length; j++)
                    {
                        IList machineUsers = mu.GetMachineIdFilter(drp_processlist.SelectedValue, users[j], machines);
                        responsiblers.AddRange(machineUsers);
                        foreach (MachineUserInfo mui in machineUsers)
                        {
                            hmachineResponsibles.Add(mui.MachineId, mui);
                        }
                    }
                }

                foreach (MachineInfo mi in machines)
                {
                    if (!hmachineResponsibles.ContainsKey(mi.Id))
                    {
                        MachineUserInfo mui = new MachineUserInfo();
                        mui.MachineId = mi.Id;
                        responsiblers.Add(mui);
                    }
                }


                dpl_machineId.DataSource = responsiblers;
                dpl_machineId.DataTextField = "MachineId";
                dpl_machineId.DataValueField = "MachineId";
                dpl_machineId.DataBind();
            }




            dg_lab_truedepartmentid.Text = "";

            btn_user.Visible = true;
            dpl_userno.Visible = false;
            dpl_departmentid.Visible = false;
            lab_userno.Visible = false;
            lab_departmentid.Visible = false;


        }

        public void dpl_departmentid_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            DropDownList list = (DropDownList)sender;
            TableCell cell = list.Parent as TableCell;
            DataGridItem item = cell.Parent as DataGridItem;
            int i = item.ItemIndex;

            DropDownList dg_dpl_departmentid = MainDataGrid.Items[i].FindControl("dg_dpl_departmentid") as DropDownList;
            DropDownList dpl_userno = MainDataGrid.Items[i].FindControl("dg_dpl_user") as DropDownList;

            dpl_userno.Visible = true;
            ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
            IList iuser = user.getUserInfoByDepartment(Convert.ToInt32(dg_dpl_departmentid.SelectedValue));//user.getListUserInfo();
            dpl_userno.DataSource = iuser;
            dpl_userno.DataTextField = "name";
            dpl_userno.DataValueField = "username";
            dpl_userno.DataBind();
        }

        public void dg_btn_user_Click(object sender, System.EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            TableCell cell = btn.Parent as TableCell;
            DataGridItem item = cell.Parent as DataGridItem;
            int i = item.ItemIndex;
            DropDownList dpl_userno = MainDataGrid.Items[i].FindControl("dg_dpl_user") as DropDownList;
            DropDownList dpl_departmentid = MainDataGrid.Items[i].FindControl("dg_dpl_departmentid") as DropDownList;
            Label lab_usershow = MainDataGrid.Items[i].FindControl("dg_lab_usershow") as Label;
            Label lab_departmentshow = MainDataGrid.Items[i].FindControl("dg_lab_departmentshow") as Label;
            ImageButton btn_user = MainDataGrid.Items[i].FindControl("dg_btn_user") as ImageButton;
            btn_user.Visible = false;
            dpl_departmentid.Visible = true;
            dpl_userno.Visible = true;
            lab_usershow.Visible = true;
            lab_departmentshow.Visible = true;

        }





        private void dpl_customer_SelectedIndexChanged(object sender, System.EventArgs e)
        {
          
            this.BindDataModule();
            Label_Message.Text = "";
            MainDataGrid.CurrentPageIndex = 0;
            this.BindDataDBGrid(dpl_alluserno.SelectedValue);
        }

        private void dpl_module_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            Label_Message.Text = "";
            MainDataGrid.CurrentPageIndex = 0;
            this.BindDataDBGrid(dpl_alluserno.SelectedValue);
        }

        public bool percent(double numerator, double denominator, int percent)
        {
            bool ret = true;
            if (denominator != 0 && percent != 0)
            {
                if (numerator / denominator * 100 > (100 - percent))
                {
                    ret = false;
                }
            }
            return ret;
        }


        private IList CheckUserNo(string userno)
        {
            IList msg = new ArrayList();
            string[] check = userno.Trim().Split(',');
            for (int i = 0; i < check.Length; i++)
            {
                if (!huserno.ContainsKey(check[i].Trim()))
                {
                    string usermsg = check[i].Trim() + ":此員工編號不存在";
                    msg.Add(usermsg);
                }

            }
            return msg;
        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            bnt_submission_Click(sender, e);
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "";
            MainDataGrid.CurrentPageIndex = 0;
            BindDataDBGrid(dpl_alluserno.SelectedValue);
            Label_Message.Text = "";
        }

        public bool checkRoleProcess(string userno)
        {
            BRoleProcess rp = new BRoleProcess();
            string[] users = userno.Split(',');
            for (int i = 0; i < users.Length; i++)
            {
                if (!rp.checkRoleProcess(users[i].ToString(), drp_processlist.SelectedValue))
                {
                    Label_Message.Text = Label_Message.Text + " 用戶" + users[i].ToString() + "沒有權限";
                    return false;
                }
            }
            return true;
        }


    }

}
