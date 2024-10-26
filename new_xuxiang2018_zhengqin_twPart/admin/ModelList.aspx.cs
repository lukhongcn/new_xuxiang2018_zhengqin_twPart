using System;
using System.Collections;

using System.Web.UI.WebControls;

using ModuleWorkFlow.BLL;
using Utility;

namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class ModelList : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.DataGrid dg_ModelList;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.TextBox txt_moldName;

        private ModuleWorkFlow.BLL.System.Model model;
        private string menuid = "A04";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            model = new ModuleWorkFlow.BLL.System.Model();
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    bindModelList();
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
            this.dg_ModelList.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_ModelList_PageIndexChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void bindModelList()
        {
            IList models = new ArrayList();
            if (txt_moldName.Text.Trim().Equals(""))
                models = model.GetModelInfos();
            else
                models = model.GetModelByNo(txt_moldName.Text.Trim());
            dg_ModelList.DataKeyField = "Id";
            dg_ModelList.DataSource = models;
            if (models.Count <= (dg_ModelList.CurrentPageIndex) * dg_ModelList.PageSize && dg_ModelList.CurrentPageIndex > 0)
            {
                dg_ModelList.CurrentPageIndex = dg_ModelList.CurrentPageIndex - 1;
            }

            dg_ModelList.DataBind();
        }

        protected void dg_ModelList_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_ModelList.CurrentPageIndex = e.NewPageIndex;
            bindModelList();
        }

        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_ModelList.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_ModelList.DataKeys[item.ItemIndex]);
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
                Label_Message.Text = Translate.translateString("請選擇機種");
                return;
            }

            Response.Redirect("ModelView.aspx?menuid=" + menuid + "&func=edit&id=" + key.ToString());
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                int key = getKey();
                if (key < 0)
                {
                    Label_Message.Text = Translate.translateString("請選擇機種");
                    return;
                }

                Label_Message.Text = model.deleteModel(Convert.ToInt32(key));
                dg_ModelList.CurrentPageIndex = 0;
                bindModelList();
            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "";
            bindModelList();
        }

        protected void dg_ModelList_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Label dg_lab_isVisible = e.Item.FindControl("dg_lab_isVisible") as Label;
                dg_lab_isVisible.Text = Translate.translateString(dg_lab_isVisible.Text);
            }
        }
    }
}