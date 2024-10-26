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


using ModuleWorkFlow.BLL.InventorySystem;
using ModuleWorkFlow.Model.InventorySystem;
using Utility;

namespace ModuleWorkFlow.adminInventory
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class MaterialCodeView : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.DropDownList dpl_productCodeTypeId;

        protected System.Web.UI.WebControls.Label lab_materialCodeNumber;


        protected System.Web.UI.WebControls.Label lab_name;
        protected System.Web.UI.WebControls.TextBox txt_name;
        protected System.Web.UI.WebControls.Label lab_abbr;
        protected System.Web.UI.WebControls.TextBox txt_abbr;
        protected System.Web.UI.WebControls.Label lab_length;
        protected System.Web.UI.WebControls.TextBox txt_length;
        protected System.Web.UI.WebControls.Label lab_width;
        protected System.Web.UI.WebControls.TextBox txt_width;
        protected System.Web.UI.WebControls.Label lab_height;
        protected System.Web.UI.WebControls.TextBox txt_height;
        protected System.Web.UI.WebControls.Label lab_spec;
        protected System.Web.UI.WebControls.TextBox txt_spec;
        protected System.Web.UI.WebControls.Label lab_mark;
        protected System.Web.UI.WebControls.TextBox txt_mark;
        protected System.Web.UI.WebControls.CheckBox check_isNoImport;

        protected System.Web.UI.WebControls.Label lab_material;
        protected System.Web.UI.WebControls.TextBox txt_material;
        protected System.Web.UI.WebControls.DataGrid dg_MaterialCode;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.WebControls.Label func;
        protected System.Web.UI.WebControls.Label name_add;
        protected System.Web.UI.WebControls.Label materialCodeNumber_add;
        protected System.Web.UI.WebControls.Label pageIndex_add;



        private ModuleWorkFlow.BLL.InventorySystem.MaterialCode materialCode;
        private string menuid = "A191";

        private void Page_Load(object sender, System.EventArgs e)
        {
            materialCode = new ModuleWorkFlow.BLL.InventorySystem.MaterialCode();
            if (!this.IsPostBack)
            {
                string id = Request.Params["id"];
                if (id != null)
                {
                    string name = Request.Params["name"];
                    string materialCodeNumber = Request.Params["materialCodeNumber"];
                    if (name != null && !name.Trim().Equals(""))
                    {
                        name_add.Text = name;
                    }
                    if (materialCodeNumber != null && !materialCodeNumber.Trim().Equals(""))
                    {
                        materialCodeNumber_add.Text = materialCodeNumber;
                    }
                    pageIndex_add.Text = Request.Params["pageIndex"];

                    initialEdit(Convert.ToInt32(id));


                }
                else
                {
                    string name = Request.Params["name"];
                    string materialCodeNumber = Request.Params["materialCodeNumber"];
                    if (name != null && !name.Trim().Equals(""))
                    {
                        name_add.Text = name;
                    }
                    if (materialCodeNumber != null && !materialCodeNumber.Trim().Equals(""))
                    {
                        materialCodeNumber_add.Text = materialCodeNumber;
                    }
                    pageIndex_add.Text = Request.Params["pageIndex"];
                }
                bindproductCodeTypeId();
            }


        }


        private void ClearView()
        {

            lab_materialCodeNumber.Text = "";
            txt_length.Text = "";
            txt_width.Text = "";
            txt_height.Text = "";
            txt_spec.Text = "";
            check_isNoImport.Checked = false;
            txt_material.Text = "";
            lab_Id.Text = "";
            func.Text = "";
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

        private void initialEdit(int id)
        {
            func.Text = "Edit";
            MaterialCodeInfo materialCodeinfo = new MaterialCodeInfo();
            lab_Id.Text = Convert.ToString(id);
            materialCodeinfo = materialCode.findbykey(Convert.ToInt32(lab_Id.Text));
            if (materialCodeinfo != null)
            {
                dpl_productCodeTypeId.SelectedValue = Convert.ToString(materialCodeinfo.ProductCodeTypeId);
                lab_materialCodeNumber.Text = materialCodeinfo.MaterialCodeNumber;
                txt_name.Text = materialCodeinfo.Name;
                txt_abbr.Text = materialCodeinfo.Abbr;
                txt_length.Text = Convert.ToString(materialCodeinfo.Length);
                txt_width.Text = Convert.ToString(materialCodeinfo.Width);
                txt_height.Text = Convert.ToString(materialCodeinfo.Height);
                txt_spec.Text = materialCodeinfo.Spec;
                txt_mark.Text = materialCodeinfo.Mark;
                if (materialCodeinfo.IsNoImport == 1)
                {
                    check_isNoImport.Checked = true;
                }

                txt_material.Text = materialCodeinfo.Material;
            }

        }


        private void bindproductCodeTypeId()
        {
            BLL.InventorySystem.ProductCodeType inventorySystem = new BLL.InventorySystem.ProductCodeType();
            dpl_productCodeTypeId.DataTextField = "name";
            dpl_productCodeTypeId.DataValueField = "id";
            dpl_productCodeTypeId.DataSource = inventorySystem.GetProductCodeTypeInfos(true);
            dpl_productCodeTypeId.DataBind();

        }

        protected void lnkbutton_edit_Click(object sender, System.EventArgs e)
        {
            MaterialCodeInfo materialCodeinfo = new MaterialCodeInfo();
            if (!dpl_productCodeTypeId.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    materialCodeinfo.ProductCodeTypeId = Convert.ToInt32(dpl_productCodeTypeId.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = dpl_productCodeTypeId.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                materialCodeinfo.ProductCodeTypeId = 0;
            }
            materialCodeinfo.MaterialCodeNumber = lab_materialCodeNumber.Text;
            materialCodeinfo.Name = txt_name.Text;
            materialCodeinfo.Abbr = txt_abbr.Text;
            if (!txt_length.Text.Trim().Equals(""))
            {
                try
                {
                    materialCodeinfo.Length = Convert.ToDecimal(txt_length.Text);
                }
                catch
                {
                    Label_Message.Text = txt_length.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
            }
            if (!txt_width.Text.Trim().Equals(""))
            {
                try
                {
                    materialCodeinfo.Width = Convert.ToDecimal(txt_width.Text);
                }
                catch
                {
                    Label_Message.Text = txt_width.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
            }
            if (!txt_height.Text.Trim().Equals(""))
            {
                try
                {
                    materialCodeinfo.Height = Convert.ToDecimal(txt_height.Text);
                }
                catch
                {
                    Label_Message.Text = txt_height.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
            }
            materialCodeinfo.Spec = txt_spec.Text;
            materialCodeinfo.Mark = txt_mark.Text;
            if (check_isNoImport.Checked)
            {

                materialCodeinfo.IsNoImport = 1;

            }
            else
            {
                materialCodeinfo.IsNoImport = 0;
            }
            materialCodeinfo.Material = txt_material.Text;
            if (!func.Text.Equals("Edit"))
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
                {
                    Label_Message.Text = materialCode.insertMaterialCode(materialCodeinfo);
                }




            }
            else
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                {
                    materialCodeinfo.Id = Convert.ToInt32(lab_Id.Text);
                    Label_Message.Text = materialCode.updateMaterialCode(materialCodeinfo);
                }


            }
            if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
            {
                ClearView();
            }

        }

        protected void lnkbutton_view_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("MaterialCodeList.aspx?name=" + name_add.Text + "&materialCodeNumber=" + materialCodeNumber_add.Text + "&pageIndex=" + pageIndex_add.Text);
        }

    }
}