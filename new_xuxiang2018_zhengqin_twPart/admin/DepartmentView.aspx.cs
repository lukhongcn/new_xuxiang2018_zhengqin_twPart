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
using ModuleWorkFlow.WebView;

using Utility;

namespace ModuleWorkFlow
{
    /// <summary>
    /// Summary description for WebForm1.
    /// </summary>
    public class DepartMentView : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_StatusMsg;
        protected System.Web.UI.WebControls.Label Label_Message;


        protected System.Web.UI.HtmlControls.HtmlTable Table4;
        protected System.Web.UI.WebControls.TextBox txt_department;
        protected System.Web.UI.WebControls.TextBox txt_abbr;
        protected System.Web.UI.WebControls.Panel pan_treeview;
        protected System.Web.UI.WebControls.DataGrid dgdpartment;
        private string menuid = "A24";
        private DepartMent department;
        private int parentdepartmentid = 0;
        private static int Ddepartmentid = 0;
        protected System.Web.UI.WebControls.Label lab_parentmentid;
        protected System.Web.UI.WebControls.Label lab_edit_mode;
        protected System.Web.UI.WebControls.Button btn_save;
        protected System.Web.UI.WebControls.Label lab_departmentid;
        protected System.Web.UI.WebControls.CustomValidator cv_department;
        protected System.Web.UI.WebControls.DropDownList ddl_parentdepartment;
        private string paretndepartment = null;
        private DataSet ds = null;
        protected string menuname = "";

        private void Page_Load(object sender, System.EventArgs e)
        {
            department = new DepartMent();
            ds = department.GetAllDepartmentDs();
            menuname = new Tmenu().findbykey(menuid).Menuname;

            if (!this.IsPostBack)
            {
                if (Request.QueryString["departmentid"] != null)
                {
                    parentdepartmentid = Convert.ToInt16(Request.QueryString["departmentid"]);
                    paretndepartment = Request.QueryString["departmentname"];
                }
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY"))
                {
                    bind();
                }

                lab_parentmentid.Text = parentdepartmentid.ToString();
            }
        }
        private void bind()
        {
            IList departments;
            if (parentdepartmentid == 0)
            {
                departments = department.GetAllDepartment();
            }
            else
            {
                departments = department.GetDepartmentByParent(parentdepartmentid);
            }

            dgdpartment.DataSource = departments;
            dgdpartment.DataKeyField = "DepartmentId";
            dgdpartment.DataBind();

            DepartMentInfo dmi = new DepartMentInfo();
            dmi.DepartmentId = 0;
            dmi.DepartmentName = "";

            departments.Insert(0, dmi);

            if (parentdepartmentid > 0)
            {
                dmi = department.GetDepartmentById(parentdepartmentid);
                if (dmi != null)
                    departments.Insert(1, dmi);
            }
            ddl_parentdepartment.DataSource = departments;
            ddl_parentdepartment.DataTextField = "DepartmentName";
            ddl_parentdepartment.DataValueField = "DepartmentId";
            ddl_parentdepartment.SelectedValue = null;
            ddl_parentdepartment.DataBind();





            pan_treeview.Controls.Add(new DepartMentWebView().DepartMentTree(departments));
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
            this.cv_department.ServerValidate += new System.Web.UI.WebControls.ServerValidateEventHandler(this.cv_department_ServerValidate);
            this.btn_save.Click += new System.EventHandler(this.BTaddmetal_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void BTaddmetal_Click(object sender, System.EventArgs e)
        {
            if (lab_edit_mode.Text.Equals("ADD"))
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
                {
                    if (Page.IsValid)
                    {
                        if (txt_department.Text.Trim().Equals("") || txt_abbr.Text.Trim().Equals(""))
                        {
                            Label_Message.Text = Translate.translateString("部門名及編號不能為空");
                        }
                        else
                        {
                            if (department.GetDepartmentById(txt_abbr.Text.Trim()) == null)
                            {
                                DepartMentInfo dmi = new DepartMentInfo();
                                dmi.DepartAbbr = txt_abbr.Text;
                                dmi.DepartmentName = txt_department.Text;
                                //						dmi.ParentDepartMentId = Convert.ToInt16(lab_parentmentid.Text);
                                dmi.ParentDepartMentId = Convert.ToInt32(ddl_parentdepartment.SelectedValue);
                                if (department.InsertDepartment(dmi))
                                {
                                    Label_Message.Text = Lang.SAVE_SUCCESS;
                                }
                                else
                                {
                                    Label_Message.Text = Lang.SAVE_FAIL;
                                }
                            }
                            else
                            {
                                Label_Message.Text = Translate.translateString("部門編碼不可重複");
                            }
                        }
                    }
                }
            }
            else
            {
                if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                {
                    if (txt_department.Text.Trim().Equals("") || txt_abbr.Text.Trim().Equals(""))
                    {
                        Label_Message.Text = Translate.translateString("部門名不能為空");
                        return;
                    }



                    DepartMentInfo dmi = new DepartMentInfo();
                    dmi.DepartAbbr = txt_abbr.Text;
                    dmi.DepartmentName = txt_department.Text;
                    dmi.ParentDepartMentId = Convert.ToInt32(ddl_parentdepartment.SelectedValue);
                    dmi.DepartmentId = Convert.ToInt16(lab_departmentid.Text);

                    DepartMentInfo finddmi = department.GetDepartmentById(txt_abbr.Text.Trim());
                    if (finddmi != null && finddmi.DepartmentId != dmi.DepartmentId)
                    {
                        Label_Message.Text = Translate.translateString("部門編碼不可重複");
                        bind();
                        _initalPage();
                        return;
                    }

                    //if(dmi.DepartmentId==63 && dmi.ParentDepartMentId!=0)
                    //{
                    //    Label_Message.Text="此部門不能設置主管部門";
                    //    bind();
                    //    _initalPage();
                    //    return;
                    //}
                    //					dmi.DepartmentId = Convert.ToInt16(lab_departmentid.Text);

                    if (!checkidanparentId(dmi.DepartmentId, dmi.ParentDepartMentId))
                    {
                        Label_Message.Text = Translate.translateString("不能用子部門做主管部門");
                        bind();
                        _initalPage();
                        return;

                    }

                    if (department.UpdateDepartment(dmi))
                    {
                        Label_Message.Text = Lang.SAVE_SUCCESS;
                    }
                    else
                    {
                        Label_Message.Text = Lang.SAVE_FAIL;
                    }
                    lab_edit_mode.Text = "ADD";
                    btn_save.Text = Translate.translateString("保存新增");
                }
            }
            bind();
            _initalPage();

        }

        private void BTresetmetal_Click(object sender, System.EventArgs e)
        {
            _initalPage();
        }









        private void _initalPage()
        {
            txt_abbr.Text = "";
            txt_department.Text = "";

        }



        private void cv_department_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            if (lab_edit_mode.Text.Equals("ADD") && department.GetDepartmentByName(txt_department.Text, Convert.ToInt16(lab_parentmentid.Text)))
            {
                args.IsValid = false;
                cv_department.ErrorMessage = Translate.translateString("部門名字已存在");

            }
            else
            {
                args.IsValid = true;
            }
        }

