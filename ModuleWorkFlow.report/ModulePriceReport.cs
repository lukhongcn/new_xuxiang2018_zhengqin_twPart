using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ModuleWorkFlow.Model.Report;
using System.Collections;
using Excel;
using Microsoft.Office.Core;
using System.Reflection;
using System.IO;
using System.Drawing;
using ModuleWorkFlow.business;



namespace ModuleWorkFlow.report
{
    public class ModulePriceReport
    {
        string filePath = "";
        string rootPath = "";

        object oMissing = System.Reflection.Missing.Value;
        string[] alpha = null;
        int[] color = null;
        //protected ModuleWorkFlow.BLL.PartProcess pp;
        //protected ModuleWorkFlow.BLL.DesignPartProcess dpp;
        //protected ModuleWorkFlow.BLL.DesignProcess dp;
        //private ModuleWorkFlow.BLL.Process process;
        public ModulePriceReport()
        {
            string header = "file:///";
            string footer = "bin";
            string RootPath = System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase;
            RootPath = RootPath.Substring(0, RootPath.LastIndexOf(@"/"));
            RootPath = RootPath.Substring(header.Length, RootPath.Length - header.Length);
            RootPath = RootPath.Substring(0, RootPath.Length - footer.Length);

            rootPath = RootPath;
            filePath = rootPath + "excel/";
            //dp = new ModuleWorkFlow.BLL.DesignProcess();
            //process = new ModuleWorkFlow.BLL.Process();

            //pp = new ModuleWorkFlow.BLL.PartProcess();
            //dpp = new ModuleWorkFlow.BLL.DesignPartProcess();
        }

        private void initVars()
        {
            alpha = new string[14] { "Z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M" };
            color = new int[2] { 6, 39 };
        }

        private string transRowsNum(int row)
        {
            string str = "";
            int mutiple = row / 26;
            if (row % 26 == 0) mutiple--;
            if (mutiple > 0)
            {
                str = alpha[mutiple];
            }
            str = str + alpha[row % 26];
            return str;
        }

