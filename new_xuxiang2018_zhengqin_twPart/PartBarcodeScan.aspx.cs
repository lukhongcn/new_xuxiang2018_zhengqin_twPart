using System;
using System.Collections;
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
using System.IO;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;

using ModuleWorkFlow.BLL.StupidReport;
using ModuleWorkFlow.Model.StupidReport;
using ModuleWorkFlow.BLL.NewOrder;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for PartList.
    /// </summary>
    /// 

    public class PartBarcodeScan : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_ModuleId;
        protected System.Web.UI.WebControls.TextBox txt_moduleid;
        protected Label lab_seach_moduleid;


        protected System.Web.UI.WebControls.Label lab_totalpagte;
        protected System.Web.UI.WebControls.Label lab_nowpage;
        protected System.Web.UI.WebControls.TextBox txtGoPage;

        protected TextBox txt_partnoid;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected string menuname = "";



        private string menuid = "F110";

     

        private void Page_Load(object sender, System.EventArgs e)
		{

            Tmenu menu = new Tmenu();
            TmenuInfo mi = menu.findbykey(menuid);



            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
            }



            // Put user code to initialize the page here
            if (!this.IsPostBack)
			{


                //舦北
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
            Dropdownlist_ModuleId.DataSource = new OrderDesign().GetOrderDesignInfos(" and overdealt=0 "); ;
            Dropdownlist_ModuleId.DataTextField = "moduleid";
            Dropdownlist_ModuleId.DataValueField = "moduleid";
            Dropdownlist_ModuleId.DataBind();
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

       

        private void bindDataByModuleId(string moduleid)
        {
            Label_Message.Text = "";

           
            DataSet ds = ModuleWorkFlow.business.PartProcess.getPartsExceptDesign(moduleid, txt_partnoid.Text.Trim());
            DataTable dt = ds.Tables[0];

            if (dt.Rows.Count % 10 == 0)
            {
                lab_totalpagte.Text = (dt.Rows.Count / 10).ToString();
            }
            else
            {
                lab_totalpagte.Text = (dt.Rows.Count / 10 + 1).ToString();
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
         
         
		
		
		
			this.Load += new System.EventHandler(this.Page_Load);

		}
        #endregion




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
            if (MainDataGrid.CurrentPageIndex > 0)
            {
                //MainDataGrid.CurrentPageIndex --;
                int page = 0;
                if ((Convert.ToInt32(lab_nowpage.Text.Trim()) - 2) >= 0)
                {
                    page = Convert.ToInt32(lab_nowpage.Text.Trim()) - 2;
                }
                MainDataGrid.CurrentPageIndex = page;
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
                    MainDataGrid.CurrentPageIndex = Convert.ToInt32(txtGoPage.Text) - 1;
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




        private void MainDataGrid_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
           
            //if (e.Item.ItemType==ListItemType.AlternatingItem ||e.Item.ItemType==ListItemType.Item)
            //{
            //    Label dg_lab_productname = e.Item.FindControl("dg_lab_productname") as Label;
            //    Label dg_lab_moduleid = e.Item.FindControl("dg_lab_moduleid") as Label;
            //    Label dg_lab_processMachineid = e.Item.FindControl("dg_lab_processMachineid") as Label;

            //    OrderInfo oi = new ModuleWorkFlow.BLL.Order().GetMsOrderInfo(dg_lab_moduleid.Text.Trim());
            //    if (oi != null)
            //    {
            //        dg_lab_productname.Text = oi.PRODUCTNAME;
            //    }
            //    string partno = e.Item.Cells[3].Text;

            //    IList ppis = new ModuleWorkFlow.BLL.PartProcess().getListPartProcessInfoByModulePartNo(dg_lab_moduleid.Text.Trim(), partno);

            //    if( ppis.Count > 0 )
            //    {
            //        PartProcessInfo ppi = ppis[0] as PartProcessInfo;
            //        dg_lab_processMachineid.Text = ppi.ProcessMachineId;
            //    }

            //    if (partno.Equals("999"))
            //    {
            //        CheckBox ck = e.Item.FindControl("chk_datagrid") as CheckBox;
            //        ck.Enabled = false;
            //    }

            //    string oldprocess = e.Item.Cells[10].Text.Trim();
            //    if (!lab_type.Text.Trim().Equals(""))
            //        oldprocess = e.Item.Cells[11].Text.Trim();

            //    string newprocess = "";
            //    string[] il = oldprocess.Split('/');
            //    for (int i=0;i<il.Length;i++)
            //    {
            //        if (il[i] != null && !il[i].Trim().Equals(""))
            //        {
            //            newprocess += Methods.TranslateProcessName(il[i].ToString().Trim())+"/";
            //        }
            //    }
            //    if (newprocess.Length > 0)
            //    {
            //        newprocess = newprocess.Substring(0,newprocess.Length - 1);
            //    }
            //    e.Item.Cells[10].Text = newprocess;

            //    e.Item.Cells[12].Text = new PartDetail().GetProcessneedMinutes(dg_lab_moduleid.Text.Trim(), partno);

            //    Label la =(Label)e.Item.FindControl("dg_lab_parttype1");
            //    if (!la.Text.Trim().Equals("")  && la.Text.Trim() != null)
            //    {
            //        la.Text= bindpartType1(Convert.ToInt32(la.Text));
            //    }
            //    else
            //    {
            //        la.Text="&nbsp;";
            //    }

            //    Label la2 = (Label)e.Item.FindControl("dg_lab_parttype2");
            //    if(!la2.Text.Trim().Equals("") && la2.Text.Trim() != null)
            //    {
            //        la2.Text =bindpartType2(Convert.ToInt32(la2.Text));
            //    }
            //    else
            //    {
            //        la2.Text="&nbsp;";
            //    }
            //    Label dueDate = (Label)e.Item.FindControl("dg_lab_dueDate");
            //    if (dueDate.Text.Equals("01-01-01 0:00"))
            //    {
            //        dueDate.Text = "";
            //    }
            //    Label dg_lab_sendDate = (Label)e.Item.FindControl("dg_lab_sendDate");
            //    if (dg_lab_sendDate.Text.Equals("01-01-01 0:00"))
            //    {
            //        dg_lab_sendDate.Text = "";
            //    }

            //    bool needPicture = false;
            //    ModuleWorkFlow.BLL.ControlTable ct = new ControlTable();
            //    IList ilist = ct.getControlTableByList("tb_part",-1);
            //    foreach (ControlTableInfo cti in ilist)
            //    {
            //        if (cti.TableField.Equals("PartPicture")){
            //            needPicture = true;
            //            break;
            //        }
            //    }

            //    if (needPicture)
            //    {
            //        Label picture = (Label)e.Item.FindControl("picture") as Label;
            //        imgpath = "";
            //        Label htmli = (Label)e.Item.FindControl("dg_img_Picture") as Label;
            //        string src = htmli.Text;
            //        string path = Request.ServerVariables["PATH_TRANSLATED"];
            //        string[] pathquery = path.Split('\\');
            //        path = pathquery[0] + "\\" + pathquery[1] + "\\" + pathquery[2];
            //        if (File.Exists(path + "\\" + src))
            //        {
            //            string url = Request.Url.ToString();
            //            string[] newurl = url.Split('/');
            //            string query = "http://" + newurl[2];
            //            for (int im = 3; im < newurl.Length - 1; im++)
            //            {
            //                query += "/" + newurl[im];
            //            }
            //            imgpath = query + "/" + src;

            //            picture.Text = "<img src=\"" + imgpath + "\" width=\"50px\" height=\"50px\" />";
            //        }
            //        else
            //        {
            //            picture.Text = "";
            //        }
            //    }

            //    if (e.Item.Cells[e.Item.Cells.Count - 1].Text.Equals("01-01-01"))
            //    {
            //        e.Item.Cells[e.Item.Cells.Count - 1].Text = "";
            //    }

            //    if (System.Configuration.ConfigurationSettings.AppSettings["IsPart"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["IsPart"]))
            //    {
            //        e.Item.Cells[14].Visible = false;
            //    }

            //}
		}

        private void Dropdownlist_Customer_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            //MainDataGrid.CurrentPageIndex = 0;
            //bindDataModule(Convert.ToInt32(Dropdownlist_Customer.SelectedValue));
            //bindDataByModuleId(Dropdownlist_ModuleId.SelectedValue);
        }
        
        
	}
}
