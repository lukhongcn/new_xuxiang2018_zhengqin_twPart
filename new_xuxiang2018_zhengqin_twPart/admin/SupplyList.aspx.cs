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


namespace ModuleWorkFlow.admin
{
	/// <summary>
	/// Summary description for ProductType.
	/// </summary>
	public class Supply : System.Web.UI.Page
	{
		protected System.Web.UI.HtmlControls.HtmlTable Table1;
		protected System.Web.UI.WebControls.DataGrid dg_Supply;
		protected System.Web.UI.WebControls.Label Label_Message;
		protected System.Web.UI.WebControls.DataGrid dg_Contacter;
		protected System.Web.UI.WebControls.Label lab_Id;
        protected Label lab_factorytype;
        protected Label lab_title;


		private ModuleWorkFlow.BLL.System.Supply supply;
		protected System.Web.UI.WebControls.Label lab_search;
		protected System.Web.UI.WebControls.TextBox txt_search;
		protected System.Web.UI.WebControls.Button btn_search;
		protected System.Web.UI.WebControls.Label lab_searchold;
		protected System.Web.UI.WebControls.DataGrid Datagrid1;
		protected System.Web.UI.WebControls.Button btn_print;
        

		private string menuid="D45";
         
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			supply = new ModuleWorkFlow.BLL.System.Supply();
           
				if (!this.IsPostBack)
				{
					lab_searchold.Text="";
                    
                    if (Request.Params["factoryType"] != null)
                    {
                        lab_factorytype.Text = Request.Params["factoryType"];
                    }
                    else
                    {
                        lab_factorytype.Text = "";
                    }

                if (lab_factorytype.Text.Equals(""))
                {
                    lab_title.Text = "供應商設定";
                    lab_search.Text = "供應商";
                    dg_Supply.Columns[1].HeaderText = "供應商編號";
                    dg_Supply.Columns[2].HeaderText = "供應商名稱";
                }

                if (lab_factorytype.Text.Equals("try"))
                {
                    menuid = "D4501";
                    lab_title.Text = "試模廠設定";
                    lab_search.Text = "試模廠";
                    dg_Supply.Columns[1].HeaderText = "試模廠編號";
                    dg_Supply.Columns[2].HeaderText = "試模廠名稱";
                }

                if (lab_factorytype.Text.Equals("product"))
                {
                    menuid = "D4502";
                    lab_title.Text = "量產廠設定";
                    lab_search.Text = "量產廠";
                    dg_Supply.Columns[1].HeaderText = "量產廠編號";
                    dg_Supply.Columns[2].HeaderText = "量產廠名稱";
                }

                if (ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
                    {
					   bindSupply();
                    }
				}
            }
		
		
		

		private void bindSupply()
		{
            string factorytype = null;
            if (!lab_factorytype.Text.Equals(""))
            {
                factorytype = lab_factorytype.Text;
            }
            
            if (lab_searchold.Text.Trim().Equals(""))
            {
                dg_Supply.DataSource = supply.GetSupply(factorytype);
            }
            else
            {
                dg_Supply.DataSource = supply.GetSupplyInfoBySuppLikeName(lab_searchold.Text.Trim(),factorytype);
            }
            
				
                
			dg_Supply.DataKeyField = "Id";
			dg_Supply.DataBind();
			
		}

		private void dg_Supply_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			dg_Supply.EditItemIndex = -1;
			bindSupply();
		}
		
