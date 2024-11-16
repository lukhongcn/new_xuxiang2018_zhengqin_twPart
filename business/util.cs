#region �����ļ�˵��
/* 
	Title	BookingSystem
	Author	������(jandon)
	Create	Sep.24,2004
	Version 1.0  
 */
#endregion

using System;
using System.Drawing;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text;
using System.Xml;
using ModuleWorkFlow.WebView;
using Microsoft.ApplicationBlocks.Data;		


using System.Web.UI.WebControls;

using ModuleWorkFlow.BLL;
using ModuleWorkFlow.Model;
using ModuleWorkFlow.BLL.System;
using ModuleWorkFlow.Model.System;

namespace ModuleWorkFlow.business
{
	//�t�ΩR�W�W�h�w�q
	//�@�Bweb��������R�W�W�h
	//   1�B����W�٬�"???_*"�A"???"��ܱ��������A
	///////textbox="tbx"
	///////dropdownlist="drp"
	///////label="lab"
	///////RadioButton="rad"
	
	//�G�B������k�ܶq�R�W�W�h
	/////1�B��k�R�W��h
	////////�p����k�W�٫e�����U���u"_",���r���p�g
	////////public��k

	public class Setting
	{
		public static int DAYS = 30;
		public static int HOURS = 24;

		public static string[] DEFAULTPROCESS = {"PrePare","Grind","Milling","Cut","CNC","EDM","Flash"};
		public static string[] DEFAULTELECTRODEPROCESS = {"Cut","CNCE","QC","Flash"};

		public static string[] PROCESSID      = {"Design","Merchandise","Lathe"    ,"Drill"     ,"BefroeCNC","CNCHeat","AfterCNC","Engraving","QC"     ,"Texture","Grind"   ,"Milling" ,"PrePare","Cut"   ,"SlowCut","CNC"        ,"CNCN"       ,"EDM"     ,"Flash"  ,"Assemble","CNCE"       ,"PlaneEDM"        ,"CAM","burn"		};
		public static string[] PROCESSNAME    = {"�]�p"  ,"�~��"       ,"����"     ,"�p��"      ,"CNC���e"  ,"���B�z" ,"CNC����" ,"�J��"     ,"�~��"   ,"�r��"   ,"�i��"    ,"�ѧ�"    ,"�Ʈ�"   ,"�ֵ�"  ,"�C��"   ,"CNC�[�u����","CNC���q��"  ,"��q"    ,"����"   ,"�ե�"    ,"CNC�q����"  ,"�譱��q"        ,"CAM","�N�k"		};
		public static string[] PROCESSBARCODE = {"SHEJI" ,"WAIGOU"     ,"CHECHUANG","ZUANCHUANG","CNCREQIAN","RECHULI","CNCREHOU","DIAOKE"   ,"PINGUAN","YAOHUA" ,"MOCHUANG","XICHUANG","BEILIAO","KUAISI","MANSI"  ,"CNC"        ,"CNCPUTONGJI","FANGDIAN","DAGUANG","ZULI"    ,"CNCDIANJIJI","JINGMIANFANGDIAN","CAM","SHAOHAN"	};

		public static string[] MATERIALTYPEID   = {"Production","Part","Try" };
		public static string[] MATERIALTYPENAME = {"���~"      ,"�s��","�ռ�"};

		public static string[] STATUSID      = {"Implementation","Working"     ,"Pending" ,"Rejected","Cancelled","Reopened"      ,"Delay"   ,"Ready"   ,"Holdon","JIEDAN","XIAODAN" ,"CHUCHANG" ,"HUICHANG" ,"FANHUI","Rezuli"};
		public static string[] STATUSNAME    = {"����"          ,"�i�椤"      ,"���N��"  ,"�ڵ�"    ,"����"     ,"���s�}�l"      ,"����"    ,"�N��"    ,"�Ȱ�","����","����" ,"�X�t" ,"�^�t"  ,"��^" ,"�եߪ��"};
		public static string[] STATUSCODE    = {"WANCHENG"      ,"JINXINGZHONG","WEIJIUXU","JUJUE"   ,"QUXIAO"   ,"CHONGXINKAISHI","YANCHI"  ,"JIUXU"   ,"ZANTING","JIEDAN","XIAODAN","CHUCHANG","HUICHANG" ,"FANHUI","ZULIFANXIU"};
        public static string[] STATUSCOLOR = { "&H00FF00 ", "&H99ff66", "&HFFFF00", "&HFF0000", "&H787878", "&HCC0000", "&HFF0000", "&H00FFFF", "&HB7B7B7", "&HFFB300", "&HB0B9FF  ", "&HCCFF00", "&H00FF00", "&HB7B7B7", "&HFF3FD7" };


//		MYD070615
		public static string[] ACTIONBARCODE = {"KAISHI","ZANTING","JIESHU","FANGONG","RUKU","CHUKU","CHUCHANG","HUICHANG","FANHUI","XIAODAN","JIEDAN","CHUHUO","DAIPAN","BULIANG"};
		public static string[] ACTIONNAME    = {"�}�l"  ,"�Ȱ�"   ,"����","��u","�J�w","�X�w","�X�t","�^�t","��^","����","����","�X�f","�ݧP","���}"  };

		#region ���νX�R�O�W�h
		//�Ҧ�
		public static string[] BARCODE_CODE    = {"A"		,"B"			,"C"		,"D"		,"Z"	,"M"	};
		public static string[] BARCODE_COMMAND = {"USERNO"	,"MODULEPART"	,"PROCESS"	,"ACTION"	,"MODULE",	"MACHINE"	};

		#endregion
        

		public static Color SELECTCOLOR = Color.PowderBlue;
		public static Color FACTDATECOLOR = Color.DimGray;
		public static Color NormalColor = Color.White;
		public static Color DelayColor = Color.Red;
		public static Color FinishColor = Color.Green;

		public static string ALLValue = "all" ;
		public static string ALLText  = "����";

		public static string STATUSCOLOR_DONE = "GREEN";
		public static string STATUSCOLOR_DOING = "BLUE";
		public static string STATUSCOLOR_READY = "YELLOW";

		public static string INFILENAME = "Sample.xls";

		public static string TreeViewRoot = "webctrl_client/1_0/treeimages/";
	}

	#region �t�έ즳Info��
	/// <summary>
	/// �����ռ�����
	/// </summary>
	public class Info
	{
		public const string Title="����ѧ����";
		public const string URL="http://stu.fudan.edu.cn";
		public const string	Address="Ҷҫ��¥503��";
		public const string Tel="021-55664425";
	}
	#endregion

	#region �t�έ즳Settings��
	/// <summary>
	/// ��������
	/// </summary>
	public class Settings
	{
		#region ����
		public static string[] Channel={"У԰����","���š���","���֡���","�����","ѧϰ����", "ר�⡼��" ,"����"};
		public static string[] ChannelColor={"#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b"};
		public static string RobotID = "SYSTEM_NewsRobo";
		public static int	HotLimit = 20;	//HotNews���������ֵ
		public static int	StuBoardID = 65;	//ѧ������Ϣ�������
		public static int	ForumBoardID = 1;	//��̳�����
		#endregion

		#region enum ����
		public enum BoardTypes : byte {PlainText=0,Html=1,FileLink=2,FileInDatabase=3,Reference=4}
		public static string[] Grades={"2000������","2001������","2002������","2003������","2004������","�о�������ʿ��","��������ѧ��","������ʦ","������ѧУ��","�㸴����Ա"};
		#endregion
	}
	#endregion

	#region �{�Ҥ�k
	/// <summary>
	/// �û���֤
	/// </summary>
	public class Identity
	{
		#region ��ɫ����
		/// <summary>
		/// ��ɫ
		/// </summary>
		public struct Roles
		{
			public const string Unknown="Unknown";
			public const string Visitor="Visitor";
		}
		#endregion

		#region Logon
		public static void UserLogon(string UserID,string IP)
		{	
			System.Data.SqlClient.SqlParameter[] pars = new SqlParameter[2];
			pars[0] = new SqlParameter("@UserID",SqlDbType.VarChar,15);
			pars[0].Value = UserID;
			pars[1] = new SqlParameter("@LastLogonIp",SqlDbType.VarChar,15);
			pars[1].Value = IP;
			Data.ExecuteNonQuery("UserLogon",CommandType.StoredProcedure,pars);
		}
		#endregion

		#region Logonout
		public static void UserLogonout(string UserID)
		{	
			System.Data.SqlClient.SqlParameter[] pars = new SqlParameter[1];
			pars[0] = new SqlParameter("@UserID",SqlDbType.VarChar,15);
			pars[0].Value = UserID;
			Data.ExecuteNonQuery("UserLogonout",CommandType.StoredProcedure,pars);
		}
		#endregion


