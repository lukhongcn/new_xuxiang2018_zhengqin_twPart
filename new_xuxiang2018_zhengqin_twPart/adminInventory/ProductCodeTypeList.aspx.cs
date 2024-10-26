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
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.WebView;
using ModuleWorkFlow.BLL.InventorySystem;
using ModuleWorkFlow.Model.InventorySystem;

namespace ModuleWorkFlow.adminInventory
{
	/// <summary>
	/// Summary description for WebForm1.
	/// </summary>
	public class ProductCodeTypeList : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label_StatusMsg;
		protected System.Web.UI.WebControls.Label Label_Message;		
		protected System.Web.UI.HtmlControls.HtmlTable Table4;
		protected System.Web.UI.WebControls.TextBox txt_name;
		protected System.Web.UI.WebControls.TextBox txt_abbr;
		protected System.Web.UI.WebControls.Panel pan_treeview;
		protected System.Web.UI.WebControls.DataGrid dg_productCode;
        private string menuid = "A125";
		protected System.Web.UI.WebControls.Label lab_id;
        protected Label lab_parentid;
		protected System.Web.UI.WebControls.Label lab_edit_mode;
		protected System.Web.UI.WebControls.Button btn_save;
		protected System.Web.UI.WebControls.DropDownList ddl_parentcodetype;
        protected System.Web.UI.WebControls.TreeView treeview;
		private DataSet ds = null;
        private ProductCodeType productCodeType;
		private void Page_Load(object sender, System.EventArgs e)
		{
			productCodeType = new ProductCodeType();
            ds = productCodeType.GetDSProductCodeTypeInfos();
			
			if(!this.IsPostBack)
			{
				
				if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
				{
					bind();
                    new ProductCodeTypeWebView().ProductCodeTypeTree(0, treeview);
				}

               
			}
		}


       
		private void bind()
		{
			IList productcodetypes;
            int parentid = 0;
            if (!lab_parentid.Text.Equals(""))
            {
                parentid = Convert.ToInt32(lab_parentid.Text);
            }

            if (parentid == 0)
			{
                productcodetypes = productCodeType.GetProductCodeTypeInfos(true);
              
			}
			else
			{
                productcodetypes = productCodeType.GetProductCodeTypeInfosByParent(parentid,true);
			}

            dg_productCode.DataSource = productcodetypes;
            dg_productCode.DataKeyField = "Id";
            dg_productCode.DataBind();

            ProductCodeTypeInfo pcti = new ProductCodeTypeInfo();
            pcti.Id = 0;
			pcti.Name = "";

            productcodetypes.Insert(0, pcti);

            if (parentid > 0)
            {
                pcti = productCodeType.findbykey(parentid);
                if (pcti != null)
                    productcodetypes.Insert(1, pcti);
            }
            ddl_parentcodetype.DataSource = productcodetypes;
            ddl_parentcodetype.DataTextField = "Name";
            ddl_parentcodetype.DataValueField = "Id";
            ddl_parentcodetype.SelectedValue = null;
            ddl_parentcodetype.DataBind();


           


           
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
			this.btn_save.Click += new System.EventHandler(this.BTaddmetal_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void BTaddmetal_Click(object sender, System.EventArgs e)
		{
			if (lab_edit_mode.Text.Equals("ADD"))
			{
				if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PADD"))
				{
					if (Page.IsValid)
					{
                        if ( txt_name.Text.Trim().Equals("") || txt_abbr.Text.Trim().Equals(""))
                        {
                            Label_Message.Text = "標準件類型及編碼不能為空";
                        }
                        else
                        {
                            if (productCodeType.GetProductCodeTypeByNo(txt_abbr.Text.Trim()) == null)
                            {
                                ProductCodeTypeInfo pcti = new ProductCodeTypeInfo();
                                pcti.Abbr = txt_abbr.Text;
                                pcti.Name = txt_name.Text.Trim();
                                pcti.ParentId = Convert.ToInt32(ddl_parentcodetype.SelectedValue);
                                Label_Message.Text = productCodeType.insertProductCodeType(pcti);
                            }
                            else
                            {
                                Label_Message.Text = "類型編碼不可重複";
                            }
                        }
					}
				}
			}
			else
			{
				if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PEDIT"))
				{
                    if (txt_name.Text.Trim().Equals("") || txt_abbr.Text.Trim().Equals(""))
                    {
                        Label_Message.Text = "類型編碼名不能為空";
                        return;
                    }


                    ProductCodeTypeInfo pcti = new ProductCodeTypeInfo();
                    pcti.Abbr = txt_abbr.Text.Trim();
                    pcti.Name = txt_name.Text.Trim();
                    pcti.ParentId = Convert.ToInt32(ddl_parentcodetype.SelectedValue);
                    pcti.Id = Convert.ToInt32(lab_id.Text);

                    ProductCodeTypeInfo findpcti = productCodeType.GetProductCodeTypeByNo(txt_abbr.Text.Trim());
                    if (findpcti != null && findpcti.Id != pcti.Id)
                    {
                        Label_Message.Text = "類型編碼不可重複";
                        bind();
                        _initalPage();
                        return;
                    }

                  

					if(!checkidanparentId(pcti.Id,pcti.ParentId) )
					{
                        Label_Message.Text = "父類型和子類型不可循環引用";
                        bind();
						_initalPage();
						return;

					}

                    Label_Message.Text = productCodeType.updateProductCodeType(pcti);
					lab_edit_mode.Text = "ADD";
                    btn_save.Text = "保存新增";
                }
			}
			bind();
			_initalPage();

		}

		private void BTresetmetal_Click(object sender, System.EventArgs e)
		{
			_initalPage();
		}

	

		

	

		

		private void _initalPage()
		{
			txt_abbr.Text="";
			txt_name.Text="";
	        
		}

	

		

		public bool checkidanparentId(int id ,int parentid)
		{
			DataTable dt = ds.Tables[0];
			DataRow []dr=dr=dt.Select("Id="+parentid );
			if(parentid == 0)
			{
				return true;
			}
			else
			{
				if(dr.Length >0)
				{
                    if (!Convert.IsDBNull(dr[0]["parentId"]) && Convert.ToInt32(dr[0]["parentId"].ToString()) == id)
					{
						return false;
					}
					else
					{
                        if (Convert.IsDBNull(dr[0]["parentId"]))
                        {
                            return true;
                        }
                        else
                        {
                            return checkidanparentId(id, Convert.ToInt32(dr[0]["parentId"].ToString()));
                        }
					}
				}
				else
				{
					return false;
				}
			}

		}

        private int getKey()
        {
            int key = -1;

            foreach (DataGridItem item in dg_productCode.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_productCode.DataKeys[item.ItemIndex]);
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
                Label_Message.Text = "請選擇類型";
                return;
            }
            else
            {
                ProductCodeTypeInfo pcti = productCodeType.findbykey(id);
                if (pcti == null)
                {
                    Label_Message.Text = "此類型已被其他用戶修改";
                    bind();
                    return;
                }

                string Name = pcti.Name;
                string Abbr = pcti.Abbr;
                int ParentId = pcti.ParentId;

                Response.Redirect("ProductCodeTypeView.aspx?func=edit&id=" + id + "&name=" + Name + "&abbr=" + Abbr + "&ParentId=" + ParentId);
            }                 
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {

                foreach (DataGridItem item in dg_productCode.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {

                        CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                        if (cb.Checked)
                        {
                            int id = Convert.ToInt32(dg_productCode.DataKeys[item.ItemIndex]);
                            if (id < 0)
                            {
                                Label_Message.Text = "請選擇類型";
                                return;
                            }
                            Label_Message.Text = productCodeType.deleteProductCodeType(id);
                            
                        }
                    }
                }
                bind();
                
            }
        }

        protected void dg_productCode_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label dg_lab_IsReadOnly = e.Item.FindControl("dg_lab_IsReadOnly") as Label;
                if (Convert.ToBoolean(Convert.ToInt32(dg_lab_IsReadOnly.Text)))
                {
                    CheckBox chk_datagrid = e.Item.FindControl("chk_datagrid") as CheckBox;
                    chk_datagrid.Enabled = false;
                }
            }
        }

        protected void dg_productCode_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            dg_productCode.CurrentPageIndex = e.NewPageIndex;
            bind();
        }

        protected void treeview_SelectedNodeChanged(object sender, EventArgs e)
        {
            lab_parentid.Text = treeview.SelectedNode.Value;
            dg_productCode.CurrentPageIndex = 0;
            bind();
           
        }

		
	}
}