        public string CreateModulePriceReport(DataSet source,string count)
        {
            HttpContext context = HttpContext.Current;
            string path = System.Web.HttpContext.Current.Request.MapPath("excel/project/");
            string applicationpath = context.Request.ApplicationPath + "/excel/project/";
            initVars();
            string outFileName = null;
            ApplicationClass myApp = null;
            Workbook myBook = null;
            Worksheet mySheet = null;
            outFileName = "ModulePriceReport_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";
            try
            {
                if (!File.Exists(filePath + outFileName))
                {

                    File.Copy(path + "ModulePriceReport.xls", path + outFileName, true);
                }

                myApp = new ApplicationClass();
                myApp.Caption = "模具月進度表";

                myApp.Visible = false;
                myApp.Workbooks._Open(path + outFileName, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing);

                myBook = myApp.Workbooks[1];
                mySheet = (Worksheet)myBook.ActiveSheet;
                myApp.CutCopyMode = Excel.XlCutCopyMode.xlCopy;

                FillModulePriceReport(source,count,mySheet);

                myBook.Save();
                myBook.Close(true, outFileName, true);
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

            return applicationpath + outFileName;
        }

        public void borders(Range rg)
        {
            rg.Borders.Weight = 2;
            rg.Borders.get_Item(XlBordersIndex.xlEdgeLeft).LineStyle = Excel.XlLineStyle.xlContinuous;
            rg.Borders.get_Item(XlBordersIndex.xlEdgeBottom).LineStyle = Excel.XlLineStyle.xlContinuous;
            rg.Borders.get_Item(XlBordersIndex.xlEdgeRight).LineStyle = Excel.XlLineStyle.xlContinuous;
            rg.Borders.get_Item(XlBordersIndex.xlEdgeTop).LineStyle = Excel.XlLineStyle.xlContinuous;
            rg.Borders.get_Item(XlBordersIndex.xlDiagonalDown).LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            rg.Borders.get_Item(XlBordersIndex.xlDiagonalUp).LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            rg.Borders.get_Item(XlBordersIndex.xlInsideHorizontal).LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            rg.Borders.get_Item(XlBordersIndex.xlInsideVertical).LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            rg.Borders.Color = System.Drawing.ColorTranslator.ToOle(Color.Black);
        }

        private void FillModulePriceReport(DataSet li,string count, Worksheet mySheet)
        {
            int counts =0;
            try
            {
               counts   = Convert.ToInt32(count);
            }
            catch
            { 
            
            }
            Hashtable htcursor = new Hashtable();
            Range rg;
            int x = 4;//橫向坐標
            int i = 5;//縱向座標
            System.Data.DataTable dt = new System.Data.DataTable();
            dt = li.Tables[0];


            if (dt.Rows.Count > 0)
            {
                ModuleWorkFlow.BLL.NewOrder.OrderDesign od = new ModuleWorkFlow.BLL.NewOrder.OrderDesign();
                ModuleWorkFlow.Model.NewOrder.OrderDesignInfo odi = new ModuleWorkFlow.Model.NewOrder.OrderDesignInfo();
                odi = od.GetOrderDesignByModuleId(dt.Rows[0]["ModuleId"].ToString());
                if (odi != null)
                {
                    rg=mySheet.get_Range("B3", "B3");
                    rg.Font.Size = 10;
                    rg.Value2 = "'" + odi.ModuleId;

                    rg = mySheet.get_Range("D3", "D3");
                    rg.Font.Size = 10;
                    rg.Value2 = "'" + odi.ProductTypeId;

                    rg = mySheet.get_Range("F3", "F3");
                    rg.Font.Size = 10;
                    rg.Value2 = "'" + odi.TryDate0.ToShortDateString();

                    rg = mySheet.get_Range("I3", "I3");
                    rg.Font.Size = 10;
                    rg.Value2 = "'" + odi.YingYeDanDang;

                    rg = mySheet.get_Range("B4", "B4");
                    rg.Font.Size = 10;
                    rg.Value2 = "'" + Methods.TransCustomerName(Convert.ToString(odi.CustomerId));

                    rg = mySheet.get_Range("K1", "K1");
                    rg.Font.Size = 10;
                    rg.Value2 = "'" + DateTime.Now.ToShortDateString();

                    

                    if (counts > 0)
                    {
                        for (int j = 1; j <= counts; j++)
                        {
                            rg = mySheet.get_Range(alpha[x] + "4", alpha[x] + "4");
                            rg.Font.Size = 10;
                            if (j < 10)
                            {
                                rg.Value2 = "'" + "0" + j.ToString();
                            }
                            else
                            {
                                rg.Value2 = "'" + j.ToString();
                            }
                            x = x + 1;
                        }
                        x = 4;
                    }


                    IList lis = changelist(dt.Rows[0]["ModuleId"].ToString());

                    foreach (ModuleWorkFlow.Model.ModulePriceInfo mpi in lis)
                    {
                        string search = " ModuleId='" + mpi.ModuleId + "' and PartNo='" + mpi.PartNo + "'";
                        string ManchinePrice = Convert.ToString(Math.Round(Convert.ToDouble(dt.Compute("SUM(MachinePrice)", search)), 2));
                        DataRow[] drs = dt.Select(search);
                        if (drs.Length > 0)
                        {
                            DataRow dr = drs[0];
                            rg = mySheet.get_Range("A" + i, "A" + i);
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + dr["PartNo"].ToString();

                            rg = mySheet.get_Range("B" + i, "B" + i);
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + dr["PartName"].ToString();

                            rg = mySheet.get_Range("C" + i, "C" + i);
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + "幾台";

                            rg = mySheet.get_Range("A" + (i + 1), "A" + (i + 1));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + "材料費";

                            rg=mySheet.get_Range("B" + (i + 1), "B" + (i + 1));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + dr["MaterialPrice"].ToString();

                            rg = mySheet.get_Range("C" + (i + 1), "C" + (i + 1));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + "實際Hr";

                            rg = mySheet.get_Range("A" + (i + 2), "A" + (i + 2));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + "加工費小計";

                            rg = mySheet.get_Range("B" + (i + 2), "B" + (i + 2));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + ManchinePrice;

                            rg = mySheet.get_Range("C" + (i + 2), "C" + (i + 2));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + "金額";

                            rg = mySheet.get_Range("A"+i,"B"+(i+2));
                            rg.Select();
                           // rg.Borders.get_Item(XlBordersIndex.xlEdgeLeft).LineStyle = Excel.XlLineStyle.xlContinuous;
                            rg.Borders.get_Item(XlBordersIndex.xlEdgeBottom).LineStyle = Excel.XlLineStyle.xlContinuous;
                            rg.Borders.get_Item(XlBordersIndex.xlEdgeRight).LineStyle = Excel.XlLineStyle.xlContinuous;
                            rg.Borders.get_Item(XlBordersIndex.xlEdgeTop).LineStyle = Excel.XlLineStyle.xlContinuous;
                            
                        }

                        foreach (DataRow dri in drs)
                        {
                            rg = mySheet.get_Range(alpha[x] + i, alpha[x] + i);
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + Methods.TranslateProcessName(dri["ProcessId"].ToString());

                            rg = mySheet.get_Range(alpha[x] + (i + 1), alpha[x] + (i + 1));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + dri["FactProcessNeedMinutes"].ToString();

                            rg = mySheet.get_Range(alpha[x] + (i + 2), alpha[x] + (i + 2));
                            rg.Font.Size = 10;
                            rg.Value2 = "'" + dri["MachinePrice"].ToString();
                            x++;
                        }
                        rg = mySheet.get_Range("C" + i, alpha[(counts+3)] + (i + 2));
                        //rg.Borders.get_Item(XlBordersIndex.xlEdgeLeft).LineStyle = Excel.XlLineStyle.xlContinuous;
                        rg.Borders.get_Item(XlBordersIndex.xlEdgeBottom).LineStyle = Excel.XlLineStyle.xlContinuous;
                       // rg.Borders.get_Item(XlBordersIndex.xlEdgeRight).LineStyle = Excel.XlLineStyle.xlContinuous;
                        rg.Borders.get_Item(XlBordersIndex.xlEdgeTop).LineStyle = Excel.XlLineStyle.xlContinuous;
                        x = 4;
                        i = i + 3;
                    }
                }
            }
        }

       public IList changelist(string moduleid)
       {
           IList source = new ArrayList();
           BLL.ModulePrice mp = new ModuleWorkFlow.BLL.ModulePrice();
           IList ilist = mp.GetModulePiceByModuleidFact(moduleid);
           if (ilist.Count > 0)
           {
                string Partno ="";
                
                foreach (ModuleWorkFlow.Model.ModulePriceInfo mpi in ilist)
                {
                    if (!mpi.PartNo.Equals(Partno))
                    {
                        source.Add(mpi); 
                        Partno = mpi.PartNo;
                    }
                }
          
           }
           return source;
       }

        public void clearborder(Range range)
        {
            range.Borders[XlBordersIndex.xlEdgeTop].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            range.Borders[XlBordersIndex.xlEdgeBottom].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            range.Borders[XlBordersIndex.xlEdgeLeft].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            range.Borders[XlBordersIndex.xlEdgeRight].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            range.Borders[XlBordersIndex.xlInsideHorizontal].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            range.Borders[XlBordersIndex.xlInsideVertical].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            range.Borders[XlBordersIndex.xlDiagonalDown].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
            range.Borders[XlBordersIndex.xlDiagonalUp].LineStyle = Excel.XlLineStyle.xlLineStyleNone;
 
        }
    }
}
