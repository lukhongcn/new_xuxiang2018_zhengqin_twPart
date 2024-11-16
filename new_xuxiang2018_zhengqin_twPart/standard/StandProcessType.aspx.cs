using System;
using System.Collections;

using System.Web.UI;
using System.Web.UI.WebControls;

using WorkFlow.Model.Standard;
using Utility;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
namespace ModuleWorkFlow.standard
{
    /// <summary>
    /// Summary description for StandProcessType.
    /// </summary>
    public class StandProcessType : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add;
        protected System.Web.UI.WebControls.Label Label_Notice;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_title;
        protected System.Web.UI.WebControls.Label lab_typeName;
        protected System.Web.UI.WebControls.DataGrid dg_StandProcessType;
        protected System.Web.UI.WebControls.Label lab_id;
        protected System.Web.UI.WebControls.Label func;
        protected System.Web.UI.WebControls.Label lab_isProductType;
        protected System.Web.UI.WebControls.Label lab_pop_title;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;


        private WorkFlow.BLL.Standard.StandProcessType standProcessType;
        protected System.Web.UI.WebControls.TextBox txt_typeName;

        private string menuid = "I01";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {

            standProcessType = new WorkFlow.BLL.Standard.StandProcessType();
            if (!this.IsPostBack)
            {
                Tmenu menu = new Tmenu();
                TmenuInfo mi = menu.findbykey(menuid);
                if (this.Master != null && this.Master is DefaultSub)
                {
                    DefaultSub master = (DefaultSub)this.Master;

                    master.Menuname = mi.Menuname;
                    menuname = mi.Menuname;
                }

                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    
                    lab_isProductType.Text = System.Boolean.FalseString;
                   
                    lab_pop_title.Text = Utility.Translate.translateString(menuname);
                    //lab_title.Text = Utility.Translate.translateString("標準工藝類型設置");
                    

                    bindStandProcessType();
                }

            }

        }

        private void bindStandProcessType()
        {
            bool isProductType = Convert.ToBoolean(lab_isProductType.Text);
            IList standProcessTypes = standProcessType.GetStandProcessType(isProductType);
            dg_StandProcessType.DataSource = standProcessTypes;
            if (standProcessTypes.Count <= (dg_StandProcessType.CurrentPageIndex) * dg_StandProcessType.PageSize && dg_StandProcessType.CurrentPageIndex > 0)
            {
                dg_StandProcessType.CurrentPageIndex = dg_StandProcessType.CurrentPageIndex - 1;
            }

            dg_StandProcessType.DataKeyField = "Id";
            dg_StandProcessType.DataBind();
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            bool isProductType = Convert.ToBoolean(lab_isProductType.Text);
            if (txt_typeName.Text.Equals(""))
            {
                Label_Message.Text = lab_typeName.Text + " " + Lang.INPUT_FIRST;
                return;
            }
            StandProcessTypeInfo pmi = new StandProcessTypeInfo();
            pmi.TypeName = txt_typeName.Text;
            pmi.IsProductType = isProductType;


            if (!func.Text.Equals("edit"))
            {
                Label_Message.Text = standProcessType.InsertStandProcessType(pmi);

            }
            else
            {
                pmi.Id = Convert.ToInt32(lab_id.Text);
                Label_Message.Text = standProcessType.UpdateStandProcessType(pmi);
            }
            bindStandProcessType();
            func.Text = "";

        }





        protected void dg_StandProcessType_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            dg_StandProcessType.CurrentPageIndex = e.NewPageIndex;
            bindStandProcessType();
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
            this.btn_add.Click += new System.EventHandler(this.btn_add_Click);
            this.dg_StandProcessType.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.dg_StandProcessType_PageIndexChanged);

            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "popupDiv('pop-div');", true);
            }
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
            int key = getKey();
            if (key < 0)
            {
                Label_Message.Text = Utility.Translate.translateString("請選擇類型");
                return;
            }
            WorkFlow.BLL.Standard.StandProcessType standprocesstype = new WorkFlow.BLL.Standard.StandProcessType();
            StandProcessTypeInfo spi = standprocesstype.FindProcessTypeId(key);
            if (spi == null)
            {
                Label_Message.Text = Utility.Translate.translateString("類型已被其他用戶刪除");
                return;
            }

            lab_id.Text = spi.Id.ToString();
            txt_typeName.Text = spi.TypeName;
            func.Text = "edit";
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "popupDiv('pop-div');", true);

        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL");
            int key = getKey();
            if (key < 0)
            {
                Label_Message.Text = Utility.Translate.translateString("請選擇類型");
                return;
            }
            StandProcessTypeInfo pmi = new StandProcessTypeInfo();
            pmi.Id = key;
            Label_Message.Text = standProcessType.DeleteStandProcessType(pmi);



            bindStandProcessType();
        }

        private int getKey()
        {
            int key = -1;
            foreach (DataGridItem item in dg_StandProcessType.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dg_StandProcessType.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }
            return key;
        }
    }

}
