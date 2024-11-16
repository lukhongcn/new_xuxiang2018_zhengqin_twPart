using System;


using Utility;
using ModuleWorkFlow.BLL;
using WorkFlow.BLL.Standard;
using WorkFlow.Model.Standard;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Generic;
using ModuleWorkFlow.Model;

namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class StandBomDetailView : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label lab_partName;
        protected System.Web.UI.WebControls.Label lab_partNo;
        protected System.Web.UI.WebControls.TextBox txt_spec;
        protected System.Web.UI.WebControls.TextBox txt_requireCount;
        protected System.Web.UI.WebControls.TextBox txt_comment;
        protected System.Web.UI.WebControls.Label func;
        protected System.Web.UI.WebControls.Label lab_materialId;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_Material;
        protected System.Web.UI.WebControls.DropDownList dpl_standardtype;
        protected System.Web.UI.WebControls.DropDownList dpl_parentStandardtype;

        private WorkFlow.BLL.Standard.PartStandBomDetail standBomDetail;
        protected System.Web.UI.WebControls.Label lab_requireCount;
        protected System.Web.UI.WebControls.Label lab_comment;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected System.Web.UI.WebControls.TextBox txt_partno;
        protected System.Web.UI.WebControls.TextBox txt_name;
        protected System.Web.UI.WebControls.Label lab_spec;
        protected System.Web.UI.WebControls.Label Comment;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.Label lab_uglySpec;
        protected System.Web.UI.WebControls.TextBox txt_uglySpec;
        protected TextBox txt_parentPartNo;
        protected CheckBox chk_isMerchindise;
        protected string menuname = "";

        private string menuid = "A021";

        private void Page_Load(object sender, System.EventArgs e)
        {
            standBomDetail = new WorkFlow.BLL.Standard.PartStandBomDetail();


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

                BindMaterial();
                BindProcessType();
                string id = Request.Params["id"];

                if (id != null)
                {
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                    lab_Id.Text = id;
                    initialEdit(Convert.ToInt32(id));
                }
                else
                {
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
                }
            }
        }

        private void BindProcessType()
        {
            bool isProductType = true;

            StandProcessType standprocesstype = new WorkFlow.BLL.Standard.StandProcessType();
            dpl_parentStandardtype.DataSource = standprocesstype.GetStandProcessType(isProductType);
            dpl_parentStandardtype.DataTextField = "TypeName";
            dpl_parentStandardtype.DataValueField = "id";
            dpl_parentStandardtype.DataBind();

            if (!dpl_parentStandardtype.SelectedValue.Equals(""))
            {
                dpl_standardtype.DataSource = standprocesstype.GetStandProcessTypeByParentId(true, Convert.ToInt32(dpl_parentStandardtype.SelectedValue));
                dpl_standardtype.DataTextField = "TypeName";
                dpl_standardtype.DataValueField = "id";
                dpl_standardtype.DataBind();
            }
        }

        private void ClearView()
        {
            txt_partno.Text = "";
            txt_name.Text = "";
            txt_spec.Text = "";
            txt_uglySpec.Text = "";
            txt_requireCount.Text = "";
            txt_comment.Text = "";

            func.Text = "";

            Dropdownlist_Material.SelectedIndex = 0;//add
        }







        private void BindMaterial()
        {
            Dropdownlist_Material.DataTextField = "name";
            Dropdownlist_Material.DataValueField = "id";
            Dropdownlist_Material.DataSource = new Material().GetMaterial("Part");
            Dropdownlist_Material.DataBind();
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

        private void initialEdit(int id)
        {
            func.Text = "Edit";
            lab_Id.Text = Convert.ToString(id);

            StandBomDetailInfo standBomDetailinfo = new StandBomDetailInfo();
            standBomDetailinfo = standBomDetail.findbykey(id);
            if (standBomDetailinfo != null)
            {
                txt_comment.Text = standBomDetailinfo.Comment;
                txt_name.Text = standBomDetailinfo.PartName;
                txt_partno.Text = standBomDetailinfo.PartNo;
                txt_requireCount.Text = standBomDetailinfo.RequireCount.ToString();
                txt_spec.Text = standBomDetailinfo.Spec;
                txt_uglySpec.Text = standBomDetailinfo.UglySpec;
                Dropdownlist_Material.SelectedValue = standBomDetailinfo.MaterialId.ToString();
                dpl_parentStandardtype.SelectedValue = standBomDetailinfo.StandProcessTypeId.ToString();



            }
            else
            {
                Label_Message.Text = "BOM不存在";
            }


        }

        private void btn_add_edit_Click(object sender, System.EventArgs e)
        {
            if (txt_name.Text.Trim().Equals("") || txt_partno.Text.Trim().Equals(""))
            {
                Label_Message.Text = "請設定圖號及圖名";
                return;
            }

            StandBomDetailInfo standBomDetailinfo = new StandBomDetailInfo();
            standBomDetailinfo.PartName = txt_name.Text.Trim();
            standBomDetailinfo.PartNo = txt_partno.Text.Trim();
            standBomDetailinfo.Spec = txt_spec.Text.Trim();
            standBomDetailinfo.UglySpec = txt_uglySpec.Text.Trim();

            if (!Dropdownlist_Material.SelectedValue.Trim().Equals(""))
            {
                standBomDetailinfo.MaterialId = Convert.ToInt32(Dropdownlist_Material.SelectedValue);
            }
            else
            {
                standBomDetailinfo.MaterialId = 0;
            }
            if (!txt_requireCount.Text.Trim().Equals(""))
            {
                try
                {
                    standBomDetailinfo.RequireCount = Convert.ToInt32(txt_requireCount.Text);
                }
                catch
                {
                    Label_Message.Text = lab_requireCount.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                standBomDetailinfo.RequireCount = 0;
            }

            if (!dpl_standardtype.SelectedValue.Equals("") || !dpl_parentStandardtype.SelectedValue.Equals(""))
            {
                if (!dpl_standardtype.SelectedValue.Equals(""))
                    standBomDetailinfo.StandProcessTypeId = Convert.ToInt32(dpl_standardtype.SelectedValue);
                else
                    standBomDetailinfo.StandProcessTypeId = Convert.ToInt32(dpl_parentStandardtype.SelectedValue);
            }
            else
            {
                Label_Message.Text = "請選擇類別";
                return;
            }
            if (!string.IsNullOrEmpty(txt_parentPartNo.Text))
            {
                if (standBomDetail.GetBomDetailByStandprocesstype(standBomDetailinfo.StandProcessTypeId,txt_parentPartNo.Text.Trim()).Count == 0)
                {
                    Label_Message.Text = "父階不存在";
                    return;
                }
            }
            standBomDetailinfo.ParentPartNo = txt_parentPartNo.Text.Trim();
            standBomDetailinfo.IsMerchindise = Convert.ToInt32(chk_isMerchindise.Checked);
            standBomDetailinfo.Comment = txt_comment.Text.Trim();
            if (func.Text.Equals(""))
            {
                IList source = new ArrayList();
                List<StandBomDetailInfo> addInfos = new List<StandBomDetailInfo>();
                addInfos.Add(standBomDetailinfo);
                source.Add(standBomDetail.insertStandBomDetail(addInfos));
                if (new Schedule().SaveSchedule(source))
                {
                    Label_Message.Text = Lang.SAVE_SUCCESS;
                }else
                {
                    Label_Message.Text = Lang.SAVE_FAIL;
                }
               
            }
            else
            {
                standBomDetailinfo.Id = Convert.ToInt32(lab_Id.Text);
                Label_Message.Text = standBomDetail.updateStandBomDetail(standBomDetailinfo);
            }
            if (Label_Message.Text.Equals(Lang.SAVE_SUCCESS))
                ClearView();

        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            btn_add_edit_Click(sender, e);
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {
            ClearView();
        }

        protected void dpl_parentStandardtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            StandProcessType standprocesstype = new WorkFlow.BLL.Standard.StandProcessType();
            if (!dpl_parentStandardtype.SelectedValue.Equals(""))
            {
                dpl_standardtype.DataSource = standprocesstype.GetStandProcessTypeByParentId(true, Convert.ToInt32(dpl_parentStandardtype.SelectedValue));
                dpl_standardtype.DataTextField = "TypeName";
                dpl_standardtype.DataValueField = "id";
                dpl_standardtype.DataBind();
            }

        }
    }
}