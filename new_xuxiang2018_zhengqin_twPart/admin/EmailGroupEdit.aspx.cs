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
using ModuleWorkFlow.Model;
using Utility;

namespace ModuleWorkFlow.admin
{
	/// <summary>
	/// Summary description for EmailGroupEdit.
	/// </summary>
	public class EmailGroupEdit : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.CheckBoxList CheckBoxListUser;
		protected System.Web.UI.WebControls.Button ButtonInput;
		protected System.Web.UI.WebControls.Button ButtonOutput;
		protected System.Web.UI.WebControls.ListBox ListBoxSelectedUser;
		protected System.Web.UI.WebControls.Button Button_AddEdit;
		protected System.Web.UI.WebControls.DropDownList drp_emailgrouplist;
		protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.DropDownList dpl_department;

		private string menuid = "A23";
        protected string menuname = "";
		protected ArrayList emplSelected = new ArrayList();
	
		private void Page_Load(object sender, System.EventArgs e)
		{
            menuname = new Tmenu().findbykey(menuid).Menuname;
			if (!this.IsPostBack)
			{
                bindEmailGroup();
				selectEmailGroup();
                bindDepartMnet();
				bindDataUserList();
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

        private void bindDepartMnet()
        {
            ModuleWorkFlow.BLL.DepartMent department = new ModuleWorkFlow.BLL.DepartMent();
            IList li = department.GetAllDepartment();
            ModuleWorkFlow.Model.DepartMentInfo pi = new ModuleWorkFlow.Model.DepartMentInfo();
            pi.DepartmentName = Translate.translateString("全部");
            pi.DepartmentId = -1;
            if (li.Count > 0)
            {
                li.Insert(0, pi);
                dpl_department.DataSource = li;
                dpl_department.DataTextField = "DepartmentName";
                dpl_department.DataValueField = "DepartmentId";
                dpl_department.DataBind();
            }
        }

		private void bindDataUserList()
		{
			ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
			CheckBoxListUser.DataTextField = "name";
			CheckBoxListUser.DataValueField = "username";
            CheckBoxListUser.DataSource = user.getUserInfoByDepartment(Convert.ToInt32(dpl_department.SelectedValue));
			CheckBoxListUser.DataBind();
		}

		private void selectEmailGroup()
		{
			ModuleWorkFlow.BLL.Mail mail = new ModuleWorkFlow.BLL.Mail();
			ListBoxSelectedUser.DataTextField = "username";
			ListBoxSelectedUser.DataValueField = "userid";
			ListBoxSelectedUser.DataSource = mail.getListMailInfo(Convert.ToInt32(drp_emailgrouplist.SelectedValue));
			ListBoxSelectedUser.DataBind();
		}

		private void InitalEmplSelected()
		{
			emplSelected.Clear();
			for (int i=0;i<ListBoxSelectedUser.Items.Count;i++)
			{
				emplSelected.Add(ListBoxSelectedUser.Items[i].Value);
			}
		}

		private bool checkUserInput()
		{
			bool ret = true;
			if (ListBoxSelectedUser.Items.Count == 0)
			{
				ret = false;
				Label_Message.Text = Lang.TXT_EMAILGROUPEDIT_SelectUser;
			}

            if (drp_emailgrouplist.SelectedValue.Equals(""))
            {
                ret = false;
                Label_Message.Text = Translate.translateString("請選擇報表類型");
            }
			return ret;
		}

		private void save()
		{
			IList users = new ArrayList();
			int reportId	= Convert.ToInt32(drp_emailgrouplist.SelectedValue) ;
			string maildesc = drp_emailgrouplist.SelectedItem.Text ;

			for(int i=0;i<ListBoxSelectedUser.Items.Count;i++)
			{	
				string userid	= ListBoxSelectedUser.Items[i].Value ;
				string username = ListBoxSelectedUser.Items[i].Text ;
				EmailInfo ei = new EmailInfo();
                ei.MailId = reportId;
				ei.MailDesc = maildesc;
				ei.UserId = userid;
				ei.UserName = username;
                ei.ReportId = Convert.ToInt32(drp_emailgrouplist.SelectedValue);
				users.Add(ei);
			}

			ModuleWorkFlow.BLL.Mail mail = new ModuleWorkFlow.BLL.Mail();
            mail.deleteMailInfo(reportId);
			mail.insertMailInfo(users);
			Label_Message.Text = Lang.TXT_EDITSUCCESS;
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
			this.ButtonInput.Click += new System.EventHandler(this.ButtonInput_Click);
			this.ButtonOutput.Click += new System.EventHandler(this.ButtonOutput_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void ButtonInput_Click(object sender, System.EventArgs e)
		{
			InitalEmplSelected();
			for (int i=0;i<CheckBoxListUser.Items.Count;i++)
			{
				string emplid = CheckBoxListUser.Items[i].Value;
				if (emplSelected.IndexOf(emplid) == -1 && CheckBoxListUser.Items[i].Selected)
				{
					ListBoxSelectedUser.Items.Add(CheckBoxListUser.Items[i].Text);
					ListBoxSelectedUser.Items[ListBoxSelectedUser.Items.Count-1].Value = CheckBoxListUser.Items[i].Value;
				}
			}
		}

		private void ButtonOutput_Click(object sender, System.EventArgs e)
		{
			for(int i=0;i<ListBoxSelectedUser.Items.Count;i++)
			{
				if (ListBoxSelectedUser.Items[i].Selected)
				{
					ListBoxSelectedUser.Items.Remove(ListBoxSelectedUser.Items[i]);
					i--;
				}
			}
		}

        protected void dpl_department_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindDataUserList();
        }
	

		private void drp_emailgrouplist_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			selectEmailGroup();
		}

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
            {
                if (checkUserInput() == true)
                {
                    save();
                }
            }
        }
	}
}
