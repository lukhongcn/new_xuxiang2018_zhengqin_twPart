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


using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.Model;

using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkflow.OutSource.BLL.Interface;
using Utility;
namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class BomDetailViewExcel : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add_edit;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;

        protected System.Web.UI.WebControls.Label func;
        protected System.Web.UI.WebControls.Label lab_creater;
        protected Label lab_User;
        protected System.Web.UI.WebControls.Label lab_createDate;


        //	protected System.Web.UI.WebControls.DropDownList ListBox_CustomerList;
        protected System.Web.UI.WebControls.Label lab_customerid;
        protected System.Web.UI.WebControls.DropDownList dpl_prepareMethod;

        private ModuleWorkFlow.BLL.BomDetail bomDetail;
       
        protected System.Web.UI.WebControls.DropDownList dpl_creater;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.WebControls.Label lab_designNo;
        private ModuleWorkFlow.BLL.BomDesign bomDesign;

        protected System.Web.UI.WebControls.TextBox txt_content;
       
        protected System.Web.UI.WebControls.DataGrid dg_error;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.TextBox txt_moduleId;
        protected System.Web.UI.WebControls.Label txt_creater;
      
    
        protected Label lab_menu;
        protected string menuname = "";
        private ModuleWorkFlow.BLL.User user;

        private string menuid = "F11";//??需要修改menuid?

        private void Page_Load(object sender, System.EventArgs e)
        {
            bomDetail = new ModuleWorkFlow.BLL.BomDetail();
            bomDesign = new ModuleWorkFlow.BLL.BomDesign();
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {

                
                dg_error.Visible = false;

                lab_createDate.Text = DateTime.Now.ToString("yy-MM-dd HH:mm");
                if (Session["userid"] != null)
                {
                    lab_User.Text = Session["userid"].ToString();
                }
                string moduleid = Request.Params["moduleid"];
                if (Request.Params["menuid"] != null && !Request.Params["menuid"].Equals(""))
                {
                    menuid = Request.Params["menuid"];
                    lab_menu.Text = menuid;
                }
               
                if (moduleid != null)//有id傳入，表示編輯狀態。
                {
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                    if (Session["userid"] != null)
                    {
                        txt_creater.Text = Session["userid"].ToString();
                    }
                    BomDesignInfo bdi = bomDesign.GetBomDesignByModuleid(moduleid);
                    if (bdi != null)
                    {
                        initialEdit(bdi.Id);

                    }
                    else
                    {
                        Label_Message.Text = Translate.translateString("BOM不存在，請重新選擇");
                    }
                }
                else
                {
                    //ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
                    if (Session["userid"] != null)
                    {
                        txt_creater.Text = Session["userid"].ToString();
                    }

                }

            }

        }

        private void ClearView()
        {

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

            //this.btn_add_edit.Click += new System.EventHandler(this.btn_add_edit_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void initialEdit(int id)
        {
            func.Text = "Edit";
            lab_Id.Text = Convert.ToString(id);//標記隱藏控件

            //根據傳入id[即bomDesign中的id]找bdi對像
            BomDesignInfo bdi = bomDesign.findbykey(id);

            if (bdi != null)//根據id找到對像 
            {
                if (bdi.Creater != null)
                {
                    ModuleWorkFlow.Model.UserInfo ui = new ModuleWorkFlow.Model.UserInfo();
                    user = new ModuleWorkFlow.BLL.User();
                    ui = user.getUserInfo(bdi.Creater.Trim().ToString());
                    if (ui != null)
                    {
                        txt_creater.Text = ui.UserName + "_" + ui.Name;//設定相應創建人
                    }
                }


                lab_createDate.Text = bdi.CreateDate.ToString("yy-MM-dd hh:mm");//設定相應創建時間




                txt_moduleId.Text = bdi.ModuleId;
                txt_moduleId.ReadOnly = true;

              
                lab_designNo.Text = bdi.Id.ToString();
               

            }
            else//根據傳入id找不到bdi對像
            {
                Label_Message.Text = Translate.translateString("BOM不存在");
            }

        }

        //保存按鈕
        private void btn_add_edit_Click(object sender, System.EventArgs e)
        {
            user = new ModuleWorkFlow.BLL.User();
            dg_error.Visible = false;

            IList ierr = new ArrayList();

            //endwhd080815
            if (!func.Text.Equals("Edit"))//非編輯，即添加狀態
            {
                BomDesignInfo bomDesignInfo = new BomDesignInfo();
                if (!txt_moduleId.Text.Equals(""))
                {
                    bomDesignInfo.ModuleId = txt_moduleId.Text;
                }
                else
                {
                    Label_Message.Text = Translate.translateString("未指定模具編號");//Lang.NO_MODULEID;
                    return;
                }
               
                string username = user.getajaxTXTtoUsername(txt_creater.Text);
                string name = user.getajaxTXTtoName(txt_creater.Text);
                if (user.getUserInfoByUserNameAndName(username, name).Count > 0)
                {
                    bomDesignInfo.Creater = username;
                }
                else
                {
                    Label_Message.Text = Translate.translateString("用戶名和用戶編號不符合,請重新輸入");
                    return;
                }



                //添加版次字段 whd080815
              
                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");//檢查添加權限 
                if (!txt_content.Text.Trim().Equals(""))
                {
                    //根據模具編號獲得bomDesign對像
                    if (bomDesign.GetBomDesignByModuleid(txt_moduleId.Text) != null)
                    {
                        Label_Message.Text = txt_moduleId.Text + " " + Lang.NO_NOT_UNIQUE;
                        return;
                    }

                    if (bomDesign.insertBomDesign(bomDesignInfo))//insert BomDesign
                    {
                        Label_Message.Text = Lang.SAVE_SUCCESS;
                    }
                    else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                        return;
                    }

                    bomDesignInfo = bomDesign.GetBomDesignByModuleid(txt_moduleId.Text);
                    bomDesignInfo.CreateDate = DateTime.Now;


                    //txt_productno.Enabled = false;
                    try
                    {
                        lab_Id.Text = bomDesignInfo.Id.ToString();
                    }
                    catch
                    {

                    }
                    func.Text = "Edit";
                    ModuleWorkFlow.report.BomPartDetail bpd = new ModuleWorkFlow.report.BomPartDetail();
                    IList source = bpd.CheckDetailElectFile(txt_content.Text.Substring(0, txt_content.Text.Length - 1).Split('\n'), bomDesignInfo, true, "public");

                    string userno = "";
                    if (Session["userid"] != null)
                    {
                        userno = Session["userid"].ToString();
                    }
                    IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                    outsourceApplyDesigninfo.Creater = userno;
                    outsourceApplyDesigninfo.CreateDate = DateTime.Now;

                    ModuleWorkFlow.BLL.BomDetail bd = new BomDetail();

                    Label_Message.Text = bd.updateAllBomDetail(source,true, true, lab_User.Text, new SendAlert(), false, true, new OutSourceDetail(), outsourceApplyDesigninfo);


                    ierr = bpd.getErrorList();


                    if (ierr.Count > 0)
                    {
                        dg_error.Visible = true;
                        dg_error.DataSource = ierr;
                        dg_error.DataBind();
                    }
                }
            }
            else//edit狀態
            {

                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                int id = 0;
                try
                {
                    id = Convert.ToInt32(lab_Id.Text);
                }
                catch (Exception ex)
                {
                    Label_Message.Text = Translate.translateString("BOM基本信息丟失，請重新選擇");
                    return;
                }

                BomDesignInfo bomDesignInfo = new BomDesign().findbykey(id);
                if (bomDesignInfo == null)
                {
                    Label_Message.Text = Translate.translateString("BOM已被刪除，請重新選擇");
                    return;
                }

              

                if (bomDesign.updateBomDesign(bomDesignInfo))
                {
                    Label_Message.Text = Lang.SAVE_SUCCESS;

                }
                else
                {
                    Label_Message.Text = Lang.SAVE_FAIL;
                    return;
                }
                ModuleWorkFlow.report.BomPartDetail bpd = new ModuleWorkFlow.report.BomPartDetail();

                //判斷是否複製excel內容到控件
                IList source;
                if (txt_content.Text.Length == 0)
                {
                    Label_Message.Text = Lang.SAVE_FAIL + Translate.translateString(" 需要拷貝Excel內容");
                    return;
                }
                else
                {
                    source = bpd.CheckDetailElectFile(txt_content.Text.Substring(0, txt_content.Text.Length - 1).Split('\n'), bomDesignInfo,true,"public");
                }

                ModuleWorkFlow.BLL.BomDetail bd = new BomDetail();
                string userno = "";
                if (Session["userid"] != null)
                {
                    userno = Session["userid"].ToString();
                }
                IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                outsourceApplyDesigninfo.Creater = userno;
                outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                Label_Message.Text = bd.updateAllBomDetail(source, true, true, lab_User.Text, new SendAlert(), false, false, new OutSourceDetail(), outsourceApplyDesigninfo);


                ierr = bpd.getErrorList();


                if (ierr.Count > 0)
                {
                    dg_error.Visible = true;
                    dg_error.DataSource = ierr;
                    dg_error.DataBind();
                }


            }

        }



        private void txt_partNo_TextChanged(object sender, System.EventArgs e)
        {


        }



        private void dpl_orderSingle_SelectedIndexChanged(object sender, System.EventArgs e)
        {

        }

        private void dpl_projectOrderId_SelectedIndexChanged(object sender, System.EventArgs e)
        {

        }



        


        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            //Session["StyleCustomer"] = null;
            if (lab_menu.Equals(""))
            {
                Response.Redirect("BomDetailList.aspx?menuid=" + menuid + "&moduleid=" + txt_moduleId.Text);
            }
            else
            {
                Response.Redirect("BomDetailListCopy.aspx?menuid=" + lab_menu.Text + "&moduleid=" + txt_moduleId.Text + "&StyleCustomer=public" );
            }
        }

        protected void lnkbutton_addinput_Click(object sender, EventArgs e)
        {

            string url = "BomDetailViewExcel.aspx?menuid=" + lab_menu.Text + "&StyleCustomer=public";
            Response.Redirect(url);


        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            user = new ModuleWorkFlow.BLL.User();
            dg_error.Visible = false;
            ModuleWorkFlow.report.BomPartDetail bpd = new ModuleWorkFlow.report.BomPartDetail();
            IList ierr = new ArrayList();
            //endwhd080815
            if (!func.Text.Equals("Edit"))//非編輯，即添加狀態
            {
                func.Text = "Add";
                BomDesignInfo bomDesignInfo = new BomDesignInfo();


                if (!txt_moduleId.Text.Equals(""))
                {
                    bomDesignInfo.ModuleId = txt_moduleId.Text.ToUpper().Trim();
                }
                else
                {
                    Label_Message.Text = Translate.translateString("未指定模具編號");//Lang.NO_MODULEID;
                    return;
                }
              
                string username = user.getajaxTXTtoUsername(txt_creater.Text);
                string name = user.getajaxTXTtoName(txt_creater.Text);
                //if (user.getUserInfoByUserNameAndName(username, name).Count > 0)
                //{
                bomDesignInfo.Creater = "admin";
                //}
                //else
                //{
                //    Label_Message.Text = Translate.translateString("用戶名和用戶編號不符合,請重新輸入");
                //    return;
                //}
                bomDesignInfo.CreateDate = DateTime.Now;


                //添加版次字段 whd080815
              
                //ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");//檢查添加權限 
                OrderDesignInfo odi = new OrderDesign().GetOrderDesignByModuleId(txt_moduleId.Text.ToUpper().Trim());
                if (odi == null)
                {
                    Label_Message.Text = Translate.translateString("模具編號不存在，請輸入正確模具編號");
                    return;
                }

                if (odi.Overdealt == 1)
                {
                    Label_Message.Text = Translate.translateString("模具已結案");
                    return;
                }

                //根據模具編號獲得bomDesign對像
                if (bomDesign.GetBomDesignByModuleid(txt_moduleId.Text) != null)
                {
                    Label_Message.Text = txt_moduleId.Text + " " + Lang.NO_NOT_UNIQUE;
                    return;
                }



                if (bomDesign.insertBomDesign(bomDesignInfo))//insert BomDesign
                {
                    Label_Message.Text = Lang.SAVE_SUCCESS;
                }
                else
                {
                    Label_Message.Text = Lang.SAVE_FAIL;
                    return;
                }

                bomDesignInfo = bomDesign.GetBomDesignByModuleid(txt_moduleId.Text);


                //txt_productno.Enabled = false;
                try
                {
                    lab_Id.Text = bomDesignInfo.Id.ToString();
                }
                catch
                {

                }
                func.Text = "Edit";
                if (!lab_Id.Text.Trim().Equals("") && !txt_content.Text.Equals(""))
                {
                    IList source = bpd.CheckDetailElectFile(txt_content.Text.Substring(0, txt_content.Text.Length - 1).Split('\n'), bomDesignInfo, true, "public");
                    //					IList parts = bompart.CheckPartElectFile(txt_elec_content.Text.Substring(0,txt_elec_content.Text.Length-1).Split('\n'),txt_moduleid.Text);

                    string userno = "";
                    if (Session["userid"] != null)
                    {
                        userno = Session["userid"].ToString();
                    }
                    IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                    outsourceApplyDesigninfo.Creater = userno;
                    outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                    ModuleWorkFlow.BLL.BomDetail bd = new BomDetail();
                    foreach (BomDetailInfo bdi in source)
                    {
                        bdi.ErrorCode = -1;
                    }
                    Label_Message.Text = bd.updateAllBomDetail(source, true, true, lab_User.Text, new SendAlert(), false, true, new OutSourceDetail(), outsourceApplyDesigninfo);


                    ierr = bpd.getErrorList();

                    if (ierr.Count > 0)
                    {
                        dg_error.Visible = true;
                        dg_error.DataSource = ierr;
                        dg_error.DataBind();
                    }
                }
            }
            else//edit狀態
            {

                ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                int id = 0;
                try
                {
                    id = Convert.ToInt32(lab_Id.Text);
                }
                catch (Exception ex)
                {
                    Label_Message.Text = Translate.translateString("BOM基本信息丟失，請重新選擇");
                    return;
                }

                BomDesignInfo bomDesignInfo = new BomDesign().findbykey(id);
                if (bomDesignInfo == null)
                {
                    Label_Message.Text = Translate.translateString("BOM已被刪除，請重新選擇");
                    return;
                }

               

                if (bomDesign.updateBomDesign(bomDesignInfo))
                {
                    Label_Message.Text = Lang.SAVE_SUCCESS;
                }
                else
                {
                    Label_Message.Text = Lang.SAVE_FAIL;
                    return;
                }


                //判斷是否複製excel內容到控件
                IList source;
                if (txt_content.Text.Length == 0)
                {
                    Label_Message.Text = Lang.SAVE_FAIL + Translate.translateString(" 需要拷貝Excel內容");
                    return;
                }
                else
                {
                    source = bpd.CheckDetailElectFile(txt_content.Text.Substring(0, txt_content.Text.Length - 1).Split('\n'), bomDesignInfo, true, "public");
                }

                string userno = "";
                if (Session["userid"] != null)
                {
                    userno = Session["userid"].ToString();
                }
                IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
                outsourceApplyDesigninfo.Creater = userno;
                outsourceApplyDesigninfo.CreateDate = DateTime.Now;
                ModuleWorkFlow.BLL.BomDetail bd = new BomDetail();
                foreach (BomDetailInfo bdi in source)
                {
                    bdi.ErrorCode = -1;
                }
                Label_Message.Text = bd.updateAllBomDetail(source, true, true, lab_User.Text, new SendAlert(), false, false, new OutSourceDetail(), outsourceApplyDesigninfo);


                ierr = bpd.getErrorList();


                if (ierr.Count > 0)
                {
                    dg_error.Visible = true;
                    dg_error.DataSource = ierr;
                    dg_error.DataBind();
                }

            }

        }
    }
}