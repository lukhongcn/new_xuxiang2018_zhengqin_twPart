using System;
using System.Collections;
using System.Web.SessionState;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using ModuleWorkFlow.business;
using ModuleWorkFlow.report;
using System.IO;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;

using ModuleWorkFlow.BLL.StupidReport;
using ModuleWorkFlow.Model.StupidReport;
using ModuleWorkFlow.Model.System;

namespace ModuleWorkFlow
{
	/// <summary>
	/// Summary description for PartList.
	/// </summary>
    public class ParRelation : System.Web.UI.Page
	{
        protected System.Web.UI.WebControls.DataGrid dg_RelationGrid;
        protected DataGrid MainDataGrid;

		protected System.Web.UI.WebControls.Label Label_Message;
        protected Label lab_PartdetailProcessnos;
        protected Label lab_Processno;
        protected Label lab_moduleid;
        protected Label lab_relPartno;
        protected Label lab_relProcess;
        protected Label lab_pageIndex;
        protected TextBox txt_partno;
 
        protected Label lab_partno;
        protected string imgpath;
        private string menuid = "F10";
   

        protected string title;
    
        protected TextBox txt_expectedPartno;
       
      

        //private Hashtable hPartRela;
	
	    
		private void Page_Load(object sender, System.EventArgs e)
		{

            TmenuInfo mi = new Tmenu().findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                title = mi.Menuname;
            }


            // Put user code to initialize the page here
            if (!this.IsPostBack)
            {
                Session["addparts"] = null;
                Session["addrelations"] = null;
                Session["removeparts"] = null;
                Session["removerealtions"] = null;



                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");
                if (Request.Params["PartdetailProcessno"] != null)
                {

                    string PartdetailProcessno = Request.Params["PartdetailProcessno"].ToString();
                    lab_PartdetailProcessnos.Text = PartdetailProcessno;
                    lab_pageIndex.Text = Request.Params["pageIndex"];
                    IList partdetails = new PartDetailRelation().isSamesPartDetailRelationInfos(lab_PartdetailProcessnos.Text);
                    if (partdetails == null)
                    {
                        Label_Message.Text = "這些零件掛靠相同零件，無法同時掛靠";
                        Response.Redirect("PartList.aspx?menuid=" + menuid + "&moduleid=" + lab_moduleid.Text + "&pageIndex=" + lab_pageIndex.Text);
                    }else
                    {
                        foreach (PartDetailInfo pdi in partdetails)
                        {
                            if (lab_relPartno.Text.Equals(""))
                            {
                                lab_relPartno.Text = pdi.PartNo;
                                lab_relProcess.Text = pdi.ProcessName;
                                lab_Processno.Text = pdi.ProcessNo.ToString();
                            }
                            else
                            {
                                lab_relPartno.Text += "," + pdi.PartNo;
                                lab_relProcess.Text += "," + pdi.ProcessName;
                            }
                        }
                    }
                 
                }

               


                bindData();
              


            }
           
			Label_Message.Text="";
			string msg = Request.Params["msg"];
			if (msg != null && msg.Length > 0) Label_Message.Text = msg;
		}

