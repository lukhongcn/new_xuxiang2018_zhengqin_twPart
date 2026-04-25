using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.BLL.Outsource;
using ModuleWorkFlow.BLL.StupidReport;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.Alert;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.Model.StupidReport;
using ModuleWorkFlow.Model.System;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;

namespace ModuleWorkFlow
{
    public partial class ModuleScheduleLightALT : System.Web.UI.Page
    {
        private static string menuid = "B123";
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.menuId = menuid;

            if (!this.IsPostBack)
            {
                //ModuleWorkFlow.BLL.Private.checkPrivate(this, menuid, "PQUERY");

                if (Request.Params["dpl_isDelay"] != null)
                {
                    dpl_isDelay.SelectedValue = Request.Params["dpl_isDelay"];
                    if (!dpl_isDelay.SelectedValue.Equals("0"))
                    {
                        dpl_overStatus.SelectedValue = "2";

                        if (Convert.ToInt32(dpl_isDelay.SelectedValue) > 2)
                        {
                            dpl_ismodify.SelectedValue = "1";
                            dpl_datetime.SelectedValue = "6";

                            if (Request["startdate"] != null && Request["enddate"] != null)
                            {
                                txt_startenddate.Text = Request["startdate"] + "-" + Request["enddate"];
                            }
                        }
                    }

                }
                BindCustomer();
                BindCustomerModuleId();
                initGridTable();
            }
        }


        private void BindCustomer()
        {
            ModuleWorkFlow.BLL.Customer customer = new ModuleWorkFlow.BLL.Customer();
            dpl_customer.DataSource = customer.GetCustomer();
            dpl_customer.DataTextField = "ChineseName";
            dpl_customer.DataValueField = "Id";
            dpl_customer.DataBind();
            dpl_customer.Items.Insert(0, new ListItem(Translate.translateString("所有客戶"), "0"));
            if (Request.Params["customerid"] != null)
                dpl_customer.SelectedValue = Request.Params["customerid"];
        }

        private void BindCustomerModuleId()
        {
            IList list = new ArrayList();
            ModuleWorkFlow.BLL.System.Model model = new ModuleWorkFlow.BLL.System.Model();
            if (dpl_customer.SelectedValue.Equals(""))
            {
                list = model.GetModelInfos();
            }
            else
            {
                list = model.GetModelByCustomerId(Convert.ToInt32(dpl_customer.SelectedValue));
            }

            dpl_customerModuleId.DataSource = list;
            dpl_customerModuleId.DataTextField = "moldName";
            dpl_customerModuleId.DataValueField = "Id";
            dpl_customerModuleId.DataBind();
            dpl_customerModuleId.Items.Insert(0, new ListItem(Translate.translateString("所有機種"), "0"));

            if (Request.Params["customermoduleid"] != null)
            {
                dpl_customerModuleId.SelectedValue = Request.Params["customermoduleid"];
            }
        }