		#region �{�Ҥ�k
		/// <summary>
		/// ��֤�û�
		/// </summary>
		/// <param name="UserID">�û���</param>
		/// <param name="Password">����</param>
		/// <returns></returns> 
		public static bool Authenticate(string UserID,string Password)
		{
			SqlConnection con=new SqlConnection(Data.ReadConnectionStr());

			SqlCommand com=new SqlCommand("UserAuthenticate",con);
			com.CommandType=CommandType.StoredProcedure;
			com.Parameters.Add("@UserID",SqlDbType.VarChar,15);
			com.Parameters.Add("@Password",SqlDbType.VarChar,15);
			com.Parameters[0].Value=UserID;
			com.Parameters[1].Value=Password;

			int count;

			try
			{
				con.Open();
				count=(int)com.ExecuteScalar();
			}
			finally
			{
				con.Close();
			}

			return (count>0);
		}
		
		/// <summary>
		/// �ж��û��Ƿ����
		/// </summary>
		/// <param name="UserID">�û���</param>
		/// <returns></returns>
		public static bool UserExists(string UserID)
		{
			SqlConnection con=new SqlConnection(Data.ReadConnectionStr());

			SqlCommand com=new SqlCommand("UserExists",con);
			com.CommandType=CommandType.StoredProcedure;
			com.Parameters.Add("@UserID",SqlDbType.VarChar,15);
			com.Parameters[0].Value=UserID;

			int count;
			try
			{
				con.Open();
				count=(int)com.ExecuteScalar();
			}
			finally
			{
				con.Close();
			}

			return (count>0);
		}	
		
		/// <summary>
		/// �ж���ָ�������û��Ƿ����(�漰UserRole��,���ڿ��ܲ������ű�)
		/// </summary>
		/// <param name="UserID">�û���</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static bool UserExists(string UserID,int BoardID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("UserExists_Board");
			com.Parameters.Add("@UserID",SqlDbType.VarChar,15).Value=UserID;
			com.Parameters.Add("@BoardID",SqlDbType.Int).Value=BoardID;

			int count;
			try
			{
				com.Connection.Open();
				count=(int)com.ExecuteScalar();
			}
			finally
			{
				com.Connection.Close();
			}
			return (count>0);
		}	
		
		/// <summary>
		/// �񡼽�ɫ����ֵ(�漰Roles��,���ڿ��ܲ������ű�)
		/// </summary>
		/// <param name="RoleID">��ɫID</param>
		/// <returns></returns> 
		public static int getRolePrivilliage(string RoleID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("getRolePrivilliage");
			com.Parameters.Add("@RoleID",SqlDbType.VarChar,50).Value=RoleID;
			object RolePrivilliage=Data.getDataScalar(com);
			if(RolePrivilliage==null)
				return 0;
			return int.Parse(RolePrivilliage.ToString());
		}
		#endregion

		#region ���������ṹ
		/// <summary>
		/// ������
		/// </summary>
		public enum ReadLevel {CannotRead=0,ReadTitle=1,ReadContent=2}	
		/// <summary>
		/// �ġ���
		/// </summary>	
		public enum EditLevel {CannotEdit=0,EditSelf,EditAll,EditProperty /*����������*/}
		/// <summary>
		/// ɾ������
		/// </summary>
		public enum DeleteLevel {CannontDelete=0,DeleteSelf,DeleteAll}

		/// <summary>
		/// ���������ṹ
		/// </summary>
		public struct BoardAccessLevel
		{
			/// <summary>
			/// ��������Ϣ
			/// </summary>
			public ReadLevel ReadPassed;	
			/// <summary>
			/// ���㹫����Ϣ
			/// </summary>
			public ReadLevel ReadNotPassed;	
			/// <summary>
			/// �Ĺ�����Ϣ
			/// </summary>
			public EditLevel EditPassed;		
			/// <summary>
			/// �ĭ㹫����Ϣ
			/// </summary>
			public EditLevel EditNotPassed;	
			/// <summary>
			/// ɾ��������Ϣ
			/// </summary>
			public DeleteLevel DeletePassed;	
			/// <summary>
			/// ɾ���㹫����Ϣ
			/// </summary>
			public DeleteLevel DeleteNotPassed;	
			/// <summary>
			/// �Ƿ���о�����Ϣ�ġ���
			/// </summary>
			public bool Pass;
			/// <summary>
			/// �Ƿ���з�����Ϣ�ġ���
			/// </summary>
			public bool Append;
			/// <summary>
			/// �Ƿ���й�����
			/// </summary>
			public bool Manage;
			//public bool Search;

			//Ĭ�����졼��0���ޡ��Ρ���
			/*public BoardAccessLevel() 
			{
				
				this.ReadPassed=CannotRead;
				this.ReadNotPassed=CannotRead;
				this.EditPassed=CannotEdit;
				this.EditNotPassed=CannotEdit;
				this.DeleteNotPassed=CannontDelete;
				this.DeletePassed=CannontDelete;
				this.Pass=false;
				this.Append=false;
				this.Search=false;
				
			}*/

			/// <summary>
			/// ���캯����������
			/// </summary>
			/// <param name="aReadPassed">��������Ϣ�ġ���ֵ</param>
			/// <param name="aReadNotPassed">���㹫����Ϣ�ġ���ֵ</param>
			/// <param name="aEditPassed">�Ĺ�����Ϣ�ġ���ֵ</param>
			/// <param name="aEditNotPassed">�ĭ㹫����Ϣ�ġ���ֵ</param>
			/// <param name="aDeletePassed">ɾ��������Ϣ�ġ���ֵ</param>
			/// <param name="aDeleteNotPassed">ɾ���㹫����Ϣ�ġ���ֵ</param>
			/// <param name="aPass">�Ƿ���о�����Ϣ�ġ���</param>
			/// <param name="aAppend">�Ƿ���з�����Ϣ�ġ���</param>
			/// <param name="aManage">�Ƿ���й�����</param>
			/// 
			public BoardAccessLevel(
				ReadLevel aReadPassed,
				ReadLevel aReadNotPassed,
				EditLevel aEditPassed,
				EditLevel aEditNotPassed,
				DeleteLevel aDeletePassed,
				DeleteLevel aDeleteNotPassed,
				bool aPass,
				bool aAppend,
				bool aManage)
				//bool aSearch 
			{
				this.ReadPassed=aReadPassed;
				this.ReadNotPassed=aReadNotPassed;
				this.EditPassed=aEditPassed;
				this.EditNotPassed=aEditNotPassed;
				this.DeleteNotPassed=aDeleteNotPassed;
				this.DeletePassed=aDeletePassed;
				this.Pass=aPass;
				this.Append=aAppend;
				this.Manage=aManage;
			}

			/// <summary>
			/// �������캯��
			/// </summary>
			/// <param name="aClone"></param>
			public BoardAccessLevel(BoardAccessLevel aClone)
			{
				this.ReadPassed=aClone.ReadPassed;
				this.ReadNotPassed=aClone.ReadNotPassed;
				this.EditPassed=aClone.EditPassed;
				this.EditNotPassed=aClone.EditNotPassed;
				this.DeletePassed=aClone.DeletePassed;
				this.DeleteNotPassed=aClone.DeleteNotPassed;
				this.Pass=aClone.Pass;
				this.Append=aClone.Append;
				this.Manage=aClone.Manage;
				//this.Search=aClone.Search;
			}