        private void bindData()
        {
            PartDetailInfo pdi = new PartDetail().findbykey(Convert.ToInt32(lab_Processno.Text));
            if (pdi == null)
            {
                Label_Message.Text = "工藝已刪除，請重新設定";
                return;
            }
            lab_moduleid.Text = pdi.ModuleId;
           
            ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();
            IList relations = new PartDetailRelation().GetPartDetailRelationInfos(pdi.ProcessNo);
            if (Session["addrelations"] != null)
            {
                IList addrelations = Session["addrelations"] as ArrayList;
                foreach (PartDetailRelationInfo pdri in addrelations)
                {
                    if (pdri.Id == 0)
                    {
                        relations.Add(pdri);
                    }
                }
               
            }

            IList removerealtions = new ArrayList();
            if (Session["removerealtions"] != null)
            {
                removerealtions = Session["removerealtions"] as ArrayList;
            }
          

            Hashtable hremoverealtions = new Hashtable();
            foreach (PartDetailRelationInfo pdri in removerealtions)
            {
                hremoverealtions.Add(pdri.ModuleId + "|" + pdri.PartNo,pdri);
            }

            IList resultRealtions = new ArrayList();
            ModuleWorkFlow.BLL.System.PartType parttype = new ModuleWorkFlow.BLL.System.PartType();
            foreach (PartDetailRelationInfo pdri in relations)
            {
                PartTypeInfo pti = parttype.GetPartTypeProgarmeByPartNo(pdri.PartNo);
                if (pti != null && pti.Name.Equals("programe"))
                {
                    continue;
                }
                if (!hremoverealtions.ContainsKey(pdri.ModuleId + "|" + pdri.PartNo) && (lab_relPartno.Text + ",").IndexOf(pdri.PartNo + ",") < 0)
                {
                    resultRealtions.Add(pdri);
                }
            }
            dg_RelationGrid.DataSource = resultRealtions;
            dg_RelationGrid.DataBind();


            IList parts = part.getPartCanBeRealted(pdi, txt_partno.Text.Trim(), txt_expectedPartno.Text.Trim(), lab_relPartno.Text);
            if (Session["addparts"] != null)
            {
                IList addparts = Session["addparts"] as ArrayList;
                foreach (PartInfo pi in addparts)
                {
                    bool canAdd = true;
                    if (!txt_partno.Text.Trim().Equals(""))
                    {
                        canAdd = pi.PartNo.IndexOf(txt_partno.Text.Trim()) > -1;
                    }
                    if (!txt_expectedPartno.Text.Trim().Equals(""))
                    {
                        canAdd = pi.PartNo.IndexOf(txt_expectedPartno.Text.Trim()) < 0;
                    }
                    if (canAdd)
                    {
                        parts.Add(pi);
                    }
                }
               
            }

            IList removeparts = new ArrayList();
            if (Session["removerealtions"] != null)
            {
                removeparts = Session["removeparts"] as ArrayList;
            }
            Hashtable hremoveparts = new Hashtable();
            foreach (PartInfo pi in removeparts)
            {
                hremoveparts.Add(pi.ModuleId + "|" + pi.PartNo, pi);
            }

            string nopartno = "";
            string[] rpartnolist = lab_relPartno.Text.Split(',');

            IList partProcesslist = new BLL.PartProcess().getPartProcessInfo(lab_moduleid.Text);


            foreach (PartProcessInfo ppin in partProcesslist)
            {
                foreach (string partno in rpartnolist)
                {
                    if (partno != "" && ppin.RelationPartNo != null && ppin.RelationPartNo.Contains(partno))
                    {
                        if (!nopartno.Contains(ppin.PartNo))
                        {
                            nopartno += ppin.PartNo + ",";
                        }
                    }
                }
            }

       
            IList resultParts = new ArrayList();
            foreach (PartInfo pi in parts)
            {
                if (!pi.Process.Equals(""))
                {
                    if (!nopartno.Contains(pi.PartNo))
                    {
                        if (!hremoveparts.ContainsKey(pi.ModuleId + "|" + pi.PartNo))
                        {
                            resultParts.Add(pi);
                        }
                    }
                }
            }

            MainDataGrid.DataSource = resultParts;




            bool needPicture = false;
            ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
            IList ilist = ct.getControlTableByList("tb_part", -1);
            foreach (ControlTableInfo cti in ilist)
            {
                if (cti.TableField.Equals("PartPicture"))
                {
                    needPicture = true;
                    break;
                }
            }

            if (needPicture)
            {
                MainDataGrid.Columns[7].Visible = true;
                dg_RelationGrid.Columns[7].Visible = true;
            }
            else
            {
                MainDataGrid.Columns[7].Visible = false;
                dg_RelationGrid.Columns[7].Visible = false;
            }
            if (parts.Count <= MainDataGrid.CurrentPageIndex * MainDataGrid.PageSize && MainDataGrid.CurrentPageIndex>0)
            {
                MainDataGrid.CurrentPageIndex--;
            }
           
            MainDataGrid.DataBind();
			
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
           
            //this.MainDataGrid.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemCreated);
			this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
			this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		

		

		

		private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			MainDataGrid.CurrentPageIndex=e.NewPageIndex;
         
            bindData();            
		}

	

