using ModuleWorkflow.OutSource.BLL.Interface;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.business;
using ModuleWorkFlow.IDAL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.Model.Outsource;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Utility;
using Utility;
using WorkFlow.Model.Standard;

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
        protected System.Web.UI.WebControls.Label lab_machine;
        protected System.Web.UI.WebControls.Label lab_machine_value;
        protected System.Web.UI.WebControls.Label lab_hidden_machine;
        protected Label lab_machine_ipaddress;
        protected Label lab_doingProductNumber;
        protected System.Web.UI.WebControls.Label lab_hiddennumvalue;
        protected System.Web.UI.WebControls.Button btn_submit;
        protected System.Web.UI.WebControls.Button Button1;
        protected System.Web.UI.WebControls.Label lab_username;
        protected IList ilist = new ArrayList();
        private Utility.NoSortHashTable hprocessno;
       
        protected CheckBox chk_combine;
        protected TextBox txt_combine_qrCode;
        protected TextBox txt_Ineligibility_qrCode;
        protected Label lab_Ineligibility_qrCode;
        private PartScanBar scanbar;

        protected string menuname = "";


        private void Page_Load(object sender, System.EventArgs e)
        {
            Response.Expires = 0;
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1);
            Response.AddHeader("pragma", "no-cache");
            Response.CacheControl = "no-cache";
            scanbar = new PartScanBar();

            string menuid = "F226";
            PartTmenu menu = new PartTmenu();
            PartTmenuInfo mi = menu.findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
            }

            if (!this.IsPostBack)
            {
                //權限控制
              
                Session["hprocessno"] = null;
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");
                ModuleWorkFlow.BLL.Process p = new ModuleWorkFlow.BLL.Process();

                hprocessno = new Utility.NoSortHashTable();
                BindProcess();
                HttpCookie cookie = Request.Cookies["COOKIEGROUPPROCESSID"];
                if (cookie != null)
                {
                    Utility.Methods.DropDownListChange(drp_processlist, cookie.Value);
                }

                if (p.GetProcessInfoById(drp_processlist.SelectedValue).NeedSchedule == 1)
                {
                    setMachine();
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
            ModuleWorkFlow.Model.ProcessInfo pi = new BLL.Process().GetProcessInfoById(drp_processlist.SelectedValue);
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

            BLL.Process process = new BLL.Process();
            ModuleWorkFlow.Model.ProcessInfo pi = process.GetProcessInfoById(drp_processlist.SelectedValue);
          


            if (lab_hiddenActionId.Text.Trim().Equals("JIESHU") && !drp_processlist.SelectedValue.Equals(""))
            {
                //ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
                if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = true;
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 3].Visible = true;
                    lab_Ineligibility_qrCode.Visible = true;
                    txt_Ineligibility_qrCode.Visible = true;

                }
                else
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 3].Visible = false;
                    lab_Ineligibility_qrCode.Visible = false;
                    txt_Ineligibility_qrCode.Visible = false;

                }
            }
            else
            {
                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
               
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
            ModuleWorkFlow.BLL.Process process = new BLL.Process();
            ModuleWorkFlow.BLL.PartPartProcess partprocess = new PartPartProcess();
            drp_processlist.DataSource = process.GetNoMachineProcessInfo().Cast<Model.ProcessInfo>().ToList().FindAll(m=>!m.PriceType.Equals("Assambly") && !m.PriceType.Equals("OUTSOURCE"));
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
            BLL.Process process = new BLL.Process();
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

                        Label_Message.Text = selectPart("M-" + content, pi);
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
                       
                        if (content.Equals("JIESHU") && !drp_processlist.SelectedValue.Equals(""))
                        {
                            //ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
                            if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                            {
                              
                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = true;
                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 3].Visible = true;

                            }
                            else
                            {
                             
                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 3].Visible = false;
                            }
                        }
                        else
                        {
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 3].Visible = false;

                        }

                        if (content.Equals("ZANTING"))
                        {
                            chk_combine.Checked = false;
                            chk_combine.Enabled = false;
                            txt_combine_qrCode.Text = "";
                            txt_combine_qrCode.BackColor = Color.LightGray;
                            txt_combine_qrCode.ReadOnly = true;
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = true;
                        }
                        else
                        {
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = false;
                            chk_combine.Enabled = true;
                            txt_combine_qrCode.BackColor = Color.White;
                            txt_combine_qrCode.ReadOnly = false;
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

        private IList BuildSplitHoldInfos(IEnumerable<PartPartProcessInfo> partProcessInfos, DateTime scanTime, string comment)
        {
            IList partProcessHolds = new ArrayList();
            foreach (PartPartProcessInfo ppi in partProcessInfos)
            {
                PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                partProcessHoldInfo.ModuleId = ppi.ModuleId;
                partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                partProcessHoldInfo.Startdate = scanTime;
                partProcessHoldInfo.Comment = comment;
                partProcessHoldInfo.CombineTimeStamp = ppi.CombineTimeStamp;
                partProcessHoldInfo.Processno = ppi.ProcessNo;
                partProcessHoldInfo.Status = "Holdon";
                partProcessHolds.Add(partProcessHoldInfo);
            }

            return partProcessHolds;
        }

        private IList BuildSplitStartInfos(IEnumerable<PartPartProcessInfo> partProcessInfos, DateTime scanTime)
        {
            IList partProcessHolds = new ArrayList();
            foreach (PartPartProcessInfo ppi in partProcessInfos)
            {
                PartProcessHoldInfo partProcessHoldInfo = new PartProcessHoldInfo();
                partProcessHoldInfo.ModuleId = ppi.ModuleId;
                partProcessHoldInfo.ProcessOrder = ppi.ProcessOrder;
                partProcessHoldInfo.PartNo_Id = ppi.PartNo_Id;
                partProcessHoldInfo.Enddate = scanTime;
                partProcessHolds.Add(partProcessHoldInfo);
            }

            return partProcessHolds;
        }

        private void MarkHoldon(IEnumerable<PartPartProcessInfo> partProcessInfos)
        {
            foreach (PartPartProcessInfo ppi in partProcessInfos)
            {
                ppi.StatusId = "Holdon";
                ppi.HoldOnCount++;
                ppi.OriginalPartPartProcessInfos = null;
            }
        }

        private void MarkWorking(IEnumerable<PartPartProcessInfo> partProcessInfos)
        {
            foreach (PartPartProcessInfo ppi in partProcessInfos)
            {
                ppi.StatusId = "Working";
                ppi.OriginalPartPartProcessInfos = null;
            }
        }

        private bool RequiresSplitBox(PartPartProcessInfo ppi)
        {
            return !string.IsNullOrEmpty(ppi.SplitQRCode)
                && !string.Equals(ppi.SplitQRCode, ppi.QRCode, StringComparison.OrdinalIgnoreCase);
        }

        private bool RequiresSplitActionHandling(string actionId)
        {
            return actionId.Equals("JIEDAN")
                || actionId.Equals("KAISHI")
                || actionId.Equals("XIAODAN")
                || actionId.Equals("JIESHU");
        }

        private bool GetAutoSplitEmptyBoxMode()
        {
            bool autoSplitEmptyBoxMode = false;
            bool.TryParse(Convert.ToString(System.Configuration.ConfigurationSettings.AppSettings["autoSplitEmptyBoxMode"]), out autoSplitEmptyBoxMode);
            return autoSplitEmptyBoxMode;
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
               

                string pmoduleid = "";
                string ppartno = "";
                List<string> ppartnos = new List<string>();
                if (content.Split('-').Length > 2)
                {
                    string[] modulparts = content.Split('-');
                    if (modulparts.Length > 1)
                    {

                        pmoduleid = modulparts[1];
                        ppartno = modulparts[2];
                        for (int i = 3; i < modulparts.Length; i++)
                        {
                            ppartno = ppartno + "-" + modulparts[i];
                        }
                        pi = new BLL.Part().getPartInfo(pmoduleid, ppartno);
                     
                        if (pi != null)
                        {
                            List<PartPartProcessInfo> partPartProcessInfos = new PartPartProcess().GetIListPartProcessAll(pi.ModuleId).FindAll(m => m.PartNo.Equals(pi.PartNo) && m.ProcessId.Equals(processInfo.ProcessId) && m.IsEmpty != 1);
                            if (lab_hiddenActionId.Text.Equals("KAISHI") || lab_hiddenActionId.Text.Equals("JIEDAN"))
                            {
                                partPartProcessInfos = partPartProcessInfos.FindAll(m => m.StatusId.Equals("Ready") || m.StatusId.Equals("Holdon") || m.StatusId.Equals("JIEDAN"));
                            }

                            if (lab_hiddenActionId.Text.Equals("ZANTING") || lab_hiddenActionId.Text.Equals("JIESHU"))
                            {
                                partPartProcessInfos = partPartProcessInfos.FindAll(m=>m.StatusId.Equals("Working"));
                            }

                            if (lab_hiddenActionId.Text.Equals("XIAODAN"))
                            {
                                partPartProcessInfos = partPartProcessInfos.FindAll(m => m.StatusId.Equals("Implementation"));
                            }

                            foreach (var ppi in partPartProcessInfos)
                            {
                                ppartnos.Add(ppi.PartNo_Id);
                            }
                        }
                    }
                }
                else
                {
                    QRCodeInfo qRCodeInfo = new QRCode().GetQRCodeByNo(content);
                    if (qRCodeInfo == null)
                    {
                        //Label_Message.Text = $"{content}不存在";
                        return $"{content}不存在"; ;
                    }
                    pmoduleid = qRCodeInfo.ModuleId;
                    ppartno = qRCodeInfo.PartNoId;
                    ppartnos.Add(ppartno);


                }
                //errmsg = scanbar.selectModulePart(pi, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility);
                PartOrderDesignInfo podi = new PartOrderDesign().GetOrderDesignByNo(pmoduleid);
                foreach (var appartno in ppartnos)
                {
                    errmsg = scanbar.selectModulePart(pmoduleid, appartno, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility, podi);
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
            ModuleWorkFlow.Model.ProcessInfo pi = new BLL.Process().GetProcessInfoById(drp_processlist.SelectedValue);
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

            BLL.Process process = new BLL.Process();
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
                                PartPartProcessInfo ppi = new PartPartProcess().getPartProcessInfo(si.ProcessNo);

                                if (ppi == null || (ppi.FactEndDate.Ticks == 0 && !ppi.StatusId.Equals("Holdon")))
                                {
                                    ppi = new PartPartProcess().getPartProcessInfo(si.ProcessNo);
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

            ModuleWorkFlow.Model.ProcessInfo pi = new BLL.Process().GetProcessInfoById(drp_processlist.SelectedValue);
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
                            PartProcessInfo ppi = new PartPartProcess().getPartProcessInfo(si.ProcessNo);

                            if (ppi == null || (ppi.FactEndDate.Ticks == 0 && !ppi.StatusId.Equals("Holdon")))
                            {
                                ppi = new PartPartProcess().getPartProcessInfo(si.ProcessNo);
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
            string processname = Utility.Methods.TranslateProcessName(ppi.ProcessId, new BLL.Process(), new ProcessCustomer());
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
            drp_processlist.Enabled = true;
            Session["hprocessno"] = null;
            lab_user_value.Text = "";
            lab_username.Text = "";
            chk_combine.Checked = false;
            txt_combine_qrCode.Text = "";

         

        }

        private void btn_submit_Click(object sender, System.EventArgs e)
        {
            bool canCombine = true;
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

            if (chk_combine.Checked && string.IsNullOrEmpty(txt_combine_qrCode.Text))
            {
                Label_Message.Text = "請填入合併條碼";
                return;
            }

            if (chk_combine.Checked && MainDatagrid.Items.Count == 1)
            {
                chk_combine.Checked = false;
                txt_combine_qrCode.Text = "";
            }

            BLL.Process process = new BLL.Process();
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

         
            int count = 0;


       
            List<PartPartProcessInfo> source = new List<PartPartProcessInfo>();
            IList partProcessHolds = new ArrayList();
            List<PartPartProcessInfo> partFinishedSource = new List<PartPartProcessInfo>();
            List<PartPartProcessInfo> partStartSource = new List<PartPartProcessInfo>();
            IList partFinishedProcessHolds = new ArrayList();
            ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
            ModuleWorkFlow.BLL.PartPartProcessDealDateTimeWorkHour ppddw = new ModuleWorkFlow.BLL.PartPartProcessDealDateTimeWorkHour();
            for (int i = 0; i < MainDatagrid.Items.Count; i++)
            {
                CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
             

                bool isSelect = CheckBox_Select.Checked;
                if (actionid.Equals("JIESHU") || actionid.Equals("ZANTING"))
                {
                    Label lab_processno = MainDatagrid.Items[i].FindControl("dg_lab_processno") as Label;
                    int processno = Convert.ToInt32(lab_processno.Text);
                    PartPartProcessInfo ppi = new PartPartProcessInfo();
                  
                     ppi = (PartPartProcessInfo)hprocessno[processno];
                   


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
                    //isSelect = true;
                }

                QRCode qRCode = new QRCode();   


                if (isSelect)
                {
                    Label lab_processno = MainDatagrid.Items[i].FindControl("dg_lab_processno") as Label;
                    int processno = Convert.ToInt32(lab_processno.Text);
                    PartPartProcessInfo ppi = new PartPartProcessInfo();
                 
                    ppi = (PartPartProcessInfo)hprocessno[processno];
                    
                  


                    ppi.MachineId = lab_machine_value.Text;
                    ppi.DesignateMachineId = lab_machine_value.Text;
                    ppi.UserId = userno;
                    ppi.UserName = username;

                 

                    TextBox txt_productNumber = MainDatagrid.Items[i].FindControl("txt_productNumber") as TextBox;
                    Label lab_productNumber = MainDatagrid.Items[i].FindControl("lab_productNumber") as Label;
                    TextBox dg_txt_QRCode = MainDatagrid.Items[i].FindControl("dg_txt_QRCode") as TextBox;
                    try
                    {
                        ppi.ScanCount = Convert.ToInt32(txt_productNumber.Text);
                        ppi.BoxCount = Convert.ToInt32(lab_productNumber.Text);
                        string splitQRCode = dg_txt_QRCode == null ? string.Empty : dg_txt_QRCode.Text.Trim();
                        string targetQRCode = string.IsNullOrWhiteSpace(splitQRCode) ? ppi.QRCode : splitQRCode;
                        ProcessBoxCodeRule processBoxCodeRule = new ProcessBoxCodeRule();
                        string boxCodeRuleMsg = processBoxCodeRule.checkBoxCodeRule(ppi.ProcessId, lab_hiddenActionId.Text, ppi.NeedProduct, targetQRCode);
                        if (!string.IsNullOrEmpty(boxCodeRuleMsg))
                        {
                            Label_Message.Text = boxCodeRuleMsg;
                            return;
                        }
                        if (ppi.ScanCount < ppi.BoxCount)
                        {
                            if (string.IsNullOrWhiteSpace(splitQRCode))
                            {
                                Label_Message.Text = $@"{(MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label).Text},{(MainDatagrid.Items[i].FindControl("dg_lab_partnoId") as Label).Text} 必須輸入分箱條碼";
                                return;
                            }

                            if (string.Equals(splitQRCode, ppi.QRCode, StringComparison.OrdinalIgnoreCase))
                            {
                                Label_Message.Text = $@"{ppi.ModuleId}:{ppi.PartNo}加工數量小於箱數時，分箱條碼不能與原條碼相同";
                                return;
                            }
                        }
                        bool requiresSplitBox = !string.IsNullOrEmpty(splitQRCode)
                            && !string.Equals(splitQRCode, ppi.QRCode, StringComparison.OrdinalIgnoreCase);
                        if (requiresSplitBox)
                        {
                            if (!splitQRCode.StartsWith(PTSetting.PART_CODE + "-", StringComparison.OrdinalIgnoreCase))
                            {
                                Label_Message.Text = $@"{ppi.ModuleId}:{ppi.PartNo}必須要綁定條碼,並且綁定條碼必須以M-開頭";
                                return;
                            }

                            QRCodeInfo qRCodeInfo = qRCode.GetQRCodeByNo(splitQRCode);
                            if (qRCodeInfo != null && !chk_combine.Checked)
                            {
                                Label_Message.Text = $@"{splitQRCode}已經綁定在{qRCodeInfo.ModuleId},{qRCodeInfo.PartNoId};";
                                return;
                            }

                            ppi.SplitQRCode = splitQRCode;
                        }
                        else
                        {
                            ppi.SplitQRCode = "";
                        }
                        if (ppi.ScanCount > Convert.ToInt32(lab_productNumber.Text))
                        {
                            Label_Message.Text = $@"{(MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label).Text},{(MainDatagrid.Items[i].FindControl("dg_lab_partnoId") as Label).Text}加工數量不能大於可加工{Convert.ToInt32(lab_productNumber.Text)}";
                            return;
                        }
                    }
                    catch
                    {
                        Label_Message.Text = $@"{(MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label).Text},{(MainDatagrid.Items[i].FindControl("dg_lab_partnoId") as Label).Text}加工數量必須為數字";
                        return;
                    }

                    if (!string.IsNullOrEmpty(pi.DealPartScan))
                    {
                        IPartScanBarEvent partScanBarEvent = DALFactory.PartScanBarEvent.Create(pi.DealPartScan);
                        Label_Message.Text = partScanBarEvent.beforeSaveEvent(ppi);
                        if (!string.IsNullOrEmpty(Label_Message.Text))
                        {
                            return;
                        }

                    }

                    if ((!string.IsNullOrEmpty(ppi.QRCode) && !ppi.QRCode.Equals(txt_combine_qrCode.Text.Trim())) && ppi.ScanCount == ppi.BoxCount && chk_combine.Checked)
                    {
                        ppi.IsEmpty = 1;
                    }

                    if ((actionid.Equals("ZANTING") || actionid.Equals("JIESHU")) && pi.NeedSchedule == 1 && needMachine && i == 0)
                    {
                        bool notDoing = false;

                      
                        
                        if (schedule.machineIsDoing(drp_processlist.SelectedValue, lab_machine_value.Text, ppi.ProcessNo) == 0)
                            notDoing = true;
                        

                        if (notDoing)
                        {
                            Label_Message.Text = "廠批[" + ppi.ModuleId + "]圖號[" + ppi.PartNo_Id + "]" +
                                "工序[" + Utility.Methods.TranslateProcessName(ppi.ProcessId, new BLL.Process(), new ProcessCustomer()) + "]工序編號[" + ppi.ProcessOrder + "]狀態[" + Utility.Methods.TranslateStatusName(ppi.StatusId) + "]不可在此機臺生產,機臺空閑或不是此機臺加工";
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
                            try
                            {
                                ppi.Eligibility = Convert.ToInt32(dg_lab_Eligibility.Text);
                            }
                            catch
                            {
                                Label_Message.Text = "合格數量請輸入正確數字";
                            }
                            if (ppi.Eligibility > ppi.ScanCount)
                            {
                                Label_Message.Text = "合格數量不允許大於檢測數量";
                                return;
                            }

                            ppi.Ineligibility = ppi.ScanCount - ppi.Eligibility;

                            if (ppi.Ineligibility >0)
                            {
                                TextBox dg_txt_IneligibilityQR = MainDatagrid.Items[i].FindControl("dg_txt_IneligibilityQR") as TextBox;
                                if (string.IsNullOrEmpty(dg_txt_IneligibilityQR.Text))
                                {
                                    Label_Message.Text = "有不合格數量必須填入不合格QRCode";
                                    return;
                                }
                                if (!dg_txt_IneligibilityQR.Text.Substring(0, 2).Equals(PTSetting.PART_CODE + "-"))
                                {
                                    Label_Message.Text = $@"{ppi.ModuleId}:{ppi.PartNo}不合格QRCode必須以M-開頭";
                                    return;
                                }

                                if (qRCode.GetQRCodeByNo(dg_txt_IneligibilityQR.Text) != null)
                                {
                                    Label_Message.Text = $"{dg_txt_IneligibilityQR.Text}已被使用";
                                    return;
                                }

                                ppi.IneligibilityQRCode = dg_txt_IneligibilityQR.Text;
                            }
                          

                            //ppi.FinishedCount = ppi.Eligibility;

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

            //end of for 
            BoxLog boxlog = new BoxLog();
            // 首道工序、狀態 Ready、ReadyCount 為 0 時先走裝箱（與外發頁 FirstProcessBoxing 一致），再進後續 QC/合併/scanbar
            if ((actionid.Equals("KAISHI") && pi.StartDirectly) || (actionid.Equals("JIEDAN")))
            {
                foreach (PartPartProcessInfo ppi in source)
                {
                    if (ppi.ProcessOrder == 1 && ppi.StatusId.Equals("Ready") && ppi.EachBatchCount == 0)
                    {
                        ArrayList ilist = new ArrayList();
                        string boxMsg = boxlog.FirstProcessBoxing(ppi, scanTime, schedule, ilist);
                        if (!string.IsNullOrEmpty(boxMsg))
                        {
                            Label_Message.Text = boxMsg;
                            return;
                        }
                    }
                }
            }
            if (pi.PriceType.Equals("QC") && actionid.Equals("JIESHU"))
            {
                var grouped = source.FindAll(m=>!string.IsNullOrEmpty(m.IneligibilityQRCode))
                      .GroupBy(item => item.IneligibilityQRCode)
                      .ToList();
                if (grouped.Count  < source.Count)
                {
                    foreach (var group in grouped)
                    {
                        List<PartPartProcessInfo> unormalpartPartProcessInfos = new List<PartPartProcessInfo>();
                        unormalpartPartProcessInfos.Add(source.FindLast(m =>!string.IsNullOrEmpty(m.IneligibilityQRCode) &&  m.IneligibilityQRCode.Equals(group.Key)));

                        foreach (var unormalppi in source.FindAll(m => m.IneligibilityQRCode.Equals(group.Key)))
                        {

                            if (unormalpartPartProcessInfos.IndexOf(unormalppi) < 0)
                            {
                               
                                unormalpartPartProcessInfos.Add(unormalppi);
                            }

                        }

                        var (combinemsg, combinCount) = boxlog.checkUnormalCanCombine(unormalpartPartProcessInfos, group.Key, actionid);
                        if (!combinemsg.Equals(""))
                        {
                            Label_Message.Text = combinemsg;
                            return;
                        }

                    }
                }

           
            }

             
          
 
            int totalCombineCount = 0;
         
            if (chk_combine.Checked)
            {
                var (combinemsg, combinCount) = boxlog.checkCanCombine(source, txt_combine_qrCode.Text.Trim(),actionid);
                if (!combinemsg.Equals(""))
                {
                    Label_Message.Text = combinemsg;
                    return;
                }
                else
                {
                    string searchText = txt_combine_qrCode.Text.Trim();
                    var combinList = source.FindAll(m => !m.QRCode.Equals(searchText));

                    int totalIneligibility = combinList.Sum(m => m.Ineligibility);
                    int totalEligibility = combinList.Sum(m => m.Eligibility);

                    totalCombineCount = combinCount;
                    source.FindAll(m => m.QRCode.Equals(searchText))[0].OriginalScanCount = source.FindAll(m => m.QRCode.Equals(txt_combine_qrCode.Text.Trim()))[0].ScanCount;
                    //source.FindAll(m => m.QRCode.Equals(searchText))[0].ScanCount += combinCount;
                    source.FindAll(m => m.QRCode.Equals(searchText))[0].Ineligibility += totalIneligibility;
                    source.FindAll(m => m.QRCode.Equals(searchText))[0].Eligibility += totalEligibility;


                }
            }

      

       



            IList isource = new ArrayList();
            try
            {


                if (lab_hiddenWorkHours.Text.Equals(""))
                    lab_hiddenWorkHours.Text = "8";

                List<PartPartProcessInfo> completedSource = source.Cast<PartPartProcessInfo>().ToList();
                bool requiresSplitActionHandling = RequiresSplitActionHandling(actionid);
                List<PartPartProcessInfo> splitActionSource = requiresSplitActionHandling
                    ? completedSource.FindAll(m => RequiresSplitBox(m))
                    : new List<PartPartProcessInfo>();
                List<PartPartProcessInfo> normalActionSource = requiresSplitActionHandling
                    ? completedSource.FindAll(m => !RequiresSplitBox(m))
                    : completedSource;

                if (actionid.Equals("ZANTING") || requiresSplitActionHandling)
                {
                    string retMsg = "";
                    if (source.Count > 0)
                    {
                        if (actionid.Equals("ZANTING"))
                        {
                         
                          
                                retMsg = scanbar.updatePartProcessInfo(source, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                                Label_Message.Text = retMsg;
                            



                        }
                        else
                        {
                            if (chk_combine.Checked)
                            {
                                retMsg = scanbar.updatePartProcessInfo(normalActionSource.FindAll(m => m.QRCode.Equals(txt_combine_qrCode.Text.Trim()) || m.IsEmpty == 1), actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                            }
                            else
                            {
                                if (normalActionSource.Count > 0)
                                {
                                    retMsg = scanbar.updatePartProcessInfo(normalActionSource, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                                }
                                else
                                {
                                    retMsg = Lang.SAVE_SUCCESS;
                                }
                            }

                            if (retMsg.Equals(Lang.SAVE_SUCCESS) && splitActionSource.Count > 0)
                            {
                                List<PartPartProcessInfo> splitFinishedSource = new List<PartPartProcessInfo>();
                                string splitActionNotes = string.Empty;
                                IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                                outsourceApplyDesigninfo.Creater = userno;
                                outsourceApplyDesigninfo.CreateDate = DateTime.Now;

                                foreach (PartPartProcessInfo splitSource in splitActionSource)
                                {
                                    var splitActionResult = boxlog.HandleSplitAction(splitSource, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), userno, GetAutoSplitEmptyBoxMode(), scanTime, new PartOutSourceDetail(), outsourceApplyDesigninfo);
                                    if (!splitActionResult.msg.Equals(Lang.SAVE_SUCCESS) || splitActionResult.splitppi == null)
                                    {
                                        retMsg = splitActionResult.msg;
                                        break;
                                    }

                                    if (!string.IsNullOrEmpty(splitActionResult.note))
                                    {
                                        splitActionNotes += splitActionResult.note;
                                    }

                                    splitFinishedSource.Add(splitActionResult.splitppi);
                                }

                                if (retMsg.Equals(Lang.SAVE_SUCCESS))
                                {
                                    completedSource = normalActionSource.Concat(splitFinishedSource).ToList();
                                    Label_Message.Text = retMsg + splitActionNotes;
                                }
                            }

                            if (string.IsNullOrEmpty(Label_Message.Text) || !retMsg.Equals(Lang.SAVE_SUCCESS))
                            {
                                Label_Message.Text = retMsg;
                            }
                        }
                    }
                }
                else
                {
                    if (chk_combine.Checked)
                    {
                        Label_Message.Text = scanbar.updatePartProcessInfo(source.FindAll(m => m.QRCode.Equals(txt_combine_qrCode.Text.Trim()) || m.IsEmpty == 1), actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                    }
                    else
                    {
                        Label_Message.Text = scanbar.updatePartProcessInfo(source, actionid, lab_actionvalue.Text, pi, Convert.ToDouble(lab_hiddenWorkHours.Text), 0, partProcessHolds, new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                    }

                }


                (string msg, List<PartPartProcessInfo> unNormalSource) unnormalResult = ("", new  List<PartPartProcessInfo>());
                if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                {

                    if (pi.PriceType.Equals("QC") && actionid.Equals("JIESHU"))
                    {

                        unnormalResult  = pp.UnNormalPartDeal(completedSource, scanTime,pi.FinishedDirectly || pi.EndDirectly); 
                      

                    }

                    IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                    outsourceApplyDesigninfo.Creater = userno;
                    outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                    if (chk_combine.Checked)
                    {
                        Label_Message.Text = boxlog.boxCombineOperation(completedSource, txt_combine_qrCode.Text.Trim(), totalCombineCount, actionid, scanTime, new PartOutSourceDetail(), outsourceApplyDesigninfo);
                    }
                 
                    foreach (PartPartProcessInfo ppi in completedSource)
                    {
                        if (ppi.QRCode.Equals(txt_combine_qrCode.Text) && chk_combine.Checked)
                        {
                            continue;
                        }
                        if (RequiresSplitActionHandling(actionid) && RequiresSplitBox(ppi))
                        {
                            continue;
                        }
                        Label_Message.Text = boxlog.boxOperation(ppi, actionid, ppi.SplitQRCode, scanTime, new PartOutSourceDetail(), outsourceApplyDesigninfo);
                    }
                    

                    if (unnormalResult.msg.Equals(Lang.SAVE_SUCCESS) && unnormalResult.unNormalSource.Count > 0 )
                    {
                        List<PartPartProcessInfo> unNormalSource = new List<PartPartProcessInfo>();
                        foreach (var unnormalppi in unnormalResult.unNormalSource)
                        {
                            PartPartProcessInfo unppi = pp.getPartProcessInfo(unnormalppi.ModuleId, unnormalppi.PartNo_Id, unnormalppi.ProcessOrder);
                            unppi.ScanCount = unppi.FinishedCount;
                            unppi.BoxCount = unppi.FinishedCount;
                            unppi.OriginalScanCount = unppi.FinishedCount;
                            unppi.QRCode = unnormalppi.QRCode;
                            unNormalSource.Add(unppi);
                        }
                        var grouped = unNormalSource.FindAll(m => !string.IsNullOrEmpty(m.QRCode))
                                             .GroupBy(item => item.QRCode)
                                             .ToList();

                        foreach (var group in grouped)
                        {
                            txt_Ineligibility_qrCode.Text = group.Key;
                            if (unNormalSource.FindAll(m => m.QRCode.Equals(group.Key)).Count == 1)
                            {
                                continue;
                            }
                            IOutsourceApplyDesignInfo ncoutsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                            ncoutsourceApplyDesigninfo.Creater = userno;
                            ncoutsourceApplyDesigninfo.CreateDate = DateTime.Now;
                            int combineCount = 0;
                            var unnormalCombines = unNormalSource.FindAll(m => m.QRCode.Equals(group.Key));
                            foreach (var unnormalppi in unnormalCombines)
                            {
                                if (!unnormalppi.Equals(unnormalCombines.Find(m => m.QRCode.Equals(group.Key))))
                                {
                                    unnormalppi.QRCode = "";
                                    combineCount += unnormalppi.ScanCount;
                                }
                            }
                            boxlog.boxCombineOperation(unnormalCombines, txt_Ineligibility_qrCode.Text.Trim(), combineCount, actionid, scanTime, new PartOutSourceDetail(), ncoutsourceApplyDesigninfo);
             
                        }

                       
                    }

                    if (!string.IsNullOrEmpty(pi.DealPartScan))
                    {
                        IPartScanBarEvent partScanBarEvent = DALFactory.PartScanBarEvent.Create(pi.DealPartScan);
                        Label_Message.Text = partScanBarEvent.afterSaveEvent(source);
                      
                    }

                }
              

                //if (Label_Message.Text.Equals(""))
                //    Label_Message.Text = Lang.SAVE_SUCCESS;
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
            ModuleWorkFlow.Model.ProcessInfo pi = new BLL.Process().GetProcessInfoById(drp_processlist.SelectedValue);
            if (e.Item.ItemType == ListItemType.Header)
            {
                CheckBox allcheckbox = e.Item.FindControl("checkall") as CheckBox;
                //if (lab_hiddenActionId.Text.Equals("JIESHU") || lab_hiddenActionId.Text.Equals("ZANTING"))
                //{
                //    allcheckbox.Visible = true;
                //    allcheckbox.Checked = true;

                //}
                //else
                //{
                //    allcheckbox.Visible = false;
                //    allcheckbox.Visible = false;
                //}
                // 获取表头中的 Label 控件
                Label lblHeaderCount = (Label)e.Item.FindControl("dg_header_Count");

                if (lab_hiddenActionId.Text.Equals("JIEDAN"))
                {
                    // 设置表头 Label 的文本
                    lblHeaderCount.Text = "接單數量";
                }

                if (lab_hiddenActionId.Text.Equals("KAISHI"))
                {
                    // 设置表头 Label 的文本
                    lblHeaderCount.Text = "開始數量";
                }

                if (lab_hiddenActionId.Text.Equals("ZANTING"))
                {
                    // 设置表头 Label 的文本
                    lblHeaderCount.Text = "暫停數量";
                }

                if (lab_hiddenActionId.Text.Equals("JIESHU"))
                {
                    if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                    {
                        // 设置表头 Label 的文本
                        lblHeaderCount.Text = "檢測數量";
                    }else
                    {
                        // 设置表头 Label 的文本
                        lblHeaderCount.Text = "結束數量";
                    }
                      
                }

                if (lab_hiddenActionId.Text.Equals("XIAODAN"))
                {
                    // 设置表头 Label 的文本
                    lblHeaderCount.Text = "消單數量";
                }

            }

         
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Label dg_lab_ProcessNo = e.Item.FindControl("dg_lab_ProcessNo") as Label;
                int processno = Convert.ToInt32(dg_lab_ProcessNo.Text);

                ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
                PartPartProcessInfo ppi = pp.getPartProcessInfo(processno);

                Label statusid = e.Item.FindControl("dg_lab_statuscode") as Label;

                TextBox txt_productNumber = e.Item.FindControl("txt_productNumber") as TextBox;
                Label lab_productNumber = e.Item.FindControl("lab_productNumber") as Label;
                TextBox dg_txt_QRCode = e.Item.FindControl("dg_txt_QRCode") as TextBox;
                int displayCount;
                bool productNumberReadOnly;
                bool splitQrCodeReadOnly;
                scanbar.GetProductNumberDisplayState(lab_hiddenActionId.Text, ppi, pi, out displayCount, out productNumberReadOnly, out splitQrCodeReadOnly);
                lab_productNumber.Text = displayCount.ToString();
                txt_productNumber.Text = lab_productNumber.Text;
                txt_productNumber.ReadOnly = productNumberReadOnly;
                txt_productNumber.BackColor = productNumberReadOnly ? Color.LightGray : Color.White;
                dg_txt_QRCode.ReadOnly = splitQrCodeReadOnly;
                dg_txt_QRCode.BackColor = splitQrCodeReadOnly ? Color.LightGray : Color.White;

                if (lab_hiddenActionId.Text.Equals("JIESHU"))
                {
                    if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                    {
                        TextBox dg_lab_Eligibility = e.Item.FindControl("dg_lab_Eligibility") as TextBox;
                        dg_lab_Eligibility.Text = txt_productNumber.Text;
                    }
                }
                

                    //e.Item.Cells[0].Text = Convert.ToString((e.Item.ItemIndex + 1));
                Label dg_lab_combineTimeStame = e.Item.FindControl("dg_lab_combineTimeStame") as Label;
                CheckBox CheckBox_Select = e.Item.FindControl("CheckBox_Select") as CheckBox;

                //Label dg_lab_FactStartTime = e.Item.FindControl("dg_lab_FactStartTime") as Label;
              
                //if (!dg_lab_FactStartTime.Text.Trim().Equals("") && Convert.ToDateTime(dg_lab_FactStartTime.Text.Trim()).Ticks > 0)
                //{

                //    CheckBox_Select.Enabled = false;
                //    if (chk_combine.Checked)
                //    {

                //        if (dg_lab_combineTimeStame.Text.Trim().Equals("") || dg_lab_combineTimeStame.Text.Trim().Equals("0"))
                //        {
                //            CheckBox_Select.Checked = false;
                //            CheckBox_Select.Enabled = false;
                //        }
                //        else
                //        {
                //            //if (lab_combineStamp.Text.Trim().Equals("0"))
                //            //{
                //            //    lab_combineStamp.Text = dg_lab_combineTimeStame.Text;
                //            //}
                //            if (dg_lab_combineTimeStame.Text.Trim().Equals(lab_combineStamp.Text.Trim()))
                //            {
                //                CheckBox_Select.Checked = true;
                //            }
                //            else
                //            {
                //                CheckBox_Select.Checked = false;
                //            }
                //            CheckBox_Select.Enabled = true;

                //        }
                //    }
                //    else
                //    {
                //        if ((!dg_lab_combineTimeStame.Text.Trim().Equals("") && !dg_lab_combineTimeStame.Text.Trim().Equals("0")))
                //        {
                //            CheckBox_Select.Checked = false;
                //            CheckBox_Select.Enabled = false;
                //        }
                //        else
                //        {
                //            CheckBox_Select.Checked = true;
                //            CheckBox_Select.Enabled = true;
                //        }

                //    }
                //}
                //else
                //{
                //    if (!chk_combine.Checked || lab_combineStamp.Text.Equals("0"))
                //        CheckBox_Select.Enabled = true;
                //    else
                //        CheckBox_Select.Checked = false;
                //}


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

