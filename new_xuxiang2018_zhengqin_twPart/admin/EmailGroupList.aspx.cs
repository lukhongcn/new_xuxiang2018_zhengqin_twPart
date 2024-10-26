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

namespace ModuleWorkFlow.admin
{
	/// <summary>
	/// Summary description for EmailGroupList.
	/// </summary>
	public class EmailGroupList : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid MainDataGrid;
		protected System.Web.UI.WebControls.DropDownList drp_emailgrouplist;
		protected System.Web.UI.WebControls.Label Label_Message;

		private string menuid = "A23";
        protected string menuname = "";
		private void Page_Load(object sender, System.EventArgs e)
		{
            menuname = new Tmenu().findbykey(menuid).Menuname;
			if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
			{
				if (!this.IsPostBack)
				{
                    bindEmailGroup();
					selectEmailGroup();
				}
			}
		}

        private void bindEmailGroup()
        {
            IList mailGroups = new ModuleWorkFlow.BLL.Alert.AlertReport().GetAlertReportInfos(null);
            drp_emailgrouplist.DataSource = mailGroups;
            drp_emailgrouplist.DataTextField = "reportDesc";
            drp_emailgrouplist.DataValueField = "id";
            drp_emailgrouplist.DataBind();

        }

		private void selectEmailGroup()
		{
			ModuleWorkFlow.BLL.Mail mail = new ModuleWorkFlow.BLL.Mail();
			MainDataGrid.DataSource = mail.getListMailInfo(Convert.ToInt32(drp_emailgrouplist.SelectedValue));
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
			this.drp_emailgrouplist.SelectedIndexChanged += new System.EventHandler(this.drp_emailgrouplist_SelectedIndexChanged);
			this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void drp_emailgrouplist_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			MainDataGrid.CurrentPageIndex=0;
			selectEmailGroup();
		}

		private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			MainDataGrid.CurrentPageIndex=e.NewPageIndex;
			selectEmailGroup();
		}

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmailGroupEdit.aspx?menuid=" + menuid);
        }
	}
}
