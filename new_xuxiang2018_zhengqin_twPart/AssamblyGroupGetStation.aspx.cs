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
using ModuleWorkFlow.business;
using System.Collections.Generic;
using ModuleWorkFlow.BLL.Outsource;
using System.Linq;
using Microsoft.Ajax.Utilities;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkflow.OutSource.BLL.Interface;
using System.IO;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.BLL.NewOrder;
using System.Text;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for InventoryManage.
    /// </summary>
    public class AssamblyGroupGetStation : System.Web.UI.Page
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
        protected Literal lit_structureTree;
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

            string menuid = "F227";
            PartTmenu menu = new PartTmenu();
            PartTmenuInfo mi = menu.findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
            }

            if (IsPostBack && ViewState["GridData"] != null)
            {
                MainDatagrid.DataSource = ViewState["GridData"];
                BindAssemblyStructureTree(GridData);
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
                BindAssemblyStructureTree(null);

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

                }
                else
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;

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
            //this.MainDatagrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDatagrid_ItemDataBound);
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
            drp_processlist.DataSource = process.getClickProcessInfoExceptDesign().Cast<Model.ProcessInfo>().ToList().FindAll(m => m.PriceType.Equals("Assambly"));
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
                        if (content.Equals("JIEDAN") || content.Equals("XIAODAN"))
                        {
                            chk_combine.Enabled = true;
                            txt_combine_qrCode.ReadOnly = false;
                            txt_combine_qrCode.BackColor = Color.White;
                        }
                        else
                        {
                            chk_combine.Enabled = false;
                            chk_combine.Checked = false;
                            txt_combine_qrCode.Text = "";
                            txt_combine_qrCode.ReadOnly = true;
                            txt_combine_qrCode.BackColor = Color.LightGray;
                        }
                        if (content.Equals("JIESHU") && !drp_processlist.SelectedValue.Equals(""))
                        {
                            //ModuleWorkFlow.Model.ProcessInfo pi = new Process().GetProcessInfoById(drp_processlist.SelectedValue);
                            if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                            {

                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = true;

                            }
                            else
                            {

                                MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;
                            }
                        }
                        else
                        {
                            MainDatagrid.Columns[MainDatagrid.Columns.Count - 2].Visible = false;

                        }

                        if (content.Equals("ZANTING"))
                        {
                            chk_combine.Checked = false;
                            txt_combine_qrCode.Text = "";
                            txt_combine_qrCode.ForeColor = Color.LightGray;
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

        private List<PartPartProcessInfo> GridData
        {
            get { return ViewState["GridData"] as List<PartPartProcessInfo> ?? new List<PartPartProcessInfo>(); }
            set { ViewState["GridData"] = value; }
        }

        private sealed class AssemblyTreeNode
        {
            public string NodeId { get; set; }
            public PartPartProcessInfo Data { get; set; }
            public List<AssemblyTreeNode> Children { get; set; }
        }

        private void BindAssemblyStructureTree(IEnumerable<PartPartProcessInfo> source)
        {
            if (lit_structureTree == null)
            {
                return;
            }

            List<PartPartProcessInfo> sourceList = source == null
                ? new List<PartPartProcessInfo>()
                : source.Where(m => m != null).ToList();
            if (sourceList.Count == 0)
            {
                lit_structureTree.Text = string.Empty;
                return;
            }

            List<AssemblyTreeNode> treeNodes = BuildAssemblyTree(sourceList);
            StringBuilder html = new StringBuilder();
            foreach (AssemblyTreeNode node in treeNodes)
            {
                html.Append(RenderAssemblyTreeNode(node, 0));
            }

            lit_structureTree.Text = html.ToString();
        }

        private List<AssemblyTreeNode> BuildAssemblyTree(List<PartPartProcessInfo> source)
        {
            List<PartPartProcessInfo> normalizedSource = NormalizeAssemblyTreeSource(source);
            List<AssemblyTreeNode> roots = new List<AssemblyTreeNode>();
            Dictionary<string, List<PartPartProcessInfo>> childrenMap = normalizedSource
                .Where(m => !string.IsNullOrEmpty(m.ParentPartNo))
                .GroupBy(m => m.ParentPartNo)
                .ToDictionary(m => m.Key, m => m.ToList());
            int index = 0;
            foreach (PartPartProcessInfo root in normalizedSource.Where(m => string.IsNullOrEmpty(m.ParentPartNo)))
            {
                roots.Add(BuildAssemblyTreeNode(root, childrenMap, ref index));
            }

            return roots;
        }

        private List<PartPartProcessInfo> NormalizeAssemblyTreeSource(List<PartPartProcessInfo> source)
        {
            if (source == null)
            {
                return new List<PartPartProcessInfo>();
            }

            return source
                .Where(m => m != null && !string.IsNullOrEmpty(m.PartNo))
                .GroupBy(m => new
                {
                    ParentPartNo = m.ParentPartNo ?? string.Empty,
                    m.PartNo
                })
                .Select(group =>
                {
                    PartPartProcessInfo first = group.First();
                    return new PartPartProcessInfo
                    {
                        ModuleId = first.ModuleId,
                        PartNo = first.PartNo,
                        PartNo_Id = first.PartNo,
                        PartName = first.PartName,
                        ParentPartNo = first.ParentPartNo,
                        FinishedCount = group.Sum(m => m.FinishedCount),
                        ReadyCount = group.Sum(m => m.ReadyCount),
                        StartCount = group.Sum(m => m.StartCount),
                        LeastBatchCount = first.LeastBatchCount,
                        NeedProduct = first.NeedProduct
                    };
                })
                .OrderBy(m => string.IsNullOrEmpty(m.ParentPartNo) ? 0 : 1)
                .ThenBy(m => m.ParentPartNo)
                .ThenBy(m => m.PartNo)
                .ToList();
        }

        private AssemblyTreeNode BuildAssemblyTreeNode(PartPartProcessInfo current, Dictionary<string, List<PartPartProcessInfo>> childrenMap, ref int index)
        {
            AssemblyTreeNode node = new AssemblyTreeNode
            {
                NodeId = "assemblyTreeNode_" + index++,
                Data = current,
                Children = new List<AssemblyTreeNode>()
            };

            List<PartPartProcessInfo> childSource;
            if (current != null && !string.IsNullOrEmpty(current.PartNo) && childrenMap.TryGetValue(current.PartNo, out childSource))
            {
                foreach (PartPartProcessInfo child in childSource)
                {
                    node.Children.Add(BuildAssemblyTreeNode(child, childrenMap, ref index));
                }
            }

            return node;
        }

        private string RenderAssemblyTreeNode(AssemblyTreeNode node, int depth)
        {
            if (node == null || node.Data == null)
            {
                return string.Empty;
            }

            bool hasChildren = node.Children != null && node.Children.Count > 0;
            string childrenId = node.NodeId + "_children";
            string labelText = BuildAssemblyTreeLabel(node.Data);
            StringBuilder html = new StringBuilder();
            html.Append("<div class='tree-node'>");
            for (int i = 0; i < depth; i++)
            {
                html.Append("<img class='tree-spacer' src='images/treeimages/white.gif' alt='' />");
            }

            if (hasChildren)
            {
                html.AppendFormat(
                    "<img class='tree-toggle' src='images/treeimages/plus.gif' alt='+' data-target='{0}' data-open='0' onclick='return toggleAssemblyTreeNode(this);' />",
                    childrenId);
            }
            else
            {
                html.Append("<img class='tree-spacer' src='images/treeimages/white.gif' alt='' />");
            }

            html.AppendFormat("<span class='tree-label'>{0}</span>", HttpUtility.HtmlEncode(labelText));
            html.Append("</div>");

            if (hasChildren)
            {
                html.AppendFormat("<div id='{0}' class='tree-children' style='display:none;'>", childrenId);
                foreach (AssemblyTreeNode child in node.Children)
                {
                    html.Append(RenderAssemblyTreeNode(child, depth + 1));
                }

                html.Append("</div>");
            }

            return html.ToString();
        }

        private string BuildAssemblyTreeLabel(PartPartProcessInfo data)
        {
            string partNo = string.IsNullOrEmpty(data.PartNo) ? data.PartNo_Id : data.PartNo;
            string partName = string.IsNullOrEmpty(data.PartName) ? string.Empty : " " + data.PartName;
            return partNo + partName;
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

        /// <summary>
        /// 組裝提交：依主件 ScanCount 與各子件 ScanCount / LeastBatchCount，檢查子件總量是否足以組出主件數量。
        /// </summary>
        /// <returns>false 表示已設定 Label_Message 並應中止提交</returns>
        private bool checkAssemblyNumber(List<PartPartProcessInfo> source, List<PartPartProcessInfo> sonsource)
        {
            if (sonsource == null)
                sonsource = new List<PartPartProcessInfo>();
            if (source == null || source.Count == 0)
                return true;

          
            foreach (PartPartProcessInfo parentppi in source)
            {
                List<PartPartProcessInfo> sonparts = sonsource.FindAll(m => m.ParentPartNo != null && m.ParentPartNo.Equals(parentppi.PartNo));
                if (sonparts.Count == 0)
                    continue;

                var groupedWithSum = sonparts
                    .GroupBy(p => p.PartNo)
                    .Select(g => new
                    {
                        PartNo = g.Key,
                        TotalScanCount = g.Sum(x => x.ScanCount),
                        Items = g.ToList()
                    })
                    .ToList();

                foreach (var group in groupedWithSum)
                {
                    var first = group.Items.FirstOrDefault();
                    if (first == null || first.LeastBatchCount <= 0)
                        continue;

                    int totalPartNumber = Convert.ToInt32(group.TotalScanCount / first.LeastBatchCount);
                    if (totalPartNumber < parentppi.ScanCount)
                    {
                        Label_Message.Text = Translate.translateString($"子件數量必須和需要數量相符,{parentppi.PartNo}最多能組裝{totalPartNumber}");
                        return false;
                    }
                }
            }

            return true;
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
                List<PartPartProcessInfo> source = new List<PartPartProcessInfo>();
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
                // 與 GroupGetStation.selectPart 一致：M-{ModuleId}-{PartNo_Id...}，PartNo_Id 可含多個 '-'（如 30056942-1）
                if (content.Split('-').Length > 2)
                {
                    string[] modulparts = content.Split('-');
                    if (modulparts.Length > 2)
                    {
                        pmoduleid = modulparts[1];
                        ppartno = modulparts[2];
                        for (int i = 3; i < modulparts.Length; i++)
                        {
                            ppartno = ppartno + "-" + modulparts[i];
                        }
                        // 這裡的 ppartno 是掃描拆出來的 PartNo_Id；後面會用 DB 真實 PartNo_Id 清單取代
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

                }
                // PartNo_Id 可能是「料號-流水號」(如 30056942-1)，也可能本身含 '-' 且沒有流水號
                // 只有在最後一段是純數字時，才把最後一段當流水號去掉
                string partno = ppartno;
                int lastDashPart = ppartno.LastIndexOf("-");
                if (lastDashPart > 0 && lastDashPart < ppartno.Length - 1)
                {
                    string tail = ppartno.Substring(lastDashPart + 1);
                    int tailNo;
                    if (Int32.TryParse(tail, out tailNo))
                    {
                        partno = ppartno.Substring(0, lastDashPart);
                    }
                }

                // 跟 GroupGetStation 一樣：先展開成「DB 實際存在的 PartNo_Id 清單」，避免直接拿掃描拆出的 ppartno 去精確匹配失敗
                pi = new BLL.Part().getPartInfo(pmoduleid, partno);
                if (pi != null)
                {
                    List<PartPartProcessInfo> partPartProcessInfos =
                        new PartPartProcess().GetIListPartProcessAll(pi.ModuleId)
                            .FindAll(m => m.PartNo.Equals(pi.PartNo) && m.ProcessId.Equals(processInfo.ProcessId) && m.IsEmpty != 1);

                    if (lab_hiddenActionId.Text.Equals("KAISHI") || lab_hiddenActionId.Text.Equals("JIEDAN"))
                    {
                        partPartProcessInfos = partPartProcessInfos.FindAll(m => m.StatusId.Equals("Ready") || m.StatusId.Equals("Holdon") || m.StatusId.Equals("JIEDAN"));
                    }
                    if (lab_hiddenActionId.Text.Equals("ZANTING") || lab_hiddenActionId.Text.Equals("JIESHU"))
                    {
                        partPartProcessInfos = partPartProcessInfos.FindAll(m => m.StatusId.Equals("Working"));
                    }
                    if (lab_hiddenActionId.Text.Equals("XIAODAN"))
                    {
                        partPartProcessInfos = partPartProcessInfos.FindAll(m => m.StatusId.Equals("Implementation"));
                    }

                    // 掃碼已帶明確 PartNo_Id（如 料號-1 / 料號-2）且存在於當前製程清單時，只處理該筆。
                    // 若仍展開同料號下全部批號，foreach 會對同一父件 PartNo 重複 selectModulePart，觸發「父件不允許重複」。
                    var exactPpi = partPartProcessInfos.Find(p =>
                        string.Equals(p.PartNo_Id, ppartno, StringComparison.OrdinalIgnoreCase));
                    if (exactPpi != null)
                    {
                        ppartnos.Add(exactPpi.PartNo_Id);
                    }
                    else
                    {
                        foreach (var ppi in partPartProcessInfos)
                        {
                            ppartnos.Add(ppi.PartNo_Id);
                        }
                    }
                }

                // 若展開不到（例如 QRCode 沒建、或零件資料不全），至少用掃描拆出的 ppartno 當 fallback
                if (ppartnos.Count == 0 && !string.IsNullOrEmpty(ppartno))
                {
                    ppartnos.Add(ppartno);
                }
                //errmsg = scanbar.selectModulePart(pi, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility);
                List<PartBomDetailInfo> partBomDetailInfos = new PartBomDetail().GetBomDetailByNoParentPartNo(pmoduleid, partno);
                if (partBomDetailInfos.Count == 0 && !lab_hiddenActionId.Text.Equals("JIEDAN") && !lab_hiddenActionId.Text.Equals("XIAODAN"))
                {
                    return Translate.translateString($"{partno}是組裝件，不允許單獨組裝");
                }

                PartOrderDesignInfo podi = new PartOrderDesign().GetOrderDesignByNo(pmoduleid);
                foreach (var appartno in ppartnos)
                {
                    errmsg = scanbar.selectModulePart(pmoduleid, appartno, hprocessno, (Hashtable)Session["hstatus"], processInfo, lab_hiddenActionId.Text, lab_machine_value.Text, Eligibility, Ineligibility, partBomDetailInfos, podi);
                }





                if (!string.IsNullOrEmpty(errmsg))
                    return errmsg;

                List<PartPartProcessInfo> valueList = new List<PartPartProcessInfo>(hprocessno.Values.Cast<PartPartProcessInfo>());
                double totalReadyCount = 0;
                foreach (PartPartProcessInfo ppi in valueList.FindAll(m=>string.IsNullOrEmpty(m.ParentPartNo)))
                {
                    source.Add(ppi);
                    if (lab_hiddenActionId.Text.Equals("KAISHI"))
                        totalReadyCount += ppi.ReadyCount;
                   else
                        totalReadyCount += ppi.StartCount;
                    source.AddRange(valueList.FindAll(m => m.ParentPartNo != null && m.ParentPartNo.Equals(ppi.PartNo)));
                }

                foreach (PartBomDetailInfo pbdi in partBomDetailInfos)
                {
                    PartPartProcessInfo dppi = new PartPartProcessInfo();
                    dppi.PartNo = pbdi.PartNo;
                    dppi.PartNo_Id = pbdi.PartNo;
                    dppi.ModuleId = pbdi.ModuleId;
                    dppi.PartName = pbdi.PartName;
                    dppi.LeastBatchCount = pbdi.EachBatchCount;
                    dppi.StatusId = "Ready";
                    dppi.ParentPartNo = pbdi.ParentPartNo;
                    if (pbdi.IsMerchindise == 1)
                    {
                        dppi.ReadyCount = totalReadyCount * pbdi.EachBatchCount;
                        dppi.NeedProduct = 0;
                    }
                    else
                    {
                        if (lab_hiddenActionId.Text.Equals("KAISHI"))
                            dppi.ReadyCount = new PartPartProcess().getCanTotalAssembCount(dppi.ModuleId, dppi.PartNo);
                        else
                            dppi.ReadyCount = totalReadyCount * pbdi.EachBatchCount;
                        dppi.NeedProduct = 1;
                    }
                        source.Add(dppi);
                }


                if (lab_hiddenActionId.Text.Equals("ZANTING"))
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = true;
                }
                else
                {
                    MainDatagrid.Columns[MainDatagrid.Columns.Count - 1].Visible = false;
                }


                ViewState["GridData"] = source;
                GridData = source;
                MainDatagrid.DataSource = source;
                MainDatagrid.DataBind();
                BindAssemblyStructureTree(source);
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
                        BindAssemblyStructureTree(null);
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
                    BindAssemblyStructureTree(null);
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
            GridData = new List<PartPartProcessInfo>();
            BindAssemblyStructureTree(null);



        }

        private void btn_submit_Click(object sender, System.EventArgs e)
        {
            Label_Message.Text = "";
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


         

            List<PartPartProcessInfo> source = new List<PartPartProcessInfo>();
            List<PartPartProcessInfo> sonsource = new List<PartPartProcessInfo>();
            IList partProcessHolds = new ArrayList();
            List<PartPartProcessInfo> partFinishedSource = new List<PartPartProcessInfo>();
            List<PartPartProcessInfo> partStartSource = new List<PartPartProcessInfo>();
            IList partFinishedProcessHolds = new ArrayList();
            for (int i = 0; i < MainDatagrid.Items.Count; i++)
            {
                CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
                ModuleWorkFlow.BLL.PartPartProcessDealDateTimeWorkHour ppddw = new ModuleWorkFlow.BLL.PartPartProcessDealDateTimeWorkHour();
                Label lab_processno = MainDatagrid.Items[i].FindControl("dg_lab_processno") as Label;
                int sprocessno = Convert.ToInt32(lab_processno.Text);
                Label lab_needproduct = MainDatagrid.Items[i].FindControl("dg_lab_needproduct") as Label;
                int needproduct = Convert.ToInt32(lab_needproduct.Text);
                bool isSelect = CheckBox_Select.Checked;
                if ((actionid.Equals("JIESHU") || actionid.Equals("ZANTING")) && isSelect && sprocessno>0)
                {
                   
                    PartPartProcessInfo ppi = new PartPartProcessInfo();

                  
                    ppi = (PartPartProcessInfo)hprocessno[sprocessno];



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





                    partFinishedSource.Add(ppi);

                    isSelect = true;
                }

                QRCode qRCode = new QRCode();

               
                if (isSelect && sprocessno > 0 )
                {
                  
                   
                    PartPartProcessInfo ppi = new PartPartProcessInfo();
                    if (sprocessno > 0)
                        ppi = (PartPartProcessInfo)hprocessno[sprocessno];




                    ppi.MachineId = lab_machine_value.Text;
                    ppi.DesignateMachineId = lab_machine_value.Text;
                    ppi.UserId = userno;
                    ppi.UserName = username;
                    ppi.ParentPartNo = (MainDatagrid.Items[i].FindControl("dg_lab_ParentPartNo") as Label).Text;
                    ppi.LeastBatchCount = Convert.ToInt32((MainDatagrid.Items[i].FindControl("dg_lab_LeastBatchCount") as Label).Text);



                    TextBox txt_productNumber = MainDatagrid.Items[i].FindControl("txt_productNumber") as TextBox;
                    Label lab_productNumber = MainDatagrid.Items[i].FindControl("lab_productNumber") as Label;
                    TextBox dg_txt_SplitQRCode = MainDatagrid.Items[i].FindControl("dg_txt_SplitQRCode") as TextBox;
                    try
                    {
                        ppi.ScanCount = Convert.ToInt32(txt_productNumber.Text);
                        ppi.BoxCount = Convert.ToInt32(lab_productNumber.Text);
                        string splitQRCode = dg_txt_SplitQRCode == null ? string.Empty : dg_txt_SplitQRCode.Text.Trim();
                        string targetQRCode = string.IsNullOrWhiteSpace(splitQRCode) ? ppi.QRCode : splitQRCode;
                        ProcessBoxCodeRule processBoxCodeRule = new ProcessBoxCodeRule();
                        string boxCodeRuleMsg = processBoxCodeRule.checkBoxCodeRule(ppi.ProcessId, lab_hiddenActionId.Text, ppi.NeedProduct, targetQRCode);
                        if (!string.IsNullOrEmpty(boxCodeRuleMsg))
                        {
                            Label_Message.Text = boxCodeRuleMsg;
                            return;
                        }
                        if (ppi.BoxCount > ppi.ScanCount)
                        {
                            if (string.IsNullOrEmpty(splitQRCode) || !splitQRCode.StartsWith(PTSetting.PART_CODE + "-", StringComparison.OrdinalIgnoreCase))
                            {
                                Label_Message.Text = $@"{ppi.ModuleId}:{ppi.PartNo}必須要綁定條碼,並且綁定條碼必須以M-開頭";
                                return;
                            }

                            if (string.IsNullOrEmpty(splitQRCode) && !chk_combine.Checked)
                            {
                                Label_Message.Text = $@"{(MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label).Text},{(MainDatagrid.Items[i].FindControl("dg_lab_partnoId") as Label).Text} 必須輸入分箱條碼";
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

                    if (!string.IsNullOrEmpty(ppi.QRCode) && !ppi.QRCode.Equals(txt_combine_qrCode.Text.Trim()) && ppi.ScanCount == ppi.BoxCount && chk_combine.Checked)
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
                else if (isSelect && sprocessno == 0 && needproduct ==1)
                {
                    // ProcessNo=0：外購/補列等未掛在 hprocessno 的列，與 selectPart 中外購列 PartNo_Id=PartNo 一致
                    PartPartProcessInfo ppiMerch = new PartPartProcessInfo();
                    Label dg_lab_moduleid_m = MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label;
                    Label dg_lab_partno_m = MainDatagrid.Items[i].FindControl("dg_lab_partno") as Label;
                    ppiMerch.ModuleId = dg_lab_moduleid_m != null ? dg_lab_moduleid_m.Text.Trim() : "";
                    ppiMerch.PartNo = dg_lab_partno_m != null ? dg_lab_partno_m.Text.Trim() : "";
                    ppiMerch.PartNo_Id = ppiMerch.PartNo;
                    ppiMerch.ProcessNo = 0;
                    ppiMerch.ProcessId = drp_processlist.SelectedValue;
                    ppiMerch.ParentPartNo = (MainDatagrid.Items[i].FindControl("dg_lab_ParentPartNo") as Label) != null
                        ? (MainDatagrid.Items[i].FindControl("dg_lab_ParentPartNo") as Label).Text
                        : "";
                    Label dg_lbc_m = MainDatagrid.Items[i].FindControl("dg_lab_LeastBatchCount") as Label;
                    int leastM;
                    if (dg_lbc_m == null || !Int32.TryParse(dg_lbc_m.Text, out leastM) || leastM <= 0)
                        leastM = 1;
                    ppiMerch.LeastBatchCount = leastM;
                    ppiMerch.MachineId = lab_machine_value.Text;
                    ppiMerch.DesignateMachineId = lab_machine_value.Text;
                    ppiMerch.UserId = userno;
                    ppiMerch.UserName = username;
                    ppiMerch.StatusId = "Ready";

                    TextBox txt_pn_m = MainDatagrid.Items[i].FindControl("txt_productNumber") as TextBox;
                    Label lab_pn_m = MainDatagrid.Items[i].FindControl("lab_productNumber") as Label;
                    try
                    {
                        ppiMerch.ScanCount = Convert.ToInt32(txt_pn_m.Text);
                        ppiMerch.BoxCount = Convert.ToInt32(lab_pn_m.Text);
                        if (ppiMerch.ScanCount > ppiMerch.BoxCount)
                        {
                            Label_Message.Text = $@"{(MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label).Text},{ppiMerch.PartNo}加工數量不能大於可加工{ppiMerch.BoxCount}";
                            return;
                        }
                    }
                    catch
                    {
                        Label_Message.Text = $@"{(MainDatagrid.Items[i].FindControl("dg_lab_moduleid") as Label).Text},{ppiMerch.PartNo}加工數量必須為數字";
                        return;
                    }

                    sonsource.Add(ppiMerch);
                }
            }

            BoxLog boxlog = new BoxLog();
            // 首道工序、狀態 Ready、ReadyCount 為 0 時先走裝箱（與 GroupGetStation 一致），再進後續合併/保存/boxOperation
            if (actionid.Equals("KAISHI"))
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
                if (!actionid.Equals("JIEDAN") && source.Count > 0)
                {
                    if (!checkAssemblyNumber(source, sonsource))
                        return;
                }

                if (lab_hiddenWorkHours.Text.Equals(""))
                    lab_hiddenWorkHours.Text = "8";
                if (!actionid.Equals("JIEDAN"))
                {
                    if (!checkAssemblyNumber(source, sonsource))
                        return;
                }

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

                if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                {
                    if (actionid.Equals("KAISHI"))
                    {
                        new PartPartProcess().updataAssemblyPartNoId(completedSource, sonsource);
                    }
                    IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                    outsourceApplyDesigninfo.Creater = userno;
                    outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                    if (chk_combine.Checked )
                    {
                        if (chk_combine.Checked)
                        {
                            Label_Message.Text = boxlog.boxCombineOperation(completedSource, txt_combine_qrCode.Text.Trim(), totalCombineCount, actionid, scanTime, new PartOutSourceDetail(), outsourceApplyDesigninfo);
                        }
                        else
                        {
                            List<PartPartProcessInfo> parents = completedSource.FindAll(m => string.IsNullOrEmpty(m.ParentPartNo));
                            foreach(PartPartProcessInfo parentppi in parents)
                            {
                                // Assuming you have a List<PartPartProcessInfo> named 'source'
                                int totalScanCount = completedSource
                                    .Where(m => !string.IsNullOrEmpty(m.ParentPartNo) && m.ParentPartNo.Equals(parentppi.PartNo))
                                    .Sum(m => m.ScanCount);
                                foreach (PartPartProcessInfo subppi in completedSource.FindAll(m => !string.IsNullOrEmpty(m.ParentPartNo)  && m.ParentPartNo.Equals(parentppi.PartNo)))
                                {
                                    if (subppi.BoxCount == subppi.ScanCount)
                                    {
                                        subppi.IsEmpty = 1;
                                    }
                                }
                                string msg = boxlog.boxCombineOperation(completedSource, parentppi.QRCode, totalScanCount, actionid, scanTime, new PartOutSourceDetail(), outsourceApplyDesigninfo);
                                if (!msg.Equals(Lang.SAVE_SUCCESS))
                                {
                                    Label_Message.Text += msg;
                                }
                            }
                        }
                     
                    }
                    else
                    {

                        foreach (PartPartProcessInfo ppi in completedSource)
                        {
                            if (RequiresSplitActionHandling(actionid) && RequiresSplitBox(ppi))
                            {
                                continue;
                            }
                            Label_Message.Text = boxlog.boxOperation(ppi, actionid, ppi.SplitQRCode, scanTime, new PartOutSourceDetail(), outsourceApplyDesigninfo);
                        }
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



        protected void MainDatagrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
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
                    }
                    else
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
                TextBox txt_productNumber = e.Item.FindControl("txt_productNumber") as TextBox;
                TextBox dg_txt_SplitQRCode = e.Item.FindControl("dg_txt_SplitQRCode") as TextBox;
                Label dg_lab_ProcessNo = e.Item.FindControl("dg_lab_ProcessNo") as Label;
                Label dg_lab_ParentPartNo = e.Item.FindControl("dg_lab_ParentPartNo") as Label;
                RegularExpressionValidator rev_txt_productNumber = e.Item.FindControl("rev_txt_productNumber") as RegularExpressionValidator;
                RangeValidator rv_txt_productNumber =  e.Item.FindControl("rv_txt_productNumber") as RangeValidator;
                int processno = Convert.ToInt32(dg_lab_ProcessNo.Text);
                Label dg_lab_LeastBatchCount = e.Item.FindControl("dg_lab_LeastBatchCount") as Label;
                Label lab_productNumber = e.Item.FindControl("lab_productNumber") as Label;
                Label dg_lab_needproduct = e.Item.FindControl("dg_lab_needproduct") as Label;
                if (processno == 0 )
                {
                    CheckBox CheckBox_Select = e.Item.FindControl("CheckBox_Select") as CheckBox;
                    if (Convert.ToInt32(dg_lab_needproduct.Text) == 0)
                    {
                      
                        txt_productNumber.Visible = false;
                        dg_txt_SplitQRCode.Visible = false;
                        CheckBox_Select.Visible = false;
                        CheckBox_Select.Checked = false;
                        rev_txt_productNumber.Enabled = false;
                        rv_txt_productNumber.Enabled = false;
                        (e.Item.FindControl("txt_hold_comment") as TextBox).Visible = false;
                    }

                    txt_productNumber.Text = lab_productNumber.Text;
                    txt_productNumber.BackColor = Color.LightGray;
                    txt_productNumber.ReadOnly = true;
                    dg_txt_SplitQRCode.ReadOnly = true;
                    dg_txt_SplitQRCode.BackColor = Color.LightGray;
                    CheckBox_Select.Checked = true;
                    CheckBox_Select.Enabled = false;
                    CheckBox_Select.BackColor = Color.LightGray;

                    return;

                }


                
                    
               
                
                ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
                PartPartProcessInfo ppi = pp.getPartProcessInfo(processno);
                CheckBox cbSelectRow = e.Item.FindControl("CheckBox_Select") as CheckBox;
                if (ppi != null && ppi.IsEmpty == 1 && cbSelectRow != null)
                    cbSelectRow.Checked = false;
                if (!string.IsNullOrEmpty(dg_lab_ParentPartNo.Text))
                {
                    //dg_txt_SplitQRCode.ReadOnly = true;
                    //dg_txt_SplitQRCode.BackColor = Color.LightGray;
                    txt_productNumber.BackColor = Color.LightGray;
                    txt_productNumber.ReadOnly = true;
                }

                Label statusid = e.Item.FindControl("dg_lab_statusid") as Label;

              
               

                if (lab_hiddenActionId.Text.Equals("JIEDAN"))
                {
                    txt_productNumber.Text = ppi.ReadyCount.ToString();
                }

                // 與 GroupGetStation.MainDatagrid_ItemDataBound 一致：首工站 Ready 且 ReadyCount=0 時先帶入 LeastCount；Holdon 顯示 HoldCount；非 Holdon 顯示 ReadyCount 或 GetCount
                if (lab_hiddenActionId.Text.Equals("KAISHI"))
                {
                    if (ppi.StatusId.Equals("Holdon"))
                    {
                        txt_productNumber.Text = ppi.HoldCount.ToString();
                        txt_productNumber.ReadOnly = true;
                        txt_productNumber.BackColor = Color.LightGray;
                        dg_txt_SplitQRCode.ReadOnly = true;
                        dg_txt_SplitQRCode.BackColor = Color.LightGray;
                    }
                    else
                    {
                        if (ppi.ProcessOrder == 1 && ppi.StatusId.Equals("Ready") && ppi.ReadyCount == 0)
                        {
                            PartPartInfo partPartInfo = new PartPart().getPartInfo(ppi.ModuleId, ppi.PartNo);
                            ppi.ReadyCount = partPartInfo.LeastCount;
                        }
                        if (pi != null && pi.StartDirectly)
                        {
                            txt_productNumber.Text = ppi.ReadyCount.ToString();
                        }
                        else if (pi != null)
                        {
                            txt_productNumber.Text = ppi.GetCount.ToString();
                        }
                        txt_productNumber.ReadOnly = false;
                        txt_productNumber.BackColor = Color.White;
                        dg_txt_SplitQRCode.ReadOnly = false;
                        dg_txt_SplitQRCode.BackColor = Color.White;
                    }
                }

                if (lab_hiddenActionId.Text.Equals("ZANTING"))
                {
                    txt_productNumber.Text = ppi.StartCount.ToString();
                    txt_productNumber.ReadOnly = true;
                    txt_productNumber.BackColor = Color.LightGray;
                    dg_txt_SplitQRCode.ReadOnly = true;
                    dg_txt_SplitQRCode.BackColor = Color.LightGray;
                }

                if (lab_hiddenActionId.Text.Equals("JIESHU"))
                {
                    txt_productNumber.Text = ppi.StartCount.ToString();
                    if (pi != null && (pi.PriceType.ToUpper().Equals("QC") || pi.PriceType.ToUpper().Equals("RQC")))
                    {
                        TextBox dg_lab_Eligibility = e.Item.FindControl("dg_lab_Eligibility") as TextBox;
                        dg_lab_Eligibility.Text = txt_productNumber.Text;
                    }
                }

                if (lab_hiddenActionId.Text.Equals("XIAODAN"))
                {
                    txt_productNumber.Text = ppi.FinishedCount.ToString();

                    if (string.IsNullOrEmpty(dg_lab_ParentPartNo.Text) || Convert.ToInt32(dg_lab_LeastBatchCount.Text) > 0)
                    {
                        txt_productNumber.ReadOnly = true;
                        txt_productNumber.BackColor = Color.LightGray;
                        dg_txt_SplitQRCode.ReadOnly = true;
                        dg_txt_SplitQRCode.BackColor = Color.LightGray;
                    }

                    if (ppi.StatusId.Equals("JIEDAN"))
                    {
                        txt_productNumber.Text = ppi.GetCount.ToString();
                    }
                }

                lab_productNumber.Text = txt_productNumber.Text;


                if (statusid.Text.Equals("Ready"))
                {




                    if (pi.FinishedDirectly && pi.EndDirectly)
                    {
                        Label dg_lab_startCount = e.Item.FindControl("dg_lab_readyCount") as Label;
                        txt_productNumber.Text = dg_lab_startCount.Text;
                    }

                }
                RangeValidator rv = (RangeValidator)e.Item.FindControl("rv_txt_productNumber");
                Label lblAvailableQty = (Label)e.Item.FindControl("lab_productNumber");

                if (rv != null && lblAvailableQty != null)
                {
                    // 可用數量為 0 時不可設 MaximumValue=0 而 MinimumValue=1，否則 RangeValidator.PreRender 會擲出 HttpException
                    int maxVal = 0;
                    int.TryParse(lblAvailableQty.Text.Trim(), out maxVal);
                    if (maxVal < 1)
                    {
                        rv.MinimumValue = "0";
                        rv.MaximumValue = "0";
                    }
                    else
                    {
                        rv.MinimumValue = "1";
                        rv.MaximumValue = maxVal.ToString();
                    }
                }

                //e.Item.Cells[0].Text = Convert.ToString((e.Item.ItemIndex + 1));
                Label dg_lab_combineTimeStame = e.Item.FindControl("dg_lab_combineTimeStame") as Label;
                //CheckBox CheckBox_Select = e.Item.FindControl("CheckBox_Select") as CheckBox;




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
                ModuleWorkFlow.BLL.PartPartProcess pp = new ModuleWorkFlow.BLL.PartPartProcess();
                for (int i = 0; i < MainDatagrid.Items.Count; i++)
                {
                    Label dg_lab_ProcessNo = MainDatagrid.Items[i].FindControl("dg_lab_ProcessNo") as Label;
                    CheckBox CheckBox_Select = MainDatagrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                    if (Convert.ToInt32(dg_lab_ProcessNo.Text) > 0)
                    {
                        PartPartProcessInfo ppiAll = pp.getPartProcessInfo(Convert.ToInt32(dg_lab_ProcessNo.Text));
                        if (ppiAll != null && ppiAll.IsEmpty == 1)
                            CheckBox_Select.Checked = false;
                        else
                            CheckBox_Select.Checked = allcheckbox.Checked;
                    }
                }
            }
        }

        protected void txt_productNumber_TextChanged(object sender, EventArgs e)
        {
            // 👇 這行手動觸發頁面驗證器驗證
            Page.Validate();

            if (!Page.IsValid)
            {
                Label_Message.Text = "驗證未通過，請檢查數量格式或範圍。";
                return;
            }
            Label_Message.Text = ""; // 清除之前的提示信息

            TextBox currentTextBox = (TextBox)sender;
            DataGridItem currentItem = (DataGridItem)currentTextBox.NamingContainer;

            Label lblParentPartNo = (Label)currentItem.FindControl("dg_lab_ParentPartNo");

            if (lblParentPartNo != null && string.IsNullOrEmpty(lblParentPartNo.Text.Trim()))
            {
                UpdateByParentQuantity(currentItem);
            }
            else
            {
                //UpdateByChildQuantity(currentItem);
                return;
            }
        }

        private void UpdateByParentQuantity(DataGridItem parentItem)
        {
            Label lblParentPartNo = (Label)parentItem.FindControl("dg_lab_partno");
            TextBox txtParentQty = (TextBox)parentItem.FindControl("txt_productNumber");

            if (lblParentPartNo == null || txtParentQty == null) return;

            string parentPartNo = lblParentPartNo.Text.Trim();

            int parentQty;
            if (!Int32.TryParse(txtParentQty.Text.Trim(), out parentQty))
            {
                Label_Message.Text = $"父件数量格式错误，请输入有效数字（当前输入：{txtParentQty.Text}）";
                return;
            }

            Dictionary<string, int> hnewChildQty = new Dictionary<string, int>();



            foreach (DataGridItem item in MainDatagrid.Items)
            {
                Label lblPartNo = (Label)item.FindControl("dg_lab_partno");
                Label lblItemParentNo = (Label)item.FindControl("dg_lab_ParentPartNo");
                Label lblLeastBatch = (Label)item.FindControl("dg_lab_LeastBatchCount");
                Label lblAvailableQty = (Label)item.FindControl("lab_productNumber"); // 假设这是“可用数量”
                TextBox txtChildQty = (TextBox)item.FindControl("txt_productNumber");
                Label dg_lab_processno = item.FindControl("dg_lab_processno") as Label;

                if (string.IsNullOrEmpty(lblItemParentNo.Text) || hnewChildQty.ContainsKey(lblPartNo.Text))
                    continue;

                string itemParentNo = lblItemParentNo.Text.Trim();

                if (itemParentNo.Equals(parentPartNo) && Convert.ToInt32(dg_lab_processno.Text) >0)
                {
                    int needQty ;
                    int availableQty = 0;

                    Int32.TryParse(lblLeastBatch.Text.Trim(), out needQty);
                    //Int32.TryParse(lblAvailableQty.Text.Trim(), out availableQty);

                    int newChildQty = parentQty * needQty;
                    foreach (DataGridItem pitem in MainDatagrid.Items)
                    {
                        Label dg_lab_ParentPartNo = (Label)pitem.FindControl("dg_lab_ParentPartNo");
                        Label dg_lab_partno = pitem.FindControl("dg_lab_partno") as Label;
                        if (!dg_lab_partno.Text.Equals(lblPartNo.Text) )
                        {
                            continue;
                        }
                      
                        if (newChildQty == 0)
                        {
                            CheckBox CheckBox_Select = pitem.FindControl("CheckBox_Select") as CheckBox;
                            CheckBox_Select.Checked = false;
                            continue;
                         }
                        Label lab_productNumber = pitem.FindControl("lab_productNumber") as Label;
                        TextBox txt_productNumber = pitem.FindControl("txt_productNumber") as TextBox;
                        if (newChildQty > Convert.ToInt32(lab_productNumber.Text))
                        {
                            txt_productNumber.Text = lab_productNumber.Text;
                            newChildQty -= Convert.ToInt32(txt_productNumber.Text);
                            txt_productNumber.Text = (Convert.ToInt32(txt_productNumber.Text)).ToString();
                            availableQty += Convert.ToInt32(txt_productNumber.Text);
                        }
                        else
                        {
                            txt_productNumber.Text = newChildQty.ToString();
                            availableQty += Convert.ToInt32(txt_productNumber.Text);
                            txt_productNumber.Text = (Convert.ToInt32(txt_productNumber.Text) ).ToString();
                            newChildQty = 0;
                            //break;
                        }
                    }
                    if (!hnewChildQty.ContainsKey(lblPartNo.Text))
                    {
                        hnewChildQty[lblPartNo.Text] = newChildQty;
                    }
                   if (newChildQty >0)
                    {
                        Label dg_lab_moduleid = item.FindControl("dg_lab_moduleid") as Label;
                        Label dg_lab_partnoId = item.FindControl("dg_lab_partnoId") as Label;
                        string partno = dg_lab_partnoId.Text.Substring(0, dg_lab_partnoId.Text.LastIndexOf("-") - 1);
                        Label_Message.Text = $"{dg_lab_moduleid.Text},{partno}可用數量為{availableQty}，無法滿足{parentPartNo}的組裝數量，建議組裝數量修改為{availableQty / needQty}";
                        return;
                    }
                     
                    

                        //AdjustByLeastBatchFromChild(parentPartNo);
                 
                }
            }

          
        }

        private void AdjustByLeastBatchFromChild(string parentPartNo)
        {
            int minParentQty = int.MaxValue; // 初始設很大，逐步取最小可行父件數量

            // 一次計算所有子件的「最大可行父件數量」
            foreach (DataGridItem item in MainDatagrid.Items)
            {
                Label lblItemPartNo = (Label)item.FindControl("dg_lab_partno");
                Label lblItemParentNo = (Label)item.FindControl("dg_lab_ParentPartNo");
                Label lblLeastBatch = (Label)item.FindControl("dg_lab_LeastBatchCount");
                Label lblAvailableQty = (Label)item.FindControl("lab_productNumber");

                if (lblItemParentNo == null || lblItemPartNo == null || lblLeastBatch == null || lblAvailableQty == null)
                    continue;

                if (lblItemParentNo.Text.Trim() == parentPartNo)
                {
                    int leastBatch = 1;
                    int availableQty = 0;

                    Int32.TryParse(lblLeastBatch.Text.Trim(), out leastBatch);
                    Int32.TryParse(lblAvailableQty.Text.Trim(), out availableQty);

                    if (leastBatch <= 0) leastBatch = 1;

                    // 🟢 修正處：使用浮點數除法，保證向下取整才準確
                    int maxPossibleParentQty = (int)Math.Floor((double)availableQty / leastBatch);

                    // 🛑 防呆：最小為 0，不能變負值
                    if (maxPossibleParentQty < minParentQty)
                        minParentQty = Math.Max(0, maxPossibleParentQty);
                }
            }

            // 更新父件數量
            foreach (DataGridItem item in MainDatagrid.Items)
            {
                Label lblPartNo = (Label)item.FindControl("dg_lab_partno");
                Label lblParentNo = (Label)item.FindControl("dg_lab_ParentPartNo");
                TextBox txtQty = (TextBox)item.FindControl("txt_productNumber");

                if (lblPartNo != null && txtQty != null && lblParentNo != null && string.IsNullOrEmpty(lblParentNo.Text.Trim()))
                {
                    if (lblPartNo.Text.Trim() == parentPartNo)
                    {
                        txtQty.Text = minParentQty.ToString(); // 父件數量更新
                    }
                }
            }

            // 更新所有子件數量
            foreach (DataGridItem item in MainDatagrid.Items)
            {
                Label lblItemParentNo = (Label)item.FindControl("dg_lab_ParentPartNo");
                Label lblLeastBatch = (Label)item.FindControl("dg_lab_LeastBatchCount");
                TextBox txtChildQty = (TextBox)item.FindControl("txt_productNumber");

                if (lblItemParentNo == null || txtChildQty == null || lblLeastBatch == null)
                    continue;

                if (lblItemParentNo.Text.Trim() == parentPartNo)
                {
                    int leastBatch = 1;
                    Int32.TryParse(lblLeastBatch.Text.Trim(), out leastBatch);
                    txtChildQty.Text = (leastBatch * minParentQty).ToString(); // 子件數量更新
                }
            }

            // 顯示提示訊息（繁體中文）
            Label_Message.Text = $"部分子件的輸入數量超過可用數量，系統已自動依照最小配方批量調整父件與子件數量為最接近可行值（父件數量：{minParentQty}）。";
        }



        private void UpdateByChildQuantity(DataGridItem childItem)
        {
            Label lblChildPartNo = (Label)childItem.FindControl("dg_lab_partno");
            Label lblParentPartNo = (Label)childItem.FindControl("dg_lab_ParentPartNo");
            Label lblLeastBatch = (Label)childItem.FindControl("dg_lab_LeastBatchCount");
            Label lblAvailableQty = (Label)childItem.FindControl("lab_productNumber"); // 可用數量
            TextBox txtChildQty = (TextBox)childItem.FindControl("txt_productNumber");

            if (lblChildPartNo == null || lblParentPartNo == null || lblLeastBatch == null || lblAvailableQty == null || txtChildQty == null)
                return;

            string parentPartNo = lblParentPartNo.Text.Trim();
            string childPartNo = lblChildPartNo.Text.Trim();

            int childQty, leastBatch, availableQty;

            if (!Int32.TryParse(txtChildQty.Text.Trim(), out childQty))
            {
                Label_Message.Text = $"子件（{childPartNo}）的數量格式錯誤，請輸入有效數字。";
                return;
            }

            Int32.TryParse(lblLeastBatch.Text.Trim(), out leastBatch);
            Int32.TryParse(lblAvailableQty.Text.Trim(), out availableQty);

            if (leastBatch <= 0) leastBatch = 1;

         
                AdjustByLeastBatchFromChild(parentPartNo);
         
            // 向上取整反推父件數量
            int newParentQty = (int)Math.Ceiling((double)childQty / leastBatch);

        }


    }
}
