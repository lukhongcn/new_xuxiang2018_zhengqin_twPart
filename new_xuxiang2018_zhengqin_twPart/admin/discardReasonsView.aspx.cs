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


using Utility;
using ModuleWorkFlow.BLL;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class discardReasonsView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add_edit;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label lab_discardReasons;
        protected System.Web.UI.WebControls.TextBox txt_discardReasons;
        protected System.Web.UI.WebControls.Label lab_isReadOnly;
        protected System.Web.UI.WebControls.TextBox txt_isReadOnly;
        protected System.Web.UI.WebControls.DataGrid dg_discardReasons;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.WebControls.Label func;

        private ModuleWorkFlow.BLL.System.discardReasons discardreasons;
        string menuid = "A1232";
        protected string menuname = "";
        protected string Mainmenuname = "生產管理";
        protected string loginout = "登出";
        private void Page_Load(object sender, System.EventArgs e)
        {
            menuname = new Tmenu().findbykey(menuid).Menuname;
            string Language = System.Configuration.ConfigurationSettings.AppSettings["Language"];
            if (Language != null && Language.Trim().Equals("English"))
            {
                Mainmenuname = "Production Management";
                loginout = "Login out";
            }

            lab_discardReasons.Text = Utility.Translate.translateString(lab_discardReasons.Text);

            discardreasons = new ModuleWorkFlow.BLL.System.discardReasons();
            if (!this.IsPostBack)
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    binddiscardReasons();
                }
            }
        }

        private void ClearView()
        {
            txt_discardReasons.Text = "";
            txt_isReadOnly.Text = "";
            lab_Id.Text = "";
            func.Text = "";
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
            this.btn_add_edit.Click += new System.EventHandler(this.btn_add_edit_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void btn_add_edit_Click(object sender, System.EventArgs e)
        {

            discardReasonsInfo discardreasonsInfo = new discardReasonsInfo();

            discardreasonsInfo.DiscardReasons = txt_discardReasons.Text.Trim();
            if (discardreasonsInfo.DiscardReasons.Equals(""))
            {
                Label_Message.Text = Utility.Translate.translateString("報廢原因不能為空");
                return;
            }

            if (!txt_isReadOnly.Text.Trim().Equals(""))
            {
                try
                {
                    discardreasonsInfo.IsReadOnly = Convert.ToInt32(txt_isReadOnly.Text);
                }
                catch
                {
                    Label_Message.Text = Utility.Translate.translateString(txt_isReadOnly.Text) + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                discardreasonsInfo.IsReadOnly = 0;
            }
            if (!func.Text.Equals("Edit"))
            {

                if (discardreasons.GetdiscardReasonsByNo(txt_discardReasons.Text.Trim()).Count > 0)
                {
                    Label_Message.Text = Utility.Translate.translateString(lab_discardReasons.Text) + Utility.Translate.translateString("名稱已存在");
                    return;
                }
                else
                {
                    if (discardreasons.insertdiscardReasons(discardreasonsInfo))
                    {
                        Label_Message.Text = Lang.SAVE_SUCCESS;
                    }
                    else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                        return;
                    }
                }
            }
            else
            {
                discardreasonsInfo.Id = Convert.ToInt32(lab_Id.Text);

                Label_Message.Text =Utility.Translate.translateString(discardreasons.updatediscardReasons(discardreasonsInfo));


            }
            binddiscardReasons();
            ClearView();
        }

        private void binddiscardReasons()
        {
            dg_discardReasons.DataSource = discardreasons.GetdiscardReasonsInfos();
            dg_discardReasons.DataKeyField = "Id";
            dg_discardReasons.DataBind();
        }



        protected void dg_unNormalReasons_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_discardReasons.CurrentPageIndex = e.NewPageIndex;
            binddiscardReasons();
        }







        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_discardReasons.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_discardReasons.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }
            return key;
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "popupDiv('pop-div');", true);
            }
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
            {
                int key = getKey();
                if (key < 0)
                {
                   
                    Label_Message.Text = Utility.Translate.translateString("請選擇錯誤原因");
                    return;
                }

                discardReasonsInfo uni = new discardReasons().findbykey(key);
                if (uni == null)
                {
                    Label_Message.Text = Utility.Translate.translateString("原因已被其他用戶刪除");
                    return;
                }

                txt_discardReasons.Text = uni.DiscardReasons;
                func.Text = "Edit";
                lab_Id.Text = uni.Id.ToString();
                txt_isReadOnly.Text = uni.IsReadOnly.ToString();
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "popupDiv('pop-div');", true);
            }
        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                int key = getKey();
                if (key < 0)
                {
                    Label_Message.Text = Utility.Translate.translateString("請選擇錯誤原因");
                    return;
                }

                discardReasons discardreasons = new discardReasons();
                Label_Message.Text = Utility.Translate.translateString(discardreasons.deletediscardReasons(key));
                binddiscardReasons();
            }
        }
    }
}