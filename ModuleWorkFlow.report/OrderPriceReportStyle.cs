using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace ModuleWorkFlow.report
{
    public class OrderPriceReportStyle
    {
        public OrderPriceReportStyle()
		{
			//
			// TODO: Add constructor logic here
			//
		}
        public static string[] FCOLreportYearMonth ={ "A", "H" };
        public static string[] FCOLcustomerName ={ "A", "F" };
        public static string[] FCOLreportDate ={ "H", "H" };
        public static string[] FCOLreportReferencePictureDate ={ "A", "A" };
        public static string[] FCOLmoduleId ={ "B", "B" };
        public static string[] FCOLcompletion ={ "C", "C" };
        public static string[] FCOLreportTryDate3 ={ "D", "D" };
        public static string[] FCOLprocessNeedMinutes ={ "E", "E" };
        public static string[] FCOLfactProcessNeedMinutes ={ "F", "F" };
        public static string[] FCOLprocessNeedMinutesPrice ={ "G", "G" };
        public static string[] FCOLfactProcessNeedMinutesPrice ={ "H", "H" };
    }
}