			//����BoardAccessLevelģʽ��ֱ�ӵ���
			//public static BoardAccessLevel PublicRead = new BoardAccessLevel();
			//public static BoardAccessLevel 
		}
		#endregion		
	}
	#endregion

	#region ���󭶭����`�q�w�q
	namespace Pages
	{
		#region �X�����url�a�}
		/// <summary>
		/// ҳ��λ��
		/// </summary>
		public class Location
		{
			//public const string Home_Stu = "http://10.107.0.49";
			//public const string Home_Stu ="http://stu.fudan.edu.cn";
			public const string Home_Stu = "..";

			/// <summary>
			/// ע��ҳ 
			/// </summary>
			public const string Page_Register = Home_Stu+"/register.aspx";		
			
			/// <summary>
			/// ���ŵ�����Ŀ�����б�
			/// </summary>
			public const string Page_List = Home_Stu+"/list.aspx";		
			
			/// <summary>
			/// ��������
			/// </summary>
			public const string Page_Error_Para = Home_Stu + "/error/para.aspx";
	
			///<summary>
			/// ���޲���
			/// </summary>
			public const string Page_Error_Limit = Home_Stu + "/error/limit.aspx";	
			
			/// <summary>
			/// ҳ�治����
			/// </summary>
			public const string Page_Error_None = Home_Stu + "/error/none.aspx";
	
			/// <summary>
			/// ������
			/// </summary>
			public const string Page_Error_Construction = Home_Stu + "/error/construction.aspx";

			/// <summary>
			/// ͨ�ô��� 	
			/// </summary>		
			public const string Page_Error = Home_Stu + "/error/error.aspx";		
			
			/// <summary>
			/// ѡ��ת��ҳ��
			/// </summary>
			public const string Name_Switch = "Switch.aspx";
		}
		#endregion

		#region Switch (Front Controller ģʽ)
		/// <summary>
		/// Switch (Front Controller ģʽ)
		/// </summary>
		public class Switch
		{
			/*�˵�����ģʽ��
			 * Transferֱ�ӽ���ҳ��QueryString������һ��ҳ�棻
			 * List��Settings.Xml��ָ�����h��Key
			 * Custom�Զ���꡼�������
			 * None�޲���
			 * Ĭ��ֵTransfer��������Settings.Xml��ָ����
			 * */
			public enum ParaMode {Transfer=0,List,Custom,None};	
			public struct MenuItem
			{
				public string Text;
				public string Command;
				public ParaMode CommandMode;
				//public MenuItem ParentMenuItem; 
				public string CssClass;
			}
		}
		#endregion
		
	}

	#endregion

	#region ����s���ƾڮw����
	/// <summary>
	/// ���ݷ���
	/// </summary>
	public class Data
	{
		public static string constr ;
		#region �ƾڮw�p���r�Ŧ�w�q
		/// <summary>
		/// ���ʺ������ַ���
		/// </summary>
		/// <returns></returns>
		public static string ReadConnectionStr()
		{
			//MYD070805
			//return "server=.;database=ModuleWorkFlow;uid=workflow;pwd=workflow";	
			return System.Configuration.ConfigurationSettings.AppSettings["MsSQLConnString"];
	
		}

		/// <summary>
		/// д�ʺ������ַ���
		/// </summary>
		/// <returns></returns>
		public static string WriteConnectionStr()
		{
			//MYD070805
			//return "server=.;database=ModuleWorkFlow;uid=workflow;pwd=workflow";
			return System.Configuration.ConfigurationSettings.AppSettings["MsSQLConnString"];

		}

		#endregion

		#region ִ������,������Ӱ�������
		/// <summary>
		/// ִ������,������Ӱ�������
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string sql)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),CommandType.Text,sql);
		}
		/// <summary>
		/// ִ������,������Ӱ�������
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string sql, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),CommandType.Text,sql,commandParameters);
		}
		/// <summary>
		/// ִ������,������Ӱ�������
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="CommandType">��CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),commandType,StrdPrcdrName);
		}
		/// <summary>
		/// ִ������,������Ӱ�������
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),commandType,StrdPrcdrName,commandParameters);
		}		
		#endregion
		
		#region �����ݶ�����
		/// <summary>
		/// �����ݶ�����
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string sql)
		{
			return SqlHelper.ExecuteReader(ReadConnectionStr(),CommandType.Text,sql);
		}

		/// <summary>
		/// �����ݶ�����
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteReader(ReadConnectionStr(),CommandType.Text,sql,commandParameters);
		}

		/// <summary>
		/// �����ݶ�����
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="CommandType">��CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteReader(WriteConnectionStr(),commandType,StrdPrcdrName);
		}

		/// <summary>
		/// �����ݶ�����
		/// </summary>
		/// <param name="StrdPrcdrName">��CommandType.StoredProcedure</param>
		/// <param name="commandType">�洢������</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteReader(Data.WriteConnectionStr(),commandType,StrdPrcdrName,commandParameters);		
		}

		#endregion
		
		#region �񡼵���ֵ
		/// <summary>
		/// �񡼵���ֵ,�޽�O�򷵻�null
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <returns></returns>
		public static object getDataScalar(string sql)
		{
			return SqlHelper.ExecuteScalar(ReadConnectionStr(),CommandType.Text,sql);
		}

		/// <summary>
		/// �񡼵���ֵ,�޽�O�򷵻�null
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static object getDataScalar(string sql, params SqlParameter[] commandParameters)
		{
            return SqlHelper.ExecuteScalar(ReadConnectionStr(),CommandType.Text,sql,commandParameters);
		}

		/// <summary>
		/// �񡼵���ֵ,�޽�O�򷵻�null
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static object getDataScalar(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteScalar(WriteConnectionStr(),commandType,StrdPrcdrName);
		}

		/// <summary>
		/// �񡼵���ֵ,�޽�O�򷵻�null
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static object getDataScalar(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteScalar(WriteConnectionStr(),commandType,StrdPrcdrName, commandParameters);
		}
		
		#endregion
		
		#region ��������
		/// <summary>
		/// ��һ������,�޽�O����null
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <returns></returns>
		public static DataRow getDataRow(string sql)
		{
			DataTable dt = getDataTable(sql);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}
		
		/// <summary>
		/// ��һ������,�޽�O����null
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static DataRow getDataRow(string sql, params SqlParameter[] commandParameters)
		{
			DataTable dt = getDataTable(sql,commandParameters);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}

		/// <summary>
		/// ��һ������,�޽�O����null
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static DataRow getDataRow(string StrdPrcdrName,CommandType commandType)
		{
			DataTable dt = getDataTable(StrdPrcdrName,commandType);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}

		/// <summary>
		/// ��һ������,�޽�O����null
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static DataRow getDataRow(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			DataTable dt = getDataTable(StrdPrcdrName,commandType,commandParameters);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}

		#endregion
				
		#region �����ݱ�
		/// <summary>
		/// ��һ�����ݱ��,�޽�O���ؿձ�
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <returns></returns>
		public static DataTable getDataTable(string sql)
		{
			DataSet  ds = getDataSet(sql);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}

		/// <summary>
		/// ��һ�����ݱ��,�޽�O���ؿձ�
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static DataTable getDataTable(string sql, params SqlParameter[] commandParameters)
		{
			DataSet  ds = getDataSet(sql,commandParameters);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}
		
		/// <summary>
		/// ��һ�����ݱ��,�޽�O���ؿձ�
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static DataTable getDataTable(string StrdPrcdrName,CommandType commandType)
		{
			DataSet  ds = getDataSet(StrdPrcdrName,commandType);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}

		/// <summary>
		/// ��һ�����ݱ��,�޽�O���ؿձ�
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static DataTable getDataTable(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			DataSet  ds = getDataSet(StrdPrcdrName,commandType,commandParameters);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}	

		#endregion
						
		#region �����ݼ�
		/// <summary>
		/// ��һ�����ݼ�,�޽�O���ؿյ����ݼ�
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <returns></returns>
		public static DataSet getDataSet(string sql)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), CommandType.Text, sql);
		}
		/// <summary>
		/// ��һ�����ݼ�,�޽�O���ؿյ����ݼ�
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static DataSet getDataSet(string sql, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), CommandType.Text,sql,commandParameters);
		}	
		
		/// <summary>
		/// ��һ�����ݼ�,�޽�O���ؿյ����ݼ�
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static DataSet getDataSet(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), commandType, StrdPrcdrName);
		}	

		/// <summary>
		/// ��һ�����ݼ�,�޽�O���ؿյ����ݼ�
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <param name="commandType">��CommandType.StoredProcedure</param>
		/// <param name="commandParameters">��������</param>
		/// <returns></returns>
		public static DataSet getDataSet(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), commandType, StrdPrcdrName,commandParameters);
		}	

		#endregion

		#region ִ������,�ɹ�������,ʧ�ܷ��ر�
		/// <summary>
		/// ��������ִ�в���������sql���
		/// </summary>
		/// <param name="sql"></param>
		/// <returns></returns>
		public static bool excuteTrans(ArrayList alSql)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = WriteConnectionStr();
			conn.Open();

			SqlCommand myCommand = conn.CreateCommand();
			SqlTransaction myTrans;

			// Start a local transaction
			myTrans = conn.BeginTransaction();
			// Must assign both transaction object and connection
			// to Command object for a pending local transaction
			myCommand.Connection = conn;
			myCommand.Transaction = myTrans;

			try
			{
				for (int i=0;i<alSql.Count;i++)
				{
					myCommand.CommandText = alSql[i].ToString();
					myCommand.ExecuteNonQuery();
				}
				myTrans.Commit();
				return true;
			}
			catch(Exception e)
			{
				try
				{
					myTrans.Rollback();
				}
				catch (SqlException ex)
				{
					if (myTrans.Connection != null)
					{
						Console.WriteLine("An exception of type " + ex.GetType() +
							" was encountered while attempting to roll back the transaction.");
					}
				}
    
				Console.WriteLine("An exception of type " + e.GetType() +
					" was encountered while inserting the data.");
				Console.WriteLine("Neither record was written to database.");
				return false;
			}
			finally 
			{
				conn.Close();
			}			
		}
		/// <summary>
		/// ��������ִ�д�������sql���
		/// </summary>
		/// <param name="sql"></param>
		/// <param name="commandParameters"></param>
		/// <returns></returns>
		public static bool excuteTrans(ArrayList alSql, ArrayList Parameters)
		{
			SqlConnection conn = new SqlConnection();
			conn.ConnectionString = WriteConnectionStr();
			conn.Open();

			SqlCommand myCommand = conn.CreateCommand();
			SqlTransaction myTrans;

			// Start a local transaction
			myTrans = conn.BeginTransaction();
			// Must assign both transaction object and connection
			// to Command object for a pending local transaction
			myCommand.Connection = conn;
			myCommand.Transaction = myTrans;

			try
			{
				for (int i=0;i<alSql.Count;i++)
				{
					myCommand.CommandText = alSql[i].ToString();
					// Set the command type
					myCommand.CommandType = CommandType.Text;
					object pars = Parameters[i];

					// Attach the command parameters if they are provided
					if (pars != null)
					{
						myCommand.Parameters.Clear();
						SqlHelper.AttachParameters(myCommand, (SqlParameter[])pars);
					}
					myCommand.ExecuteNonQuery();
				}
				myTrans.Commit();
				return true;
			}
			catch(Exception e)
			{
				try
				{
					myTrans.Rollback();
				}
				catch (SqlException ex)
				{
					if (myTrans.Connection != null)
					{
						Console.WriteLine("An exception of type " + ex.GetType() +
							" was encountered while attempting to roll back the transaction.");
						
					}
				}
    
				Console.WriteLine("An exception of type " + e.GetType() +
					" was encountered while inserting the data.");
				Console.WriteLine("Neither record was written to database.");
				return false;
			}
			finally 
			{
				conn.Close();
			}			
		}


        public static bool excuteTrans(ArrayList alSql, ArrayList Parameters, ArrayList alCommandType)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WriteConnectionStr();
            conn.Open();

            SqlCommand myCommand = conn.CreateCommand();
            SqlTransaction myTrans;

            // Start a local transaction
            myTrans = conn.BeginTransaction();
            // Must assign both transaction object and connection
            // to Command object for a pending local transaction
            myCommand.Connection = conn;
            myCommand.Transaction = myTrans;

            try
            {
                for (int i = 0; i < alSql.Count; i++)
                {
                    myCommand.CommandText = alSql[i].ToString();
                    // Set the command type
                    myCommand.CommandType = (CommandType)alCommandType[i];
                    object pars = Parameters[i];

                    // Attach the command parameters if they are provided
                    if (pars != null)
                    {
                        myCommand.Parameters.Clear();
                        SqlHelper.AttachParameters(myCommand, (SqlParameter[])pars);
                    }
                    myCommand.ExecuteNonQuery();
                }
                myTrans.Commit();
                return true;
            }
            catch (Exception e)
            {
                try
                {
                    myTrans.Rollback();
                }
                catch (SqlException ex)
                {
                    if (myTrans.Connection != null)
                    {
                        Console.WriteLine("An exception of type " + ex.GetType() +
                            " was encountered while attempting to roll back the transaction.");

                    }
                }

                Console.WriteLine("An exception of type " + e.GetType() +
                    " was encountered while inserting the data.");
                Console.WriteLine("Neither record was written to database.");
                return false;
            }
            finally
            {
                conn.Close();
            }
        }
		#endregion

		#region ��������Ԫ�صĴ���
		/// <summary>
		/// ���ƶ���������Ԫ�صĶ�����Ϣ���ڡ�
		/// </summary>
		/// <param name="NewsID">����ID</param>
		/// <param name="strXMLPath">��Ű�鶨����Ϣ��XML�ļ�·��</param>
		/// <returns></returns>
		/*
		public static DataTable GetSpecialData_NewsID(int NewsID, string strXMLPath)
		{
			DataTable tabSpecialData = new DataTable();
			string strSQL = string.Format("SELECT NewsBoardID, Special FROM [News]WHERE NewsID = {0}", NewsID);
			SqlDataReader dr = Fudan.Stu.Data.ExecuteReader(strSQL);
			if (dr.Read())
			{
				int BoardID = int.Parse(dr["NewsBoardID"].ToString());
				string strSpecial = dr["Special"].ToString();
				tabSpecialData = GetSpecialData_BoardID(BoardID, strXMLPath, strSpecial);
			}
			return tabSpecialData;			
		}
		*/
		
		/// <summary>
		/// ���ƶ���������Ԫ�صĶ�����Ϣ���ڡ�
		/// </summary>
		/// <param name="BoardID">�������������</param>
		/// <param name="strXMLPath">��Ű�鶨����Ϣ��XML�ļ�·��</param>
		/// <param name="strSpecial">������Special�ֶε��ڡ�</param>
		/// <returns></returns>
		public static DataTable GetSpecialData_BoardID(int BoardID, string strXMLPath, string strSpecial)
		{
			DataTable tabSpecialData = new DataTable();
			tabSpecialData.Columns.Add("Title");
			tabSpecialData.Columns.Add("Tag");
				
			try
			{
				XmlDocument doc = new XmlDocument();
				doc.Load(strXMLPath);

				XmlNodeList nodeList;
				nodeList=doc.SelectNodes("/NewDataSet/Board[BoardID='" + BoardID.ToString() + "']/Special"); 
				
				foreach (XmlNode SpecialData in nodeList)
				{                
					DataRow newRow  = tabSpecialData.NewRow(); 
					newRow["Title"] = SpecialData.ChildNodes[0].InnerText;
					newRow["Tag"] = GetStrInTag(strSpecial, SpecialData.ChildNodes[1].InnerText);
					tabSpecialData.Rows.Add(newRow);
				}
			}
			catch
			{
			}
			return tabSpecialData;
		}		

		/// <summary>
		/// ��ָ���꡼�ڵ��ı�
		/// </summary>
		/// <param name="Str">�ı�Դ</param>
		/// <param name="Tag">�꡼</param>
		/// <returns></returns>
		public static string GetStrInTag(string Str,string Tag)
		{
			int intStart = Str.IndexOf("<" + Tag + ">");
			int intEnd	 = Str.IndexOf("</" + Tag + ">");
			if(intStart == -1 || intEnd == -1)
				return "";
			return Str.Substring(intStart + Tag.Length + 2, intEnd - intStart - Tag.Length - 2);
		}
		#endregion
		
		#region �ⲿ�ֺ�����Ҫ��
		/// <summary>
		/// �񡼵���ֵ,�޽�O�򷵻�null(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="com">Sql�������</param>
		/// <returns></returns>
		public static object getDataScalar(SqlCommand com)
		{
			object result=null;
			try
			{
				com.Connection.Open();
				result=com.ExecuteScalar();
			}
			finally
			{
				com.Connection.Close();
			}
			return result;
		}

		/// <summary>
		/// ��һ������,�޽�O���ؿ���(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="com">Sql�������</param>
		/// <returns></returns>
		public static DataRow getDataRow(SqlCommand com)
		{
			DataTable dt = getDataTable(com);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return dt.NewRow();
		}

		/// <summary>
		/// ��һ�����ݱ��,�޽�O���ؿձ�(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="sql">Sql�������</param>
		/// <returns></returns>
		public static DataTable getDataTable(SqlCommand com)
		{
			DataSet  ds = getDataSet(com);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}
				
		/// <summary>
		/// ��һ�����ݼ�,�޽�O���ؿյ����ݼ�(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="sql">Sql�������</param>
		/// <returns></returns>
		public static DataSet getDataSet(SqlCommand com)
		{
			SqlDataAdapter ad=new SqlDataAdapter(com);
			DataSet ds=new DataSet();
			ad.Fill(ds);
			return ds;
		}
			
		/// <summary>
		/// ִ��һ��Sql��ѯ���(��ʱ��Ҫ���������,��ExecuteNonQuery)
		/// </summary>
		/// <param name="sql">Sql��ѯ���</param>
		public static void ExecuteSQL(string sql)
		{
			SqlConnection con=new SqlConnection(WriteConnectionStr());
			SqlCommand com=new SqlCommand(sql,con);
			try
			{
				con.Open();
				com.ExecuteNonQuery();
			}
			finally
			{
				con.Close();
			}
		}	
	
		/// <summary>
		/// ִ��Sql�������(��ʱ��Ҫ���������,��ExecuteNonQuery)
		/// </summary>
		/// <param name="com">Sql�������</param>
		public static void ExecuteCommand(SqlCommand com)
		{
			try
			{
				com.Connection.Open();
				com.ExecuteNonQuery();
			}
			finally
			{
				com.Connection.Close();
			}
		}			
			
		/// <summary>
		/// ��һ��Sql�������,�������������Ϊ�洢����(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="StrdPrcdrName">�洢������</param>
		/// <returns></returns>		
		public static SqlCommand getSqlComOfStrdPrcdr(string StrdPrcdrName)
		{
			SqlConnection con=new SqlConnection(Data.WriteConnectionStr());
			SqlCommand com=new SqlCommand(StrdPrcdrName,con);
			com.CommandType=CommandType.StoredProcedure;
			return com;
		}		
		
		/// <summary>
		/// ִ�д洢����(��ʱ��Ҫ���������,��ExecuteNonQuery)
		/// </summary>
		/// <param name="com">�洢������</param>
		public static void ExecuteStrdPrcdr(string StrdPrcdrName)
		{
			SqlCommand com = Data.getSqlComOfStrdPrcdr(StrdPrcdrName);
			try
			{
				com.Connection.Open();
				com.ExecuteNonQuery();
			}
			finally
			{
				com.Connection.Close();
			}
		}
		#endregion


        #region �ƥ��ƾڮw,���\��^�u,���Ѫ�^��
        /// <summary>
        /// �ƥ��ƾڮw
        /// </summary>
        /// <param name="databasename">�n�ƥ����ƾڷ��W��</param>
        /// <param name="backuptodatabase">�ƥ��쪺�ƾڮw���W�٤θ��|</param>
        /// <returns></returns>
        public static bool BackUpDataBase(string databasename, string backuptodatabase)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WriteConnectionStr();
            conn.Open();


            string procname;
            string name = databasename + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Date.Day.ToString() + DateTime.Now.Minute.ToString();

            //�R���޿�ƥ��]�ơA�����|�R���ƥ����ƾڮw���
            procname = "sp_dropdevice";
            SqlCommand sqlcmd1 = new SqlCommand(procname, conn);
            sqlcmd1.CommandType = CommandType.StoredProcedure;

            SqlParameter sqlpar = new SqlParameter();
            sqlpar = sqlcmd1.Parameters.Add("@logicalname", SqlDbType.VarChar, 20);
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = databasename;

            //�p�G�޿�]�Ƥ��s�b�A���h���~
            try
            {
                sqlcmd1.ExecuteNonQuery();
            }
            catch
            {
            }

            //�޿�]��
            procname = "sp_addumpdevice";
            SqlCommand sqlcmd2 = new SqlCommand(procname, conn);
            sqlcmd2.CommandType = CommandType.StoredProcedure;

            sqlpar = sqlcmd2.Parameters.Add("@devtype", SqlDbType.VarChar, 20);
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = "disk";


            sqlpar = sqlcmd2.Parameters.Add("@logicalname", SqlDbType.VarChar, 20);//
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = databasename;

            sqlpar = sqlcmd2.Parameters.Add("@physicalname", SqlDbType.NVarChar, 260);//
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = backuptodatabase + name + ".bak";


            try
            {
                int i = sqlcmd2.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                string str = err.Message;
            }

            //
            string sql = "BACKUP DATABASE " + databasename + " TO " + databasename + " WITH INIT";
            SqlCommand sqlcmd3 = new SqlCommand(sql, conn);
            sqlcmd3.CommandType = CommandType.Text;
            try
            {
                sqlcmd3.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                string str = err.Message;
                conn.Close();

                return false;
            }

            conn.Close();//
            return true;

        }
        #endregion    
	}

	#endregion

	#region �o�̧t��Jeason�w�q����k
	/// <summary>
	/// Ӧ�÷�����
	/// </summary>
	public class Methods
	{
		#region Jeason�K�[����k
		/// <summary>
		/// �趨dropdownlist�ؼ���ʾ�趨��
		/// </summary>
		/// <param name="DDL"></param>
		/// <param name="ChangeVal"></param>
        private static Hashtable hprocess ;
        private static Hashtable hcustomerProcess ;
        public static string GenerateUniqueId()
        {
            return Guid.NewGuid().ToString();
        }

        public static void DropDownListChange(DropDownList DDL,string ChangeVal)
		{
			for(int i=0;i<DDL.Items.Count;i++)
			{
				DDL.Items[i].Selected = false;
			}

			for(int i=0;i<DDL.Items.Count;i++)
			{
				if (DDL.Items[i].Value.Equals(ChangeVal.Trim()))
				{
					DDL.Items[i].Selected = true;
					break;
				}
			}
		}

        public static void DropDownTextChange(DropDownList DDL, string ChangeTxt)
        {
            for (int i = 0; i < DDL.Items.Count; i++)
            {
                DDL.Items[i].Selected = false;
            }

            for (int i = 0; i < DDL.Items.Count; i++)
            {
                if (DDL.Items[i].Text.Equals(ChangeTxt))
                {
                    DDL.Items[i].Selected = true;
                    break;
                }
            }
        }

		public static void DropDownListInit(DropDownList DDL,int minValue,int MaxValue)
		{
			DDL.Items.Clear();

			for(int i=minValue;i<=MaxValue;i++)
			{
				ListItem li = new ListItem(i.ToString(),i.ToString());
				DDL.Items.Add(li);
			}			
		}

		public static void TextBoxDate(DatePicker tb,string txtValue)
		{
			tb.Text = txtValue;
		}
		
		public static void YearDropDownListInit(DropDownList DDL)
		{
			DDL.Items.Clear();
			int year = DateTime.Now.Year;

			for(int i=year+2;i>=2001;i--)
			{
				ListItem li = new ListItem(i.ToString(),i.ToString());
				DDL.Items.Add(li);
			}
		}

		public static void MonthDropDownListInit(DropDownList DDL)
		{
			DDL.Items.Clear();
			for(int i=1;i<=12;i++)
			{
				ListItem li = new ListItem(i.ToString(),i.ToString());
				DDL.Items.Add(li);
			}
		}

		public static void MinuteDropDownListInit(DropDownList DDL)
		{
			DDL.Items.Clear();
			for(int i=0;i<12;i++)
			{
				int val = i * 5;
				ListItem li = new ListItem(val.ToString(),val.ToString());
				DDL.Items.Add(li);
			}
		}

        public static void EveryMinuteDropDownListInit(DropDownList DDL)
        {
            DDL.Items.Clear();
            int drpmin = 1;
            ListItem li = new ListItem();
            if (System.Configuration.ConfigurationSettings.AppSettings["drpmin"] != null)
            {
                try
                {
                    drpmin = Convert.ToInt32(System.Configuration.ConfigurationSettings.AppSettings["drpmin"]);
                }

                catch { }
            }
            for (int i = 0; i < 60; i++)
            {
                if (i % drpmin == 0)
                {
                    li = new ListItem(i.ToString(), i.ToString());
                    DDL.Items.Add(li);
                }
            }
        }

		public static string FormatMinuteToDayHourMinute(int minutes,int hoursperday)
		{
			int Day = (int)(minutes/(60*hoursperday));
			int Hour = (int)(minutes%(60*hoursperday)/60);
			int Minutes = (int)(minutes%(60*hoursperday)%60);
			return string.Format("{0}d{1}:{2}",Day,Hour,Minutes);
		}

		public static string FormatMinuteToDDHHMM(int minutes,int hoursperday)
		{
			int Day = (int)(minutes/(60*hoursperday));
			int Hour = (int)(minutes%(60*hoursperday)/60);
			int Minutes = (int)(minutes%(60*hoursperday)%60);
			return string.Format("{0}D{1}H{2}M",Day,Hour,Minutes);
		}

		public static string FormatMinuteToHours(int minutes)
		{
			int Hour = minutes / 60;
			int Mins = minutes % 60;
			return string.Format("{0}��{1}��",Hour,Mins);
		}

        public static string TranslateProcessListName(string processlist)
        {

            string newprocess = "";
            string[] il = processlist.Split('/');
            for (int i = 0; i < il.Length; i++)
            {
                if (il[i] != null && !il[i].Trim().Equals(""))
                {
                    newprocess += Methods.TranslateProcessName(il[i].ToString().Trim()) + "/";
                }
            }
            if (newprocess.Length > 0)
            {
                newprocess = newprocess.Substring(0, newprocess.Length - 1);
            }

            return newprocess;
          
        }
		public static string TranslateProcessName(string processid)
		{
            if (hprocess == null)
            {
                hprocess = new ModuleWorkFlow.BLL.Process().GetProcessIdProcess();
            }
			
            if (hcustomerProcess == null)
            {
                hcustomerProcess = new ProcessCustomer().GetCustomerProcessIdProcess();
            }
             
			if (hprocess.ContainsKey(processid))
			{
				return ((ProcessInfo) hprocess[processid]).ProcessName;
			}
			else
			{
                if (hcustomerProcess.ContainsKey(processid))
                {
                    return ((ProcessCustomerInfo)hcustomerProcess[processid]).CustomerProcessName;
                }
                else
                {
                    return processid;
                }
			}
//			int locate = -1;
//			for(int i=0;i<Setting.PROCESSID.Length;i++)
//			{
//				if (processid.Equals(Setting.PROCESSID[i]))
//				{locate = i;}
//			}
//			if (locate != -1)
//			{
//				return Setting.PROCESSNAME[locate];
//			}
//			else
//			{
//				return "";
//			}
		}

		public static string TranslateDesignProcessName(string processid)
		{

			Hashtable hprocess = new DesignProcess().GetProcessIdProcess();

			if (hprocess.ContainsKey(processid))
			{
				return ((DesignProcessInfo) hprocess[processid]).ProcessName;
			}
			else
			{
				return processid;
			}
		}

		public static string TranslateSupplyName(int supplyid)
		{
			Hashtable hh = new Hashtable();
			hh = new ModuleWorkFlow.BLL.System.Supply().GetsupplyinfoByHashtable();
			if(hh.ContainsKey(supplyid))
			{
				return ((ModuleWorkFlow.Model.System.SupplyInfo)hh[supplyid]).SupplierName;
			}
			else
			{
				return "";
			}
		}

        public static string TransDepartmentName(int departmentid)
        {
            Hashtable hh = new Hashtable();
            hh = new ModuleWorkFlow.BLL.DepartMent().Getalldepartmenthashtable();
            if (hh.ContainsKey(departmentid))
            {
                return hh[departmentid].ToString();
            }
            else
            {
                return Convert.ToString(departmentid);
            }

        }

        public static string TransCustomerName(string CustomerID)
        {
            Hashtable hh = new Hashtable();
            hh = new ModuleWorkFlow.BLL.Customer().getCustomerByIDandall();
            if (hh.ContainsKey(CustomerID))
            {
                return hh[CustomerID].ToString();
            }
            else
            {
                return Convert.ToString(CustomerID);
            }

        }


		public static string TranslateMaterialName(string typeid)
		{
			int locate = -1;
			for(int i=0;i<Setting.MATERIALTYPEID.Length;i++)
			{
				if (typeid.Equals(Setting.MATERIALTYPEID[i]))
				{locate = i;}
			}
			if (locate != -1)
			{
				return Setting.MATERIALTYPENAME[locate];
			}
			else
			{
				return "";
			}
		}

		public static string TranslateStatusName(string statusid)
		{
			int locate = -1;
			for(int i=0;i<Setting.STATUSID.Length;i++)
			{
				if (statusid.Equals(Setting.STATUSID[i]))
				{locate = i;}
			}
			if (locate != -1)
			{
				return Setting.STATUSNAME[locate];
			}
			else
			{
				return "";
			}
		}

		public static string TranslateStatusColor(string statusid)
		{
			int locate = -1;
			for(int i=0;i<Setting.STATUSID.Length;i++)
			{
				if (statusid.Equals(Setting.STATUSID[i]))
				{locate = i;}
			}
			if (locate != -1)
			{
				return Setting.STATUSCOLOR[locate];
			}
			else
			{
				return "";
			}
		}

		public static string TranslateUser_Name(string username)
		{
			Hashtable hh = new Hashtable();
			hh =new User().getUserName();
			if (hh.ContainsKey(username))
			{
				return hh[username].ToString();
			}
			else
			{
				return "";
			}
		}

		public static int getBarcodeProcessLocation(string barcode)
		{
			int ret = -1;
			barcode = barcode.ToUpper();
			for(int i=0;i<Setting.PROCESSBARCODE.Length;i++)
			{
				if (Setting.PROCESSBARCODE[i].Equals(barcode))
				{
					ret = i;
				}
			}
			return ret;
		}

		public static string getACTIONNAME(string actioncode)
		{
			string ret = null;
			switch(actioncode)
			{
				case "KAISHI":
					ret = Setting.ACTIONNAME[0];
					break;
				case "ZANTING":
					ret = Setting.ACTIONNAME[1];
					break;
				case "JIESHU":
					ret = Setting.ACTIONNAME[2];
					break;
			}
			return ret;
		}

		public static void DDL_TranslateProcessName(DataGrid dg, int index)
		{
			for(int i=0; i<dg.Items.Count; i++)
			{
				string processid = dg.Items[i].Cells[index].Text;
				dg.Items[i].Cells[index].Text = TranslateProcessName(processid);
			}
		}

		public static void DDL_FormatMinsToHourMinute(DataGrid dg, int index)
		{
			for(int i=0; i<dg.Items.Count; i++)
			{
				int mins = Convert.ToInt32(dg.Items[i].Cells[index].Text);
				dg.Items[i].Cells[index].Text = FormatMinuteToHours(mins);
			}
		}

		public static void DDL_FormatDateTime(DataGrid dg, int index)
		{
			for(int i=0; i<dg.Items.Count; i++)
			{
				DateTime dt = Convert.ToDateTime(dg.Items[i].Cells[index].Text);
				if (dt.Ticks == 0)
				{
					dg.Items[i].Cells[index].Text = "&nbsp;";
				}
			}
		}

		public static void DDL_TranslateStatusName(DataGrid dg, int index)
		{
			ColorConverter cc = new ColorConverter();
			for(int i=0; i<dg.Items.Count; i++)
			{
				string statusid = dg.Items[i].Cells[index].Text;
				Color c = (Color)cc.ConvertFromString(Methods.TranslateStatusColor(statusid));
				dg.Items[i].Cells[index].BackColor = c;
				dg.Items[i].Cells[index].Text = Methods.TranslateStatusName(statusid);
			}
		}

		#endregion




		#region �����жϺ���
		/// <summary>
		/// �ж������Ƿ��ǹ�����(Article��)
		/// </summary>
		/// <param name="ArticleID"></param>
		/// <returns></returns>
		public static bool IsPublished_Article(int ArticleID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("IsPublished_Article");
			com.Parameters.Add("@ArticleID",SqlDbType.BigInt).Value=ArticleID;
			object Published = Data.getDataScalar(com);
			if (Published == null)
				return false;
			return bool.Parse(Published.ToString());
		}

		/// <summary>
		/// �ж������Ƿ��ǵ����û������(Article��)
		/// </summary>
		/// <param name="UserID"></param>
		/// <param name="ArticleID"></param>
		/// <returns></returns>
		public static bool IsSelf_Article(string UserID,int NewsID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("IsSelf_Article");
			com.Parameters.Add("@ArticleID",SqlDbType.BigInt).Value=NewsID;
			com.Parameters.Add("@SubmitterID",SqlDbType.VarChar,15).Value=UserID;
			
			int count = 0;
			count = (int)Data.getDataScalar(com);
			return count>0;
		}
		
		/// <summary>
		/// �������������ID(News��)
		/// </summary>
		/// <param name="NewsID"></param>
		/// <returns></returns>
		public static int GetBoardID(int NewsID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("GetBoardID");
			com.Parameters.Add("@NewsID",SqlDbType.BigInt).Value=NewsID;
			object BoardID=Data.getDataScalar(com);
			if(BoardID==null)
				return -1;
			return int.Parse(BoardID.ToString());
		}

		/// <summary>
		/// �񡼰����������(��)
		/// </summary>
		/// <param name="BoardID"></param>
		/// <returns></returns>
		public static int GetChannelID(int BoardID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("GetChannelID");
			com.Parameters.Add("@BoardID",SqlDbType.BigInt).Value=BoardID;
			object ChannelID=Data.getDataScalar(com);
			if(ChannelID==null)
				return -1;
			return int.Parse(ChannelID.ToString());
		}

		/// <summary>
		/// �ж������Ƿ����(Article��)
		/// </summary>
		/// <param name="ArticleID"></param>
		/// <returns></returns>
		public static bool Exists_Article(int ArticleID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("Exists_Article");
			com.Parameters.Add("@ArticleID",SqlDbType.BigInt).Value=ArticleID;
			
			int count = 0;
			count = (int)Data.getDataScalar(com);
			return count>0;
		}		

		/// <summary>
		/// �ж���Ϣ�Ƿ����(News��)
		/// </summary>
		/// <param name="NewsID"></param>
		/// <returns></returns>
		public static bool Exists_News(int NewsID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("AppInfo_Exists_News");
			com.Parameters.Add("@NewsID",SqlDbType.BigInt).Value=NewsID;
			
			int count = 0;
			count = (int)Data.getDataScalar(com);
			return count>0;
		}	

		/// <summary>
		/// �жϡ����Ƿ����(NewsComment��)
		/// </summary>
		/// <param name="NewsCommentID"></param>
		/// <returns></returns>
		public static bool Exists_NewsComment(int NewsCommentID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("AppInfo_Exists_NewsComment");
			com.Parameters.Add("@NewsCommentID",SqlDbType.BigInt).Value=NewsCommentID;
			
			int count = 0;
			count = (int)Data.getDataScalar(com);
			return count>0;
		}	
	
		/// <summary>
		/// �ж���Ϣ�Ƿ����Ѿ��˵�(News��)
		/// </summary>
		/// <param name="NewsID"></param>
		/// <returns></returns>
		public static bool IsPublished_News(int NewsID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("AppInfo_IsPublished_News");
			com.Parameters.Add("@NewsID",SqlDbType.BigInt).Value=NewsID;
			object Published = Data.getDataScalar(com);
			if(Published == null)
				return false;
			else 
				return bool.Parse(Published.ToString());
		}

		/// <summary>
		/// �ж���Ϣ�Ƿ��ǵ����û������(News��)
		/// </summary>
		/// <param name="UserID"></param>
		/// <param name="NewsID"></param>
		/// <returns></returns>
		public static bool IsSelf_News(string UserID,int NewsID)
		{
			SqlCommand com=Data.getSqlComOfStrdPrcdr("AppInfo_IsSelf_News");
			com.Parameters.Add("@NewsID",SqlDbType.BigInt).Value=NewsID;
			com.Parameters.Add("@SubmitterID",SqlDbType.VarChar,15).Value=UserID;
			
			int count = 0;
			count = (int)Data.getDataScalar(com);
			return count>0;
		}
		
		#endregion			
		
		#region bbsʹ�÷���
		/// <summary>
		/// ��һ������,���O�����û��С��鿴�Ļ�(News��)
		/// </summary>
		/// <param name="NewsID">����ID</param>
		/// <param name="UserID">�û���</param>
		/// <returns></returns>
		public static string[] getNews(int NewsID,string UserID)
		{
			//News[0]:Title
			//News[1]:Content
			//News[2]:SubmitterID
			//News[3]:SubmitTime
			//News[4]:ViewCount
			string[] News = new string[5];
			string Title="", Content="", SubmitterID="", SubmitTime="", ViewCount="";
			if(Methods.Exists_News(NewsID)==false)
			{
				Title =  Content = "����Ϣ������!";
				News[0] = Title;
				News[1] = Content;
				News[2] = SubmitterID;
				News[3] = SubmitTime;			
				News[4] = ViewCount;
				return News;
			}
			
			SqlCommand com = Data.getSqlComOfStrdPrcdr("AppInfo_GetNewsByNewsID");
			com.Parameters.Add("@NewsID",SqlDbType.BigInt).Value = NewsID;
			com.Connection.Open();
			SqlDataReader dr = com.ExecuteReader();	

			try
			{
				if (dr.Read())
				{
					if(Methods.IsPublished_News(NewsID))
					{	
						#region �Ѿ�����Ϣ			
						Title = dr["Title"].ToString();
						Content = dr["Content"].ToString();
						SubmitterID = dr["SubmitterID"].ToString();
						SubmitTime = dr["SubmitTime"].ToString();
						ViewCount = dr["ViewCount"].ToString();
						#endregion
					}								
					else
					{
						#region δ������Ϣ
						com=Data.getSqlComOfStrdPrcdr("GetRoleID");
						com.Parameters.Add("@UserID",SqlDbType.VarChar,15).Value=UserID;
						com.Parameters.Add("@BoardID",SqlDbType.Int).Value=Settings.StuBoardID;
						object objRoleID=Data.getDataScalar(com); 
						string UserRoleID;
						if (objRoleID != null)
							UserRoleID = objRoleID.ToString();
						else
							UserRoleID = "Information_Vistor";						
						if (UserRoleID == "Information_Admin" || UserRoleID == "Information_Manager" || UserRoleID == "Information_Stuff" 
							|| Methods.IsSelf_News(UserID,NewsID) || UserID == "jandon")
						{
							Title = dr["Title"].ToString();
							Content = dr["Content"].ToString();
							SubmitterID = dr["SubmitterID"].ToString();
							SubmitTime = dr["SubmitTime"].ToString();
							ViewCount = dr["ViewCount"].ToString();
						}
						else
							//�ޡ��쿴����Ϣ
							Title =  Content = "�Բ��������ޡ��쿴����Ϣ!";
						#endregion
					}	
				}	
			}
			catch
			{
				Title =  Content = "����Ϣ������!";
			}
			finally
			{
				dr.Close();
				com.Connection.Close();
			}

			News[0] = Title;
			News[1] = Content;
			News[2] = SubmitterID;
			News[3] = SubmitTime;			
			News[4] = ViewCount;
			return News;
		}
		
		/// <summary>
		/// ��һ������(News��)
		/// </summary>
		/// <param name="NewsID">����ID</param>
		/// <returns></returns>
		public static string[] getNews(int NewsID)
		{
			return getNews(NewsID,"jandon");
		}

		
		/// <summary>
		/// �ء����ⳤ��
		/// </summary>
		/// <param name="OriginalString">����</param>
		/// <param name="MaxLength">��󳤶�</param>
		/// <returns></returns>
		public static string ShortenString(string OriginalString,int MaxLength) 
		{
			//�����ַ��б�
			string qjChars = "��������?������?��������?��??��������������������-=\\????��������������������������������������	�����������������ơ���¦ã���";	
			qjChars += "??????????��???????????????����";
			string TempString = OriginalString.Replace("&nbsp;","��");
			if (MaxLength > TempString.Length)	
				return OriginalString;			
			
			StringBuilder sb = new StringBuilder();
			bool flag = true;
			int i = 0;
			while (MaxLength > 0 && i < TempString.Length)
			{
                int n = (int)TempString[i];
                if ( (qjChars.IndexOf(TempString[i]) != -1) || (0x4300 <= n && n <= 0x9fa0))
				{
                    sb.Append(TempString[i]);
					i++;
					MaxLength --;
                }
				else
				{
					sb.Append(TempString[i]);
					i++;
					if (flag)
					{
						MaxLength --;						
					}
					flag = !flag;
				}
			}
			return sb.ToString().Replace("��","&nbsp;");
		}
		
		/// <summary>
		/// �ء����ⳤ��,����ʡ�Ժ�
		/// </summary>
		/// <param name="OriginalString">����</param>
		/// <param name="MaxLength">��󳤶�</param>
		/// <returns></returns>
		public static string ShortenString_AddSuspensionPoints(string OriginalString,int MaxLength) 
		{ 
			string strOriginalString = OriginalString;
			string strShortString = ShortenString(OriginalString,MaxLength);
			if(strOriginalString.Length > strShortString.Length)
			{
				return strShortString + "...";
			}
			return strShortString;
		}

		
		/*���������ĸ�*/
		public static System.Data.DataTable getRecentOrderSong()
		{
			DataTable dt=Data.getDataTable("select top 1 SongList.Title,SongList.SongID,SongPlayList.SubmitterID,SongPlayList.ToWhom,SongPlayList.HumanType,SongPlayList.Text from SongList,SongPlayList where SongList.SongID=SongPlayList.SongID and SongPlayList.Time>GetDate() order by SongPlayList.Time");
			if (dt.Rows.Count==0)
				dt=Data.getDataTable("select top 1 SongList.Title,SongList.SongID,SongPlayList.SubmitterID,SongPlayList.ToWhom,SongPlayList.HumanType,SongPlayList.Text from SongList,SongPlayList where SongList.SongID=SongPlayList.SongID order by SongPlayList.Time");
			return dt;
		}
		
		#endregion

		#region �����������б�
		/// <summary>
		/// ��ָ��������������б�(News��)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_BoardID(int Count, int MaxLength, int BoardID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE NewsBoardID = {1} AND Published=1 ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// ��ָ���������������б�(News��)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="ChannelID">����ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_ChannelID(int Count, int MaxLength, int ChannelID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} [News].NewsBoardID,[NewsStructure].Title AS BoardTitle,[News].NewsID, [News].Title, [News].SubmitterID, [News].SubmitTime FROM [News],[NewsStructure] WHERE [NewsStructure].ChannelID = {1} AND [NewsStructure].NewsBoardID = [News].NewsBoardID AND [News].Published=1 ORDER BY SubmitTime DESC", Count, ChannelID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// �����������б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <returns></returns>
		public static DataTable GetNewsList(int Count, int MaxLength)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Published=1 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		

		#endregion

		#region ��Ҫ�ŵ����б�
		/// <summary>
		/// ��ָ�����Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Important_BoardID(int Count, int MaxLength, int BoardID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Important = 1 AND Published=1 AND NewsBoardID={1} ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}	
		
		/// <summary>
		/// ��ָ������Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="ChannelID">����ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Important_ChannelID(int Count, int MaxLength, int ChannelID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} [News].NewsBoardID,[NewsStructure].Title AS BoardTitle,[News].NewsID, [News].Title, [News].SubmitterID, [News].SubmitTime FROM [News],[NewsStructure] WHERE [News].Important = 1 AND [NewsStructure].ChannelID = {1} AND [NewsStructure].NewsBoardID = [News].NewsBoardID AND [News].Published=1 ORDER BY SubmitTime DESC", Count, ChannelID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 
		
		/// <summary>
		/// ������Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Important(int Count, int MaxLength)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsStructure.NewsBoardID, NewsStructure.Title as BoardTitle, News.NewsID, News.Title, News.SubmitterID, News.SubmitTime FROM [News],[NewsStructure] WHERE Important = 1 AND Published=1 and News.NewsBoardID=NewsStructure.NewsBoardID ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		

		#endregion
		
		#region ���Ƽ������б�
		/// <summary>
		/// ��ָ������Ƽ������б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Recommended_BoardID(int Count, int MaxLength, int BoardID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Recommended = 1 AND Published=1 AND NewsBoardID={1} ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}	

		/// <summary>
		/// ��ָ�������Ƽ������б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="ChannelID">����ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Recommended_ChannelID(int Count, int MaxLength, int ChannelID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} [News].NewsBoardID,[NewsStructure].Title AS BoardTitle,[News].NewsID, [News].Title, [News].SubmitterID, [News].SubmitTime FROM [News],[NewsStructure] WHERE [NewsStructure].ChannelID = {1} AND [NewsStructure].NewsBoardID = [News].NewsBoardID AND [News].Published=1 AND [News].Recommended = 1 ORDER BY SubmitTime DESC", Count, ChannelID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// �������Ƽ������б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Recommended(int Count, int MaxLength)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Published=1 AND Recommended = 1 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		

		#endregion		

		#region ���Ƽ���Ҫ�ŵ����б�
		/// <summary>
		/// ��ָ������Ƽ���Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Recommended_NotImportant_BoardID(int Count, int MaxLength, int BoardID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Recommended = 1 AND Published=1 AND NewsBoardID={1} AND Important=0 ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}	

		/// <summary>
		/// ��ָ�������Ƽ���Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="ChannelID">����ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Recommended_NotImportant_ChannelID(int Count, int MaxLength, int ChannelID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} [News].NewsBoardID,[NewsStructure].Title AS BoardTitle,[News].NewsID, [News].Title, [News].SubmitterID, [News].SubmitTime FROM [News],[NewsStructure] WHERE [NewsStructure].ChannelID = {1} AND [NewsStructure].NewsBoardID = [News].NewsBoardID AND [News].Published=1 AND [News].Important=0 AND [News].Recommended = 1 ORDER BY SubmitTime DESC", Count, ChannelID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// �������Ƽ���Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Recommended_NotImportant(int Count, int MaxLength)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Published=1 AND Recommended = 1 AND Important=0 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		

		#endregion		

		#region �񡼭��Ƽ���Ҫ�ŵ����б�
		/// <summary>
		/// ��ָ�������Ƽ���Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_NotRecommended_NotImportant_BoardID(int Count, int MaxLength, int BoardID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Recommended = 0 AND Published=1 AND NewsBoardID={1} AND Important=0 ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}	

		/// <summary>
		/// ��ָ���������Ƽ���Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="ChannelID">����ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_NotRecommended_NotImportant_ChannelID(int Count, int MaxLength, int ChannelID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} [News].NewsBoardID,[NewsStructure].Title AS BoardTitle,[News].NewsID, [News].Title, [News].SubmitterID, [News].SubmitTime FROM [News],[NewsStructure] WHERE [NewsStructure].ChannelID = {1} AND [NewsStructure].NewsBoardID = [News].NewsBoardID AND [News].Published=1 AND [News].Important=0 AND [News].Recommended = 0 ORDER BY SubmitTime DESC", Count, ChannelID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// �����­��Ƽ���Ҫ�ŵ����б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <returns></returns>
		public static DataTable GetNewsList_NotRecommended(int Count, int MaxLength)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Published=1 AND Recommended = 0 AND Important=0 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		

		#endregion		

		#region �񡼡��������б�
		/// <summary>
		/// ��ָ����顼�������б�(News��)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Hot_BoardID(int Count, int MaxLength, int BoardID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE ViewCount>{1} AND Published=1 AND NewsBoardID={2} ORDER BY SubmitTime DESC", Count,Settings.HotLimit, BoardID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// ��ָ���������������б�(News��)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="ChannelID">����ID</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Hot_ChannelID(int Count, int MaxLength, int ChannelID)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} [News].NewsBoardID,[NewsStructure].Title AS BoardTitle,[News].NewsID, [News].Title, [News].SubmitterID, [News].SubmitTime FROM [News],[NewsStructure] WHERE [News].ViewCount>{1} AND [NewsStructure].ChannelID = {2} AND [NewsStructure].NewsBoardID = [News].NewsBoardID AND [News].Published=1 ORDER BY SubmitTime DESC", Count,Settings.HotLimit,  ChannelID));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// �񡼡��������б�
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <returns></returns>
		public static DataTable GetNewsList_Hot(int Count, int MaxLength)
		{
			DataTable NewsList = Data.getDataTable(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE ViewCount>{1} AND Published=1 ORDER BY SubmitTime DESC", Count,Settings.HotLimit));
			foreach(DataRow row in NewsList.Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		

		#endregion		
		
		#region �ⲿ�ֺ�����Ҫ��
		/// <summary>
		/// ��ָ��������������б�(News��)(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataSet GetNewsListByBoardID(int Count, int MaxLength, int BoardID)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE NewsBoardID = {1} AND Published=1 ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// ��ָ���������������б�(News��)(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="ChannelID">����ID</param>
		/// <returns></returns>
		public static DataSet GetNewsListByChannelID(int Count, int MaxLength, int ChannelID)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} [News].NewsID, [News].Title, [News].SubmitterID, [News].SubmitTime FROM [News],[NewsStructure] WHERE [NewsStructure].ChannelID = {1} AND [NewsStructure].NewsBoardID = [News].NewsBoardID AND [News].Published=1 ORDER BY SubmitTime DESC", Count, ChannelID));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		} 

		/// <summary>
		/// ��ָ�����Ҫ�ʵ����б�(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataSet GetImportantNewsList(int Count, int MaxLength, int BoardID)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Important = 1 AND Published=1 AND NewsBoardID={1} ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}	
		/// <summary>
		/// ������Ҫ�ŵ����б�(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <returns></returns>
		public static DataSet GetImportantNewsList(int Count, int MaxLength)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Important = 1 AND Published=1 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		
		/// <summary>
		/// ��ָ������Ƽ������б�(��ʱ��Ҫ���������)
		/// </summary>
		/// <param name="Count">��񡼵�����</param>
		/// <param name="MaxLength">������󳤶�</param>
		/// <param name="BoardID">���ID</param>
		/// <returns></returns>
		public static DataSet GetRecommendedNewsList(int Count, int MaxLength, int BoardID)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Recommended = 1 AND Published=1 AND NewsBoardID={1} ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}	

        //���Ƽ������б�		
		public static DataSet GetRecommendedNewsList(int Count, int MaxLength)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Published=1 AND Recommended = 1 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		
		
		//ָ���ο顼�������б�
		public static DataSet GetHotNewList(int Count, int MaxLength, int BoardID)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE ViewCount>5 AND Published=1 AND NewsBoardID={1} ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}
		//���лο顼�������б�
		public static DataSet GetHotNewList(int Count, int MaxLength)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE ViewCount>5 AND Published=1 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}
		#endregion
	}
	#endregion
}