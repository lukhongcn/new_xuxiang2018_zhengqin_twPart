using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.System;
using Utility;
using ModuleWorkFlow.BLL;

namespace ModuleWorkFlow.admin
{
    public partial class ModelView : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label lab_moldName;
        protected System.Web.UI.WebControls.TextBox txt_moldName;
        protected System.Web.UI.WebControls.Label lab_comment;
        protected System.Web.UI.WebControls.TextBox txt_comment;
        protected DropDownList dpl_customerId;
        protected System.Web.UI.WebControls.TextBox txt_customerId;
        protected System.Web.UI.WebControls.DataGrid dg_Model;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected CheckBox chk_isVisible;
        protected System.Web.UI.WebControls.Label func;


        private ModuleWorkFlow.BLL.System.Model model;
        private string menuid = "A04";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            model = new ModuleWorkFlow.BLL.System.Model();
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {
                bindCustomer();
                chk_isVisible.Checked = true;
                string id = Request.Params["id"];

                if (id != null)
                {
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                    initialEdit(Convert.ToInt32(id));
                }
                else
                {
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
                }
            }
        }

        private void bindCustomer()
        {
            dpl_customerId.DataSource = new CustomerDesign().GetCustomerDesignInfos();
            dpl_customerId.DataTextField = "customerName";
            dpl_customerId.DataValueField = "customerId";
            dpl_customerId.DataBind();
        }

        private void ClearView()
        {
            txt_moldName.Text = "";
            txt_comment.Text = "";
            lab_Id.Text = "";
            chk_isVisible.Checked = true;
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
            ModelInfo modelinfo = new ModelInfo();
            lab_Id.Text = Convert.ToString(id);
            modelinfo = model.findbykey(Convert.ToInt32(lab_Id.Text));
            if (modelinfo != null)
            {
                txt_moldName.Text = modelinfo.MoldName;
                txt_comment.Text = modelinfo.Comment;
               
                dpl_customerId.SelectedValue = Convert.ToString(modelinfo.CustomerId);
                chk_isVisible.Checked = Convert.ToBoolean(modelinfo.IsVisible);
            }

        }



        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            if (txt_moldName.Text.Trim().Equals(""))
            {
                Label_Message.Text = Translate.translateString("請輸入機種名稱");
                return;
            }

            if (dpl_customerId.SelectedValue.Equals(""))
            {
                Label_Message.Text = Translate.translateString("請選擇客戶");
                return;
            }




            ModelInfo modelinfo = new ModelInfo();
            modelinfo.MoldName = txt_moldName.Text.Trim();
            
            modelinfo.Comment = txt_comment.Text;
            modelinfo.CustomerId = Convert.ToInt32(dpl_customerId.SelectedValue);
            modelinfo.IsVisible = Convert.ToInt32(chk_isVisible.Checked);

            if (!func.Text.Equals("Edit"))
            {
                Label_Message.Text =Translate.translateString(model.insertModel(modelinfo));

            }
            else
            {
                modelinfo.Id = Convert.ToInt32(lab_Id.Text);
                Label_Message.Text =Translate.translateString(model.updateModel(modelinfo));
            }
            if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
            {
                ClearView();
            }

        }


    }
}