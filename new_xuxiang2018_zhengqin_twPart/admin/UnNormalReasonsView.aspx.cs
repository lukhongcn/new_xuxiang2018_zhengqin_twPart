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
    public class UnNormalReasonsView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add_edit;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label lab_unnormalReasons;
        protected System.Web.UI.WebControls.TextBox txt_unnormalReasons;
        protected System.Web.UI.WebControls.Label lab_isReadOnly;
        protected System.Web.UI.WebControls.TextBox txt_isReadOnly;
        protected System.Web.UI.WebControls.DataGrid dg_unNormalReasons;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.WebControls.Label func;

        private ModuleWorkFlow.BLL.System.unNormalReasons unNormalReasons;
        string menuid = "A122";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            unNormalReasons = new ModuleWorkFlow.BLL.System.unNormalReasons();
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    bindunNormalReasons();
                }
            }
        }

        private void ClearView()
        {
            txt_unnormalReasons.Text = "";
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

            unNormalReasonsInfo unNormalReasonsinfo = new unNormalReasonsInfo();
            unNormalReasonsinfo.UnnormalReasons = txt_unnormalReasons.Text.Trim();
            if (unNormalReasonsinfo.UnnormalReasons.Equals(""))
            {
                Label_Message.Text = Translate.translateString("返修原因不能為空,請填寫返修原因");
                return;
            }

            if (!txt_isReadOnly.Text.Trim().Equals(""))
            {
                try
                {
                    unNormalReasonsinfo.IsReadOnly = Convert.ToInt32(txt_isReadOnly.Text);
                }
                catch
                {
                    Label_Message.Text = txt_isReadOnly.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                unNormalReasonsinfo.IsReadOnly = 0;
            }
            unNormalReasonsinfo.ReasonType = "unNormal";

            if (!func.Text.Equals("Edit"))
            {

                if (unNormalReasons.GetunNormalReasonsByNo(txt_unnormalReasons.Text.Trim()).Count > 0)
                {
                    Label_Message.Text = lab_unnormalReasons.Text + Translate.translateString("已存在");
                    return;
                }
                else
                {
                    if (unNormalReasons.insertunNormalReasons(unNormalReasonsinfo))
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
                unNormalReasonsinfo.Id = Convert.ToInt32(lab_Id.Text);

                Label_Message.Text = unNormalReasons.updateunNormalReasons(unNormalReasonsinfo);


            }
            bindunNormalReasons();
            ClearView();
        }

        private void bindunNormalReasons()
        {
            dg_unNormalReasons.DataSource = unNormalReasons.GetunNormalReasonsInfos();
            dg_unNormalReasons.DataKeyField = "Id";
            dg_unNormalReasons.DataBind();
        }



        protected void dg_unNormalReasons_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_unNormalReasons.CurrentPageIndex = e.NewPageIndex;
            bindunNormalReasons();
        }







        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_unNormalReasons.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_unNormalReasons.DataKeys[item.ItemIndex]);
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
                    Label_Message.Text = Translate.translateString("請選擇錯誤原因");
                    return;
                }

                unNormalReasonsInfo uni = new unNormalReasons().findbykey(key);
                if (uni == null)
                {
                    Label_Message.Text = Translate.translateString("原因已被其他用戶刪除");
                    return;
                }

                txt_unnormalReasons.Text = uni.UnnormalReasons;
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
                    Label_Message.Text = Translate.translateString("請選擇錯誤原因");
                    return;
                }

                unNormalReasonsInfo unNormalReasonsinfo = new unNormalReasonsInfo();
                Label_Message.Text = unNormalReasons.deleteunNormalReasons(key);
                bindunNormalReasons();
            }
        }
    }
}