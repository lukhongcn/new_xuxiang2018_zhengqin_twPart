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
    public class UserPrivilegeAddEdit : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Label Label_HiddenUserId;
        protected System.Web.UI.WebControls.Label Label_HiddenFuncMode;
        protected System.Web.UI.WebControls.TextBox Textbox_UserId;
        protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
        protected System.Web.UI.WebControls.RequiredFieldValidator Requiredfieldvalidator3;
        protected System.Web.UI.WebControls.TextBox Textbox_Password;
        protected System.Web.UI.WebControls.DropDownList DropDownList_Role;
        protected DropDownList drp_menu;
        protected DropDownList drp_subMenu;
        protected System.Web.UI.WebControls.RadioButtonList RadioButtonList_IsAdmin;
        protected System.Web.UI.WebControls.Label Label_Message;
        protected System.Web.UI.WebControls.DataGrid MainDataGrid;
        protected System.Web.UI.WebControls.CheckBox CheckBox_SelectAll;
        protected System.Web.UI.WebControls.DataGrid DataGridPrivate;



        private string menuid = "A62";
        protected string menuname = "";
        private void Page_Load(object sender, System.EventArgs e)
        {
            menuname = new Tmenu().findbykey(menuid).Menuname;
            if (!this.IsPostBack)
            {
                Session["hPrivilege"] = null;
                Label_Message.Text = "";
                bindParentMenu();
                bindSubMenu();
                string func = Request.Params["func"];
                if (func != null && func.Equals("edit"))
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PEDIT"))
                    {
                        //edit mode
                        string userid = Request.Params["userid"];
                        Textbox_UserId.Text = userid;
                        Textbox_UserId.ReadOnly = true;
                        Label_HiddenUserId.Text = userid;


                        Label_HiddenFuncMode.Text = "edit";
                        InitalEditPage(userid);

                    }
                }
                else
                {
                    if (ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PADD"))
                    {
                        //add mode					

                        Label_HiddenFuncMode.Text = "add";
                        InitalAddPage();
                    }
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

        private void BindMenu(string username)
        {
            string userid = Textbox_UserId.Text;
            Hashtable hPrivilege = new Hashtable();
            if (Session["hPrivilege"] != null)
            {
                hPrivilege = Session["hPrivilege"] as Hashtable;
            }

            //preserve hPrivilege

            for (int i = 0; i < DataGridPrivate.Items.Count; i++)
            {
                string menuid = DataGridPrivate.Items[i].Cells[0].Text.Trim();
                string url = DataGridPrivate.Items[i].Cells[2].Text.Trim();
                CheckBox Checkbox_PQuery = DataGridPrivate.Items[i].FindControl("Checkbox_PQuery") as CheckBox;
                CheckBox CheckBox_PAdd = DataGridPrivate.Items[i].FindControl("CheckBox_PAdd") as CheckBox;
                CheckBox Checkbox_PEdit = DataGridPrivate.Items[i].FindControl("Checkbox_PEdit") as CheckBox;
                CheckBox Checkbox_PDel = DataGridPrivate.Items[i].FindControl("Checkbox_PDel") as CheckBox;
                ModuleWorkFlow.Model.PrivateInfo pi = new ModuleWorkFlow.Model.PrivateInfo();

                if (!hPrivilege.ContainsKey(menuid))
                {

                    pi.USERNAME = userid;
                    pi.MENUID = menuid;
                    pi.URL = url;
                    hPrivilege.Add(menuid, pi);
                }

                pi = hPrivilege[menuid] as PrivateInfo;


                pi.PQUERY = Convert.ToInt32(Checkbox_PQuery.Checked);
                pi.PADD = Convert.ToInt32(CheckBox_PAdd.Checked);
                pi.PEDIT = Convert.ToInt32(Checkbox_PEdit.Checked);
                pi.PDEL = Convert.ToInt32(Checkbox_PDel.Checked);


            }


            DataGridPrivate.DataSource = ModuleWorkFlow.business.Menu.getMenuView(Convert.ToInt32(drp_subMenu.SelectedValue));
            DataGridPrivate.DataBind();

            ModuleWorkFlow.BLL.Private p = new ModuleWorkFlow.BLL.Private();
            IList ip = p.getPrivateByUserName(username);
            for (int i = 0; i < DataGridPrivate.Items.Count; i++)
            {
                string menuid = DataGridPrivate.Items[i].Cells[0].Text.Trim();
                CheckBox Checkbox_PQuery = DataGridPrivate.Items[i].FindControl("Checkbox_PQuery") as CheckBox;
                CheckBox CheckBox_PAdd = DataGridPrivate.Items[i].FindControl("CheckBox_PAdd") as CheckBox;
                CheckBox Checkbox_PEdit = DataGridPrivate.Items[i].FindControl("Checkbox_PEdit") as CheckBox;
                CheckBox Checkbox_PDel = DataGridPrivate.Items[i].FindControl("Checkbox_PDel") as CheckBox;
                for (int x = 0; x < ip.Count; x++)
                {
                    ModuleWorkFlow.Model.PrivateInfo pi = (ModuleWorkFlow.Model.PrivateInfo)ip[x];


                    if (pi.MENUID.Trim().Equals(menuid.Trim()))
                    {
                        if (!hPrivilege.ContainsKey(menuid))
                        {
                            hPrivilege.Add(menuid, pi);
                        }

                        pi = hPrivilege[menuid] as PrivateInfo;

                        Checkbox_PQuery.Checked = pi.PQUERY > 0;
                        CheckBox_PAdd.Checked = pi.PADD > 0;
                        Checkbox_PEdit.Checked = pi.PEDIT > 0;
                        Checkbox_PDel.Checked = pi.PDEL > 0;
                    }
                }





            }

            Session["hPrivilege"] = hPrivilege;

        }

        private void InitalEditPage(string userid)
        {
            Hashtable hProcess = new Hashtable();

            BindMenu(userid);
            DataRow dr = Employee.getEmplDataRow(userid);
            if (dr != null)
            {
                Object o = null;

                o = dr["Password"];
                if (o != null) Textbox_Password.Text = o.ToString();

                DropDownList_Role.DataTextField = "rolename";
                DropDownList_Role.DataValueField = "roleid";
                DropDownList_Role.DataSource = Role.getRoleView();
                DropDownList_Role.DataBind();

                o = dr["roleid"];
                if (o != null) business.Methods.DropDownListChange(DropDownList_Role, o.ToString());

                RadioButtonList_IsAdmin.Items.Clear();
                RadioButtonList_IsAdmin.Items.Add(Lang.TXT_YES);
                RadioButtonList_IsAdmin.Items[0].Value = "1";
                RadioButtonList_IsAdmin.Items.Add(Lang.TXT_NO);
                RadioButtonList_IsAdmin.Items[1].Value = "0";

                o = dr["isadmin"];
                if (o != null)
                {
                    int isadmin = Convert.ToInt32(o);
                    if (isadmin == 0)
                    {
                        RadioButtonList_IsAdmin.SelectedIndex = 1;
                    }
                    else
                    {
                        RadioButtonList_IsAdmin.SelectedIndex = 0;
                    }
                }

                //init roleprocess
                MainDataGrid.DataSource = ModuleWorkFlow.business.Process.getProcessView();
                MainDataGrid.DataBind();

                DataSet ds = RoleProcess.getRoleProcessView(userid);
                DataTable dt = ds.Tables[0];
                string selectedProcess = "";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    selectedProcess += "[" + dt.Rows[i]["processid"].ToString().Trim() + "]";
                }


                for (int i = 0; i < MainDataGrid.Items.Count; i++)
                {
                    CheckBox cb = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                    if (cb != null)
                    {
                        cb.Checked = selectedProcess.IndexOf("[" + MainDataGrid.Items[i].Cells[1].Text.Trim() + "]") != -1;
                        if (cb.Checked)
                        {
                            hProcess.Add(MainDataGrid.Items[i].Cells[1].Text.Trim(), MainDataGrid.Items[i].Cells[1].Text.Trim());
                        }
                    }
                }

                Session["hProcess"] = hProcess;

            }
            else
            {
                string msg = Lang.EditKeyError(userid);
                Response.Redirect("UserList.aspx?msg=" + Server.UrlEncode(msg), true);
            }
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
            Hashtable hPrivilege = new Hashtable();
            if (Session["hPrivilege"] != null)
            {
                hPrivilege = Session["hPrivilege"] as Hashtable;
            }
            string msg = "";
            string userid = Textbox_UserId.Text;
            Employee empl = new Employee();
            empl.setUserName(userid);

            string password = Textbox_Password.Text;
            string roleid = DropDownList_Role.SelectedValue;
            string isadmin = RadioButtonList_IsAdmin.SelectedValue;

            empl.setPassword(password);
            empl.setRoleId(roleid);
            empl.setIsAdmin(Convert.ToInt32(isadmin));
            if (empl.StorePrivilege() < 0)
            {
                msg = Lang.TXT_OPERATIONERROR;
            }
            else
            {
                ArrayList al = new ArrayList();
                for (int i = 0; i < MainDataGrid.Items.Count; i++)
                {
                    CheckBox cb = MainDataGrid.Items[i].FindControl("CheckBox_Select") as CheckBox;
                    if (cb.Checked)
                    {
                        al.Add(MainDataGrid.Items[i].Cells[1].Text.Trim());
                    }
                }
                RoleProcess.UpdateRoleProcess(userid, al);

                ModuleWorkFlow.BLL.Private p = new ModuleWorkFlow.BLL.Private();
                //save private
                al.Clear();
                for (int i = 0; i < DataGridPrivate.Items.Count; i++)
                {
                    string menuid = DataGridPrivate.Items[i].Cells[0].Text.Trim();
                    string url = DataGridPrivate.Items[i].Cells[2].Text.Trim();
                    CheckBox Checkbox_PQuery = DataGridPrivate.Items[i].FindControl("Checkbox_PQuery") as CheckBox;
                    CheckBox CheckBox_PAdd = DataGridPrivate.Items[i].FindControl("CheckBox_PAdd") as CheckBox;
                    CheckBox Checkbox_PEdit = DataGridPrivate.Items[i].FindControl("Checkbox_PEdit") as CheckBox;
                    CheckBox Checkbox_PDel = DataGridPrivate.Items[i].FindControl("Checkbox_PDel") as CheckBox;
                    if (hPrivilege.ContainsKey(menuid))
                    {
                        hPrivilege.Remove(menuid);
                    }
                    if (Checkbox_PQuery.Checked || CheckBox_PAdd.Checked || Checkbox_PEdit.Checked || Checkbox_PDel.Checked)
                    {
                        ModuleWorkFlow.Model.PrivateInfo pi = new ModuleWorkFlow.Model.PrivateInfo();
                        pi.USERNAME = userid;
                        pi.MENUID = menuid;
                        pi.URL = url;
                        pi.PQUERY = Convert.ToInt32(Checkbox_PQuery.Checked);
                        pi.PADD = Convert.ToInt32(CheckBox_PAdd.Checked);
                        pi.PEDIT = Convert.ToInt32(Checkbox_PEdit.Checked);
                        pi.PDEL = Convert.ToInt32(Checkbox_PDel.Checked);
                        al.Add(pi);
                    }
                }


                foreach (string key in hPrivilege.Keys)
                {
                    PrivateInfo pi = hPrivilege[key] as PrivateInfo;
                    if (pi.PADD > 0 || pi.PEDIT > 0 || pi.PQUERY > 0 || pi.PDEL > 0)
                    {
                        pi.USERNAME = userid;
                        pi.MENUID = key;
                        al.Add(pi);
                    }
                }


                p.updatePrivateWithUserName(userid, al);

                msg = Lang.TXT_EDITSUCCESS;
            }

            Response.Redirect("UserPrivilegeList.aspx?msg=" + Server.UrlEncode(msg));
        }

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
            BindMenu(Textbox_UserId.Text);
        }

    }
}
