using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using ModuleWorkFlow.business;
using ModuleWorkFlow.report;
using System.IO;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ICSharpCode.SharpZipLib.Zip;
using ModuleWorkFlow.BLL.StupidReport;
using ModuleWorkFlow.Model.StupidReport;
using ModuleWorkFlow.BLL.System;
using Utility;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for PartList.
    /// </summary>
    public class PartList : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_ModuleId;
        protected System.Web.UI.WebControls.DataGrid DetailDatagrid;
        protected System.Web.UI.WebControls.TextBox txt_moduleid;
       
        protected System.Web.UI.WebControls.Label lab_show;
       
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_old_search;
        protected System.Web.UI.WebControls.Label lab_pagecount;
        protected Label lab_defaultpagecount;
        protected System.Web.UI.WebControls.Label lab_search;
        protected System.Web.UI.WebControls.Label lab_page;
        protected System.Web.UI.WebControls.TextBox txt_mod;
        protected System.Web.UI.WebControls.DropDownList dpl_page;

        protected System.Web.UI.WebControls.LinkButton lnkbutton_view;
        protected System.Web.UI.WebControls.LinkButton lnkbutton_delete;
       

        protected System.Web.UI.WebControls.Label lab_thispage;
        protected System.Web.UI.WebControls.Label lab_totalpage;

        protected System.Web.UI.WebControls.Label lab_totalpagte;
        protected System.Web.UI.WebControls.Label lab_nowpage;
        protected System.Web.UI.WebControls.TextBox txtGoPage;

        protected LinkButton lnkbutton_printSheet;
        protected TextBox txt_partno;
        protected Label lab_pageIndex;
        protected LinkButton lnkbutton_add;
        protected Label lab_type;
        protected Label lab_partno;
        protected string imgpath;
        protected Label lab_color;

       
   
       
        protected string title;
       
       
       
        protected TextBox txt_expectedPartno;
        protected Label lab_count;
   

        private string menuid = "F10";

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (System.Configuration.ConfigurationSettings.AppSettings["IsPart"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["IsPart"]))
            {
               
                lab_page.Visible = false;
                txt_mod.Visible = false;

            }

            string version = System.Configuration.ConfigurationSettings.AppSettings["versionfor"];
            if (version != null && version.Equals("PART"))
            {
              
                lab_page.Visible = false;
                txt_mod.Visible = false;

            }

            title = "零件設定";
            if (Request.Params["type"] != null)
            {
                lab_type.Text = Request.Params["type"];
                lnkbutton_add.Visible = true;
                lnkbutton_delete.Visible = true;
                if (lab_type.Text.Equals("design"))
                {
                    menuid = "F101";
                }

                if (lab_type.Text.Equals("programe"))
                {
                    menuid = "F102";
                }

                if (lab_type.Text.Equals("MDesign"))
                {
                    //menuid = "F15";
                    //lnkbutton_print.Visible = false;
                    //lnkbutton_printSheet.Visible = false;
                    ////lnkbutton_add.Visible = false;
                    ////lnkbutton_delete.Visible = false;
                    ////lab_partno.Visible = false;
                    ////txt_partno.Visible = false;
                    //lab_print.Visible = false;
                    //txt_print.Visible = false;
                    //lab_page.Visible = false;
                    //txt_mod.Visible = false;
                    //title = "設計設定";
                    //MainDataGrid.Columns[1].Visible = false;
                    ////MainDataGrid.Columns[3].Visible = false;
                    //MainDataGrid.Columns[4].Visible = false;
                    //MainDataGrid.Columns[5].Visible = false;
                    //MainDataGrid.Columns[7].Visible = false;
                    //MainDataGrid.Columns[8].Visible = false;
                    //MainDataGrid.Columns[9].Visible = false;
                    //MainDataGrid.Columns[10].Visible = false;
                    //MainDataGrid.Columns[13].Visible = false;
                    //MainDataGrid.Columns[14].Visible = false;
                    //MainDataGrid.Columns[15].Visible = false;
                    //MainDataGrid.Columns[16].Visible = false;
                }
            }
            else
            {
                lab_type.Text = "";
                lnkbutton_add.Visible = false;
                lnkbutton_delete.Visible = false;
            }

            lab_pageIndex.Text = "";

            // Put user code to initialize the page here
            if (!this.IsPostBack)
            {
                //□□北□
                string lines = "10";
                string pagecount = "0";
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");

                //				bindDataCustomer();
                if (Request.Params["pagecount"] != null)
                {

                    pagecount = Request.Params["pagecount"].ToString();
                    lines = Request.Params["lines"].ToString();
                    if (!pagecount.Trim().Equals(""))
                    {
                        lab_pagecount.Text = pagecount;
                    }
                }

                if (Request.Params["pageIndex"] != null)
                {
                    lab_pageIndex.Text = Request.Params["pageIndex"];
                }


                if (Utility.tools.ConvertInt(lines).Equals("") && Convert.ToInt32(lines) > 0)
                {
                    txt_mod.Text = lines;
                    MainDataGrid.PageSize = Convert.ToInt32(lines);
                }

                if (!pagecount.Equals("") && Utility.tools.ConvertInt(pagecount).Equals(""))
                {
                    dpl_page.SelectedValue = pagecount;
                    MainDataGrid.CurrentPageIndex = Convert.ToInt32(pagecount);
                }
                bindDataModule();
                bindColor();
                if (Request.Params["moduleid"] != null)
                {

                    string moduleid = Request.Params["moduleid"].ToString();
                    Dropdownlist_ModuleId.SelectedValue = moduleid;
                    string search = "";

                    if (Request.Params["search"] != null)
                        search = Request.Params["search"].ToString().Trim();
                    if (!search.Trim().Equals(""))
                        lab_old_search.Text = search.Trim();
                    else
                        lab_old_search.Text = moduleid.Trim();


                    if (!moduleid.Equals(""))
                    {
                        MainDataGrid.CurrentPageIndex = Convert.ToInt32(pagecount);
                        bindDataByModuleId(0);
                    }
                    //Dropdownlist_ModuleId.SelectedValue = moduleid;
                    //					lab_pagecount.Text="0";
                }

                
              



               



               

                bindDataByModuleId( 0);
                bindPage();

                
            }
            Label_Message.Text = "";
            string msg = Request.Params["msg"];
            if (msg != null && msg.Length > 0) Label_Message.Text = msg;
        }

        private void bindDataByModuleId(int pagenum)
        {

            Label_Message.Text = "";
            ModuleWorkFlow.Model.PartInfo pi = new ModuleWorkFlow.Model.PartInfo();
            string moduleid = "";


            ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();

            if (!lab_old_search.Text.Trim().Equals(""))
            {
                moduleid = lab_old_search.Text.Trim();
            }
            else
            {
                moduleid = Dropdownlist_ModuleId.SelectedValue.Trim();
            }

            if (!lab_pageIndex.Text.Equals(""))
            {
                MainDataGrid.CurrentPageIndex = 0;
                pagenum = Convert.ToInt32(lab_pageIndex.Text);
            }


            int pagesize = Convert.ToInt32(lab_defaultpagecount.Text);
            if (lab_type.Text.Trim().Equals(""))
            {

                MainDataGrid.PageSize = pagesize;

                int lastItemCount = MainDataGrid.VirtualItemCount % MainDataGrid.PageSize;
                int pagecount = MainDataGrid.VirtualItemCount / pagesize;
                if (lastItemCount > 0 && pagecount > 0)
                {
                    pagecount = pagecount + 1;
                }
                if (MainDataGrid.CurrentPageIndex == pagecount)
                {
                    lastItemCount = 0;
                }
                bool isModuleLike = false;
                if (!txt_moduleid.Text.Trim().Equals(""))
                {
                    isModuleLike = true;
                    moduleid = txt_moduleid.Text.Trim();
                }



                //IList parts = part.GetPartLike(moduleid, txt_partno.Text.Trim(), txt_expectedPartno.Text.Trim(), MainDataGrid.CurrentPageIndex, MainDataGrid.PageSize, pi, isModuleLike, txt_productname.Text.Trim(), startdate, enddate, -1, lab_type.Text);
                //有分頁
                IList parts = part.GetPartLikebypage(moduleid, txt_partno.Text.Trim(), txt_expectedPartno.Text.Trim(), pagenum, MainDataGrid.PageSize, pi, isModuleLike, null, new DateTime(), new DateTime(), -1, false, lab_type.Text, "");

                // 無分頁
                //IList parts = part.GetPartLike(moduleid, txt_partno.Text.Trim(), txt_expectedPartno.Text.Trim(), -1, -1, pi, isModuleLike, txt_productname.Text.Trim(), startdate, enddate, Convert.ToInt32(dpl_processseted.SelectedValue), false, lab_type.Text);

                if (pi.PartLikeCount % pagesize == 0)
                {
                    lab_totalpagte.Text = (pi.PartLikeCount / pagesize).ToString();
                }
                else
                {
                    lab_totalpagte.Text = (pi.PartLikeCount / pagesize + 1).ToString();
                }

                if ((pagenum + 1) > (Convert.ToInt32(lab_totalpagte.Text)))
                {
                    pagenum = 0;
                }

                lab_nowpage.Text = (pagenum + 1).ToString();


                lab_count.Text = pi.PartLikeCount.ToString();


                IList treeParts = part.GetTreePart(parts);


                if (treeParts.Count > 0)
                {
                    MainDataGrid.PageSize = treeParts.Count;
                }

                MainDataGrid.DataSource = treeParts;
            }


           
            

            MainDataGrid.DataBind();

            if (MainDataGrid.Items.Count > 0)
            {
                try
                {
                    Dropdownlist_ModuleId.SelectedValue = moduleid;
                }
                catch { }
            }
            //update list url, and add new url.
        }



        private void bindDataModule()
        {
            int customeriId = 0;
           
            int customerModuleId = -1;
           
            int modelTypeId = -1;
          

            Dropdownlist_ModuleId.DataTextField = "Id";
            Dropdownlist_ModuleId.DataValueField = "Id";
            Dropdownlist_ModuleId.DataSource = new ModuleWorkFlow.BLL.Order().getListOrderInfo(customeriId, customerModuleId, modelTypeId);
            Dropdownlist_ModuleId.DataBind();
            Dropdownlist_ModuleId.Items.Insert(0, "");
        }

       

        private void bindColor()
        {
            ModuleWorkFlow.BLL.Status status = new ModuleWorkFlow.BLL.Status();
            IList sources = status.getStatusInfo();
            ColorConverter cc = new ColorConverter();
            lab_color.Text = "";

            foreach (ModuleWorkFlow.Model.StatusInfo si in sources)
            {
                if (si.StatusId.Equals("Implementation") || si.StatusId.Equals("JIEDAN") || si.StatusId.Equals("Working") || si.StatusId.Equals("Ready") || si.StatusId.Equals("XIAODAN") || si.StatusId.Equals("Pending") || si.StatusId.Equals("Holdon"))
                {
                    lab_color.Text = lab_color.Text + "<font color=\"#" + si.StatusColor.Substring(2).Trim() + "\">" + si.StatusDesc + "</font>";
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
           
           
           
            this.Dropdownlist_ModuleId.SelectedIndexChanged += new System.EventHandler(this.Dropdownlist_ModuleId_SelectedIndexChanged);
            this.txt_mod.TextChanged += new System.EventHandler(this.txt_mod_TextChanged);
            this.dpl_page.SelectedIndexChanged += new System.EventHandler(this.dpl_page_SelectedIndexChanged);
            //this.MainDataGrid.ItemCreated += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemCreated);
            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
            this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion







        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;
            try
            {
                dpl_page.SelectedValue = e.NewPageIndex.ToString();
            }
            catch { }


            lab_old_search.Text = txt_moduleid.Text.Trim();
            lab_search.Text = txt_moduleid.Text.Trim();


            
            bindDataByModuleId(0);
        }



        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            Hashtable hstatus = new Hashtable();
            hstatus = new ModuleWorkFlow.BLL.Status().getKeyStatusInfo();

            PartType parttype = new PartType();


            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {

             
                Label dg_lab_moduleid = e.Item.FindControl("dg_lab_moduleid") as Label;
            
                Label dg_lab_PartCount = e.Item.FindControl("dg_lab_PartCount") as Label;
                Label dg_lab_PartName = e.Item.FindControl("dg_lab_PartName") as Label;
              

                Label dg_lab_PartNo = e.Item.FindControl("dg_lab_PartNo") as Label;
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


                Label dg_lab_PartdetailProcessno = e.Item.FindControl("dg_lab_PartdetailProcessno") as Label;
                Label dg_lab_Id = e.Item.FindControl("dg_lab_Id") as Label;
                Label dg_lnk_Id = e.Item.FindControl("dg_lnk_Id") as Label;
                CheckBox dg_chk_combine = e.Item.FindControl("dg_chk_combine") as CheckBox;
                if (dg_lab_PartdetailProcessno.Text.Equals("0"))
                {
                    dg_lab_Id.Visible = false;
                    dg_lnk_Id.Visible = true;
                    dg_chk_combine.Visible = false;
                    ck.Visible = true;
                    dg_lnk_Id.Text = "<a href='#myModal' data-toggle='modal'  data-remote-target='#myModal .modal-body' data-load-remote='popuppartinfo.aspx?partId=" + dg_lab_Id.Text + "' class='linkbutton1'>" + dg_lab_Id.Text + "</a>";
                }
                else
                {
                    // dg_lab_Id.Visible = false;
                    // dg_lnk_Id.Visible = true;
                    //dg_lnk_Id.Text = "<a href='ParRelation.aspx?PartdetailProcessno=" + dg_lab_PartdetailProcessno.Text + "&pageIndex=" + MainDataGrid.CurrentPageIndex + "' class='processno'>" + dg_lab_Id.Text + "</a>";
                    ck.Visible = false;
                }



               




              

                Label dg_lab_DataTTid = e.Item.FindControl("dg_lab_DataTTid") as Label;
                Label dg_lab_ParentDataTTid = e.Item.FindControl("dg_lab_ParentDataTTid") as Label;

                e.Item.Attributes.Add("data-tt-id", dg_lab_DataTTid.Text);
                e.Item.Attributes.Add("data-tt-parent-id", dg_lab_ParentDataTTid.Text);

            
             
              

                

                Label dg_lab_sendDate = (Label)e.Item.FindControl("dg_lab_sendDate");
                if (dg_lab_sendDate.Text.Equals("01-01 0:00"))
                {
                    dg_lab_sendDate.Text = "";
                }

                Label dueDate = (Label)e.Item.FindControl("dg_lab_dueDate");
                if (dueDate.Text.Equals("01-01 0:00"))
                {
                    dueDate.Text = "";
                }


                if (e.Item.Cells[e.Item.Cells.Count - 1].Text.Equals("01-01-01"))
                {
                    e.Item.Cells[e.Item.Cells.Count - 1].Text = "";
                }

              



                if (partno.Trim().Length > 2)
                {
                    string temppartno = partno.Trim().Substring(partno.Trim().Length - 2);

                    if (temppartno.Equals("PL"))
                    {
                        string partNoPL = partno.Replace("PL", "");
                        BLL.Part part = new BLL.Part();
                        PartInfo pin = part.getPartInfo(dg_lab_moduleid.Text.Trim(), partNoPL.Trim());
                        if (pin != null && !string.IsNullOrEmpty(pin.PartName))
                        {
                            dg_lab_PartName.Text = pin.PartName + "拼料";
                        }
                    }
                }

                if (parttype.GetPartTypeProgarmeByPartNo(partno) != null)
                {
                    ck.Enabled = false;
                    ck.Visible = false;
                }

            }
        }



        private void Dropdownlist_ModuleId_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //MainDataGrid.CurrentPageIndex = 0;
            //lab_old_search.Text="";
            //lab_search.Text="";
            //bindDataByModuleId();
        }

        private void bindPage()
        {
            //int page_count = MainDataGrid.PageCount;

            //int[] page = new int[page_count];
            //for (int i = 0; i < page_count; i++)
            //{
            //    page[i] = i;
            //}

            //dpl_page.DataSource = page;
            //dpl_page.DataBind();

        }

        private void dpl_page_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            int i = Convert.ToInt32(this.dpl_page.SelectedItem.Text);
            MainDataGrid.CurrentPageIndex = i;
            lab_pagecount.Text = i.ToString();

            bindDataByModuleId(0);

        }

        private void txt_mod_TextChanged(object sender, System.EventArgs e)
        {
            int pagecount = 0;

            try
            {
                pagecount = Convert.ToInt32(this.txt_mod.Text);

            }
            catch
            {
                pagecount = 10;
                txt_mod.Text = "10";
            }

            MainDataGrid.CurrentPageIndex = 0;

            MainDataGrid.PageSize = pagecount;


            bindDataByModuleId(0);

            bindPage();
        }

        private DataGridItem getChkedItemKey()
        {
            DataGridItem keyitem = null;
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        keyitem = item;
                        break;
                    }
                }
            }

            return keyitem;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            string PartNolist = "";
            string processnolist = "";
            string ModuleId = "";

            foreach (DataGridItem item in MainDataGrid.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                CheckBox comcb = item.FindControl("dg_chk_combine") as CheckBox;
                if (cb.Checked)
                {
                    ModuleId = ((Label)item.FindControl("dg_lab_moduleid")).Text;

                    PartNolist += "," + ((Label)item.FindControl("dg_lab_PartNo")).Text;
                    //string PartName = ((Label)item.FindControl("dg_lab_PartName")).Text;

                }

                if (comcb.Checked)
                {
                    Label dg_lab_PartdetailProcessno = item.FindControl("dg_lab_PartdetailProcessno") as Label;
                    processnolist += "," + dg_lab_PartdetailProcessno.Text;

                }
            }

            if (!PartNolist.Equals(""))
            {
                string url = "PartModifyEditall.aspx?menuid=" + menuid + "&moduleid=" + ModuleId + "&pageIndex=" + (Convert.ToInt32(lab_nowpage.Text) - 1).ToString() + "&PartNolist=" + PartNolist.Substring(1);
                Response.Redirect(url);
            }
            else
            {
                if (processnolist.Equals(""))
                {
                    Label_Message.Text = "請選擇零件";
                    return;
                }
                else
                {
                    if (new PartDetailRelation().isSamesPartDetailRelationInfos(processnolist) != null)
                    {
                        string url = "ParRelation.aspx?PartdetailProcessno=" + processnolist + "&pageIndex=" + MainDataGrid.CurrentPageIndex;
                        Response.Redirect(url);

                    }
                    else
                    {
                        Label_Message.Text = "這些零件掛靠不相同零件，無法同時掛靠";
                        return;
                    }
                }
            }
        }

        protected void lnkButton_edit_detail_Click(object sender, EventArgs e)
        {
            Session["partlist"] = null;
            List<PartInfo> partlists = new List<PartInfo>();
            ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();

            foreach (DataGridItem item in MainDataGrid.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                if (cb.Checked)
                {
                    string ModuleId = ((Label)item.FindControl("dg_lab_moduleid")).Text;
                    string PartNo = ((Label)item.FindControl("dg_lab_PartNo")).Text;
                    PartInfo pi = part.getPartInfo(ModuleId, PartNo);
                    if (pi != null)
                    {
                        partlists.Add(pi);
                    }

                }
            }

            Session["partlist"] = partlists;
            string searchmoduleid = txt_moduleid.Text.Trim();
           

            Response.Redirect("PartOtherEdit.aspx?menuid=" + menuid + "&moduleid=" + searchmoduleid + "&pageIndex=" + MainDataGrid.CurrentPageIndex);
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            DataGridItem value = getChkedItemKey();

            if (value != null)
            {
                string ModuleId = value.Cells[2].Text;
                string PartNo = value.Cells[3].Text;
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "showPartInfo('" + ModuleId + "','" + PartNo + "' )", true);
            }

        }

       

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL");
            DataGridItem value = getChkedItemKey();

            if (value != null)
            {
                string ModuleId = ((Label)value.FindControl("dg_lab_moduleid")).Text;
                string PartNo = value.Cells[3].Text;
                ModuleWorkFlow.BLL.Part pt = new ModuleWorkFlow.BLL.Part();
                ModuleWorkFlow.Model.PartInfo pi = pt.getPartInfo(ModuleId, PartNo);
                if (pi != null)
                {
                    Label_Message.Text = pt.deleteAllParts(pi);
                    MainDataGrid.CurrentPageIndex = 0;
                    bindDataByModuleId(0);
                }
                else
                {
                    Label_Message.Text = "零件已刪除";
                }
            }

        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            MainDataGrid.CurrentPageIndex = 0;
            lab_old_search.Text = txt_moduleid.Text.Trim();
            lab_search.Text = txt_moduleid.Text.Trim();


            
            bindDataByModuleId(0);
        }

  
        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            Response.Redirect("milePartAddEdit.aspx?func=add&type=" + lab_type.Text);
        }

      

        protected void lnkbutton_print2_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "報表產生中....";
            ReporttemplateInfo rti = new Reporttemplate().GetReporttemplateByNo("PartList");

            if (rti != null)
            {
                string downloadPath = createReport();
                Label_Message.Text += "<a href='" + downloadPath.Replace("//", "/") + "'>打開報表</a>";
            }
        }


        



        protected string createReport()
        {
            IList list = new ArrayList();


            ModuleWorkFlow.BLL.StupidReport.StupidReport report = new ModuleWorkFlow.BLL.StupidReport.StupidReport();

            string moduleid = "";
            string partno = "";
            ModuleWorkFlow.BLL.PartDetail partDetail = new ModuleWorkFlow.BLL.PartDetail();

            if (!lab_old_search.Text.Trim().Equals(""))
            {
                moduleid = lab_old_search.Text.Trim();
            }
            else
            {
                moduleid = Dropdownlist_ModuleId.SelectedValue.Trim();

            }


            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        IList pdilist = new ArrayList();

                        partno = item.Cells[3].Text;
                        if (partno != null)
                        {
                            DataSet ds = partDetail.GetDSPartDetailInfos(moduleid, partno);
                            DataTable dt = ds.Tables[0];

                            foreach (DataRow row in dt.Rows)
                            {
                                PartDetailInfo pdi = new PartDetailInfo();
                                PartInfo pi = new PartInfo();
                                pdi.ModuleId = row["moduleid"].ToString();
                                pdi.PartNo = row["partno"].ToString();
                                pdi.ProcessName = row["processName"].ToString();
                                pdi.ProcessNeedMinutes = Convert.ToInt32(row["processneedminutes"]);
                                if (pdi.ProcessNeedMinutes > 0)
                                {
                                    pdi.ProcessNeedMinutes = pdi.ProcessNeedMinutes / 60;
                                }
                                if (pdi.ModuleId != null || pdi.PartNo != null)
                                {
                                    pi = new ModuleWorkFlow.BLL.Part().getPartInfo(pdi.ModuleId, pdi.PartNo);
                                    if (pi != null)
                                    {
                                        pdi.PartName = pi.PartName;
                                        pdi.PartCount = pi.PartCount;
                                        MaterialInfo mi = new Material().GetMaterialInfo(pi.Material);
                                        if (mi != null)
                                        {
                                            pdi.MaterialName = mi.Name;
                                        }
                                    }

                                }

                                pdilist.Add(pdi);
                            }
                        }
                        list.Add(pdilist);
                        //pdilist.Clear();




                        //keyitem = item;
                        //break;
                    }
                }
            }

            string str = report.CreateReport("PartList", null, list);
            return str;
        }

        //合併兩個工藝路線相同的模具
        protected void lnkbutton_merge_Click(object sender, EventArgs e)
        {
            string ProcessNeedMinutes = "";
            string lastProcessNeedMinutes = "";
            ArrayList amoduleid = new ArrayList();
            //驗證需要合併的工藝路線是否相同
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                if (cb.Checked)
                {
                    ProcessNeedMinutes = ((Label)item.FindControl("dg_lab_ProcessNeedMinutes")).Text;
                    if (!ProcessNeedMinutes.Equals(lastProcessNeedMinutes) && !lastProcessNeedMinutes.Equals(""))
                    {
                        Label_Message.Text = "合併模具的工藝路線不相同！";
                        return;
                    }
                    else
                    {
                        amoduleid.Add(((Label)item.FindControl("dg_lab_moduleid")).Text);
                        lastProcessNeedMinutes = ProcessNeedMinutes;
                    }
                }
            }
            if (amoduleid.Count <= 1)
            {
                Label_Message.Text = "无需合并！";
                return;
            }


            string moduleid = "";
            string partno = "";
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                if (cb.Checked)
                {
                    moduleid = ((Label)item.FindControl("dg_lab_moduleid")).Text;
                    partno = ((Label)item.FindControl("dg_lab_PartNo")).Text;
                    break;
                }
            }
            string newmoduleid = moduleid + "_" + partno + "H";





        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(lab_nowpage.Text) - 1 > 0)
            {
                lab_nowpage.Text = (Convert.ToInt32(lab_nowpage.Text) - 1).ToString();
                try
                {
                    dpl_page.SelectedValue = MainDataGrid.CurrentPageIndex.ToString();
                }
                catch { }
                lab_old_search.Text = txt_moduleid.Text.Trim();
                lab_search.Text = txt_moduleid.Text.Trim();

               
                bindDataByModuleId(Convert.ToInt32(lab_nowpage.Text) - 1);
            }

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(lab_nowpage.Text) < Convert.ToInt32(lab_totalpagte.Text.Trim()))
            {
                lab_nowpage.Text = (Convert.ToInt32(lab_nowpage.Text) + 1).ToString();
                try
                {
                    dpl_page.SelectedValue = MainDataGrid.CurrentPageIndex.ToString();
                }
                catch { }
                lab_old_search.Text = txt_moduleid.Text.Trim();
                lab_search.Text = txt_moduleid.Text.Trim();

              
                bindDataByModuleId( Convert.ToInt32(lab_nowpage.Text) - 1);
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (0 < Convert.ToInt32(txtGoPage.Text) && Convert.ToInt32(txtGoPage.Text) <= Convert.ToInt32(lab_totalpagte.Text))
                {
                    // MainDataGrid.CurrentPageIndex = Convert.ToInt32(txtGoPage.Text) - 1;
                }
                else
                {
                    Label_Message.Text = "請輸入正確頁碼";
                    return;
                }
            }
            catch (Exception ex)
            {
                Label_Message.Text = "請輸入正確頁碼";
                return;
            }

            try
            {
                dpl_page.SelectedValue = MainDataGrid.CurrentPageIndex.ToString();
            }
            catch { }
            lab_old_search.Text = txt_moduleid.Text.Trim();
            lab_search.Text = txt_moduleid.Text.Trim();

           
            bindDataByModuleId( Convert.ToInt32(txtGoPage.Text) - 1);
        }

     

     

        protected void dg_lab_ProcessCard_Click(object sender, EventArgs e)
        {
            string[] processCardlist = ((LinkButton)sender).CommandArgument.ToString().Split(',');
            string processCard = processCardlist[0];
            //string cardpath = Server.MapPath(System.Configuration.ConfigurationSettings.AppSettings["CardPath"]) + processCard;
            string moduleid = processCardlist[1];
            string partno = processCardlist[2];
            string newcardpath = new CreateFileName().renameprocesscard(processCard, moduleid, partno);

            //if (processCard.Contains("Card"))
            //{
            //    if (File.Exists(cardpath))
            //    {
            //        PartInfo pi = new PartInfo();
            //        pi = new BLL.Part().getPartInfo(moduleid, partno);
            //        System.IO.FileInfo fi = new System.IO.FileInfo(cardpath);
            //        string newfilename = new CreateFileName().createCardName(pi, System.IO.Path.GetExtension(cardpath));
            //        newcardpath = Server.MapPath(System.Configuration.ConfigurationSettings.AppSettings["CardPath"]) + newfilename;

            //        fi.MoveTo(newcardpath);

            //        if (File.Exists(newcardpath))
            //        {
            //            //轉換成網絡路徑
            //            newcardpath = HttpContext.Current.Request.ApplicationPath + System.Configuration.ConfigurationSettings.AppSettings["CardPath"] + Path.GetFileName(newcardpath);
            //        }
            //    }
            //}
            //else
            //{
            //    newcardpath = HttpContext.Current.Request.ApplicationPath + System.Configuration.ConfigurationSettings.AppSettings["CardPath"] + processCard;
            //}

            newcardpath = HttpContext.Current.Request.ApplicationPath + "/" + System.Configuration.ConfigurationSettings.AppSettings["CardPath"] + Path.GetFileName(newcardpath);


            Label_Message.Text = "<a href='" + newcardpath.Replace("//", "/") + "'>打開報表</a>"; ; ;
        }
    }
}
