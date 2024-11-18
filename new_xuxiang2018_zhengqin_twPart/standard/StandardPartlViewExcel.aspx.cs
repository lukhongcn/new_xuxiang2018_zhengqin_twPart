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


using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.Model;
using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkflow.OutSource.BLL.Interface;
using Utility;
using System.Collections.Generic;
using ModuleWorkFlow.BLL.StupidReport;
using ModuleWorkFlow.Model.StupidReport;
namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class StandardPartlViewExcel : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add_edit;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.DataGrid dg_error;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected Label lab_standprocesstype;



        protected System.Web.UI.WebControls.TextBox txt_content;
      

     
        private ModuleWorkFlow.BLL.User user;

        string menuid = "I02";
        protected string titlemenuname = "";

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    TmenuInfo mi = new Tmenu().findbykey(menuid);
                    if (this.Master != null && this.Master is DefaultSub)
                    {
                        DefaultSub master = (DefaultSub)this.Master;

                        master.Menuname = mi.Menuname;
                     
                        titlemenuname = mi.Menuname;
                    }



                }
            }

        }

        private void ClearView()
        {

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

          
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

  

       



      



       


        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {

            Response.Redirect($"StandardPartList.aspx?standprocesstype={lab_standprocesstype.Text}" );

        }

        protected void lnkbutton_addinput_Click(object sender, EventArgs e)
        {

            //string url = "BomDetailViewExcel.aspx?menuid=" + lab_menu.Text + "&StyleCustomer=" + lab_bomstyle.Text.Trim();
            //Response.Redirect(url);


        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            user = new ModuleWorkFlow.BLL.User();
            dg_error.Visible = false;

            List<PartStandProcessInfo> resultResult = new List<PartStandProcessInfo>();
            string[] lines = txt_content.Text.Substring(0, txt_content.Text.Length - 1).Split('\n');
            string reportName = "StandardPartlViewExcel";

            List<ReportReadErrorInfo> errorlist = new List<ReportReadErrorInfo>();
            errorlist = new LineToList().LinesToList(lines, reportName, resultResult);

            if (errorlist.Count > 0) {
                dg_error.Visible = true;
                dg_error.DataSource = errorlist;
                dg_error.DataBind();
                return;
            }

            PartStandProcess partStandProcess = new PartStandProcess();


            errorlist = partStandProcess.checkPartStandProcess(resultResult, new Process().getallProcessInfoExceptDesign());

            if (errorlist.Count > 0)
            {
                dg_error.Visible = true;
                dg_error.DataSource = errorlist;
                dg_error.DataBind();
                return;
            }

            IList source = new ArrayList();
            foreach (var stpi in resultResult)
            {
                stpi.ProcessNo = business.Methods.GenerateUniqueId();
                stpi.StandardProcessPartNo = stpi.StandardProcessName;
            }
            source.Add(partStandProcess.InsertStandProcess(resultResult));
            if (new Schedule().SaveSchedule(source))
            {
                lab_standprocesstype.Text = resultResult[0].StandardProcessType.ToString();
                Label_Message.Text = Lang.SAVE_SUCCESS;
            }else
            {
                Label_Message.Text = Lang.SAVE_FAIL;
            }

           
           

        }
    }
}