		protected void dg_Supply_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
//			lab_searchold.Text="";
            dg_Supply.CurrentPageIndex = e.NewPageIndex;
            bindSupply();
        }

		private void dg_Supply_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			SupplyInfo supplyinfo = new SupplyInfo();
			supplyinfo.Id = Convert.ToInt32(dg_Supply.DataKeys[e.Item.ItemIndex]);
            Label_Message.Text = supply.deleteSupply(supplyinfo.Id);
			
			
			bindSupply();
		}

		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
		}

		private void InitializeComponent()
		{
			this.btn_search.Click += new System.EventHandler(this.btn_search_Click);
			this.btn_print.Click += new System.EventHandler(this.btn_print_Click);
			this.dg_Supply.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_Supply_PageIndexChanged);
			this.dg_Supply.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_Supply_EditCommand);
			this.dg_Supply.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_Supply_DeleteCommand);
			this.dg_Supply.SelectedIndexChanged += new System.EventHandler(this.dg_Supply_SelectedIndexChanged);
			this.dg_Contacter.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_Contacter_PageIndexChanged);
			this.Datagrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.Datagrid1_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}

		

		

		private void dg_Supply_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

		private void bindcontacter(int id)
		{
			Contacter contacter = new Contacter();
			dg_Contacter.Visible = true;
			dg_Contacter.DataSource = contacter.getContacterBySupplyCustomerId(id,"supply");
			dg_Contacter.DataBind();
		}


		private void dg_Supply_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			lab_Id.Text = dg_Supply.DataKeys[e.Item.ItemIndex].ToString();
			bindcontacter(Convert.ToInt32(dg_Supply.DataKeys[e.Item.ItemIndex]));
		}

		private void dg_Contacter_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			dg_Contacter.CurrentPageIndex = e.NewPageIndex;
			bindcontacter(Convert.ToInt32(lab_Id.Text));
		}

		private void btn_search_Click(object sender, System.EventArgs e)
		{
			dg_Supply.CurrentPageIndex = 0;
			lab_searchold.Text=txt_search.Text.Trim();
			bindSupply();
		}

		private void btn_print_Click(object sender, System.EventArgs e)
		{
			Datagrid1.Visible=true;
			bindSupply();
			Datagrid1.DataSource=dg_Supply.DataSource;
			Datagrid1.DataBind();
            Label_Message.Text = "<a href=" + Utility.tools.DataGridToExcel(Datagrid1) + ">ゅン更" + "</a>";
			Datagrid1.Visible=false;
		}

		private void Datagrid1_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType == ListItemType.Header)
			{
				System.Text.StringBuilder strtext=new System.Text.StringBuilder();
				strtext.Append("<td colspan= 11>");
				strtext.Append("ㄑ莱坝");
				strtext.Append("</td>");
				strtext.Append("</tr>");
				strtext.Append("<tr BGCOLOR=#AAAADD>");
				strtext.Append("<td>" + "ㄑ莱坝絪腹");               
				e.Item.Cells[0].Text =strtext.ToString();
			}
		}

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {           
            int key = getKey();
            if (key < 0)
            {
                Label_Message.Text = "叫匡拒紅坝";
                return;
            }
            else
            {
                Response.Redirect("supplyview.aspx?menuid=" +menuid + "&id=" + key.ToString() + "&factorytype=" + lab_factorytype.Text);
            }
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {

            if (Request.Params["factoryType"] != null)
            {
                lab_factorytype.Text = Request.Params["factoryType"];
            }
            else
            {
                lab_factorytype.Text = "";
            }

            if (lab_factorytype.Text.Equals("try"))
            {
                menuid = "D4501";                
            }

            if (lab_factorytype.Text.Equals("product"))
            {
                menuid = "D4502";             
            }
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {

                int key = getKey();
                if (key < 0)
                {
                    Label_Message.Text = "叫匡拒紅坝";
                    return;
                }
                else
                {
                    SupplyInfo supplyinfo = new SupplyInfo();
                    supplyinfo.Id = key;
                    Label_Message.Text = supply.deleteSupply(supplyinfo.Id);


                    bindSupply();

                }
            }
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {

        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            btn_search_Click(sender, e);
        }

        protected void lnkbutton_print_Click(object sender, EventArgs e)
        {
            btn_print_Click(sender, e);
        }

        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_Supply.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_Supply.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }

            return key;
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            string url = "SupplyView.aspx?menuid=" + menuid + "&factorytype=" + lab_factorytype.Text;
            Response.Redirect(url);
        }
	}
}