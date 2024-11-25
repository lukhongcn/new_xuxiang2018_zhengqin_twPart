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

using Utility;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for SceneSmallOperating.
    /// </summary>
    public class ProcessHelp : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.TextBox txt_processid;
        protected System.Web.UI.WebControls.TextBox txt_processname;
        protected System.Web.UI.WebControls.Button btn_save;
        protected System.Web.UI.WebControls.Label lab_message;
        protected System.Web.UI.WebControls.DropDownList ddl_needschedule;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.DropDownList dpl_priceType;
        protected System.Web.UI.WebControls.Label dg_lab_pricetype;
        protected System.Web.UI.WebControls.Label lab_priceType;
        protected System.Web.UI.WebControls.DropDownList dpl_processgroups;
        protected System.Web.UI.WebControls.TextBox txt_comment;
        protected System.Web.UI.WebControls.Label dg_lab_price;
        protected System.Web.UI.WebControls.TextBox dg_txt_price;
        protected System.Web.UI.WebControls.Label lab_price;
        protected System.Web.UI.WebControls.Label lab_func;
        protected System.Web.UI.WebControls.TextBox txt_price;
        protected System.Web.UI.WebControls.Label lab_process;
        protected System.Web.UI.WebControls.TextBox txt_process;
        protected System.Web.UI.WebControls.DropDownList dpl_startdirectly;

        string menuid = "A53";
        protected string titlemenuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                TmenuInfo mi = new Tmenu().findbykey(menuid);
                if (this.Master != null && this.Master is DefaultSub)
                {
                    DefaultSub master = (DefaultSub)this.Master;

                    master.Menuname = mi.Menuname;
                    titlemenuname = mi.Menuname;
                }
                //權限控制

                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    //BindDataProcess();
                    bindData();
                    bindprocessGroups();
                }
            }
        }

        public void bindData()
        {
            ModuleWorkFlow.BLL.Process process = new Process();
            IList sources = new ArrayList();
            //if (lab_process.Text.Trim().Equals(""))
            //{
            sources = process.GetProcessInfo();
            //}
            //else 
            //{
            //    sources = process.getProcesslikeProcess(lab_process.Text);
            //}
            MainDataGrid.DataSource = sources;
            MainDataGrid.DataKeyField = "ProcessId";
            MainDataGrid.DataBind();
        }



        public void bindprocessGroups()//邦定工時分類
        {
            ModuleWorkFlow.BLL.ProcessGroups pg = new ProcessGroups();
            IList li = pg.GetProcessGroupsInfos();
            ModuleWorkFlow.Model.ProcessGroupsInfo pgi = new ProcessGroupsInfo();
            pgi.Id = 0;
            pgi.Processname = "空";
            li.Insert(0, pgi);
            dpl_processgroups.DataSource = li;
            dpl_processgroups.DataTextField = "processname";
            dpl_processgroups.DataValueField = "Id";
            dpl_processgroups.DataBind();
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

            this.MainDataGrid.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.MainDataGrid_PageIndexChanged);

            this.btn_save.Click += new System.EventHandler(this.btn_save_Click);
            //this.but_select.Click += new System.EventHandler(this.but_select_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void btn_save_Click(object sender, System.EventArgs e)
        {

            //ModuleWorkFlow.BLL.Process pss = new Process();
            //if (txt_processid.Text.Trim().Equals("") || txt_processname.Text.Trim().Equals(""))
            //{
            //    lab_message.Text = "工序編號，工序名稱不能為空"; //lab_message.Text + Lang.NO_ERROR;
            //    return;
            //}
            //if (!ConvertString.ConvertToEnglish(txt_processid.Text))
            //{

            //    lab_message.Text = txt_processid.Text + " " + Lang.NO_ENGLISH;
            //    return;
            //}
            //if (!pss.checkProcessNameSlash(txt_processname.Text.Trim()))
            //{
            //    lab_message.Text = "工序名稱不能有特殊符號'/'";
            //    return;
            //}

            //if (!lab_func.Text.Equals("edit"))
            //{
            //    if (!pss.checkProcess(txt_processid.Text.Trim()))
            //    {
            //        lab_message.Text = "工序編號已存在，請重新填寫";
            //        return;
            //    }

            //    if (!pss.checkProcessName(txt_processname.Text.Trim(), txt_processid.Text))
            //    {
            //        lab_message.Text = "工序名稱已存在，請重新填寫";
            //        return;
            //    }
            //}




            //try
            //{
            //    ModuleWorkFlow.BLL.Process process = new Process();
            //    ModuleWorkFlow.Model.ProcessInfo pi = new ModuleWorkFlow.Model.ProcessInfo();
            //    pi.ProcessId = txt_processid.Text.Trim();
            //    pi.ProcessName = txt_processname.Text.Trim();
            //    pi.ListOrder = 250;
            //    pi.NeedSchedule = Convert.ToInt32(ddl_needschedule.SelectedValue);
            //    pi.CustomerProcessId = txt_processid.Text.Trim();
            //    pi.CustomerProcessName = txt_processname.Text.Trim();
            //    pi.CustomerListOrder = 250;
            //    pi.HoursPerDay = 24;
            //    pi.MultiProcess = 0;
            //    pi.PriceType = dpl_priceType.SelectedValue;
            //    pi.ProcessGroupsId = dpl_processgroups.SelectedValue;
            //    if (dpl_startdirectly.SelectedValue.Equals("0"))
            //        pi.StartDirectly = false;
            //    else
            //        pi.StartDirectly = true;
            //    if (pi.PriceType.ToString() == "0")
            //    {
            //        pi.PriceType = null;
            //    }
            //    else
            //    {
            //        if (pi.PriceType.Trim().Equals("ZULI"))
            //        {
            //            IList list = new ModuleWorkFlow.BLL.Process().GetProcessInfobyPriceType("ZULI");
            //            if (list.Count > 0)
            //            {
            //                lab_message.Text = "只能有一道組立類型的工序";
            //                return;
            //            }
            //        }
            //    }
            //    if (txt_price.Text.Trim().Equals(""))
            //    {
            //        lab_message.Text = Lang.INPUT_NUMBER;
            //        return;

            //    }
            //    else
            //    {
            //        try
            //        {
            //            pi.Price = Convert.ToDouble(txt_price.Text);
            //        }
            //        catch
            //        {
            //            lab_message.Text = Lang.INPUT_NUMBER;
            //            return;
            //        }
            //    }
            //    pi.Comment = txt_comment.Text.Trim();

            //    if (!lab_func.Text.Equals("edit"))
            //    {

            //        if (Convert.ToInt32(ddl_needschedule.SelectedValue) == 1)
            //        {
            //            if (process.createProcess(pi))
            //            {
            //                lab_message.Text = Lang.SAVE_SUCCESS;
            //            }
            //            else
            //            {
            //                lab_message.Text = Lang.SAVE_FAIL;
            //            }
            //        }
            //        else
            //        {
            //            if (process.createProcessByNeed(pi))
            //            {
            //                lab_message.Text = Lang.SAVE_SUCCESS;
            //            }
            //            else
            //            {
            //                lab_message.Text = Lang.SAVE_FAIL;
            //            }
            //        }
            //    }
            //    else
            //    {
            //        lab_message.Text = process.updateProcess(pi);
            //    }


            //}
            //catch (Exception ex)
            //{
            //    lab_message.Text = "請正確輸入";
            //}



            //if (lab_message.Text.Equals(Lang.SAVE_SUCCESS))
            //{
            //    txt_processid.Text = "";
            //    txt_processname.Text = "";
            //    txt_comment.Text = "";
            //    bindData();
            //}


            //lab_func.Text = "";
        }

        private void MainDataGrid_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            MainDataGrid.CurrentPageIndex = e.NewPageIndex;
            bindData();
        }



        private void but_select_Click(object sender, System.EventArgs e)
        {
            lab_process.Text = txt_process.Text.Trim();
            MainDataGrid.CurrentPageIndex = 0;
            bindData();
        }

        private string getKey()
        {
            string key = null;
            foreach (DataGridItem item in MainDataGrid.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = MainDataGrid.DataKeys[item.ItemIndex].ToString();
                        break;
                    }
                }
            }
            return key;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {

            string key = getKey();
            if (key == null)
            {
                lab_message.Text = "請選擇工序";
                return;
            }

            Response.Redirect("ProcessAddEdit.aspx?menuid=" + menuid + "&id=" + key);
        }













    }
}

