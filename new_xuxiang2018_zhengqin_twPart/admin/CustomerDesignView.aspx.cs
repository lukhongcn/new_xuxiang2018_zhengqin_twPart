using System;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using Utility;


namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class CustomerDesignView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add_edit;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label lab_CustomerId;
        protected System.Web.UI.WebControls.TextBox txt_CustomerId;
        protected System.Web.UI.WebControls.Label lab_CustomerName;
        protected System.Web.UI.WebControls.TextBox txt_CustomerName;
        protected System.Web.UI.WebControls.Label lab_Country;
        protected System.Web.UI.WebControls.Label lab_Regional;
        protected System.Web.UI.WebControls.Label lab_ForMan;
        protected System.Web.UI.WebControls.Label lab_Contacter;
        protected System.Web.UI.WebControls.Label lab_Gender;
        protected System.Web.UI.WebControls.Label lab_CompanyTel;
        protected System.Web.UI.WebControls.TextBox txt_CompanyTel;
        protected System.Web.UI.WebControls.Label lab_CompanyFax;
        protected System.Web.UI.WebControls.TextBox txt_CompanyFax;
        protected System.Web.UI.WebControls.Label lab_Email;
        protected System.Web.UI.WebControls.TextBox txt_Email;
        protected System.Web.UI.WebControls.Label lab_Ip;
        protected System.Web.UI.WebControls.TextBox txt_Ip;
        protected System.Web.UI.WebControls.Label lab_CompanyAddress;
        protected System.Web.UI.WebControls.TextBox txt_CompanyAddress;
        protected System.Web.UI.WebControls.Label lab_Remark;
        protected System.Web.UI.WebControls.TextBox txt_Remark;
        protected System.Web.UI.WebControls.DataGrid dg_CustomerDesign;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.WebControls.Label func;
        protected System.Web.UI.WebControls.TextBox txt_ForMan;
        protected System.Web.UI.WebControls.DropDownList dpl_Gender;
        protected System.Web.UI.WebControls.Label lab_contactName;
        protected System.Web.UI.WebControls.TextBox txt_contactName;
        protected System.Web.UI.WebControls.Label lab_contactPosition;
        protected System.Web.UI.WebControls.TextBox txt_contactPosition;
        protected System.Web.UI.WebControls.Label lab_contactMobileCell;
        protected System.Web.UI.WebControls.TextBox txt_contactMobileCell;
        protected System.Web.UI.WebControls.Label lab_contactFax;
        protected System.Web.UI.WebControls.TextBox txt_contactFax;
        protected System.Web.UI.WebControls.Label lab_contactTel;
        protected System.Web.UI.WebControls.TextBox txt_contactTel;
        protected System.Web.UI.WebControls.Label lab_contactEmail;
        protected System.Web.UI.WebControls.TextBox txt_contactEmail;
        protected System.Web.UI.WebControls.Label lab_contactComment;
        protected System.Web.UI.WebControls.TextBox txt_contactComment;
        protected System.Web.UI.WebControls.TextBox txt_customerLogin;
        protected System.Web.UI.WebControls.TextBox txt_customerPassword;
        protected System.Web.UI.WebControls.Button Btn_addContacter;
        protected System.Web.UI.WebControls.DataGrid dg_Contacter;

        private ModuleWorkFlow.BLL.System.CustomerDesign customerDesign;
        protected System.Web.UI.WebControls.TextBox txt_Contacter;
        protected System.Web.UI.WebControls.Label Label1;
        protected System.Web.UI.WebControls.Button Button1;

        private string menuid = "A03";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            customerDesign = new ModuleWorkFlow.BLL.System.CustomerDesign();
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {

                string id = Request.Params["id"];
                if (id != null)
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                    {
                        initialEdit(Convert.ToInt32(id));
                    }
                }
                else
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
                    {
                        ;
                    }
                }

            }
        }



        private void ClearView()
        {
            txt_CustomerId.Text = "";
            txt_CustomerName.Text = "";
            txt_CompanyTel.Text = "";
            txt_CompanyFax.Text = "";
            txt_Email.Text = "";
            txt_Ip.Text = "";
            txt_CompanyAddress.Text = "";
            txt_Remark.Text = "";
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
            this.Btn_addContacter.Click += new System.EventHandler(this.Btn_addContacter_Click);
            this.dg_Contacter.CancelCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_Contacter_CancelCommand);
            this.dg_Contacter.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_Contacter_EditCommand);
            this.dg_Contacter.UpdateCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_Contacter_UpdateCommand);
            this.dg_Contacter.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_Contacter_DeleteCommand);
            this.btn_add_edit.Click += new System.EventHandler(this.btn_add_edit_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void initialEdit(int id)
        {
            func.Text = "Edit";
            CustomerDesignInfo customerDesigninfo = new CustomerDesignInfo();
            lab_Id.Text = Convert.ToString(id);
            customerDesigninfo = customerDesign.findbykey(Convert.ToInt32(lab_Id.Text));
            if (customerDesigninfo != null)
            {

                txt_CustomerId.Text = customerDesigninfo.CustomerNumber;
                txt_CustomerId.ReadOnly = true;
                txt_CustomerName.Text = customerDesigninfo.CustomerName;


                try
                {
                    if (customerDesigninfo.ForMan != null && !customerDesigninfo.ForMan.Equals(""))
                    {
                        txt_ForMan.Text = customerDesigninfo.ForMan;
                    }
                }
                catch { }
                try
                {
                    if (customerDesigninfo.Contacter != null && !customerDesigninfo.Contacter.Equals(""))
                    {
                        txt_Contacter.Text = customerDesigninfo.Contacter;
                    }
                }
                catch { }
                try
                {
                    if (customerDesigninfo.Gender != null && !customerDesigninfo.Gender.Equals(""))
                    {
                        dpl_Gender.SelectedValue = customerDesigninfo.Gender;
                    }
                }
                catch { }
                txt_CompanyTel.Text = customerDesigninfo.CompanyTel;
                txt_CompanyFax.Text = customerDesigninfo.CompanyFax;
                txt_Email.Text = customerDesigninfo.Email;
                txt_Ip.Text = customerDesigninfo.Ip;
                txt_CompanyAddress.Text = customerDesigninfo.CompanyAddress;

                txt_Remark.Text = customerDesigninfo.Remark;
                txt_customerLogin.Text = customerDesigninfo.CustomerLogin;
                txt_customerPassword.Text = customerDesigninfo.CustomerPassword;

                Contacter contacter = new Contacter();
                dg_Contacter.DataSource = contacter.getContacterBySupplyCustomerId(Convert.ToInt32(lab_Id.Text), "customer");
                dg_Contacter.DataBind();
            }

        }

        private void btn_add_edit_Click(object sender, System.EventArgs e)
        {
            ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
            Contacter contacter = new Contacter();
            CustomerDesignInfo customerDesigninfo = new CustomerDesignInfo();


            if (txt_CustomerId.Text.Trim().Equals(""))
            {
                Label_Message.Text = lab_CustomerId.Text + Lang.NO_HAVE;
                return;
            }

            if (txt_CustomerName.Text.Trim().Equals(""))
            {
                Label_Message.Text = lab_CustomerName.Text + Lang.NO_HAVE;
                return;
            }
            customerDesigninfo.CustomerNumber = txt_CustomerId.Text;
            customerDesigninfo.CustomerName = txt_CustomerName.Text;
            string strForMan = user.getajaxTXTtoName(txt_ForMan.Text.Trim());
            if (strForMan.Equals(""))
            {
                Label_Message.Text = Translate.translateString("本公司負責人不存在，請重新輸入");
                return;
            }
            customerDesigninfo.ForMan = strForMan;
            customerDesigninfo.Contacter = txt_Contacter.Text;
            customerDesigninfo.Gender = dpl_Gender.SelectedValue;
            customerDesigninfo.CompanyTel = txt_CompanyTel.Text;
            customerDesigninfo.CompanyFax = txt_CompanyFax.Text;
            customerDesigninfo.Email = txt_Email.Text;
            customerDesigninfo.Ip = txt_Ip.Text;
            customerDesigninfo.CompanyAddress = txt_CompanyAddress.Text;
            customerDesigninfo.Remark = txt_Remark.Text;
            customerDesigninfo.CustomerLogin = txt_customerLogin.Text;
            customerDesigninfo.CustomerPassword = txt_customerPassword.Text;

            if (!func.Text.Equals("Edit"))
            {
                Label_Message.Text = customerDesign.insertCustomerDesign(customerDesigninfo);

                if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                {
                    Label_Message.Text = Lang.SAVE_SUCCESS;
                    if (contacter.insertContacter(dg_Contacter, "customer", txt_CustomerName.Text.Trim()))
                    {
                        Label_Message.Text = Lang.SAVE_SUCCESS;
                    }
                    else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                        return;
                    }
                }



            }
            else
            {
                customerDesigninfo.CustomerId = Convert.ToInt32(lab_Id.Text);

                Label_Message.Text = customerDesign.updateCustomerDesign(customerDesigninfo);
                if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                {
                    contacter.deleteConatctBySupplyCustomerId(customerDesigninfo.CustomerId, "customer");

                    if (contacter.insertContacter(dg_Contacter, "customer", txt_CustomerName.Text.Trim()))
                    {
                        string msg = Lang.SAVE_SUCCESS;
                        Response.Redirect("CustomerDesignList.aspx?msg=" + Server.UrlEncode(msg), true);
                    }
                    else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                    }

                }

            }

            if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
            {

                ClearView();
            }
        }

        private void clearContacterView()
        {
            txt_contactName.Text = "";
            txt_contactPosition.Text = "";
            txt_contactEmail.Text = "";
            txt_contactComment.Text = "";
            txt_contactFax.Text = "";
            txt_contactMobileCell.Text = "";
            txt_contactTel.Text = "";
        }

        private void Btn_addContacter_Click(object sender, System.EventArgs e)
        {
            if (txt_contactName.Text.Trim().Equals(""))
            {
                Label_Message.Text = lab_contactName.Text + Lang.NO_HAVE;
                return;
            }
            if (txt_contactTel.Text.Trim().Equals(""))
            {
                if (txt_contactMobileCell.Text.Trim().Equals(""))
                {

                    Label_Message.Text = lab_contactTel.Text + "," + lab_contactMobileCell.Text + Translate.translateString("必須輸入");
                    return;
                }
            }
            ContacterInfo contacterinfo = new ContacterInfo();
            contacterinfo.ContactName = txt_contactName.Text;
            contacterinfo.ContactPosition = txt_contactPosition.Text;
            contacterinfo.ContactMobileCell = txt_contactMobileCell.Text;
            contacterinfo.ContactFax = txt_contactFax.Text;
            contacterinfo.ContactTel = txt_contactTel.Text;
            contacterinfo.ContactEmail = txt_contactEmail.Text;
            contacterinfo.ContactComment = txt_contactComment.Text;

            bindContacter(contacterinfo);
            clearContacterView();
            Label_Message.Text = Lang.SAVE_SUCCESS;
        }

        private void bindContacter(ContacterInfo ci)
        {
            Contacter contacter = new Contacter();
            dg_Contacter.DataSource = contacter.GetContacterInfos(dg_Contacter, ci);
            dg_Contacter.DataKeyField = "Id";
            dg_Contacter.DataBind();

        }

        private void dg_Contacter_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dg_Contacter.EditItemIndex = e.Item.ItemIndex;
            bindContacter(null);

        }

        private void dg_Contacter_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dg_Contacter.EditItemIndex = -1;
            Contacter contacter = new Contacter();
            dg_Contacter.DataSource = contacter.GetUpdateContacterInfosSource(dg_Contacter, e.Item.ItemIndex);
            dg_Contacter.DataBind();
            Label_Message.Text = Lang.SAVE_SUCCESS;

        }

        private void dg_Contacter_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            dg_Contacter.EditItemIndex = -1;
            bindContacter(null);
        }

        private void dg_Contacter_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL");
            Contacter contacter = new Contacter();
            dg_Contacter.DataSource = contacter.GetDelContacterInfosSource(dg_Contacter, e.Item.ItemIndex);
            dg_Contacter.DataBind();
            Label_Message.Text = Lang.DELETE_SUCCESS;
        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            btn_add_edit_Click(sender, e);
        }
    }
}