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
using ModuleWorkFlow.BLL.InventorySystem;
using ModuleWorkFlow.Model.InventorySystem;


namespace ModuleWorkFlow.adminInventory
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class MaterialCodeList : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.DataGrid dg_MaterialCodeList;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.TextBox txt_name;
        protected System.Web.UI.WebControls.TextBox txt_lab_materialCodeNumber;


        private ModuleWorkFlow.BLL.InventorySystem.MaterialCode materialCode;
        private string menuid = "A191";

        private void Page_Load(object sender, System.EventArgs e)
        {
            materialCode = new ModuleWorkFlow.BLL.InventorySystem.MaterialCode();
            if (!this.IsPostBack)
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    if (!this.IsPostBack)
                    {
                        int currentpage = 0;
                        txt_name.Text = Request.Params["name"];
                        txt_lab_materialCodeNumber.Text = Request.Params["materialCodeNumber"];
                        if (Request.Params["pageIndex"] != null)
                        {
                            currentpage = Convert.ToInt32(Request.Params["pageIndex"]);
                        }
                        bindMaterialCode(currentpage);
                    }

                    bindMaterialCode(0);
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
            this.dg_MaterialCodeList.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.dg_MaterialCodeList_ItemDataBound);
            this.dg_MaterialCodeList.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_MaterialCodeList_PageIndexChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void bindMaterialCode(int currentPage)
        {
            IList allsource = materialCode.GetMaterialCodeInfos(txt_name.Text.Trim(), txt_lab_materialCodeNumber.Text.Trim());
            dg_MaterialCodeList.CurrentPageIndex = currentPage;
            if (dg_MaterialCodeList.CurrentPageIndex > allsource.Count / dg_MaterialCodeList.PageSize)
            {
                dg_MaterialCodeList.CurrentPageIndex = allsource.Count / dg_MaterialCodeList.PageSize;
            }
            IList details = materialCode.GetPageInInventoryDetailInfos(dg_MaterialCodeList.CurrentPageIndex, dg_MaterialCodeList.PageSize, allsource);
            dg_MaterialCodeList.VirtualItemCount = allsource.Count;

            dg_MaterialCodeList.DataSource = details;
            dg_MaterialCodeList.DataKeyField = "Id";
            dg_MaterialCodeList.DataBind();
        }

        protected void dg_MaterialCodeList_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_MaterialCodeList.CurrentPageIndex = e.NewPageIndex;
            bindMaterialCode(dg_MaterialCodeList.CurrentPageIndex);
        }



        private void dg_MaterialCodeList_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            bindMaterialCode(0);
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            string name = "";
            string materialCodeNumber = "";
            if (txt_name.Text.Trim() != null && !txt_name.Text.Trim().Equals(""))
            {
                name = txt_name.Text.Trim();
            }

            if (txt_lab_materialCodeNumber.Text.Trim() != null && !txt_lab_materialCodeNumber.Text.Trim().Equals(""))
            {
                materialCodeNumber = txt_lab_materialCodeNumber.Text.Trim();
            }

            Response.Redirect("MaterialCodeView.aspx?name=" + name + "&materialCodeNumber=" + materialCodeNumber + "&pageIndex=" + dg_MaterialCodeList.CurrentPageIndex.ToString());
        }



        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            string name = "";
            string materialCodeNumber = "";
            if (txt_name.Text.Trim() != null && !txt_name.Text.Trim().Equals(""))
            {
                name = txt_name.Text.Trim();
            }

            if (txt_lab_materialCodeNumber.Text.Trim() != null && !txt_lab_materialCodeNumber.Text.Trim().Equals(""))
            {
                materialCodeNumber = txt_lab_materialCodeNumber.Text.Trim();
            }

            int key = getKey();
            if (key > -1)
            {

                Response.Redirect("MaterialCodeView.aspx?id=" + key.ToString() + "&name=" + name + "&materialCodeNumber=" + materialCodeNumber + "&pageIndex=" + dg_MaterialCodeList.CurrentPageIndex.ToString());
            }

        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {

                int key = getKey();
                if (key < 0)
                {
                    Label_Message.Text = "請選擇***";
                    return;
                }
                else
                {
                    MaterialCodeInfo materialcodeinfo = new MaterialCodeInfo();

                    materialcodeinfo.Id = key;
                    if (materialCode.deleteMaterialCode(materialcodeinfo.Id))
                    {
                        Label_Message.Text = Lang.SAVE_SUCCESS;
                    }
                    else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                    }


                    bindMaterialCode(dg_MaterialCodeList.CurrentPageIndex);

                }
            }
        }

        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_MaterialCodeList.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_MaterialCodeList.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }

            return key;
        }
    }

}