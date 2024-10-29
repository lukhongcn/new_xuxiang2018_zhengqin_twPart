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
using System.Configuration;
using System.Security.Policy;
using System.Reflection;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.Alert;
using Utility;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for ProjectList.
    /// </summary>
    public class ProjectList : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.TextBox TextBox_key;
        protected System.Web.UI.WebControls.Button btn_print;
        protected System.Web.UI.WebControls.Label Label_Message;
       
        
       
        protected string menuname;
        private string menuid = "F37";

        private void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            TmenuInfo mi = new Tmenu().findbykey(menuid);
            menuname = mi.Menuname;
            if (!this.IsPostBack)
            {

                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");

              

                if (Request.Params["projectid"] != null)
                {
                    string projectid = Request.Params["projectid"].ToString();
                    bindDataProjectByProjectId(projectid);
                }
                else
                {
                    bindDataProjectByCondition(TextBox_key.Text.Trim());
                }

                string EC = System.Configuration.ConfigurationSettings.AppSettings["ECNO"];
                if (EC != null)
                {
                    MainDataGrid.Columns[5].Visible = true;
                }
                else
                {
                    MainDataGrid.Columns[5].Visible = false;
                }

            }



            Label_Message.Text = "";
            string msg = Request.Params["msg"];
            if (msg != null && msg.Length > 0) Label_Message.Text = msg;
        }

      

        private void bindDataProject()
        {
            ModuleWorkFlow.BLL.Project p = new ModuleWorkFlow.BLL.Project();
            MainDataGrid.DataSource = p.GetProject();
            MainDataGrid.DataKeyField = "projectid";
            MainDataGrid.DataBind();
        }

        private void bindDataProjectByProjectId(string projectid)
        {
            ArrayList ipi = new ArrayList();
            ModuleWorkFlow.BLL.Project p = new ModuleWorkFlow.BLL.Project();
            ProjectInfo pi = p.GetProjectByProjectId(Convert.ToInt32(projectid));
            if (pi != null) ipi.Add(pi);

            MainDataGrid.DataSource = ipi;
            MainDataGrid.DataKeyField = "projectid";
            MainDataGrid.DataBind();
        }

        private void bindDataProjectByCondition(string key)
        {
            DateTime dt = DateTime.MinValue;
            DateTime dtstart = dt;
            DateTime dtend = dt;
            
            ModuleWorkFlow.BLL.Project p = new ModuleWorkFlow.BLL.Project();
            string producttpeid = "0";
           
            string customernid = "0";
           

            int ModelId = 0;
           


            DateTime createdate = new DateTime();
            DateTime endCreatedate = new DateTime();
           
            MainDataGrid.DataSource = p.GetProjectByCondition(key, dtstart, dtend, 0, "0", producttpeid, customernid, createdate, endCreatedate, ModelId);
            MainDataGrid.DataKeyField = "projectid";
            MainDataGrid.DataBind();
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
           
            //this.MainDataGrid.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.MainDataGrid_ItemCommand);
            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion



        //private void MainDataGrid_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        //{
        //    switch (((LinkButton)e.CommandSource).CommandName)
        //    {

        //        case "OpenExcel":
        //            int projectid = Convert.ToInt32(MainDataGrid.DataKeys[e.Item.ItemIndex]);
        //            ModuleWorkFlow.Model.ControlPathInfo cpathinfo = new ModuleWorkFlow.BLL.ControlPath().GetControlPathByNo("ProjectReport", System.Configuration.ConfigurationSettings.AppSettings["ControlName"]);
        //            if (cpathinfo == null)
        //            {
        //                cpathinfo = new ModuleWorkFlow.BLL.ControlPath().GetControlPathByNo("ProjectReport", "public");
        //            }
        //            ModuleWorkFlow.report.Report r = new ModuleWorkFlow.report.Report();


        //            string filename = r.CreateProjectReport(projectid);
        //            Label_Message.Text = "<a href='excel/project/" + filename + "'>打開EXCEL表</a>";
        //            break;
        //        case "OpenSchedule":
        //            string modifymoduleid = e.Item.Cells[2].Text.Trim();

        //            //ModuleWorkFlow.report.Report r = new ModuleWorkFlow.report.Report();

        //            ModuleWorkFlow.report.partReport pr = new ModuleWorkFlow.report.partReport();
        //            filename = pr.CreateSmallScheduleReportByModuleId(modifymoduleid, "");
        //            Label_Message.Text = "<a href='excel/project/" + filename + "'>打開修模排程表</a>";
        //            break;

        //        default:
        //            // Do nothing.
        //            break;

        //    }
        //}



       
        protected void chkall_onchanged(object sender, System.EventArgs e)
        {
            CheckBox checkall = (CheckBox)sender;
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox chk = (CheckBox)MainDataGrid.Items[i].FindControl("chk_datagrid");
                chk.Checked = checkall.Checked;
            }
        }

        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;

            //if(!TextBox_key.Text.Trim().Equals(""))
            //{
            bindDataProjectByCondition(TextBox_key.Text.Trim());
            //}
            //else
            //{
            //    bindDataProject();
            //}
        }



        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(MainDataGrid.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }

            if (key < 0)
                Label_Message.Text = Translate.translateString("請選擇變更單");

            return key;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            int key = getKey();
            if (key > -1)
            {

                Response.Redirect("ProjectEdit.aspx?menuid=" + menuid + "&projectid=" + key.ToString());
            }

        }

        protected void lnkbutton_mail_Click(object sender, EventArgs e)
        {
            IList projects = new ArrayList();
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        ProjectInfo pi = new ProjectInfo();
                        Label lab_moduleid = item.FindControl("dg_lab_moduleid") as Label;
                        Label lab_modifyid = item.FindControl("dg_lab_modifyid") as Label;
                        Label lab_createdate = item.FindControl("dg_lab_createdate") as Label;
                        Label dg_lab_ProductEndDate = item.FindControl("dg_lab_ProductEndDate") as Label;
                        pi.MODULEID = lab_moduleid.Text;
                        pi.MODIFYID = lab_modifyid.Text;
                        pi.CREATEDATE = Convert.ToDateTime(lab_createdate.Text);
                        pi.ProductEndDate = Convert.ToDateTime(dg_lab_ProductEndDate.Text);

                        projects.Add(pi);

                    }
                }
            }

            if (projects.Count > 0)
            {
                SendAlert sa = new SendAlert();
                string msg = sa.sendAlert("ProjectNotice", projects, null);
                Label_Message.Text = msg;
            }

        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            int key = getKey();
            if (key > -1)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "viewProject('" + key + "')", true);
            }
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            int key = getKey();
            if (key > -1)
            {

                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
                {
                    ModuleWorkFlow.BLL.Project p = new Project();

                    Label_Message.Text = p.RemoveProject(key);

                    MainDataGrid.EditItemIndex = -1;
                    if (!TextBox_key.Text.Trim().Equals(""))
                    {
                        bindDataProjectByCondition(TextBox_key.Text.Trim());
                    }
                    else
                    {
                        bindDataProjectByCondition(TextBox_key.Text.Trim());
                    }
                }
            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            MainDataGrid.CurrentPageIndex = 0;
            try
            {
                bindDataProjectByCondition(TextBox_key.Text.Trim());
            }
            catch { }
        }

   


        #region
        public string CreateProjectModuleIdReportByDate(string key, DateTime dtstart, DateTime dtend, int OverDealt, string types, string producttype, string customerid, DateTime beginCreateDate, DateTime endCreateDate, int ModelId)
        {
            IList source = FillProjectModuleIdInfoByDate(key, dtstart, dtend, OverDealt, types, producttype, customerid, beginCreateDate, endCreateDate, ModelId);
            ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport report = new ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport();
            string outFileName = report.CreateReport("projectByMonth", source);

            return outFileName;
        }

        private IList FillProjectModuleIdInfoByDate(string key, DateTime dtstart, DateTime dtend, int OverDealt, string types, string producttype, string customerid, DateTime beginCreateDate, DateTime endCreateDate, int ModelId)
        {
            ModuleWorkFlow.BLL.Project p = new ModuleWorkFlow.BLL.Project();
            Projectsub ps = new Projectsub();
            string sub = "";
            IList ilist = new ArrayList();

            ilist = p.GetProjectByCondition(key, dtstart, dtend, OverDealt, types, producttype, customerid, beginCreateDate, endCreateDate, ModelId);

            //ModuleWorkFlow.BLL.System.Model model = new ModuleWorkFlow.BLL.System.Model();
            //foreach (ProjectInfo pi in ilist)
            //{

            //    if (pi.customerModuleId != null && !pi.customerModuleId.Trim().Equals(""))
            //    {
            //        ModelInfo mi = model.findbykey(Convert.ToInt32(pi.customerModuleId));
            //        if (mi != null)
            //        {
            //            pi.MoldName = mi.MoldName;
            //        }
            //    }

            //    IList ProjectSublist = ps.GetProjectSubByProjectId(pi.PROJECTID);
            //    sub = "";
            //    foreach (ProjectsubInfo psi in ProjectSublist)
            //    {
            //        string str = psi.QUESTION;
            //        if (str.Equals("&nbsp;"))
            //        {
            //            str = "";
            //        }
            //        sub += psi.SUBJECTID + "." + str + " ";
            //    }
            //    pi.SUBJECT = sub;


            //    sub = "";
            //    foreach (ProjectsubInfo psi in ProjectSublist)
            //    {
            //        string str = psi.RESOLVE;
            //        if (str.Equals("&nbsp;"))
            //        {
            //            str = "";
            //        }
            //        sub += psi.SUBJECTID + "." + str + " ";
            //    }
            //    pi.RESOLVE = sub;


            //    ModuleWorkFlow.BLL.PartProcess pps = new ModuleWorkFlow.BLL.PartProcess();
            //    IList list = pps.getPartProcessInfobypart(pi.MODIFYID.Trim());
            //    if (list.Count > 0)
            //    {
            //        System.Data.DataSet ds = Utility.tools.ListToDataSet(list);
            //        System.Data.DataTable dt = ds.Tables[0];
            //        string search = "";
            //        double all = 0;
            //        if (dt.Select(search).Length > 0)
            //        {
            //            all = Math.Round(Convert.ToDouble(dt.Compute("SUM(ProcessNeedMinutes)", search)) * 1.0 / 60, 2);
            //        }
            //        search = " statusid='Implementation' or statusid= 'XIAODAN' ";

            //        double endprocess = 0;
            //        if (dt.Select(search).Length > 0)
            //        {
            //            endprocess = Math.Round(Convert.ToDouble(dt.Compute("SUM(ProcessNeedMinutes)", search)) * 1.0 / 60, 2);
            //        }
            //        if (all != 0)
            //        {
            //            pi.strFinishedPercent = Convert.ToString(Math.Round(endprocess / all, 2) * 100) + "%";
            //        }
            //    }
            //    else
            //    {
            //        pi.strFinishedPercent = "0%";
            //    }


            //    if (pi.DutyDepartment > 0)
            //    {
            //        DepartMentInfo dmi = new DepartMent().GetDepartmentById(pi.DutyDepartment);
            //        pi.DepartName = dmi.DepartName;
            //    }


            //}

            return ilist;
        }

        #endregion

        //public class BomDetailListCustomerComparer : IComparer
        //{
        //    public int Compare(object x, object y)
        //    {
        //        string s1 = ((CustomerInfo)x).ChineseName;
        //        string s2 = ((CustomerInfo)y).ChineseName;

        //        return s1.CompareTo(s2);
        //    }
        //} // end of class

        //public class BomDetailListModuleComparer : IComparer
        //{
        //    public int Compare(object x, object y)
        //    {
        //        string s1 = ((ModelInfo)x).MoldName;
        //        string s2 = ((ModelInfo)y).MoldName;

        //        return s1.CompareTo(s2);
        //    }
        //} // end of class
    }
}
