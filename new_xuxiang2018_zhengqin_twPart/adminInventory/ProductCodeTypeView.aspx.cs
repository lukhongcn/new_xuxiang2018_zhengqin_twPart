using System;
using System.Collections;
using System.Collections.Generic;
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

namespace ModuleWorkFlow.Inventory
{
	/// <summary>
	/// Summary description for WebForm1.
	/// </summary>
	public class ProductCodeTypeView : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label_StatusMsg;
		protected System.Web.UI.WebControls.Label Label_Message;        
		protected System.Web.UI.HtmlControls.HtmlTable Table4;
		protected System.Web.UI.WebControls.TextBox txt_name;
		protected System.Web.UI.WebControls.TextBox txt_abbr;
		protected System.Web.UI.WebControls.Panel pan_treeview;
        protected System.Web.UI.WebControls.TreeView treeview;
       
        private string menuid = "A125";
		
		
        protected Label lab_parentid;
		protected System.Web.UI.WebControls.Label lab_edit_mode;
		protected System.Web.UI.WebControls.Button btn_save;
		protected System.Web.UI.WebControls.DropDownList ddl_parentcodetype;
		private int parentid = 0;
        
		private DataSet ds = null;
        private ProductCodeType productCodeType;
        protected Label lab_func;
        protected Label lab_Id;
		private void Page_Load(object sender, System.EventArgs e)
		{
			productCodeType = new ProductCodeType();
            ds = productCodeType.GetDSProductCodeTypeInfos();
			
			if(!this.IsPostBack)
			{
                
				if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
				{
                   

                    if (Request.Params["func"] != null)
                    {
                        lab_func.Text = Request.Params["func"];
                    }
                    bind();
                    bindTree();
                    if (lab_func.Text.Equals("edit"))
                    {
                        lab_Id.Text = Request.Params["id"];
                        if (!lab_Id.Text.Equals(""))
                        {
                            txt_name.Text = Request.Params["Name"];
                            txt_abbr.Text = Request.Params["abbr"];
                            try
                            {
                                ddl_parentcodetype.SelectedValue = Request.Params["parentId"].Trim();
                            }
                            catch
                            {
                            }

                        }
                    }
                    
                    
                    
				}

                lab_parentid.Text = parentid.ToString();
			}
		}

        private void bindTree()
        {
            new ProductCodeTypeWebView().ProductCodeTypeTree(0, treeview);
            if (Session["TreeViewState"] != null)
            {
                List<string> list = (List<string>)Session["TreeViewState"];
                List<TreeNode> oldNodes = (List<TreeNode>)Session["treeNodes"];
                RestoreTreeViewState(treeview.Nodes, list, oldNodes);
            }
        }

        private void bind()
        {
            IList productcodetypes;            
            productcodetypes = productCodeType.GetProductCodeTypeInfos(true);
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
            //this.btn_save.Click += new System.EventHandler(this.BTaddmetal_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

        protected void lnkbutton_save_Click(object sender, System.EventArgs e) 
		{
            if (!lab_func.Text.Equals("edit"))
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
                    pcti.Id = Convert.ToInt32(lab_Id.Text);

                    ProductCodeTypeInfo findpcti = productCodeType.GetProductCodeTypeByNo(txt_abbr.Text.Trim());
                    if (findpcti != null && findpcti.Id != pcti.Id)
                    {
                        Label_Message.Text = "類型編碼不可重複";

                        _initalPage();
                        return;
                    }

                  

					if(!checkidanparentId(pcti.Id,pcti.ParentId) )
					{
                        Label_Message.Text = "父類型和子類型不可循環引用";

                        _initalPage();
						return;

					}

                    Label_Message.Text = productCodeType.updateProductCodeType(pcti);
					
					
				}
			}
            List<string> list = new List<string>(treeview.Nodes.Count);
            List<TreeNode> listNode = new List<TreeNode>(treeview.Nodes.Count);
            SaveTreeViewState(treeview.Nodes, list,listNode);
            Session["TreeViewState"] = list;
            Session["treeNodes"] = listNode;
            bindTree();
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


        protected void treeview_SelectedNodeChanged(object sender, EventArgs e)
        {
            bind();
            ddl_parentcodetype.SelectedValue = treeview.SelectedNode.Value;
        }

       
        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductCodeTypeList.aspx");
        }

       

        private void SaveTreeViewState(TreeNodeCollection nodes, List<string> list, List<TreeNode> listNode)
        {
            // Recursivley record all expanded nodes in the List.
            foreach (TreeNode node in nodes)
            {
                if (node.ChildNodes != null && node.ChildNodes.Count != 0)
                {
                    if (node.Expanded.HasValue && node.Expanded == true && !String.IsNullOrEmpty(node.Text))
                    {
                        list.Add(node.Text);
                        listNode.Add(node);
                    }
                    SaveTreeViewState(node.ChildNodes, list,listNode);
                }
            }
        }

        private void RestoreTreeViewState(TreeNodeCollection nodes, List<string> list, List<TreeNode> oldnodes)
        {
            foreach (TreeNode node in nodes)
            {
                foreach (TreeNode oldnode in oldnodes)
                {
                    if (node.Value.Equals(oldnode.Value))
                    {
                        node.Expanded = oldnode.Expanded;
                        break;
                    }
                }
                // Restore the state of one node.
                if (list.Contains(node.Text))
                {
                    
                    if (node.ChildNodes != null && node.ChildNodes.Count != 0 && node.Expanded.HasValue && node.Expanded == false)
                        node.Expand();
                }
                else
                {
                    if (node.ChildNodes != null && node.ChildNodes.Count != 0 && node.Expanded.HasValue && node.Expanded == true)
                        node.Collapse();
                }
                // If the node has child nodes, restore their state, too.
                if (node.ChildNodes != null && node.ChildNodes.Count != 0)
                    RestoreTreeViewState(node.ChildNodes, list, oldnodes);
            }
        }

      
		
	}
}
