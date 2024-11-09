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
using System.IO;

using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.BLL.Try;
using ModuleWorkFlow.Model.NewOrder;
using Utility;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;
using System.Runtime.InteropServices;
using System.Reflection;
using System.Collections.Generic;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for ProjectAdd.
    /// </summary>
    public class ProjectAdd : System.Web.UI.Page
    {
        #region variable

       
        protected System.Web.UI.WebControls.TextBox txt_productEndDate;
       

        protected System.Web.UI.WebControls.Button Button1;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_pageIndex;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
   
        #endregion

        //private int tx;
        protected System.Web.UI.WebControls.Button btn_search;
        protected System.Web.UI.WebControls.TextBox txt_moduleid;
       
        protected System.Web.UI.WebControls.TextBox Textbox_XIUMOBIANHAO;
        protected TextBox txt_productCount;


        protected System.Web.UI.WebControls.CheckBox chk_overdealt;
        protected CheckBox chk_newmodule;
        
       
        protected System.Web.UI.WebControls.Label lab_moduleid;
     
        private int ty;
      
        protected LinkButton lnkbutton_save;
        protected string ObjectPartNoSearch = "";
       
        protected TextBox txt_trydate0time;
        private string menuid = "F37";
        protected string menuname;


        private void Page_Load(object sender, System.EventArgs e)
        {
           
            if (!this.IsPostBack)
            {

                if (this.Master != null && this.Master is DefaultSub)
                {
                    DefaultSub master = (DefaultSub)this.Master;
                    TmenuInfo mi = new Tmenu().findbykey(menuid);
                    master.Menuname = mi.Menuname;
                    menuname = mi.Menuname;
                }

                 
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
              
                Textbox_XIUMOBIANHAO.Enabled = false;
                


            }


        }





      






       

      




     


       

        private void BindDropDownList(DropDownList ddl, DataView dv)
        {
            ddl.DataTextField = "TextField";
            ddl.DataValueField = "ValueField";
            ddl.DataSource = dv;
            ddl.DataBind();
        }
        private void BindDropDownList(DropDownList ddl, object dv, string textfield, string valuefield)
        {
            ListItem li = new ListItem(Lang.TXT_SELECTNAME, Lang.TXT_SELECTVALUE);
            ddl.DataTextField = textfield;
            ddl.DataValueField = valuefield;
            ddl.DataSource = dv;
            ddl.DataBind();
            ddl.Items.Insert(0, li);
        }

        private void ModuleChanged(string moduleid)
        {
            DataRow dr = ModuleWorkFlow.business.Order.getOrderViewByModuleId(moduleid);
            if (dr != null)
            {
                ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
                ModuleWorkFlow.Model.NewOrder.OrderDesignInfo oi = order.GetOrderDesignByModuleId(moduleid);
                if (oi != null && oi.IsModifyModuleOrder == 0)
                {
                    txt_trydate0time.Text = oi.TryDate0.ToShortDateString();
                    txt_productEndDate.Text = oi.ProductEndDate.ToString();

                }
                else
                {
                    Label_Message.Text = Translate.translateString("只能對產批進行返修");
                    return;
                }

                IList orders = order.GetNewOrderLike(moduleid + "(FW");
                if (orders.Count > 0)
                {

                    Textbox_XIUMOBIANHAO.Text = tools.GenerateNextSerialNumber((orders[0] as OrderDesignInfo).ModuleId);
                }
                else
                {
                    Textbox_XIUMOBIANHAO.Text = moduleid + "(FW001)";
                }

                bindDataByModuleId();

            }

        }

        private void bindDataByModuleId()
        {
            string moduleid = txt_moduleid.Text;

            Label_Message.Text = "";
           
            ModuleWorkFlow.BLL.Part part = new ModuleWorkFlow.BLL.Part();
              
            IList parts = part.getPartInfo(moduleid.Trim());

            MainDataGrid.DataSource = parts;
            
            MainDataGrid.DataBind();

           
        }


        private string getUserDisplayName(string username, DataTable dt)
        {
            string ret = "";
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["username"].ToString().Equals(username))
                {
                    ret = dr["displayname"].ToString();
                    break;
                }
            }
            return ret;
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
          
           
            //this.btn_search.Click += new System.EventHandler(this.btn_search_Click);
           
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

       


       

       

     

      

     


        private void Add()
        {
            string moduleid = txt_moduleid.Text.Trim();
            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
            ModuleWorkFlow.Model.NewOrder.OrderDesignInfo oi = order.GetOrderDesignByModuleId(moduleid);

            if (oi == null)
            {
                Label_Message.Text = Lang.TXT_PARTMODULEID_NO_EXISTED;
                return;
            }


            oi.ModuleId = Textbox_XIUMOBIANHAO.Text;
            try
            {
                oi.TryDate0 = Convert.ToDateTime(txt_trydate0time.Text);
                if (string.IsNullOrEmpty(txt_productEndDate.Text.Trim()))
                {
                    oi.ProductEndDate = oi.TryDate0.AddDays(-2);
                }
                else
                {
                    oi.ProductEndDate = Convert.ToDateTime(txt_productEndDate.Text);
                }
            }
            catch
            {
                Label_Message.Text = Translate.translateString("請輸入正確日期格式");
                return;
            }

            try
            {
                oi.ProductNumber = Convert.ToInt32(txt_productCount.Text);
            }catch
            {
                Label_Message.Text = Translate.translateString("請輸入正確的数字");
                return;
            }

            string userno = "";
            if (Session["userid"] != null)
            {
                userno = Session["userid"].ToString();
            }
            oi.Creater = userno;
            oi.CreateDate = DateTime.Now;
            IList source = new ArrayList();
            source.Add(order.insertAllOrderDesign(oi));
            if (!new Schedule().SaveSchedule(source))
            {
                Label_Message.Text = Lang.SAVE_FAIL;
                return;
            }

            //得到產品列表
            IList sourceparts = new Part().getPartInfo(moduleid);
            List<PartInfo> parts = new List<PartInfo>();
            
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");

                    if (cb.Checked)
                    {
                        Label dg_lab_PartNo = item.FindControl("dg_lab_PartNo") as Label;
                        foreach (PartInfo partInfo in sourceparts)
                        {
                            if (partInfo.PartNo.Equals(dg_lab_PartNo.Text))
                            {
                                
                                TextBox dg_txt_dueDate = item.FindControl("dg_txt_dueDate") as TextBox;
                                try
                                {

                                    partInfo.DueDate = Convert.ToDateTime(dg_txt_dueDate.Text);
                                }
                                catch
                                {
                                    Label_Message.Text = dg_txt_dueDate.Text + Lang.TXT_DATEERROR;
                                    return;
                                }

                                TextBox dg_txt_ProductNumber = item.FindControl("dg_txt_ProductNumber") as TextBox;
                                try
                                {
                                    partInfo.EachBatchCount = Convert.ToInt32(dg_txt_ProductNumber.Text);
                                }catch
                                {
                                    Label_Message.Text = dg_txt_ProductNumber.Text + Lang.INPUT_NUMBER;
                                    return;
                                }
                                partInfo.PartCount = 1;
                                parts.Add(partInfo);

                            }
                        }
                      
                       
                       
                        

                       
                    }
                }
            }

            if (parts.Count == 0)
            {
                Label_Message.Text = Translate.translateString("請至少選擇一個需要生產的產品");
                return;
            }

            //講原廠批複製到返修廠批中
            OrderDesignInfo sourceOI = order.GetOrderDesignByModuleId(moduleid);
            if (sourceOI.IsModifyModuleOrder == 1)
            {
                Label_Message.Text = Translate.translateString("只能對產批進行返修");
                return;
            }
            OrderDesignInfo RWOI = order.GetOrderDesignByModuleId(Textbox_XIUMOBIANHAO.Text);

            PartOrderDesign partOrder = new PartOrderDesign();
            Label_Message.Text = partOrder.CopyOrders(sourceOI, RWOI, parts);

            if (!Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
            {
                return;
            }

            Label_Message.Text = "";




            ProjectInfo pi = new ProjectInfo();
            pi.Try0 = oi.TryDate0;
            pi.ProductEndDate = oi.ProductEndDate;
            pi.ProductNumber = oi.ProductNumber;
          





            ModuleWorkFlow.BLL.Project p = new ModuleWorkFlow.BLL.Project();

            IList ippi = new ArrayList();
            IList ipsi = new ArrayList();

            pi.PROJECTID = p.getNewProjectId();

            pi.MODULEID = RWOI.ModuleId;
            string moduleformat = ModuleWorkFlow.BLL.ModuleEngineerNumber.FIX_MOVE_MOUDLE;
            ModuleWorkFlow.BLL.ModuleEngineerNumber engineer = new ModuleWorkFlow.BLL.ModuleEngineerNumber();
            pi.MODIFYID = engineer.GetEngineerNumber(Textbox_XIUMOBIANHAO.Text.Trim(), moduleformat);
           

            int typeid = 9;
            string types = "";

            


            pi.TYPEID = typeid;
            pi.TYPES = types;




          

            pi.CREATEDATE = DateTime.Now;

          

            pi.CreateNo = userno;
            bool b = p.AddProject(pi, ippi, ipsi);
            if (b)
            {
                PartModifyModule partModifyModule = new PartModifyModule();
                partModifyModule.CreateNewModifyModuleOrder(pi);

            }
            else
            {
                Label_Message.Text = Lang.TXT_OPERATIONERROR;
            }

            OrderDesignInfo SUBOI = order.GetOrderDesignByModuleId(pi.MODIFYID);
            if (SUBOI == null)
            {
                Label_Message.Text = Lang.TXT_PARTMODULEID_NO_CREATED;
                return;
            }
            Label_Message.Text = partOrder.CopyOrders(RWOI, SUBOI, parts);

        }






        


    

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            Add();
            if (Label_Message.Text.Equals(Lang.TXT_ADDSUCCESS))
            {
                lnkbutton_save.Enabled = false;
                lnkbutton_save.CssClass = "btn3u";
            }
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectAdd.aspx?menuid=" + menuid);

        }



       

      
        protected void txt_moduleid_TextChanged(object sender, EventArgs e)
        {
            OrderDesign order = new OrderDesign();
            string moduleid = txt_moduleid.Text.Trim();
           
            if (order.GetOrderDesignByModuleId(moduleid) != null)
            {
                ModuleChanged(moduleid);
              
            }
            else
            {
                Label_Message.Text = Translate.translateString("請輸入正確的模具編號");
                
            }
        }

      

       

      
       
        protected void MainDataGrid_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;
            bindDataByModuleId();
        }

        protected void MainDataGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                TextBox dg_txt_dueDate = e.Item.FindControl("dg_txt_dueDate") as TextBox;
                dg_txt_dueDate.Text = txt_productEndDate.Text;
            }
        }
    }
}
