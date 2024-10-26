using System;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL;

namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class CustomerDesignList : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.DataGrid dg_CustomerDesign;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.DataGrid dg_Contacter;
        protected System.Web.UI.WebControls.Label lab_Id;

        private ModuleWorkFlow.BLL.System.CustomerDesign customerDesign;
        protected System.Web.UI.WebControls.Button btn_print;
        protected System.Web.UI.WebControls.Label lab_customer;
        protected System.Web.UI.WebControls.TextBox txt_customer;
        protected System.Web.UI.WebControls.Button btn_select;
        private string menuid = "A03";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            customerDesign = new ModuleWorkFlow.BLL.System.CustomerDesign();
            menuname = new Tmenu().findbykey(menuid).Menuname;

            if (!this.IsPostBack)
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    bindCustomerDesign();
                }
                Label_Message.Text = "";
                string msg = Request.Params["msg"];
                if (msg != null && msg.Length > 0)
                {
                    Label_Message.Text = msg;
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
            this.dg_CustomerDesign.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_CustomerDesign_PageIndexChanged);
            this.dg_CustomerDesign.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_CustomerDesign_EditCommand);
            this.dg_CustomerDesign.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_CustomerDesign_DeleteCommand);
            this.dg_Contacter.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_Contacter_PageIndexChanged);
            //this.btn_print.Click += new System.EventHandler(this.btn_print_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void bindCustomerDesign()
        {
            IList customerDesigns = new ArrayList();
            if (lab_customer.Text.Trim().Equals(""))
            {
                customerDesigns = customerDesign.GetCustomerDesignInfos();
                dg_CustomerDesign.DataSource = customerDesigns;
            }
            else
            {
                customerDesigns = customerDesign.getCustomerDesignLike(lab_customer.Text.Trim());
                dg_CustomerDesign.DataSource = customerDesigns;

            }
            dg_CustomerDesign.PageSize = Convert.ToInt32(System.Configuration.ConfigurationSettings.AppSettings["CustomerDisCount"]);
            dg_CustomerDesign.DataKeyField = "CustomerId";
            if (customerDesigns.Count <= (dg_CustomerDesign.CurrentPageIndex) * dg_CustomerDesign.PageSize && dg_CustomerDesign.CurrentPageIndex > 0)
            {
                dg_CustomerDesign.CurrentPageIndex = dg_CustomerDesign.CurrentPageIndex - 1;
            }
            dg_CustomerDesign.DataBind();
        }

        protected void dg_CustomerDesign_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_CustomerDesign.CurrentPageIndex = e.NewPageIndex;
            bindCustomerDesign();
        }

        private void dg_CustomerDesign_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                CustomerDesignInfo customerDesigninfo = new CustomerDesignInfo();
                customerDesigninfo.CustomerId = Convert.ToInt32(dg_CustomerDesign.DataKeys[e.Item.ItemIndex]);
                ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
                if (order.GetMsListOrderInfo(Convert.ToString(customerDesigninfo.CustomerId)).Count == 0)
                {
                    BLL.ProjectBudget projectBudget = new ModuleWorkFlow.BLL.ProjectBudget();
                    Model.ProjectBudgetInfo projectBudgetInfo = projectBudget.GetProjectBudgetByNo(dg_CustomerDesign.DataKeys[e.Item.ItemIndex].ToString());
                    if (projectBudgetInfo == null)
                    {
                        Label_Message.Text = customerDesign.deleteCustomerDesign(customerDesigninfo.CustomerId);
                        bindCustomerDesign();

                    }
                    else
                    {
                        Label_Message.Text = Utility.Translate.translateString("項目預算存在不能刪除");
                    }
                }
                else
                {
                    Label_Message.Text = Utility.Translate.translateString("訂單存在此客戶，不能刪除");
                    bindCustomerDesign();
                }

            }
        }



        private void bindcontacter(int id)
        {
            Contacter contacter = new Contacter();
            dg_Contacter.Visible = true;
            dg_Contacter.DataSource = contacter.getContacterBySupplyCustomerId(id, "customer");
            dg_Contacter.DataBind();
        }

        private void dg_CustomerDesign_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            string id = dg_CustomerDesign.DataKeys[e.Item.ItemIndex].ToString();
            lab_Id.Text = dg_CustomerDesign.DataKeys[e.Item.ItemIndex].ToString();
            bindcontacter(Convert.ToInt32(dg_CustomerDesign.DataKeys[e.Item.ItemIndex]));
            btn_print.Visible = true;
        }

        private void dg_Contacter_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dg_Contacter.CurrentPageIndex = e.NewPageIndex;
            bindcontacter(Convert.ToInt32(lab_Id.Text));
        }

        private void btn_print_Click(object sender, System.EventArgs e)
        {
            this.dg_Contacter.AllowPaging = false;
            //bindLogBarCode();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Charset = "UTF-7"; //GB2312??GB5         
            HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=dg_Contacter.xls");
            HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-7");//扢離懷堤霜峈潠極笢恅  
            HttpContext.Current.Response.ContentType = "application/ms-excel";//扢離懷堤恅璃濬倰峈excel恅璃﹝    
            dg_Contacter.EnableViewState = false;
            System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
            System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
            System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
            dg_Contacter.RenderControl(oHtmlTextWriter);
            HttpContext.Current.Response.Write(oStringWriter.ToString());
            HttpContext.Current.Response.End();
            dg_Contacter.AllowPaging = true;
        }

        private void btn_select_Click(object sender, System.EventArgs e)
        {
            lab_customer.Text = txt_customer.Text.Trim();
            dg_CustomerDesign.CurrentPageIndex = 0;
            bindCustomerDesign();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            lab_customer.Text = txt_customer.Text.Trim();
            dg_CustomerDesign.CurrentPageIndex = 0;
            bindCustomerDesign();
        }

        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_CustomerDesign.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_CustomerDesign.DataKeys[item.ItemIndex]);
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
                Label_Message.Text = Utility.Translate.translateString("請選中客戶");
            }
            else
            {
                Response.Redirect("CustomerDesignView.aspx?menuid=" + menuid + "&func=edit&id=" + key.ToString());
            }
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            int key = getKey();
            if (key < 0)
            {
                Label_Message.Text = Utility.Translate.translateString("請選中客戶");
                return;
            }
            lab_Id.Text = key.ToString();
            bindcontacter(key);
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            int key = getKey();
            if (key < 0)
            {
                Label_Message.Text = Utility.Translate.translateString("請選中客戶");
                return;
            }
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                CustomerDesignInfo customerDesigninfo = new CustomerDesignInfo();
                customerDesigninfo.CustomerId = key;
                ModuleWorkFlow.BLL.Order order = new ModuleWorkFlow.BLL.Order();
                if (order.GetMsListOrderInfo(Convert.ToString(customerDesigninfo.CustomerId)).Count == 0)
                {
                    BLL.ProjectBudget projectBudget = new ModuleWorkFlow.BLL.ProjectBudget();
                    Model.ProjectBudgetInfo projectBudgetInfo = projectBudget.GetProjectBudgetByNo(key.ToString());
                    if (projectBudgetInfo == null)
                    {
                        Label_Message.Text = customerDesign.deleteCustomerDesign(customerDesigninfo.CustomerId);
                        bindCustomerDesign();
                        bindcontacter(0);

                    }
                    else
                    {
                        Label_Message.Text = Utility.Translate.translateString("項目預算存在不能刪除");
                    }
                }
                else
                {
                    Label_Message.Text = Utility.Translate.translateString("訂單存在此客戶，不能刪除");
                    bindCustomerDesign();
                }

            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            btn_select_Click(sender, e);
        }
    }
}