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

using ModuleWorkFlow.business;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using Utility;

namespace ModuleWorkFlow.admin
{
    /// <summary>
    /// Summary description for UserPrivilegeAddEdit.
    /// </summary>
    public class DepartPrivilegeAddEdit : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_HiddenFuncMode;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.DataGrid DataGridPrivate;
        protected System.Web.UI.WebControls.TextBox Textbox_DepartName;
        protected System.Web.UI.WebControls.Label Label_HiddenDepartId;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.CheckBox CheckBox_SelectAll;
        protected DropDownList drp_menu;
        protected DropDownList drp_subMenu;

        string menuid = "A63";
        protected string menuname;

        private void Page_Load(object sender, System.EventArgs e)
        {
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {
                Session["hDepartPrivilege"] = null;
                Label_Message.Text = "";
                bindParentMenu();
                bindSubMenu();
                string func = Request.Params["func"];
                if (func != null && func.Equals("edit"))
                {
                    //edit mode
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT");
                    string departid = Request.Params["departid"];
                    ModuleWorkFlow.Model.DepartMentInfo dpmi = new ModuleWorkFlow.BLL.DepartMent().GetDepartmentById(Convert.ToInt32(departid));
                    Textbox_DepartName.Text = dpmi.DepartmentName;
                    Textbox_DepartName.ReadOnly = true;
                    Label_HiddenDepartId.Text = departid;

                    Label_HiddenFuncMode.Text = "edit";
                    InitalEditPage(departid);
                }
                else
                {
                    //add mode		
                    ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD");
                    Label_HiddenFuncMode.Text = "add";
                    InitalAddPage();
                }

            }
        }

