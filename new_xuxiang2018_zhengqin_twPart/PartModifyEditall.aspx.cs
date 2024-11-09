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
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.WebView;

using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkflow.OutSource.BLL.Interface;
using Utility;
//using RedisUtilty;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for xuxiangPartModifyEditall.
    /// </summary>
    public partial class PartModifyEditall : System.Web.UI.Page
    {

        //protected ModuleWorkFlow.controls.Style Style;
        protected System.Web.UI.WebControls.Label Label_ModuleId;
       
        protected System.Web.UI.WebControls.CheckBoxList CheckBoxList_Process;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label Label_HiddenSelectRow;
        protected System.Web.UI.WebControls.Label Label_DeleteProcessNo;
        protected System.Web.UI.WebControls.Label Label_DisableMaxOrder;
        protected System.Web.UI.WebControls.DropDownList ListBox_Priority;
        protected System.Web.UI.WebControls.Label Label_HiddenPriority;
        protected System.Web.UI.WebControls.TextBox txt_startDate;
        protected System.Web.UI.WebControls.TextBox txt_endDate;
        protected System.Web.UI.WebControls.Label Label_HiddenModuleId;
      
        protected System.Web.UI.WebControls.CheckBox cbx_relation;
 
        protected DropDownList dpl_status;
        
  
        protected Label lab_type;
        protected Label lab_pageIndex;
        protected Label lab_moduleid;
     



        DataSet ds;
        Hashtable hht;
        Hashtable htProcess;
        private static Hashtable hprocess;
        string[] oldp;
        IList iprocessDelete;
        protected System.Web.UI.WebControls.Label lab_processinfo;
        protected System.Web.UI.WebControls.Label lab_partcount;
        private string menuid = "F10";
        protected System.Web.UI.WebControls.Label lab_zuli;
        protected Label lab_dueDate;
       
        protected TextBox txt_dueDate;
    

        protected string str_MenuName;
        protected System.Web.UI.HtmlControls.HtmlSelect list_partnos;
        protected Label viewurl;
        
        protected DropDownList dpl_difficuleLevel;
        //private static Hashtable hprocess;
        int isProject;
        //Hashtable htPartProcess;
        protected System.Web.UI.WebControls.Label lab_productdate;

        private void Page_Load(object sender, System.EventArgs e)
        {


            ModuleWorkFlow.BLL.Process p = new ModuleWorkFlow.BLL.Process();
            hprocess = p.GetProcessIdProcessWithCustomerProcess();
            Session["hprocess"] = hprocess;
            ModuleWorkFlow.BLL.PartProcess partprocess = new ModuleWorkFlow.BLL.PartProcess();

         
           
            lab_type.Text = "";

            

            








            if (!this.IsPostBack)
            {
                str_MenuName = "";
                TmenuInfo mi = new Tmenu().findbykey(menuid);
                if (this.Master != null && this.Master is DefaultSub)
                {
                    DefaultSub master = (DefaultSub)this.Master;
                  
                    master.Menuname = mi.Menuname;
                    str_MenuName = mi.Menuname;
                }

                if (mi != null)
                {
                    str_MenuName = mi.Menuname;
                    if (mi.Url.Equals("PartList.aspx"))
                    {
                        lnkbutton_edit.Visible = true;
                        MainDataGrid.Columns[2].Visible = true;
                    }
                }

                


                //MYB061226-3-5
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");

                if (Request.Params["listurl"] != null)
                {
                    viewurl.Text = Request.Params["listurl"];
                }



                if (isProject > 0)
                {

                    partprocess.SetProcessOrder(Request.Params["moduleid"]);
                }
                Label_HiddenSelectRow.Text = "-1";
                Label_Message.Text = "";
                Label_ModuleId.Text = Request.Params["moduleid"];
               
                BindDataPriority();
                BindDifficulty();
                bindStatus();
                string partnolist = Request.Params["PartNolist"];
                string[] nos = partnolist.Split(',');
                bindPartNo(nos);
                IList partnos = new ArrayList();
                string partno = "";
                for (int i = 0; i < nos.Length; i++)
                {
                    ModuleWorkFlow.BLL.Part pt = new ModuleWorkFlow.BLL.Part();
                    ModuleWorkFlow.Model.PartInfo pi = pt.getPartInfo(Label_ModuleId.Text, nos[i]);
                    
                    if (pi != null)
                    {
                        if (string.IsNullOrEmpty(Label_partName.Text))
                            Label_partName.Text = pi.PartName;
                        if (partno.Equals(""))
                        {
                            partno = pi.PartNo;
                            if (pi.DueDate.Ticks > 0)
                            {
                                txt_dueDate.Text = pi.DueDate.ToString("yyyy-MM-dd HH:mm");
                               
                            }
                            else
                            {
                                txt_dueDate.Text = pi.ProductEndDate.ToString("yyyy-MM-dd HH:mm");
                              
                            }
                           
                            if (pi.Comment != null)
                                txt_comment.Text = pi.Comment;

                            Label_HiddenPriority.Text = pi.Priority.ToString();
                            dpl_status.SelectedValue = pi.PartStatusId;

                            ListBox_Priority.SelectedValue = pi.Priority.ToString();
                            if (!pi.Process.Trim().Equals(""))
                            {
                                dpl_difficuleLevel.SelectedValue = pi.PartDifficult.ToString();
                            }
                            else
                            {
                                PartTypeInfo typeInfo = new PartType().GetPartTypeByPartNo(pi.PartNo);
                                if (typeInfo != null && typeInfo.DifficultLevel > 0)
                                {
                                    dpl_difficuleLevel.SelectedValue = typeInfo.DifficultLevel.ToString();
                                }
                                else
                                {
                                    dpl_difficuleLevel.SelectedIndex = dpl_difficuleLevel.Items.Count - 1;
                                }
                            }




                        }

                       

                        lab_productdate.Text = pi.ProductEndDate.ToString("yyyy-MM-dd");

                    }
                    else
                    {
                        Label_Message.Text += "," + nos[i];
                    }
                }

                if (Label_Message.Text.IndexOf(",") > -1)
                {
                    Label_Message.Text += Label_Message.Text.Substring(1) + Translate.translateString("零件已刪除，請重新選擇");
                }


                lab_pageIndex.Text = Request.Params["pageIndex"];




                BindDataProcessAll();
              
               
                ModuleWorkFlow.BLL.PartProcess pp = new ModuleWorkFlow.BLL.PartProcess();
                DataSet ds = new PartDetail().GetDSPartDetailInfos(Label_ModuleId.Text.Trim(), partno.Trim());
                if (ds.Tables[0].Rows.Count > 0)
                {
                    dataBindHandly(ds);
                }
                else
                {
                    ModuleWorkFlow.BLL.Process process = new ModuleWorkFlow.BLL.Process();
                    IList fixprocesses = new ArrayList();
                    if (lab_type.Text.Trim().Equals(""))
                    {
                        PartType parttype = new PartType();
                        IList processes = process.getProcessInfoExceptDesign();
                        foreach (ModuleWorkFlow.Model.ProcessInfo pi in processes)
                        {
                            if (pi.PriceType != null && pi.PriceType.Equals("ALWAYSFIRST") && isProject == 0 && parttype.GetPartTypeByPartNo(partno.Trim()).NoFirstProcess == 0)
                            {
                                StandProcessInfo spi = new StandProcessInfo();
                                spi.ProcessId = pi.ProcessId;
                                spi.ProcessName = pi.ProcessName;
                                spi.CustomerProcessId = pi.CustomerProcessId;
                                spi.CustomerProcessName = pi.CustomerProcessName;
                                int ProcessNeedMinutes = 6;
                                if (System.Configuration.ConfigurationSettings.AppSettings["ProcessNeedMinutes"] != null)
                                {
                                    try
                                    {
                                        if (Convert.ToInt32(System.Configuration.ConfigurationSettings.AppSettings["ProcessNeedMinutes"]) > 0)
                                        {
                                            ProcessNeedMinutes = Convert.ToInt32(System.Configuration.ConfigurationSettings.AppSettings["ProcessNeedMinutes"]);
                                        }
                                    }
                                    catch (Exception ex)
                                    {

                                    }
                                }
                                spi.ProcessNeedMinutes = ProcessNeedMinutes;
                                spi.pricetype = pi.PriceType;
                                spi.ListOrder = 1;

                                string lastone = Label_ModuleId.Text.Substring(Label_ModuleId.Text.Length - 1, 1);
                                if (System.Configuration.ConfigurationSettings.AppSettings["lastparameter"] != null)
                                {
                                    string[] parameter = System.Configuration.ConfigurationSettings.AppSettings["lastparameter"].Split(',');
                                    //if (!lastone.Contains("X") && !lastone.Contains("x"))
                                    foreach (string lastparameter in parameter)
                                    {
                                        if (lastone.Contains(lastparameter))
                                        {
                                            fixprocesses.Add(spi);
                                        }
                                    }
                                }
                                else
                                {
                                    fixprocesses.Add(spi);
                                }
                                break;
                            }
                        }
                    }

                    BomDetailInfo bdi = new BomDetail().GetBomDetailByNoPartNo(Label_ModuleId.Text.Trim(), partno.Trim());
                    if (bdi != null && bdi.StandProcess != null && !bdi.StandProcess.Trim().Equals("") && isProject == 0)
                    {
                       
                            dataStandBind("", "", fixprocesses);
                            Label_Message.Text = bdi.StandProcess + Translate.translateString("不存在");
                        
                    }
                    else
                    {
                        if (isProject == 0)
                        {
                            dataStandBind("", "", fixprocesses);
                        }
                    }

                }
                Label_DeleteProcessNo.Text = "";



                //dataStandBind(dpl_processtype.SelectedValue, dpl_standprocess.SelectedValue);
            }
        }

        private void BindDataProcessAll()
        {
            ModuleWorkFlow.BLL.Process process = new ModuleWorkFlow.BLL.Process();


            if (lab_type.Text.Trim().Equals(""))
            {
                CheckBoxList_Process.DataTextField = "CustomerProcessName";
                CheckBoxList_Process.DataValueField = "CustomerProcessId";
                CheckBoxList_Process.DataSource = process.getProcessInfoExceptDesign();
            }
            else
            {
                CheckBoxList_Process.DataTextField = "ProcessName";
                CheckBoxList_Process.DataValueField = "ProcessId";
                CheckBoxList_Process.DataSource = process.getProcessInfoDesignGroup(lab_type.Text, lab_type.Text);
            }

            CheckBoxList_Process.DataBind();
            CheckBoxList_Process.RepeatDirection = RepeatDirection.Vertical;
            CheckBoxList_Process.RepeatColumns = 2;
        }



        private void BindDataPriority()
        {
            ListBox_Priority.DataTextField = "priorityname";
            ListBox_Priority.DataValueField = "priorityid";
            ListBox_Priority.DataSource = Priority.getPriorityView();
            ListBox_Priority.DataBind();
        }

        private void BindDifficulty()
        {
            dpl_difficuleLevel.DataTextField = "Name";
            dpl_difficuleLevel.DataValueField = "Id";
            dpl_difficuleLevel.DataSource = new Difficult().GetDifficultInfos();
            dpl_difficuleLevel.DataBind();




        }







        private void dataBindHandly(DataSet ds)
        {
            
            //MYB061226-3-5


            DataTable dtpartprocess = ds.Tables[0];
           
            MainDataGrid.DataSource = ds;
            DataTable dt = ds.Tables[0];

            MainDataGrid.DataBind();

            
            //get hours per day from process table
            Hashtable htOldProcess = new ModuleWorkFlow.BLL.Process().GetProcessIdProcessWithCustomerProcess();
            Hashtable htProcess = new Hashtable();
            foreach (string key in htOldProcess.Keys)
            {
                htProcess.Add(key.ToUpper(), htOldProcess[key]);
            }
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                Label Label_CustomerProcessID = MainDataGrid.Items[i].FindControl("Label_CustomerProcessID") as Label;
                DropDownList DDLDay = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList DDLHour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList DDLMinute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;
                CheckBox cbl_isunnormal = MainDataGrid.Items[i].FindControl("cbl_isunnormal") as CheckBox;//whd080901 增�??�否返修
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;
                Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;

                //init TextBox_NeedTime input box and DropDownList_UnitSelect
                tools.DropDownListInit(DDLDay, 0, Setting.DAYS);
                tools.DropDownListInit(DDLHour, 0, Setting.HOURS - 1);
                tools.EveryMinuteDropDownListInit(DDLMinute);
                //txt_processComment.Text = "";
                ModuleWorkFlow.BLL.Machine machine = new ModuleWorkFlow.BLL.Machine();



                try
                {
                    if (menuid.Equals("F102"))
                    {
                        dpl_processMachineid.DataSource = new User().getUserInfoByMenuId(menuid, false);
                        dpl_processMachineid.DataTextField = "UserName";
                        dpl_processMachineid.DataValueField = "UserName";
                        dpl_processMachineid.DataBind();
                        dpl_processMachineid.Items.Insert(0, new ListItem("", ""));
                    }
                    else
                    {
                        dpl_processMachineid.DataSource = machine.GetAllMachineList(label_processid.Text.Trim());
                        dpl_processMachineid.DataValueField = "Id";
                        dpl_processMachineid.DataTextField = "Id";
                        dpl_processMachineid.DataBind();
                        dpl_processMachineid.Items.Insert(0, "");
                    }
                }
                catch
                {
                    dpl_processMachineid.Items.Clear();
                    dpl_processMachineid.Items.Insert(0, "");
                }
                tools.DropDownListInit(dpl_startHour, 0, Setting.HOURS - 1);
                tools.DropDownListInit(dpl_endHour, 0, Setting.HOURS - 1);

                //retieved all data
                int hoursperday = 24;
                if (hprocess[Label_CustomerProcessID.Text.Trim()] != null)
                {
                    hoursperday = (htProcess[Label_CustomerProcessID.Text.Trim().ToUpper()] as ModuleWorkFlow.Model.ProcessInfo).HoursPerDay;
                }
                int processneedminutes = Convert.ToInt32(dt.Rows[i][dt.Columns["ProcessNeedMinutes"]].ToString());
                string oldDay = Convert.ToString((int)(processneedminutes / (60 * hoursperday)));
                string oldHour = Convert.ToString((int)(processneedminutes % (60 * hoursperday) / 60));
                string oldMintes = Convert.ToString((int)(processneedminutes % (60 * hoursperday) % 60));
                string oldStartHour = "";
                string oldEndHour = "";
                if (!Convert.IsDBNull(dt.Rows[i]["selfStartDate"]) && !dt.Rows[i][dt.Columns["selfStartDate"]].ToString().Equals(""))
                {
                    string oldSelfStartDate = Convert.ToString(((DateTime)(dt.Rows[i][dt.Columns["selfStartDate"]])).ToShortDateString());
                    txt_startDate.Text = oldSelfStartDate;
                    oldStartHour = ((DateTime)(dt.Rows[i][dt.Columns["selfStartDate"]])).Hour.ToString();
                }
                if (!Convert.IsDBNull(dt.Rows[i][dt.Columns["selfEndDate"]]) && !dt.Rows[i][dt.Columns["selfEndDate"]].ToString().Equals(""))
                {
                    string oldSelfEndDate = Convert.ToString(((DateTime)(dt.Rows[i][dt.Columns["selfEndDate"]])).ToShortDateString());
                    txt_endDate.Text = oldSelfEndDate;
                    oldEndHour = ((DateTime)(dt.Rows[i][dt.Columns["selfEndDate"]])).Hour.ToString();
                }
                if (Convert.ToInt32(dt.Rows[i][dt.Columns["isUnnormal"]]) == 0)
                {
                    cbl_isunnormal.Checked = false;

                }
                else
                {
                    cbl_isunnormal.Checked = true;
                }
                if ((dt.Rows[i][dt.Columns["pricetype"]]).ToString().Equals("ZULI"))
                {
                    lab_zuli.Text = Convert.ToString(dt.Rows[i][dt.Columns["processno"]]);
                    lab_pricetype.Text = "ZULI";
                }


                PartType parttype = new PartType();
                string partno = "";
                if (list_partnos.Items.Count > 0)
                {
                    partno = list_partnos.Items[0].Value.Trim();
                }

                if ((dt.Rows[i][dt.Columns["pricetype"]]).ToString().Equals("ALWAYSFIRST") && Label_ModuleId.Text.IndexOf("-") < 0 && parttype.GetPartTypeByPartNo(partno).NoFirstProcess == 0)
                {
                    Button UpBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 6].Controls[0];



                    Button DownBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 5].Controls[0];


                    Button DELBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 4].Controls[0];

                    Button SELECTBtn = (Button)MainDataGrid.Items[i].Cells[0].Controls[0];


                    string lastone = Label_ModuleId.Text.Substring(Label_ModuleId.Text.Length - 1, 1);
                    if (System.Configuration.ConfigurationSettings.AppSettings["lastparameter"] != null)
                    {
                        string[] parameter = System.Configuration.ConfigurationSettings.AppSettings["lastparameter"].Split(',');
                        //if (!lastone.Contains("X") && !lastone.Contains("x"))
                        foreach (string lastparameter in parameter)
                        {
                            if (lastone.Contains(lastparameter))
                            {
                                UpBtn.Enabled = false;
                                DELBtn.Enabled = false;
                                SELECTBtn.Enabled = false;
                                DownBtn.Enabled = false;
                                if (MainDataGrid.Items.Count > 1)
                                {
                                    Button UpBtnnext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                                    UpBtnnext.Enabled = false;
                                }

                                MainDataGrid.Items[i].BackColor = Color.Chocolate;

                            }
                        }
                    }
                    else
                    {
                        UpBtn.Enabled = false;
                        DELBtn.Enabled = false;
                        SELECTBtn.Enabled = false;
                        DownBtn.Enabled = false;
                        if (MainDataGrid.Items.Count > 1)
                        {
                            Button UpBtnnext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                            UpBtnnext.Enabled = false;
                        }
                        MainDataGrid.Items[i].BackColor = Color.Chocolate;

                    }
                }


                string oldProcessComment = dt.Rows[i][dt.Columns["processComment"]].ToString();
                txt_processComment.Text = oldProcessComment;
                string oldProcessMachineid = dt.Rows[i][dt.Columns["processMachineid"]].ToString();
                try
                {
                    dpl_processMachineid.SelectedValue = oldProcessMachineid;
                }
                catch { }
                tools.DropDownListChange(DDLDay, oldDay);
                tools.DropDownListChange(DDLHour, oldHour);
                tools.DropDownListChange(DDLMinute, oldMintes);
                tools.DropDownListChange(dpl_startHour, oldStartHour);
                tools.DropDownListChange(dpl_endHour, oldEndHour);

            }
            disableProductedProcess();

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
            //this.CheckBoxList_Process.SelectedIndexChanged += new System.EventHandler(this.CheckBoxList_Process_SelectedIndexChanged);
            //this.MainDataGrid.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.MainDataGrid_ItemCommand);
            this.MainDataGrid.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.MainDataGrid_DeleteCommand);
            ////this.Button_AddEdit.Click += new System.EventHandler(this.Button_AddEdit_Click);
            //this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        protected void MainDataGrid_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            int index = e.Item.ItemIndex;
            switch (((Button)e.CommandSource).CommandName)//080901
            {
                case "Upper":
                    if (index > 0)
                    {
                        Label label_processno = MainDataGrid.Items[index].FindControl("Label_processno") as Label;
                        Label label_processid = MainDataGrid.Items[index].FindControl("Label_ProcessID") as Label;
                        Label Label_CustomerProcessID = MainDataGrid.Items[index].FindControl("Label_CustomerProcessID") as Label;
                        Label Label_CustomerProcessName = MainDataGrid.Items[index].FindControl("Label_CustomerProcessName") as Label;
                        DropDownList dropDownList_Day = MainDataGrid.Items[index].FindControl("DropDownList_Day") as DropDownList;
                        DropDownList dropDownList_Hour = MainDataGrid.Items[index].FindControl("DropDownList_Hour") as DropDownList;
                        DropDownList dropDownList_Minute = MainDataGrid.Items[index].FindControl("DropDownList_Minute") as DropDownList;
                        TextBox txt_startDate = MainDataGrid.Items[index].FindControl("txt_startDate") as TextBox;
                        DropDownList dpl_startHour = MainDataGrid.Items[index].FindControl("dpl_startHour") as DropDownList;
                        TextBox txt_endDate = MainDataGrid.Items[index].FindControl("txt_endDate") as TextBox;
                        DropDownList dpl_endHour = MainDataGrid.Items[index].FindControl("dpl_endHour") as DropDownList;
                        CheckBox cbl_isunnormal = MainDataGrid.Items[index].FindControl("cbl_isunnormal") as CheckBox;//whd080901 增�??�否返修
                        TextBox txt_processComment = MainDataGrid.Items[index].FindControl("txt_processComment") as TextBox;
                        DropDownList dpl_processMachineid = MainDataGrid.Items[index].FindControl("dpl_processMachineid") as DropDownList;

                        Label label_processnoUp = MainDataGrid.Items[index - 1].FindControl("Label_processno") as Label;
                        Label label_processidUp = MainDataGrid.Items[index - 1].FindControl("Label_ProcessID") as Label;
                        Label Label_CustomerProcessIDUp = MainDataGrid.Items[index - 1].FindControl("Label_CustomerProcessID") as Label;
                        Label Label_CustomerProcessNameUp = MainDataGrid.Items[index - 1].FindControl("Label_CustomerProcessName") as Label;
                        DropDownList dropDownList_DayUp = MainDataGrid.Items[index - 1].FindControl("DropDownList_Day") as DropDownList;
                        DropDownList dropDownList_HourUp = MainDataGrid.Items[index - 1].FindControl("DropDownList_Hour") as DropDownList;
                        DropDownList dropDownList_MinuteUp = MainDataGrid.Items[index - 1].FindControl("DropDownList_Minute") as DropDownList;
                        TextBox txt_startDateUp = MainDataGrid.Items[index - 1].FindControl("txt_startDate") as TextBox;
                        DropDownList dpl_startHourUp = MainDataGrid.Items[index - 1].FindControl("dpl_startHour") as DropDownList;
                        TextBox txt_endDateUp = MainDataGrid.Items[index - 1].FindControl("txt_endDate") as TextBox;
                        DropDownList dpl_endHourUp = MainDataGrid.Items[index - 1].FindControl("dpl_endHour") as DropDownList;
                        CheckBox cbl_isunnormalUp = MainDataGrid.Items[index - 1].FindControl("cbl_isunnormal") as CheckBox;
                        TextBox txt_processCommentUp = MainDataGrid.Items[index - 1].FindControl("txt_processComment") as TextBox;
                        DropDownList dpl_processMachineidUp = MainDataGrid.Items[index - 1].FindControl("dpl_processMachineid") as DropDownList;

                        string temp_processno = label_processno.Text;
                        string temp_processid = label_processid.Text;
                        string temp_customerProcessid = Label_CustomerProcessID.Text;
                        string temp_customerProcessname = Label_CustomerProcessName.Text;
                        string temp_day = dropDownList_Day.SelectedValue;
                        string temp_hour = dropDownList_Hour.SelectedValue;
                        string temp_minute = dropDownList_Minute.SelectedValue;
                        string temp_startDate = txt_startDate.Text;
                        string temp_startHour = dpl_startHour.SelectedValue;
                        string temp_endDate = txt_endDate.Text;
                        string temp_endHour = dpl_endHour.SelectedValue;
                        bool temp_isunnormal = cbl_isunnormal.Checked;//whd080901
                        string temp_processComment = txt_processComment.Text;
                        string temp_processMachineid = dpl_processMachineid.SelectedValue;

                        label_processno.Text = label_processnoUp.Text;
                        label_processid.Text = label_processidUp.Text;
                        Label_CustomerProcessID.Text = Label_CustomerProcessIDUp.Text;
                        Label_CustomerProcessName.Text = Label_CustomerProcessNameUp.Text;
                        tools.DropDownListChange(dropDownList_Day, dropDownList_DayUp.SelectedValue);
                        tools.DropDownListChange(dropDownList_Hour, dropDownList_HourUp.SelectedValue);
                        tools.DropDownListChange(dropDownList_Minute, dropDownList_MinuteUp.SelectedValue);
                        txt_startDate.Text = txt_startDateUp.Text;
                        tools.DropDownListChange(dpl_startHour, dpl_startHourUp.SelectedValue);
                        txt_endDate.Text = txt_endDateUp.Text;
                        tools.DropDownListChange(dpl_endHour, dpl_endHourUp.SelectedValue);
                        cbl_isunnormal.Checked = cbl_isunnormalUp.Checked;//whd080901
                        txt_processComment.Text = txt_processCommentUp.Text;
                        ModuleWorkFlow.BLL.Machine machine = new ModuleWorkFlow.BLL.Machine();
                        try
                        {
                            if (menuid.Equals("F102"))
                            {
                                dpl_processMachineid.DataSource = new User().getUserInfoByMenuId(menuid, false);
                                dpl_processMachineid.DataTextField = "UserName";
                                dpl_processMachineid.DataValueField = "UserName";
                                dpl_processMachineid.DataBind();
                                dpl_processMachineid.Items.Insert(0, new ListItem("", ""));
                            }
                            else
                            {
                                dpl_processMachineid.DataSource = machine.GetAllMachineList(label_processidUp.Text.Trim());
                                dpl_processMachineid.DataValueField = "Id";
                                dpl_processMachineid.DataTextField = "Id";
                                dpl_processMachineid.DataBind();
                                dpl_processMachineid.Items.Insert(0, "");
                            }


                        }
                        catch
                        {
                            dpl_processMachineid.Items.Clear();
                            dpl_processMachineid.Items.Insert(0, "");
                        }
                        try
                        {
                            dpl_processMachineid.SelectedValue = dpl_processMachineidUp.SelectedValue;
                        }
                        catch { }

                        label_processidUp.Text = temp_processid;
                        Label_CustomerProcessIDUp.Text = temp_customerProcessid;
                        label_processnoUp.Text = temp_processno;
                        Label_CustomerProcessNameUp.Text = temp_customerProcessname;
                        tools.DropDownListChange(dropDownList_DayUp, temp_day);
                        tools.DropDownListChange(dropDownList_HourUp, temp_hour);
                        tools.DropDownListChange(dropDownList_MinuteUp, temp_minute);
                        txt_startDateUp.Text = temp_startDate;
                        tools.DropDownListChange(dpl_startHourUp, temp_startHour);
                        txt_endDateUp.Text = temp_endDate;
                        tools.DropDownListChange(dpl_endHourUp, temp_endHour);
                        cbl_isunnormalUp.Checked = temp_isunnormal;//whd080901
                        txt_processCommentUp.Text = temp_processComment.Trim();
                        try
                        {
                            if (menuid.Equals("F102"))
                            {
                                dpl_processMachineidUp.DataSource = new User().getUserInfoByMenuId(menuid, false);
                                dpl_processMachineidUp.DataTextField = "UserName";
                                dpl_processMachineidUp.DataValueField = "UserName";
                                dpl_processMachineidUp.DataBind();
                                dpl_processMachineidUp.Items.Insert(0, new ListItem("", ""));

                            }
                            else
                            {
                                dpl_processMachineidUp.DataSource = machine.GetAllMachineList(temp_processid);
                                dpl_processMachineidUp.DataValueField = "Id";
                                dpl_processMachineidUp.DataTextField = "Id";
                                dpl_processMachineidUp.DataBind();
                                dpl_processMachineidUp.Items.Insert(0, "");
                            }
                        }
                        catch
                        {
                            dpl_processMachineidUp.Items.Clear();
                            dpl_processMachineidUp.Items.Insert(0, "");
                        }
                        try
                        {
                            dpl_processMachineidUp.SelectedValue = temp_processMachineid;
                        }
                        catch { }
                        Label dg_lab_processno = MainDataGrid.Items[index].FindControl("dg_lab_processno") as Label;
                        string prcessno = dg_lab_processno.Text;//12
                        Label dg_lab_processnoUp = MainDataGrid.Items[index - 1].FindControl("dg_lab_processno") as Label;
                        dg_lab_processno.Text = dg_lab_processnoUp.Text;//12
                        dg_lab_processnoUp.Text = prcessno;//12


                    }

                    break;

                case "Lower":
                    if (index < MainDataGrid.Items.Count - 1)
                    {
                        Label label_processno = MainDataGrid.Items[index].FindControl("Label_processno") as Label;
                        Label label_processid = MainDataGrid.Items[index].FindControl("Label_ProcessID") as Label;
                        Label Label_CustomerProcessID = MainDataGrid.Items[index].FindControl("Label_CustomerProcessID") as Label;
                        Label Label_CustomerProcessName = MainDataGrid.Items[index].FindControl("Label_CustomerProcessName") as Label;
                        DropDownList dropDownList_Day = MainDataGrid.Items[index].FindControl("DropDownList_Day") as DropDownList;
                        DropDownList dropDownList_Hour = MainDataGrid.Items[index].FindControl("DropDownList_Hour") as DropDownList;
                        DropDownList dropDownList_Minute = MainDataGrid.Items[index].FindControl("DropDownList_Minute") as DropDownList;
                        TextBox txt_startDate = MainDataGrid.Items[index].FindControl("txt_startDate") as TextBox;
                        DropDownList dpl_startHour = MainDataGrid.Items[index].FindControl("dpl_startHour") as DropDownList;
                        TextBox txt_endDate = MainDataGrid.Items[index].FindControl("txt_endDate") as TextBox;
                        DropDownList dpl_endHour = MainDataGrid.Items[index].FindControl("dpl_endHour") as DropDownList;
                        CheckBox cbl_isunnormal = MainDataGrid.Items[index].FindControl("cbl_isunnormal") as CheckBox;
                        TextBox txt_processComment = MainDataGrid.Items[index].FindControl("txt_processComment") as TextBox;
                        DropDownList dpl_processMachineid = MainDataGrid.Items[index].FindControl("dpl_processMachineid") as DropDownList;

                        Label label_processnoLow = MainDataGrid.Items[index + 1].FindControl("Label_Processno") as Label;
                        Label label_processidLow = MainDataGrid.Items[index + 1].FindControl("Label_ProcessID") as Label;
                        Label label_customerProcessidLow = MainDataGrid.Items[index + 1].FindControl("Label_CustomerProcessID") as Label;
                        Label label_customerProcessnameLow = MainDataGrid.Items[index + 1].FindControl("Label_CustomerProcessName") as Label;
                        DropDownList dropDownList_DayLow = MainDataGrid.Items[index + 1].FindControl("DropDownList_Day") as DropDownList;
                        DropDownList dropDownList_HourLow = MainDataGrid.Items[index + 1].FindControl("DropDownList_Hour") as DropDownList;
                        DropDownList dropDownList_MinuteLow = MainDataGrid.Items[index + 1].FindControl("DropDownList_Minute") as DropDownList;
                        TextBox txt_startDateLow = MainDataGrid.Items[index + 1].FindControl("txt_startDate") as TextBox;
                        DropDownList dpl_startHourLow = MainDataGrid.Items[index + 1].FindControl("dpl_startHour") as DropDownList;
                        TextBox txt_endDateLow = MainDataGrid.Items[index + 1].FindControl("txt_endDate") as TextBox;
                        DropDownList dpl_endHourLow = MainDataGrid.Items[index + 1].FindControl("dpl_endHour") as DropDownList;
                        CheckBox cbl_isunnormalLow = MainDataGrid.Items[index + 1].FindControl("cbl_isunnormal") as CheckBox;
                        TextBox txt_processCommentLow = MainDataGrid.Items[index + 1].FindControl("txt_processComment") as TextBox;
                        DropDownList dpl_processMachineidLow = MainDataGrid.Items[index + 1].FindControl("dpl_processMachineid") as DropDownList;

                        string temp_processno = label_processno.Text;
                        string temp_processid = label_processid.Text;
                        string temp_cusomterProcessid = Label_CustomerProcessID.Text;
                        string temp_customerProcessname = Label_CustomerProcessName.Text;
                        string temp_day = dropDownList_Day.SelectedValue;
                        string temp_hour = dropDownList_Hour.SelectedValue;
                        string temp_minute = dropDownList_Minute.SelectedValue;
                        string temp_startDate = txt_startDate.Text;
                        string temp_startHour = dpl_startHour.SelectedValue;
                        string temp_endDate = txt_endDate.Text;
                        string temp_endHour = dpl_endHour.SelectedValue;
                        bool temp_isunnormal = cbl_isunnormal.Checked;
                        string temp_processComment = txt_processComment.Text.Trim();
                        string temp_processMachineid = dpl_processMachineid.SelectedValue;

                        label_processno.Text = label_processnoLow.Text;
                        label_processid.Text = label_processidLow.Text;
                        Label_CustomerProcessID.Text = label_customerProcessidLow.Text;
                        Label_CustomerProcessName.Text = label_customerProcessnameLow.Text;
                        tools.DropDownListChange(dropDownList_Day, dropDownList_DayLow.SelectedValue);
                        tools.DropDownListChange(dropDownList_Hour, dropDownList_HourLow.SelectedValue);
                        tools.DropDownListChange(dropDownList_Minute, dropDownList_MinuteLow.SelectedValue);
                        txt_startDate.Text = txt_startDateLow.Text;
                        tools.DropDownListChange(dpl_startHour, dpl_startHourLow.SelectedValue);
                        txt_endDate.Text = txt_endDateLow.Text;
                        tools.DropDownListChange(dpl_endHour, dpl_endHourLow.SelectedValue);
                        cbl_isunnormal.Checked = cbl_isunnormalLow.Checked;
                        txt_processComment.Text = txt_processCommentLow.Text.Trim();
                        ModuleWorkFlow.BLL.Machine machine = new ModuleWorkFlow.BLL.Machine();
                        try
                        {
                            if (menuid.Equals("F102"))
                            {
                                dpl_processMachineid.DataSource = new User().getUserInfoByMenuId(menuid, false);
                                dpl_processMachineid.DataTextField = "UserName";
                                dpl_processMachineid.DataValueField = "UserName";
                                dpl_processMachineid.DataBind();
                                dpl_processMachineid.Items.Insert(0, new ListItem("", ""));
                            }
                            else
                            {
                                dpl_processMachineid.DataSource = machine.GetAllMachineList(label_processidLow.Text.Trim());
                                dpl_processMachineid.DataValueField = "Id";
                                dpl_processMachineid.DataTextField = "Id";
                                dpl_processMachineid.DataBind();
                                dpl_processMachineid.Items.Insert(0, "");
                            }

                        }
                        catch
                        {
                            dpl_processMachineid.Items.Clear();
                            dpl_processMachineid.Items.Insert(0, "");
                        }
                        try
                        {
                            dpl_processMachineid.SelectedValue = dpl_processMachineidLow.SelectedValue;
                        }
                        catch { }


                        label_processidLow.Text = temp_processid;
                        label_customerProcessidLow.Text = temp_cusomterProcessid;
                        label_processnoLow.Text = temp_processno;
                        label_customerProcessnameLow.Text = temp_customerProcessname;
                        tools.DropDownListChange(dropDownList_DayLow, temp_day);
                        tools.DropDownListChange(dropDownList_HourLow, temp_hour);
                        tools.DropDownListChange(dropDownList_MinuteLow, temp_minute);
                        txt_startDateLow.Text = temp_startDate;
                        tools.DropDownListChange(dpl_startHourLow, temp_startHour);
                        txt_endDateLow.Text = temp_endDate;
                        tools.DropDownListChange(dpl_endHourLow, temp_endHour);
                        cbl_isunnormalLow.Checked = temp_isunnormal;
                        txt_processCommentLow.Text = temp_processComment;
                        try
                        {
                            if (menuid.Equals("F102"))
                            {

                                dpl_processMachineidLow.DataSource = new User().getUserInfoByMenuId(menuid, false);
                                dpl_processMachineidLow.DataTextField = "UserName";
                                dpl_processMachineidLow.DataValueField = "UserName";
                                dpl_processMachineidLow.DataBind();
                                dpl_processMachineidLow.Items.Insert(0, new ListItem("", ""));
                            }
                            else
                            {
                                dpl_processMachineidLow.DataSource = machine.GetAllMachineList(temp_processid);
                                dpl_processMachineidLow.DataValueField = "Id";
                                dpl_processMachineidLow.DataTextField = "Id";
                                dpl_processMachineidLow.DataBind();
                                dpl_processMachineidLow.Items.Insert(0, "");
                            }

                        }
                        catch
                        {
                            dpl_processMachineidLow.Items.Clear();
                            dpl_processMachineidLow.Items.Insert(0, "");
                        }
                        try
                        {
                            dpl_processMachineidLow.SelectedValue = temp_processMachineid;
                        }
                        catch { }
                        Label dg_lab_processno = MainDataGrid.Items[index].FindControl("dg_lab_processno") as Label;
                        string prcessno = dg_lab_processno.Text;//12
                        Label dg_lab_processnoLow = MainDataGrid.Items[index + 1].FindControl("dg_lab_processno") as Label;
                        dg_lab_processno.Text = dg_lab_processnoLow.Text;//12
                        dg_lab_processnoLow.Text = prcessno;//12





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
                    //MYD070316-5
                    Label lab_processno = MainDataGrid.Items[index].FindControl("Label_processno") as Label;
                    //iprocessDelete = (IList)htPartProcess[index];
                    Label del_processid = MainDataGrid.Items[index].FindControl("Label_ProcessID") as Label;
                    ModuleWorkFlow.BLL.Process process = new ModuleWorkFlow.BLL.Process();
                    if (process.GetProcessInfoByCustomerProcessId(del_processid.Text).PriceType.Equals("ZULI"))
                    {
                        lab_zuli.Text = "";
                    }


                    if (Label_DeleteProcessNo.Text.Trim().Equals(""))
                    {
                        Label_DeleteProcessNo.Text = lab_processno.Text;
                    }
                    else
                    {
                        Label_DeleteProcessNo.Text = Label_DeleteProcessNo.Text + "," + lab_processno.Text;
                    }




                    break;
                default:
                    // Do nothing.
                    break;

            }
          
            disableProductedProcess();
            UpdatePanel1.Update();
        }

        protected void CheckBoxList_Process_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            hprocess = (Hashtable)Session["hprocess"];
            string processid = CheckBoxList_Process.SelectedValue;
            string pricetype = ((ModuleWorkFlow.Model.ProcessInfo)hprocess[processid]).PriceType;
            bool hasExisted = false;
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;
                if (pricetype.Equals("ZULI") && lab_pricetype.Text.Equals("ZULI"))
                {
                    hasExisted = true;
                }
            }

            if (!hasExisted)
            {
                AddDataSource();
            }

            //clear CheckBoxList_Process all selected item
            for (int i = 0; i < CheckBoxList_Process.Items.Count; i++)
            {
                CheckBoxList_Process.Items[i].Selected = false;
            }
        }

        private void AddDataSource() //whd080901
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
            dt.Columns.Add(new DataColumn("processorder", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessId", typeof(string)));
            dt.Columns.Add(new DataColumn("CustomerProcessId", typeof(string)));
            dt.Columns.Add(new DataColumn("CustomerProcessName", typeof(string)));
            dt.Columns.Add(new DataColumn("Day", typeof(string)));
            dt.Columns.Add(new DataColumn("Hour", typeof(string)));
            dt.Columns.Add(new DataColumn("Minute", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessNo", typeof(string)));
            dt.Columns.Add(new DataColumn("SelfStartDate", typeof(string)));
            dt.Columns.Add(new DataColumn("StartHour", typeof(string)));
            dt.Columns.Add(new DataColumn("SelfEndDate", typeof(string)));
            dt.Columns.Add(new DataColumn("EndHour", typeof(string)));
            dt.Columns.Add(new DataColumn("IsUnnormal", typeof(int)));//whd080901 增�??�否返修
            dt.Columns.Add(new DataColumn("processComment", typeof(string)));
            dt.Columns.Add(new DataColumn("processMachineid", typeof(string)));
            dt.Columns.Add(new DataColumn("StatusID", typeof(string)));
            dt.Columns.Add(new DataColumn("pricetype", typeof(string)));

            ProcessCustomer processCustomer = new ProcessCustomer();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (selectRow != -1 && selectRow == i)
                {
                    //new a record
                    dr = dt.NewRow();

                    dr["processorder"] = Convert.ToString(MainDataGrid.Items.Count + 1);
                    ModuleWorkFlow.Model.ProcessInfo pi = processCustomer.GetProcessInfoBykey(CheckBoxList_Process.SelectedValue, new ModuleWorkFlow.BLL.Process());
                    dr["ProcessId"] = pi.ProcessId;
                    dr["CustomerProcessId"] = CheckBoxList_Process.SelectedValue;
                    dr["CustomerProcessName"] = CheckBoxList_Process.SelectedItem.Text.Trim();
                    dr["Day"] = "0";
                    dr["Hour"] = "0";
                    dr["Minute"] = "0";
                    dr["ProcessNo"] = "0";
                    dr["SelfStartDate"] = "";
                    dr["StartHour"] = "0";
                    dr["SelfEndDate"] = "";
                    dr["EndHour"] = "0";
                    dr["IsUnnormal"] = 0;
                    dr["processComment"] = "";
                    dr["processMachineid"] = "";
                    dr["StatusID"] = "Pending";
                    dr["pricetype"] = "";
                    if (!lab_zuli.Text.Equals(""))
                    {
                        dt.Rows.InsertAt(dr, MainDataGrid.Items.Count - 1);
                    }
                    else
                    {
                        dt.Rows.Add(dr);
                        if (process.GetProcessInfoByCustomerProcessId(CheckBoxList_Process.SelectedValue).PriceType.Equals("ZULI"))
                        {
                            lab_zuli.Text = dr["pricetype"].ToString();
                            dr["pricetype"] = "ZULI";
                        }
                    }

                    //					dt.Rows.Add(dr);
                }
                Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                Label label_customerProcessid = MainDataGrid.Items[i].FindControl("Label_CustomerProcessID") as Label;
                Label label_customerProcessname = MainDataGrid.Items[i].FindControl("Label_CustomerProcessName") as Label;
                DropDownList dropDownList_Day = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList dropDownList_Hour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList dropDownList_Minute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;
                CheckBox cbl_isunnormal = MainDataGrid.Items[i].FindControl("cbl_isunnormal") as CheckBox;
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;
                Label lab_StatusID = MainDataGrid.Items[i].FindControl("dg_lab_StatusID") as Label;
                Label dg_lab_processno = MainDataGrid.Items[i].FindControl("dg_lab_processno") as Label;
                Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;
                string processno = dg_lab_processno.Text;

                dr = dt.NewRow();

                dr["processorder"] = Label_OrderNo.Text.Trim();
                dr["ProcessId"] = label_processid.Text.Trim();
                dr["CustomerProcessId"] = label_customerProcessid.Text.Trim();
                dr["CustomerProcessName"] = label_customerProcessname.Text.Trim();
                dr["Day"] = dropDownList_Day.SelectedValue;
                dr["Hour"] = dropDownList_Hour.SelectedValue;
                dr["Minute"] = dropDownList_Minute.SelectedValue;
                dr["ProcessNo"] = dg_lab_processno.Text;
                dr["SelfStartDate"] = txt_startDate.Text.Trim();
                dr["StartHour"] = dpl_startHour.SelectedValue;
                dr["SelfEndDate"] = txt_endDate.Text.Trim();
                dr["EndHour"] = dpl_endHour.SelectedValue;

                if (cbl_isunnormal.Checked)//whd080901 增�??�否返修
                {
                    dr["IsUnnormal"] = 1;
                }
                else
                {
                    dr["IsUnnormal"] = 0;
                }
                dr["processComment"] = txt_processComment.Text.Trim();
                dr["processMachineid"] = dpl_processMachineid.SelectedValue.Trim();
                dr["StatusID"] = lab_StatusID.Text.Trim();
                dr["pricetype"] = lab_pricetype.Text;

                //				dt.Rows.Add(dr);
                if (!lab_zuli.Text.Equals(""))
                {
                    dt.Rows.InsertAt(dr, MainDataGrid.Items.Count - 1);

                }
                else
                {
                    dt.Rows.Add(dr);
                    if (process.GetProcessInfoByCustomerProcessId(label_processid.Text).PriceType.Equals("ZULI"))
                    {
                        lab_zuli.Text = dr["pricetype"].ToString();
                        dr["pricetype"] = "ZULI";
                    }
                }

                //				dt.Rows.Add(dr);
            }

            if (selectRow == -1)
            {
                //new a record
                dr = dt.NewRow();

                dr["processorder"] = Convert.ToString(MainDataGrid.Items.Count + 1);
                ModuleWorkFlow.Model.ProcessInfo pi = processCustomer.GetProcessInfoBykey(CheckBoxList_Process.SelectedValue, new ModuleWorkFlow.BLL.Process());
                dr["ProcessId"] = pi.ProcessId;
                dr["CustomerProcessId"] = CheckBoxList_Process.SelectedValue;
                dr["CustomerProcessName"] = CheckBoxList_Process.SelectedItem.Text.Trim();
                dr["Day"] = "0";
                dr["Hour"] = "0";
                dr["Minute"] = "0";
                dr["ProcessNo"] = "0";
                dr["SelfStartDate"] = "";
                dr["StartHour"] = "0";
                dr["SelfEndDate"] = "";
                dr["EndHour"] = "0";
                dr["IsUnnormal"] = 0;
                dr["processComment"] = "";
                dr["processMachineid"] = "";
                dr["StatusID"] = "Pending";
                dr["pricetype"] = "";


                if (!lab_zuli.Text.Equals(""))
                {
                    dt.Rows.InsertAt(dr, MainDataGrid.Items.Count - 1);
                }
                else
                {
                    dt.Rows.Add(dr);
                    if (process.GetProcessInfoByCustomerProcessId(CheckBoxList_Process.SelectedValue).PriceType.Equals("ZULI"))
                    {
                        lab_zuli.Text = dr["pricetype"].ToString();
                        dr["pricetype"] = "ZULI";
                    }
                }
            }

            DataView dv = new DataView(dt);

            MainDataGrid.DataSource = dv;
            MainDataGrid.DataBind();

            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (i == selectRow) MainDataGrid.Items[i].BackColor = Setting.SELECTCOLOR;
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                DropDownList DDLDay = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList DDLHour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList DDLMinute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;
                CheckBox cbl_isunnormal = MainDataGrid.Items[i].FindControl("cbl_isunnormal") as CheckBox;//whd080901 增�??�否返修
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;


                Label lab_StatusID = MainDataGrid.Items[i].FindControl("dg_lab_StatusID") as Label;
                Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;

                Label_OrderNo.Text = Convert.ToString(i + 1);
                tools.DropDownListInit(DDLDay, 0, Setting.DAYS);
                tools.DropDownListInit(DDLHour, 0, Setting.HOURS - 1);
                tools.EveryMinuteDropDownListInit(DDLMinute);
                txt_startDate.Text = "";
                tools.DropDownListInit(dpl_startHour, 0, Setting.HOURS - 1);
                txt_endDate.Text = "";
                tools.DropDownListInit(dpl_endHour, 0, Setting.HOURS - 1);
                cbl_isunnormal.Checked = false;//whd080901 增�??�否返修
                txt_processComment.Text = "";
                ModuleWorkFlow.BLL.Machine machine = new ModuleWorkFlow.BLL.Machine();
                try
                {
                    if (menuid.Equals("F102"))
                    {
                        dpl_processMachineid.DataSource = new User().getUserInfoByMenuId(menuid, false);
                        dpl_processMachineid.DataTextField = "UserName";
                        dpl_processMachineid.DataValueField = "UserName";
                        dpl_processMachineid.DataBind();
                        dpl_processMachineid.Items.Insert(0, new ListItem("", ""));
                    }
                    else
                    {
                        dpl_processMachineid.DataSource = machine.GetAllMachineList(label_processid.Text.Trim());
                        dpl_processMachineid.DataValueField = "Id";
                        dpl_processMachineid.DataTextField = "Id";
                        dpl_processMachineid.DataBind();
                        dpl_processMachineid.Items.Insert(0, "");
                    }


                }
                catch
                {
                    dpl_processMachineid.Items.Clear();
                    dpl_processMachineid.Items.Insert(0, "");
                }
                if (lab_pricetype.Text.Equals("ZULI"))
                {
                    cbl_isunnormal.Enabled = false;
                }
            }

            //retieved all data
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                DropDownList dropDownList_Day = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList dropDownList_Hour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList dropDownList_Minute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;
                CheckBox cbl_isunnormal = MainDataGrid.Items[i].FindControl("cbl_isunnormal") as CheckBox;//whd080901 增�??�否返修
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;

                Label lab_StatusID = MainDataGrid.Items[i].FindControl("dg_lab_StatusID") as Label;
                Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;
                Label dg_lab_processno = MainDataGrid.Items[i].FindControl("dg_lab_processno") as Label;

                string oldDay = dt.Rows[i][dt.Columns[4]].ToString();
                string oldHour = dt.Rows[i][dt.Columns[5]].ToString();
                string oldMintes = dt.Rows[i][dt.Columns[6]].ToString();
                string oldProcessno = dt.Rows[i][dt.Columns[7]].ToString();
                string oldSelfStartDate = dt.Rows[i][dt.Columns[8]].ToString();
                string oldStartHour = dt.Rows[i][dt.Columns[9]].ToString();
                string oldSelfEndDate = dt.Rows[i][dt.Columns[10]].ToString();
                string oldEndHour = dt.Rows[i][dt.Columns[11]].ToString();
                int oldisunnormal = Convert.ToInt32(dt.Rows[i][dt.Columns[12]]);
                string oldProcessComment = dt.Rows[i][dt.Columns[13]].ToString();
                string oldProcessMachineid = dt.Rows[i][dt.Columns[14]].ToString();
                string statusid = dt.Rows[i][dt.Columns[15]].ToString();
                string pricetype = dt.Rows[i][dt.Columns[16]].ToString();

                dg_lab_processno.Text = oldProcessno;
                tools.DropDownListChange(dropDownList_Day, oldDay);
                tools.DropDownListChange(dropDownList_Hour, oldHour);
                tools.DropDownListChange(dropDownList_Minute, oldMintes);
                txt_startDate.Text = oldSelfStartDate;
                tools.DropDownListChange(dpl_startHour, oldStartHour);
                txt_endDate.Text = oldSelfEndDate;
                tools.DropDownListChange(dpl_endHour, oldEndHour);
                if (lab_pricetype.Text.Equals("ZULI"))
                {
                    cbl_isunnormal.Enabled = false;
                }
                if (oldisunnormal == 0)//whd080901 
                {
                    cbl_isunnormal.Checked = false;
                }
                else
                {
                    cbl_isunnormal.Checked = true;
                }
                txt_processComment.Text = oldProcessComment;
                try
                {
                    dpl_processMachineid.SelectedValue = oldProcessMachineid;
                }
                catch
                {
                }
                lab_StatusID.Text = statusid;

                PartType parttype = new PartType();
                string partno = "";
                if (list_partnos.Items.Count > 0)
                {
                    partno = list_partnos.Items[0].Value.Trim();
                }
                if (lab_pricetype.Text.Equals("ALWAYSFIRST") && Label_ModuleId.Text.IndexOf("-") < 0 && parttype.GetPartTypeByPartNo(partno).NoFirstProcess == 0)
                {
                    Button UpBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 6].Controls[0];


                    Button DownBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 5].Controls[0];

                    Button DELBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 4].Controls[0];

                    Button SELECTBtn = (Button)MainDataGrid.Items[i].Cells[0].Controls[0];

                    string lastone = Label_ModuleId.Text.Substring(Label_ModuleId.Text.Length - 1, 1);
                    if (System.Configuration.ConfigurationSettings.AppSettings["lastparameter"] != null)
                    {
                        string[] parameter = System.Configuration.ConfigurationSettings.AppSettings["lastparameter"].Split(',');
                        //if (!lastone.Contains("X") && !lastone.Contains("x"))
                        foreach (string lastparameter in parameter)
                        {
                            if (lastone.Contains(lastparameter))
                            {
                                UpBtn.Enabled = false;
                                DELBtn.Enabled = false;
                                SELECTBtn.Enabled = false;
                                DownBtn.Enabled = false;
                                if (MainDataGrid.Items.Count > 1)
                                {
                                    Button UpBtnNext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                                    UpBtnNext.Enabled = false;
                                }

                                MainDataGrid.Items[i].BackColor = Color.Chocolate;
                            }
                        }
                    }
                    else
                    {
                        UpBtn.Enabled = false;
                        DELBtn.Enabled = false;
                        SELECTBtn.Enabled = false;
                        DownBtn.Enabled = false;
                        if (MainDataGrid.Items.Count > 1)
                        {
                            Button UpBtnnext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                            UpBtnnext.Enabled = false;
                        }
                        MainDataGrid.Items[i].BackColor = Color.Chocolate;

                    }



                }

            }
            //htPartProcess = (Hashtable)Session["htPartProcess"];
            hprocess = (Hashtable)Session["hprocess"];
            disableProductedProcess();

        }

        private void DeleteDataSource(int index) //080901
        {
            int selectRow = Convert.ToInt32(Label_HiddenSelectRow.Text);
            if (selectRow > MainDataGrid.Items.Count - 2)
            {
                selectRow = -1;
                Label_HiddenSelectRow.Text = "-1";
            }
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new DataColumn("processorder", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessId", typeof(string)));
            dt.Columns.Add(new DataColumn("CustomerProcessID", typeof(string)));
            dt.Columns.Add(new DataColumn("CustomerProcessName", typeof(string)));
            dt.Columns.Add(new DataColumn("Day", typeof(string)));
            dt.Columns.Add(new DataColumn("Hour", typeof(string)));
            dt.Columns.Add(new DataColumn("Minute", typeof(string)));
            dt.Columns.Add(new DataColumn("ProcessNo", typeof(string)));
            dt.Columns.Add(new DataColumn("SelfStartDate", typeof(string)));
            dt.Columns.Add(new DataColumn("StartHour", typeof(string)));
            dt.Columns.Add(new DataColumn("SelfEndDate", typeof(string)));
            dt.Columns.Add(new DataColumn("EndHour", typeof(string)));
            dt.Columns.Add(new DataColumn("IsUnnormal", typeof(int)));
            dt.Columns.Add(new DataColumn("processComment", typeof(string)));
            dt.Columns.Add(new DataColumn("processMachineid", typeof(string)));
            dt.Columns.Add(new DataColumn("StatusID", typeof(string)));
            dt.Columns.Add(new DataColumn("pricetype", typeof(string)));

            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (index != i)
                {
                    Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                    Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                    Label Label_CustomerProcessID = MainDataGrid.Items[i].FindControl("Label_CustomerProcessID") as Label;
                    Label label_Customerprocessname = MainDataGrid.Items[i].FindControl("Label_CustomerProcessName") as Label;
                    DropDownList dropDownList_Day = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                    DropDownList dropDownList_Hour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                    DropDownList dropDownList_Minute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                    TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                    DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                    TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                    DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;
                    CheckBox cbl_isunnormal = MainDataGrid.Items[i].FindControl("cbl_isunnormal") as CheckBox;//whd080901 增�??�否返修
                    TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                    DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;

                    string processno = ((Label)MainDataGrid.Items[i].FindControl("Label_processno")).Text;
                    Label lab_StatusID = MainDataGrid.Items[i].FindControl("dg_lab_StatusID") as Label;
                    Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;
                    dr = dt.NewRow();

                    dr["processorder"] = Label_OrderNo.Text.Trim();
                    dr["ProcessId"] = label_processid.Text.Trim();
                    dr["CustomerProcessID"] = Label_CustomerProcessID.Text.Trim();
                    dr["CustomerProcessName"] = label_Customerprocessname.Text.Trim();
                    dr["Day"] = dropDownList_Day.SelectedValue;
                    dr["Hour"] = dropDownList_Hour.SelectedValue;
                    dr["Minute"] = dropDownList_Minute.SelectedValue;
                    dr["ProcessNo"] = processno;
                    dr["SelfStartDate"] = txt_startDate.Text.Trim();
                    dr["StartHour"] = dpl_startHour.SelectedValue;
                    dr["SelfEndDate"] = txt_endDate.Text.Trim();
                    dr["EndHour"] = dpl_endHour.SelectedValue;
                    if (cbl_isunnormal.Checked)//whd080901 增�??�否返修
                    {
                        dr["IsUnnormal"] = 1;
                    }
                    else
                    {
                        dr["IsUnnormal"] = 0;
                    }
                    dr["processComment"] = txt_processComment.Text.Trim();
                    dr["processMachineid"] = dpl_processMachineid.SelectedValue.Trim();
                    dr["StatusID"] = lab_StatusID.Text;
                    dr["pricetype"] = lab_pricetype.Text;
                    if (lab_pricetype.Text.Equals("ZULI"))
                    {
                        lab_zuli.Text = dr["pricetype"].ToString();
                    }
                    dt.Rows.Add(dr);
                }
            }


            DataView dv = new DataView(dt);

            MainDataGrid.DataSource = dv;
            MainDataGrid.DataBind();

            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                if (i == selectRow) MainDataGrid.Items[i].BackColor = Setting.SELECTCOLOR;
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                DropDownList DDLDay = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList DDLHour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList DDLMinute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;

                DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;

                Label_OrderNo.Text = Convert.ToString(i + 1);
                tools.DropDownListInit(DDLDay, 0, Setting.DAYS);
                tools.DropDownListInit(DDLHour, 0, Setting.HOURS - 1);
                tools.EveryMinuteDropDownListInit(DDLMinute);
                tools.DropDownListInit(dpl_startHour, 0, Setting.HOURS - 1);
                tools.DropDownListInit(dpl_endHour, 0, Setting.HOURS - 1);
                ModuleWorkFlow.BLL.Machine machine = new ModuleWorkFlow.BLL.Machine();
                try
                {
                    if (menuid.Equals("F102"))
                    {
                        dpl_processMachineid.DataSource = new User().getUserInfoByMenuId(menuid, false);
                        dpl_processMachineid.DataTextField = "UserName";
                        dpl_processMachineid.DataValueField = "UserName";
                        dpl_processMachineid.DataBind();
                        dpl_processMachineid.Items.Insert(0, new ListItem("", ""));
                    }
                    else
                    {
                        dpl_processMachineid.DataSource = machine.GetAllMachineList(label_processid.Text.Trim());
                        dpl_processMachineid.DataValueField = "Id";
                        dpl_processMachineid.DataTextField = "Id";
                        dpl_processMachineid.DataBind();
                        dpl_processMachineid.Items.Insert(0, "");
                    }

                }
                catch
                {
                    dpl_processMachineid.Items.Clear();
                    dpl_processMachineid.Items.Insert(0, "");
                }
            }

            //retieved all data
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                DropDownList dropDownList_Day = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList dropDownList_Hour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList dropDownList_Minute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;
                CheckBox cbl_isunnormal = MainDataGrid.Items[i].FindControl("cbl_isunnormal") as CheckBox;//whd080901 增�??�否返修
                TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;

                Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;

                string oldDay = dt.Rows[i][dt.Columns["Day"]].ToString();
                string oldHour = dt.Rows[i][dt.Columns["Hour"]].ToString();
                string oldMintes = dt.Rows[i][dt.Columns["Minute"]].ToString();
                //string oldProcessno = dt.Rows[i][dt.Columns["ProcessNo"]].ToString();
                string oldSelfStartDate = dt.Rows[i][dt.Columns["SelfStartDate"]].ToString();
                string oldStartHour = dt.Rows[i][dt.Columns["StartHour"]].ToString();
                string oldSelfEndDate = dt.Rows[i][dt.Columns["SelfEndDate"]].ToString();
                string oldEndHour = dt.Rows[i][dt.Columns["EndHour"]].ToString();
                int oldisunnormal = Convert.ToInt32(dt.Rows[i][dt.Columns["IsUnnormal"]]);
                string oldProcessComment = dt.Rows[i][dt.Columns["processComment"]].ToString();
                string oldProcessMachineid = dt.Rows[i][dt.Columns["processMachineid"]].ToString();

                tools.DropDownListChange(dropDownList_Day, oldDay);
                tools.DropDownListChange(dropDownList_Hour, oldHour);
                tools.DropDownListChange(dropDownList_Minute, oldMintes);
                txt_startDate.Text = oldSelfStartDate;
                tools.DropDownListChange(dpl_startHour, oldStartHour);
                txt_endDate.Text = oldSelfEndDate;
                tools.DropDownListChange(dpl_endHour, oldEndHour);
                if (lab_pricetype.Text.Equals("ZULI"))
                {
                    cbl_isunnormal.Enabled = false;
                }
                if (oldisunnormal == 0)//whd080901 
                {
                    cbl_isunnormal.Checked = false;
                }
                else
                {
                    cbl_isunnormal.Checked = true;
                }
                txt_processComment.Text = oldProcessComment;
                try
                {
                    dpl_processMachineid.SelectedValue = oldProcessMachineid;
                }
                catch
                {
                }
                PartType parttype = new PartType();
                string partno = "";
                if (list_partnos.Items.Count > 0)
                {
                    partno = list_partnos.Items[0].Value.Trim();
                }


                if (lab_pricetype.Text.Equals("ALWAYSFIRST") && Label_ModuleId.Text.IndexOf("-") < 0 && parttype.GetPartTypeByPartNo(partno).NoFirstProcess == 0)
                {
                    Button UpBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 6].Controls[0];


                    Button DownBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 5].Controls[0];

                    Button DELBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 4].Controls[0];

                    Button SELECTBtn = (Button)MainDataGrid.Items[i].Cells[0].Controls[0];

                    string lastone = Label_ModuleId.Text.Substring(Label_ModuleId.Text.Length - 1, 1);
                    if (System.Configuration.ConfigurationSettings.AppSettings["lastparameter"] != null)
                    {
                        string[] parameter = System.Configuration.ConfigurationSettings.AppSettings["lastparameter"].Split(',');
                        //if (!lastone.Contains("X") && !lastone.Contains("x"))
                        foreach (string lastparameter in parameter)
                        {
                            if (lastone.Contains(lastparameter))
                            {
                                UpBtn.Enabled = false;
                                DELBtn.Enabled = false;
                                SELECTBtn.Enabled = false;
                                DownBtn.Enabled = false;
                                if (MainDataGrid.Items.Count > 1)
                                {
                                    Button UpBtnnext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                                    UpBtnnext.Enabled = false;
                                }
                                MainDataGrid.Items[i].BackColor = Color.Chocolate;
                            }


                        }
                    }
                    else
                    {
                        UpBtn.Enabled = false;
                        DELBtn.Enabled = false;
                        SELECTBtn.Enabled = false;
                        DownBtn.Enabled = false;
                        if (MainDataGrid.Items.Count > 1)
                        {
                            Button UpBtnnext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                            UpBtnnext.Enabled = false;
                        }
                        MainDataGrid.Items[i].BackColor = Color.Chocolate;

                    }



                }
            }
            disableProductedProcess();
        }

        protected void MainDataGrid_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            DeleteDataSource(e.Item.ItemIndex);
            UpdatePanel1.Update();

        }



        private bool CheckUserInput()
        {
            bool val = true;

           



            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                DropDownList dropDownList_Day = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList dropDownList_Hour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList dropDownList_Minute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                if (dropDownList_Day.SelectedValue.Equals("0") && dropDownList_Hour.SelectedValue.Equals("0") && dropDownList_Minute.SelectedValue.Equals("0"))
                {
                    val = false;
                    Label_Message.Text = Lang.TXT_NEEDMINUTESZERO;
                }
                //?��?計�??��??��??��??��??��??��??��?
                if ((!txt_endDate.Text.Trim().Equals("") && !txt_startDate.Text.Trim().Equals("")))
                {
                    try
                    {
                        DateTime endDate = Convert.ToDateTime(txt_endDate.Text);
                        DateTime startDate = Convert.ToDateTime(txt_startDate.Text);
                        if (startDate.CompareTo(endDate) > 0)
                        {
                            val = false;
                            Label_Message.Text = Lang.TXT_DATELOGICALERROR;
                        }
                    }
                    catch
                    {
                        val = false;
                        Label_Message.Text = Lang.TXT_DATEERROR;
                    }

                }
                else if (txt_endDate.Text.Trim().Equals("") && txt_startDate.Text.Trim().Equals(""))
                {

                }
                else
                {
                    Label_Message.Text = Lang.TXT_TIME;
                    val = false;
                }

            }

            return val;
        }







        private void deleteNotAvaibleProcessByPartID(int processNo)
        {
            string querystring = "delete from tb_partprocess where ProcessNo=@processNo";
            SqlParameter[] pars = new SqlParameter[1];
            pars[0] = new SqlParameter("@processNo", SqlDbType.NVarChar, 50);
            pars[0].Value = processNo;
            business.Data.ExecuteNonQuery(querystring, pars);
        }



       

       
        private void bindPartNo(string[] partnos)
        {
            list_partnos.Items.Clear();
            for (int i = 0; i < partnos.Length; i++)
            {
                ListItem l = new ListItem(partnos[i], partnos[i]);
                list_partnos.Items.Add(l);
                list_partnos.Items[i].Selected = true;
            }
            
        }


        private void bindStatus()
        {
            dpl_status.Items.Clear();
            dpl_status.Items.Add(new ListItem(Translate.translateString("就緒"), "Ready"));
            dpl_status.Items.Add(new ListItem(Translate.translateString("暫停"), "Holdon"));
            dpl_status.Items.Add(new ListItem(Translate.translateString("取消"), "Cancelled"));
        }

        private void dataStandBind(string processtype, string standprocessname, IList fixedProcesses)
        {

            StandProcess standprocess = new StandProcess();
            if (!processtype.Equals("") && !standprocessname.Equals(""))
            {

                IList standprocesses = standprocess.GetStandProcessByName(processtype, standprocessname, false);
                foreach (StandProcessInfo spi in standprocesses)
                {
                    spi.Id = 0;
                }

                (fixedProcesses as ArrayList).AddRange(standprocesses);
            }

            MainDataGrid.DataSource = fixedProcesses;
            MainDataGrid.DataBind();

            //get hours per day from process table
            Hashtable htProcess = ModuleWorkFlow.business.Process.getProcessHoursPerDay();
            Hashtable htprocesstype = new ModuleWorkFlow.BLL.Process().GetProcessIdProcessWithCustomerProcess();
            //retieved all data
            int selectRow = Convert.ToInt32(Label_HiddenSelectRow.Text);

            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                int hoursPerday = 24;
                if (i == selectRow) MainDataGrid.Items[i].BackColor = Setting.SELECTCOLOR;
                Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                Label Label_CustomerProcessID = MainDataGrid.Items[i].FindControl("Label_CustomerProcessID") as Label;
                Label label_Customerprocessname = MainDataGrid.Items[i].FindControl("Label_CustomerProcessName") as Label;
                Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                DropDownList DDLDay = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                DropDownList DDLHour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList DDLMinute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;
                Label lab_pricetype = MainDataGrid.Items[i].FindControl("dg_lab_pricetype") as Label;
                TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;

                lab_pricetype.Text = ((ModuleWorkFlow.Model.ProcessInfo)htprocesstype[Label_CustomerProcessID.Text]).PriceType;

                Label_OrderNo.Text = Convert.ToString(i + 1);
                tools.DropDownListInit(DDLDay, 0, Setting.DAYS);
                tools.DropDownListInit(DDLHour, 0, Setting.HOURS - 1);
                tools.EveryMinuteDropDownListInit(DDLMinute);

                tools.DropDownListInit(dpl_startHour, 0, Setting.HOURS - 1);
                tools.DropDownListInit(dpl_endHour, 0, Setting.HOURS - 1);


                WorkFlow.Model.Standard.StandProcessInfo spi = new WorkFlow.Model.Standard.StandProcessInfo();
                Label lab_processno = MainDataGrid.Items[i].FindControl("Label_processno") as Label;

                int processno = Convert.ToInt32(lab_processno.Text);

                lab_processno.Text = "0";

                if (processno > 0)
                {
                    spi = standprocess.getStandProcessById(processno);
                }
                else
                {
                    if (fixedProcesses.Count > 0)
                    {
                        spi = fixedProcesses[i] as StandProcessInfo;
                    }
                    else
                    {
                        spi = null;
                    }
                }
                if (spi != null)
                {

                    if (htProcess.ContainsKey(spi.ProcessId.ToUpper()))
                    {
                        hoursPerday = Convert.ToInt32(htProcess[spi.ProcessId.ToUpper()]);
                        if (hoursPerday == 0)
                        {
                            hoursPerday = 24;
                        }
                    }
                    int processneedminutes = spi.ProcessNeedMinutes;
                    string oldDay = Convert.ToString((int)(processneedminutes / (60 * hoursPerday)));
                    string oldHour = Convert.ToString((int)(processneedminutes % (60 * hoursPerday) / 60));
                    string oldMintes = Convert.ToString((int)(processneedminutes % (60 * hoursPerday) % 60));

                    if (Convert.ToInt32(oldDay) > 30)
                    {
                        oldDay = "30";
                    }

                    DDLDay.SelectedValue = oldDay;
                    DDLHour.SelectedValue = oldHour;
                    DDLMinute.SelectedValue = oldMintes;

                    ModuleWorkFlow.BLL.Machine machine = new ModuleWorkFlow.BLL.Machine();
                    try
                    {
                        if (menuid.Equals("F102"))
                        {
                            dpl_processMachineid.DataSource = new User().getUserInfoByMenuId(menuid, false);
                            dpl_processMachineid.DataTextField = "UserName";
                            dpl_processMachineid.DataValueField = "UserName";
                            dpl_processMachineid.DataBind();
                            dpl_processMachineid.Items.Insert(0, new ListItem("", ""));
                        }
                        else
                        {
                            dpl_processMachineid.DataSource = machine.GetAllMachineList(label_processid.Text.Trim());
                            dpl_processMachineid.DataValueField = "Id";
                            dpl_processMachineid.DataTextField = "Id";
                            dpl_processMachineid.DataBind();
                            dpl_processMachineid.Items.Insert(0, "");
                        }
                    }
                    catch
                    {
                        dpl_processMachineid.Items.Clear();
                        dpl_processMachineid.Items.Insert(0, "");
                    }

                }

                PartType parttype = new PartType();
                string partno = "";
                if (list_partnos.Items.Count > 0)
                {
                    partno = list_partnos.Items[0].Value.Trim();
                }
                if (lab_pricetype.Text.Equals("ALWAYSFIRST") && Label_ModuleId.Text.IndexOf("-") < 0 && parttype.GetPartTypeByPartNo(partno).NoFirstProcess == 0)
                {
                    Button UpBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 6].Controls[0];


                    Button DownBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 5].Controls[0];

                    Button DELBtn = (Button)MainDataGrid.Items[i].Cells[MainDataGrid.Columns.Count - 4].Controls[0];

                    Button SELECTBtn = (Button)MainDataGrid.Items[i].Cells[0].Controls[0];

                    string lastone = Label_ModuleId.Text.Substring(Label_ModuleId.Text.Length - 1, 1);
                    if (System.Configuration.ConfigurationSettings.AppSettings["lastparameter"] != null)
                    {
                        string[] parameter = System.Configuration.ConfigurationSettings.AppSettings["lastparameter"].Split(',');
                        //if (!lastone.Contains("X") && !lastone.Contains("x"))
                        foreach (string lastparameter in parameter)
                        {
                            if (lastone.Contains(lastparameter))
                            {
                                UpBtn.Enabled = false;
                                DELBtn.Enabled = false;
                                SELECTBtn.Enabled = false;
                                DownBtn.Enabled = false;
                                if (MainDataGrid.Items.Count > 1)
                                {
                                    Button UpBtnnext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                                    UpBtnnext.Enabled = false;
                                }
                                MainDataGrid.Items[i].BackColor = Color.Chocolate;
                            }


                        }
                    }
                    else
                    {
                        UpBtn.Enabled = false;
                        DELBtn.Enabled = false;
                        SELECTBtn.Enabled = false;
                        DownBtn.Enabled = false;
                        if (MainDataGrid.Items.Count > 1)
                        {
                            Button UpBtnnext = (Button)MainDataGrid.Items[i + 1].Cells[MainDataGrid.Columns.Count - 6].Controls[0];
                            UpBtnnext.Enabled = false;
                        }
                        MainDataGrid.Items[i].BackColor = Color.Chocolate;

                    }


                }
            }
            //bindzuli();
        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {

            DateTime dueDate = new DateTime();
            DateTime sendDate = new DateTime();
            DateTime checkDate = new DateTime();
            try
            {
                dueDate = Convert.ToDateTime(txt_dueDate.Text);
               
              
            }
            catch
            {
                Label_Message.Text = Translate.translateString("請輸入正確的需求日期");
                return;
            }

            if (CheckUserInput())
            {
                Hashtable hpartnos = new Hashtable();
                foreach (ListItem li in list_partnos.Items)
                {
                    if (hpartnos.Contains(li.Value))
                    {
                        continue;
                    }
                    else
                    {
                        hpartnos.Add(li.Value, li.Value);
                    }
                    Hashtable htProcess = ModuleWorkFlow.business.Process.getProcessHoursPerDay();

                    IList partDetails = new ArrayList();
                    for (int i = 0; i < MainDataGrid.Items.Count; i++)
                    {
                        int hoursPerday = 24;
                        PartDetailInfo pdi = new PartDetailInfo();
                        pdi.ModuleId = Label_ModuleId.Text;
                        pdi.PartNo = li.Value;
                        Label Label_OrderNo = MainDataGrid.Items[i].FindControl("Label_OrderNo") as Label;
                        pdi.ProcessOrder = i + 1;
                        Label label_processid = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                        pdi.ProcessId = label_processid.Text;
                        if (htProcess.ContainsKey(pdi.ProcessId.ToUpper()))
                        {
                            hoursPerday = Convert.ToInt32(htProcess[pdi.ProcessId.ToUpper()]);
                            if (hoursPerday == 0)
                            {
                                hoursPerday = 24;
                            }
                        }

                        Label Label_CustomerProcessID = MainDataGrid.Items[i].FindControl("Label_CustomerProcessID") as Label;
                        pdi.CustomerProcessId = Label_CustomerProcessID.Text;

                        DropDownList dropDownList_Day = MainDataGrid.Items[i].FindControl("DropDownList_Day") as DropDownList;
                        DropDownList dropDownList_Hour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                        DropDownList dropDownList_Minute = MainDataGrid.Items[i].FindControl("DropDownList_Minute") as DropDownList;
                        pdi.ProcessNeedMinutes = Convert.ToInt32(dropDownList_Day.SelectedValue) * hoursPerday * 60 + Convert.ToInt32(dropDownList_Hour.SelectedValue) * 60 + Convert.ToInt32(dropDownList_Minute.SelectedValue);
                        DropDownList dpl_processMachineid = MainDataGrid.Items[i].FindControl("dpl_processMachineid") as DropDownList;
                        TextBox txt_startDate = MainDataGrid.Items[i].FindControl("txt_startDate") as TextBox;
                        if (!txt_startDate.Text.Equals(""))
                        {
                            pdi.SelfStartTime = Convert.ToDateTime(txt_startDate.Text);
                            DropDownList dpl_startHour = MainDataGrid.Items[i].FindControl("dpl_startHour") as DropDownList;
                            pdi.SelfStartTime = pdi.SelfStartTime.AddHours(Convert.ToDouble(dpl_startHour.Text));
                        }

                        TextBox txt_endDate = MainDataGrid.Items[i].FindControl("txt_endDate") as TextBox;
                        if (!txt_endDate.Text.Equals(""))
                        {
                            pdi.SelfEndTime = Convert.ToDateTime(txt_endDate.Text);
                            DropDownList dpl_endHour = MainDataGrid.Items[i].FindControl("dpl_endHour") as DropDownList;
                            pdi.SelfEndTime = pdi.SelfEndTime.AddHours(Convert.ToDouble(dpl_endHour.SelectedValue));
                        }


                        Label Label_processno = MainDataGrid.Items[i].FindControl("Label_processno") as Label;
                        if (li == list_partnos.Items[0])
                        {
                            pdi.ProcessNo = Convert.ToInt32(Label_processno.Text);
                        }

                        //PartDetailInfo partdetailInfo = new PartDetail().GetPartDetailInfos(pdi.ModuleId, pdi.PartNo, pdi.ProcessOrder);
                        //if (partdetailInfo != null)
                        //{
                        //    pdi.ProcessNo = partdetailInfo.ProcessNo;
                        //}
                        //else
                        //{
                        //    pdi.ProcessNo = 0;
                        //}


                        TextBox txt_processComment = MainDataGrid.Items[i].FindControl("txt_processComment") as TextBox;
                        pdi.ProcessComment = txt_processComment.Text.Trim();
                        pdi.ProcessMachineId = dpl_processMachineid.SelectedValue;

                        partDetails.Add(pdi);


                    }

                    if (partDetails.Count == 0)
                    {
                        Label_Message.Text = Translate.translateString("請選擇工藝");
                        return;
                    }

                    if (lab_type.Text.Trim().Equals(""))
                    {
                        string userno = "";
                        if (Session["userid"] != null)
                        {
                            userno = Session["userid"].ToString();
                        }
                        IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                        outsourceApplyDesigninfo.Creater = userno;
                        outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                        if (list_partnos.Items.Count > 1)
                        {
                            Label_Message.Text = Label_Message.Text = new PartDetail().updatePartDetail(partDetails, Label_ModuleId.Text, li.Value, Convert.ToInt32(ListBox_Priority.SelectedValue), true, dpl_status.SelectedValue, userno, dueDate, sendDate, checkDate, null, false, new OutSourceDetail(), outsourceApplyDesigninfo);
                        }

                        if (list_partnos.Items.Count == 1)
                        {
                            
                            //RedisHelper redis = new RedisHelper();

                           
                            Label_Message.Text = new PartDetail().updatePartDetail(partDetails, Label_ModuleId.Text, li.Value, Convert.ToInt32(ListBox_Priority.SelectedValue), true, dpl_status.SelectedValue, userno, dueDate, sendDate, checkDate, null, txt_comment.Text, false, null, null, new OutSourceDetail(), outsourceApplyDesigninfo, Convert.ToInt32(dpl_difficuleLevel.SelectedValue));

                               
                            
                        }

                        
                    }
                    else
                    {
                        Label_Message.Text = new PartDetail().updateDesignPartDetail(partDetails, Label_ModuleId.Text, li.Value, Convert.ToInt32(ListBox_Priority.SelectedValue), true, dpl_status.SelectedValue);
                    }

                    if (!Label_Message.Text.Equals(Lang.SAVE_SUCCESS + "<br>"))
                    {
                        Label_Message.Text = li.Value + Translate.translateString("及以後") + Label_Message.Text;
                        break;
                    }

                }

                if (Label_Message.Text.IndexOf(Lang.SAVE_SUCCESS) > -1)
                {
                    DataSet ds = new PartDetail().GetDSPartDetailInfos(Label_ModuleId.Text.Trim(), list_partnos.Items[0].Value);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        dataBindHandly(ds);
                    }
                }


            }

        }


        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            string url = "PartList.aspx";
            if (viewurl.Text != null && !viewurl.Text.Trim().Equals(""))
            {
                url = viewurl.Text;
            }
            if (lab_type.Text.Trim().Equals(""))
            {
                Response.Redirect(url + "?menuid=" + menuid + "&moduleid=" + Label_ModuleId.Text + "&pageIndex=" + lab_pageIndex.Text);
            }
            else
            {
                Response.Redirect(url + "?menuid=" + menuid + "&moduleid=" + Label_ModuleId.Text + "&type=" + lab_type.Text + "&pageIndex=" + lab_pageIndex.Text);
            }
        }


      
        private void disableProductedProcess()
        {

            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                Label Label_processno = MainDataGrid.Items[i].FindControl("Label_processno") as Label;
                Label Label_ProcessID = MainDataGrid.Items[i].FindControl("Label_ProcessID") as Label;
                DropDownList Dropdownlist_Day = MainDataGrid.Items[i].FindControl("Dropdownlist_Day") as DropDownList;
                Dropdownlist_Day.Enabled = true;
                DropDownList DropDownList_Hour = MainDataGrid.Items[i].FindControl("DropDownList_Hour") as DropDownList;
                DropDownList_Hour.Enabled = true;
                DropDownList Dropdownlist_Minute = MainDataGrid.Items[i].FindControl("Dropdownlist_Minute") as DropDownList;
                Dropdownlist_Minute.Enabled = true;

                if (Convert.ToInt32(Label_processno.Text) > 0)
                {
                    ModuleWorkFlow.Model.ProcessInfo pi = new ModuleWorkFlow.BLL.Process().GetProcessInfoById(Label_ProcessID.Text.Trim());
                    if (pi.ProcessneedminutesChange == ModuleWorkFlow.Model.ProcessInfo.NOALLOWCHANGE)
                    {
                        Dropdownlist_Day.Enabled = false;
                        DropDownList_Hour.Enabled = false;
                        Dropdownlist_Minute.Enabled = false;

                    }




                }


            }
        }

        protected void MainDataGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            //if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            //{
            //    Label Label_processno = e.Item.FindControl("Label_processno") as Label;
            //    Label Label_ProcessID = e.Item.FindControl("Label_ProcessID") as Label;
            //    if (Convert.ToInt32(Label_processno.Text) > 0)
            //    {
            //        ModuleWorkFlow.Model.ProcessInfo pi = new ModuleWorkFlow.BLL.Process().GetProcessInfoById(Label_ProcessID.Text.Trim());
            //        if (pi.ProcessneedminutesChange == ModuleWorkFlow.Model.ProcessInfo.NOALLOWCHANGE)
            //        {
            //            DropDownList Dropdownlist_Day = e.Item.FindControl("Dropdownlist_Day") as DropDownList;
            //            Dropdownlist_Day.Enabled = false;
            //            DropDownList DropDownList_Hour = e.Item.FindControl("DropDownList_Hour") as DropDownList;
            //            DropDownList_Hour.Enabled = false;
            //            DropDownList Dropdownlist_Minute = e.Item.FindControl("Dropdownlist_Minute") as DropDownList;
            //            Dropdownlist_Minute.Enabled = false;
            //        }
            //    }
            //}
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            Hashtable hashchecked = new Hashtable();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox cbx_relation = MainDataGrid.Items[i].FindControl("cbx_relation") as CheckBox;
                if (cbx_relation.Checked == true)
                {
                    hashchecked.Add(i, i);
                }
            }
            lnkbutton_save_Click(sender, e);

            if (Label_Message.Text.IndexOf(Lang.SAVE_SUCCESS) > -1)
            {
                string processnolist = "";
                for (int i = 0; i < MainDataGrid.Items.Count; i++)
                {
                    if (hashchecked.Contains(i))
                    {
                        CheckBox cbx_relation = MainDataGrid.Items[i].FindControl("cbx_relation") as CheckBox;
                        //if (cbx_relation.Checked == true)
                        //{
                        Label Label_processno = MainDataGrid.Items[i].FindControl("Label_processno") as Label;
                        processnolist += "," + Label_processno.Text;
                        //}
                    }
                }

                if (processnolist.Equals(""))
                {
                    Label_Message.Text = Translate.translateString("請選擇零件");
                    return;
                }
                else
                {
                    if (new PartDetailRelation().isSamesPartDetailRelationInfos(processnolist) != null)
                    {
                        string url = "ParRelation.aspx?PartdetailProcessno=" + processnolist + "&pageIndex=" + MainDataGrid.CurrentPageIndex;
                        Response.Redirect(url);

                    }
                    else
                    {
                        Label_Message.Text = Translate.translateString("這些零件掛靠不相同零件，無法同時掛靠");
                        return;
                    }
                }
            }
        }
    }
}
