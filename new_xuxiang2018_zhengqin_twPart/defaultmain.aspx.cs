using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Services;
using RedisUtilty;

using ModuleWorkFlow.Model;
using ModuleWorkFlow.Model.NewOrder;
using ModuleWorkFlow.BLL.NewOrder;
using ModuleWorkFlow.BLL.System;
using System.Web.UI.WebControls;
using Itenso.TimePeriod;
using ModuleWorkFlow.Model.System;
using ModuleWorkFlow.BLL.Alert;
using ModuleWorkFlow.Model.Alert;
using ModuleWorkFlow.BLL;
using ModuleWorkFlow.BLL.StupidReport;
using System.Web;
using System.Web.UI;

namespace ModuleWorkFlow
{
    public partial class defaultmain : System.Web.UI.Page
    {
        private System.Threading.Thread tr;
        private Hashtable hh;
        private ModuleWorkFlow.BLL.Process ps;
        protected string newOrderfaarrow;
        protected string newOrdertextsuccess;
        protected string overOrderfaarrow;
        protected string overOrdertextsuccess;
        protected string doingOrdertextsuccess;
        protected string doingOrderfaarrow;
        protected string modifytextsuccess;
        protected string modifyfaarrow;
        protected defaultMainConALT summaryChart;
        protected string textDangerSuccess;
        protected string arrow;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                bindProgress();
                bindProcessChar();
                bindProcessBar();
                bindCostPie();
            }

        }

        private void bindCostPie()
        {
            DateTime startdate = DateTime.Now.AddDays(-7);
            DateTime enddate = DateTime.Now.AddDays(-1);
            Utlity utlity = new Utlity();
            ITimePeriodCollection subtractedPeriods = utlity.updateUtility(startdate, enddate);
            utlity.updateUtlity(subtractedPeriods, startdate, enddate);
            List<UtlityInfo> customerCosts = utlity.getCostCauclateByCustomer(startdate, enddate);
            List<UtlityInfo> resultCosts = new List<UtlityInfo>();
            foreach (UtlityInfo ui in customerCosts)
            {
                List<UtlityInfo> subCosts = resultCosts.FindAll(m => m.CustomerName.Equals(ui.CustomerName));
                if (subCosts.Count > 0)
                {
                    subCosts[0].PartProcessMinutes += ui.PartProcessMinutes;
                }
                else
                {
                    resultCosts.Add(ui);
                }
            }
            string xvalues = "CustomerName";
            string[] yvalues = new string[1];
            yvalues[0] = "PartProcessHours";
            string echart = new StuipChart().creatCharts(resultCosts, xvalues, yvalues);
            HttpContext.Current.Session["costPie"] = echart;

        }

        private void bindProcessChar()
        {
            Shift shift = new Shift();
            IList shifts = shift.GetShiftInfosByMenuid("F49");

            DateTime jobTime = DateTime.Now;
            ShiftInfo si = shift.getShiftInfo(shifts, jobTime);

            DateTime jobStartTime = Convert.ToDateTime(jobTime.ToShortDateString()).AddHours(si.StartTime.Hour).AddMinutes(si.StartTime.Minute);

            Hashtable hCapacity = new Machine().GetTotalMachineWorkMinutes(si, DateTime.Now);

            Schedule schedule = new Schedule();
            Hashtable hProcessUtlity = new Hashtable();

            double totalUtlity = 0;
            IList processes = new ModuleWorkFlow.BLL.Process().getProcessInfoNeedSchedule(1);
            foreach (ModuleWorkFlow.Model.ProcessInfo pi in processes)
            {
                summaryChart = (defaultMainConALT)Page.LoadControl("defaultMainConALT.ascx");
                summaryChart.processId = pi.ProcessId;
                summaryChart.processName = pi.ProcessName;
                pal_summary.Controls.Add(summaryChart);
                double workHours = schedule.GetTotalProcessHours(pi.ProcessId, jobStartTime, jobTime, null);
                if (hCapacity.ContainsKey(pi.ProcessId))
                {
                    double capacityHours = Convert.ToDouble(hCapacity[pi.ProcessId]);
                    double utlity = Math.Round(workHours / capacityHours, 2) * 100;
                    totalUtlity += utlity;
                    hProcessUtlity.Add(pi.ProcessId, utlity);
                }
                else
                {
                    hProcessUtlity.Add(pi.ProcessId, 100);
                    totalUtlity += 100;
                }
            }
            lab_compare.Text = Math.Round((totalUtlity / hProcessUtlity.Count), 2).ToString();
            HttpContext.Current.Session["hProcessUtlity"] = hProcessUtlity;



        }

        private void bindProcessBar()
        {
            Shift shift = new Shift();
            IList shifts = shift.GetShiftInfosByMenuid("F49");

            DateTime jobTime = DateTime.Now;
            ShiftInfo si = shift.getPreviousShiftInfo(shifts, jobTime);
            DateTime jobEndTime = Convert.ToDateTime(jobTime.ToShortDateString()).AddHours(si.EndTime.Hour).AddMinutes(si.EndTime.Minute).AddMinutes(-10);
            ShiftInfo nextsi = shift.getNextShiftInfo(shifts, jobTime);

            DateTime burdenStart = Convert.ToDateTime(jobTime.ToShortDateString()).AddHours(nextsi.StartTime.Hour).AddMinutes(nextsi.StartTime.Minute);
            if (burdenStart.Ticks < jobTime.Ticks)
            {
                burdenStart = burdenStart.AddDays(1);
            }

            DateTime burdenEnd = burdenStart.AddMinutes(si.WorkMinutes);

            DateTime burdenEndTime = Convert.ToDateTime(jobTime.ToShortDateString()).AddHours(si.EndTime.Hour).AddMinutes(si.EndTime.Minute).AddMinutes(-10);
            IList processes = new ModuleWorkFlow.BLL.Process().getProcessInfoNeedSchedule(1);
            Hashtable hCapacity = new Machine().GetTotalMachineWorkMinutes(si, jobEndTime);
            TimePeriodCollection timePeriods = new TimePeriodCollection();
            timePeriods.Add(new TimeRange(burdenStart, burdenEnd));
            List<ScheduleInfo> burdens = new MachineSchedule().GetScheduleBurden(burdenStart, burdenEnd, processes, new Hashtable(), timePeriods, false);
            foreach (string key in hCapacity.Keys)
            {
                double capacityHours = Convert.ToDouble(hCapacity[key]);
                if (capacityHours == 0)
                {
                    continue;
                }
                List<ScheduleInfo> subBurdens = burdens.FindAll(m => m.ProcessId.Equals(key));
                if (subBurdens.Count > 0)
                {
                    subBurdens[0].UtilizationPercent = Convert.ToInt32(Math.Round(subBurdens[0].ProcessHours + subBurdens[0].ProcessHours / capacityHours * 100, 2));
                }
                else
                {
                    ScheduleInfo scheduleInfo = new ScheduleInfo();
                    scheduleInfo.ProcessId = key;
                    scheduleInfo.UtilizationPercent = 1;
                    burdens.Add(scheduleInfo);
                }


            }




            Schedule schedule = new Schedule();
            Hashtable hProcessUtlity = new Hashtable();


            List<ScheduleInfo> ilist = new List<ScheduleInfo>();
            string xvalues = "ProcessName";
            string[] yvalues = new string[1];
            yvalues[0] = "UtilizationPercent";
            Double totaCapacity = 0;
            double totalUtlity = 0;
            foreach (ModuleWorkFlow.Model.ProcessInfo pi in processes)
            {
                ScheduleInfo scheduleInfo = new ScheduleInfo();
                scheduleInfo.ProcessName = pi.ProcessId;
                double workHours = schedule.GetTotalProcessHours(pi.ProcessId, jobEndTime.AddMinutes(-si.WorkMinutes), jobEndTime, null);
                totaCapacity += workHours;
                if (hCapacity.ContainsKey(pi.ProcessId))
                {
                    double capacityHours = Convert.ToDouble(hCapacity[pi.ProcessId]);
                    if (capacityHours == 0)
                    {
                        continue;
                    }
                    double utlity = Math.Round(workHours / capacityHours, 2) * 100;
                    scheduleInfo.UtilizationPercent = Convert.ToInt32(utlity);
                    if (scheduleInfo.UtilizationPercent == 0)
                        scheduleInfo.UtilizationPercent = 1;

                    totalUtlity += scheduleInfo.UtilizationPercent;


                }
                else
                {

                    scheduleInfo.UtilizationPercent = 100;
                    totalUtlity += 100;
                }

                ilist.Add(scheduleInfo);
            }
            string echart = new StuipChart().creatCharts(ilist, xvalues, yvalues);
            HttpContext.Current.Session["processUtlityBar"] = echart;

            string burdencharts = new StuipChart().creatCharts(burdens, xvalues, yvalues);
            HttpContext.Current.Session["burdencharts"] = burdencharts;


            total_capacity.Text = totaCapacity.ToString();
            totalUtlity = Math.Round(totalUtlity / ilist.Count, 2);

            if (Convert.ToDouble(lab_compare.Text) - totalUtlity < 0)
            {
                textDangerSuccess = "text-danger";
                arrow = "fa-arrow-down";
            }
            else
            {
                textDangerSuccess = "text-success";
                arrow = "fa-arrow-up";
            }
            lab_compare.Text = Math.Abs(Math.Round((Convert.ToDouble(lab_compare.Text) - totalUtlity), 2)).ToString() + "%";



        }

        private void bindProgress()
        {
            List<ModuleScheduleInfo> source = new ModuleScheduleAlert().getCustomerProgress();


            MainDataGrid.DataSource = source;
            MainDataGrid.DataBind();

        }

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {

            bindProcessChar();

            // 注册启动脚本来调用 createChar
            IList processes = new ModuleWorkFlow.BLL.Process().getProcessInfoNeedSchedule(1);
            foreach (ModuleWorkFlow.Model.ProcessInfo pi in processes)
            {
                string script = string.Format("createChar('{0}', '{1}');", pi.ProcessId, pi.ProcessName);
                ScriptManager.RegisterStartupScript(this, GetType(), "CreateCharScript_" + pi.ProcessId, script, true);
            }
        }

        protected void MainDataGrid_PreRender(object sender, EventArgs e)
        {
            if (MainDataGrid.Rows.Count > 0)
            {
                MainDataGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }


        [WebMethod]
        public static string getPieChartsByProcess(string processId)
        {
            Hashtable hProcessUtlity = HttpContext.Current.Session["hProcessUtlity"] as Hashtable;
            if (hProcessUtlity != null)
            {
                return hProcessUtlity[processId].ToString();
            }
            else
            {
                return "1";
            }


        }

        [WebMethod]
        public static string getBarChartsByProcess()
        {
            string echart = "";
            if (HttpContext.Current.Session["processUtlityBar"] != null)
                echart = HttpContext.Current.Session["processUtlityBar"].ToString();

            return echart;

        }

        [WebMethod]
        public static string getBurdenBarChartsByProcess()
        {
            string echart = "";
            if (HttpContext.Current.Session["burdencharts"] != null)
                echart = HttpContext.Current.Session["burdencharts"].ToString();

            return echart;
        }





        [WebMethod]
        public static string getPieCostChartsBy()
        {
            if (HttpContext.Current.Session["costPie"] != null)
            {
                return HttpContext.Current.Session["costPie"].ToString();
            }
            else
            {
                return "";
            }

        }


    }
}

