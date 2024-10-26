using System;

using System.Web.UI.WebControls;


using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using Utility;

namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for MaterialAddEdit.
    /// </summary>
    public class MaterialAddEdit : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_HiddenFuncMode;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
        protected System.Web.UI.WebControls.TextBox Textbox_Name;
        protected System.Web.UI.WebControls.Label Label_HiddenId;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.DropDownList DropDownList_TypeId;
        protected System.Web.UI.WebControls.RequiredFieldValidator Requiredfieldvalidator2;
        protected System.Web.UI.WebControls.TextBox txt_price;
        protected TextBox txt_abbr;
        protected System.Web.UI.WebControls.RegularExpressionValidator RegularExpressionValidator1;
        protected System.Web.UI.WebControls.TextBox txt_density;
        protected System.Web.UI.WebControls.RegularExpressionValidator Regularexpressionvalidator2;
        protected string menuname = "";
        private string menuid = "A17";

        private void Page_Load(object sender, System.EventArgs e)
        {
            menuname = new Tmenu().findbykey(menuid).Menuname;
            RequiredFieldValidator1.ErrorMessage = Translate.translateString("請輸入材料名稱");
            RegularExpressionValidator1.ErrorMessage = Translate.translateString("請輸入數字");
            Regularexpressionvalidator2.ErrorMessage = Translate.translateString("請輸入數字");
            if (!this.IsPostBack)
            {
                Label_Message.Text = "";

                string func = Request.Params["func"];
                bindType();
                if (func != null && func.Equals("edit"))
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                    {
                        //edit mode
                        string id = Request.Params["id"];
                        Label_HiddenId.Text = id;

                        Label_HiddenFuncMode.Text = "edit";
                        InitalEditPage(id);
                    }
                }
                else
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
                    {
                        //add mode					
                        Label_HiddenFuncMode.Text = "add";
                        InitalAddPage();
                    }
                }

            }
        }

        private void bindType()
        {
            ListItem item0 = new ListItem(Translate.translateString("零件材質"), "Part");
            DropDownList_TypeId.Items.Add(item0);
            ListItem item1 = new ListItem(Translate.translateString("最終成品材質"), "Production");
            DropDownList_TypeId.Items.Add(item1);

            DropDownList_TypeId.SelectedValue = "Part";
        }

        private void InitalAddPage()
        {
        }

        private void InitalEditPage(string id)
        {
            Material material = new Material();
            MaterialInfo materialInfo = material.GetMaterialInfo(Convert.ToInt32(id));
            if (materialInfo != null)
            {
                Textbox_Name.Text = materialInfo.Name;
                Textbox_Name.Enabled = false;
                txt_price.Text = materialInfo.Price.ToString();
                DropDownList_TypeId.SelectedValue = materialInfo.TypeId;
                txt_density.Text = materialInfo.Density.ToString();
                txt_abbr.Text = materialInfo.MaterialAbbr;

            }
            else
            {
                string msg = Lang.EditKeyError(id);
                Response.Redirect("MaterialList.aspx?menuid=" + menuid + "&msg=" + Server.UrlEncode(msg), true);
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

        private void Button_AddEdit_Click(object sender, System.EventArgs e)
        {
            if (Label_HiddenFuncMode.Text.Equals("add"))
            {
                Add();
            }
            else
            {
                Edit();
            }
        }

        private void Add()
        {
            bool success = true;
            string materialName = Textbox_Name.Text.Trim();
            Material material = new Material();
            MaterialInfo materialInfo = new MaterialInfo();
            materialInfo.Id = -1;
            materialInfo.Name = materialName;
            materialInfo.TypeId = DropDownList_TypeId.SelectedValue;

            materialInfo.Price = tools.ConvertDouble(txt_price.Text);
            materialInfo.Density = tools.ConvertDouble(txt_density.Text);
            materialInfo.MaterialAbbr = txt_abbr.Text.Trim();


            if (materialInfo.Price == -99999999 || materialInfo.Density == -99999999 || materialInfo.Rcljg == -99999999 || materialInfo.Mxjg == -99999999)
            {
                success = false;
                Label_Message.Text = Lang.DENSITY_INPUT_NUMBER;

            }





            if (success)
            {
                if (!material.IsDuplicateKey(materialInfo))
                {
                    if (material.AddMaterial(materialInfo))
                    {
                        Label_Message.Text = Lang.TXT_ADDSUCCESS;
                    }
                    else
                    {
                        Label_Message.Text = Lang.TXT_OPERATIONERROR;
                    }
                }
                else
                {
                    Label_Message.Text = Lang.DuplicateKeys(materialName);
                }
            }
        }

        private void Edit()
        {
            bool success = true;
            string msg = "";
            string materialName = Textbox_Name.Text.Trim();
            Material material = new Material();
            MaterialInfo materialInfo = new MaterialInfo();
            materialInfo.Id = Convert.ToInt32(Label_HiddenId.Text);
            materialInfo.Name = materialName;
            materialInfo.TypeId = DropDownList_TypeId.SelectedValue;

            materialInfo.Price = tools.ConvertDouble(txt_price.Text);
            materialInfo.Density = tools.ConvertDouble(txt_density.Text);
            materialInfo.MaterialAbbr = txt_abbr.Text.Trim();


            if (materialInfo.Price == -99999999 || materialInfo.Density == -99999999 || materialInfo.Rcljg == -99999999 || materialInfo.Mxjg == -99999999)
            {
                success = false;
                Label_Message.Text = Lang.DENSITY_INPUT_NUMBER;

            }


            if (success)
            {
                if (!material.IsDuplicateKey(materialInfo))
                {
                    if (material.UpdateMaterial(materialInfo))
                    {
                        msg = Lang.TXT_EDITSUCCESS;
                        Response.Redirect("MaterialList.aspx?msg=" + Server.UrlEncode(msg));
                    }
                    else
                    {
                        msg = Lang.TXT_OPERATIONERROR;

                    }
                }
                else
                {
                    msg = Lang.DuplicateKeys(materialName);
                }
            }

            Label_Message.Text = msg;
        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            Button_AddEdit_Click(sender, e);
        }
    }
}
