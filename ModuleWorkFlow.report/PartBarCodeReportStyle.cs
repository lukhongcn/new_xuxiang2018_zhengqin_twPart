using System;

namespace ModuleWorkFlow.report
{
	/// <summary>
	/// Summary description for PartBarCodeReportStyle.
	/// </summary>
	public class PartBarCodeReportStyle
	{
		//條碼
		public static string[] BarCol={"A","C"};
		public static int[] BarRow = {1,1};

		//模具編號+電極號
		public static string[] PartCol = {"A","C"};
		public static int[] PartRow = {2,2};

		//電極相關零件號
		public static string[] RelationPartCol = {"A","C"};
		public static int[]  RelationPartRow = {3,3};

		//工序
		public static string[] ProcessCol = {"A","C"};
		public static int[] ProcessRow = {4,7};

		public static int RecordSpan = 8;


		
		public PartBarCodeReportStyle()
		{
			//
			// TODO: Add constructor logic here
			//
		}
	}
}
