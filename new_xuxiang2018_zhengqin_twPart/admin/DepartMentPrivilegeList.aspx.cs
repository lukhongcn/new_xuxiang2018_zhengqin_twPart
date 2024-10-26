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

using ModuleWorkFlow.business;
using ModuleWorkFlow.BLL;
using Utility;

namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for UserPrivilegeList.
    /// </summary>
    public class DepartMentPrivilegeList : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.Button btn_search;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.TextBox txt_departname_like;
        protected System.Web.UI.WebControls.Label lab_oldremerber;

        string menuid = "A63";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");
                bindData();
            }
            Label_Message.Text = "";
            string msg = Request.Params["msg"];
            if (msg != null && msg.Length > 0) Label_Message.Text = msg;
        }

        private void bindData()
        {
            MainDataGrid.DataSource = new ModuleWorkFlow.BLL.DepartMent().getDepartmentSearch(lab_oldremerber.Text.Trim());
            MainDataGrid.DataKeyField = "DepartMentId";

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
            this.btn_search.Click += new System.EventHandler(this.btn_search_Click);
            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;
            bindData();
        }

        private void btn_search_Click(object sender, System.EventArgs e)
        {
            lab_oldremerber.Text = txt_departname_like.Text.Trim();
            MainDataGrid.CurrentPageIndex = 0;
            bindData();

        }

        private string getKey()
        {
            string key = null;
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = MainDataGrid.DataKeys[item.ItemIndex].ToString();

                        break;
                    }
                }
            }

            return key;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            string key = getKey();
            if (key == null)
                Label_Message.Text = Translate.translateString("請選擇部門");
            else
                Response.Redirect("DepartPrivilegeAddEdit.aspx?menuid=" + menuid + "&func=edit&departid=" + key);
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            btn_search_Click(sender, e);
        }


    }
}
