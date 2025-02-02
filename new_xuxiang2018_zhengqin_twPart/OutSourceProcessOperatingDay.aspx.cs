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
using ModuleWorkFlow.WebView;


using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model;

using ModuleWorkFlow.BLL.Config;
using Utility;
namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for ProcessOperatingDay.
    /// </summary>
    public class OutSourceProcessOperatingDay : System.Web.UI.Page
    {
        //protected ModuleWorkFlow.controls.Style Style;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_Process;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.DropDownList dpl_status;
        protected System.Web.UI.WebControls.Button bnt_submission;
        protected System.Web.UI.WebControls.TextBox txt_searchmodelid;
        protected TextBox txt_partno;
        protected TextBox txt_qrcode;
        protected TextBox txt_userno;
        protected System.Web.UI.WebControls.Button bnt_select;
        protected System.Web.UI.WebControls.Label Label_Message;
        private Hashtable huserno;
        protected string menuname = "";
        private Utility.NoSortHashTable hprocessno;

        private void Page_Load(object sender, System.EventArgs e)
        {
            string menuid = "F08";
            Tmenu menu = new Tmenu();
            TmenuInfo mi = menu.findbykey(menuid);



            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
            }

            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");
           
            if (!this.IsPostBack)
            {
                //權限控制
                
                 BindDataProcess();
               
                HttpCookie cookie = Request.Cookies["COOKIEPROCESSID"];
                if (cookie != null)
                {
                    Methods.DropDownListChange(Dropdownlist_Process, cookie.Value);
                }
                processchange();
                BindDataDBGrid();
            }

            if (System.Configuration.ConfigurationSettings.AppSettings["OutSourcePrice"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["OutSourcePrice"]) && dpl_status.SelectedValue.Equals("Implementation"))
            {
                MainDataGrid.Columns[MainDataGrid.Columns.Count - 2].Visible = true;
            }
            else
            {
                MainDataGrid.Columns[MainDataGrid.Columns.Count - 2].Visible = false;
            }
        }

        private void BindDataProcess()
        {
            Dropdownlist_Process.DataTextField = "processname";
            Dropdownlist_Process.DataValueField = "processid";
            Dropdownlist_Process.DataSource = new ModuleWorkFlow.BLL.Process().GetProcessInfo();
            Dropdownlist_Process.DataBind();
            Dropdownlist_Process.Items.Insert(0, new ListItem(Translate.translateString("所有"), ""));
        }

        private void processchange()
        {
            HttpCookie cookie = new HttpCookie("COOKIEPROCESSID", Dropdownlist_Process.SelectedValue);

            TimeSpan tsminute = new TimeSpan(30, 0, 0, 0);
            cookie.Expires = DateTime.Now + tsminute;

            Response.Cookies.Add(cookie);
        }

        private void BindDataDBGrid()
        {
            PartOutSourceDetail outsourceDetail = new PartOutSourceDetail();
            ModuleWorkFlow.BLL.PartProcess partprocess = new ModuleWorkFlow.BLL.PartProcess();
            IList partprocesses = new ArrayList();
            string processid = Dropdownlist_Process.SelectedValue;
            if (dpl_status.SelectedValue.Trim().Equals("Ready") || dpl_status.SelectedValue.Trim().Equals("allstart"))
            {

                partprocesses = outsourceDetail.getOutSourceReady(processid, dpl_status.SelectedValue, txt_searchmodelid.Text.Trim(), txt_partno.Text.Trim());

            }
            else
            {

                partprocesses = outsourceDetail.getOutSourceReady(processid, dpl_status.SelectedValue, txt_searchmodelid.Text.Trim(), txt_partno.Text.Trim());

                if (dpl_status.SelectedValue.Equals("Implementation") && Dropdownlist_Process.SelectedValue.Equals(""))
                {
                    ArrayList resultPartprocess = new ArrayList();
                    resultPartprocess.AddRange(partprocesses);
                    partprocesses.Clear();
                    PartProcessInfo prepartPPI = null;

                    foreach (PartProcessInfo ppi in resultPartprocess)
                    {
                        IList partPartProcesses = partprocess.getPartProcessInfo(ppi.ModuleId, ppi.PartNo_Id);

                        for (int i = 1; i < partPartProcesses.Count; i++)
                        {
                            PartProcessInfo partPPI = partPartProcesses[i] as PartProcessInfo;
                            prepartPPI = partPartProcesses[i - 1] as PartProcessInfo;
                            if (partPPI.ProcessOrder <= ppi.ProcessOrder)
                            {
                                continue;
                            }
                            if (partPPI.NeedProduct == 1 && i > 0)
                            {
                                partprocesses.Add(prepartPPI);
                                break;
                            }


                        }

                        if (prepartPPI == null)
                        {
                            // partprocesses.Add(prepartPPI);
                            partprocesses.Add(ppi);
                        }
                        else
                        {
                            if (prepartPPI.NeedProduct == 0 && (partPartProcesses[partPartProcesses.Count - 1] as PartProcessInfo).ProcessOrder == partPartProcesses.Count && (partPartProcesses[partPartProcesses.Count - 1] as PartProcessInfo).NeedProduct == 0)
                            {
                                partprocesses.Add(partPartProcesses[partPartProcesses.Count - 1]);
                            }
                        }



                    }
                }
            }


            MainDataGrid.DataSource = partprocesses;
            MainDataGrid.DataBind();
            ColorConverter cc = new ColorConverter();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                
                TextBox txt_comment = MainDataGrid.Items[i].FindControl("txt_comment") as TextBox;
                //if (dpl_status.SelectedValue.Trim().Equals("Ready") || dpl_status.SelectedValue.Trim().Equals("allstart") || dpl_status.SelectedValue.Trim().Equals("Implementation"))
                //{

                //    txt_comment.Visible = false;
                //}
                //else
                //{
                //    txt_comment.Visible = true;
                //}
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
            this.Dropdownlist_Process.SelectedIndexChanged += new System.EventHandler(this.Dropdownlist_Process_SelectedIndexChanged);
            this.dpl_status.SelectedIndexChanged += new System.EventHandler(this.dpl_status_SelectedIndexChanged);
            this.MainDataGrid.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemCreated);
            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
            this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void Dropdownlist_Process_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            processchange();
            MainDataGrid.CurrentPageIndex = 0;
            BindDataDBGrid();
            Label_Message.Text = "";
        }

        private void MainDataGrid_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {

            if (!e.CommandSource.GetType().FullName.Equals("System.Web.UI.WebControls.DataGridLinkButton"))
            {
                ModuleWorkFlow.BLL.PartProcess pp = new ModuleWorkFlow.BLL.PartProcess();
                ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour ppddw = new ModuleWorkFlow.BLL.PartProcessDealDateTimeWorkHour();

                //MYD0123-3
                int processno = Convert.ToInt32(e.Item.Cells[20].Text);//

                PartProcessInfo ppi = pp.getPartProcessInfo(processno);
                ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(ppi.ProcessId);
                string userno = Session["userid"].ToString();
                ModuleWorkFlow.BLL.User u = new ModuleWorkFlow.BLL.User();
                string username = u.getUserInfo(userno).Name;

                bool ret = false;

                switch (((Button)e.CommandSource).CommandName)
                {
                    case "start":
                        if (pi.StartDirectly)
                            ret = ppddw.BarcodeScan_PartStart(ppi, DateTime.Now, "Working", userno, username, 1, "Ready");
                        else
                            ret = ppddw.BarcodeScan_PartStart(ppi, DateTime.Now, "Working", userno, username, 1, "JIEDAN");
                        break;

                    case "holdon":
                        ret = ppddw.BarcodeScan_PartHoldon(ppi, DateTime.Now, "Holdon", userno, username, 1, "Working");
                        break;

                    case "end":
                        ret = ppddw.BarcodeScan_PartEnd(ppi, DateTime.Now, "Implementation", userno, username, 1, "Working");

                        //如果下一道工序的狀態為「未就緒」， 則更新下一道工序的狀態為「就緒」
                        PartProcessInfo nextppi = pp.getPartProcessInfo(ppi.ModuleId, ppi.PartNo_Id, ppi.ProcessOrder + 1);
                        if (nextppi != null && nextppi.StatusId.ToLower().Equals("pending"))
                        {
                            nextppi.StatusId = "Ready";
                            pp.UpdatePartProcessStatus(nextppi);
                        }
                        break;

                    default:
                        // Do nothing.
                        break;
                }
                BindDataDBGrid();
            }
        }

        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                BLL.User user = new ModuleWorkFlow.BLL.User();
                Hashtable htGetUserName = new Hashtable();

                IList list = user.getListUserInfo();
                foreach (Model.UserInfo ui in list)
                {
                    try
                    {
                        htGetUserName.Add(ui.UserName, ui.UserName);
                    }
                    catch { }
                }

               
             

             

               

                int processno = Convert.ToInt32((e.Item.FindControl("dg_lab_ProcessNo") as Label).Text);
                ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
                TextBox txt_user = e.Item.FindControl("dpl_txt_user") as TextBox;

                DatePicker txt_StartDate = e.Item.FindControl("dp_StartDate") as DatePicker;
                DropDownList dpl_StartTime = e.Item.FindControl("dpl_StartTime") as DropDownList;


              
                PartPartProcessInfo ppi = pp.getPartProcessInfo(processno);
                if (dpl_status.SelectedValue.Equals("Holdon") || dpl_status.SelectedValue.Equals("Implementation") || dpl_status.SelectedValue.Equals("AllImplementation"))
                {
                    if (ppi.UserId != null)
                    {
                        txt_user.Text = Convert.ToString(htGetUserName[ppi.UserId]);
                    }
                    txt_StartDate.Text = DateTime.Now.ToShortDateString();
                    dpl_StartTime.SelectedValue = DateTime.Now.Hour.ToString("D2");
                 
                }

                if (ppi.StatusId.Equals("Ready"))
                {
                    Label lab_productNumber = e.Item.FindControl("lab_productNumber") as Label;
                    TextBox txt_productNumber = e.Item.FindControl("txt_productNumber") as TextBox;
                    lab_productNumber.Text = ppi.ReadyCount.ToString();
                    txt_productNumber.Text = lab_productNumber.Text;
                 
                }

                if (ppi.StatusId.Equals("JIEDAN"))
                {
                    Label lab_productNumber = e.Item.FindControl("lab_productNumber") as Label;
                    TextBox txt_productNumber = e.Item.FindControl("txt_productNumber") as TextBox;
                    lab_productNumber.Text = ppi.GetCount.ToString();
                    txt_productNumber.Text = lab_productNumber.Text;
                }

                if (ppi.StatusId.Equals("Working"))
                {
                    Label lab_productNumber = e.Item.FindControl("lab_productNumber") as Label;
                    lab_productNumber.Text = ppi.StartCount.ToString();
                    TextBox txt_productNumber = e.Item.FindControl("txt_productNumber") as TextBox;
                    txt_productNumber.Text = lab_productNumber.Text;
                }

                if (ppi.StatusId.Equals("Holdon"))
                {
                    Label lab_productNumber = e.Item.FindControl("lab_productNumber") as Label;
                    lab_productNumber.Text = ppi.HoldCount.ToString();
                    TextBox txt_productNumber = e.Item.FindControl("txt_productNumber") as TextBox;
                    txt_productNumber.Text = lab_productNumber.Text;
                }

                if (ppi.StatusId.Equals("Implementation"))
                {
                    Label lab_productNumber = e.Item.FindControl("lab_productNumber") as Label;
                    lab_productNumber.Text = ppi.FinishedCount.ToString();
                    TextBox txt_productNumber = e.Item.FindControl("txt_productNumber") as TextBox;
                    txt_productNumber.Text = lab_productNumber.Text;
                }





                if (Session["userid"] != null)
                {
                    UserInfo ui = new User().getUserInfo(Session["userid"].ToString());
                    if (ui != null)
                    {
                        txt_user.Text = ui.UserName;
                    }
                }

                Label lab_partno = e.Item.FindControl("dg_lab_partno") as Label;
                ModuleWorkFlow.BLL.Part part = new Part();
                ModuleWorkFlow.Model.PartInfo partinfo = new PartInfo();
                partinfo = part.getPartInfo(ppi.ModuleId, ppi.PartNo);
                lab_partno.Text = partinfo.PartName;



                DropDownList dpl_user = (DropDownList)e.Item.FindControl("dg_dpl_user");
                //				processid = DropDownList_Process.SelectedValue;
                //				ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
                //				IList ilpg;
                //				ilpg = machine.GetAllMachineList(Dropdownlist_Process.SelectedValue);
                IList iuser = user.getListUserInfo();
                ModuleWorkFlow.Model.UserInfo userinfo = new UserInfo();
                userinfo.Name = "";
                iuser.Insert(0, userinfo);
                dpl_user.DataSource = iuser;
                dpl_user.DataTextField = "name";
                dpl_user.DataValueField = "username";
                dpl_user.DataBind();



            }
        }

        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;
            BindDataDBGrid();
        }

        private void dpl_status_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            MainDataGrid.CurrentPageIndex = 0;
            BindDataDBGrid();
            Label_Message.Text = "";
        }

        public void chkall_onchanged(object sender, System.EventArgs e)
        {
            CheckBox checkall = (CheckBox)sender;
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox chk = (CheckBox)MainDataGrid.Items[i].FindControl("CheckBox_Select");
                chk.Checked = checkall.Checked;
                if (!string.IsNullOrEmpty(txt_userno.Text))
                {
                    (MainDataGrid.Items[i].FindControl("dpl_txt_user") as TextBox).Text = txt_userno.Text;
                }
            }
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

        private bool hasDuplicateUserNo(string userno)
        {
            bool result = false;
            User user = new User();
            string[] users = userno.Split(',');
            for (int i = 0; i < users.Length; i++)
            {
                if (user.getUserInfoByusername(users[i]) == null)
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


        private string checkinnput(string userno, int processno)
        {
            string msg = "";

            Process process = new Process();
            ModuleWorkFlow.Model.ProcessInfo pi = process.GetProcessInfoById(Dropdownlist_Process.SelectedValue);

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
            DropDownList dpl_userno = MainDataGrid.Items[i].FindControl("dg_dpl_user") as DropDownList;
            TextBox txt_userno = MainDataGrid.Items[i].FindControl("dpl_txt_user") as TextBox;
            ImageButton btn_user = MainDataGrid.Items[i].FindControl("dg_btn_user") as ImageButton;
            btn_user.Visible = true;
            dpl_userno.Visible = false;
            txt_userno.Text = dpl_userno.SelectedValue;

        }
        public void dg_btn_user_Click(object sender, System.EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            TableCell cell = btn.Parent as TableCell;
            DataGridItem item = cell.Parent as DataGridItem;
            int i = item.ItemIndex;
            DropDownList dpl_userno = MainDataGrid.Items[i].FindControl("dg_dpl_user") as DropDownList;

            ImageButton btn_user = MainDataGrid.Items[i].FindControl("dg_btn_user") as ImageButton;
            btn_user.Visible = false;
            dpl_userno.Visible = true;

        }

        private void MainDataGrid_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList dpl_StartTime = e.Item.FindControl("dpl_StartTime") as DropDownList;
                for (int i = 0; i < 24; i++)
                {
                    if (i < 10)
                    {
                        dpl_StartTime.Items.Add("0" + i.ToString());
                        dpl_StartTime.Items[i].Value = "0" + i.ToString();
                    }
                    else
                    {
                        dpl_StartTime.Items.Add(i.ToString());
                        dpl_StartTime.Items[i].Value = i.ToString();
                    }
                }
            }
        }


        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "";
            PartScanBar scanbar = new PartScanBar();
            ModuleWorkFlow.BLL.PartPartProcess partprocess = new ModuleWorkFlow.BLL.PartPartProcess();
        
            huserno = new ModuleWorkFlow.BLL.User().getUserName();

            ModuleWorkFlow.BLL.User u = new ModuleWorkFlow.BLL.User();

            string userno = "";
            string username = "";


            IList usermsg = new ArrayList();

            DateTime StartDate = DateTime.Now;
            DateTime scanTime = DateTime.Now;

            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(Dropdownlist_Process.SelectedValue);

            string actionid = "";
            string actionvalue = "";
            switch (dpl_status.SelectedValue)
            {
                case "Ready":
                    actionid = "KAISHI";
                    actionvalue = "出廠";
                    break;
                case "allstart":
                    actionid = "KAISHI";
                    actionvalue = "出廠";
                    break;
                case "Holdon":
                    actionid = "ZANTING";
                    actionvalue = "暫停";
                    break;
                case "AllImplementation":
                    actionid = "JIESHU";
                    actionvalue = "回廠";
                    break;
                case "Implementation":
                    actionid = "JIESHU";
                    actionvalue = "回廠";
                    break;
                default:
                    break;
            }

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
                            Label_Message.Text = Label_Message.Text + Translate.translateString("用戶不可重複且必須存在");
                            return;
                        }
                    }
                    else
                    {
                        Label_Message.Text = Label_Message.Text +Translate.translateString("用戶不能為空");
                        return;

                    }
                }
            }

            List<PartPartProcessInfo> source = new List<PartPartProcessInfo>();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {

                CheckBox CheckBox_Select = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                bool isSelect = CheckBox_Select.Checked;

                ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
                ModuleWorkFlow.BLL.PartPartProcessDealDateTimeWorkHour ppddw = new ModuleWorkFlow.BLL.PartPartProcessDealDateTimeWorkHour();

                //MYD0123-3
                int processno = Convert.ToInt32((MainDataGrid.Items[i].FindControl("dg_lab_ProcessNo") as Label).Text);//whd
                string processid = (MainDataGrid.Items[i].FindControl("dg_lab_ProcessId") as Label).Text;



                PartPartProcessInfo ppi = pp.getPartProcessInfo(processno);




                if (isSelect)
                {
                    TextBox txt_user = MainDataGrid.Items[i].FindControl("dpl_txt_user") as TextBox;
                    TextBox txt_UnitPriceNoTax = MainDataGrid.Items[i].FindControl("txt_UnitPriceNoTax") as TextBox;
                    TextBox txt_productNumber = MainDataGrid.Items[i].FindControl("txt_productNumber") as TextBox;
                    Label lab_productNumber = MainDataGrid.Items[i].FindControl("lab_productNumber") as Label;
                    CheckBox unbound_Select = MainDataGrid.Items[i].FindControl("unbound_Select") as CheckBox;
                    userno = txt_user.Text.Trim();
                    UserInfo ui = new User().getUserInfoByusername(userno);
                    username = ui.Name;


                    ppi.UserId = userno;
                    ppi.UserName = username;
                    ppi.ScanCount = Convert.ToInt32(txt_productNumber.Text);
                    ppi.BoxCount = Convert.ToInt32(lab_productNumber.Text);
                    if (unbound_Select.Checked)
                    {
                        ppi.SplitQRCode = ppi.QRCode;
                        ppi.QRCode = "";
                        
                        ppi.BoxUnBoxCount = ppi.ScanCount;
                    }
                    if (actionid.Equals("JIESHU") && Dropdownlist_Process.SelectedValue.Equals(""))
                    {
                        if (ppi.FactStartDate.Ticks == 0)
                        {
                            List<PartPartProcessInfo> partProcesses = partprocess.getListPartProcessInfo(ppi.ModuleId, ppi.PartNo_Id);

                            int startindex = -1;
                            for (int j = partProcesses.Count - 1; j > -1; j--)
                            {
                                PartProcessInfo partPPI = partProcesses[j] as PartProcessInfo;
                                if (partPPI.ProcessOrder > ppi.ProcessOrder)
                                {
                                    continue;
                                }

                                if (partPPI.NeedProduct == 0 && partPPI.StatusId.Equals("Working"))
                                {

                                    startindex = j;
                                    break;
                                }
                            }

                            if (startindex > -1)
                            {
                                List<PartPartProcessInfo> continueSouce = new List<PartPartProcessInfo>();
                                continueSouce.Add(partProcesses[startindex]);
                                ModuleWorkFlow.Model.ProcessInfo continuepi = new Process().GetProcessInfoById((partProcesses[startindex] as PartProcessInfo).ProcessId);
                                continuepi.FinishedDirectly = true;
                                string continuemsg = scanbar.updatePartProcessInfo(continueSouce, "JIESHU", "回廠", continuepi, 8, 0, new ArrayList(), new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);

                                if (continuemsg.Equals(Lang.SAVE_SUCCESS))
                                {
                                    for (int j = startindex + 1; j < partProcesses.Count; j++)
                                    {

                                        continueSouce.Clear();
                                        continueSouce.Add(partProcesses[j]);
                                        continuepi = new Process().GetProcessInfoById((partProcesses[j] as PartProcessInfo).ProcessId);
                                        (partProcesses[j] as PartProcessInfo).StatusId = "Ready";
                                        (partProcesses[j] as PartProcessInfo).UserId = (partProcesses[startindex] as PartProcessInfo).UserId;
                                        (partProcesses[j] as PartProcessInfo).UserName = (partProcesses[startindex] as PartProcessInfo).UserName;
                                        continuepi.StartDirectly = true;
                                        continuepi.FinishedDirectly = true;
                                        continuemsg = scanbar.updatePartProcessInfo(continueSouce, "KAISHI", "出廠", continuepi, 8, 0, new ArrayList(), new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, (partProcesses[startindex] as PartProcessInfo).FactStartDate);
                                        if (!continuemsg.Equals(Lang.SAVE_SUCCESS))
                                        {
                                            Label_Message.Text = Translate.translateString("保存失敗");
                                            return;
                                        }
                                        if ((partProcesses[j] as PartProcessInfo).ProcessOrder != ppi.ProcessOrder)
                                        {
                                            (partProcesses[j] as PartProcessInfo).StatusId = "Working";
                                            (partProcesses[j] as PartProcessInfo).UserId = ppi.UserId;
                                            (partProcesses[j] as PartProcessInfo).UserName = ppi.UserName;
                                            continuemsg = scanbar.updatePartProcessInfo(continueSouce, "JIESHU", "回廠", continuepi, 8, 0, new ArrayList(), new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                                            if (!continuemsg.Equals(Lang.SAVE_SUCCESS))
                                            {
                                                Label_Message.Text = Translate.translateString("保存失敗");
                                                return;
                                            }
                                        }
                                        else
                                        {
                                            ppi.StatusId = "Working";
                                            break;
                                        }
                                    }
                                }
                                else
                                {
                                    Label_Message.Text = Translate.translateString("保存失敗");
                                    return;
                                }
                            }
                            else
                            {
                                Label_Message.Text = Translate.translateString("保存失敗");
                                return;
                            }
                        }
                    }
                    if (pi == null)
                    {
                        pi = new Process().GetProcessInfoById(processid);
                    }


                  



                    source.Add(ppi);


                }

            }

            if (source.Count == 0)
            {
                Label_Message.Text = Translate.translateString("請選擇零件");
                return;
            }


            Merchindise merchindise = new Merchindise();
            string msg = "";
           
            msg = scanbar.updatePartProcessInfo(source, actionid, actionvalue, pi, 8, 0, new ArrayList(), new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
            



            if (msg.Equals(Lang.SAVE_FAIL))
            {
                Label_Message.Text = Translate.translateString("保存失敗");

            }
            else
            {
                if (pi.PriceType.Equals("PARTOUTSOURCE") && actionid.Equals("JIESHU"))
                {
                    List<PartPartProcessInfo> nextsource = new List<PartPartProcessInfo>();
                    foreach (PartPartProcessInfo ppi in source)
                    {
                        PartPartProcessInfo nextppi = partprocess.getPartProcessInfo(ppi.ModuleId, ppi.PartNo_Id, ppi.ProcessOrder + 1);
                        if (nextppi != null && nextppi.PriceType.Equals("AUTOSTART"))
                        {
                            nextppi.UserId = ppi.UserId;
                            nextppi.UserName = ppi.UserName;
                            nextsource.Add(nextppi);
                        }
                    }

                    if (nextsource.Count > 0)
                    {
                        msg = scanbar.updatePartProcessInfo(nextsource, "KAISHI", "開始", pi, 8, 0, new ArrayList(), new ModuleWorkFlow.BLL.Outsource.OutSourceDetail(), false, scanTime);
                    }
                }
            }

            if (Label_Message.Text.Equals(""))
            {
                BoxLog boxlog = new BoxLog();
                 foreach (PartPartProcessInfo ppi in source)
                {
                    if (ppi.ScanCount < ppi.BoxCount)
                    {
                        if (boxlog.splitBoxPart(ppi,new PartOutSourceDetail(),actionid,ppi.SplitQRCode).Equals(Lang.SAVE_FAIL))
                        {
                            Label_Message.Text += $"{ppi.ModuleId}:{ppi.PartNo_Id},拆箱失敗</br>";
                        }
                    }

                }

                if (Label_Message.Text.Equals(""))
                    Label_Message.Text = Lang.SAVE_SUCCESS;
            }


            MainDataGrid.CurrentPageIndex = 0;
            BindDataDBGrid();
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            MainDataGrid.CurrentPageIndex = 0;
            BindDataDBGrid();
            Label_Message.Text = "";
        }

        protected void txt_qrcode_TextChanged(object sender, EventArgs e)
        {
            string content = txt_qrcode.Text.ToUpper();
            Label_Message.Text = "";
            if (!content.Equals(""))
            {
                if (content.IndexOf("A-") != -1 || content.IndexOf("M-") != -1 )
                {
                    doCommand(content);
                }
                else
                {
                    Label_Message.Text = $"{content}不正確，請掃入正確的條碼";
                    return;
                }
                txt_qrcode.Text = "";
            }
        }

        private void doCommand(string txt)
        {
            bool needUserName = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["needUserName"]);
           
            bool needMachine = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["needMachine"]);
            Process process = new Process();
            ModuleWorkFlow.Model.ProcessInfo pi = process.GetProcessInfoById(Dropdownlist_Process.SelectedValue);
           
            string command ;
            string content = txt;
            if (txt.IndexOf("A-") != -1 || txt.IndexOf("M-") != -1)
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
                        Label_Message.Text = selectPart("M-" + content, pi);
                        break;

                   
                }
            }
        }

        private string selectUserNo(string content)
        {
            string msg = "";

            ModuleWorkFlow.BLL.User u = new ModuleWorkFlow.BLL.User();


            UserInfo ui = u.getUserInfo(content);
            ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(Dropdownlist_Process.SelectedValue);
            if (ui != null)
            {
                if (checkRoleProcess(content))
                {




                    txt_userno.Text = ui.UserName;
                      
                    


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

        public bool checkRoleProcess(string userno)
        {
            BRoleProcess rp = new BRoleProcess();
            return rp.checkRoleProcess(userno, Dropdownlist_Process.SelectedValue);
        }

        private string selectPart(string content, ModuleWorkFlow.Model.ProcessInfo processInfo)
        {
            string errmsg = "";
            bool canexchange = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["canExchanged"]);







         
                
                    string qrcode = content;
                    List<string> statuslist = new List<string>();
                    if (dpl_status.SelectedValue.Trim().Equals("Ready") || dpl_status.SelectedValue.Trim().Equals("allstart"))
                    {
                        if (canexchange)
                        {
                            statuslist.Add("Pending");
                        }

                        Model.ProcessInfo pi = new Process().GetProcessInfoById(Dropdownlist_Process.SelectedValue);
                        if (pi.StartDirectly)
                        {
                            statuslist.Add("Ready");
                        }


                        statuslist.Add("JIEDAN");

                        statuslist.Add("Holdon");
                    }else
                    {
                        statuslist.Clear();
                        statuslist.Add("Working");
                    }

                    List<PartPartProcessInfo> partPartProcessInfos = new PartPartProcess().getListPartProcessInfoByQRCode(qrcode, statuslist);
                   
                    if (partPartProcessInfos.Count > 0)
                    {
                        txt_partno.Text = partPartProcessInfos[0].PartNo_Id;
                        txt_searchmodelid.Text = partPartProcessInfos[0].ModuleId;
                        MainDataGrid.CurrentPageIndex = 0;
                        BindDataDBGrid();
                        Label_Message.Text = "";
                    }

                
         





              

            return errmsg;

        }

        protected void CheckBox_Select_CheckedChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txt_userno.Text))
            {
                CheckBox chk_select = (CheckBox)sender;
                TableCell cell = chk_select.Parent as TableCell;
                DataGridItem item = cell.Parent as DataGridItem;
                int i = item.ItemIndex;
                TextBox dpl_txt_user = MainDataGrid.Items[i].FindControl("dpl_txt_user") as TextBox;
                dpl_txt_user.Text = txt_userno.Text;
            }
         

        }
    }
}
