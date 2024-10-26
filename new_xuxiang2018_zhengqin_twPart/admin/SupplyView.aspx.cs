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

using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.Config;
using ModuleWorkFlow.BLL.InventorySystem;
using ModuleWorkFlow.Model.InventorySystem;
using Utility;
using ModuleWorkFlow.WebView;

namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for supplyview.
    /// </summary>
    public class supplyview : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.TextBox txt_supplierId;
        protected System.Web.UI.WebControls.Label lab_supplierName;
        protected System.Web.UI.WebControls.TextBox txt_supplierName;
        protected System.Web.UI.WebControls.Label lab_invoiceTitle;
        protected System.Web.UI.WebControls.TextBox txt_invoiceTitle;
        protected System.Web.UI.WebControls.Label lab_unityNo;
        protected System.Web.UI.WebControls.TextBox txt_unityNo;
        protected System.Web.UI.WebControls.Label lab_factoryRegisterNo;
        protected System.Web.UI.WebControls.TextBox txt_factoryRegisterNo;
        protected System.Web.UI.WebControls.Label lab_salesRegisterNo;
        protected System.Web.UI.WebControls.TextBox txt_salesRegisterNo;
        protected System.Web.UI.WebControls.Label lab_companyTel;
        protected System.Web.UI.WebControls.TextBox txt_companyTel;
        protected System.Web.UI.WebControls.Label lab_englistFullName;
        protected System.Web.UI.WebControls.TextBox txt_englistFullName;
        protected System.Web.UI.WebControls.Label lab_foundType;
        protected System.Web.UI.WebControls.TextBox txt_foundType;
        protected System.Web.UI.WebControls.Label lab_responsibility;
        protected System.Web.UI.WebControls.Label lab_conatcted;
        protected System.Web.UI.WebControls.Label lab_grender;
        protected System.Web.UI.WebControls.Label lab_extNo;
        protected System.Web.UI.WebControls.TextBox txt_extNo;
        protected System.Web.UI.WebControls.Label lab_mobile;
        protected System.Web.UI.WebControls.TextBox txt_mobile;
        protected System.Web.UI.WebControls.Label lab_companyFax;
        protected System.Web.UI.WebControls.TextBox txt_companyFax;
        protected System.Web.UI.WebControls.Label lab_email;
        protected System.Web.UI.WebControls.TextBox txt_email;
        protected System.Web.UI.WebControls.Label lab_companyAddress;
        protected System.Web.UI.WebControls.TextBox txt_companyAddress;
        protected System.Web.UI.WebControls.Label lab_zip;
        protected System.Web.UI.WebControls.TextBox txt_zip;
        protected System.Web.UI.WebControls.Label lab_factoryAddress;
        protected System.Web.UI.WebControls.TextBox txt_factoryAddress;
        protected System.Web.UI.WebControls.Label lab_factoryTel;
        protected System.Web.UI.WebControls.TextBox txt_factoryTel;
        protected System.Web.UI.WebControls.Label lab_comment;
        protected System.Web.UI.WebControls.TextBox txt_comment;
        protected System.Web.UI.WebControls.Label lab_moneyTypeId;
        protected System.Web.UI.WebControls.Label lab_faxId;
        protected System.Web.UI.WebControls.Label lab_tradeCondittionId;
        protected System.Web.UI.WebControls.Label lab_transferId;
        protected System.Web.UI.WebControls.Label lab_paymentId;
        protected System.Web.UI.WebControls.Label func;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
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
        //		protected System.Web.UI.WebControls.Label;
        protected System.Web.UI.WebControls.Label lab_supplierId;
        protected System.Web.UI.WebControls.DropDownList dpl_responsibility;
        protected System.Web.UI.WebControls.DropDownList dpl_grender;
        protected Label lab_factorytype;
        protected Label lab_title;
        protected System.Web.UI.WebControls.TextBox txt_ExtraLength;
        protected System.Web.UI.WebControls.TextBox txt_ExtraWeight;
        protected System.Web.UI.WebControls.TextBox txt_ExtraHeight;
        protected System.Web.UI.WebControls.TreeView treeview;
        protected Label lab_parentid;


        //for inventory
        protected Table tb_productCodeType;
        protected DropDownList dpl_productCodeType;
        protected Button btn_productCodeRela_submit;
        protected DataGrid dg_productCodeRela;
        protected Label lab_productCodeTypeRela_Id;

        private ModuleWorkFlow.BLL.System.Supply supply;
        protected System.Web.UI.WebControls.TextBox txt_conatcted;
        private string menuid = "D45";
        private void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            supply = new ModuleWorkFlow.BLL.System.Supply();
            if (!this.IsPostBack)
            {
                string id = Request.Params["id"];
                if (Request.Params["factoryType"] != null)
                {
                    lab_factorytype.Text = Request.Params["factoryType"];
                }

                if (!lab_factorytype.Text.Equals(""))
                {

                    if (lab_factorytype.Text.Equals("try"))
                    {
                        menuid = "D4501";
                        lab_title.Text = "試模廠設定";
                    }

                    if (lab_factorytype.Text.Equals("product"))
                    {
                        menuid = "D4502";
                        lab_title.Text = "量產廠設定";
                    }
                }
                else
                {
                    lab_factorytype.Text = "";
                    lab_title.Text = "供應商設定";
                    if (new SysConfig().hasInventory())
                    {
                        tb_productCodeType.Visible = true;

                    }
                    else
                    {
                        tb_productCodeType.Visible = false;
                    }
                }


                if (id != null)
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                    {
                        bindDrop();
                        bindmaterialtype(0);
                        new ProductCodeTypeWebView().ProductCodeTypeTree(0, treeview);
                        btn_productCodeRela_submit.Enabled = true;
                        initialEdit(Convert.ToInt32(id));
                    }
                }
                else
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
                    {
                        bindDrop();
                        bindmaterialtype(0);
                        new ProductCodeTypeWebView().ProductCodeTypeTree(0, treeview);
                        btn_productCodeRela_submit.Enabled = false;
                    }
                }
            }
        }

        private void bindDrop()
        {
            ModuleWorkFlow.BLL.User user = new ModuleWorkFlow.BLL.User();
            dpl_responsibility.DataSource = user.getListUserInfo();
            dpl_responsibility.DataTextField = "Name";
            dpl_responsibility.DataValueField = "Name";
            dpl_responsibility.DataBind();

            //dpl_productCodeType.DataSource = new ProductCodeType().GetProductCodeTypeInfos(true);
            //dpl_productCodeType.DataTextField = "Name";
            //dpl_productCodeType.DataValueField = "Id";
            //dpl_productCodeType.DataBind();			

        }

        private void bindmaterialtype(int parentid)
        {
            ProductCodeTypeInfo pcti = new ProductCodeTypeInfo();
            ProductCodeType pct = new ProductCodeType(true);
            ArrayList source = new ArrayList();
            ArrayList list = new ArrayList();
            pcti = pct.findbykey(parentid);
            if (pcti != null)
            {
                pcti.Name = "　" + pcti.Name;
                source.Add(pcti);
            }

            list = pct.GetAllProductCodeTypeInfosByParent(parentid, list);
            if (list != null)
            {
                foreach (ProductCodeTypeInfo pctifo in list)
                {
                    pctifo.Name = "　　" + pctifo.Name;
                    source.Add(pctifo);
                }
            }

            pcti = new ProductCodeTypeInfo();
            pcti.Name = "所有類型";
            pcti.Id = 0;
            source.Insert(0, pcti);

            dpl_productCodeType.DataSource = source;
            dpl_productCodeType.DataTextField = "Name";
            dpl_productCodeType.DataValueField = "Id";
            dpl_productCodeType.DataBind();
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
            //this.Btn_addContacter.Click += new System.EventHandler(this.Btn_addContacter_Click);
            //this.btn_add_edit.Click += new System.EventHandler(this.btn_add_edit_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void initialEdit(int id)
        {
            func.Text = "Edit";
            SupplyInfo supplyinfo = new SupplyInfo();
            lab_Id.Text = Convert.ToString(id);
            supplyinfo = supply.findbykey(Convert.ToInt32(lab_Id.Text));
            if (supplyinfo != null)
            {
                txt_supplierId.Text = supplyinfo.SupplierId;
                txt_supplierName.Text = supplyinfo.SupplierName;
                txt_invoiceTitle.Text = supplyinfo.InvoiceTitle;
                txt_unityNo.Text = supplyinfo.UnityNo;
                txt_factoryRegisterNo.Text = supplyinfo.FactoryRegisterNo;
                txt_salesRegisterNo.Text = supplyinfo.SalesRegisterNo;
                txt_companyTel.Text = supplyinfo.CompanyTel;
                txt_englistFullName.Text = supplyinfo.EnglistFullName;
                txt_foundType.Text = supplyinfo.FoundType;
                dpl_responsibility.SelectedValue = supplyinfo.Responsibility;
                txt_conatcted.Text = supplyinfo.Conatcted;
                dpl_grender.SelectedValue = supplyinfo.Grender;
                txt_extNo.Text = supplyinfo.ExtNo;
                txt_mobile.Text = supplyinfo.Mobile;
                txt_companyFax.Text = supplyinfo.CompanyFax;
                txt_email.Text = supplyinfo.Email;
                txt_companyAddress.Text = supplyinfo.CompanyAddress;
                txt_zip.Text = supplyinfo.Zip;
                txt_factoryAddress.Text = supplyinfo.FactoryAddress;
                txt_factoryTel.Text = supplyinfo.FactoryTel;
                txt_comment.Text = supplyinfo.Comment;
                lab_factorytype.Text = supplyinfo.FactoryType;

                txt_ExtraLength.Text = Convert.ToString(supplyinfo.ExtraLength);
                txt_ExtraWeight.Text = Convert.ToString(supplyinfo.ExtraWeight);
                txt_ExtraHeight.Text = Convert.ToString(supplyinfo.ExtraHeight);

                btn_productCodeRela_submit.Enabled = true;
                dg_productCodeRela.DataSource = new CustomerProductCodeTypeRela().GetCustomerProductCodeTypeRelaInfosByCustomerId(Convert.ToInt32(lab_Id.Text));
                dg_productCodeRela.DataKeyField = "id";
                dg_productCodeRela.DataBind();


            }

        }



        private void ClearView()
        {
            txt_supplierId.Text = "";
            txt_supplierName.Text = "";
            txt_invoiceTitle.Text = "";
            txt_unityNo.Text = "";
            txt_factoryRegisterNo.Text = "";
            txt_salesRegisterNo.Text = "";
            txt_companyTel.Text = "";
            txt_englistFullName.Text = "";
            txt_foundType.Text = "";
            //			txt_responsibility.Text="";
            txt_conatcted.Text = "";
            //			txt_grender.Text="";
            txt_extNo.Text = "";
            txt_mobile.Text = "";
            txt_companyFax.Text = "";
            txt_email.Text = "";
            txt_companyAddress.Text = "";
            txt_zip.Text = "";
            txt_factoryAddress.Text = "";
            txt_factoryTel.Text = "";
            txt_comment.Text = "";
            lab_Id.Text = "";
            func.Text = "";
            txt_ExtraLength.Text = "";

            txt_ExtraWeight.Text = "";
            txt_ExtraHeight.Text = "";

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











        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            if (txt_supplierId.Text.Equals(""))
            {
                Label_Message.Text = "廠商編號不能為空";
                return;
            }
            if (txt_supplierName.Text.Equals(""))
            {
                Label_Message.Text = "廠商名稱不能為空";
                return;
            }
            SupplyInfo supplyinfo = new SupplyInfo();
            supplyinfo.SupplierId = txt_supplierId.Text;
            supplyinfo.SupplierName = txt_supplierName.Text;
            supplyinfo.InvoiceTitle = txt_invoiceTitle.Text;
            supplyinfo.UnityNo = txt_unityNo.Text;
            supplyinfo.FactoryRegisterNo = txt_factoryRegisterNo.Text;
            supplyinfo.SalesRegisterNo = txt_salesRegisterNo.Text;
            supplyinfo.CompanyTel = txt_companyTel.Text;
            supplyinfo.EnglistFullName = txt_englistFullName.Text;
            supplyinfo.FoundType = txt_foundType.Text;
            supplyinfo.Responsibility = dpl_responsibility.SelectedValue;
            supplyinfo.Conatcted = txt_conatcted.Text;
            supplyinfo.Grender = dpl_grender.SelectedValue;
            supplyinfo.ExtNo = txt_extNo.Text;
            supplyinfo.Mobile = txt_mobile.Text;
            supplyinfo.CompanyFax = txt_companyFax.Text;
            supplyinfo.Email = txt_email.Text;
            supplyinfo.CompanyAddress = txt_companyAddress.Text;
            supplyinfo.Zip = txt_zip.Text;
            supplyinfo.FactoryAddress = txt_factoryAddress.Text;
            supplyinfo.FactoryTel = txt_factoryTel.Text;
            supplyinfo.Comment = txt_comment.Text;
            supplyinfo.MoneyTypeId = 0;
            supplyinfo.FaxId = 0;
            supplyinfo.TradeCondittionId = 0;
            supplyinfo.TransferId = 0;
            supplyinfo.PaymentId = 0;

            if (!txt_ExtraLength.Text.Trim().Equals(""))
            {
                supplyinfo.ExtraLength = Convert.ToDouble(txt_ExtraLength.Text.Trim());
            }

            if (!txt_ExtraWeight.Text.Trim().Equals(""))
            {
                supplyinfo.ExtraWeight = Convert.ToDouble(txt_ExtraWeight.Text.Trim());
            }

            if (!txt_ExtraHeight.Text.Trim().Equals(""))
            {
                supplyinfo.ExtraHeight = Convert.ToDouble(txt_ExtraHeight.Text.Trim());
            }


            if (!lab_factorytype.Text.Equals(""))
            {
                supplyinfo.FactoryType = lab_factorytype.Text;
            }

            if (!func.Text.Equals("Edit"))
            {
                Label_Message.Text = supply.insertSupply(supplyinfo);
            }
            else
            {
                supplyinfo.Id = Convert.ToInt32(lab_Id.Text);
                Label_Message.Text = supply.updateSupply(supplyinfo);
            }

            if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
            {
                if (new SysConfig().hasInventory())
                {
                    SupplyInfo si = supply.GetSupplyInfoBySupplierName(supplyinfo.SupplierName, null);
                    if (si != null)
                    {
                        initialEdit(si.Id);
                    }
                    else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                    }
                }
                else
                {
                    ClearView();
                }
            }

        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            string url = "SupplyList.aspx?menuid=" + menuid + "&factorytype=" + lab_factorytype.Text;
            Response.Redirect(url);
        }

        protected void btn_productCodeRela_submit_Click(object sender, EventArgs e)
        {
            ArrayList source = new ArrayList();
            ArrayList cptris = new ArrayList();

            ArrayList list = new ProductCodeType(true).GetAllProductCodeTypeInfosByParent(Convert.ToInt32(dpl_productCodeType.SelectedValue.Trim()), source);
            foreach (ProductCodeTypeInfo pti in list)
            {
                CustomerProductCodeTypeRelaInfo cptri = new CustomerProductCodeTypeRelaInfo();
                cptri.CustomerId = Convert.ToInt32(lab_Id.Text);
                cptri.ProductCodeTypeId = pti.Id;
                cptris.Add(cptri);
            }
            CustomerProductCodeTypeRelaInfo Parentinfo = new CustomerProductCodeTypeRelaInfo();
            Parentinfo.CustomerId = Convert.ToInt32(lab_Id.Text);
            Parentinfo.ProductCodeTypeId = Convert.ToInt32(dpl_productCodeType.SelectedValue.Trim());
            cptris.Insert(0, Parentinfo);


            //foreach (DataGridItem item in dg_productCodeRela.Items)
            //{
            //    Label dg_lab_Id = item.FindControl("dg_lab_Id") as Label;
            //    Label dg_lab_ProductCodeTypeId = item.FindControl("dg_lab_ProductCodeTypeId") as Label;
            //    cptri.CustomerId = Convert.ToInt32(lab_Id.Text);
            //    cptri.ProductCodeTypeId =  Convert.ToInt32(dg_lab_ProductCodeTypeId.Text.Trim());
            //    cptri.Id = Convert.ToInt32(dg_lab_Id.Text.Trim());
            //    cptris.Add(cptri);
            //}
            new CustomerProductCodeTypeRela().updateCustomerProductCodeTypeRela(Convert.ToInt32(lab_Id.Text), cptris);
            bindProductCodeRela();
            //Label_Message.Text = new CustomerProductCodeTypeRela().updateCustomerProductCodeTypeRela(,cptris);
            //if (lab_productCodeTypeRela_Id.Text.Equals(""))
            //{
            //    Label_Message.Text = new CustomerProductCodeTypeRela().insertCustomerProductCodeTypeRela(cptris);
            //}
            //else
            //{
            //    //cptri.Id = Convert.ToInt32(lab_productCodeTypeRela_Id.Text);
            //    Label_Message.Text = new CustomerProductCodeTypeRela().updateCustomerProductCodeTypeRela(cptri);
            //}

            //if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
            //{
            //    lab_productCodeTypeRela_Id.Text = "";
            //    bindProductCodeRela();
            //}
        }

        private void bindProductCodeRela()
        {
            dg_productCodeRela.DataSource = new CustomerProductCodeTypeRela().GetCustomerProductCodeTypeRelaInfosByCustomerId(Convert.ToInt32(lab_Id.Text));
            dg_productCodeRela.DataKeyField = "Id";
            dg_productCodeRela.DataBind();

        }

        protected void dg_productCodeRela_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            int index = e.Item.ItemIndex;
            switch (((Button)e.CommandSource).CommandName)
            {
                case "Modify":
                    Label dg_lab_ProductCodeTypeId = e.Item.FindControl("dg_lab_ProductCodeTypeId") as Label;
                    dpl_productCodeType.SelectedValue = dg_lab_ProductCodeTypeId.Text;
                    lab_productCodeTypeRela_Id.Text = dg_productCodeRela.DataKeys[e.Item.ItemIndex].ToString();
                    Label_Message.Text = "";
                    break;
                case "Delete":
                    new CustomerProductCodeTypeRela().deleteCustomerProductCodeTypeRela(Convert.ToInt32(dg_productCodeRela.DataKeys[index]));
                    bindProductCodeRela();
                    break;
                default:
                    // Do nothing.
                    break;
            }
        }


        protected void treeview_SelectedNodeChanged(object sender, EventArgs e)
        {
            lab_parentid.Text = treeview.SelectedNode.Value;
            bindmaterialtype(Convert.ToInt32(lab_parentid.Text.Trim()));
            dpl_productCodeType.SelectedValue = treeview.SelectedNode.Value;
            //bindProductMaterialInventory();
        }


    }
}
