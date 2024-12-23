using System;
using System.Collections;
using System.Collections.Generic;
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
using Utility;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;

using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;
using ModuleWorkFlow.BLL.System;
//using ModuleWorkFlow.Model.Outsource;
using ModuleWorkFlow.Model.System;
using LibGit2Sharp;
using static System.Net.Mime.MediaTypeNames;
using System.Linq;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for PartAddEdit.
    /// </summary>
    public class StandardPartAddEdit : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.TextBox TextBox_Meterial;
        protected System.Web.UI.WebControls.RangeValidator RangeValidator1;
        //protected ModuleWorkFlow.controls.Style Style;
        protected System.Web.UI.WebControls.CheckBoxList CheckBoxList_Process;
        protected CheckBoxList CheckBoxList1;
        protected System.Web.UI.WebControls.Label Label_Hidden;

        protected System.Web.UI.WebControls.DropDownList dpl_standardtype;
        protected System.Web.UI.WebControls.Label Label_HiddenFuncMode;
        protected System.Web.UI.WebControls.Label Label_HiddenSelectRow;
        protected System.Web.UI.WebControls.Label Label_Message;
        
        private PartStandProcess standprocess;
        protected System.Web.UI.WebControls.Label Label_HiddenPartNo;
        protected DropDownList dpl_processGroup;



        protected TextBox txt_name;


        private string menuid = "I02";
        protected string title;
        private List<SupplyInfo> supplyInfos;
        protected System.Web.UI.WebControls.Label lab_zuli;

        private void Page_Load(object sender, System.EventArgs e)
        {
            TmenuInfo mi = new Tmenu().findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                title = mi.Menuname;
            }
            standprocess = new PartStandProcess();
            if (!this.IsPostBack)
            {
               


             


                Label_HiddenSelectRow.Text = "-1";
                Label_Message.Text = "";

                BindDataProcessAll();
                BindProcessType();

                string func = Request.Params["func"];
                //					string func = "edit";
                if (func != null && func.Equals("edit"))
                {
                    //edit mode
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                    string type = Server.UrlDecode(Request.Params["type"]);
                    //						string type = "獀ㄣ摸ㄥ□□美";
                    string name = Server.UrlDecode(Request.Params["name"]);
                    dpl_standardtype.SelectedValue = type;
                    dpl_standardtype.Enabled = false;

                    txt_name.Text = name;
                    txt_name.ReadOnly = true;

                    if (Request.Params["partno"] != null)
                        name = Server.UrlDecode(Request.Params["partno"]);


                    Label_HiddenFuncMode.Text = "edit";
                    InitalEditPage(Convert.ToInt32(type), name);
                }
                else
                {
                    //add mode	
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");


                    Label_HiddenFuncMode.Text = "add";
                    IList fixprocesses = new ArrayList();
                    MainDataGrid.DataSource = fixprocesses;
                    MainDataGrid.DataBind();
                }


            }

           
           



        }


       

        private void BindProcessType()
        {
           

            StandProcessType standprocesstype = new StandProcessType();
            dpl_standardtype.DataSource = standprocesstype.GetStandProcessType(false);
            dpl_standardtype.DataTextField = "TypeName";
            dpl_standardtype.DataValueField = "id";
            dpl_standardtype.DataBind();
        }

        private void InitalEditPage(int type, string name)
        {
          
           
            txt_name.ReadOnly = true;
           
            dataStandBind(type, name);
        }

        private void dataStandBind(int processtype, string standprocessname)
        {
            
            PartStandProcess standprocess = new PartStandProcess();
            List<PartStandProcessInfo> standprocesses = new List<PartStandProcessInfo>();
            
            standprocesses = standprocess.GetStandProcessByName(processtype, standprocessname);
           
            
            MainDataGrid.DataSource = standprocesses;
            MainDataGrid.DataBind();






            //get hours per day from process table
            //			Hashtable htProcess = ModuleWorkFlow.business.Process.getProcessHoursPerDay();

            //retieved all data

            supplyInfos = new Supply().GetSupplyInfos();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                Label lab_id = MainDataGrid.Items[i].FindControl("lab_id") as Label;
                DropDownList dpl_Supply = (DropDownList)MainDataGrid.Items[i].FindControl("dpl_Supply");
                dpl_Supply.DataSource = supplyInfos.FindAll(m => m.ProcessIdList != null && m.ProcessIdList.IndexOf(label_processid.Text.Trim() + ",") > -1);
                dpl_Supply.DataTextField = "SupplierName";
                dpl_Supply.DataValueField = "Id";
                dpl_Supply.DataBind();
                if ((standprocesses.FindAll(m=>m.Id == Convert.ToInt32(lab_id.Text.Trim())))[0].SupplyId > 0)
                {
                    dpl_Supply.SelectedValue = (standprocesses.FindAll(m => m.Id == Convert.ToInt32(lab_id.Text.Trim())))[0].SupplyId.ToString();
                }








            }
            disableQCPercent();
        }


        private void BindDataProcessAll()
        {
            ModuleWorkFlow.BLL.Process process = new ModuleWorkFlow.BLL.Process();
            List<ModuleWorkFlow.Model.ProcessInfo> processes
                = process.getProcessInfoExceptDesign().Cast<ModuleWorkFlow.Model.ProcessInfo>().ToList();

            var groupedProcesses = processes
             .Select(p => new
             {
                 JobGroup = string.IsNullOrEmpty(p.JobGroup) ? "" : p.JobGroup,
                 JobGroupName = string.IsNullOrEmpty(p.JobGroup) ? "其它" : p.JobGroupName,
                 ProcessInfo = p
             })
             .GroupBy(p => new { p.JobGroup, p.JobGroupName })
             .Select(g => new
             {
                 JobGroup = g.Key.JobGroup,
                 JobGroupName = g.Key.JobGroupName
             })
            .ToList();

            dpl_processGroup.DataSource = groupedProcesses;
            dpl_processGroup.DataTextField = "JobGroupName";
            dpl_processGroup.DataValueField = "JobGroup";
            dpl_processGroup.DataBind();

            var filteredProcesses = processes.FindAll(m => m.JobGroup!=null && m.JobGroup.Equals(dpl_processGroup.SelectedValue));

            // Group the filtered processes by ProcessName and ProcessId
            var groupedFilterProcesses = filteredProcesses
                .GroupBy(p => new { p.ProcessName, p.ProcessId })
                .Select(g => new
                {
                    ProcessName = g.Key.ProcessName,
                    ProcessId = g.Key.ProcessId
                })
                .ToList();


            CheckBoxList_Process.DataTextField = "ProcessName";
            CheckBoxList_Process.DataValueField = "ProcessId";
            CheckBoxList_Process.DataSource = groupedFilterProcesses;
            CheckBoxList_Process.DataBind();

            //CheckBoxList1.DataTextField = "CustomerProcessName";
            //CheckBoxList1.DataValueField = "CustomerProcessId";
            //CheckBoxList1.DataSource = processes.FindAll(m => !m.PriceType.Equals("QC"));
            //CheckBoxList1.DataBind();

        }



        private void BindDataProcess(IList processList)
        {
            MainDataGrid.DataSource = ModuleWorkFlow.business.Process.getProcessViewByProcessList(processList);
            MainDataGrid.DataBind();

            //init TextBox_NeedTime input box and DropDownList_UnitSelect
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                Label label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                DropDownList DDLDay = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList DDLHour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList DDLMinute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;

                label_OrderNo.Text = Convert.ToString(i + 1);
                business.Methods.DropDownListInit(DDLDay, 0, Setting.DAYS);
                business.Methods.DropDownListInit(DDLHour, 0, Setting.HOURS - 1);
                business.Methods.MinuteDropDownListInit(DDLMinute);
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
            this.CheckBoxList_Process.SelectedIndexChanged += new System.EventHandler(this.CheckBoxList_Process_SelectedIndexChanged);
            this.MainDataGrid.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.MainDataGrid_ItemCommand);
            //this.MainDataGrid.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.MainDataGrid_DeleteCommand);
            //this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.MainDataGrid.SelectedIndexChanged += new System.EventHandler(this.MainDataGrid_SelectedIndexChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion


        private void MainDataGrid_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            int index = e.Item.ItemIndex;
            supplyInfos = new Supply().GetSupplyInfos();
            switch (((Button)e.CommandSource).CommandName)
            {
                case "Upper":
                    if (index > 0)
                    {
                        Label label_processid = MainDataGrid.Items[index].FindControl("Label_ProcessID") as Label;
                        Label Label_ProcessName = MainDataGrid.Items[index].FindControl("Label_ProcessName") as Label;
                        TextBox textminute = (TextBox)MainDataGrid.Items[index].FindControl("dg_txt_minute");
                        Label label_id = (Label)MainDataGrid.Items[index].FindControl("lab_id");
                        Label lab_ProcessNo = (Label)MainDataGrid.Items[index].FindControl("lab_ProcessNo");
                        TextBox txt_processComment = (TextBox)MainDataGrid.Items[index].FindControl("txt_processComment");
                        DropDownList dpl_Supply = (DropDownList)MainDataGrid.Items[index].FindControl("dpl_Supply");
                        TextBox dg_txt_qcPercent = (TextBox)MainDataGrid.Items[index].FindControl("dg_txt_qcPercent");



                        Label label_processidUp = MainDataGrid.Items[index - 1].FindControl("Label_ProcessID") as Label;
                        Label Label_ProcessNameUp = MainDataGrid.Items[index - 1].FindControl("Label_ProcessName") as Label;
                        TextBox textminuteup = (TextBox)MainDataGrid.Items[index - 1].FindControl("dg_txt_minute");
                        Label label_idUp = (Label)MainDataGrid.Items[index - 1].FindControl("lab_id");
                        Label lab_ProcessNoUp = (Label)MainDataGrid.Items[index-1].FindControl("lab_ProcessNo");
                        TextBox txt_processCommentUp = (TextBox)MainDataGrid.Items[index-1].FindControl("txt_processComment");
                        DropDownList dpl_SupplyUp = (DropDownList)MainDataGrid.Items[index-1].FindControl("dpl_Supply");
                        TextBox dg_txt_qcPercentUp = (TextBox)MainDataGrid.Items[index-1].FindControl("dg_txt_qcPercent");



                        string temp_processid = label_processid.Text;
                        string temp_Processname = Label_ProcessName.Text;
                        string temp_minute = textminute.Text;
                        string temp_id = label_id.Text;
                        string temp_processno = lab_ProcessNo.Text;
                        string temp_processComment = txt_processComment.Text;
                        string temp_supply = dpl_Supply.SelectedValue;
                        string temp_qcPercent = dg_txt_qcPercent.Text;



                        label_processid.Text = label_processidUp.Text;
                        Label_ProcessName.Text = Label_ProcessNameUp.Text;
                        textminute.Text = textminuteup.Text;
                        txt_processComment.Text = txt_processCommentUp.Text;

                        dpl_Supply.DataSource  = supplyInfos.FindAll(m => m.ProcessIdList != null && m.ProcessIdList.IndexOf(label_processid.Text.Trim() + ",") > -1);
                        dpl_Supply.DataBind();
                        dpl_Supply.SelectedValue = dpl_SupplyUp.SelectedValue;
                        dg_txt_qcPercent.Text = dg_txt_qcPercentUp.Text;
                         

                        label_id.Text = label_idUp.Text;
                        lab_ProcessNo.Text = lab_ProcessNoUp.Text;
                       
                        textminuteup.Text = temp_minute;
                        label_processidUp.Text = temp_processid;
                       
                        Label_ProcessNameUp.Text = temp_Processname;
                        label_idUp.Text = temp_id;
                        lab_ProcessNoUp.Text = temp_processno;
                        txt_processCommentUp.Text = temp_processComment;
                        dpl_SupplyUp.DataSource = supplyInfos.FindAll(m => m.ProcessIdList != null && m.ProcessIdList.IndexOf(label_processidUp.Text.Trim() + ",") > -1);
                        dpl_SupplyUp.DataBind();
                        dpl_SupplyUp.SelectedValue = temp_supply;
                        dg_txt_qcPercentUp.Text = temp_qcPercent;



                    }
                    break;

                case "Lower":
                    if (index < MainDataGrid.Items.Count - 1)
                    {
                        Label label_processid = MainDataGrid.Items[index].FindControl("Label_ProcessID") as Label;
                        Label Label_ProcessName = MainDataGrid.Items[index].FindControl("Label_ProcessName") as Label;
                        Label label_id = (Label)MainDataGrid.Items[index].FindControl("lab_id");
                        Label lab_ProcessNo = (Label)MainDataGrid.Items[index].FindControl("lab_ProcessNo");
                        TextBox textminute = (TextBox)MainDataGrid.Items[index].FindControl("dg_txt_minute");
                        TextBox txt_processComment = (TextBox)MainDataGrid.Items[index].FindControl("txt_processComment");
                        DropDownList dpl_Supply = (DropDownList)MainDataGrid.Items[index].FindControl("dpl_Supply");
                        TextBox dg_txt_qcPercent = (TextBox)MainDataGrid.Items[index].FindControl("dg_txt_qcPercent");


                        Label label_processidLow = MainDataGrid.Items[index + 1].FindControl("Label_ProcessID") as Label;
                        Label label_ProcessnameLow = MainDataGrid.Items[index + 1].FindControl("Label_ProcessName") as Label;
                        Label label_idLow = (Label)MainDataGrid.Items[index + 1].FindControl("lab_id");
                        Label lab_ProcessNoLow = (Label)MainDataGrid.Items[index + 1].FindControl("lab_ProcessNo");
                        TextBox txt_processCommentLow = (TextBox)MainDataGrid.Items[index + 1].FindControl("txt_processComment");
                        DropDownList dpl_SupplyLow = (DropDownList)MainDataGrid.Items[index + 1].FindControl("dpl_Supply");
                        TextBox textminutelow = (TextBox)MainDataGrid.Items[index + 1].FindControl("dg_txt_minute");
                        TextBox dg_txt_qcPercentlow = (TextBox)MainDataGrid.Items[index + 1].FindControl("dg_txt_qcPercent");



                        string temp_processid = label_processid.Text;
                        string temp_Processname = Label_ProcessName.Text;
                        string temp_id = label_id.Text;
                        string temp_processno = lab_ProcessNo.Text;
                        string temp_minute = textminute.Text;
                        string temp_processComment = txt_processComment.Text;
                        string temp_supply = dpl_Supply.SelectedValue;
                        string temp_qcPercent = dg_txt_qcPercent.Text;

                        label_processid.Text = label_processidLow.Text;
                        Label_ProcessName.Text = label_ProcessnameLow.Text;
                        textminute.Text = textminutelow.Text;
                        label_id.Text = label_idLow.Text;
                        lab_ProcessNo.Text = lab_ProcessNoLow.Text;
                        txt_processComment.Text = txt_processCommentLow.Text;

                        dpl_Supply.DataSource = supplyInfos.FindAll(m => m.ProcessIdList != null && m.ProcessIdList.IndexOf(label_processid.Text.Trim() + ",") > -1);
                        dpl_Supply.DataBind();
                        dpl_Supply.SelectedValue = dpl_SupplyLow.SelectedValue;
                        dg_txt_qcPercent.Text = dg_txt_qcPercentlow.Text;


                        label_processidLow.Text = temp_processid;
                       
                        label_ProcessnameLow.Text = temp_Processname;
                        label_idLow.Text = temp_id;
                        lab_ProcessNoLow.Text = temp_processno;
                       
                        textminutelow.Text = temp_minute;
                        txt_processCommentLow.Text = temp_processComment;
                        dpl_SupplyLow.DataSource = supplyInfos.FindAll(m => m.ProcessIdList != null && m.ProcessIdList.IndexOf(label_processidLow.Text.Trim() + ",") > -1);
                        dpl_SupplyLow.DataBind();
                        dpl_SupplyLow.SelectedValue = temp_supply;
                        dg_txt_qcPercentlow.Text = temp_qcPercent;

                    }
                    break;

                case "Select":
                    var originalColor = e.Item.BackColor;
                    for (int i = 0; i < MainDataGrid.Items.Count; i++)
                    {
                        MainDataGrid.Items[i].BackColor = Color.White;
                    }
                    if (originalColor != Setting.SELECTCOLOR)
                    {
                        e.Item.BackColor = Setting.SELECTCOLOR;
                        Label_HiddenSelectRow.Text = Convert.ToString(e.Item.ItemIndex);
                    }
                    else
                    {
                        Label_HiddenSelectRow.Text = "-1";
                    }
                    break;

                case "Delete":
                    DeleteDataSource(e.Item.ItemIndex);
                    break;

                default:
                    // Do nothing.
                    break;

            }
            disableQCPercent();

        }

        private void Button_AddEdit_Click(object sender, System.EventArgs e)
        {

            if (userinput() == true)
            {
                if (Label_HiddenFuncMode.Text.Equals("add"))
                {
                    Add();
                }
                else
                {
                    Edit(Convert.ToInt32(dpl_standardtype.SelectedValue), txt_name.Text);
                }
            }

        }

        private bool userinput()
        {
            bool retval = true;


            if (retval && MainDataGrid.Items.Count == 0)
            {
                retval = false;
                Label_Message.Text = Lang.NO_PROCESS;
            }

            if (txt_name.Text.Trim().Equals(""))
            {
                retval = false;
                Label_Message.Text = Translate.translateString("請輸入工藝名稱");
            }

            return retval;
        }

        private void disableQCPercent()
        {
           
            List<Model.ProcessInfo> processList = new BLL.Process().getallProcessInfoExceptDesign().Cast<Model.ProcessInfo>().ToList();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                
 
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
               

                TextBox dg_txt_qcPercent = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_qcPercent");
                if (processList.FindAll(m => m.ProcessId.Equals(label_processid.Text))[0].PriceType.IndexOf("QC") < 0)
                {
                    dg_txt_qcPercent.Text = "";
                    dg_txt_qcPercent.ReadOnly = true;
                    dg_txt_qcPercent.BackColor = Color.LightGray;
                }
                else
                {
                    dg_txt_qcPercent.ReadOnly = false;
                    dg_txt_qcPercent.BackColor = Color.White;
                }
          

            }
        }

        private void Add()
        {
            bool successed = true;

            WorkFlow.Model.Standard.PartStandProcessInfo spi;
            IList processes = new ArrayList();
           
            IList standprocesses = new ArrayList();
            
            standprocesses = standprocess.GetStandProcessByName(Convert.ToInt32(dpl_standardtype.SelectedValue), txt_name.Text.Trim());
            
            if (standprocesses.Count == 0)
            {
                for (int i = 0; i < MainDataGrid.Items.Count; i++)
                {
                    spi = new WorkFlow.Model.Standard.PartStandProcessInfo();
                    spi.StandardProcessName = txt_name.Text;
                    spi.ProcessNo = business.Methods.GenerateUniqueId();
                    if (dpl_standardtype.SelectedValue.Equals(""))
                    {
                        Label_Message.Text = Translate.translateString("請選擇類別");
                        return;
                    }
                    spi.StandardProcessType = Convert.ToInt32(dpl_standardtype.SelectedValue);
                   

                   


                    spi.ListOrder = Convert.ToInt32(((Label)MainDataGrid.Items[i].FindControl("Label_OrderNo")).Text);

                    
                    TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");
                    try
                    {
                      
                        if (!textminute.Text.Trim().Equals(""))
                        {
                            try
                            {
                                int minutes = Convert.ToInt32(textminute.Text);
                                
                                spi.ProcessNeedMinutes = minutes;
                            }
                            catch
                            {
                                Label_Message.Text = Translate.translateString("請填寫數字");
                                return;
                            }
                        }
                      
                        
                      
                    }
                    catch
                    {
                        successed = false;
                    }

                    spi.ProcessId = ((Label)MainDataGrid.Items[i].FindControl("Label_ProcessID")).Text;

                  


                    spi.ProcessComment = ((TextBox)MainDataGrid.Items[i].FindControl("txt_processComment")).Text;

                    DropDownList dpl_Supply = ((DropDownList)MainDataGrid.Items[i].FindControl("dpl_Supply"));

                    if (!string.IsNullOrEmpty(dpl_Supply.SelectedValue))
                    {
                        spi.SupplyId = Convert.ToInt32(dpl_Supply.SelectedValue);
                    }

                    TextBox dg_txt_qcPercent = ((TextBox)MainDataGrid.Items[i].FindControl("dg_txt_qcPercent"));
                    try
                    {
                        if (string.IsNullOrEmpty(dg_txt_qcPercent.Text))
                            spi.QCPercent = 1.0;
                        else
                            if (dg_txt_qcPercent.Text.IndexOf("%") > -1)
                        {
                            spi.QCPercent = Math.Round(Convert.ToDouble(dg_txt_qcPercent.Text.Trim().Substring(0, dg_txt_qcPercent.Text.Trim().Length - 1)) / 100.0, 2);
                        }
                        else
                        {
                            spi.QCPercent = Math.Round(Convert.ToDouble(dg_txt_qcPercent.Text) / 100.0, 2);
                        }
                    }
                    catch
                    {
                        Label_Message.Text = Translate.translateString("請填寫數字");
                        return;
                    }


                    //jg-071211
                    if (spi.ListOrder == 1)
                        spi.StatusId = "Ready";
                    else
                        spi.StatusId = "Pending";

                    //spi.ProcessNo = 0;

                    processes.Add(spi);

                }

                if (successed)
                {
                    IList souce = new ArrayList();
                    souce.Add(standprocess.InsertStandProcess(processes));
                    if (new Schedule().SaveSchedule(souce))
                    {
                        Label_Message.Text = Lang.SAVE_SUCCESS;
                    }else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                    }
                }
                else
                {
                    Label_Message.Text = Lang.INPUT_NUMBER;
                }
            }
            else
            {
                successed = false;
                Label_Message.Text = Lang.NAME_DUPLICATE;
            }


        }

        private void Edit(int type, string name)
        {
            bool successed = true;
           
            WorkFlow.Model.Standard.PartStandProcessInfo spi;

          

            List<PartStandProcessInfo> oldprocess = standprocess.GetStandProcessByName(type, name);

            List<PartStandProcessInfo> newprocesses = new List<PartStandProcessInfo>();




            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                spi = new WorkFlow.Model.Standard.PartStandProcessInfo();


                spi.StandardProcessName = txt_name.Text.Trim();
                spi.StandardProcessType = Convert.ToInt32(dpl_standardtype.SelectedValue);


                spi.ListOrder = Convert.ToInt32(((Label)MainDataGrid.Items[i].FindControl("Label_OrderNo")).Text);

                
                TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");
                //JG-071117
                try
                {
                    
                    if (!textminute.Text.Trim().Equals(""))
                    {
                        try
                        {
                            spi.ProcessNeedMinutes = Convert.ToInt32(Convert.ToInt32(textminute.Text));
                        }
                        catch
                        {
                            Label_Message.Text = Translate.translateString("請填寫數字");
                            return;
                        }
                    }
                   
                   
                }
                catch
                {
                    successed = false;
                }

              
                spi.StandardProcessPartNo = spi.StandardProcessName;

                

                spi.ProcessId = ((Label)MainDataGrid.Items[i].FindControl("Label_ProcessID")).Text;

                

                spi.ProcessName = ((Label)MainDataGrid.Items[i].FindControl("Label_ProcessName")).Text;

                spi.ProcessComment = ((TextBox)MainDataGrid.Items[i].FindControl("txt_processComment")).Text;

                DropDownList dpl_Supply = ((DropDownList)MainDataGrid.Items[i].FindControl("dpl_Supply"));

                if (!string.IsNullOrEmpty(dpl_Supply.SelectedValue))
                {
                    spi.SupplyId = Convert.ToInt32(dpl_Supply.SelectedValue);
                }

                TextBox dg_txt_qcPercent = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_qcPercent");
                try
                {
                    if (string.IsNullOrEmpty(dg_txt_qcPercent.Text))
                        spi.QCPercent = 1.0;
                    else
                         if (dg_txt_qcPercent.Text.IndexOf("%") > -1)
                    {
                        spi.QCPercent = Math.Round(Convert.ToDouble(dg_txt_qcPercent.Text.Trim().Substring(0, dg_txt_qcPercent.Text.Trim().Length - 1)) / 100.0, 2);
                    }
                    else
                    {
                        spi.QCPercent = Math.Round(Convert.ToDouble(dg_txt_qcPercent.Text) / 100.0, 2);
                    }



                }
                catch
                {
                    Label_Message.Text = Translate.translateString("請填寫數字");
                    return;
                }

                if (spi.ListOrder == 1)
                    spi.StatusId = "Ready";
                else
                    spi.StatusId = "Pending";

                spi.Id = Convert.ToInt32(((Label)MainDataGrid.Items[i].FindControl("lab_id")).Text);
                spi.ProcessNo = ((Label)MainDataGrid.Items[i].FindControl("lab_ProcessNo")).Text.Trim();

                newprocesses.Add(spi);  


            }

            if (successed)
            {
                IList insertStandProcesses = new ArrayList();
                IList updatetStandProcesses = new ArrayList();
                IList deleteStandProcesses = new ArrayList();
                foreach (WorkFlow.Model.Standard.PartStandProcessInfo espi in newprocesses)
                {
                    if (espi.Id == 0)
                    {
                        espi.ProcessNo = business.Methods.GenerateUniqueId();
                        insertStandProcesses.Add(espi);
                    }
                    else
                    {
                        updatetStandProcesses.Add(espi);
                        
                    }
                }




                foreach (WorkFlow.Model.Standard.PartStandProcessInfo espi in oldprocess)
                {
                    if (newprocesses.FindAll(m=>m.Id == espi.Id).Count == 0)
                    {
                        deleteStandProcesses.Add(espi);
                    }

                }

                IList souce = new ArrayList();
                souce.Add(standprocess.InsertStandProcess(insertStandProcesses));
                souce.Add(standprocess.UpdateStandProcess(updatetStandProcesses));
                souce.Add(standprocess.DeleteStandProcess(deleteStandProcesses));

                if (new Schedule().SaveSchedule(souce))
                {
                    Label_Message.Text =  Lang.SAVE_SUCCESS;
                }
                else
                {
                    Label_Message.Text = Lang.SAVE_FAIL;
                }
              
            }
        }

        private void CheckBoxList_Process_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //string script = "saveScrollPosition();";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "saveScrollPositionScript", script, true);

            string processid = CheckBoxList_Process.SelectedValue;
            bool hasExisted = false;
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                if (processid.ToLower().Equals(label_processid.Text.Trim().ToLower()))
                {
                    hasExisted = true;
                }
            }

            if (!hasExisted || !(processid.ToLower().Equals("assemble") || processid.ToLower().Equals("design")))
            {
                AddDataSource();
            }

            //clear CheckBoxList_Process all selected item
            for (int i = 0; i < CheckBoxList_Process.Items.Count; i++)
            {
                CheckBoxList_Process.Items[i].Selected = false;
            }
        }

        private void AddDataSource()
        {

            ModuleWorkFlow.BLL.Process process = new ModuleWorkFlow.BLL.Process();
            int selectRow = Convert.ToInt32(Label_HiddenSelectRow.Text);
            if (selectRow > MainDataGrid.Items.Count - 1)
            {
                selectRow = -1;
                Label_HiddenSelectRow.Text = "-1";
            }
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new DataColumn("ListOrder", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessId", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessName", typeof(string)));
            dt.Columns.Add(new DataColumn("Minute", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessNeedMinutes", typeof(string)));
            dt.Columns.Add(new DataColumn("Id", typeof(string)));
            dt.Columns.Add(new DataColumn("processComment", typeof(string)));
            dt.Columns.Add(new DataColumn("supplyId", typeof(string)));
            dt.Columns.Add(new DataColumn("QCPercent", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessNo", typeof(string)));

            ProcessCustomer processCustomer = new ProcessCustomer();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (selectRow != -1 && selectRow == i)
                {
                    //new a record
                    dr = dt.NewRow();

                    dr["ListOrder"] = Convert.ToString(MainDataGrid.Items.Count + 1);
                    dr["ProcessId"] = CheckBoxList_Process.SelectedValue;
                    dr["ProcessName"] = CheckBoxList_Process.SelectedItem.Text.Trim();
                   
                   
                    dr["Minute"] = "0";
                    dr["ProcessNeedMinutes"] = "0";
                    dr["Id"] = "0";
                  
                    dr["supplyId"] = "";
                    dr["processComment"] = "";
                    dr["ProcessNo"] = "";
                    dr["QCPercent"] = "100";
                   
                    
                   
                    dt.Rows.Add(dr);
                }
                Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
               
                Label label_Processname = MainDataGrid.Items[i].FindControl("Label_ProcessName") as Label;
             
                Label label_id = (Label)MainDataGrid.Items[i].FindControl("lab_id");
              
               
                TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");
                DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                TextBox dg_txt_qcPercent = MainDataGrid.Items[i].FindControl("dg_txt_qcPercent") as TextBox;
                Label lab_ProcessNo = MainDataGrid.Items[i].FindControl("lab_ProcessNo") as Label;

                dr = dt.NewRow();

                dr["ListOrder"] = Label_OrderNo.Text.Trim();
                dr["ProcessId"] = label_processid.Text.Trim();
              
                dr["ProcessName"] = label_Processname.Text.Trim();
               
                dr["Minute"] = textminute.Text;
               
                dr["Id"] = label_id.Text;
               
                dr["supplyId"] = dpl_Supply.SelectedValue;
                dr["processComment"] = txt_processComment.Text.Trim();
                dr["QCPercent"] = dg_txt_qcPercent.Text.Trim();
                dr["ProcessNo"] = lab_ProcessNo.Text.Trim();
              

                dt.Rows.Add(dr);
            }

            if (selectRow == -1)
            {
                //new a record
                dr = dt.NewRow();
                dr["ListOrder"] = Convert.ToString(MainDataGrid.Items.Count + 1);
                dr["ProcessId"] = CheckBoxList_Process.SelectedValue;
                dr["ProcessName"] = CheckBoxList_Process.SelectedItem.Text.Trim();
               
              
                dr["ProcessNeedMinutes"] = "0";
                dr["Id"] = "0";
             
                dr["processComment"] = "";
                dr["supplyId"] = "";
                dr["QCPercent"] = "100";
                dr["ProcessNo"] = "";
                dt.Rows.Add(dr);
               


            }

            DataView dv = new DataView(dt);
            MainDataGrid.DataSource = dv;
            MainDataGrid.DataBind();
            
            //init TextBox_NeedTime input box and DropDownList_UnitSelect

            supplyInfos = new Supply().GetSupplyInfos();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (i == selectRow) MainDataGrid.Items[i].BackColor = Setting.SELECTCOLOR;
                Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                
               

                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                Label_OrderNo.Text = Convert.ToString(i + 1);
                Label Label_ProcessID = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                dpl_Supply.DataSource = supplyInfos.FindAll(m => m.ProcessIdList!=null && m.ProcessIdList.IndexOf(Label_ProcessID.Text.Trim() + ",") > -1);
                dpl_Supply.DataTextField = "SupplierName";
                dpl_Supply.DataValueField = "Id";
                dpl_Supply.DataBind();
                


            }

            //retieved all data
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
               
                
                TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                TextBox dg_txt_qcPercent = MainDataGrid.Items[i].FindControl("dg_txt_qcPercent") as TextBox;


                string oldMintes = dt.Rows[i][dt.Columns["Minute"]].ToString();
                string processComment = dt.Rows[i][dt.Columns["processComment"]].ToString();
                string oldSupply = dt.Rows[i][dt.Columns["supplyId"]].ToString();
                string oldQCPercent = dt.Rows[i][dt.Columns["QCPercent"]].ToString();



                textminute.Text = oldMintes;
                txt_processComment.Text = processComment;
                try
                {
                    dpl_Supply.SelectedValue = oldSupply;
                }
                catch { }

                try{
                    dg_txt_qcPercent.Text = oldQCPercent;
                }
                catch { }


            }

            disableQCPercent();
        }

        private void DeleteDataSource(int index)
        {
            int selectRow = Convert.ToInt32(Label_HiddenSelectRow.Text);
            if (selectRow > MainDataGrid.Items.Count - 2)
            {
                selectRow = -1;
                Label_HiddenSelectRow.Text = "-1";
            }
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new DataColumn("ListOrder", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessId", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessName", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessNeedMinutes", typeof(string)));
            dt.Columns.Add(new DataColumn("Id", typeof(string)));
            dt.Columns.Add(new DataColumn("processComment", typeof(string)));
            dt.Columns.Add(new DataColumn("supplyId", typeof(string)));
            dt.Columns.Add(new DataColumn("QCPercent", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessNo", typeof(string)));


            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (index != i)
                {
                    Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                    Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                 
                    Label label_Processname = MainDataGrid.Items[i].FindControl("Label_ProcessName") as Label;
                   
                    Label label_id = (Label)MainDataGrid.Items[i].FindControl("lab_id");
                    Label lab_ProcessNo = (Label)MainDataGrid.Items[i].FindControl("lab_ProcessNo");
                    TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");
                    TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                    DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                    TextBox dg_txt_qcPercent = MainDataGrid.Items[i].FindControl("dg_txt_qcPercent") as TextBox;

                    //new a record
                    dr = dt.NewRow();
                    dr["ListOrder"] = Label_OrderNo.Text.Trim();
                    dr["ProcessId"] = label_processid.Text.Trim();
                 
                    dr["ProcessName"] = label_Processname.Text.Trim();
                  
                    dr["ProcessNeedMinutes"] = textminute.Text;
                  
                    dr["Id"] = label_id.Text;
                    
                    dr["processComment"] = txt_processComment.Text;
                    dr["supplyId"] = dpl_Supply.SelectedValue;
                    dr["QCPercent"] = dg_txt_qcPercent.Text;
                    dr["ProcessNo"] = lab_ProcessNo.Text;
                    dt.Rows.Add(dr);
                }
            }

            DataView dv = new DataView(dt);
            MainDataGrid.DataSource = dv;
            MainDataGrid.DataBind();
         

            supplyInfos = new Supply().GetSupplyInfos();

            //init TextBox_NeedTime input box and DropDownList_UnitSelect
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (i == selectRow) MainDataGrid.Items[i].BackColor = Setting.SELECTCOLOR;

                Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;

                TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");

                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                Label_OrderNo.Text = Convert.ToString(i + 1);
                Label Label_ProcessID = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                TextBox dg_txt_qcPercent = MainDataGrid.Items[i].FindControl("dg_txt_qcPercent") as TextBox;
                dpl_Supply.DataSource = supplyInfos.FindAll(m => m.ProcessIdList != null && m.ProcessIdList.IndexOf(Label_ProcessID.Text.Trim() + ",") > -1);
                dpl_Supply.DataTextField = "SupplierName";
                dpl_Supply.DataValueField = "Id";
                dpl_Supply.DataBind();

               


            }

            //retieved all data
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {

                TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                TextBox dg_txt_qcPercent = MainDataGrid.Items[i].FindControl("dg_txt_qcPercent") as TextBox;


                string oldMintes = dt.Rows[i][dt.Columns["ProcessNeedMinutes"]].ToString();
                string processComment = dt.Rows[i][dt.Columns["processComment"]].ToString();
                string oldSupply = dt.Rows[i][dt.Columns["supplyId"]].ToString();
                string oldQCPercent = dt.Rows[i][dt.Columns["QCPercent"]].ToString();


                textminute.Text = oldMintes;
                txt_processComment.Text = processComment;
                try
                {
                    dpl_Supply.SelectedValue = oldSupply;
                }
                catch { }

                dg_txt_qcPercent.Text = oldQCPercent;

            }
            disableQCPercent();


        }


        private void dataBindHandly(string moduleid, string partno)
        {

            
            DataSet ds = ModuleWorkFlow.business.PartProcess.getModulePartProcessView(moduleid, partno + "-1");
            MainDataGrid.DataSource = ds;
            MainDataGrid.DataBind();

            //init TextBox_NeedTime input box and DropDownList_UnitSelect
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {

               
               
                TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");

                Label Label_ProcessID = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                dpl_Supply.DataSource = supplyInfos.FindAll(m => m.ProcessIdList.IndexOf(Label_ProcessID.Text.Trim() + ",") > -1);
                dpl_Supply.DataTextField = "SupplierName";
                dpl_Supply.DataValueField = "Id";
                dpl_Supply.DataBind();

                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                TextBox dg_txt_qcPercent = MainDataGrid.Items[i].FindControl("dg_txt_qcPercent") as TextBox;

            }

            DataTable dt = ds.Tables[0];

            //get hours per day from process table
            Hashtable htProcess = ModuleWorkFlow.business.Process.getProcessHoursPerDay();
            supplyInfos = new Supply().GetSupplyInfos();
            //retieved all data
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                
              
                TextBox textminute = (TextBox)MainDataGrid.Items[i].FindControl("dg_txt_minute");
                DropDownList dpl_Supply = MainDataGrid.Items[i].FindControl("dpl_Supply") as DropDownList;
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                TextBox dg_txt_qcPercent = MainDataGrid.Items[i].FindControl("dg_txt_qcPercent") as TextBox;

                int hoursperday = Convert.ToInt32(htProcess[label_processid.Text.Trim()]);
                int processneedminutes = Convert.ToInt32(dt.Rows[i][dt.Columns["ProcessNeedMinutes"]].ToString());
                string oldDay = Convert.ToString((int)(processneedminutes / (60 * hoursperday)));
                string oldHour = Convert.ToString((int)(processneedminutes % (60 * hoursperday) / 60));
                string oldMintes = Convert.ToString((int)(processneedminutes % (60 * hoursperday) % 60));
                string oldSupplyId = dt.Rows[i][dt.Columns["supplyId"]].ToString();
                string oldQCPercent = dt.Rows[i][dt.Columns["QCPercent"]].ToString();
                string oldprocessComment = dt.Rows[i][dt.Columns["processComment"]].ToString();

               
                textminute.Text = oldMintes;
                dg_txt_qcPercent.Text = oldQCPercent;
                txt_processComment.Text = oldprocessComment;

                try
                {
                    
                    dpl_Supply.SelectedValue = oldSupplyId;
                }
                catch { }
            }

            disableQCPercent();
        }

        private void updatePart(string moduleid)
        {
        }

        





        private void ListBox_ModuleList_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //			refreshProcessDesignAssemble(ListBox_ModuleList.SelectedValue);
        }

        private void MainDataGrid_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //Label_Message.Text = MainDataGrid.SelectedItem.Cells[0].Text ;
        }

        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            
        }

        private void MainDataGrid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            DeleteDataSource(e.Item.ItemIndex);
        }



        private void Textbox_PartNo_ServerChange(object sender, System.EventArgs e)
        {

        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            Button_AddEdit_Click(sender, e);
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            
            string url = "StandardPartList.aspx?menuid=" + menuid;
          

            Response.Redirect(url);
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            
            string url = "StandardPartAddEdit.aspx?menuid=" + menuid;
            

            Response.Redirect(url);
        }

        protected void MainDataGrid_ItemCreated(object sender, DataGridItemEventArgs e)
        {
           
            //for (int i = 0; i < MainDataGrid.Columns.Count; i++)
            //{
            //    object dc = MainDataGrid.Columns[i];
            //    string fieldname = "";
            //    if (dc is TemplateColumn)
            //    {
            //        fieldname = ((TemplateColumn)dc).HeaderText;
            //        if (fieldname.Equals("天(小日程)"))
            //        {
            //             ((TemplateColumn)dc).Visible = false;
            //        }
            //    }

            //}
        }

        protected void dpl_processGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModuleWorkFlow.BLL.Process process = new ModuleWorkFlow.BLL.Process();
            List<ModuleWorkFlow.Model.ProcessInfo> processes
                = process.getProcessInfoExceptDesign().Cast<ModuleWorkFlow.Model.ProcessInfo>().ToList();

            var filteredProcesses = processes.FindAll(m => m.JobGroup != null && m.JobGroup.Equals(dpl_processGroup.SelectedValue));

            // Group the filtered processes by ProcessName and ProcessId
            var groupedFilterProcesses = filteredProcesses
                .GroupBy(p => new { p.ProcessName, p.ProcessId })
                .Select(g => new
                {
                    ProcessName = g.Key.ProcessName,
                    ProcessId = g.Key.ProcessId
                })
                .ToList();


            CheckBoxList_Process.DataTextField = "ProcessName";
            CheckBoxList_Process.DataValueField = "ProcessId";
            CheckBoxList_Process.DataSource = groupedFilterProcesses;
            CheckBoxList_Process.DataBind();
        }
    }
}
