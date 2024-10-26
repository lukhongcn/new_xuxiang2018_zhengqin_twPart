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
	/// Summary description for MaterialList.
	/// </summary>
	public class MaterialList : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid MainDataGrid;
		protected System.Web.UI.WebControls.Label Label_Message;
		protected System.Web.UI.WebControls.Label lab_materialname; 
		protected System.Web.UI.WebControls.Label lab_namesearch;
		protected System.Web.UI.WebControls.TextBox txt_materialname;
		private string menuid = "A17";
        protected string menuname = "";
		private void Page_Load(object sender, System.EventArgs e)
		{
			if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
			{
                menuname = new Tmenu().findbykey(menuid).Menuname;
				if (!this.IsPostBack)
				{
					lab_namesearch.Text="";
					bindData();
				}
				Label_Message.Text="";
				string msg = Request.Params["msg"];
				if (msg != null && msg.Length > 0) Label_Message.Text = msg;
			}
		}

		private void bindData()
		{	
			Material material = new Material();
			if(lab_namesearch.Text.Trim().Equals(""))
			{
				MainDataGrid.DataSource=material.GetAllMaterial();
			}
			else
			{
				MainDataGrid.DataSource=material.getMaterialLikeName(lab_namesearch.Text.Trim());
			}
			MainDataGrid.DataKeyField="id";
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
			this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			MainDataGrid.CurrentPageIndex=e.NewPageIndex;
			bindData();
		}

		

		

		

		private void btn_materialnameSearch_Click(object sender, System.EventArgs e)
		{
			MainDataGrid.CurrentPageIndex=0;
			lab_namesearch.Text=txt_materialname.Text.Trim();
			bindData();
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
            return key;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            int key = getKey();
            if (key < 0)
            {
                Label_Message.Text = Translate.translateString("請選擇材質");
                return;
            }

            Response.Redirect("MaterialAddEdit.aspx?func=edit&id=" + key.ToString() + "&menuid=" + menuid);
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                int key = getKey();
                if (key < 0)
                {
                    Label_Message.Text = Translate.translateString("請選擇材質");
                    return;
                }
                Material material = new Material();
                Label_Message.Text = Translate.translateString(material.RemoveMaterial(key));
                MainDataGrid.CurrentPageIndex = 0;
                bindData();
            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            btn_materialnameSearch_Click(sender, e);
        }
	}
}

