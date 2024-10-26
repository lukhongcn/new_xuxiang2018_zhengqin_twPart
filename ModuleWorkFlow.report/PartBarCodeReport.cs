using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using Excel;
using Microsoft.Office.Core;
using System.Reflection;
using System.IO;

using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL;

namespace ModuleWorkFlow.report
{
	/// <summary>
	/// Summary description for PartBarCodeReport.
	/// </summary>
	public class PartBarCodeReport
	{
		string filePath = "";
		string rootPath = "";

		object oMissing=System.Reflection.Missing.Value;
		string[] alpha = null;
		int[] color = null;

		public PartBarCodeReport()
		{
			string header = "file:///";
			string footer = "bin";
			string RootPath = System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase; 
			RootPath = RootPath.Substring(0, RootPath.LastIndexOf(@"/"));
			RootPath = RootPath.Substring(header.Length, RootPath.Length - header.Length);
			RootPath = RootPath.Substring(0, RootPath.Length - footer.Length);

			rootPath = RootPath;
			filePath = rootPath + "excel/";
		}

		private void initVars()
		{
			alpha = new string[14] {"Z","A","B","C","D","E","F","G","H","I","J","K","L","M"};
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

		public string CreatePartBorReport(IList parts,string moduleid)
		{
			string path = System.Web.HttpContext.Current.Request.MapPath("excel/");
			initVars();
			string outFileName = null;
			ApplicationClass myApp=null;
			Workbook myBook=null;
			Worksheet mySheet=null;
			outFileName = "PartBarCode_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + moduleid + ".xls";
			try
			{
				if(parts.Count > 0)
				{

					if(!File.Exists(filePath+outFileName))
					{
						File.Copy(path+"barcode.xls",path+outFileName,true);
					}
				
					myApp= new ApplicationClass();
					myApp.Caption = "零件BarCode";

					myApp.Visible=false;				
					myApp.Workbooks._Open(path+outFileName,oMissing,oMissing,oMissing,oMissing,oMissing,oMissing,oMissing,oMissing,oMissing,oMissing,oMissing,oMissing);
				
					myBook=myApp.Workbooks[1];
					mySheet=(Worksheet)myBook.ActiveSheet;
					myApp.CutCopyMode = Excel.XlCutCopyMode.xlCopy;
					
					//					FillProjectInfo(projectid, mySheet);

					FillBarCodes(parts,mySheet);
			
					myBook.Save();
					myBook.Close( true,outFileName,true);
					System.Runtime.InteropServices.Marshal.ReleaseComObject(mySheet);
					System.Runtime.InteropServices.Marshal.ReleaseComObject(myBook);
					System.Runtime.InteropServices.Marshal.ReleaseComObject(myApp);
					GC.Collect();
				}
				else
				{
					outFileName = null;
				}
			}
			catch 
			{
				myBook.Close( true,outFileName,true);
				System.Runtime.InteropServices.Marshal.ReleaseComObject(mySheet);
				System.Runtime.InteropServices.Marshal.ReleaseComObject(myBook);
				System.Runtime.InteropServices.Marshal.ReleaseComObject(myApp);
				GC.Collect();
			}

			return outFileName;
		}

		#region JG-071113
		public string CreatePartTxtBarReport(IList parts,string moduleid)
		{

			string path = System.Web.HttpContext.Current.Request.MapPath("excel/");
			string outFileName = "PartBarCode_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + moduleid.Replace('/','_') + ".txt";

			StreamWriter sw;
			
			if(parts.Count > 0)
			{
//				sw = File.CreateText(filePath+outFileName);
				sw = new StreamWriter(filePath+outFileName, false, System.Text.Encoding.BigEndianUnicode);
					

				
				string line;
				for (int i =0; i < parts.Count;i++)
				{
					PartInfo pi = (PartInfo) parts[i];
					//mile-080813
//					line =  "B-"+ pi.NoId+"-F-"+pi.PartNo+",";
                    if (pi.NoId == 0)
                    {
                        line = "B-" + pi.Id + ",";
                    }
                    else
                    {
                        line = "B-" + pi.NoId + ",";
                    }
                    line = line + pi.ModuleId + ",";
					line = line + pi.PartNo + ",";
					line = line + pi.PartName;
//					line = line + pi.PartNo;

                    if (System.Configuration.ConfigurationSettings.AppSettings["ClientModuleId"] != null && !System.Configuration.ConfigurationSettings.AppSettings["ClientModuleId"].Equals(""))
                    {
                        line += "," + pi.ClientModuleId;
                    }

                    if (System.Configuration.ConfigurationSettings.AppSettings["PartCount"] != null && !System.Configuration.ConfigurationSettings.AppSettings["PartCount"].Equals(""))
                    {
                        line += "," + pi.PartCount;
                    }

                    if (System.Configuration.ConfigurationSettings.AppSettings["tryDate3"] != null && !System.Configuration.ConfigurationSettings.AppSettings["tryDate3"].Equals(""))
                    {
                        line += "," + pi.TryDate3.ToString("yy-MM-dd");
                    }

                    if (System.Configuration.ConfigurationSettings.AppSettings["ProductName"] != null && !System.Configuration.ConfigurationSettings.AppSettings["ProductName"].Equals(""))
                    {
                        line += "," + pi.ProductName;
                    }

                    if (System.Configuration.ConfigurationSettings.AppSettings["barCodeWithProcess"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["barCodeWithProcess"]))
                    {
					    string process = _createReportProcess(pi.ModuleId,pi.PartNo);
					    string splitprocess = "";
					    string presplitprocess="";

					    if (process.Length > 35 )
					    {
						    while (process.IndexOf("-") >=0 )
						    {
							    presplitprocess = splitprocess;
							    splitprocess = splitprocess + process.Substring(0,process.IndexOf("-")+2);

							    if (splitprocess.Length > 35)
							    {
								    line = line+","+ presplitprocess;
								
								    splitprocess = "";
								    presplitprocess = "";
							    }
							    else
							    {
								    process = process.Substring(process.IndexOf("-")+2);
							    }

						    }

						    if (!splitprocess.Equals("") && splitprocess.Length+process.Length <= 35)
						    {

							    line = line + "," + splitprocess+process;
						    }
						    else
						    {
							    line = line + "," + splitprocess;

							    if (!process.Equals(""))
							    {
								    line=line + "," + process;
							    }
						    }
					    }
					    else
					    {
                            if (!process.Equals(""))
							    line=line + "," + process;
					    }

                    }
						
					sw.WriteLine(line);
				}
				sw.Close();
			}
			else
			{
				outFileName = null;
			}

			return outFileName;
		}


		public string CreateorderTxtBarReport(IList orders)
		{

			string path = System.Web.HttpContext.Current.Request.MapPath("excel/");
			string outFileName = "orderBarCode_" + DateTime.Now.ToString("yyyyMMddHHmmss")  + ".txt";

			StreamWriter sw;
			
			if(orders.Count > 0)
			{
				//				sw = File.CreateText(filePath+outFileName);
				sw = new StreamWriter(filePath+outFileName, false, System.Text.Encoding.BigEndianUnicode);
					

				
				string line;
				for (int i =0; i < orders.Count;i++)
				{
					ModuleWorkFlow.Model.NewOrder.OrderDesignInfo odi = (ModuleWorkFlow.Model.NewOrder.OrderDesignInfo) orders[i];
					//mile-080813
					//					line =  "B-"+ pi.NoId+"-F-"+pi.PartNo+",";
					line=  "B-"+ odi.ModuleId+ "," ;
//					line = line + pi.ModuleId + ",";
//					line = line + pi.PartNo + ",";
//					line = line + pi.PartCount;
					//					line = line + pi.PartNo;
					
//					string process = _createReportProcess(pi.ModuleId,pi.PartNo);
//					string splitprocess = "";
//					string presplitprocess="";
//
//					if (process.Length > 35 )
//					{
//						while (process.IndexOf("-") >=0 )
//						{
//							presplitprocess = splitprocess;
//							splitprocess = splitprocess + process.Substring(0,process.IndexOf("-")+2);
//
//							if (splitprocess.Length > 35)
//							{
//								line = line+","+ presplitprocess;
//								
//								splitprocess = "";
//								presplitprocess = "";
//							}
//							else
//							{
//								process = process.Substring(process.IndexOf("-")+2);
//							}
//
//						}
//
//						if (!splitprocess.Equals("") && splitprocess.Length+process.Length <= 35)
//						{
//
//							line = line + "," + splitprocess+process;
//						}
//						else
//						{
//							line = line + "," + splitprocess;
//
//							if (!process.Equals(""))
//							{
//								line=line + "," + process;
//							}
//						}
//					}
//					else
//					{
//						line=line + "," + process;
//					}

						
					sw.WriteLine(line);
				}
				sw.Close();
			}
			else
			{
				outFileName = null;
			}

			return outFileName;
		}
		#endregion



		private void FillBarCodes(IList parts,Worksheet mySheet)
		{
			

			int recordnum = 0;
			int startline = 1;
			for (int i =0; i < parts.Count;i++)
			{
				PartInfo pi = (PartInfo) parts[i];
				 
				if (startline == 1)
				{
					startline = startline + recordnum * PartBarCodeReportStyle.RecordSpan;
				}
				



				Range rg = mySheet.get_Range(PartBarCodeReportStyle.BarCol[0]+startline, PartBarCodeReportStyle.BarCol[1]+startline);
				rg.Value2 = pi.PartNo;

				rg = mySheet.get_Range(PartBarCodeReportStyle.PartCol[0]+(PartBarCodeReportStyle.PartRow[0]+startline-1), PartBarCodeReportStyle.PartCol[1]+(PartBarCodeReportStyle.PartRow[1]+startline-1));
				rg.Value2 = pi.ModuleId + " " +pi.PartNo + " " +pi.PartCount +"件";

				rg = mySheet.get_Range(PartBarCodeReportStyle.RelationPartCol[0]+(PartBarCodeReportStyle.RelationPartRow[0]+startline-1), PartBarCodeReportStyle.RelationPartCol[1]+(PartBarCodeReportStyle.RelationPartRow[1]+startline-1));
				rg.Value2 = pi.ModuleId ;

				rg = mySheet.get_Range(PartBarCodeReportStyle.ProcessCol[0]+(PartBarCodeReportStyle.ProcessRow[0]+startline-1), PartBarCodeReportStyle.ProcessCol[1]+(PartBarCodeReportStyle.ProcessRow[1]+startline-1));
				rg.Value2 = _createReportProcess(pi.ModuleId,pi.PartNo);



				if ( i != parts.Count-1)
				{
					rg = mySheet.get_Range(PartBarCodeReportStyle.BarCol[0]+startline,PartBarCodeReportStyle.BarCol[1]+(startline+PartBarCodeReportStyle.RecordSpan -1));
					rg.Copy(oMissing);

					recordnum++;
					startline =  recordnum * PartBarCodeReportStyle.RecordSpan +1;
					rg = mySheet.get_Range(PartBarCodeReportStyle.BarCol[0]+startline,PartBarCodeReportStyle.BarCol[1]+(startline+PartBarCodeReportStyle.RecordSpan - 1));
					rg.Insert(Excel.XlInsertShiftDirection.xlShiftDown,oMissing);
				}


			}
		}

		private string _createReportProcess(string moduleid,string partno)
		{
			PartProcess partprocess = new PartProcess();

			Process process = new Process();

            Hashtable htOldProcess = new ModuleWorkFlow.BLL.Process().GetProcessIdProcessWithCustomerProcess();
            Hashtable hporcess = new Hashtable();
            foreach (string key in htOldProcess.Keys)
            {
                hporcess.Add(key.ToUpper(), htOldProcess[key]);
            }

			IList partprocesses = partprocess.getListPartProcessInfoByModulePartNo(moduleid,partno);

			string reprocess="";
			string processname = "";

			foreach (PartProcessInfo ppi in partprocesses)
			{
				if(ppi.PartNo_Id.Equals(ppi.PartNo+"-1"))
				{
                    if (ppi.CustomerProcessId != null &&　hporcess.ContainsKey(ppi.CustomerProcessId.ToUpper()))
					{
                        processname = ((ProcessInfo)hporcess[ppi.CustomerProcessId.ToUpper()]).CustomerProcessName;
					}
					else
					{
						processname = "";
					}
                    if (System.Configuration.ConfigurationSettings.AppSettings["ProcessWithMinutes"] != null && Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["ProcessWithMinutes"]))
                    {
                        reprocess = reprocess + processname + Math.Round(Convert.ToDouble(ppi.ProcessNeedMinutes) / 60.0, 1) + "-";
                    }else
                    {
                        reprocess = reprocess + processname + "-";
                    }
				}
			}

			
			if (reprocess.IndexOf("-") > 0)
			{	
				return reprocess.Substring(0,reprocess.Length-1);
			}
			else
			{

				return reprocess;
			}
			
		}
	}
}
