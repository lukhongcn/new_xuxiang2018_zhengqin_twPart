using System;

using System.Web.UI.WebControls;

using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for WebForm1.
    /// </summary>
    public class StandProcessTypeView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_StatusMsg;
        protected System.Web.UI.WebControls.Label Label_Message;


        protected System.Web.UI.HtmlControls.HtmlTable Table4;
        protected System.Web.UI.WebControls.TextBox txt_standprocesstypename;
        private string menuid = "A02";
        private StandProcessType standProcessType;
        private int parentid = 0;
        private static int standid = 0;
        protected System.Web.UI.WebControls.Label lab_parentid;
        protected System.Web.UI.WebControls.Label lab_standid;
        protected System.Web.UI.WebControls.DropDownList ddl_parent;
        protected string menuname = "";

        private void Page_Load(object sender, System.EventArgs e)
        {
            standProcessType = new StandProcessType();

            Tmenu menu = new Tmenu();
            TmenuInfo mi = menu.findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;
            }

            if (!this.IsPostBack)
            {
                
                bindParent();
                if (Request.QueryString["standid"] != null)
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                    {
                        standid = Convert.ToInt16(Request.QueryString["standid"]);
                        lab_standid.Text = standid.ToString();
                        parentid = Convert.ToInt16(Request.QueryString["parentId"]);
                        lab_parentid.Text = parentid.ToString();
                        txt_standprocesstypename.Text = Request.QueryString["TypeName"];
                        ddl_parent.SelectedValue = parentid.ToString();
                    }
                }
                else
                {
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");

                }

            }
        }

        private void bindParent()
        {
            ddl_parent.DataSource = standProcessType.GetStandProcessType(true);
            ddl_parent.DataTextField = "TypeName";
            ddl_parent.DataValueField = "Id";
            ddl_parent.DataBind();
            ddl_parent.Items.Insert(0, new ListItem("", "0"));

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



        private void initalPage()
        {
            txt_standprocesstypename.Text = "";
            lab_parentid.Text = "";
            lab_standid.Text = "";

        }





        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            if (lab_standid.Text.Equals(""))
            {

                if (txt_standprocesstypename.Text.Trim().Equals(""))
                {
                    Label_Message.Text = Utility.Translate.translateString("類別名稱不能為空");
                }
                else
                {
                    StandProcessTypeInfo spti = new StandProcessTypeInfo();
                    spti.IsProductType = true;
                    spti.TypeName = txt_standprocesstypename.Text.Trim();
                    spti.ParentId = Convert.ToInt32(ddl_parent.SelectedValue);
                    Label_Message.Text = standProcessType.InsertStandProcessType(spti);
                }

            }
            else
            {
                if (txt_standprocesstypename.Text.Trim().Equals(""))
                {
                    Label_Message.Text = Utility.Translate.translateString("類別名稱不能為空");
                    return;
                }

                StandProcessTypeInfo spti = new StandProcessTypeInfo();
                spti.IsProductType = true;
                spti.TypeName = txt_standprocesstypename.Text.Trim();
                spti.ParentId = Convert.ToInt32(ddl_parent.SelectedValue);
                spti.Id = Convert.ToInt32(lab_standid.Text);

                Label_Message.Text = standProcessType.UpdateStandProcessType(spti);

            }

            initalPage();
        }


    }
}
