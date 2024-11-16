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
using WorkFlow.BLL.Standard;

using ModuleWorkFlow.BLL.StupidReport;

namespace ModuleWorkFlow
{
	/// <summary>
	/// Summary description for ProductType.
	/// </summary>
    public class StandBomDetailList : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlTable Table1;
		protected System.Web.UI.WebControls.Label dg_bomDesignNo;
		private WorkFlow.BLL.Standard.StandBomDetail standBomDetail;
		protected ModuleWorkFlow.BLL.Inventory.ProductMaterialInventory promatl;
		protected ModuleWorkFlow.Model.Inventory.ProductMaterialInventoryInfo promatlinfo;
        private string menuid = "A021";
		protected System.Web.UI.WebControls.Label lab_print;
		protected System.Web.UI.WebControls.DataGrid Datagrid_bomdetail;
		protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.DropDownList dpl_standprocesstype;
        protected System.Web.UI.WebControls.DropDownList dpl_parentstandprocesstype;
        protected System.Web.UI.WebControls.Label lab_standprocesstype;
		protected System.Web.UI.WebControls.DataGrid Datagrid_print;

        protected string title;

        private void Page_Load(object sender, System.EventArgs e)
		{
			if (!this.IsPostBack)
			{
                TmenuInfo mi = new Tmenu().findbykey(menuid);
                if (mi != null)
                {
                    title = mi.Menuname;
                }

                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
                {
                    BindProcessType();
                    bindBomDetail();
                }
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
			
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void bindBomDetail()
		{
            int standprocessid = 0;
            if (!dpl_standprocesstype.SelectedValue.Equals(""))
                standprocessid = Convert.ToInt32(dpl_standprocesstype.SelectedValue);
            else
            {
                if (!dpl_parentstandprocesstype.SelectedValue.Equals(""))
                    standprocessid = Convert.ToInt32(dpl_parentstandprocesstype.SelectedValue);
            }

            standBomDetail = new StandBomDetail();
            Datagrid_bomdetail.DataSource = standBomDetail.GetBomDetailByStandprocesstype(standprocessid);
			Datagrid_bomdetail.DataKeyField = "Id";
			Datagrid_bomdetail.DataBind();
			Datagrid_bomdetail.Visible=true;
		}

        private void BindProcessType()
        {
           

            StandProcessType standprocesstype = new WorkFlow.BLL.Standard.StandProcessType();
            dpl_parentstandprocesstype.DataSource = standprocesstype.GetStandProcessType(true);
            dpl_parentstandprocesstype.DataTextField = "TypeName";
            dpl_parentstandprocesstype.DataValueField = "id";
            dpl_parentstandprocesstype.DataBind();

            if (!dpl_parentstandprocesstype.SelectedValue.Equals(""))
            {
                dpl_standprocesstype.DataSource = standprocesstype.GetStandProcessTypeByParentId(true, Convert.ToInt32(dpl_parentstandprocesstype.SelectedValue));
                dpl_standprocesstype.DataTextField = "TypeName";
                dpl_standprocesstype.DataValueField = "id";
                dpl_standprocesstype.DataBind();
                dpl_standprocesstype.Items.Insert(0, new ListItem("", ""));

            }
        }
						 
	

		protected void dg_BomDetail_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            Datagrid_bomdetail.CurrentPageIndex = e.NewPageIndex;
            bindBomDetail();
        }

		
		
		

		


		

		

		

	

        private int getChkedItemKey()
        {
            int keyvalue = -1;
            foreach (DataGridItem item in Datagrid_bomdetail.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        keyvalue = Convert.ToInt32(Datagrid_bomdetail.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }

            return keyvalue;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            int value = getChkedItemKey();
            if (value > -1)
            {
                string url = "StandBomDetailView.aspx?menuid=" + menuid + "&func=edit&id=" + value;
                Response.Redirect(url);
            }
            else
            {
                Label_Message.Text = "½Ð¿ï¾Ü©ú²Ó";
            }
        }

       

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                int value = getChkedItemKey();

                if (value > -1)
                {
                    standBomDetail = new StandBomDetail();
                    Label_Message.Text = standBomDetail.deleteStandBomDetail(value);
                    bindBomDetail();
                }
            }

        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            Datagrid_bomdetail.CurrentPageIndex = 0;
            bindBomDetail();
        }

        protected void dpl_standprocesstype_SelectedIndexChanged(object sender, EventArgs e)
        {
            Datagrid_bomdetail.CurrentPageIndex = 0;
            bindBomDetail();
        }

        protected void dpl_parentstandprocesstype_SelectedIndexChanged(object sender, EventArgs e)
        {
            StandProcessType standprocesstype = new WorkFlow.BLL.Standard.StandProcessType();
            if (!dpl_parentstandprocesstype.SelectedValue.Equals(""))
            {
                dpl_standprocesstype.DataSource = standprocesstype.GetStandProcessTypeByParentId(true, Convert.ToInt32(dpl_parentstandprocesstype.SelectedValue));
                dpl_standprocesstype.DataTextField = "TypeName";
                dpl_standprocesstype.DataValueField = "id";
                dpl_standprocesstype.DataBind();
                dpl_standprocesstype.Items.Insert(0, new ListItem("", ""));
                Datagrid_bomdetail.CurrentPageIndex = 0;
                bindBomDetail();
            }
        }

       
	}
}