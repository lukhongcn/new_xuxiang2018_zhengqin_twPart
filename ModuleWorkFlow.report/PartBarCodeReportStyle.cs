using System;

namespace ModuleWorkFlow.report
{
	/// <summary>
	/// Summary description for PartBarCodeReportStyle.
	/// </summary>
	public class PartBarCodeReportStyle
	{
		//���X
		public static string[] BarCol={"A","C"};
		public static int[] BarRow = {1,1};

		//�Ҩ�s��+�q����
		public static string[] PartCol = {"A","C"};
		public static int[] PartRow = {2,2};

		//�q�������s��
		public static string[] RelationPartCol = {"A","C"};
		public static int[]  RelationPartRow = {3,3};

		//�u��
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
