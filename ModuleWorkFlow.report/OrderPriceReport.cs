using System;
using System.Web;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Excel;
using Microsoft.Office.Core;
using System.Reflection;
using System.IO;
using System.Web.UI.HtmlControls;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL;
using System.Drawing;
using Utility;

namespace ModuleWorkFlow.report
{
    public class OrderPriceReport
    {
        Hashtable ht = new Hashtable();
		Hashtable htt = new Hashtable();
		IList process = new ArrayList();
		string filePath = "";
		string rootPath = "";
		object oMissing=System.Reflection.Missing.Value;
		string[] alpha = null;
		int[] color = null;

        public OrderPriceReport()
		{
			string header = "file:///";
			string footer = "bin";
			string RootPath = System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase; 
			RootPath = RootPath.Substring(0, RootPath.LastIndexOf(@"/"));
			RootPath = RootPath.Substring(header.Length, RootPath.Length - header.Length);
			RootPath = RootPath.Substring(0, RootPath.Length - footer.Length);

			rootPath = RootPath;
			filePath = rootPath + "excel/project/";
		}

		private void initVars()
		{
			alpha = new string[26] {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
			color = new int[2] {6,39};
		}

		private string transRowsNum(int row)
		{
			string str = "";
			int mutiple = row / 26;
			if (row % 26 == 0) mutiple --;			
			if (mutiple > 0)
			{
				str = alpha[mutiple];
			}
			str = str + alpha[row % 26];
			return str;
		}

		public string CreatepartReport(System.Data.DataSet source,int customerId)
		{
			HttpContext context = HttpContext.Current;
			string applicationpath=context.Request.ApplicationPath+"/excel/project/";
			string path = System.Web.HttpContext.Current.Request.MapPath("excel/project/");
			initVars();
			string outFileName = null;
			ApplicationClass myApp=null;
			Workbook myBook=null;
			Worksheet mySheet=null;
            outFileName = "OrderPrice" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";
			try
			{
				if(!File.Exists(filePath+outFileName))
				{

                    File.Copy(filePath + "OrderPrice.xls", filePath + outFileName, true);
				}
				
				myApp= new ApplicationClass();

                myApp.Caption = "每月生產成本表";

				myApp.Visible=false;
                myApp.Workbooks._Open(filePath + outFileName, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing);
				
				myBook=myApp.Workbooks[1];
				mySheet=(Worksheet)myBook.ActiveSheet;
				myApp.CutCopyMode = Excel.XlCutCopyMode.xlCopy;

                OrderPriceInfo(source,customerId, mySheet, myApp);
			
				myBook.Save();
				myBook.Close( true,outFileName,true);
				System.Runtime.InteropServices.Marshal.ReleaseComObject(mySheet);
				System.Runtime.InteropServices.Marshal.ReleaseComObject(myBook);
				System.Runtime.InteropServices.Marshal.ReleaseComObject(myApp);
				GC.Collect();
            }
            catch (Exception e)
            {
                myBook.Close(true, outFileName, true);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(mySheet);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(myBook);
                System.Runtime.InteropServices.Marshal.ReleaseComObject(myApp);
                GC.Collect();
            }

			return applicationpath+outFileName;
		}



        private void OrderPriceInfo(System.Data.DataSet source, int customerId, Worksheet mySheet, ApplicationClass myApp)
		{
			Range rg;
            System.Data.DataTable data = source.Tables[0];
			int i=6;

            IList list = new ArrayList();
            list = getIList(source);
            if (list.Count > 0)
            {
                Hashtable processname = new Hashtable();
                Hashtable hcustomer = new Hashtable();
                ModuleWorkFlow.BLL.Process ps = new Process();
                ModuleWorkFlow.BLL.Customer customer = new Customer();
                processname = ps.GetProcessIdProcess();
                hcustomer = customer.getCustomerByIDandall();
                rg = mySheet.get_Range(OrderPriceReportStyle.FCOLreportYearMonth[0] + 3, OrderPriceReportStyle.FCOLreportYearMonth[1] + 3);
                rg.Value2 = "月份: " + DateTime.Now.Year + "年" + DateTime.Now.Month + "月";
                rg = mySheet.get_Range(OrderPriceReportStyle.FCOLcustomerName[0] + 4, OrderPriceReportStyle.FCOLcustomerName[1] + 4);
                if (customerId == 0)
                {
                    rg.Value2 = "";
                }
                else
                {
                    rg.Value2 = "客戶： " + hcustomer[customerId.ToString()].ToString();
                }
                rg = mySheet.get_Range(OrderPriceReportStyle.FCOLreportDate[0] + 4, OrderPriceReportStyle.FCOLreportDate[1] + 4);
                rg.Value2 = DateTime.Now.ToShortDateString();
                foreach (ModuleWorkFlow.Model.PartProcessInfo ppi in list)
                {
                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLreportReferencePictureDate[0] + i, OrderPriceReportStyle.FCOLreportReferencePictureDate[1] + i);
                    if (ppi.ReferencePictureDate.Ticks > 0)
                    {
                        rg.Value2 = "'" + ppi.ReferencePictureDate;
                    }
                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLmoduleId[0] + i, OrderPriceReportStyle.FCOLmoduleId[1] + i);
                    rg.Value2 = ppi.ModuleId;

                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLcompletion[0] + i, OrderPriceReportStyle.FCOLcompletion[1] + i);
                    rg.Value2 = ppi.Completion;
                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLreportTryDate3[0] + i, OrderPriceReportStyle.FCOLreportTryDate3[1] + i);
                    if (ppi.TryDate3.Ticks > 0)
                    {
                        rg.Value2 = "'" + ppi.TryDate3;
                    }
                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLprocessNeedMinutes[0] + i, OrderPriceReportStyle.FCOLprocessNeedMinutes[1] + i);
                    rg.Value2 = Math.Round(ppi.ProcessNeedMinutes * 1.0 / 60, 2);
                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLfactProcessNeedMinutes[0] + i, OrderPriceReportStyle.FCOLfactProcessNeedMinutes[1] + i);
                    rg.Value2 = Math.Round(ppi.FactProcessNeedMinutes * 1.0 / 60, 2);
                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLprocessNeedMinutesPrice[0] + i, OrderPriceReportStyle.FCOLprocessNeedMinutesPrice[1] + i);
                    rg.Value2 = Math.Round(ppi.ProcessNeedMinutesPrice, 2);
                    rg = mySheet.get_Range(OrderPriceReportStyle.FCOLfactProcessNeedMinutesPrice[0] + i, OrderPriceReportStyle.FCOLfactProcessNeedMinutesPrice[1] + i);
                    rg.Value2 = Math.Round(ppi.FactProcessNeedMinutesPrice, 2);

                    i++;
                }
                rg = mySheet.get_Range(alpha[0] + (i), alpha[(0)] + (i));
                rg.Value2 = "";
                rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 

                rg = mySheet.get_Range(alpha[1] + (i), alpha[(1)] + (i));
                rg.Value2 = "";
                rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 

                rg = mySheet.get_Range(alpha[2] + (i), alpha[(2)] + (i));
                rg.Value2 = "";
                rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 

                rg = mySheet.get_Range(alpha[3] + (i), alpha[(3)] + (i));
                rg.Value2 = "";
                rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 

                rg = mySheet.get_Range(alpha[4] + (i), alpha[(4)] + (i));
                rg.Value2 = "";
                rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 
               
                rg = mySheet.get_Range(alpha[5] + (i), alpha[(5)] + (i));
                rg.Value2 = "合計(H)";
                rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 



                string searchtwo = " ProcessNeedMinutesPrice is not null ";
                if (data.Select(searchtwo).Length > 0)
                {
                    rg = mySheet.get_Range(alpha[(6)] + (i), alpha[(6)] + (i));
                    rg.Value2 = Math.Round(Convert.ToDouble(data.Compute("SUM(ProcessNeedMinutesPrice)", searchtwo)), 2);
                    rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 
                }

                searchtwo = " FactProcessNeedMinutesPrice is not null ";
                if (data.Select(searchtwo).Length > 0)
                {
                    rg = mySheet.get_Range(alpha[(7)] + (i), alpha[(7)] + (i));
                    rg.Value2 = Math.Round(Convert.ToDouble(data.Compute("SUM(FactProcessNeedMinutesPrice)", searchtwo)), 2);
                    rg.Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous; 
                }
            }
		}

        private IList getIList(System.Data.DataSet source)
        {
            IList list = new ArrayList();
            System.Data.DataTable dt = source.Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    PartProcessInfo ppi = new PartProcessInfo();
                    if (!Convert.IsDBNull(dr["referencePictureDate"])) ppi.ReferencePictureDate = Convert.ToDateTime(dr["referencePictureDate"]);
                    ppi.ModuleId = dr["moduleid"].ToString();
                    ppi.CustomerId = Convert.ToInt32(dr["customerId"]);
                    ppi.CustomerName = dr["CustomerName"].ToString();
                    ppi.Completion = dr["Completion"].ToString();
                    if (!Convert.IsDBNull(dr["tryDate0"])) ppi.TryDate0 = Convert.ToDateTime(dr["tryDate0"]);
                    if (!Convert.IsDBNull(dr["tryDate3"])) ppi.TryDate3 = Convert.ToDateTime(dr["tryDate3"]);
                    ppi.ProcessNeedMinutes = Convert.ToInt32(dr["ProcessNeedMinutes"]);
                    ppi.FactProcessNeedMinutes = Convert.ToInt32(dr["FactProcessNeedMinutes"]);
                    ppi.ProcessNeedMinutesPrice = Convert.ToDouble(dr["ProcessNeedMinutesPrice"]);
                    ppi.FactProcessNeedMinutesPrice = Convert.ToDouble(dr["FactProcessNeedMinutesPrice"]);
                    list.Add(ppi);
                }
            }
            return list;         
        }
    }
}