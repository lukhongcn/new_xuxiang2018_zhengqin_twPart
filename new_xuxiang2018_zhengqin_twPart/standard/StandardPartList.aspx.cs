﻿using System;
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
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL;

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
		private WorkFlow.BLL.Standard.PartStandProcess standprocess;
		protected System.Web.UI.WebControls.Label lab_title;
		protected System.Web.UI.WebControls.Label lab_typeName;
		protected System.Web.UI.WebControls.DropDownList dpl_standardtype;
		protected System.Web.UI.WebControls.Label Label_Notice;
		protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_href_title;
        protected TextBox txt_processname;

        string menuid = "I02";
        protected string titlemenuname = "";
        protected string hrefmenuname = "";
		private void Page_Load(object sender, System.EventArgs e)
		{
            TmenuInfo mi = new Tmenu().findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                hrefmenuname = mi.Menuname;
                titlemenuname = mi.Menuname;
            }

            standprocess = new WorkFlow.BLL.Standard.PartStandProcess();
			
			if(!this.IsPostBack)
			{
				if(ModuleWorkFlow.BLL.Private.checkPrivate(this,menuid,"PQUERY"))
				{
                   
                    

					BindProcessType();
                  
					bindProcess();

					if (Request.Params["standprocesstype"] != null)
					{
						dpl_standardtype.SelectedValue = Request.Params["standprocesstype"];
					}
				}
			}
				
			
		}

		private void BindProcessType()
		{
         
			standprocesstype = new WorkFlow.BLL.Standard.StandProcessType();
            dpl_standardtype.DataSource = standprocesstype.GetStandProcessType();
			dpl_standardtype.DataTextField = "TypeName";
			dpl_standardtype.DataValueField = "id";
			dpl_standardtype.DataBind();
		}

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {

            dg_StandProcess.CurrentPageIndex = 0;

            bindProcess();
        }

        private void bindProcess()
		{
           
            if (!dpl_standardtype.SelectedValue.Equals(""))
            {
                IList standprocesses = standprocess.GetGroupStandProcessByType(Convert.ToInt32(dpl_standardtype.SelectedValue), txt_processname.Text.Trim());
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
			standprocess.DeleteStandProcessByProcessTypeName(Convert.ToInt32(dpl_standardtype.SelectedValue),standardProcessName);
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
                        spi.StandardProcessName = item.Cells[3].Text;
                        spi.StandardProcessType = Convert.ToInt32(item.Cells[1].Text);
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
                Label_Message.Text =Translate.translateString("請選擇一個標準工藝");
                return;
            }
            string url = "StandardPartAddEdit.aspx?menuid=" + menuid + "&type=" + spi.StandardProcessType.ToString() + "&name=" + spi.StandardProcessName + "&func=edit";
           
            Response.Redirect(url);

        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                StandProcessInfo spi = getSelectStandProcess();
                if (spi == null)
                {
                    Label_Message.Text =Translate.translateString("請選擇一個標準工藝");
                    return;
                }
              
               
                Label_Message.Text = Translate.translateString(standprocess.DeleteStandProcessByProcessTypeName(spi.StandardProcessType, spi.StandardProcessName));
                //JG-071122

                bindProcess();
            }
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            string url = "StandardPartAddEdit.aspx?func=add" ;
          

            Response.Redirect(url);

        }

        protected void lnkbutton_addxls(object sender, EventArgs e)
        {
            string url = "StandardPartlViewExcel.aspx?func=add";


            Response.Redirect(url);

        }

        protected void dg_StandProcess_ItemCreated(object sender, DataGridItemEventArgs e)
        {
          
            //for (int i = 0; i < dg_StandProcess.Columns.Count; i++)
            //{
            //    object dc = dg_StandProcess.Columns[i];
            //    string fieldname = "";
            //    if (dc is BoundColumn)
            //    {
            //        fieldname = ((BoundColumn)dc).DataField;
            //        if (fieldname.Equals("StandardProcessPartNo"))
            //        {
            //            if (isProductType)
            //                ((BoundColumn)dc).Visible = true;
            //            else
            //                ((BoundColumn)dc).Visible = false;
            //        }
            //    }

            //}
        }

      
	}
}
