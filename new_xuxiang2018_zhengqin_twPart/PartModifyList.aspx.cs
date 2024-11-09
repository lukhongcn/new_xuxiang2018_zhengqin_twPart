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

using ModuleWorkFlow.business;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.StupidReport;
using ModuleWorkFlow.BLL.StupidReport;
using ModuleWorkFlow.BLL.NewOrder;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for PartModifyList.
    /// </summary>
    public class PartModifyList : System.Web.UI.Page
    {
        //protected ModuleWorkFlow.controls.Style Style;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_ModuleId;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.DataGrid DetailDatagrid;
        protected System.Web.UI.WebControls.TextBox txt_moduleid;

        protected System.Web.UI.WebControls.Label lab_totalpagte;
        protected System.Web.UI.WebControls.Label lab_nowpage;
        protected System.Web.UI.WebControls.TextBox txtGoPage;


        protected TextBox txt_partnoid;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_seach_moduleid;
        protected Label lab_type;
        protected string menuid = "F32";

        private static int MODULEID = 0;
        private static int PARTNO = 1;
        private static int PRIORITY = 2;

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (Request.Params["type"] != null && !Request.Params["type"].Trim().Equals(""))
            {
                lab_type.Text = "design";
            }
            else
            {
                lab_type.Text = "";
            }
            // Put user code to initialize the page here
            if (!this.IsPostBack)
            {
                //權限控制
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");

                //				Common.DDL_BindData_CustomerList(Dropdownlist_Customer);
                //				Common.DDL_BindData_ModuleList(Dropdownlist_ModuleId,Dropdownlist_Customer.SelectedValue);
                bindModuleid();

                if (Request.Params["moduleid"] != null)
                {
                    //					string customerid = Request.Params["customerid"].ToString();
                    string moduleid = Request.Params["moduleid"].ToString();

                    //					Methods.DropDownListChange(Dropdownlist_Customer,customerid);
                    //					Common.DDL_BindData_ModuleList(Dropdownlist_ModuleId,Dropdownlist_Customer.SelectedValue);
                    bindModuleid();
                    Methods.DropDownListChange(Dropdownlist_ModuleId, moduleid);
                    try
                    {
                        int pageIndex = Convert.ToInt32(Request.Params["pageindex"]);
                        MainDataGrid.CurrentPageIndex = pageIndex;
                    }
                    catch
                    {
                    }
                }

                bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);

            }
            Label_Message.Text = "";
            string msg = Request.Params["msg"];
            if (msg != null && msg.Length > 0) Label_Message.Text = msg;
        }

        private void bindModuleid()
        {
            Dropdownlist_ModuleId.DataSource = new OrderDesign().GetOrderDesignInfos(" and overdealt=0 and  isModifyModuleOrder=1 "); ;
            Dropdownlist_ModuleId.DataTextField = "moduleid";
            Dropdownlist_ModuleId.DataValueField = "moduleid";
            Dropdownlist_ModuleId.DataBind();
        }

        private void bindDataByModuleId(string moduleid)
        {
            Label_Message.Text = "";

            if (lab_type.Text.Trim().Equals(""))
            {
                DataSet ds = ModuleWorkFlow.business.PartProcess.getPartsExceptDesign(moduleid, txt_partnoid.Text.Trim());
                DataTable dt = ds.Tables[0];

                if (dt.Rows.Count % 10 == 0)
                {
                    lab_totalpagte.Text = (dt.Rows.Count / 10).ToString();
                }
                else
                {
                    lab_totalpagte.Text = (dt.Rows.Count / 10+1).ToString();
                }
                lab_nowpage.Text = (MainDataGrid.CurrentPageIndex + 1).ToString();

                
                IList rows = new ArrayList();
                int endrow = (MainDataGrid.CurrentPageIndex + 1) * 10;
                if (dt.Rows.Count < endrow)
                {
                    endrow = dt.Rows.Count;
                }

                for (int i = MainDataGrid.CurrentPageIndex * 10; i < endrow; i++)
                {
                    rows.Add(dt.Rows[i]);
                }
                //DataRow[] aryrow = new DataRow[rows.Count];


                IList alltreepart = new ArrayList();
                foreach (DataRow row in dt.Rows)
                {
                    alltreepart.Add(row);

                }

                IList treepart = new ArrayList();
                treepart = new ModuleWorkFlow.BLL.PartProcess().AllGetRelationTree(rows);


                MainDataGrid.VirtualItemCount = new ModuleWorkFlow.BLL.PartProcess().AllGetRelationTreeCount(moduleid, txt_partnoid.Text.Trim());

                int lowcount = 0;
                int highcount = 0;
                int pages = 0;
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count % 10 == 0)
                    {
                        pages = ds.Tables[0].Rows.Count / 10;
                    }
                    else
                    {
                        pages = ds.Tables[0].Rows.Count / 10 + 1;
                    }
                }
                else
                {
                    pages = 1;
                }

              
                if (MainDataGrid.VirtualItemCount % pages == 0)
                {
                    highcount = MainDataGrid.VirtualItemCount / pages;
                    lowcount = MainDataGrid.VirtualItemCount / pages;
                }
                else
                {
                    highcount = MainDataGrid.VirtualItemCount / (pages - 1);
                    lowcount = MainDataGrid.VirtualItemCount / pages + 1;
                }


                if (treepart.Count >= lowcount && treepart.Count <= highcount)
                {
                    if (treepart.Count > 0)
                    {
                        MainDataGrid.PageSize = treepart.Count;
                    }
                }
                else
                {
                    if (treepart.Count < lowcount)
                    {
                        MainDataGrid.PageSize = lowcount;
                    }
                    else if (treepart.Count > highcount)
                    {
                        MainDataGrid.PageSize = treepart.Count;
                    }
                }

                MainDataGrid.DataSource = treepart;
              
                
            }
            else
            {
                MainDataGrid.DataSource = ModuleWorkFlow.business.PartProcess.getPartsDesign(moduleid, txt_partnoid.Text.Trim());
            }

            if (MainDataGrid.CurrentPageIndex > MainDataGrid.VirtualItemCount / MainDataGrid.PageSize)
            {
                MainDataGrid.CurrentPageIndex = MainDataGrid.VirtualItemCount / MainDataGrid.PageSize;
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
            this.Dropdownlist_ModuleId.SelectedIndexChanged += new System.EventHandler(this.Dropdownlist_ModuleId_SelectedIndexChanged);
            this.MainDataGrid.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.MainDataGrid_ItemCommand);
            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);
            this.MainDataGrid.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.MainDataGrid_ItemDataBound);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;
            if (lab_seach_moduleid.Text.Trim().Equals(""))
            {
                bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);
            }
            else
            {
                bindDataByModuleId(lab_seach_moduleid.Text.Trim());
            }
        }

        private void MainDataGrid_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            switch (((LinkButton)e.CommandSource).CommandName)
            {

                case "Detail":
                    string moduleid = e.Item.Cells[0].Text.Trim();
                    string partnoid = e.Item.Cells[1].Text.Trim();
                    bindDataDetail(moduleid, partnoid);
                    break;

                default:
                    // Do nothing.
                    break;

            }
        }

        private void bindDataDetail(string moduleid, string partno)
        {
            DetailDatagrid.DataSource = ModuleWorkFlow.business.PartProcess.getPartIDProcessByProcessViewNew(moduleid, partno);
            DetailDatagrid.DataBind();

            //get hours per day from process table
            Hashtable htProcess = ModuleWorkFlow.business.Process.getProcessHoursPerDay();

            for (int i = 0; i < DetailDatagrid.Items.Count; i++)
            {
                string oldprocess = DetailDatagrid.Items[i].Cells[1].Text.Trim();
                DetailDatagrid.Items[i].Cells[1].Text = Methods.TranslateProcessName(oldprocess);
                int minutes = Convert.ToInt32(DetailDatagrid.Items[i].Cells[4].Text);
                DetailDatagrid.Items[i].Cells[4].Text = Methods.FormatMinuteToDayHourMinute(minutes, Convert.ToInt32(htProcess[oldprocess]));
            }
        }

        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
        {
            Label lab_PartNo_Id = e.Item.FindControl("lab_PartNo_Id") as Label;
            if (e.Item.ItemType == ListItemType.Header)
            {
                if (System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"] != null)
                    e.Item.Cells[1].Text = System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"];
                if (System.Configuration.ConfigurationSettings.AppSettings["PartIdShow"] != null)
                    e.Item.Cells[2].Text = System.Configuration.ConfigurationSettings.AppSettings["PartIdShow"];
                    //lab_PartNo_Id.Text = System.Configuration.ConfigurationSettings.AppSettings["PartIdShow"];
            }

            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {

                //if (e.Item.Cells[2].Text.Equals("999-1"))
                if (lab_PartNo_Id.Text.Equals("999-1"))
                {
                    CheckBox ck = e.Item.FindControl("chk_datagrid") as CheckBox;
                    ck.Enabled = false;
                }

                ////IList partprocesses = new ModuleWorkFlow.BLL.PartProcess().getPartProcessByStatusId(e.Item.Cells[1].Text, e.Item.Cells[2].Text, null);
                //IList partprocesses = new ModuleWorkFlow.BLL.PartProcess().getPartProcessByStatusId(e.Item.Cells[1].Text, lab_PartNo_Id.Text, null);
                //string process = "";
                //ProcessCustomer processCustomer = new ProcessCustomer();
                //Hashtable hProcessCustomer = processCustomer.GetCustomerProcessIdProcess();
                //foreach (PartProcessInfo ppi in partprocesses)
                //{
                //    string strProcess = ppi.ProcessName;
                //    if (ppi.CustomerProcessId != null && !ppi.ProcessId.Equals(ppi.CustomerProcessId))
                //    {
                //        strProcess = (hProcessCustomer[ppi.CustomerProcessId] as ProcessCustomerInfo).CustomerProcessName;
                //    }

                //    if (process.Equals(""))
                //    {
                //        process += strProcess;
                //    }
                //    else
                //    {
                //        process += "/" + strProcess;
                //    }
                //}

                Label dg_lab_DataTTid = e.Item.FindControl("dg_lab_DataTTid") as Label;
                Label dg_lab_ParentDataTTid = e.Item.FindControl("dg_lab_ParentDataTTid") as Label;

                e.Item.Attributes.Add("data-tt-id", dg_lab_DataTTid.Text);
                e.Item.Attributes.Add("data-tt-parent-id", dg_lab_ParentDataTTid.Text);

                Label lab_ModuleId = e.Item.FindControl("lab_ModuleId") as Label;
                Label lab_ProcessNo = e.Item.FindControl("lab_ProcessNo") as Label;
                Label Label_ProcessName = e.Item.FindControl("Label_ProcessName") as Label;
                Label dg_lnk_ProcessName = e.Item.FindControl("dg_lnk_ProcessName") as Label;

                if (lab_ProcessNo.Text.Equals("0"))
                {
                    Label_ProcessName.Visible = true;
                    dg_lnk_ProcessName.Visible = false;
                }
                else
                {
                    //Label_ProcessName.Visible = false;
                    //dg_lnk_ProcessName.Visible = true;
                   // dg_lnk_ProcessName.Text = "<a href='PartProcessRelationView.aspx?menuid=F32&moduleid=" + lab_ModuleId.Text + "&pageindex=" + MainDataGrid.CurrentPageIndex + "&PartProcessno=" + lab_ProcessNo.Text + "'>" + Label_ProcessName.Text + "</a>";
                }

               
                //Label_ProcessName.Text = process;
            }


        }

        //		private void Dropdownlist_Customer_SelectedIndexChanged(object sender, System.EventArgs e)
        //		{
        //			MainDataGrid.CurrentPageIndex = 0;
        ////			Common.DDL_BindData_ModuleList(Dropdownlist_ModuleId,Dropdownlist_Customer.SelectedValue);
        ////			//MYD070314-4
        ////			//bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);
        ////			bindDataByCustomerId(Dropdownlist_Customer.SelectedValue);
        //			bindModuleid();
        //		}

        private void Dropdownlist_ModuleId_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            MainDataGrid.CurrentPageIndex = 0;
            lab_seach_moduleid.Text = "";
            bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);
        }



        private string[] getKeys()
        {
            string[] key = new string[3];
            key[MODULEID] = null;
            key[PARTNO] = null;
            key[PRIORITY] = null;
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    Label lab_PartNo_Id = item.FindControl("lab_PartNo_Id") as Label;
                    Label lab_ModuleId = item.FindControl("lab_ModuleId") as Label;
                    if (cb.Checked)
                    {
                        key[MODULEID] = lab_ModuleId.Text;
                        //key[PARTNO] = item.Cells[2].Text;
                        key[PARTNO] = lab_PartNo_Id.Text;
                        key[PRIORITY] = item.Cells[3].Text;
                        break;
                    }
                }
            }

            return key;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            string processnolist = "";
            string ModuleId = "";
            string ProcessName = "";
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
              
                if (cb.Checked)
                {

                    ProcessName = ((Label)item.FindControl("Label_ProcessName")).Text;
                    if (ProcessName.Contains("/"))
                    {
                        processnolist = "";
                        break;
                    }

                    if (ProcessName == "")
                    {
                        processnolist = "";
                        break;
                    }
             
                // ModuleId = ((Label)item.FindControl("lab_ModuleId")).Text;
                // PartNolist += "," + ((Label)item.FindControl("lab_PartNo_Idtemp")).Text;
                //}
                //if (comcb.Checked)
                //{
                    Label dg_lab_PartdetailProcessno = item.FindControl("lab_ProcessNo") as Label;

                    if (!dg_lab_PartdetailProcessno.Text.Trim().Equals("0"))
                    {
                        processnolist += "," + dg_lab_PartdetailProcessno.Text;
                    }
                }
            }


            string[] keys = getKeys();
            if (!processnolist.Equals(""))
            {
                if (new PartprocessRelation().isSamesPartProcessRelationInfos(processnolist) != null)
                {
                        Response.Redirect("PartProcessRelationView.aspx?menuid=F32&moduleid=" + keys[MODULEID] + "&pageindex=" + MainDataGrid.CurrentPageIndex + "&PartProcessno=" + processnolist);
                }
                else
                {
                    Label_Message.Text = "這些零件掛靠不相同零件，無法同時掛靠";
                    return;
                }
            }
            else
            {
                if (keys[MODULEID] != null && keys[PARTNO] != null && keys[PRIORITY] != null)
                {
                    string version = System.Configuration.ConfigurationSettings.AppSettings["versionfor"];
                    if (version == null || !version.Equals("PART"))
                    {
                        Response.Redirect("PartModifyEdit.aspx?menuid=F32&moduleid=" + keys[MODULEID] + "&partnoid=" + keys[PARTNO] + "&priority=" + keys[PRIORITY] + "&pageindex=" + MainDataGrid.CurrentPageIndex);
                    }
                    else
                    {
                        Response.Redirect("ProductModifyEdit.aspx?menuid=F32&moduleid=" + keys[MODULEID] + "&partnoid=" + keys[PARTNO] + "&priority=" + keys[PRIORITY] + "&pageindex=" + MainDataGrid.CurrentPageIndex);
                    }
                }
                else
                {
                    Label_Message.Text = "請選擇零件";
                }
            }
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            string[] keys = getKeys();
            if (keys[MODULEID] != null && keys[PARTNO] != null)
            {
                string moduleid = keys[MODULEID];
                string partnoid = keys[PARTNO];
                bindDataDetail(moduleid, partnoid);
            }
            else
            {
                Label_Message.Text = "請選擇零件";
            }
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            
            MainDataGrid.CurrentPageIndex = 0;
            if (txt_moduleid.Text.Trim().Equals(""))
                lab_seach_moduleid.Text = Dropdownlist_ModuleId.SelectedValue;
            else
                lab_seach_moduleid.Text = txt_moduleid.Text.Trim();
            bindDataByModuleId(lab_seach_moduleid.Text.Trim());
        }




        protected void lnkbutton_print_Click(object sender, EventArgs e)
        {
            Label_Message.Text = "報表產生中....";
            ReporttemplateInfo rti = new Reporttemplate().GetReporttemplateByNo("PartModifyListInfo.xls");
            if (rti != null)
            {
                string downloadPath = createReport(rti.CreateClass, rti.CreateExeclClass);
                Label_Message.Text = "<a href='" + downloadPath.Replace("//", "/") + "'>打開報表</a>";
            }
            //bindData(MainDataGrid.CurrentPageIndex + 1);   
        }

        protected string createReport(string createClass, string createExeclClass)
        {
            string moduleid = "";
            DataSet FactDataset = new DataSet();
            string str = "";
            if (txt_moduleid.Text.Trim().Equals(""))
            {
                moduleid = Dropdownlist_ModuleId.SelectedValue;
            }
            else
            {
                moduleid = txt_moduleid.Text.Trim();
            }

            if (lab_type.Text.Trim().Equals(""))
            {
                FactDataset = ModuleWorkFlow.business.PartProcess.getPartsExceptDesign(moduleid, txt_partnoid.Text.Trim());
            }
            else
            {
                FactDataset = ModuleWorkFlow.business.PartProcess.getPartsDesign(moduleid, txt_partnoid.Text.Trim());
            }
            ModuleWorkFlow.Model.PartProcessInfo ppi = new PartProcessInfo();
            IList FactSource = new ArrayList();
            foreach (DataRow mDr in FactDataset.Tables[0].Rows)
            {
                ppi = new PartProcessInfo();
                ppi.ModuleId = mDr["ModuleId"].ToString();
                ppi.PartNo_Id = mDr["PartNo_Id"].ToString();


                IList partprocesses = new ModuleWorkFlow.BLL.PartProcess().getPartProcessByStatusId(mDr["ModuleId"].ToString(), mDr["PartNo_Id"].ToString(), null);
                string process = "";
                ProcessCustomer processCustomer = new ProcessCustomer();
                Hashtable hProcessCustomer = processCustomer.GetCustomerProcessIdProcess();
                foreach (PartProcessInfo ppin in partprocesses)
                {
                    string strProcess = ppin.ProcessName;
                    if (ppin.CustomerProcessId != null && !ppin.ProcessId.Equals(ppin.CustomerProcessId))
                    {
                        strProcess = (hProcessCustomer[ppin.CustomerProcessId] as ProcessCustomerInfo).CustomerProcessName;
                    }

                    if (process.Equals(""))
                    {
                        process += strProcess;
                    }
                    else
                    {
                        process += "/" + strProcess;
                    }
                }

                ppi.ProcessId = process;
                ppi.Priority = Convert.ToInt32(mDr["priorityname"].ToString());


                FactSource.Add(ppi);
            }

            BLL.StupidReport.NOPIStuipReport st = new NOPIStuipReport();
            str = st.CreateReport("PartModifyListInfo.xls", FactSource);
            return str;
        }

        protected void lnkbutton_mail_Click(object sender, EventArgs e)
        {

            string moduleid = "";
            DataSet FactDataset = new DataSet();
            string str = "";
            if (txt_moduleid.Text.Trim().Equals(""))
            {
                moduleid = Dropdownlist_ModuleId.SelectedValue;
            }
            else
            {
                moduleid = txt_moduleid.Text.Trim();
            }

            if (lab_type.Text.Trim().Equals(""))
            {
                FactDataset = ModuleWorkFlow.business.PartProcess.getPartsExceptDesign(moduleid, txt_partnoid.Text.Trim());
            }
            else
            {
                FactDataset = ModuleWorkFlow.business.PartProcess.getPartsDesign(moduleid, txt_partnoid.Text.Trim());
            }
            ModuleWorkFlow.Model.PartProcessInfo ppi = new PartProcessInfo();
            IList FactSource = new ArrayList();
            foreach (DataRow mDr in FactDataset.Tables[0].Rows)
            {
                ppi = new PartProcessInfo();
                ppi.ModuleId = mDr["ModuleId"].ToString();
                ppi.PartNo_Id = mDr["PartNo_Id"].ToString();


                IList partprocesses = new ModuleWorkFlow.BLL.PartProcess().getPartProcessByStatusId(mDr["ModuleId"].ToString(), mDr["PartNo_Id"].ToString(), null);
                string process = "";
                ProcessCustomer processCustomer = new ProcessCustomer();
                Hashtable hProcessCustomer = processCustomer.GetCustomerProcessIdProcess();
                foreach (PartProcessInfo ppin in partprocesses)
                {
                    string strProcess = ppin.ProcessName;
                    if (ppin.CustomerProcessId != null && !ppin.ProcessId.Equals(ppin.CustomerProcessId))
                    {
                        strProcess = (hProcessCustomer[ppin.CustomerProcessId] as ProcessCustomerInfo).CustomerProcessName;
                    }

                    if (process.Equals(""))
                    {
                        process += strProcess;
                    }
                    else
                    {
                        process += "/" + strProcess;
                    }
                }

                ppi.ProcessId = process;
                ppi.Priority = Convert.ToInt32(mDr["priorityname"].ToString());


                FactSource.Add(ppi);
            }

            string subject = moduleid + "   零件工藝信息";

            Label_Message.Text = new ModuleWorkFlow.BLL.Alert.SendAlert().sendAlert("PartModifyListMail", FactSource, subject);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            if (MainDataGrid.CurrentPageIndex + 1 < Convert.ToInt32(lab_totalpagte.Text.Trim()))
            {
                //MainDataGrid.CurrentPageIndex++;
                MainDataGrid.CurrentPageIndex = Convert.ToInt32(lab_nowpage.Text.Trim());
                if (lab_seach_moduleid.Text.Trim().Equals(""))
                {
                    bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);
                }
                else
                {
                    bindDataByModuleId(lab_seach_moduleid.Text.Trim());
                }
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (MainDataGrid.CurrentPageIndex>0)
            {
                //MainDataGrid.CurrentPageIndex --;
                int page =0;
                if ((Convert.ToInt32(lab_nowpage.Text.Trim()) - 2) >= 0)
                {
                    page = Convert.ToInt32(lab_nowpage.Text.Trim()) - 2;
                }
                MainDataGrid.CurrentPageIndex =page;
                if (lab_seach_moduleid.Text.Trim().Equals(""))
                {
                    bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);
                }
                else
                {
                    bindDataByModuleId(lab_seach_moduleid.Text.Trim());
                }
            }
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            try
            {
                if (0 < Convert.ToInt32(txtGoPage.Text) && Convert.ToInt32(txtGoPage.Text) <= Convert.ToInt32(lab_totalpagte.Text))
                {
                    MainDataGrid.CurrentPageIndex = Convert.ToInt32(txtGoPage.Text)-1 ;
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

            if (lab_seach_moduleid.Text.Trim().Equals(""))
            {
                bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);
            }
            else
            {
                bindDataByModuleId(lab_seach_moduleid.Text.Trim());
            }

        }
    }
}