        protected void drp_menu_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            bindSubMenu();
        }


        private void bindSubMenu()
        {
            Tmenu menu = new Tmenu();
            drp_subMenu.DataSource = menu.GetTmenuInfos(Convert.ToInt32(drp_menu.SelectedValue));
            drp_subMenu.DataTextField = "Menuname";
            drp_subMenu.DataValueField = "Id";
            drp_subMenu.DataBind();
            drp_subMenu.Items.Insert(0, new ListItem(Translate.translateString("所有"), drp_menu.SelectedValue));
        }

        private void bindParentMenu()
        {
            Tmenu menu = new Tmenu();
            drp_menu.DataSource = menu.GetTmenuInfos(0);
            drp_menu.DataTextField = "Menuname";
            drp_menu.DataValueField = "Id";
            drp_menu.DataBind();
            drp_menu.Items.Insert(0, new ListItem(Translate.translateString("所有"), "0"));


        }

        private void InitalAddPage()
        {
        }

        private void BindMenu(string departid)
        {
            Hashtable hDepartPrivilege = new Hashtable();
            if (Session["hDepartPrivilege"] != null)
            {
                hDepartPrivilege = Session["hDepartPrivilege"] as Hashtable;
            }

            for (int i = 0; i < DataGridPrivate.Items.Count; i++)
            {
                string menuid = DataGridPrivate.Items[i].Cells[0].Text.Trim();
                string url = DataGridPrivate.Items[i].Cells[2].Text.Trim();
                CheckBox Checkbox_PQuery = DataGridPrivate.Items[i].FindControl("Checkbox_PQuery") as CheckBox;
                CheckBox CheckBox_PAdd = DataGridPrivate.Items[i].FindControl("CheckBox_PAdd") as CheckBox;
                CheckBox Checkbox_PEdit = DataGridPrivate.Items[i].FindControl("Checkbox_PEdit") as CheckBox;
                CheckBox Checkbox_PDel = DataGridPrivate.Items[i].FindControl("Checkbox_PDel") as CheckBox;
                PrivateDepartMentInfo pdi = new PrivateDepartMentInfo();
                if (!hDepartPrivilege.ContainsKey(menuid))
                {
                    pdi.DepartMentId = Convert.ToInt32(departid);
                    pdi.MENUID = menuid;
                    pdi.URL = url;
                    hDepartPrivilege.Add(menuid, pdi);
                }
                pdi = hDepartPrivilege[menuid] as PrivateDepartMentInfo;
                pdi.PQUERY = Convert.ToInt32(Checkbox_PQuery.Checked);
                pdi.PADD = Convert.ToInt32(CheckBox_PAdd.Checked);
                pdi.PEDIT = Convert.ToInt32(Checkbox_PEdit.Checked);
                pdi.PDEL = Convert.ToInt32(Checkbox_PDel.Checked);
            }

            DataGridPrivate.DataSource = ModuleWorkFlow.business.Menu.getMenuView(Convert.ToInt32(drp_subMenu.SelectedValue));
            DataGridPrivate.DataBind();

            ModuleWorkFlow.BLL.PrivateDepartMent pdm = new ModuleWorkFlow.BLL.PrivateDepartMent();
            IList ipdm = pdm.getPrivateByDepartmentId(Convert.ToInt32(departid));
            for (int i = 0; i < DataGridPrivate.Items.Count; i++)
            {
                string menuid = DataGridPrivate.Items[i].Cells[0].Text.Trim();
                string url = DataGridPrivate.Items[i].Cells[2].Text.Trim();
                CheckBox Checkbox_PQuery = DataGridPrivate.Items[i].FindControl("Checkbox_PQuery") as CheckBox;
                CheckBox CheckBox_PAdd = DataGridPrivate.Items[i].FindControl("CheckBox_PAdd") as CheckBox;
                CheckBox Checkbox_PEdit = DataGridPrivate.Items[i].FindControl("Checkbox_PEdit") as CheckBox;
                CheckBox Checkbox_PDel = DataGridPrivate.Items[i].FindControl("Checkbox_PDel") as CheckBox;

                for (int x = 0; x < ipdm.Count; x++)
                {
                    ModuleWorkFlow.Model.PrivateDepartMentInfo pdmi = (ModuleWorkFlow.Model.PrivateDepartMentInfo)ipdm[x];
                    if (pdmi.MENUID.Equals(menuid))
                    {
                        if (!hDepartPrivilege.ContainsKey(menuid))
                        {
                            hDepartPrivilege.Add(menuid, pdmi);
                        }
                        pdmi = hDepartPrivilege[menuid] as PrivateDepartMentInfo;

                        Checkbox_PQuery.Checked = pdmi.PQUERY > 0;
                        CheckBox_PAdd.Checked = pdmi.PADD > 0;
                        Checkbox_PEdit.Checked = pdmi.PEDIT > 0;
                        Checkbox_PDel.Checked = pdmi.PDEL > 0;
                    }
                }
            }
            Session["hDepartPrivilege"] = hDepartPrivilege;

        }
        //JG-071112
        private void BindProcess(string departid)
        {
            //init rolegroupprocess
            MainDataGrid.DataSource = ModuleWorkFlow.business.Process.getProcessView();
            MainDataGrid.DataBind();

            ModuleWorkFlow.BLL.RoleGroupProcess rgp = new ModuleWorkFlow.BLL.RoleGroupProcess();
            IList rgpis = rgp.getRoleGroupProcessView(Convert.ToInt32(departid));
            string selectedProcess = "";

            foreach (ModuleWorkFlow.Model.RoleGroupProcessInfo rgpi in rgpis)
            {
                selectedProcess += "[" + rgpi.Processid + "]";
            }


            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox cb = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                if (cb != null)
                {
                    cb.Checked = selectedProcess.IndexOf("[" + MainDataGrid.Items[i].Cells[1].Text.Trim() + "]") != -1;
                }
            }
        }

        private void InitalEditPage(string departid)
        {
            BindMenu(departid);
            BindProcess(departid);
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
            this.CheckBox_SelectAll.CheckedChanged += new System.EventHandler(this.CheckBox_SelectAll_CheckedChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion

        private void Button_AddEdit_Click(object sender, System.EventArgs e)
        {
            if (Label_HiddenFuncMode.Text.Equals("add"))
            {
                Add();
            }
            else
            {
                Edit();
            }
        }

        private void Add()
        {
            //
        }

        private void Edit()
        {
            Hashtable hDepartPrivilege = new Hashtable();
            if (Session["hDepartPrivilege"] != null)
            {
                hDepartPrivilege = Session["hDepartPrivilege"] as Hashtable;
            }

            string msg = "";
            string departid = Request.Params["departid"].ToString();
            msg = Lang.TXT_EDITSUCCESS;
            ArrayList apdmi = new ArrayList();
            ArrayList auser = new ArrayList();
            //jg-071112
            ArrayList al = new ArrayList();
            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox cb = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                if (cb.Checked)
                {
                    al.Add(MainDataGrid.Items[i].Cells[1].Text.Trim());
                }
            }
            ModuleWorkFlow.BLL.RoleGroupProcess rgp = new ModuleWorkFlow.BLL.RoleGroupProcess();
            rgp.UpdateRoleGroupProcess(Convert.ToInt32(departid), al);

            IList userlist = new ModuleWorkFlow.BLL.User().getUserInfoByDepartment(Convert.ToInt32(departid));
            foreach (ModuleWorkFlow.Model.UserInfo ui in userlist)
            {
                RoleProcess.UpdateRoleProcess(ui.UserName, al);
            }
            al.Clear();
            //
            for (int i = 0; i < DataGridPrivate.Items.Count; i++)
            {
                string menuid = DataGridPrivate.Items[i].Cells[0].Text.Trim();
                string url = DataGridPrivate.Items[i].Cells[2].Text.Trim();
                CheckBox Checkbox_PQuery = DataGridPrivate.Items[i].FindControl("Checkbox_PQuery") as CheckBox;
                CheckBox CheckBox_PAdd = DataGridPrivate.Items[i].FindControl("CheckBox_PAdd") as CheckBox;
                CheckBox Checkbox_PEdit = DataGridPrivate.Items[i].FindControl("Checkbox_PEdit") as CheckBox;
                CheckBox Checkbox_PDel = DataGridPrivate.Items[i].FindControl("Checkbox_PDel") as CheckBox;

                if (hDepartPrivilege.ContainsKey(menuid))
                {
                    hDepartPrivilege.Remove(menuid);
                }

                if (Checkbox_PQuery.Checked || CheckBox_PAdd.Checked || Checkbox_PEdit.Checked || Checkbox_PDel.Checked)
                {
                    ModuleWorkFlow.Model.PrivateDepartMentInfo pdmi = new ModuleWorkFlow.Model.PrivateDepartMentInfo();
                    pdmi.DepartMentId = Convert.ToInt32(departid);
                    pdmi.MENUID = menuid;
                    pdmi.URL = url;
                    pdmi.PQUERY = Convert.ToInt32(Checkbox_PQuery.Checked);
                    pdmi.PADD = Convert.ToInt32(CheckBox_PAdd.Checked);
                    pdmi.PEDIT = Convert.ToInt32(Checkbox_PEdit.Checked);
                    pdmi.PDEL = Convert.ToInt32(Checkbox_PDel.Checked);

                    //ModuleWorkFlow.Model.PrivateInfo pi = new ModuleWorkFlow.Model.PrivateInfo();
                    //pi.MENUID = menuid;
                    //pi.URL = url;
                    //pi.PQUERY = Convert.ToInt32(Checkbox_PQuery.Checked);
                    //pi.PADD = Convert.ToInt32(CheckBox_PAdd.Checked) ;
                    //pi.PEDIT = Convert.ToInt32(Checkbox_PEdit.Checked) ;
                    //pi.PDEL = Convert.ToInt32(Checkbox_PDel.Checked) ;
                    //auser.Add(pi);

                    apdmi.Add(pdmi);
                }
            }
            foreach (string key in hDepartPrivilege.Keys)
            {
                PrivateDepartMentInfo pdi = hDepartPrivilege[key] as PrivateDepartMentInfo;
                if (pdi.PADD > 0 || pdi.PEDIT > 0 || pdi.PQUERY > 0 || pdi.PDEL > 0)
                {
                    pdi.DepartMentId = Convert.ToInt32(departid);
                    pdi.MENUID = key;
                    apdmi.Add(pdi);
                }
            }

            foreach (PrivateDepartMentInfo pdi in apdmi)
            {
                ModuleWorkFlow.Model.PrivateInfo pi = new ModuleWorkFlow.Model.PrivateInfo();
                pi.MENUID = pdi.MENUID;
                pi.URL = pdi.URL;
                pi.PQUERY = pdi.PQUERY;
                pi.PADD = pdi.PADD;
                pi.PEDIT = pdi.PEDIT;
                pi.PDEL = pdi.PDEL;
                auser.Add(pi);
            }

            ModuleWorkFlow.BLL.PrivateDepartMent pdm = new ModuleWorkFlow.BLL.PrivateDepartMent();
            pdm.updatePrivateWithDepartMent(Convert.ToInt32(departid), apdmi);
            IList users = new ModuleWorkFlow.BLL.User().getUserInfoByDepartment(Convert.ToInt32(departid));
            foreach (ModuleWorkFlow.Model.UserInfo ui in users)
            {
                foreach (ModuleWorkFlow.Model.PrivateInfo pi in auser)
                {
                    pi.USERNAME = ui.UserName;
                }
                ModuleWorkFlow.BLL.Private p = new ModuleWorkFlow.BLL.Private();
                p.updatePrivateWithUserName(ui.UserName, auser);
            }
            Response.Redirect("DepartMentPrivilegeList.aspx?msg=" + Server.UrlEncode(msg));
        }
        //JG-071112
        private void CheckBox_SelectAll_CheckedChanged(object sender, System.EventArgs e)
        {
            bool selectAll = CheckBox_SelectAll.Checked;

            for (int i = 0; i < MainDataGrid.Items.Count; i++)
            {
                CheckBox cb = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                if (cb != null)
                {
                    cb.Checked = selectAll;
                }
            }
        }

        protected void lnkbutton_save_Click(object sender, EventArgs e)
        {
            Button_AddEdit_Click(sender, e);
        }

        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {
            BindMenu(Label_HiddenDepartId.Text);
        }


    }
}