        private void initGridTable()
        {
            lab_pirntmsg.Text = "";
            string newsql = "";

            DateTime startdate = new DateTime();
            DateTime enddate = new DateTime();
            try
            {
                if (!txt_startenddate.Text.Equals(""))
                {
                    startdate = Convert.ToDateTime(txt_startenddate.Text.Trim().Split('-')[0]);
                    enddate = Convert.ToDateTime(txt_startenddate.Text.Trim().Split('-')[1]);
                }
            }
            catch
            {
                //Label_Message.Text = lab_StartDate.Text + ":" + Lang.DATE_TYPE_CHANGE_ERROR;
                return;
            }
            int customerId = Convert.ToInt32(dpl_customer.SelectedValue);
            // int customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);

            #region 拼接SQL
            int customeriId = 0;
            int producttype = 0;
            int modifyid = 0;
            if (dpl_customer.SelectedValue.Equals(""))
            {
                customeriId = 0;
            }
            else
            {
                customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
            }

            modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);


            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
            int customerModuleId = -1;
            if (!dpl_customerModuleId.SelectedValue.Equals(""))
                customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);
            // string sqlstring = "";
            if (dpl_overStatus.SelectedValue.Equals("4"))
            {
                newsql = " and " + order.getOrderSql("Close", 3, customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, 0, 0, "");
            }
            else
            {
                newsql = " and " + order.getOrderSql(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, 0, 0, "");
            }

            if (dpl_isDelay.SelectedValue.Equals("1"))
            {
                newsql += "  and tryDate0 <GETDATE() ";
            }

            if (Convert.ToInt32(dpl_isDelay.SelectedValue) > 2)
            {
                newsql += " and cast(right(moduleid,len(moduleid)-(len(moduleid)-CHARINDEX('-',REVERSE(moduleid)) +2)) as int)>=" + dpl_isDelay.SelectedValue;
            }


            #endregion
            //Label_Message.Text = "";

            OrderDesign orderdesign = new OrderDesign();
            //IList source = orderdesign.GetNewOrderUnDealt(null, null);
            IList source = new ArrayList();
            ModuleScheduleAlert moduleSchedule = new ModuleScheduleAlert();
            Hashtable hpartprocesses = new Hashtable();
            Session["hpartprocesses"] = hpartprocesses;
            source = moduleSchedule.getModuleSchedule(newsql, "", MainDataGrid.PageIndex, MainDataGrid.PageSize, hpartprocesses, Convert.ToInt32(dpl_overStatus.SelectedValue));
            MainDataGrid.VirtualItemCount = moduleSchedule.getItemCount();
            int num = moduleSchedule.getItemCount();
            MainDataGrid.DataSource = source;
            MainDataGrid.DataBind();

            //if (MainDataGrid.VirtualItemCount % MainDataGrid.PageSize == 0)
            //{
            //    lab_totalpage.Text = (MainDataGrid.VirtualItemCount / MainDataGrid.PageSize).ToString();
            //}
            //else
            //{
            //    lab_totalpage.Text = (MainDataGrid.VirtualItemCount / MainDataGrid.PageSize + 1).ToString();
            //}
            //lab_nowpage.Text = (MainDataGrid.PageIndex + 1).ToString();

            //lab_totalpage.Text = MainDataGrid.PageCount.ToString();
            //lab_nowpage.Text = (MainDataGrid.PageIndex+1).ToString(); 

            if (num % MainDataGrid.PageSize == 0)
            {
                lab_totalpage.Text = (num / MainDataGrid.PageSize).ToString();
            }
            else
            {
                lab_totalpage.Text = (num / MainDataGrid.PageSize + 1).ToString();
            }
            lab_nowpage.Text = (MainDataGrid.PageIndex + 1).ToString();
        }
        protected void dpl_customerModuleId_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void MainDataGrid_ItemDataBound(object sender, GridViewRowEventArgs e)
        {

            if (dpl_overStatus.SelectedValue == "3")
            {
                MainDataGrid.Columns[8].Visible = true;
            }
            else
            {
                MainDataGrid.Columns[8].Visible = false;
            }

            //for (int i = 2; i < e.Row.Cells.Count; i++)
            //{
            //    e.Row.Cells[i].Text = Server.HtmlDecode(e.Row.Cells[i].Text);

            //}

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label dg_lab_StatusId = e.Row.FindControl("dg_lab_StatusId") as Label;
                Label dg_lab_moduleId = e.Row.FindControl("dg_lab_moduleId") as Label;
                string moduleid = dg_lab_moduleId.Text;
                if (!string.IsNullOrEmpty(dg_lab_StatusId.Text))
                {
                    switch (dg_lab_StatusId.Text)
                    {
                        case "Ready":
                            dg_lab_StatusId.CssClass = "badge bg-green";
                            dg_lab_StatusId.Text = Translate.translateString("就緒");
                            break;
                        case "Holdon":
                            dg_lab_StatusId.CssClass = "badge bg-orange";
                            dg_lab_StatusId.Text = Translate.translateString("暫停");
                            break;
                        case "Cancel":
                            dg_lab_StatusId.CssClass = "badge bg-red";
                            dg_lab_StatusId.Text = Translate.translateString("取消");
                            break;
                    }
                }
                Label dg_lab_show_trydate0 = e.Row.FindControl("dg_lab_show_trydate0") as Label;
                if (Convert.ToDateTime((e.Row.FindControl("dg_lab_trydate0") as Label).Text.Trim()).Ticks < DateTime.Now.Ticks)
                {
                    dg_lab_show_trydate0.CssClass = "badge bg-red";
                }


                if ((e.Row.FindControl("dg_lab_Overdealt") as Label).Text.Trim().Equals("1"))
                {
                    dg_lab_show_trydate0.CssClass = "badge bg-green";
                }

                double bomPartCount = Convert.ToDouble((e.Row.FindControl("dg_lab_BomPartCount") as Label).Text);
                double partCount = Convert.ToDouble((e.Row.FindControl("dg_lab_PartCount") as Label).Text);
                Label dg_lab_HaveProcessCount = e.Row.FindControl("dg_lab_HaveProcessCount") as Label;
                Label dg_lab_HaveProductCount = e.Row.FindControl("dg_lab_HaveProductCount") as Label;
                double haveProcessCount = Convert.ToDouble(dg_lab_HaveProcessCount.Text);
                double haveProductCount = Convert.ToDouble(dg_lab_HaveProductCount.Text);
                double haveOutSourceCount = Convert.ToDouble((e.Row.FindControl("dg_lab_HaveOutSourceCount") as Label).Text);

                Label dg_lab_HaveFinishedOutSourceCount = e.Row.FindControl("dg_lab_HaveFinishedOutSourceCount") as Label;
                //double haveFinishedOutSourceCount = Convert.ToDouble(dg_lab_HaveFinishedOutSourceCount.Text);
                LinkButton dg_lnk_PartCount = e.Row.FindControl("dg_lnk_PartCount") as LinkButton;
                Label dg_lab_ShowHaveProcessCount = e.Row.FindControl("dg_lab_ShowHaveProcessCount") as Label;
                Label dg_lab_BomPartCount = e.Row.FindControl("dg_lab_BomPartCount") as Label;
                LinkButton dg_lnk_BomPartCount = e.Row.FindControl("dg_lnk_BomPartCount") as LinkButton;
                Label dg_lab_PartCount = e.Row.FindControl("dg_lab_PartCount") as Label;
                LinkButton dg_lnk_HaveProcessFinishedOutSourceCount = e.Row.FindControl("dg_lnk_HaveProcessFinishedOutSourceCount") as LinkButton;
                Label dg_lab_HaveProcessFinishedOutSourceCount = e.Row.FindControl("dg_lab_HaveProcessFinishedOutSourceCount") as Label;
                LinkButton dg_lnk_HaveFinishedOutSourceCount = e.Row.FindControl("dg_lnk_HaveFinishedOutSourceCount") as LinkButton;

                //dg_lnk_HaveProcessFinishedOutSourceCount.Visible = false;
                //dg_lab_HaveProcessFinishedOutSourceCount.Visible = true;

                //  dg_lnk_HaveFinishedOutSourceCount.Visible = false;
                dg_lab_HaveFinishedOutSourceCount.Visible = true;
                if ((e.Row.FindControl("dg_lab_Overdealt") as Label).Text.Trim().Equals("0") && bomPartCount > 0)
                {
                    if (partCount > 0)
                    {
                        //setColor(dg_lab_HaveProcessCount, haveProcessCount / partCount);
                        //setColor(dg_lab_HaveProductCount, haveProductCount / partCount);
                        dg_lab_PartCount.Text = dg_lab_HaveProcessCount.Text + "/" + dg_lab_PartCount.Text;
                        setColor(dg_lab_PartCount, haveProcessCount / partCount);
                    }
                    if (haveProcessCount > 0)
                    {
                        setColor(dg_lab_ShowHaveProcessCount, haveProductCount / haveProcessCount);
                    }

                    //if (dg_lab_HaveFinishedOutSourceCount.Text.Contains("/") && Convert.ToInt32(dg_lab_HaveFinishedOutSourceCount.Text.Split('/')[1]) > 0)
                    //{
                    //    dg_lnk_HaveFinishedOutSourceCount.Visible = true;
                    //    dg_lab_HaveFinishedOutSourceCount.Visible = false;
                    //}

                    //if (dg_lab_HaveProcessFinishedOutSourceCount.Text.Contains("/") && Convert.ToInt32(dg_lab_HaveProcessFinishedOutSourceCount.Text.Split('/')[1]) > 0)
                    //{
                    //    dg_lnk_HaveProcessFinishedOutSourceCount.Visible = true;
                    //    dg_lab_HaveProcessFinishedOutSourceCount.Visible = false;
                    //}
                }
                else
                {
                    //dg_lab_BomPartCount.Visible = true;
                    //dg_lnk_BomPartCount.Visible = false;

                    //dg_lab_PartCount.Visible = true;
                    dg_lab_PartCount.Text = dg_lab_HaveProcessCount.Text + "/" + dg_lab_PartCount.Text;
                    //dg_lnk_PartCount.Visible = false;
                }

                Label dg_lab_show_DesignEndDate = e.Row.FindControl("dg_lab_show_DesignEndDate") as Label;
                if (dg_lab_show_DesignEndDate.Text.Substring(0, 2).Equals("00"))
                {
                    dg_lab_show_DesignEndDate.Text = "";
                }

                Label dg_lab_ProductEndDate = e.Row.FindControl("dg_lab_ProductEndDate") as Label;
                if (dg_lab_ProductEndDate.Text.Substring(0, 2).Equals("00"))
                {
                    dg_lab_ProductEndDate.Text = "";
                }

                //Label dg_lab_HaveOutSourceCount = e.Row.FindControl("dg_lab_HaveOutSourceCount") as Label;
                //if (Convert.ToInt32(dg_lab_HaveOutSourceCount.Text) == 0)
                //{
                //    LinkButton dg_lnk_HaveFinishedOutSourceCount = e.Row.FindControl("dg_lnk_HaveFinishedOutSourceCount") as LinkButton;
                //    dg_lnk_HaveFinishedOutSourceCount.Text = "";
                //}

                //Label dg_lab_HaveProcessOutSourceCount = e.Row.FindControl("dg_lab_HaveProcessOutSourceCount") as Label;
                //if (Convert.ToInt32(dg_lab_HaveProcessOutSourceCount.Text) == 0)
                //{
                //    LinkButton dg_lnk_HaveProcessFinishedOutSourceCount = e.Row.FindControl("dg_lnk_HaveProcessFinishedOutSourceCount") as LinkButton;
                //    dg_lnk_HaveProcessFinishedOutSourceCount.Text = "";
                //}

                Label dg_lab_ModifyCount = e.Row.FindControl("dg_lab_ModifyCount") as Label;
                if (Convert.ToInt32(dg_lab_ModifyCount.Text) == 0)
                {
                    dg_lab_ModifyCount.Text = "";
                }

                Label dg_lab_TryDate3 = e.Row.FindControl("dg_lab_TryDate3") as Label;
                if (dg_lab_TryDate3.Text.Substring(0, 2).Equals("00"))
                {
                    dg_lab_TryDate3.Text = "";
                }

                Label dg_lab_ReferencePictureDate = e.Row.FindControl("dg_lab_ReferencePictureDate") as Label;
                if (dg_lab_ReferencePictureDate.Text.Substring(0, 2).Equals("00"))
                {
                    dg_lab_ReferencePictureDate.Text = "";
                }

                dg_lab_moduleId.Text = "<a href=\"#\"  class=\"myModal ModuleScheduleLightALT.aspx/getModuelDetail 'moduleId':'" + moduleid.Trim()
                    + "'\" data-toggle=\"modal\" data-target=\"#myModal\">" + moduleid.Trim() + "</a>";
                if (Convert.ToInt32(dg_lab_BomPartCount.Text) > 0)
                {
                    dg_lab_BomPartCount.Text = "<a href=\"#\"  class=\"myModal ModuleScheduleLightALT.aspx/getBomPartDetailByBT 'moduleId':'" + moduleid.Trim()
                        + "'\" data-toggle=\"modal\" data-target=\"#BTModal\">" + dg_lab_BomPartCount.Text.Trim() + "</a>";
                }

                if (partCount > 0)
                {
                    dg_lab_PartCount.Text = "<a href=\"#\"  class=\"myModal ModuleScheduleLightALT.aspx/getPartDetailByBT 'moduleId':'" + moduleid.Trim()
                        + "'\" data-toggle=\"modal\" data-target=\"#BTModal\">" + dg_lab_PartCount.Text.Trim() + "</a>";
                }

                //單委外
                if (!string.IsNullOrWhiteSpace(dg_lab_HaveProcessFinishedOutSourceCount.Text))
                {
                    dg_lab_HaveProcessFinishedOutSourceCount.Text = "<a href=\"#\"  class=\"myModal ModuleScheduleLightALT.aspx/getProcessOutSourceDetailByBT 'moduleId':'" + moduleid.Trim()
                        + "'\" data-toggle=\"modal\" data-target=\"#BTModal\">" + dg_lab_HaveProcessFinishedOutSourceCount.Text.Trim() + "</a>";
                }

                //全委外
                if (!string.IsNullOrWhiteSpace(dg_lab_HaveFinishedOutSourceCount.Text))
                {
                    dg_lab_HaveFinishedOutSourceCount.Text = "<a href=\"#\"  class=\"myModal ModuleScheduleLightALT.aspx/getOutSourceDetailByBT 'moduleId':'" + moduleid.Trim()
                        + "'\" data-toggle=\"modal\" data-target=\"#BTModal\">" + dg_lab_HaveFinishedOutSourceCount.Text.Trim() + "</a>";
                }

            }
        }

        protected void MainDataGrid_PreRender(object sender, EventArgs e)
        {
            if (MainDataGrid.Rows.Count > 0)
            {
                MainDataGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }

        private void setColor(Label label, double finishedPercent)
        {
            if (finishedPercent < 0.25)
            {
                label.CssClass = "badge bg-red";
            }
            else
            {
                if (finishedPercent < 0.5)
                {
                    label.CssClass = "badge bg-yellow";
                }
                else
                {
                    if (finishedPercent < 0.75)
                    {
                        label.CssClass = "badge bg-blue";
                    }
                    else
                    {
                        label.CssClass = "badge bg-green";
                    }
                }
            }
        }

        /// <summary>
        /// 查詢
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkbutton_search_Click(object sender, EventArgs e)
        {

            initGridTable();
        }

        /// <summary>
        /// 打印
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkbutton_print_Click(object sender, EventArgs e)
        {
            lab_pirntmsg.Text = "";
            string newsql = "";
            DateTime startdate = new DateTime();
            DateTime enddate = new DateTime();
            try
            {
                if (!txt_startenddate.Text.Equals(""))
                {
                    startdate = Convert.ToDateTime(txt_startenddate.Text.Trim().Split('-')[0]);
                    enddate = Convert.ToDateTime(txt_startenddate.Text.Trim().Split('-')[1]);
                }
            }
            catch
            {
                //Label_Message.Text = lab_StartDate.Text + ":" + Lang.DATE_TYPE_CHANGE_ERROR;
                return;
            }
            int customerId = Convert.ToInt32(dpl_customer.SelectedValue);
            // int customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);

            #region 拼接SQL
            int customeriId = 0;
            int producttype = 0;
            int modifyid = 0;
            if (dpl_customer.SelectedValue.Equals(""))
            {
                customeriId = 0;
            }
            else
            {
                customeriId = Convert.ToInt32(dpl_customer.SelectedValue);
            }

            modifyid = Convert.ToInt32(dpl_ismodify.SelectedValue);


            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
            int customerModuleId = -1;
            if (!dpl_customerModuleId.SelectedValue.Equals(""))
                customerModuleId = Convert.ToInt32(dpl_customerModuleId.SelectedValue);
            // string sqlstring = "";
            if (dpl_overStatus.SelectedValue.Equals("4"))
            {
                newsql = " and " + order.getOrderSql("Close", 3, customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, 0, 0, "");
            }
            else
            {
                newsql = " and " + order.getOrderSql(Convert.ToInt32(dpl_overStatus.SelectedValue), customeriId, producttype, modifyid, TextBox_key.Text.Trim(), Convert.ToInt32(dpl_datetime.SelectedValue), startdate, enddate, customerModuleId, 0, 0, "");
            }


            #endregion
            //Label_Message.Text = "";

            OrderDesign orderdesign = new OrderDesign();
            //IList source = orderdesign.GetNewOrderUnDealt(null, null);
            IList source = new ArrayList();
            ModuleScheduleAlert moduleSchedule = new ModuleScheduleAlert();
            Hashtable hpartprocesses = new Hashtable();

            source = moduleSchedule.getModuleSchedule(newsql, "", -1, -1, hpartprocesses, Convert.ToInt32(dpl_isDelay.SelectedValue));

            ModuleWorkFlow.BLL.Status status = new BLL.Status();

            Hashtable hstatus = status.getKeyStatusInfo();

            foreach (ModuleScheduleInfo msi in source)
            {
                msi.StatusId = ((StatusInfo)hstatus[msi.StatusId]).StatusDesc;
                //加工件
                msi.HaveProcessCount_PartCount = msi.HaveProcessCount + "/" + msi.PartCount;
                //製造進度
                msi.HaveProductCount_HaveProcessCount = msi.HaveProductCount + "/" + msi.HaveProcessCount;
            }

            if (source.Count > 0)
            {
                ReporttemplateInfo rti = new Reporttemplate().GetReporttemplateByNo("ModuleSchedule.xls");
                if (rti != null)
                {
                    ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport report = new ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport();
                    string str = report.CreateReport("ModuleSchedule.xls", source);
                    lab_pirntmsg.Text = "<a href='" + str.Replace("//", "/") + "'>" + Translate.translateString("打開報表") + "</a>";
                }
            }
        }

        /// <summary>
        /// 上一頁
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPrev_Click(object sender, EventArgs e)
        {
            lab_pirntmsg.Text = "";
            if (MainDataGrid.PageIndex > 0)
            {
                MainDataGrid.PageIndex--;
                initGridTable();
            }

        }

        /// <summary>
        /// 下一頁
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnNext_Click(object sender, EventArgs e)
        {
            lab_pirntmsg.Text = "";
            if (MainDataGrid.PageIndex + 1 < Convert.ToInt32(lab_totalpage.Text.Trim()))
            {
                MainDataGrid.PageIndex++;
                initGridTable();
            }
        }

        /// <summary>
        /// 頁面跳轉
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_go_Click(object sender, EventArgs e)
        {
            lab_pirntmsg.Text = "";
            try
            {
                int page = Convert.ToInt32(lab_page.Text);
                int total = Convert.ToInt32(lab_totalpage.Text);
                if (page > 0)
                {
                    if (page > total)
                    {

                        lab_pirntmsg.Text = Translate.translateString("跳轉頁碼必須小於總頁碼");
                        return;
                    }
                    else
                    {
                        MainDataGrid.PageIndex = page - 1;
                    }
                }
                else
                {
                    lab_pirntmsg.Text = Translate.translateString("頁碼輸入不正確");
                    return;
                }
            }
            catch
            {
                lab_pirntmsg.Text = Translate.translateString("頁碼輸入不正確");
                return;
            }
            initGridTable();

        }

        #region 模具編號彈窗
        [WebMethod]
        public static string getModuelDetail(string moduleId)
        {
            ModuleWorkFlow.BLL.NewOrder.OrderDesign order = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
            OrderDesignInfo oi = order.GetOrderDesignByModuleId(moduleId);
            return getOrderTable(oi);
        }

        public static string getOrderTable(OrderDesignInfo odi)
        {
            StringBuilder retstr = new StringBuilder();

            IList ilist = new ArrayList();
            StringBuilder str = new StringBuilder();

            ModuleWorkFlow.BLL.ControlTable ct = new BLL.ControlTable();
            ilist = ct.getControlTableByTableNameByIsVisible("tb_order", 0);

            Hashtable horderinfo = new Hashtable();
            Material material = new Material();
            CustomerDesignInfo cdi = new CustomerDesignInfo();
            CustomerDesign cd = new CustomerDesign();
            ModuleWorkFlow.BLL.System.Model cmi = new ModuleWorkFlow.BLL.System.Model();
            // retstr.AppendLine("<html><body><center>");

            ModuleWorkFlow.BLL.System.Supply bp = new ModuleWorkFlow.BLL.System.Supply();

            Type t = odi.GetType();
            PropertyInfo[] PropertyList = t.GetProperties();
            foreach (PropertyInfo item in PropertyList)
            {
                string name = item.Name;
                object value = item.GetValue(odi, null);
                if (!horderinfo.Contains(name.ToUpper()))
                {
                    if (name.ToUpper().Equals(("CustomerId").ToUpper()))
                    {
                        cdi = cd.findbykey(Convert.ToInt32(value.ToString()));
                        if (cdi != null)
                        {
                            value = cdi.CustomerName;
                        }

                    }

                    if (name.ToUpper().Equals(("CustomerModuleId").ToUpper()))
                    {
                        try
                        {
                            if (!value.ToString().Equals("0"))
                            {
                                ModuleWorkFlow.Model.System.ModelInfo cmii = cmi.findbykey(Convert.ToInt32(value));
                                value = cmii.MoldName;
                            }
                        }
                        catch { }

                    }

                    if (name.ToUpper().Equals(("cavMaterial").ToUpper()))
                    {
                        MaterialInfo cav = material.GetMaterialInfo(Convert.ToInt32(value));
                        try
                        {
                            if (cav != null)
                            {
                                value = cav.Name;
                            }
                        }
                        catch { }

                    }

                    if (name.ToUpper().Equals(("corMaterial").ToUpper()))
                    {
                        MaterialInfo cav = material.GetMaterialInfo(Convert.ToInt32(value));
                        try
                        {
                            if (cav != null)
                            {
                                value = cav.Name;
                            }
                        }
                        catch { }

                    }

                    if (name.ToUpper().Equals(("slideMaterial").ToUpper()))
                    {
                        MaterialInfo cav = material.GetMaterialInfo(Convert.ToInt32(value));
                        try
                        {
                            if (cav != null)
                            {
                                value = cav.Name;
                            }
                        }
                        catch { }

                    }

                    if (name.ToUpper().Equals(("material").ToUpper()))
                    {
                        MaterialInfo cav = material.GetMaterialInfo(Convert.ToInt32(value));
                        try
                        {
                            if (cav != null)
                            {
                                value = cav.Name;
                            }
                        }
                        catch { }

                    }


                    if (name.ToUpper().Equals(("ProductTypeId").ToUpper()))
                    {
                        WorkFlow.Model.Standard.StandProcessTypeInfo spt = new WorkFlow.Model.Standard.StandProcessTypeInfo();

                        spt = new WorkFlow.BLL.Standard.StandProcessType().FindProcessTypeId(Convert.ToInt32(value));
                        try
                        {
                            if (spt != null)
                            {
                                value = spt.TypeName;
                            }
                        }
                        catch { }

                    }


                    if (name.ToUpper().Equals(("StatusId").ToUpper()))
                    {

                        Hashtable htable = new Hashtable();
                        htable.Add("Ready", Translate.translateString("就緒"));
                        htable.Add("Holdon", Translate.translateString("暫停"));
                        htable.Add("Cancelled", Translate.translateString("取消"));

                        try
                        {
                            if (htable.Contains(value))
                            {
                                value = htable[value];
                            }
                        }
                        catch { }

                    }

                    if (name.ToUpper().Equals(("isoutsource").ToUpper()))
                    {
                        if (value.ToString().Equals("1"))
                        {
                            value = Translate.translateString("是");
                        }
                        else
                        {
                            value = Translate.translateString("否");
                        }
                    }



                    if (name.ToUpper().Equals(("ispart").ToUpper()))
                    {
                        if (value.ToString().Equals("0"))
                        {
                            value = Translate.translateString("廠批");
                        }
                        else
                        {
                            value = Translate.translateString("圖號");
                        }
                    }

                    if (name.ToUpper().Equals(("batchPlant").ToUpper()))
                    {
                        try
                        {
                            ModuleWorkFlow.Model.System.SupplyInfo bpi = bp.findbykey(Convert.ToInt32(value));
                            if (bpi != null && !string.IsNullOrEmpty(bpi.SupplierName))
                            {
                                value = bpi.SupplierName;
                            }
                            else
                            {
                                value = "";
                            }
                        }
                        catch
                        {
                            value = "";
                        }
                    }

                    if (name.ToUpper().Equals(("priority").ToUpper()))
                    {
                        value = ModuleWorkFlow.business.Priority.getPrioriName(Convert.ToInt32(value));
                    }

                    if (name.ToUpper().Equals(("difficultlevel").ToUpper()))
                    {
                        DifficultInfo di = new Difficult().findbykey(Convert.ToInt32(value));
                        if (di != null && di.Name != null)
                        {
                            value = di.Name;
                        }
                    }


                    if (item.PropertyType.Name.Equals("DateTime"))
                    {
                        if (Convert.ToDateTime(value).Ticks > 0)
                        {
                            horderinfo.Add(name.ToUpper(), Convert.ToDateTime(value).ToShortDateString());
                        }
                        else
                        {
                            horderinfo.Add(name.ToUpper(), "");
                        }
                    }
                    else
                    {
                        horderinfo.Add(name.ToUpper(), value);
                    }

                }
            }



            int i = 0;
            int j = 1; //行數
            int k = 1; //個數，兩個單元格為一個
            //  str.AppendLine("模具編號："+odi.ModuleId+"");
            str.AppendLine(Translate.translateString("責任部門") + ":");
            str.AppendLine(odi.DutyDepartmentName);
            str.AppendLine("<div class='row'><div class='col-lg-6'><div class='card'><div class='card-body'>");
            str.AppendLine("<table  width='100%' height='90%' class='table table-bordered table-hover' ");
            str.AppendLine("<tr>");
            string style = "";

            int count = 0;
            if (ilist.Count % 2 == 0)
            {
                count = ilist.Count / 2;
            }
            else
            {
                count = (ilist.Count / 2) + 1;
            }


            //foreach (ModuleWorkFlow.Model.ControlTableInfo cti in ilist)
            for (int c = 0; c < ilist.Count; c++)
            {
                ModuleWorkFlow.Model.ControlTableInfo cti = ilist[c] as ModuleWorkFlow.Model.ControlTableInfo;
                if (cti.IsVisible == 1)
                {
                    i++;
                    if (j % 2 != 0)
                    {
                        if (k % 2 != 0)
                        {
                            style = "style=\"background-color:LightGrey\"";
                        }
                        else
                        {
                            style = "";
                        }
                    }
                    else
                    {
                        if (k % 2 == 0)
                        {
                            style = "style=\"background-color:LightGrey\"";
                        }
                        else
                        {
                            style = "";
                        }
                    }
                    str.AppendLine("<td " + style + " >" + cti.TableValue + "</td>");

                    if (horderinfo.Contains(cti.TableField.ToUpper()) && horderinfo[cti.TableField.ToUpper()] != null)
                    {
                        try
                        {
                            str.AppendLine("<td " + style + ">" + horderinfo[cti.TableField.ToUpper()].ToString() + "</td>");
                        }
                        catch (Exception ex)
                        {
                            str.AppendLine("<td " + style + "></td>");
                        }
                    }
                    else
                    {
                        str.AppendLine("<td " + style + "></td>");
                    }
                    i++;
                    k++;
                    if (i % 4 == 0)
                    {
                        str.AppendLine("</tr>");
                        str.AppendLine("<tr>");
                        i = 0;
                        style = "";
                        k = 1;
                        j++;
                    }
                }

                if (c == count - 1)
                {
                    str.AppendLine("</tr>");
                    str.AppendLine("</table>");
                    str.AppendLine("</div></div></div>");
                    str.AppendLine("<div class='col-lg-6'><div class='card'><div class='card-body'>");
                    str.AppendLine("<table  width='100%' height='90%' class='table table-bordered table-hover' ");
                    str.AppendLine("<tr>");
                }
            }

            str.AppendLine("</tr>");

            str.AppendLine("</table>");
            str.AppendLine("</div></div></div></div>");

            if (odi.ModuleId.Contains("-"))
            {
                ModuleWorkFlow.BLL.Projectpic pp = new ModuleWorkFlow.BLL.Projectpic();
                IList attachemnts = pp.GetProjectPicByProjectId(odi.ProjectId);


                i = 0;
                str.AppendLine("<div class='row'><div class='col-lg-12'><div class='card'><div class='card-body'>");

                str.AppendLine(Translate.translateString("參考文件"));
                str.AppendLine("<table  width='100%' height='90%' class='table table-bordered table-hover' ");
                str.AppendLine("<tr><td>" + Translate.translateString("圖片") + "</td><td>" + Translate.translateString("文件") + "</td></tr>");
                str.AppendLine("<tr>");
                IList imgattachemnts = new ArrayList();
                IList excelattachemnts = new ArrayList();

                if (attachemnts.Count > 0)
                {
                    foreach (ProjectpicInfo ppi in attachemnts)
                    {
                        if (ppi.PICTUREPATH != null && !ppi.PICTUREPATH.Trim().Equals("") && !ppi.PICTUREPATH.Trim().Equals("&nbsp;"))
                        {
                            imgattachemnts.Add(ppi);
                        }
                        if (ppi.ExcelPdfUrl != null && !ppi.ExcelPdfUrl.Trim().Equals("") && !ppi.ExcelPdfUrl.Trim().Equals("&nbsp;"))
                        {
                            excelattachemnts.Add(ppi);
                        }
                    }
                    int a = 1;

                    if (imgattachemnts.Count > 0 || excelattachemnts.Count > 0)
                    {
                        if (imgattachemnts.Count > excelattachemnts.Count)
                        {
                            a = imgattachemnts.Count;
                        }
                        else
                        {
                            a = excelattachemnts.Count;
                        }

                        for (int b = 0; b < a; b++)
                        {
                            if (imgattachemnts.Count > b)
                            {
                                str.AppendLine("<td>");
                                str.AppendLine("<img  class=\"imgip\" onclick=\"myFunction()\" align=\"middle\" src=\"" + (imgattachemnts[b] as ProjectpicInfo).PICTUREPATH + "\" width=\"40px\"> ");
                                str.AppendLine("</td>");
                            }
                            else
                            {
                                str.AppendLine("<td></td>");
                            }
                            if (excelattachemnts.Count > b)
                            {
                                str.AppendLine("<td>");
                                str.AppendLine("<a href=\"uploadfiles/" + (excelattachemnts[b] as ProjectpicInfo).ExcelPdfUrl + "\"><span class=\"glyphicon glyphicon-file\"></span></a>");
                                str.AppendLine("</td>");
                            }
                            else
                            {
                                str.AppendLine("<td></td>");
                            }
                            str.AppendLine("</tr><tr>");
                        }
                    }
                }
                str.AppendLine("<div style=\"display:none;\" id=\"divid\" ><img onclick=\"myFunc()\" src=\"\" id=\"imgid\" /></div>");
                str.AppendLine("</table>");
                IList ipsi = new Projectsub().GetProjectSubByProjectId(odi.ProjectId);
                str.AppendLine(Translate.translateString("問題點及處理對策"));
                str.AppendLine("<table  width='100%' height='90%' class='table table-bordered table-hover' ");
                str.AppendLine("<tr>");
                str.AppendLine("<td>" + Translate.translateString("第幾次發生") + "</td>");
                str.AppendLine("<td>" + Translate.translateString("問題點說明") + "</td>");
                str.AppendLine("<td>" + Translate.translateString("原因分析") + "</td>");
                str.AppendLine("<td>" + Translate.translateString("改善對策") + "</td>");
                str.AppendLine("</tr>");
                if (ipsi.Count > 0)
                {
                    foreach (ProjectsubInfo psi in ipsi)
                    {
                        str.AppendLine("<tr>");
                        str.AppendLine("<td>" + psi.TIMES + "</td>");
                        str.AppendLine("<td>" + psi.QUESTION + "</td>");
                        str.AppendLine("<td>" + psi.REASON + "</td>");
                        str.AppendLine("<td>" + psi.RESOLVE + "</td>");
                        str.AppendLine("</tr>");
                    }
                    str.AppendLine("</table>");

                }
            }

            retstr.AppendLine(str.ToString());
            retstr.AppendLine("</div></div></div></div>");
            return retstr.ToString();
        }
        #endregion

        #region 零件總數彈窗
        [WebMethod]
        public static string getBomPartDetailByBT(string moduleId)
        {
            IList source = new ArrayList();
            source = new PartScheduleAlert().getPartStatus(moduleId);
            string ModalPrint = "fa fa-print fa-2x ModuleScheduleLightALT.aspx/printPartDetail 'moduleid':'" + moduleId + "' lab_modalmsg";
            return "{\"list\":" + Newtonsoft.Json.JsonConvert.SerializeObject(source) + ",\"BTModalTitle\":[{\"BTModalTitle\":\" " + Translate.translateString("Bom明細") + "  ：" + moduleId + "\"}] ,\"ModalPrint\":[{\"ModalPrint\":\"" + ModalPrint + "\"}]}";
        }
        #endregion

        #region 加工件彈窗
        [WebMethod]
        public static string getPartDetailByBT(string moduleId)
        {
            BLL.Status status = new BLL.Status();
            Hashtable hstatus = status.getKeyStatusInfo();
            Hashtable hjt = new Hashtable();
            Hashtable currentCounts = new Hashtable();
            List<PartPartProcessInfo> parts = new ModuleWorkFlow.BLL.PartPartProcess().getPartProcessViewAll(moduleId, "", true, new OutSourceDetail(), menuid, currentCounts);
            Hashtable progressPercents = new Hashtable();

            foreach (IGrouping<string, PartPartProcessInfo> group in parts.GroupBy(m => m.PartNo_Id))
            {
                double totalProcessneed = Math.Round(group.Sum(item => Convert.ToDouble(item.ProcessNeedMinutes)));
                double finishedProcessneed = Math.Round(group.Where(m => m.FactEndDate.Ticks > 0 && m.FactOutTime.Ticks > 0)
                    .Sum(item => Convert.ToDouble(item.ProcessNeedMinutes)));
                string percent = "0%";

                if (finishedProcessneed > 0 && totalProcessneed > 0)
                {
                    double pecent = Math.Round(finishedProcessneed / totalProcessneed, 3) * 100;
                    percent = Convert.ToString(Math.Round(pecent, 1)) + "%";
                }

                progressPercents[group.Key] = percent;
            }

            foreach (PartPartProcessInfo ppi in parts)
            {
                ppi.PerCent = Convert.ToString(progressPercents[ppi.PartNo_Id]);
                ppi.CReturn = ppi.CReturn.Replace("<td> </td>", "");

                if (hstatus.ContainsKey(ppi.PartStatusId))
                {
                    ppi.PartStatusId = ((StatusInfo)hstatus[ppi.PartStatusId]).StatusDesc;
                }
            

                if (!hjt.ContainsKey(ppi.PartNo))
                {
                    Utility.FileOperate file = new Utility.FileOperate();
                    hjt.Add(ppi.PartNo, file.getJT(ppi.ModuleId, ppi.PartNo_Id));
                }
                string link = hjt[ppi.PartNo] as string;
                if (link.IndexOf(">") > 0)
                {
                    ppi.PartNo_Id = link.Substring(0, link.IndexOf(">") + 1) + ppi.PartNo_Id + link.Substring(link.LastIndexOf("<"));
                }

            }
            var partDetailList = parts.Select(ppi => new
            {
                ppi.PartNo,
                ppi.PartName,
                ppi.EachBatchCount,
                CurrentCount = currentCounts.ContainsKey(ppi.PartNo_Id) ? currentCounts[ppi.PartNo_Id] : 0,
                ppi.PartCount,
                ppi.PerCent,
                ppi.PartStatusId,
                ppi.PartNo_Id,
                ppi.CReturn
            });
            var result = new
            {
                list = partDetailList,
                labcolor = new[]
                     {
                        new { labcolor = bindColor() }
                    },
                                BTModalTitle = new[]
                     {
                        new { BTModalTitle = $"{Translate.translateString("加工進度 廠編")}:{moduleId}" }
                    }
            };

            // 先序列化为JSON字符串
            string json = JsonConvert.SerializeObject(result);

            // 返回匿名对象包装的字符串，避免二次序列化
            HttpContext.Current.Response.ContentType = "application/json";
            return json;

        }
        private static string bindColor()
        {
            string labcolor = "";
            string statusId = "";
            ModuleWorkFlow.BLL.Status status = new ModuleWorkFlow.BLL.Status();
            IList sources = status.getStatusInfoByMenuid(menuid);
            ColorConverter cc = new ColorConverter();

            bool bcolor = true;

            foreach (ModuleWorkFlow.Model.StatusInfo si in sources)
            {
                if (si.StatusId.Contains(menuid))
                {
                    statusId = si.StatusId.Split('|')[0];
                    bcolor = false;
                }
                else
                {
                    statusId = si.StatusId;
                }

                if (statusId.Equals("Implementation") || statusId.Equals("JIEDAN") || statusId.Equals("Working") || statusId.Equals("Ready") || statusId.Equals("XIAODAN") || statusId.Equals("Pending"))
                {
                    labcolor = labcolor + "<td bgcolor='#" + si.StatusColor.Substring(2).Trim() + "' width='100px' height='25'><font color='000000'>" + si.StatusDesc + "</font></td>";
                }

                if (statusId.Equals("Holdon"))
                {
                    labcolor = labcolor + "<td bgcolor='#" + si.StatusColor.Substring(2).Trim() + "' width='100px' height='25'><font color='ffffff'>" + si.StatusDesc + "</font></td>";
                }

                //si.StatusDesc = "<font color = '#" + si.StatusColor.Substring(2).Trim() + "'>" + si.StatusDesc + "</font>";
                //if (si.StatusId.Equals("Holdon") || si.StatusId.Equals("Implementation") || si.StatusId.Equals("JIEDAN") || si.StatusId.Equals("Working") || si.StatusId.Equals("Ready") || si.StatusId.Equals("XIAODAN") || si.StatusId.Equals("Pending"))
                //{
                //    lab_color.Text = lab_color.Text + si.StatusDesc + "--";
                //}
            }

            if (bcolor == false)
            {
                labcolor = labcolor + "<td bgcolor='#" + "FFFFFF" + "' width='100px' height='25'>" + Translate.translateString("延誤帶紅色") + "<font color='FF0000'>*</font></td>";
            }


            return labcolor;
        }
        #endregion

        #region 零件總數打印
        [WebMethod]
        public static string printPartDetail(string moduleid)
        {
            IList source = new ArrayList();
            source = new PartScheduleAlert().getTJBPartStatus(moduleid);
            string msg = "";

            if (source.Count > 0)
            {
                ReporttemplateInfo rti = new Reporttemplate().GetReporttemplateByNo("BomPartCount.xls");
                if (rti != null)
                {
                    ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport report = new ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport();
                    string str = report.CreateReport("BomPartCount.xls", source);
                    msg = "<a href='" + str.Replace("//", "/") + "'>" + Translate.translateString("打開報表") + "</a>";
                }
            }

            return msg;
        }

        #endregion

        /// <summary>
        /// 全委外彈窗
        /// </summary>
        /// <param name="moduleId"></param>
        /// <returns></returns>
        [WebMethod]
        public static string getOutSourceDetailByBT(string moduleId)
        {
            IList source = new ArrayList();
            ModuleWorkFlow.BLL.Outsource.OutSourceDetail outSourceDetail = new OutSourceDetail();
            source = outSourceDetail.GetOutSourceDetailInfosByModuleid(moduleId, null, null, "", new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), "", 1);
            string ModalPrint = "fa fa-print fa-2x ModuleScheduleLightALT.aspx/pirntOutSource 'moduleid':'" + moduleId + "' lab_modalmsg";

            return "{\"list\":" + Newtonsoft.Json.JsonConvert.SerializeObject(source) + ",\"ModalPrint\":[{\"ModalPrint\":\"" + ModalPrint + "\"}] ,\"BTModalTitle\":[{\"BTModalTitle\":\" " + Translate.translateString("委外加工進度") + "：" + moduleId + "\"}]}";
        }

        /// <summary>
        /// 單委外彈窗
        /// </summary>
        /// <param name="moduleId"></param>
        /// <returns></returns>
        [WebMethod]
        public static string getProcessOutSourceDetailByBT(string moduleId)
        {
            IList source = new ArrayList();
            ModuleWorkFlow.BLL.Outsource.OutSourceDetail outSourceDetail = new OutSourceDetail();
            source = outSourceDetail.GetOutSourceDetailInfosByModuleid(moduleId, null, null, "", new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), "", 0);
            string ModalPrint = "fa fa-print fa-2x ModuleScheduleLightALT.aspx/pirntPartOutSource 'moduleid':'" + moduleId + "' lab_modalmsg";
            return "{\"list\":" + Newtonsoft.Json.JsonConvert.SerializeObject(source) + ",\"ModalPrint\":[{\"ModalPrint\":\"" + ModalPrint + "\"}],\"BTModalTitle\":[{\"BTModalTitle\":\" " + Translate.translateString("委外加工進度") + "：" + moduleId + "\"}]}";
        }


        [WebMethod]
        public static string pirntOutSource(string moduleid)
        {
            string msg = "";
            ModuleWorkFlow.BLL.Outsource.OutSourceDetail outSourceDetail = new OutSourceDetail();
            IList source = outSourceDetail.GetOutSourceDetailInfosByModuleid(moduleid, null, null, "", new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), "", 1);

            msg = new ControlTable().getTJBScheduleSubTable(source, menuid + "OutSource");
            if (source.Count > 0)
            {
                ReporttemplateInfo rti = new Reporttemplate().GetReporttemplateByNo("OutSource.xls");
                if (rti != null)
                {
                    ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport report = new ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport();
                    string str = report.CreateReport("OutSource.xls", source);
                    msg = "<a href='" + str.Replace("//", "/") + "'>" + Translate.translateString("打開報表") + "</a>";
                }
                else
                {
                    msg = Translate.translateString("打印配置不正確" + ",");
                }

            }
            return msg;
        }

        [WebMethod]
        public static string pirntPartOutSource(string moduleid)
        {
            string msg = "";
            ModuleWorkFlow.BLL.Outsource.OutSourceDetail outSourceDetail = new OutSourceDetail();
            IList source = outSourceDetail.GetOutSourceDetailInfosByModuleid(moduleid, null, null, "", new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), new DateTime(), "", 0);

            msg = new ControlTable().getTJBScheduleSubTable(source, menuid + "OutSource");
            if (source.Count > 0)
            {
                ReporttemplateInfo rti = new Reporttemplate().GetReporttemplateByNo("OutSource.xls");
                if (rti != null)
                {
                    ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport report = new ModuleWorkFlow.BLL.StupidReport.NOPIStuipReport();
                    try
                    {
                        string str = report.CreateReport("OutSource.xls", source);
                        msg = "<a href='" + str.Replace("//", "/") + "'>" + Translate.translateString("打開報表") + "</a>";
                    }
                    catch (Exception ex)
                    {
                        msg = Translate.translateString("打印錯誤") + ",";
                    }
                }
                else
                {
                    msg = Translate.translateString("打印配置不正確" + ",");
                }

            }
            return msg;
        }


        [WebMethod]
        public static string getModifyModuleid(string newModuleId)
        {
            IList source = new ArrayList();
            source = new ModuleScheduleAlert().getModifySchedule(newModuleId);
            string innerhtml = new ControlTable().getSubTableWithBT(source, menuid);
            return innerhtml;
        }


        [WebMethod]

        public static string getTranslateInfo(string msg)
        {
            return Translate.translateString(msg);
        }

        protected void dpl_isDelay_SelectedIndexChanged(object sender, EventArgs e)
        {
            dpl_overStatus.SelectedValue = "2";
        }
    }
}
