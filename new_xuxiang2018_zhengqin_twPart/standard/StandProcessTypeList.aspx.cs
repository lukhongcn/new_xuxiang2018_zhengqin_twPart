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
using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;
using ModuleWorkFlow.WebView;
using ModuleWorkFlow.BLL.Inventory;
using ModuleWorkFlow.BLL;
using Utility;
using ModuleWorkFlow.Model;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for WebForm1.
    /// </summary>
    public class StandProcessTypeList : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_StatusMsg;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Panel pan_treeview;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        private string menuid = "A02";
        private StandProcessType standprocessType;
        private int parentId = 0;
        protected System.Web.UI.WebControls.CustomValidator cv_department;
        private string parentName = null;
        protected string menuname = "";
       
        private void Page_Load(object sender, System.EventArgs e)
        {
           
            standprocessType = new StandProcessType();
            if (!this.IsPostBack)
            {
                Tmenu menu = new Tmenu();
                TmenuInfo mi = menu.findbykey(menuid);
                if (this.Master != null && this.Master is DefaultSub)
                {
                    DefaultSub master = (DefaultSub)this.Master;

                    master.Menuname = mi.Menuname;
                    menuname = mi.Menuname;
                }

                if (Request.QueryString["id"] != null)
                {
                    parentId = Convert.ToInt16(Request.QueryString["id"]);
                    parentName = Request.QueryString["typeName"];
                }
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    bind();
                }


            }
        }
        private void bind()
        {
            IList standProcessTypes;
            if (parentId == 0)
            {
                standProcessTypes = standprocessType.GetStandProcessType(true);
            }
            else
            {
                standProcessTypes = standprocessType.GetStandProcessTypeByParentId(true, parentId);
            }

            MainDataGrid.DataSource = standProcessTypes;
            MainDataGrid.DataKeyField = "Id";
            MainDataGrid.DataBind();






            pan_treeview.Controls.Add(new StandProcessTypeWebView().StandProcessTypeTree());
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
            int id = getKey();
            if (id < 0)
            {
                Label_Message.Text = Utility.Translate.translateString("請選擇類型");
                return;
            }

            StandProcessTypeInfo spti = standprocessType.FindProcessTypeId(id);
            if (spti == null)
            {
                Label_Message.Text = Utility.Translate.translateString("類型已刪除");
                return;
            }

            Response.Redirect("StandProcessTypeView.aspx?menuid=" + menuid + "&standid=" + spti.Id.ToString() + "&parentId=" + spti.ParentId.ToString() + "&TypeName=" + spti.TypeName);
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                int id = getKey();
                if (id < 0)
                {
                    Label_Message.Text = Utility.Translate.translateString("請選擇類型");
                    return;
                }
                StandProcessTypeInfo spti = new StandProcessTypeInfo();
                spti.Id = id;
                spti.IsProductType = true;
                Label_Message.Text = standprocessType.DeleteStandProcessType(spti);
                bind();
            }
        }

        protected void MainDataGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            bind();
        }






    }
}
