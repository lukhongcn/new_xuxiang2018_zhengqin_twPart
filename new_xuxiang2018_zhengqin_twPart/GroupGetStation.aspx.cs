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


using Utility;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;



using Utility;
using ModuleWorkFlow.BLL.System;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for InventoryManage.
    /// </summary>
    public class GroupGetStation : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_StatusMsg;
        protected System.Web.UI.WebControls.Label lab_action;
        protected System.Web.UI.WebControls.Label lab_moduleId;
        protected Label lab_partno;
        protected System.Web.UI.WebControls.Label lab_actionvalue;
        protected System.Web.UI.WebControls.Label Label1;
        protected System.Web.UI.WebControls.Label lab_user;
        protected System.Web.UI.WebControls.Label lab_user_value;
        protected System.Web.UI.WebControls.Label lab_hiddenActionId;
        protected System.Web.UI.WebControls.Label lab_hiddenWorkHours;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Button btn_out;
        protected TextBox txt_partCount;

        private ModuleWorkFlow.BLL.PartProcess partprocess;
        protected System.Web.UI.WebControls.DropDownList drp_processlist;
        protected System.Web.UI.WebControls.DataGrid MainDatagrid;
        protected System.Web.UI.WebControls.Label lab_totalcount;
        protected System.Web.UI.WebControls.Label lab_repeate;
        protected System.Web.UI.WebControls.Label lab_hiddenModuleId;
        protected System.Web.UI.WebControls.Label lab_hiddenPartNo;
        protected System.Web.UI.WebControls.Label lab_hiddenprocess;
        protected System.Web.UI.WebControls.Label lab_parnohidden;
        protected System.Web.UI.WebControls.Label lab_machine;
        protected System.Web.UI.WebControls.Label lab_machine_value;
        protected System.Web.UI.WebControls.Label lab_hidden_machine;
        protected Label lab_machine_ipaddress;
        protected Label lab_doingProductNumber;
        protected System.Web.UI.WebControls.Label lab_hiddennumvalue;
        protected System.Web.UI.WebControls.Button btn_submit;
        protected System.Web.UI.WebControls.Button Button1;
        protected System.Web.UI.WebControls.Label lab_username;
        protected CheckBox chk_passed;
        protected IList ilist = new ArrayList();
        private Utility.NoSortHashTable hprocessno;
        protected Label lab_combineStamp;
        protected CheckBox chk_combine;
        private ScanBar scanbar;



        private void Page_Load(object sender, System.EventArgs e)
        {
            Response.Expires = 0;
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1);
            Response.AddHeader("pragma", "no-cache");
            Response.CacheControl = "no-cache";
            scanbar = new ScanBar();

            if (!this.IsPostBack)
            {
                //權限控制
                string menuid = "F28";
                Session["hprocessno"] = null;
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");
                ModuleWorkFlow.BLL.Process p = new ModuleWorkFlow.BLL.Process();

                hprocessno = new Utility.NoSortHashTable();
                BindProcess();
                HttpCookie cookie = Request.Cookies["COOKIEGROUPPROCESSID"];
                if (cookie != null)
                {
                    Methods.DropDownListChange(drp_processlist, cookie.Value);
                }

                if (p.GetProcessInfoById(drp_processlist.SelectedValue).NeedSchedule == 1)
                {
                    setMachine();
                }
                else
                {
                    chk_combine.Checked = false;
                    chk_combine.Enabled = false;
                }
            }


            partprocess = new ModuleWorkFlow.BLL.PartProcess();

            string content = txt_partCount.Text.ToUpper();
            Label_Message.Text = "";
            if (!content.Equals(""))
            {
                if (content.IndexOf("A-") != -1 || content.IndexOf("B-") != -1 || content.IndexOf("D-") != -1 || content.IndexOf("M-") != -1 || content.IndexOf("-") == -1)
                {
                    doCommand(content);
                }
                else
                {
                    if (lab_moduleId.Text.Equals(""))
                    {
                        lab_moduleId.Text = content;
                    }
                    else
                    {
                        content = "B-" + lab_moduleId.Text + "-" + content;
                        lab_moduleId.Text = "";
                        doCommand(content);
                    }
                }
                txt_partCount.Text = "";
            }
        }

        private void setMachine()
        {
            bool needMachine = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["needMachine"]);
            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
            if (!needMachine || pi.NeedSchedule == 0)
            {
                lab_machine_value.Text = "";
                lab_hidden_machine.Text = "";
                lab_machine_ipaddress.Text = "";
                lab_doingProductNumber.Text = "";
                return;
            }

            Machine machine = new Machine();
            lab_machine_ipaddress.Text = GetIPAddress();
            IList source = machine.getMachineIdByIPAddressAndProcessid(lab_machine_ipaddress.Text, drp_processlist.SelectedValue);
            if (source.Count > 0)
            {
                lab_machine_value.Text = (source[0] as MachineInfo).Id;
                lab_hidden_machine.Text = (source[0] as MachineInfo).Id;


                int doingProductNumber = getDoingPart(lab_machine_value.Text);

                lab_doingProductNumber.Text = doingProductNumber.ToString();

                if (doingProductNumber == -1)
                {
                    lab_actionvalue.Text = PTSetting.ACTIONNAME[0];
                    lab_hiddenActionId.Text = PTSetting.ACTIONBARCODE[0];
                }
            }
            else
            {
                lab_machine_value.Text = "";
                lab_hidden_machine.Text = "";
                //lab_machine_ipaddress.Text = "";
                lab_doingProductNumber.Text = "";
            }


        }
        private string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            ipAddress = context.Request.ServerVariables["REMOTE_ADDR"];
            //ipAddress = "120.86.113.44";
            lab_machine_ipaddress.Text = ipAddress;

            return ipAddress;
        }


        private void processchange()
        {
            HttpCookie cookie = new HttpCookie("COOKIEGROUPPROCESSID", drp_processlist.SelectedValue);

            TimeSpan tsminute = new TimeSpan(30, 0, 0, 0);
            cookie.Expires = DateTime.Now + tsminute;
            Response.Cookies.Add(cookie);

            Process process = new Process();
            ModuleWorkFlow.Model.ProcessInfo pi = process.GetProcessInfoById(drp_processlist.SelectedValue);
            if (pi.NeedSchedule == 0)
            {
                chk_combine.Enabled = false;
                chk_combine.Checked = false;
            }
            else
            {
                chk_combine.Enabled = true;
            }


            if (lab_hiddenActionId.Text.Trim().Equals("JIESHU") && !drp_processlist.SelectedValue.Equals(""))
            {
                //ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
                if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = true;
                    chk_passed.Visible = true;
                }
                else
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                    chk_passed.Visible = false;
                }
            }
            else
            {
                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                chk_passed.Visible = false;
            }

            setMachine();
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
            this.btn_submit.Click += new System.EventHandler(this.btn_submit_Click);
            this.Button1.Click += new System.EventHandler(this.Button1_Click);
            this.drp_processlist.SelectedIndexChanged += new System.EventHandler(this.drp_processlist_SelectedIndexChanged);
            this.MainDatagrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDatagrid_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
        //		private string BindProcessId()
        //		{
        //			ModuleWorkFlow.BLL.PartProcess partprocess = new PartProcess();
        //			ModuleWorkFlow.Model.PartProcessInfo partpi = partprocess.getPartProcessInfo(Convert.ToInt32(drp_processlist.SelectedValue));
        //			return partpi.ProcessId;
        //		}

        private void BindProcess()
        {
            ModuleWorkFlow.BLL.Process process = new Process();
            ModuleWorkFlow.BLL.PartProcess partprocess = new PartProcess();
            drp_processlist.DataSource = process.GetNoMachineProcessInfo();
            drp_processlist.DataTextField = "ProcessName";
            drp_processlist.DataValueField = "ProcessId";
            drp_processlist.DataBind();
        }


        private bool CheckProcess(string moduleid, string partno)
        {
            ModuleWorkFlow.BLL.PartProcess partprocess = new ModuleWorkFlow.BLL.PartProcess();
            if (partprocess.getListPartProcessInfo(moduleid, partno).Count == 0)
            {
                return false;
            }
            return true;
        }

        private void doCommand(string txt)
        {
            bool needUserName = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["needUserName"]);
            bool canexchange = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["canExchanged"]);
            bool needMachine = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["needMachine"]);
            Process process = new Process();
            ModuleWorkFlow.Model.ProcessInfo pi = process.GetProcessInfoById(drp_processlist.SelectedValue);
            if (txt.IndexOf("A-") == -1 && txt.IndexOf("B-") == -1 && txt.IndexOf("D-") == -1 && txt.IndexOf("M-") == -1 && txt.IndexOf("-") > -1)
            {
                Label_Message.Text = Lang.TXT_SCANBARCODE2_BarcodeContentError + "[" + txt_partCount.Text + "]";
                return;
            }
            string command = "B";
            string content = txt;
            if (txt.IndexOf("A-") != -1 || txt.IndexOf("M-") != -1 || txt.IndexOf("D-") != -1 || txt.IndexOf("B-") != -1)
            {
                command = txt.Substring(0, txt.IndexOf("-"));
                content = txt.Substring(txt.IndexOf("-") + 1, txt.Length - txt.IndexOf("-") - 1);

                bool isexist = false;
                int index = -1;
                for (int i = 0; i < PTSetting.BARCODE_CODE.Length; i++)
                {
                    if (PTSetting.BARCODE_CODE[i].Equals(command))
                    {
                        isexist = true;
                        index = i;
                    }
                }
                if (isexist == false)
                {
                    Label_Message.Text = Lang.TXT_SCANBARCODE2_BarcodeContentError + "[" + txt + "]";
                    return;
                }


                switch (PTSetting.BARCODE_COMMAND[index])
                {
                    case "USERNO":
                        if (needUserName)
                        {
                            Label_Message.Text = selectUserNo(content);
                        }


                        break;
                    case "MODULEPART":
                        //MYD070308
                        if (lab_actionvalue.Text.Equals(""))
                        {
                            Label_Message.Text = Lang.TXT_SCANBARCODE2_BarcodeContentError101;
                            return;
                        }

                        if ((lab_hiddenActionId.Text.Equals("ZANTING") || lab_hiddenActionId.Text.Equals("JIESHU")) && !lab_hiddenActionId.Text.Equals("") && pi.NeedSchedule == 1)
                        {
                            Label_Message.Text = Lang.TXT_SCANBARCODE2_PARTALREADYINPUT;
                            return;
                        }

                        Label_Message.Text = selectPart(content, pi);
                        break;

                    case "MACHINE":
                        //MYD070308
                        if (drp_processlist.SelectedValue.Equals(""))
                        {
                            Label_Message.Text = "請先選擇工序";
                            return;
                        }


                        if (!needMachine || lab_hiddenActionId.Text.Equals("JIEDAN") || lab_hiddenActionId.Text.Equals("XIAODAN"))
                        {
                            Label_Message.Text = Lang.NO_NEED_MACHINE;
                            return;
                        }


                        if (lab_hiddenActionId.Text.Equals(""))
                        {
                            Label_Message.Text = "請先輸入動作";
                            return;
                        }

                        Label_Message.Text = selectMachine(content);

                        if (Label_Message.Text.Equals(""))
                        {
                            drp_processlist.Enabled = false;
                            lab_machine_value.Text = content;
                            lab_hidden_machine.Text = content;
                        }


                        break;

                    case "ACTION":
                        Session["hprocessno"] = null;
                        Label_Message.Text = selectAction(content);
                        ModuleWorkFlow.Model.ProcessInfo processInfo = new ModuleWorkFlow.BLL.Process().GetProcessInfoById(drp_processlist.SelectedValue);
                        if (content.Equals("JIEDAN") || content.Equals("XIAODAN") || processInfo.NeedSchedule == 0)
                        {
                            chk_combine.Checked = false;
                            chk_combine.Enabled = false;
                        }
                        if (content.Equals("JIESHU") && !drp_processlist.SelectedValue.Equals(""))
                        {
                            //ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
                            if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                            {
                                chk_passed.Visible = true;
                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = true;

                            }
                            else
                            {
                                chk_passed.Visible = false;
                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                            }
                        }
                        else
                        {
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                            chk_passed.Visible = false;
                        }

                        if (content.Equals("ZANTING"))
                        {
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = true;
                        }
                        else
                        {
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = false;
                        }
                        break;
                }
            }
        }

        private int getDoingPart(string machineId)
        {
            int doingProductNumber = -1;
            Schedule schedule = new Schedule();

            doingProductNumber = schedule.GetScheduleByDoProductNo(drp_processlist.SelectedValue, machineId);
            return doingProductNumber;
        }

        private IList BindMainDatagrid(IList ilist, PartProcessInfo part)
        {
            ilist.Insert(0, part);
            return ilist;
        }

        private string selectPart(string content, ModuleWorkFlow.Model.ProcessInfo processInfo)
        {
            string errmsg = "";
            try
            {
                IList source = new ArrayList();
                if (Session["hstatus"] == null)
                {
                    Session["hstatus"] = new Status().getKeyStatusInfo();
                }
                hprocessno = (Utility.NoSortHashTable)Session["hprocessno"];
                if (hprocessno == null)
                {
                    hprocessno = new Utility.NoSortHashTable();
                }
                int beforecount = hprocessno.Count;

                PartInfo pi = null;
                int Ineligibility = 0;
                int Eligibility = 0;
                if (chk_passed.Checked)
                {
                    Ineligibility = 0;
                    Eligibility = 1;
                }
                else
                {
                    Ineligibility = 1;
                    Eligibility = 0;
                }
                if (Utility.tools.IsNumeric(content))
                {
                    int partid = Convert.ToInt32(content);
                    pi = new Part().GetPartInfoById(partid);

                    //  errmsg = scanbar.selectModulePart(pi, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility);
                    errmsg = scanbar.selectModulePart(pi, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility, Convert.ToInt64(lab_combineStamp.Text.Trim()));
                }
                else
                {
                    if (content.IndexOf("-") > -1)
                    {
                        string[] modulparts = content.Split('-');
                        if (modulparts.Length > 1)
                        {
                            string ppartno = modulparts[modulparts.Length - 1];
                            string pmoduleid = modulparts[0];
                            for (int i = 1; i < modulparts.Length - 1; i++)
                            {
                                pmoduleid = pmoduleid + "-" + modulparts[i];
                            }
                            pi = new Part().getPartInfo(pmoduleid, ppartno);
                        }
                    }
                    else
                    {
                        pi = new Part().GetPartInfoByQRCode(content);
                    }
                    //errmsg = scanbar.selectModulePart(pi, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility);
                    errmsg = scanbar.selectModulePart(pi, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility, Convert.ToInt64(lab_combineStamp.Text.Trim()));
                }





                bool neverMade = true;
                long combineTimeStame = 0;
                foreach (System.Collections.DictionaryEntry objDE in hprocessno)
                {
                    neverMade = neverMade && ((PartProcessInfo)objDE.Value).FactStartDate.Ticks == 0;
                    if (combineTimeStame == 0)
                    {
                        combineTimeStame = ((PartProcessInfo)objDE.Value).CombineTimeStamp;
                    }
                    source.Add((PartProcessInfo)objDE.Value);
                }
                if (source.Count > 1 && (neverMade || combineTimeStame == 0) && chk_combine.Enabled)
                {
                    chk_combine.Checked = true;
                }

                if (combineTimeStame != 0)
                {
                    chk_combine.Checked = true;

                }
                lab_combineStamp.Text = combineTimeStame.ToString().Trim();


                if (lab_hiddenActionId.Text.Equals("ZANTING"))
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = true;
                }
                else
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = false;
                }

                MainDatagrid.DataSource = source;
                MainDatagrid.DataBind();
                Session["hprocessno"] = hprocessno;
                drp_processlist.Enabled = false;
            }
            catch (Exception e)
            {
                Log.WriteLog("log.txt", e.ToString());
                errmsg = Lang.NUMBER_INPUT;
            }

            return errmsg;

        }

        private string selectUserNo(string content)
        {
            string msg = "";

            ModuleWorkFlow.BLL.User u = new ModuleWorkFlow.BLL.User();


            UserInfo ui = u.getUserInfo(content);
            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
            if (ui != null)
            {
                if (checkRoleProcess(content))
                {

                    WorktimeInfo wi = new Worktime().GetWorkTimeInfoByWorkDate(DateTime.Now, ui.UserName);
                    if (wi != null)
                    {
                        lab_hiddenWorkHours.Text = Convert.ToString(wi.Nomalhours + wi.Overhours - wi.Leavehours);

                    }
                    else
                    {
                        lab_hiddenWorkHours.Text = Convert.ToString(ui.WorkHours);

                    }

                    if (pi.IsMultiOperation == 1)
                    {
                        string userno = "";
                        string username = "";
                        if (!lab_user_value.Text.Trim().Equals(""))
                        {
                            userno = lab_user_value.Text + "," + ui.UserName;
                            username = lab_username.Text + "," + ui.Name;
                        }
                        else
                        {
                            userno = ui.UserName;
                            username = ui.Name;
                        }
                        if (this.hasDuplicateUserNo(userno.Trim()))
                        {
                            msg = "用戶不可重複且必須存在";
                        }
                        else
                        {
                            lab_user_value.Text = userno;
                            lab_username.Text = username;
                        }
                    }
                    else
                    {
                        lab_user_value.Text = ui.UserName;
                        lab_username.Text = ui.Name;
                    }


                }
                else
                {
                    msg = "您無此權限";
                }
            }
            else
            {
                msg = content + Lang.TXT_SCANBARCODE2_BarcodeContentError14;
            }

            return msg;
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

        public bool checkRoleProcess(string userno)
        {
            BRoleProcess rp = new BRoleProcess();
            return rp.checkRoleProcess(userno, drp_processlist.SelectedValue);
        }






        private string getMachineId(int processno)
        {
            string machineid = "";


            IList schedules = new Schedule().GetDoingMachine(processno, drp_processlist.SelectedValue);
            if (schedules.Count > 0)
            {
                machineid = ((ScheduleInfo)schedules[0]).MachinId;
            }



            return machineid;


        }



        private string selectAction(string content)
        {
            string msg = "";
            int index = -1;
            for (int i = 0; i < PTSetting.ACTIONBARCODE.Length; i++)
            {
                if (PTSetting.ACTIONBARCODE[i].Equals(content))
                {
                    index = i;
                }
            }
            if (MainDatagrid.Items.Count > 0)
            {
                msg = "已經選擇了零件,不能更換操作，請先清空";
                return msg;
            }

            Process process = new Process();
            ModuleWorkFlow.Model.ProcessInfo processinfo = process.GetProcessInfoById(drp_processlist.SelectedValue);
            if (index != -1)
            {
                lab_actionvalue.Text = PTSetting.ACTIONNAME[index];
                lab_hiddenActionId.Text = PTSetting.ACTIONBARCODE[index];




                if (lab_hiddenActionId.Text.Equals("JIEDAN"))
                {

                    if (processinfo.StartDirectly && !processinfo.FinishedDirectly)
                    {
                        lab_actionvalue.Text = "";
                        lab_hiddenActionId.Text = "";
                        msg = "此道工序不需要接單";
                        return msg;
                    }
                }

                if (lab_hiddenActionId.Text.Equals("XIAODAN"))
                {

                    if (processinfo.EndDirectly)
                    {
                        lab_actionvalue.Text = "";
                        lab_hiddenActionId.Text = "";
                        msg = "此道工序不需要消單";
                        return msg;
                    }
                }



                if (lab_hiddenActionId.Text.Equals("ZANTING"))
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = true;


                }
                else
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = false;
                }



                if (!lab_machine_value.Text.Trim().Equals("") && processinfo.NeedSchedule == 1)
                {
                    if (lab_hiddenActionId.Text.Equals("ZANTING") || lab_hiddenActionId.Text.Equals("JIESHU"))
                    {
                        IList source = new ArrayList();
                        hprocessno = new Utility.NoSortHashTable();
                        msg = scanbar.selectMachine(lab_machine_value.Text, drp_processlist.SelectedValue, hprocessno);
                        if (!Label_Message.Text.Equals(""))
                        {
                            lab_actionvalue.Text = "";
                            lab_hiddenActionId.Text = "";
                            return msg;
                        }

                        Session["hprocessno"] = hprocessno;
                        foreach (System.Collections.DictionaryEntry objDE in hprocessno)
                        {
                            source.Add((PartProcessInfo)objDE.Value);
                        }




                        MainDatagrid.DataSource = source;
                        MainDatagrid.DataBind();
                        drp_processlist.Enabled = false;

                    }
                    else
                    {
                        Label_Message.Text = scanbar.selectMachine(lab_machine_value.Text, drp_processlist.SelectedValue);
                        if (Label_Message.Text.Equals(""))
                        {
                            Schedule schedule = new Schedule();
                            IList schedules = schedule.GetDoingMachine(-1, drp_processlist.SelectedValue, content);
                            IList updateSchedule = new ArrayList();
                            foreach (ScheduleInfo si in schedules)
                            {
                                PartProcessInfo ppi = new PartProcess().getPartProcessInfo(si.ProcessNo);

                                if (ppi == null || (ppi.FactEndDate.Ticks == 0 && !ppi.StatusId.Equals("Holdon")))
                                {
                                    ppi = new PartProcess().getPartProcessInfo(si.ProcessNo);
                                    if (ppi == null || (ppi.FactEndDate.Ticks == 0 && !ppi.StatusId.Equals("Holdon")))
                                    {
                                        ppi = null;
                                    }
                                }
                                if (ppi != null && (ppi.FactEndDate.Ticks > 0 || ppi.StatusId.Equals("Holdon")))
                                {
                                    if (ppi.FactEndDate.Ticks > 0)
                                    {
                                        si.Factusedendtime = ppi.FactEndDate;
                                    }
                                    else
                                    {
                                        si.Factusedendtime = ppi.MiddleStartDate;
                                    }
                                    si.EndUserNo = ppi.UserId;
                                    updateSchedule.Add(si);
                                }

                            }

                            IList source = new ArrayList();
                            source.Add(schedule.UpdateAllFactEnd(updateSchedule));
                            if (source.Count > 0)
                            {
                                schedule.SaveSchedule(source);
                            }

                            int doingProductNumber = getDoingPart(lab_machine_value.Text);
                            lab_doingProductNumber.Text = doingProductNumber.ToString();


                            if (!lab_doingProductNumber.Text.Equals("-1"))
                            {
                                //判斷是否有這個機台
                                msg = Lang.MACHINE_BUSY;
                                lab_actionvalue.Text = "";
                                lab_hiddenActionId.Text = "";
                                return msg;
                            }
                        }
                    }
                }


            }
            else
            {
                msg = Lang.TXT_SCANBARCODE2_BarcodeContentError + "[" + content + "]";
            }
            return msg;
        }

        private string selectMachine(string content)
        {
            string msg = "";

            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
            if (pi != null && pi.NeedSchedule == 1)
            {


                //這個機體存在
                Machine machine = new Machine();
                if (machine.GetMachineListByMachineId(pi.ProcessId, content).Count == 0)
                {
                    msg = Lang.NO_MACHINE_EXIST;
                }

            }
            else
            {
                msg = Lang.NO_NEED_MACHINE;
            }

            if (lab_hiddenActionId.Text.Equals("ZANTING"))
            {
                MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = true;
            }
            else
            {
                MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = false;
            }

            if (lab_hiddenActionId.Text.Equals(""))
            {
                if (lab_doingProductNumber.Text.Equals(""))
                {
                    int doingProductNumber = getDoingPart(content);
                    lab_doingProductNumber.Text = doingProductNumber.ToString();
                }

                if (lab_doingProductNumber.Text.Equals("-1"))
                {
                    lab_actionvalue.Text = PTSetting.ACTIONNAME[0];
                    lab_hiddenActionId.Text = PTSetting.ACTIONBARCODE[0];
                }

            }

            if (!lab_hiddenActionId.Text.Equals(""))
            {
                if (lab_hiddenActionId.Text.Equals("ZANTING") || lab_hiddenActionId.Text.Equals("JIESHU"))
                {
                    hprocessno = (Utility.NoSortHashTable)Session["hprocessno"];
                    hprocessno = new Utility.NoSortHashTable();

                    IList source = new ArrayList();
                    msg = scanbar.selectMachine(content, drp_processlist.SelectedValue, hprocessno);
                    if (!Label_Message.Text.Equals(""))
                        return msg;

                    Session["hprocessno"] = hprocessno;
                    foreach (System.Collections.DictionaryEntry objDE in hprocessno)
                    {
                        //if (pi.EndDirectly && lab_hiddenActionId.Text.Equals("JIESHU"))
                        //{
                        //    PartProcessInfo ppi = (PartProcessInfo)objDE.Value;


                        //    PartProcessInfo nextppi = partprocess.getNextPartProcessInfo(ppi.ModuleId, ppi.PartNo_Id, ppi.ProcessOrder);
                        //    if (nextppi != null)
                        //    {
                        //        ppi.NextProcess = nextppi.ProcessName;
                        //    }



                        //}

                        PartProcessInfo ppi = (PartProcessInfo)objDE.Value;
                        if (ppi.CombineTimeStamp == 0)
                        {
                            chk_combine.Checked = false;
                        }
                        else
                        {
                            chk_combine.Checked = true;
                            lab_combineStamp.Text = ppi.CombineTimeStamp.ToString();
                        }

                        PartProcessInfo nextppi = partprocess.getNextPartProcessInfo(ppi.ModuleId, ppi.PartNo_Id, ppi.ProcessOrder);
                        if (nextppi != null)
                        {
                            ppi.NextProcess = nextppi.ProcessName;
                        }
                        source.Add((PartProcessInfo)objDE.Value);
                    }

                    if (source.Count == 0)
                    {
                        msg = Lang.MACHINE_EMPTY;
                        return msg;
                    }
                    chk_combine.Enabled = false;
                    MainDatagrid.DataSource = source;
                    MainDatagrid.DataBind();
                    drp_processlist.Enabled = false;

                }
                else
                {
                    Label_Message.Text = scanbar.selectMachine(content, drp_processlist.SelectedValue);
                    if (Label_Message.Text.Equals(""))
                    {
                        Schedule schedule = new Schedule();
                        IList schedules = schedule.GetDoingMachine(-1, drp_processlist.SelectedValue, content);
                        IList updateSchedule = new ArrayList();
                        foreach (ScheduleInfo si in schedules)
                        {
                            PartProcessInfo ppi = new PartProcess().getPartProcessInfo(si.ProcessNo);

                            if (ppi == null || (ppi.FactEndDate.Ticks == 0 && !ppi.StatusId.Equals("Holdon")))
                            {
                                ppi = new PartProcess().getPartProcessInfo(si.ProcessNo);
                                if (ppi == null || (ppi.FactEndDate.Ticks == 0 && !ppi.StatusId.Equals("Holdon")))
                                {
                                    ppi = null;
                                }
                            }
                            if (ppi != null && (ppi.FactEndDate.Ticks > 0 || ppi.StatusId.Equals("Holdon")))
                            {
                                if (ppi.FactEndDate.Ticks > 0)
                                {
                                    si.Factusedendtime = ppi.FactEndDate;
                                }
                                else
                                {
                                    si.Factusedendtime = ppi.MiddleStartDate;
                                }
                                si.EndUserNo = ppi.UserId;
                                updateSchedule.Add(si);
                            }

                        }

                        IList source = new ArrayList();
                        source.Add(schedule.UpdateAllFactEnd(updateSchedule));
                        if (source.Count > 0)
                        {
                            schedule.SaveSchedule(source);
                        }


                        int doingProductNumber = getDoingPart(content);
                        lab_doingProductNumber.Text = doingProductNumber.ToString();


                        if (!lab_doingProductNumber.Text.Equals("-1"))
                        {
                            //判斷是否有這個機台
                            msg = Lang.MACHINE_BUSY;
                            return msg;
                        }
                    }
                }
            }

            return msg;

        }


        private bool checkMachineInput(string content)
        {
            bool ret = false;
            string userno = lab_user_value.Text;
            string machine = lab_machine_value.Text;
            string actionid = lab_actionvalue.Text;


            if (!userno.Equals("") && !machine.Equals("") && !actionid.Equals(""))
            {
                ret = true;

            }
            else
            {
                Label_Message.Text = "先輸入機台，用戶，操作";
            }
            return ret;
        }

        private void updateLog(PartProcessInfo ppi)
        {
            string processname = Methods.TranslateProcessName(ppi.ProcessId, new Process(), new ProcessCustomer());
            string actionname = lab_actionvalue.Text;
            LogBarCodeInfo lbci = new LogBarCodeInfo();
            lbci.ProcessNo = ppi.ProcessNo;
            lbci.UserNo = ppi.UserId;
            lbci.UserName = ppi.UserName;
            lbci.ModuleId = ppi.ModuleId;
            lbci.PartnoId = ppi.PartNo_Id;
            lbci.ProcessId = ppi.ProcessId;
            lbci.ProcessName = drp_processlist.SelectedItem.Text;
            lbci.ActionId = lab_hiddenActionId.Text;
            lbci.ActionName = actionname;

            LogBarCode lbc = new LogBarCode();
            lbc.insertLogBarCode(lbci);

        }



        private void clearMsg()
        {
            ModuleWorkFlow.BLL.Process p = new ModuleWorkFlow.BLL.Process();
            if (p.GetProcessInfoById(drp_processlist.SelectedValue).NeedSchedule == 1)
            {
                Machine machine = new Machine();
                IList source = machine.getMachineIdByIPAddressAndProcessid(lab_machine_ipaddress.Text, drp_processlist.SelectedValue);
                if (source.Count > 0)
                {
                    lab_machine_value.Text = (source[0] as MachineInfo).Id;
                    lab_hidden_machine.Text = (source[0] as MachineInfo).Id;


                    int doingProductNumber = getDoingPart(lab_machine_value.Text);

                    lab_doingProductNumber.Text = doingProductNumber.ToString();

                    if (doingProductNumber == -1)
                    {
                        lab_actionvalue.Text = PTSetting.ACTIONNAME[0];
                        lab_hiddenActionId.Text = PTSetting.ACTIONBARCODE[0];
                    }
                }
                else
                {
                    lab_machine_value.Text = "";
                    lab_hidden_machine.Text = "";
                    //lab_machine_ipaddress.Text = "";
                    lab_doingProductNumber.Text = "";
                }
            }
            else
            {
                lab_machine_value.Text = "";
                lab_hidden_machine.Text = "";
                //lab_machine_ipaddress.Text = "";
                lab_doingProductNumber.Text = "";
            }

            lab_actionvalue.Text = "";
            lab_hiddenActionId.Text = "";
            lab_parnohidden.Text = "";
            drp_processlist.Enabled = true;
            Session["hprocessno"] = null;
            lab_user_value.Text = "";
            lab_username.Text = "";

            chk_passed.Checked = true;
            chk_combine.Checked = false;
            chk_combine.Enabled = true;
            lab_combineStamp.Text = "0";

        }

        private void btn_submit_Click(object sender, System.EventArgs e)
        {
            bool needMachine = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["needMachine"]);
            hprocessno = (Utility.NoSortHashTable)Session["hprocessno"];
            if (hprocessno == null)
            {
                Label_Message.Text = "超時，請重新刷條碼";
                return;
            }
            string actionid = lab_hiddenActionId.Text;
            string userno = lab_user_value.Text;
            string username = lab_username.Text;

            Process process = new Process();
            ModuleWorkFlow.Model.ProcessInfo pi = process.GetProcessInfoById(drp_processlist.SelectedValue);

            if (actionid.Equals("") || userno.Equals("") || (pi.NeedSchedule == 1 && needMachine && lab_machine_value.Text.Trim().Equals("") && !actionid.Equals("JIEDAN") && !actionid.Equals("XIAODAN")))
            {
                Label_Message.Text = "請輸入用戶名，動作及機台";
                return;
            }

            DateTime scanTime = DateTime.Now;
            Schedule schedule = new Schedule();

            int doingProductNumber = -1;
            IList machines = new ArrayList();
            if (pi.NeedSchedule == 1 && needMachine)
            {
                doingProductNumber = schedule.GetScheduleByDoProductNo(drp_processlist.SelectedValue, lab_machine_value.Text);
            }

            if (actionid.Equals("KAISHI") && doingProductNumber != -1 && pi.NeedSchedule == 1 && doingProductNumber > 0)
            {
                //判斷是否有這個機台
                Label_Message.Text = Lang.MACHINE_BUSY;
                return;
            }

            lab_parnohidden.Text = "";
            int count = 0;


            bool isCombine = chk_combine.Checked;
            for (int i = 0; i < MainDatagrid.Items.Count; i++)
            {
                CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                ModuleWorkFlow.BLL.PartProcess pp = new ModuleWorkFlow.BLL.PartProcess();
                ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour ppddw = new ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour();

                bool isSelect = CheckBox_Select.Checked;
                if ((actionid.Equals("ZANTING") || actionid.Equals("JIESHU")) && (System.Configuration.ConfigurationSettings.AppSettings["BatchFinished"] == null && !Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["BatchFinished"])))
                {
                    isSelect = true;
                }
                if (isSelect)
                {
                    Label dg_lab_FactStartTime = MainDatagrid.Items[i].FindControl("dg_lab_FactStartTime") as Label;
                    Label lab_processno = MainDatagrid.Items[i].FindControl("dg_lab_processno") as Label;
                    //判斷合併是否正確
                    if (!dg_lab_FactStartTime.Text.Equals(""))
                    {

                        int processno = Convert.ToInt32(lab_processno.Text);
                        PartProcessInfo ppi = new PartProcessInfo();
                        if (processno != 0)
                        {
                            ppi = (PartProcessInfo)hprocessno[processno];
                        }
                        else
                        {
                            Label lab_moduleid = MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label;
                            ppi = (PartProcessInfo)hprocessno[lab_moduleid.Text + "-" + "999"];
                        }
                        Label dg_lab_combineTimeStame = MainDatagrid.Items[i].FindControl("dg_lab_combineTimeStame") as Label;

                        if (dg_lab_combineTimeStame.Text.Trim().Equals("0") && isCombine)
                        {
                            Label_Message.Text = ppi.PartNo_Id + "無法合併加工";
                            return;
                        }

                        if (!dg_lab_combineTimeStame.Text.Trim().Equals("0") && !isCombine)
                        {
                            Label_Message.Text = ppi.PartNo_Id + "必須合併加工";
                            return;
                        }
                    }

                    lab_parnohidden.Text += lab_processno.Text + ",";
                    count++;
                }
            }

            if (count > 500)
            {
                Label_Message.Text = "無法刷超出500個小零件，請重新輸入";
                return;
            }

            IList source = new ArrayList();
            IList partProcessHolds = new ArrayList();
            IList partFinishedSource = new ArrayList();
            IList partStartSource = new ArrayList();
            IList partFinishedProcessHolds = new ArrayList();
            for (int i = 0; i < MainDatagrid.Items.Count; i++)
            {
                CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                ModuleWorkFlow.BLL.PartProcess pp = new ModuleWorkFlow.BLL.PartProcess();
                ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour ppddw = new ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour();

                bool isSelect = CheckBox_Select.Checked;
                if (actionid.Equals("JIESHU") || actionid.Equals("ZANTING"))
                {
                    Label lab_processno = MainDatagrid.Items[i].FindControl("dg_lab_processno") as Label;
                    int processno = Convert.ToInt32(lab_processno.Text);
                    PartProcessInfo ppi = new PartProcessInfo();
                    if (processno != 0)
                    {
                        ppi = (PartProcessInfo)hprocessno[processno];
                    }
                    else
                    {
                        Label lab_moduleid = MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label;
                        ppi = (PartProcessInfo)hprocessno[lab_moduleid.Text + "-" + "999"];
                    }


                    ppi.MachineId = lab_machine_value.Text;
                    ppi.DesignateMachineId = lab_machine_value.Text;
                    ppi.UserId = userno;
                    ppi.UserName = username;


                    PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                    partProcessHoldInfo.ModuleId = ppi.ModuleId;
                    partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                    partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                    partProcessHoldInfo.Startdate = scanTime;
                    partProcessHoldInfo.Processno = ppi.ProcessNo;
                    partProcessHoldInfo.CombineTimeStamp = ppi.CombineTimeStamp;
                    partFinishedProcessHolds.Add(partProcessHoldInfo);



                    if (!isSelect && (System.Configuration.ConfigurationSettings.AppSettings["BatchFinished"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["BatchFinished"])))
                    {
                        partStartSource.Add(ppi);
                    }
                    else
                    {
                        partFinishedSource.Add(ppi);
                    }
                    isSelect = true;
                }




                if (isSelect)
                {
                    Label lab_processno = MainDatagrid.Items[i].FindControl("dg_lab_processno") as Label;
                    int processno = Convert.ToInt32(lab_processno.Text);
                    PartProcessInfo ppi = new PartProcessInfo();
                    if (processno != 0)
                    {
                        ppi = (PartProcessInfo)hprocessno[processno];
                    }
                    else
                    {
                        Label lab_moduleid = MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label;
                        ppi = (PartProcessInfo)hprocessno[lab_moduleid.Text + "-" + "999"];
                    }


                    ppi.MachineId = lab_machine_value.Text;
                    ppi.DesignateMachineId = lab_machine_value.Text;
                    ppi.UserId = userno;
                    ppi.UserName = username;

                    if ((actionid.Equals("ZANTING") || actionid.Equals("JIESHU")) && pi.NeedSchedule == 1 && needMachine && i == 0)
                    {
                        bool notDoing = false;

                        if (ppi.PartNo.Equals("999"))
                        {
                            if (schedule.machineIsDoing(drp_processlist.SelectedValue, lab_machine_value.Text, ppi.ModuleId, ppi.PartNo_Id) == 0)
                                notDoing = true;
                        }
                        else
                        {
                            if (schedule.machineIsDoing(drp_processlist.SelectedValue, lab_machine_value.Text, ppi.ProcessNo) == 0)
                                notDoing = true;
                        }

                        if (notDoing)
                        {
                            Label_Message.Text = "模具[" + ppi.ModuleId + "]零件[" + ppi.PartNo_Id + "]" +
                                "工序[" + Methods.TranslateProcessName(ppi.ProcessId, new Process(), new ProcessCustomer()) + "]工序編號[" + ppi.ProcessOrder + "]狀態[" + Methods.TranslateStatusName(ppi.StatusId) + "]不可在此機臺生產,機臺空閑或不是此機臺加工";
                            return;
                        }
                        else
                        {
                            source.Add(ppi);
                        }
                    }
                    else
                    {
                        if (actionid.Equals("JIESHU") && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                        {
                            Label dg_lab_qcprocesslist = MainDatagrid.Items[i].FindControl("dg_lab_qcprocesslist") as Label;
                            ppi.ProcessList = dg_lab_qcprocesslist.Text;

                            Label dg_lab_qccustomerprocesslist = MainDatagrid.Items[i].FindControl("dg_lab_qccustomerprocesslist") as Label;
                            ppi.CustomerProcessList = dg_lab_qccustomerprocesslist.Text;

                            TextBox dg_lab_Eligibility = MainDatagrid.Items[i].FindControl("dg_lab_Eligibility") as TextBox;
                            if (!dg_lab_Eligibility.Text.Equals("1") && !dg_lab_Eligibility.Text.Equals("") && !dg_lab_Eligibility.Text.Equals("0"))
                            {
                                Label_Message.Text = "請輸入正確的合格數量";
                                return;
                            }
                            if (dg_lab_Eligibility.Text.Equals("1"))
                            {
                                ppi.Eligibility = 1;
                                ppi.Ineligibility = 0;
                            }
                            else
                            {
                                ppi.Eligibility = 0;
                                ppi.Ineligibility = 1;
                            }


                        }
                        source.Add(ppi);
                    }

                    if (actionid.Equals("KAISHI") && ppi.StatusId.Equals("Holdon"))
                    {
                        PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                        partProcessHoldInfo.ModuleId = ppi.ModuleId;
                        partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                        partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                        partProcessHoldInfo.Enddate = scanTime;
                        partProcessHolds.Add(partProcessHoldInfo);
                    }

                    if (actionid.Equals("ZANTING"))
                    {
                        TextBox txt_hold_comment = MainDatagrid.Items[i].FindControl("txt_hold_comment") as TextBox;
                        PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                        partProcessHoldInfo.ModuleId = ppi.ModuleId;
                        partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                        partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                        partProcessHoldInfo.Startdate = scanTime;
                        partProcessHoldInfo.Comment = txt_hold_comment.Text;
                        partProcessHoldInfo.CombineTimeStamp = ppi.CombineTimeStamp;
                        partProcessHoldInfo.Processno = ppi.ProcessNo;
                        partProcessHoldInfo.Status = "Holdon";
                        partProcessHolds.Add(partProcessHoldInfo);
                    }
                }
            }
            IList isource = new ArrayList();
            try
            {


                if (lab_hiddenWorkHours.Text.Equals(""))
                    lab_hiddenWorkHours.Text = "8";

                if (actionid.Equals("ZANTING") || actionid.Equals("JIESHU"))
                {
                    string retMsg = "";
                    if (source.Count > 0)
                    {
                        if (actionid.Equals("ZANTING"))
                        {
                            if (partStartSource.Count > 0)
                            {
                                (source as ArrayList).AddRange(partStartSource);
                                retMsg = scanbar.updatePartProcessInfo(source, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partFinishedProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), chk_combine.Checked, scanTime);
                                IList partStartHolds = new ArrayList();
                                foreach (PartProcessInfo ppi in partStartSource)
                                {
                                    ppi.StatusId = "Holdon";
                                    ppi.HoldOnCount++;
                                    PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                                    partProcessHoldInfo.ModuleId = ppi.ModuleId;
                                    partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                                    partProcessHoldInfo.CombineTimeStamp = ppi.CombineTimeStamp;
                                    partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                                    partProcessHoldInfo.Enddate = scanTime;
                                    partStartHolds.Add(partProcessHoldInfo);
                                }

                                if (retMsg.Equals(Lang.SAVE_SUCCESS))
                                {
                                    Label_Message.Text = scanbar.updatePartProcessInfo(partStartSource, "KAISHI", "開始", pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partStartHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), chk_combine.Checked, scanTime);
                                }
                                else
                                {
                                    Label_Message.Text = retMsg;
                                }
                            }
                            else
                            {
                                retMsg = scanbar.updatePartProcessInfo(source, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), chk_combine.Checked, scanTime);
                                Label_Message.Text = retMsg;
                            }




                        }
                        else
                        {
                            if (partStartSource.Count > 0 && source.Count > 0)
                            {
                                retMsg = scanbar.updatePartProcessInfo(source, "ZANTING", "暫停", pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partFinishedProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, chk_combine.Checked, scanTime);
                                if (retMsg.Equals(Lang.SAVE_SUCCESS))
                                {
                                    foreach (PartProcessInfo ppi in source)
                                    {
                                        ppi.StatusId = "Holdon";
                                        ppi.HoldOnCount++;
                                    }

                                    foreach (PartProcessHoldInfo pphi in partFinishedProcessHolds)
                                    {
                                        pphi.Enddate = scanTime;
                                    }

                                    retMsg = scanbar.updatePartProcessInfo(source, "KAISHI", "開始", pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partFinishedProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, chk_combine.Checked, scanTime);
                                    if (retMsg.Equals(Lang.SAVE_SUCCESS))
                                    {
                                        foreach (PartProcessInfo ppi in partFinishedSource)
                                        {
                                            ppi.StatusId = "Working";
                                            ppi.HoldOnCount++;
                                        }
                                        retMsg = scanbar.updatePartProcessInfo(partFinishedSource, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, chk_combine.Checked, scanTime);
                                    }

                                }
                            }
                            else
                            {
                                retMsg = scanbar.updatePartProcessInfo(source, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, chk_combine.Checked, scanTime);
                            }


                            Label_Message.Text = retMsg;

                        }
                    }
                }
                else
                {
                    Label_Message.Text = scanbar.updatePartProcessInfo(source, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, chk_combine.Checked, scanTime);
                }



            }
            catch (Exception ex)
            {

                MainDatagrid.DataSource = isource;
                MainDatagrid.DataBind();

                clearMsg();
                Label_Message.Text = ex.Message;
                return;
            }


            isource = new ArrayList();
            MainDatagrid.DataSource = isource;
            MainDatagrid.DataBind();
            clearMsg();

        }

        private void drp_processlist_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            processchange();
        }

        private void Button1_Click(object sender, System.EventArgs e)
        {
            //			ilist.Clear();
            IList isource = new ArrayList();
            MainDatagrid.DataSource = isource;
            MainDatagrid.DataBind();
            clearMsg();
        }



        private void MainDatagrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Header)
            {
                CheckBox allcheckbox = e.Item.FindControl("allcheckbox") as CheckBox;
                if (lab_hiddenActionId.Text.Equals("JIESHU") || lab_hiddenActionId.Text.Equals("ZANTING"))
                {
                    allcheckbox.Visible = true;
                    allcheckbox.Checked = true;

                }
                else
                {
                    allcheckbox.Visible = false;
                    allcheckbox.Visible = false;
                }
            }
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                e.Item.Cells[0].Text = Convert.ToString((e.Item.ItemIndex + 1));
                Label dg_lab_combineTimeStame = e.Item.FindControl("dg_lab_combineTimeStame") as Label;
                CheckBox CheckBox_Select = e.Item.FindControl("CheckBox_Select") as CheckBox;

                Label dg_lab_FactStartTime = e.Item.FindControl("dg_lab_FactStartTime") as Label;
                Label dg_lab_combineTime = e.Item.FindControl("dg_lab_combineTime") as Label;
                if ((!dg_lab_combineTimeStame.Text.Trim().Equals("") && !dg_lab_combineTimeStame.Text.Trim().Equals("0")))
                {
                    dg_lab_combineTime.Text = new DateTime(Convert.ToInt64(dg_lab_combineTimeStame.Text.Trim())).ToString("MM-dd HH:mm");


                }
                if (!dg_lab_FactStartTime.Text.Trim().Equals("") && Convert.ToDateTime(dg_lab_FactStartTime.Text.Trim()).Ticks > 0)
                {

                    CheckBox_Select.Enabled = false;
                    if (chk_combine.Checked)
                    {

                        if (dg_lab_combineTimeStame.Text.Trim().Equals("") || dg_lab_combineTimeStame.Text.Trim().Equals("0"))
                        {
                            CheckBox_Select.Checked = false;
                            CheckBox_Select.Enabled = false;
                        }
                        else
                        {
                            //if (lab_combineStamp.Text.Trim().Equals("0"))
                            //{
                            //    lab_combineStamp.Text = dg_lab_combineTimeStame.Text;
                            //}
                            if (dg_lab_combineTimeStame.Text.Trim().Equals(lab_combineStamp.Text.Trim()))
                            {
                                CheckBox_Select.Checked = true;
                            }
                            else
                            {
                                CheckBox_Select.Checked = false;
                            }
                            CheckBox_Select.Enabled = true;

                        }
                    }
                    else
                    {
                        if ((!dg_lab_combineTimeStame.Text.Trim().Equals("") && !dg_lab_combineTimeStame.Text.Trim().Equals("0")))
                        {
                            CheckBox_Select.Checked = false;
                            CheckBox_Select.Enabled = false;
                        }
                        else
                        {
                            CheckBox_Select.Checked = true;
                            CheckBox_Select.Enabled = true;
                        }

                    }
                }
                else
                {
                    if (!chk_combine.Checked || lab_combineStamp.Text.Equals("0"))
                        CheckBox_Select.Enabled = true;
                    else
                        CheckBox_Select.Checked = false;
                }


            }


        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            btn_submit_Click(sender, e);
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            Button1_Click(sender, e);
        }

        protected void txt_partCount_TextChanged(object sender, EventArgs e)
        {

        }

        protected void chk_combine_CheckedChanged(object sender, EventArgs e)
        {
            if (!chk_combine.Checked)
            {
                lab_combineStamp.Text = "0";
            }
            else
            {
                for (int i = 0; i < MainDatagrid.Items.Count; i++)
                {
                    Label dg_lab_combineTimeStame = MainDatagrid.Items[i].FindControl("dg_lab_combineTimeStame") as Label;
                    Label dg_lab_FactStartTime = MainDatagrid.Items[i].FindControl("dg_lab_FactStartTime") as Label;
                    if ((!dg_lab_combineTimeStame.Text.Trim().Equals("") && !dg_lab_combineTimeStame.Text.Trim().Equals("0")) || dg_lab_FactStartTime.Text.Trim().Equals(""))
                    {
                        if (dg_lab_FactStartTime.Text.Trim().Equals(""))
                        {
                            lab_combineStamp.Text = "0";
                        }
                        else
                        {
                            lab_combineStamp.Text = dg_lab_combineTimeStame.Text.Trim();
                        }
                        break;
                    }
                }

            }
            if (!lab_hiddenActionId.Text.Equals("JIEDAN") && !lab_hiddenActionId.Text.Equals("XIAODAN"))
            {
                for (int i = 0; i < MainDatagrid.Items.Count; i++)
                {
                    Label dg_lab_combineTimeStame = MainDatagrid.Items[i].FindControl("dg_lab_combineTimeStame") as Label;
                    CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;

                    Label dg_lab_FactStartTime = MainDatagrid.Items[i].FindControl("dg_lab_FactStartTime") as Label;

                    if (chk_combine.Checked)
                    {
                        if (!dg_lab_FactStartTime.Text.Trim().Equals("") && Convert.ToDateTime(dg_lab_FactStartTime.Text.Trim()).Ticks > 0)
                        {
                            if ((dg_lab_combineTimeStame.Text.Trim().Equals("") || dg_lab_combineTimeStame.Text.Trim().Equals("0")))
                            {
                                CheckBox_Select.Checked = false;
                                CheckBox_Select.Enabled = false;
                            }
                            else
                            {
                                CheckBox_Select.Enabled = true;
                                if (!dg_lab_combineTimeStame.Text.Trim().Equals(lab_combineStamp.Text.Trim()))
                                {
                                    CheckBox_Select.Checked = false;

                                }
                                else
                                {
                                    CheckBox_Select.Checked = true;
                                }
                            }
                        }
                        else //not start
                        {
                            if (lab_combineStamp.Text.Trim().Equals("0"))
                            {
                                CheckBox_Select.Checked = true;
                                CheckBox_Select.Enabled = true;
                            }
                            else
                            {
                                CheckBox_Select.Checked = false;
                                //CheckBox_Select.Enabled = false;
                            }
                        }
                    }
                    else // not combine
                    {
                        if (!dg_lab_combineTimeStame.Text.Trim().Equals("") && !dg_lab_combineTimeStame.Text.Trim().Equals("0"))
                        {
                            CheckBox_Select.Checked = false;
                            CheckBox_Select.Enabled = true;
                        }
                        else
                        {
                            CheckBox_Select.Checked = true;
                            CheckBox_Select.Enabled = true;
                        }
                    }
                }
            }
        }

        protected void CheckBox_Select_CheckedChanged(object sender, EventArgs e)
        {
            DataGridItem item = ((sender as CheckBox)).Parent.Parent as DataGridItem;
            Label dg_lab_combineTimeStame = item.FindControl("dg_lab_combineTimeStame") as Label;
            lab_combineStamp.Text = dg_lab_combineTimeStame.Text;
            CheckBox CheckBox_Select = item.FindControl("CheckBox_Select") as CheckBox;
            if (CheckBox_Select.Checked)
            {
                changCombineCheck(item);
            }
        }

        private void changCombineCheck(DataGridItem item)
        {
            if (!lab_hiddenActionId.Text.Equals("JIEDAN") && !lab_hiddenActionId.Text.Equals("XIAODAN") && !lab_hiddenActionId.Text.Equals("ZANTING") && !lab_hiddenActionId.Text.Equals("JIESHU"))
            {
                for (int i = 0; i < MainDatagrid.Items.Count; i++)
                {
                    Label dg_lab_combineTimeStame = MainDatagrid.Items[i].FindControl("dg_lab_combineTimeStame") as Label;
                    CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;

                    Label dg_lab_FactStartTime = MainDatagrid.Items[i].FindControl("dg_lab_FactStartTime") as Label;

                    if (chk_combine.Checked)
                    {
                        if (!dg_lab_FactStartTime.Text.Trim().Equals("") && Convert.ToDateTime(dg_lab_FactStartTime.Text.Trim()).Ticks > 0)
                        {
                            if ((dg_lab_combineTimeStame.Text.Trim().Equals("") || dg_lab_combineTimeStame.Text.Trim().Equals("0")))
                            {
                                CheckBox_Select.Checked = false;
                                CheckBox_Select.Enabled = false;
                            }
                            else
                            {
                                CheckBox_Select.Enabled = true;
                                if (!dg_lab_combineTimeStame.Text.Trim().Equals(lab_combineStamp.Text.Trim()))
                                {
                                    CheckBox_Select.Checked = false;

                                }
                                else
                                {
                                    if (!(i == item.ItemIndex && !CheckBox_Select.Checked))
                                    {
                                        CheckBox_Select.Checked = true;
                                    }

                                }
                            }
                        }
                        else //not start
                        {
                            if (lab_combineStamp.Text.Trim().Equals("0"))
                            {
                                //if (!(i == item.ItemIndex && !CheckBox_Select.Checked && lab_combineStamp.Text.Trim().Equals("0")))
                                //{
                                //    CheckBox_Select.Checked = true;
                                //}
                                CheckBox_Select.Enabled = true;
                            }
                            else
                            {
                                CheckBox_Select.Checked = false;
                                CheckBox_Select.Enabled = true;
                            }
                        }
                    }
                    else // not combine
                    {
                        if (!dg_lab_combineTimeStame.Text.Trim().Equals("") && !dg_lab_combineTimeStame.Text.Trim().Equals("0"))
                        {
                            CheckBox_Select.Checked = false;
                            CheckBox_Select.Enabled = false;
                        }

                    }
                }
            }
        }

        protected void chkall_onchanged(object sender, EventArgs e)
        {
            if (lab_hiddenActionId.Text.Equals("JIESHU") || lab_hiddenActionId.Text.Equals("ZANTING"))
            {
                CheckBox allcheckbox = (CheckBox)sender;
                for (int i = 0; i < MainDatagrid.Items.Count; i++)
                {
                    CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                    CheckBox_Select.Checked = allcheckbox.Checked;
                }
            }
        }
    }
}