		private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if (e.Item.ItemType==ListItemType.AlternatingItem ||e.Item.ItemType==ListItemType.Item)
			{
                Label dg_lab_moduleid = e.Item.FindControl("dg_lab_moduleid") as Label;
                
                Label dg_lab_PartCount = e.Item.FindControl("dg_lab_PartCount") as Label;
                Label dg_lab_PartNo = e.Item.FindControl("dg_lab_PartNo") as Label;
                CheckBox chk_datagrid = e.Item.FindControl("chk_datagrid") as CheckBox;
                string partno = dg_lab_PartNo.Text;
              
              
                CheckBox ck = e.Item.FindControl("chk_datagrid") as CheckBox;
                if (partno.Equals("999"))
                {
                   
                    ck.Enabled = false;
                }

                if (dg_lab_PartCount.Text.Equals("0"))
                {
                    dg_lab_PartCount.Text = "&nbsp;";
                }


                bool needPicture = false;
                ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
                IList ilist = ct.getControlTableByList("tb_part",-1);
                foreach (ControlTableInfo cti in ilist)
                {
                    if (cti.TableField.Equals("PartPicture")){
                        needPicture = true;
                        break;
                    }
                }

                if (needPicture)
                {
                    Label picture = (Label)e.Item.FindControl("picture") as Label;
                    imgpath = "";
                    Label htmli = (Label)e.Item.FindControl("dg_img_Picture") as Label;
                    string src = htmli.Text;
                    string path = Request.ServerVariables["PATH_TRANSLATED"];
                    string[] pathquery = path.Split('\\');
                    path = pathquery[0] + "\\" + pathquery[1] + "\\" + pathquery[2];
                    if (File.Exists(path + "\\" + src))
                    {
                        string url = Request.Url.ToString();
                        string[] newurl = url.Split('/');
                        string query = "http://" + newurl[2];
                        for (int im = 3; im < newurl.Length - 1; im++)
                        {
                            query += "/" + newurl[im];
                        }
                        imgpath = query + "/" + src;

                        picture.Text = "<img src=\"" + imgpath + "\" width=\"50px\" height=\"50px\" />";
                    }
                    else
                    {
                        picture.Text = "";
                    }
                }

              

                //if (e.Item.Cells[e.Item.Cells.Count - 1].Text.Equals("01-01-01"))
                //{
                //    e.Item.Cells[e.Item.Cells.Count - 1].Text = "";
                //}

                //if (System.Configuration.ConfigurationSettings.AppSettings["IsPart"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["IsPart"]))
                //{
                //    e.Item.Cells[14].Visible = false;
                //}

             
                

			}
		}

        protected void lnkbutton_view_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("PartList.aspx?menuid=" + menuid + "&moduleid=" + lab_moduleid.Text + "&pageIndex=" + lab_pageIndex.Text);
            
        }



        protected void lnkbutton_search_Click(object sender, System.EventArgs e)
		{
            MainDataGrid.CurrentPageIndex = 0;
            bindData();
		}

        protected void lnkbutton_save_Click(object sender, System.EventArgs e)
        {
            IList partnos = new ArrayList();
            int totalPartCount = 0;
            foreach (DataGridItem item in dg_RelationGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    Label dg_lab_PartNo = item.FindControl("dg_lab_PartNo") as Label;
                    Label dg_lab_PartCount = item.FindControl("dg_lab_PartCount") as Label;
                    totalPartCount += Convert.ToInt32(dg_lab_PartCount.Text);
                    partnos.Add(dg_lab_PartNo.Text.Trim());
                }
            }

            int leastPartCount = 0;
           
            if (leastPartCount > totalPartCount)
            {
                Label_Message.Text = "最小開始數量不允許大於總的關聯零件數量";
                return;
            }
            IList partdetails = new PartDetailRelation().isSamesPartDetailRelationInfos(lab_PartdetailProcessnos.Text);
            if (partdetails == null)
            {
                Label_Message.Text = "這些零件掛靠不相同零件，無法同時掛靠";
                
            }
            else
            {
                foreach (PartDetailInfo pdi in partdetails)
                {
                    Label_Message.Text = new PartDetail().updatePartDetailRela(pdi.ProcessNo, partnos);
                }
            }
            Session["addparts"] = null;
            Session["addrelations"] = null;
            Session["removeparts"] = null;
            Session["removerealtions"] = null;
        }

        protected void MainDataGrid_CheckedChanged(object sender, EventArgs e)
        {
            DataGridItem item = (sender as CheckBox).Parent.Parent as DataGridItem;
            Label dg_lab_moduleid = item.FindControl("dg_lab_moduleid") as Label;
            Label dg_lab_PartNo = item.FindControl("dg_lab_PartNo") as Label;
            PartInfo pi = new ModuleWorkFlow.BLL.Part().getPartInfo(dg_lab_moduleid.Text.Trim(),dg_lab_PartNo.Text.Trim());
            PartDetailRelationInfo pdri = new PartDetailRelation().GetPartDetailRelationInfo(Convert.ToInt32(lab_Processno.Text), pi.Id);
            if (pdri == null)
            {
                pdri = new PartDetailRelationInfo();
                pdri.Id = 0;
            }
            pdri.ModuleId = dg_lab_moduleid.Text;
            pdri.PartNo = dg_lab_PartNo.Text;

            Label dg_lab_MaterialName = item.FindControl("dg_lab_MaterialName") as Label;
            pdri.MaterialName = dg_lab_MaterialName.Text;

            Label dg_lab_PartCount = item.FindControl("dg_lab_PartCount") as Label;
            try
            {
                pdri.PartCount = Convert.ToInt32(dg_lab_PartCount.Text);
            }catch
            {

            }

            Label dg_lab_PartName = item.FindControl("dg_lab_PartName") as Label;
            pdri.PartName = dg_lab_PartName.Text;

            Label dg_img_Picture = item.FindControl("dg_img_Picture") as Label;
            pdri.PartPicture = dg_img_Picture.Text;

            IList addrelations = new ArrayList();
            if (Session["addrelations"] != null)
            {
                addrelations = Session["addrelations"] as ArrayList;
            }
            addrelations.Add(pdri);
            Session["addrelations"] = addrelations;

            IList removerealtions = new ArrayList();
            if (Session["removerealtions"] != null)
            {
                removerealtions = Session["removerealtions"] as ArrayList;
            }

            int removeRealtionsIndex = -1;
            foreach (PartDetailRelationInfo removepdri in removerealtions)
            {
                if (removepdri.ModuleId.Equals(pdri.ModuleId) && removepdri.PartNo.Equals(pdri.PartNo))
                {
                    removeRealtionsIndex = removerealtions.IndexOf(removepdri);
                    break;
                }
            }

            if (removeRealtionsIndex > -1)
            {
                removerealtions.RemoveAt(removeRealtionsIndex);
            }
            Session["removerealtions"] = removerealtions;





            IList removeparts = new ArrayList();
            if (Session["removeparts"] != null)
            {
                removeparts = Session["removeparts"] as ArrayList;
            }
            removeparts.Add(pi);
            Session["removeparts"] = removeparts;

            IList addparts = new ArrayList();
            if (Session["addparts"] != null)
            {
                addparts = Session["addparts"] as ArrayList;
                int indexAddparts = -1;
                foreach(PartInfo addpi in addparts)
                {
                    if (addpi.ModuleId.Equals(pi.ModuleId) && addpi.PartNo.Equals(pi.PartNo))
                    {
                        indexAddparts = addparts.IndexOf(addpi);
                        break;
                    }
                }

                if (indexAddparts > -1)
                {
                    addparts.RemoveAt(indexAddparts);
                }
            }

            addparts.Add(pi);
            Session["addparts"] = addparts;


            bindData();



            


        }

        protected void dg_RelationGrid_CheckedChanged(object sender, EventArgs e)
        {
            DataGridItem item = (sender as CheckBox).Parent.Parent as DataGridItem;
            Label dg_lab_moduleid = item.FindControl("dg_lab_moduleid") as Label;
            Label dg_lab_PartNo = item.FindControl("dg_lab_PartNo") as Label;
            PartInfo pi = new ModuleWorkFlow.BLL.Part().getPartInfo(dg_lab_moduleid.Text.Trim(), dg_lab_PartNo.Text.Trim());
            IList addparts = new ArrayList();
            if (Session["addparts"] != null)
            {
                addparts = Session["addparts"] as ArrayList;
                int indexAddparts = -1;
                foreach (PartInfo addpi in addparts)
                {
                    if (addpi.ModuleId.Equals(pi.ModuleId) && addpi.PartNo.Equals(pi.PartNo))
                    {
                        indexAddparts = addparts.IndexOf(addpi);
                        break;
                    }
                }

                if (indexAddparts > -1)
                {
                    addparts.RemoveAt(indexAddparts);
                }
                else
                {
                    addparts.Add(pi);
                }
            }
            else
            {
                addparts.Add(pi);
            }
            Session["addparts"] = addparts;

            IList  removeparts = new ArrayList();
            if ( Session["removeparts"] != null)
            {
                removeparts = Session["removeparts"] as ArrayList;
                int indexRemoveparts = -1;
                foreach (PartInfo removepi in removeparts)
                {
                    if (removepi.ModuleId.Equals(pi.ModuleId) && removepi.PartNo.Equals(pi.PartNo))
                    {
                        indexRemoveparts = removeparts.IndexOf(removepi);
                        break;
                    }
                }

                if (indexRemoveparts > -1)
                {
                    removeparts.RemoveAt(indexRemoveparts);
                }

            }
            Session["removeparts"] = removeparts;





            IList removerealtions = new ArrayList();
            if (Session["removerealtions"] != null)
            {
                removerealtions = Session["removerealtions"] as ArrayList;
            }


            PartDetailRelationInfo pdri = new PartDetailRelation().GetPartDetailRelationInfo(Convert.ToInt32(lab_Processno.Text), pi.Id);
            if (pdri == null)
            {
                pdri = new PartDetailRelationInfo();
                pdri.Id = 0;
            }
            pdri.ModuleId = dg_lab_moduleid.Text;
            pdri.PartNo = dg_lab_PartNo.Text;

            Label dg_lab_MaterialName = item.FindControl("dg_lab_MaterialName") as Label;
            pdri.MaterialName = dg_lab_MaterialName.Text;

            Label dg_lab_PartCount = item.FindControl("dg_lab_PartCount") as Label;
            pdri.PartCount = Convert.ToInt32(dg_lab_PartCount.Text);

            Label dg_lab_PartName = item.FindControl("dg_lab_PartName") as Label;
            pdri.PartName = dg_lab_PartName.Text;

            Label dg_img_Picture = item.FindControl("dg_img_Picture") as Label;
            pdri.PartPicture = dg_img_Picture.Text;

            removerealtions.Add(pdri);
            Session["removerealtions"] = removerealtions;

            int addRealtionsIndex = -1;
            IList addrelations = new ArrayList();
            if (Session["addrelations"] != null)
            {
                addrelations = Session["addrelations"] as ArrayList;
            }
            foreach (PartDetailRelationInfo addpdri in addrelations)
            {
                if (addpdri.ModuleId.Equals(pdri.ModuleId) && addpdri.PartNo.Equals(pdri.PartNo))
                {
                    addRealtionsIndex = addrelations.IndexOf(addpdri);
                    break;
                }
            }

            if (addRealtionsIndex > -1)
            {
                addrelations.RemoveAt(addRealtionsIndex);
            }
            addrelations.Remove(pdri);
            Session["addrelations"] = addrelations;
            bindData();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string url = "PartModifyEditall.aspx?menuid=" + menuid + "&moduleid=" + lab_moduleid.Text + "&pageIndex=0 &PartNolist=" + lab_relPartno.Text.Split(',')[0];
            Response.Redirect(url);
        }
	}
}
