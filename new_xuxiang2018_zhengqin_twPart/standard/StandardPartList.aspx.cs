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

using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;
using Utility;

namespace ModuleWorkFlow.standard
{
	/// <summary>
	/// Summary description for StandardPartList.
	/// </summary>
	public class StandardPartList : System.Web.UI.Page
	{
        //protected ModuleWorkFlow.controls.Style Style;
		protected System.Web.UI.HtmlControls.HtmlTable Table1;
		protected System.Web.UI.WebControls.DataGrid dg_StandProcess;
	
		private WorkFlow.BLL.Standard.StandProcessType standprocesstype;
		private WorkFlow.BLL.Standard.StandProcess standprocess;
		protected System.Web.UI.WebControls.Label lab_title;
		protected System.Web.UI.WebControls.Label lab_typeName;
		protected System.Web.UI.WebControls.DropDownList dpl_standardtype;
		protected System.Web.UI.WebControls.Label Label_Notice;
		protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_isProductType;
        protected System.Web.UI.WebControls.Label lab_href_title;
		string menuid = "I02";
        protected string titlemenuname = "";
        protected string hrefmenuname = "";
		private void Page_Load(object sender, System.EventArgs e)
		{
			standprocess = new WorkFlow.BLL.Standard.StandProcess();
			
			if(!this.IsPostBack)
			{
				if(ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
				{

                    if (Request.Params["isProduct"] != null && Request.Params["isProduct"].Equals("1"))
                    {
                        lab_isProductType.Text = System.Boolean.TrueString;
                        hrefmenuname =Translate.translateString("產品類別工藝設定");
                        titlemenuname = Translate.translateString("產品類別");
                    }
                    else
                    {
                        lab_isProductType.Text = System.Boolean.FalseString;
                        hrefmenuname =Translate.translateString("標準工藝設置");
                        titlemenuname = Translate.translateString("工序類型");
                    }

					BindProcessType();
					bindProcess();

					if (Request.Params["type"] != null)
					{
						dpl_standardtype.SelectedValue = Request.Params["type"];
					}
				}
			}
				
			
		}

		private void BindProcessType()
		{
            bool isProductType = Convert.ToBoolean(lab_isProductType.Text);

			standprocesstype = new WorkFlow.BLL.Standard.StandProcessType();
            dpl_standardtype.DataSource = standprocesstype.GetStandProcessType(isProductType);
			dpl_standardtype.DataTextField = "TypeName";
			dpl_standardtype.DataValueField = "id";
			dpl_standardtype.DataBind();
		}

		private void bindProcess()
		{
            bool isProductType = Convert.ToBoolean(lab_isProductType.Text);
            if (!dpl_standardtype.SelectedValue.Equals(""))
            {
                IList standprocesses = standprocess.GetGroupStandProcessByType(Convert.ToInt32(dpl_standardtype.SelectedValue), isProductType);
                dg_StandProcess.DataSource = standprocesses;
                dg_StandProcess.DataKeyField = "StandardProcessName";
                if (standprocesses.Count <= (dg_StandProcess.CurrentPageIndex) * dg_StandProcess.PageSize && dg_StandProcess.CurrentPageIndex > 0)
                {
                    dg_StandProcess.CurrentPageIndex = dg_StandProcess.CurrentPageIndex - 1;
                }
                dg_StandProcess.DataBind();
            }
           
            //dg_StandProcess.Columns[4].RowMerge = C1.Web.C1WebGrid.RowMergeEnum.Free;
            //dg_StandProcess.Columns[5].RowMerge = C1.Web.C1WebGrid.RowMergeEnum.Free;
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
			this.dpl_standardtype.SelectedIndexChanged += new System.EventHandler(this.dpl_standardtype_SelectedIndexChanged);
			this.dg_StandProcess.SelectedIndexChanged += new System.EventHandler(this.dg_StandProcess_SelectedIndexChanged);
            this.dg_StandProcess.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_StandProcess_PageIndexChanged);
            this.dg_StandProcess.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.dg_StandProcess_DeleteCommand);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void dg_StandProcess_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			dg_StandProcess.CurrentPageIndex=0;
			bindProcess();
		}

        private void dg_StandProcess_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			dg_StandProcess.CurrentPageIndex = e.NewPageIndex;
			bindProcess();
		}

		private void dg_StandProcess_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			Label label_standardprocessName = dg_StandProcess.Items[e.Item.ItemIndex].FindControl("dg_lab_standardProcessName") as Label;
			string standardProcessName = label_standardprocessName.Text.ToString();
			standprocess.DeleteStandProcessByProcessTypeName(dpl_standardtype.SelectedValue,standardProcessName);
			//JG-071122
            dg_StandProcess.CurrentPageIndex = 0;
			bindProcess();
		}

		private void dpl_standardtype_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			dg_StandProcess.CurrentPageIndex=0;
			bindProcess();
		}

        private StandProcessInfo getSelectStandProcess()
        {
            StandProcessInfo spi = null;

            foreach (DataGridItem item in dg_StandProcess.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        spi = new StandProcessInfo();
                        spi.StandardProcessName = item.Cells[2].Text;
                        spi.StandardProcessType = Convert.ToInt32(item.Cells[1].Text);
                        spi.StandardProcessPartNo = item.Cells[3].Text;
                        break;
                    }
                }
            }
            return spi;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            StandProcessInfo spi = getSelectStandProcess();
            if (spi == null)
            {
                Label_Message.Text =Translate.translateString("請選擇標準工藝");
                return;
            }
            string url = "StandardPartAddEdit.aspx?menuid=" + menuid + "&type=" + spi.StandardProcessType.ToString() + "&name=" + spi.StandardProcessName + "&func=edit";
            bool isProductType = Convert.ToBoolean(lab_isProductType.Text);
            if (isProductType)
                url = url + "&isProduct=1&partno=" + spi.StandardProcessPartNo;
            Response.Redirect(url);

        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                StandProcessInfo spi = getSelectStandProcess();
                if (spi == null)
                {
                    Label_Message.Text =Translate.translateString("請選擇標準工藝");
                    return;
                }
                bool isProductType = Convert.ToBoolean(lab_isProductType.Text);
                if (isProductType)
                    Label_Message.Text = Translate.translateString(standprocess.DeleteStandProcessByPartNo(spi.StandardProcessType.ToString(), spi.StandardProcessPartNo));
                else
                    Label_Message.Text = Translate.translateString(standprocess.DeleteStandProcessByProcessTypeName(spi.StandardProcessType.ToString(), spi.StandardProcessName));
                //JG-071122

                bindProcess();
            }
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            string url = "StandardPartAddEdit.aspx?func=add&menuid=" + menuid ;
            bool isProductType = Convert.ToBoolean(lab_isProductType.Text);
            if (isProductType)
                url = url + "&isProduct=1";

            Response.Redirect(url);

        }

        protected void dg_StandProcess_ItemCreated(object sender, DataGridItemEventArgs e)
        {
            bool isProductType = Convert.ToBoolean(lab_isProductType.Text);
            for (int i = 0; i < dg_StandProcess.Columns.Count; i++)
            {
                object dc = dg_StandProcess.Columns[i];
                string fieldname = "";
                if (dc is BoundColumn)
                {
                    fieldname = ((BoundColumn)dc).DataField;
                    if (fieldname.Equals("StandardProcessPartNo"))
                    {
                        if (isProductType)
                            ((BoundColumn)dc).Visible = true;
                        else
                            ((BoundColumn)dc).Visible = false;
                    }
                }

            }
        }

      
	}
}
