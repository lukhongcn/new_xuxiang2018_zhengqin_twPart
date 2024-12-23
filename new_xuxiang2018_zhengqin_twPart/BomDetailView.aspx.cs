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

using Utility;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL.Alert;
using System.IO;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.Model.Outsource;
using ModuleWorkflow.OutSource.BLL.Interface;
using ModuleWorkFlow.business;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.BLL.NewOrder;
using System.Collections.Generic;
namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for ProductType.
    /// </summary>
    public class BomDetailView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button btn_add_edit;
        protected System.Web.UI.WebControls.Button Button_Upload;
        protected System.Web.UI.HtmlControls.HtmlTable Table1;
        protected System.Web.UI.WebControls.Label lab_partName;
        protected System.Web.UI.WebControls.Label lab_partNo;
        protected System.Web.UI.WebControls.TextBox txt_spec;
        protected System.Web.UI.WebControls.TextBox txt_requireCount;
        protected System.Web.UI.WebControls.TextBox txt_comment;
        protected System.Web.UI.WebControls.TextBox txt_price;
        protected System.Web.UI.WebControls.Label lab_price;

        protected System.Web.UI.WebControls.Label func;

        protected System.Web.UI.WebControls.Label lab_moduleid;

        protected System.Web.UI.WebControls.Label lab_customerid;
        protected System.Web.UI.WebControls.Label lab_material;
        protected System.Web.UI.WebControls.DropDownList Dropdownlist_Material;

        private ModuleWorkFlow.BLL.PartBomDetail bomDetail;
        protected System.Web.UI.WebControls.Label lab_requireCount;
        protected System.Web.UI.WebControls.Label lab_comment;
        protected System.Web.UI.WebControls.Label lab_Id;
        protected Label lab_User;
        protected System.Web.UI.WebControls.Button btn_search;
        protected System.Web.UI.WebControls.Label lab_productmateailid;
        protected System.Web.UI.WebControls.Button btn_select_productmateailid;
        protected System.Web.UI.WebControls.TextBox txt_partname;
        protected ModuleWorkFlow.BLL.Inventory.ProductMaterialInventory promatl;
        protected ModuleWorkFlow.Model.Inventory.ProductMaterialInventoryInfo promatlinfo;
        protected System.Web.UI.WebControls.TextBox txt_partno;
        protected System.Web.UI.WebControls.TextBox txt_name;
        protected System.Web.UI.WebControls.Label lab_spec;
        protected System.Web.UI.WebControls.Button btn_edit_design;
        protected System.Web.UI.WebControls.TextBox Textbox1;
        protected System.Web.UI.WebControls.Label lab_IsMerchindise;
        protected System.Web.UI.WebControls.Label Comment;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.DropDownList dpl_isMerchindise;
        protected System.Web.UI.WebControls.Label lab_skillRequirement;
        protected System.Web.UI.WebControls.TextBox TextBox_ExcelPdf;
        protected System.Web.UI.WebControls.Label lab_bomstyle;
        protected TextBox txt_partentPartNo;

        private string menuid = "F11";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");

            bomDetail = new ModuleWorkFlow.BLL.PartBomDetail();
            TmenuInfo mi = new Tmenu().findbykey(menuid);
            if (this.Master != null && this.Master is DefaultSub)
            {
                DefaultSub master = (DefaultSub)this.Master;

                master.Menuname = mi.Menuname;
                menuname = mi.Menuname;

            }
            if (!this.IsPostBack)
            {
                BindMaterial();
                string id = Request.Params["id"];
                if (id != null)
                {
                    lab_Id.Text = id.ToString().Trim();
                    if (Session["userid"] != null)
                    {
                        lab_User.Text = Session["userid"].ToString();
                    }

                    initialEdit(Convert.ToInt32(id));
                }

                if (Request.Params["StyleCustomer"] != null && !Request.Params["StyleCustomer"].Equals(""))
                {
                    lab_bomstyle.Text = Request.Params["StyleCustomer"];
                }
                else
                {
                    lab_bomstyle.Text = "public";
                }
            }
        }

        private void ClearView()
        {
            txt_partno.Text = "";//del
            txt_name.Text = "";
            txt_partname.Text = "";//del
            txt_spec.Text = "";
            txt_requireCount.Text = "";
            txt_comment.Text = "";
            func.Text = "";
            TextBox_ExcelPdf.Text = "";

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

        private void setControls()
        {
            //IList controls = new ControlTable().getControlTableByTableName("tb_bomdetail");

            //foreach (ControlTableInfo cti in controls)
            //{
            //    if (cti.Isreadonly == 1 || cti.IsVisible == 0)
            //    {
            //        WebControl control = this.FindControl(cti.ControlName) as WebControl;
            //        if (control == null)
            //        {
            //            continue;
            //        }
            //        WebControl labcontrol = this.FindControl("lab" + cti.ControlName.Substring(cti.ControlName.IndexOf('_'))) as WebControl;
            //        if (cti.IsVisible == 0)
            //        {
            //            control.Visible = false;
            //            labcontrol.Visible = false;
            //        }
            //        else
            //        {
            //            switch (cti.TableDateField)
            //            {
            //                case "string":
            //                    TextBox txt = control as TextBox;
            //                    txt.ReadOnly = true;
            //                    break;

            //                case "DropDownList":
            //                    DropDownList drp = control as DropDownList;
            //                    drp.Enabled = false;
            //                    break;
            //            }
            //        }
            //    }
            //}
        }

        private void initialEdit(int id)
        {
            func.Text = "Edit";
            lab_Id.Text = Convert.ToString(id);
            PartBomDetailInfo bomDetailinfo = bomDetail.findbykey(id);

            if (bomDetailinfo != null)
            {
                lab_moduleid.Text = bomDetailinfo.ModuleId;
                txt_name.Text = bomDetailinfo.PartName;
                txt_partno.Text = bomDetailinfo.PartNo;
                txt_partentPartNo.Text = bomDetailinfo.ParentPartNo;
                txt_partno.ReadOnly = true;
                if (bomDetailinfo.Spec != null)
                {
                    txt_spec.Text = bomDetailinfo.Spec;
                }

                txt_price.Text = bomDetailinfo.Price.ToString();
                Dropdownlist_Material.SelectedValue = Convert.ToString(bomDetailinfo.MaterialId);
                dpl_isMerchindise.SelectedValue = bomDetailinfo.IsMerchindise.ToString();
                txt_requireCount.Text = Convert.ToString(bomDetailinfo.RequireCount);
                txt_comment.Text = bomDetailinfo.Comment;
                TextBox_ExcelPdf.Text = bomDetailinfo.Pdfupload;

            }
            else
            {
                Label_Message.Text = "BOM不存在";
            }
            setControls();
        }

        private void btn_add_edit_Click(object sender, System.EventArgs e)
        {
            //if(dpl_isMerchindise.SelectedValue.Trim().Equals("0"))
            //{
            //    if (txt_spec.Text.Trim().Equals(""))
            //    {
            //        Label_Message.Text = "四種規格之一必須填寫 或價格";
            //        return;
            //    }

            //}
            ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
            OrderDesignInfo odi = new OrderDesign().GetOrderDesignByModuleId(lab_moduleid.Text);
            PartBomDetailInfo bomDetailinfo = new PartBomDetailInfo();
            bomDetailinfo = bomDetail.findbykey(Convert.ToInt32(lab_Id.Text));
            if (!string.IsNullOrEmpty(txt_partentPartNo.Text.Trim()) && bomDetail.GetBomDetailByNoPartNo(lab_moduleid.Text, txt_partentPartNo.Text.Trim()) == null)
            {
                Label_Message.Text = txt_partentPartNo.Text.Trim() + "不存在";
                return;
            }

            PartBomDetailInfo tempinfo = bomDetail.GetBomDetailByNoPartNo(lab_moduleid.Text, txt_partno.Text.Trim());//
            if (tempinfo == null || tempinfo.Id == Convert.ToInt32(lab_Id.Text))
            {
                bomDetailinfo.PartNo = txt_partno.Text;//txt_partno.Text
                if (txt_partno.Text.IndexOf(",") < 0 || (new ModuleWorkFlow.report.BomPartDetail()).checkpartno(txt_partno.Text))
                {
                    if (dpl_isMerchindise.SelectedValue.Trim().Equals("1") || ConvertString.ConvertToPratNo(txt_partno.Text.Trim()))
                    {
                        bomDetailinfo.PartNo = txt_partno.Text;//txt_partno.Text
                    }
                    else
                    {
                        Label_Message.Text = txt_partno.Text.Trim() + " 不能有中文字";
                        return;
                    }
                }
                else
                {
                    Label_Message.Text = " 圖號不能有單獨的「,」";
                    return;
                }
            }
            else
            {
                Label_Message.Text = lab_partNo.Text + ":" + Lang.NO_DUPLICATE;
                return;
            }
            bomDetailinfo.PartName = txt_name.Text;//	
            bomDetailinfo.ParentPartNo = txt_partentPartNo.Text;

            bomDetailinfo.Spec = txt_spec.Text.Trim();

            if (!bomDetailinfo.Spec.Equals("") && bomDetailinfo.Spec.IndexOf("*") > -1)
            {
                string[] spec = bomDetailinfo.Spec.Split('*');

                if (spec.Length > 1)
                {
                    try
                    {
                        bomDetailinfo.Length = Convert.ToDouble(spec[0]);
                        bomDetailinfo.Width = Convert.ToDouble(spec[1]);
                        if (spec.Length == 3)
                        {
                            bomDetailinfo.Height = Convert.ToDouble(spec[2]);
                        }
                    }
                    catch
                    {
                        bomDetailinfo.Length = 0.0;
                        bomDetailinfo.Width = 0.0;
                        bomDetailinfo.Height = 0.0;
                    }
                }

            }

            if (!Dropdownlist_Material.SelectedValue.Trim().Equals(""))
            {
                try
                {
                    bomDetailinfo.MaterialId = Convert.ToInt32(Dropdownlist_Material.SelectedValue);
                }
                catch
                {
                    Label_Message.Text = Dropdownlist_Material.SelectedValue + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                bomDetailinfo.MaterialId = 0;
            }
            if (!txt_requireCount.Text.Trim().Equals(""))
            {
                try
                {
                    bomDetailinfo.RequireCount = Convert.ToInt32(txt_requireCount.Text);
                }
                catch
                {
                    Label_Message.Text = lab_requireCount.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                bomDetailinfo.RequireCount = 0;
            }






            bomDetailinfo.Comment = txt_comment.Text.Trim();
            bomDetailinfo.IsMerchindise = 1;

            bomDetailinfo.Pdfupload = TextBox_ExcelPdf.Text.Trim();

            if (dpl_isMerchindise.SelectedValue.Trim().Equals("0"))
            {
                bomDetailinfo.IsMerchindise = 0;
            }
            else
            {
                bomDetailinfo.IsMerchindise = 1;

            }

            if (!txt_price.Text.Trim().Equals(""))
            {
                try
                {
                    bomDetailinfo.Price = Convert.ToDouble(txt_price.Text);
                }
                catch
                {
                    Label_Message.Text = lab_requireCount.Text + Lang.NO_ERROR;
                    return;
                }
            }
            else
            {
                bomDetailinfo.RequireCount = 0;
            }
            bomDetailinfo.ErrorCode = -1;
            List<PartBomDetailInfo> bomDetails = new List<PartBomDetailInfo>();
            bomDetails.Add(bomDetailinfo);
            string userno = "";
            if (Session["userid"] != null)
            {
                userno = Session["userid"].ToString();
            }
            IOutsourceApplyDesignInfo outsourceApplyDesigninfo = new OutsourceApplyDesignInfo();
            outsourceApplyDesigninfo.Creater = userno;
            outsourceApplyDesigninfo.CreateDate = DateTime.Now;
            Label_Message.Text = bomDetail.updateAllBomDetail(odi,bomDetails, false, false, lab_User.Text, new SendAlert(), true, false, new PartOutSourceDetail(), outsourceApplyDesigninfo);




        }


        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            btn_add_edit_Click(sender, e);
        }

        protected void lnkbutton_view_Click(object sender, EventArgs e)
        {
            //Response.Redirect("BomDetailList.aspx?menuid=" + menuid + "&moduleid=" + lab_moduleid.Text);
            Response.Redirect("BomDetailListCopy.aspx?menuid=" + menuid + "&moduleid=" + lab_moduleid.Text + "&StyleCustomer=" + lab_bomstyle.Text.Trim());
        }

        protected void lnkbutton_add_Click(object sender, EventArgs e)
        {

            ClearView();
            Label_Message.Text = "";
        }


        private void Button_Upload_Click(object sender, EventArgs e)
        {
            Response.Write("<script language=\"javascript\">window.open('UploadBomDetailPdf.aspx?TextBox_ExcelPdf=" + TextBox_ExcelPdf + "' ,'pmis',\"toolbar=no,location=no,directories=yes,status=yes,menubar=yes,resizable=yes,scrollbars=no,idth=400px,height=500px\");</script>");
        }


    }
}