        public bool checkidanparentId(int id, int parentid)
        {
            DataTable dt = ds.Tables[0];
            DataRow[] dr = dr = dt.Select("DepartMentId=" + parentid);
            if (parentid == 0)
            {
                return true;
            }
            else
            {
                if (dr.Length > 0)
                {
                    if (Convert.ToInt32(dr[0]["ParentDepartMentId"].ToString()) == id)
                    {
                        return false;
                    }
                    else
                    {
                        return checkidanparentId(id, Convert.ToInt32(dr[0]["ParentDepartMentId"].ToString()));
                    }
                }
                else
                {
                    return false;
                }
            }

        }

        private int getKey()
        {
            int key = -1;

            foreach (DataGridItem item in dgdpartment.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    CheckBox cb = (CheckBox)item.FindControl("chk_datagrid");
                    if (cb.Checked)
                    {
                        key = Convert.ToInt32(dgdpartment.DataKeys[item.ItemIndex]);
                        break;
                    }
                }
            }
            return key;
        }

        protected void lnkbutton_edit_Click(object sender, EventArgs e)
        {
            int departmentid = getKey();
            if (departmentid < 0)
            {
                Label_Message.Text = Translate.translateString("請選擇部門");
                return;
            }
            lab_edit_mode.Text = "EDIT";
            btn_save.Text = Translate.translateString("保存修改");
            lab_departmentid.Text = departmentid.ToString();
            DepartMentInfo dmi = department.GetDepartmentById(departmentid);
            if (dmi == null)
            {
                Label_Message.Text = Translate.translateString("此部門已被其他用戶修改");
                bind();
            }
            txt_abbr.Text = dmi.DepartAbbr;
            txt_department.Text = dmi.DepartmentName;
            lab_parentmentid.Text = dmi.ParentDepartMentId.ToString();
            ddl_parentdepartment.SelectedValue = dmi.ParentDepartMentId.ToString();
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "callScript", "popupDiv('pop-div')", true);
            bind();

        }

        protected void lnkbutton_delete_Click(object sender, EventArgs e)
        {
            if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PDEL"))
            {
                int departmentid = getKey();
                if (departmentid < 0)
                {
                    Label_Message.Text =Translate.translateString("請選擇部門");
                    return;
                }

                Label_Message.Text =Translate.translateString(department.DeleteDepartment(departmentid));
                bind();
            }
        }


    }
}
