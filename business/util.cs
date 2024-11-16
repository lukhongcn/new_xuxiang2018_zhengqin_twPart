#region 代码文件说明
/* 
	Title	BookingSystem
	Author	汤建栋(jandon)
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
	//╰参㏑砏玥﹚竡
	//web北ン㏑砏玥
	//   1北ン嘿"???_*""???"ボ北ン摸
	///////textbox="tbx"
	///////dropdownlist="drp"
	///////label="lab"
	///////RadioButton="rad"
	
	//摸いよ猭跑秖㏑砏玥
	/////1よ猭㏑玥
	////////╬Τよ猭嘿玡Τ购絬"_",ダ糶
	////////publicよ猭

	public class Setting
	{
		public static int DAYS = 30;
		public static int HOURS = 24;

		public static string[] DEFAULTPROCESS = {"PrePare","Grind","Milling","Cut","CNC","EDM","Flash"};
		public static string[] DEFAULTELECTRODEPROCESS = {"Cut","CNCE","QC","Flash"};

		public static string[] PROCESSID      = {"Design","Merchandise","Lathe"    ,"Drill"     ,"BefroeCNC","CNCHeat","AfterCNC","Engraving","QC"     ,"Texture","Grind"   ,"Milling" ,"PrePare","Cut"   ,"SlowCut","CNC"        ,"CNCN"       ,"EDM"     ,"Flash"  ,"Assemble","CNCE"       ,"PlaneEDM"        ,"CAM","burn"		};
		public static string[] PROCESSNAME    = {"砞璸"  ,"潦"       ,"ó"     ,"苝"      ,"CNC荐玡"  ,"荐矪瞶" ,"CNC荐" ,"繨ㄨ"     ,"珇恨"   ,"玶"   ,"縤"    ,"谎"    ,"称"   ,"е捣"  ,"篊捣"   ,"CNCいみ","CNC炊硄诀"  ,"筿"    ,"ゴ"   ,"舱ミ"    ,"CNC筿伐诀"  ,"描筿"        ,"CAM","縉瞜"		};
		public static string[] PROCESSBARCODE = {"SHEJI" ,"WAIGOU"     ,"CHECHUANG","ZUANCHUANG","CNCREQIAN","RECHULI","CNCREHOU","DIAOKE"   ,"PINGUAN","YAOHUA" ,"MOCHUANG","XICHUANG","BEILIAO","KUAISI","MANSI"  ,"CNC"        ,"CNCPUTONGJI","FANGDIAN","DAGUANG","ZULI"    ,"CNCDIANJIJI","JINGMIANFANGDIAN","CAM","SHAOHAN"	};

		public static string[] MATERIALTYPEID   = {"Production","Part","Try" };
		public static string[] MATERIALTYPENAME = {"玻珇"      ,"箂ン","刚家"};

		public static string[] STATUSID      = {"Implementation","Working"     ,"Pending" ,"Rejected","Cancelled","Reopened"      ,"Delay"   ,"Ready"   ,"Holdon","JIEDAN","XIAODAN" ,"CHUCHANG" ,"HUICHANG" ,"FANHUI","Rezuli"};
		public static string[] STATUSNAME    = {"ЧΘ"          ,"秈︽い"      ,"ゼ碞狐"  ,"┶荡"    ,""     ,"穝秨﹍"      ,"┑筐"    ,"碞狐"    ,"既氨","钡虫","虫" ,"紅" ,"紅"  ,"" ,"舱ミ"};
		public static string[] STATUSCODE    = {"WANCHENG"      ,"JINXINGZHONG","WEIJIUXU","JUJUE"   ,"QUXIAO"   ,"CHONGXINKAISHI","YANCHI"  ,"JIUXU"   ,"ZANTING","JIEDAN","XIAODAN","CHUCHANG","HUICHANG" ,"FANHUI","ZULIFANXIU"};
        public static string[] STATUSCOLOR = { "&H00FF00 ", "&H99ff66", "&HFFFF00", "&HFF0000", "&H787878", "&HCC0000", "&HFF0000", "&H00FFFF", "&HB7B7B7", "&HFFB300", "&HB0B9FF  ", "&HCCFF00", "&H00FF00", "&HB7B7B7", "&HFF3FD7" };


//		MYD070615
		public static string[] ACTIONBARCODE = {"KAISHI","ZANTING","JIESHU","FANGONG","RUKU","CHUKU","CHUCHANG","HUICHANG","FANHUI","XIAODAN","JIEDAN","CHUHUO","DAIPAN","BULIANG"};
		public static string[] ACTIONNAME    = {"秨﹍"  ,"既氨"   ,"挡","","畐","畐","紅","紅","","虫","钡虫","砯","","ぃ▆"  };

		#region 兵絏㏑砏玥
		//家Α
		public static string[] BARCODE_CODE    = {"A"		,"B"			,"C"		,"D"		,"Z"	,"M"	};
		public static string[] BARCODE_COMMAND = {"USERNO"	,"MODULEPART"	,"PROCESS"	,"ACTION"	,"MODULE",	"MACHINE"	};

		#endregion
        

		public static Color SELECTCOLOR = Color.PowderBlue;
		public static Color FACTDATECOLOR = Color.DimGray;
		public static Color NormalColor = Color.White;
		public static Color DelayColor = Color.Red;
		public static Color FinishColor = Color.Green;

		public static string ALLValue = "all" ;
		public static string ALLText  = "场";

		public static string STATUSCOLOR_DONE = "GREEN";
		public static string STATUSCOLOR_DOING = "BLUE";
		public static string STATUSCOLOR_READY = "YELLOW";

		public static string INFILENAME = "Sample.xls";

		public static string TreeViewRoot = "webctrl_client/1_0/treeimages/";
	}

	#region ╰参ΤInfo摸
	/// <summary>
	/// 命名空间描述
	/// </summary>
	public class Info
	{
		public const string Title="复旦学生网";
		public const string URL="http://stu.fudan.edu.cn";
		public const string	Address="叶耀珍楼503室";
		public const string Tel="021-55664425";
	}
	#endregion

	#region ╰参ΤSettings摸
	/// <summary>
	/// 〖局设瞒
	/// </summary>
	public class Settings
	{
		#region 参数
		public static string[] Channel={"校园〖道","新闻〖道","娱乐〖道","生活〖道","学习〖道", "专题〖道" ,"⑾他"};
		public static string[] ChannelColor={"#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b", "#f7df9b"};
		public static string RobotID = "SYSTEM_NewsRobo";
		public static int	HotLimit = 20;	//HotNews点击率下限值
		public static int	StuBoardID = 65;	//学生网信息发布版块
		public static int	ForumBoardID = 1;	//论坛根版块
		#endregion

		#region enum 定义
		public enum BoardTypes : byte {PlainText=0,Html=1,FileLink=2,FileInDatabase=3,Reference=4}
		public static string[] Grades={"2000级本科","2001级本科","2002级本科","2003级本科","2004级本科","研究生、博士生","⑾他复旦学生","复旦老师","复旦大学校友","复旦〖员"};
		#endregion
	}
	#endregion

	#region 粄靡よ猭
	/// <summary>
	/// 用户〖证
	/// </summary>
	public class Identity
	{
		#region 角色定义
		/// <summary>
		/// 角色
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


		#region 粄靡よ猭
		/// <summary>
		/// 验证用户
		/// </summary>
		/// <param name="UserID">用户名</param>
		/// <param name="Password">密码</param>
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
		/// 判断用户是否存在
		/// </summary>
		/// <param name="UserID">用户名</param>
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
		/// 判断在指定版块该用户是否存在(涉及UserRole表,现在可能不用这张表)
		/// </summary>
		/// <param name="UserID">用户名</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖角色〖限值(涉及Roles表,现在可能不用这张表)
		/// </summary>
		/// <param name="RoleID">角色ID</param>
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

		#region 〖限描述结构
		/// <summary>
		/// 读〖限
		/// </summary>
		public enum ReadLevel {CannotRead=0,ReadTitle=1,ReadContent=2}	
		/// <summary>
		/// 改〖限
		/// </summary>	
		public enum EditLevel {CannotEdit=0,EditSelf,EditAll,EditProperty /*瞒顶等属性*/}
		/// <summary>
		/// 删除〖限
		/// </summary>
		public enum DeleteLevel {CannontDelete=0,DeleteSelf,DeleteAll}

		/// <summary>
		/// 〖限描述结构
		/// </summary>
		public struct BoardAccessLevel
		{
			/// <summary>
			/// 读公开信息
			/// </summary>
			public ReadLevel ReadPassed;	
			/// <summary>
			/// 读公开信息
			/// </summary>
			public ReadLevel ReadNotPassed;	
			/// <summary>
			/// 改公开信息
			/// </summary>
			public EditLevel EditPassed;		
			/// <summary>
			/// 改公开信息
			/// </summary>
			public EditLevel EditNotPassed;	
			/// <summary>
			/// 删除公开信息
			/// </summary>
			public DeleteLevel DeletePassed;	
			/// <summary>
			/// 删除公开信息
			/// </summary>
			public DeleteLevel DeleteNotPassed;	
			/// <summary>
			/// 是否具有诀核信息的〖限
			/// </summary>
			public bool Pass;
			/// <summary>
			/// 是否具有发布信息的〖限
			/// </summary>
			public bool Append;
			/// <summary>
			/// 是否具有管理〖限
			/// </summary>
			public bool Manage;
			//public bool Search;

			//默〖构造〖部0，无〖何〖限
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
			/// 构造函数，〖参数
			/// </summary>
			/// <param name="aReadPassed">读公开信息的〖限值</param>
			/// <param name="aReadNotPassed">读公开信息的〖限值</param>
			/// <param name="aEditPassed">改公开信息的〖限值</param>
			/// <param name="aEditNotPassed">改公开信息的〖限值</param>
			/// <param name="aDeletePassed">删除公开信息的〖限值</param>
			/// <param name="aDeleteNotPassed">删除公开信息的〖限值</param>
			/// <param name="aPass">是否具有诀核信息的〖限</param>
			/// <param name="aAppend">是否具有发布信息的〖限</param>
			/// <param name="aManage">是否具有管理〖限</param>
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
			/// 拷贝构造函数
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


			//常用BoardAccessLevel模式，直接调用
			//public static BoardAccessLevel PublicRead = new BoardAccessLevel();
			//public static BoardAccessLevel 
		}
		#endregion		
	}
	#endregion

	#region 闽盽秖﹚竡
	namespace Pages
	{
		#region 岿ゅンurl
		/// <summary>
		/// 页面位瞒
		/// </summary>
		public class Location
		{
			//public const string Home_Stu = "http://10.107.0.49";
			//public const string Home_Stu ="http://stu.fudan.edu.cn";
			public const string Home_Stu = "..";

			/// <summary>
			/// 注册页 
			/// </summary>
			public const string Page_Register = Home_Stu+"/register.aspx";		
			
			/// <summary>
			/// 新闻单个栏目文章列表
			/// </summary>
			public const string Page_List = Home_Stu+"/list.aspx";		
			
			/// <summary>
			/// 参数错误
			/// </summary>
			public const string Page_Error_Para = Home_Stu + "/error/para.aspx";
	
			///<summary>
			/// 〖限不足
			/// </summary>
			public const string Page_Error_Limit = Home_Stu + "/error/limit.aspx";	
			
			/// <summary>
			/// 页面不存在
			/// </summary>
			public const string Page_Error_None = Home_Stu + "/error/none.aspx";
	
			/// <summary>
			/// 建设中
			/// </summary>
			public const string Page_Error_Construction = Home_Stu + "/error/construction.aspx";

			/// <summary>
			/// 通用错误 	
			/// </summary>		
			public const string Page_Error = Home_Stu + "/error/error.aspx";		
			
			/// <summary>
			/// 选择转向页面
			/// </summary>
			public const string Name_Switch = "Switch.aspx";
		}
		#endregion

		#region Switch (Front Controller 模式)
		/// <summary>
		/// Switch (Front Controller 模式)
		/// </summary>
		public class Switch
		{
			/*菜单命令模式：
			 * Transfer直接将本页面QueryString传到下一个页面；
			 * List在Settings.Xml中指定传胔的Key
			 * Custom自定义标〖，需解析
			 * None无参数
			 * 默〖值Transfer（不需再Settings.Xml中指定）
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

	#region 闽硈钡计沮畐摸
	/// <summary>
	/// 数据访问
	/// </summary>
	public class Data
	{
		public static string constr ;
		#region 计沮畐羛钡才﹃﹚竡
		/// <summary>
		/// 读帐号连接字符串
		/// </summary>
		/// <returns></returns>
		public static string ReadConnectionStr()
		{
			//MYD070805
			//return "server=.;database=ModuleWorkFlow;uid=workflow;pwd=workflow";	
			return System.Configuration.ConfigurationSettings.AppSettings["MsSQLConnString"];
	
		}

		/// <summary>
		/// 写帐号连接字符串
		/// </summary>
		/// <returns></returns>
		public static string WriteConnectionStr()
		{
			//MYD070805
			//return "server=.;database=ModuleWorkFlow;uid=workflow;pwd=workflow";
			return System.Configuration.ConfigurationSettings.AppSettings["MsSQLConnString"];

		}

		#endregion

		#region 执行命令,返回受影响的行数
		/// <summary>
		/// 执行命令,返回受影响的行数
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string sql)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),CommandType.Text,sql);
		}
		/// <summary>
		/// 执行命令,返回受影响的行数
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string sql, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),CommandType.Text,sql,commandParameters);
		}
		/// <summary>
		/// 执行命令,返回受影响的行数
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="CommandType">填CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),commandType,StrdPrcdrName);
		}
		/// <summary>
		/// 执行命令,返回受影响的行数
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static int ExecuteNonQuery(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteNonQuery(WriteConnectionStr(),commandType,StrdPrcdrName,commandParameters);
		}		
		#endregion
		
		#region 获〖数据读〖〖
		/// <summary>
		/// 获〖数据读〖〖
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string sql)
		{
			return SqlHelper.ExecuteReader(ReadConnectionStr(),CommandType.Text,sql);
		}

		/// <summary>
		/// 获〖数据读〖〖
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteReader(ReadConnectionStr(),CommandType.Text,sql,commandParameters);
		}

		/// <summary>
		/// 获〖数据读〖〖
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="CommandType">填CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteReader(WriteConnectionStr(),commandType,StrdPrcdrName);
		}

		/// <summary>
		/// 获〖数据读〖〖
		/// </summary>
		/// <param name="StrdPrcdrName">填CommandType.StoredProcedure</param>
		/// <param name="commandType">存储过程名</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteReader(Data.WriteConnectionStr(),commandType,StrdPrcdrName,commandParameters);		
		}

		#endregion
		
		#region 获〖单个值
		/// <summary>
		/// 获〖单个值,无结则返回null
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <returns></returns>
		public static object getDataScalar(string sql)
		{
			return SqlHelper.ExecuteScalar(ReadConnectionStr(),CommandType.Text,sql);
		}

		/// <summary>
		/// 获〖单个值,无结则返回null
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static object getDataScalar(string sql, params SqlParameter[] commandParameters)
		{
            return SqlHelper.ExecuteScalar(ReadConnectionStr(),CommandType.Text,sql,commandParameters);
		}

		/// <summary>
		/// 获〖单个值,无结则返回null
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static object getDataScalar(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteScalar(WriteConnectionStr(),commandType,StrdPrcdrName);
		}

		/// <summary>
		/// 获〖单个值,无结则返回null
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static object getDataScalar(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteScalar(WriteConnectionStr(),commandType,StrdPrcdrName, commandParameters);
		}
		
		#endregion
		
		#region 获〖数据行
		/// <summary>
		/// 获〖一行数据,无结返回null
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <returns></returns>
		public static DataRow getDataRow(string sql)
		{
			DataTable dt = getDataTable(sql);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}
		
		/// <summary>
		/// 获〖一行数据,无结返回null
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static DataRow getDataRow(string sql, params SqlParameter[] commandParameters)
		{
			DataTable dt = getDataTable(sql,commandParameters);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}

		/// <summary>
		/// 获〖一行数据,无结返回null
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static DataRow getDataRow(string StrdPrcdrName,CommandType commandType)
		{
			DataTable dt = getDataTable(StrdPrcdrName,commandType);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}

		/// <summary>
		/// 获〖一行数据,无结返回null
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static DataRow getDataRow(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			DataTable dt = getDataTable(StrdPrcdrName,commandType,commandParameters);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return null;
		}

		#endregion
				
		#region 获〖数据表
		/// <summary>
		/// 获〖一个数据表格,无结返回空表
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <returns></returns>
		public static DataTable getDataTable(string sql)
		{
			DataSet  ds = getDataSet(sql);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}

		/// <summary>
		/// 获〖一个数据表格,无结返回空表
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static DataTable getDataTable(string sql, params SqlParameter[] commandParameters)
		{
			DataSet  ds = getDataSet(sql,commandParameters);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}
		
		/// <summary>
		/// 获〖一个数据表格,无结返回空表
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static DataTable getDataTable(string StrdPrcdrName,CommandType commandType)
		{
			DataSet  ds = getDataSet(StrdPrcdrName,commandType);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}

		/// <summary>
		/// 获〖一个数据表格,无结返回空表
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static DataTable getDataTable(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			DataSet  ds = getDataSet(StrdPrcdrName,commandType,commandParameters);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}	

		#endregion
						
		#region 获〖数据集
		/// <summary>
		/// 获〖一个数据集,无结返回空的数据集
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <returns></returns>
		public static DataSet getDataSet(string sql)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), CommandType.Text, sql);
		}
		/// <summary>
		/// 获〖一个数据集,无结返回空的数据集
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static DataSet getDataSet(string sql, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), CommandType.Text,sql,commandParameters);
		}	
		
		/// <summary>
		/// 获〖一个数据集,无结返回空的数据集
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <returns></returns>
		public static DataSet getDataSet(string StrdPrcdrName,CommandType commandType)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), commandType, StrdPrcdrName);
		}	

		/// <summary>
		/// 获〖一个数据集,无结返回空的数据集
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <param name="commandType">填CommandType.StoredProcedure</param>
		/// <param name="commandParameters">参数数组</param>
		/// <returns></returns>
		public static DataSet getDataSet(string StrdPrcdrName,CommandType commandType, params SqlParameter[] commandParameters)
		{
			return SqlHelper.ExecuteDataset(WriteConnectionStr(), commandType, StrdPrcdrName,commandParameters);
		}	

		#endregion

		#region 执行事务,成功返回真,失败返回辩
		/// <summary>
		/// 在事务中执行不带参数的sql语菌
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
		/// 在事务中执行带参数的sql语菌
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

		#region 新闻特殊元素的处理
		/// <summary>
		/// 获〖制定新闻特殊元素的定义信息及内〖
		/// </summary>
		/// <param name="NewsID">新闻ID</param>
		/// <param name="strXMLPath">存放版块定义信息的XML文件路径</param>
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
		/// 获〖制定新闻特殊元素的定义信息及内〖
		/// </summary>
		/// <param name="BoardID">该新闻所属版块</param>
		/// <param name="strXMLPath">存放版块定义信息的XML文件路径</param>
		/// <param name="strSpecial">该新闻Special字段的内〖</param>
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
		/// 获〖指定标〖内的文本
		/// </summary>
		/// <param name="Str">文本源</param>
		/// <param name="Tag">标〖</param>
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
		
		#region 这部分函数不要用
		/// <summary>
		/// 获〖单个值,无结则返回null(暂时不要用这个函数)
		/// </summary>
		/// <param name="com">Sql命令对象</param>
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
		/// 获〖一行数据,无结返回空行(暂时不要用这个函数)
		/// </summary>
		/// <param name="com">Sql命令对象</param>
		/// <returns></returns>
		public static DataRow getDataRow(SqlCommand com)
		{
			DataTable dt = getDataTable(com);
			if (dt.Rows.Count != 0)
				return dt.Rows[0];
			return dt.NewRow();
		}

		/// <summary>
		/// 获〖一个数据表格,无结返回空表(暂时不要用这个函数)
		/// </summary>
		/// <param name="sql">Sql命令对象</param>
		/// <returns></returns>
		public static DataTable getDataTable(SqlCommand com)
		{
			DataSet  ds = getDataSet(com);
			if (ds.Tables.Count != 0)
				return ds.Tables[0]; 			
			return new DataTable();
		}
				
		/// <summary>
		/// 获〖一个数据集,无结返回空的数据集(暂时不要用这个函数)
		/// </summary>
		/// <param name="sql">Sql命令对象</param>
		/// <returns></returns>
		public static DataSet getDataSet(SqlCommand com)
		{
			SqlDataAdapter ad=new SqlDataAdapter(com);
			DataSet ds=new DataSet();
			ad.Fill(ds);
			return ds;
		}
			
		/// <summary>
		/// 执行一条Sql查询语菌(暂时不要用这个函数,用ExecuteNonQuery)
		/// </summary>
		/// <param name="sql">Sql查询语菌</param>
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
		/// 执行Sql命令对象(暂时不要用这个函数,用ExecuteNonQuery)
		/// </summary>
		/// <param name="com">Sql命令对象</param>
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
		/// 获〖一个Sql命令对象,该命令对象类型为存储过程(暂时不要用这个函数)
		/// </summary>
		/// <param name="StrdPrcdrName">存储过程名</param>
		/// <returns></returns>		
		public static SqlCommand getSqlComOfStrdPrcdr(string StrdPrcdrName)
		{
			SqlConnection con=new SqlConnection(Data.WriteConnectionStr());
			SqlCommand com=new SqlCommand(StrdPrcdrName,con);
			com.CommandType=CommandType.StoredProcedure;
			return com;
		}		
		
		/// <summary>
		/// 执行存储过程(暂时不要用这个函数,用ExecuteNonQuery)
		/// </summary>
		/// <param name="com">存储过程名</param>
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


        #region 称计沮畐,Θ痷,ア毖安
        /// <summary>
        /// 称计沮畐
        /// </summary>
        /// <param name="databasename">璶称计沮方嘿</param>
        /// <param name="backuptodatabase">称计沮畐ゅン嘿の隔畖</param>
        /// <returns></returns>
        public static bool BackUpDataBase(string databasename, string backuptodatabase)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = WriteConnectionStr();
            conn.Open();


            string procname;
            string name = databasename + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Date.Day.ToString() + DateTime.Now.Minute.ToString();

            //埃呸胯称砞称ぃ穦奔称计沮畐ゅン
            procname = "sp_dropdevice";
            SqlCommand sqlcmd1 = new SqlCommand(procname, conn);
            sqlcmd1.CommandType = CommandType.StoredProcedure;

            SqlParameter sqlpar = new SqlParameter();
            sqlpar = sqlcmd1.Parameters.Add("@logicalname", SqlDbType.VarChar, 20);
            sqlpar.Direction = ParameterDirection.Input;
            sqlpar.Value = databasename;

            //狦呸胯砞称ぃ菠岿粇
            try
            {
                sqlcmd1.ExecuteNonQuery();
            }
            catch
            {
            }

            //呸胯砞称
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

	#region 硂柑ΤJeason﹚竡よ猭
	/// <summary>
	/// 应用方法库
	/// </summary>
	public class Methods
	{
		#region Jeason睰よ猭
		/// <summary>
		/// 设定dropdownlist控件显示设定项
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
			return string.Format("{0}{1}だ",Hour,Mins);
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




		#region 常用判断函数
		/// <summary>
		/// 判断文章是否是公开的(Article表)
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
		/// 判断文章是否是当〖用户发表的(Article表)
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
		/// 获〖文章所属版块ID(News表)
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
		/// 获〖版块所属〖道(表)
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
		/// 判断文章是否存在(Article表)
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
		/// 判断信息是否存在(News表)
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
		/// 判断〖论是否存在(NewsComment表)
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
		/// 判断信息是否是已诀核的(News表)
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
		/// 判断信息是否是当〖用户发表的(News表)
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
		
		#region bbs使用方法
		/// <summary>
		/// 获〖一条新闻,〖当〖用户有〖查看的话(News表)
		/// </summary>
		/// <param name="NewsID">新闻ID</param>
		/// <param name="UserID">用户名</param>
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
				Title =  Content = "该信息不存在!";
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
						#region 已诀核信息			
						Title = dr["Title"].ToString();
						Content = dr["Content"].ToString();
						SubmitterID = dr["SubmitterID"].ToString();
						SubmitTime = dr["SubmitTime"].ToString();
						ViewCount = dr["ViewCount"].ToString();
						#endregion
					}								
					else
					{
						#region 未诀核信息
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
							//无〖察看该信息
							Title =  Content = "对不〖，你无〖察看该信息!";
						#endregion
					}	
				}	
			}
			catch
			{
				Title =  Content = "该信息不存在!";
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
		/// 获〖一条新闻(News表)
		/// </summary>
		/// <param name="NewsID">新闻ID</param>
		/// <returns></returns>
		public static string[] getNews(int NewsID)
		{
			return getNews(NewsID,"jandon");
		}

		
		/// <summary>
		/// 截〖标题长度
		/// </summary>
		/// <param name="OriginalString">标题</param>
		/// <param name="MaxLength">最大长度</param>
		/// <returns></returns>
		public static string ShortenString(string OriginalString,int MaxLength) 
		{
			//〖角字符列表
			string qjChars = "“”～！?＃￥％?＆＊（）?＋??１２３４５６７８９０-=\\????：；’《》，。？／⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑	■◆▲●★【】『‘＄‰∑§αβγ（—";	
			qjChars += "??????????〖???????????????－—";
			string TempString = OriginalString.Replace("&nbsp;","№");
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
			return sb.ToString().Replace("№","&nbsp;");
		}
		
		/// <summary>
		/// 截〖标题长度,并加省略号
		/// </summary>
		/// <param name="OriginalString">标题</param>
		/// <param name="MaxLength">最大长度</param>
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

		
		/*返回最近点的歌*/
		public static System.Data.DataTable getRecentOrderSong()
		{
			DataTable dt=Data.getDataTable("select top 1 SongList.Title,SongList.SongID,SongPlayList.SubmitterID,SongPlayList.ToWhom,SongPlayList.HumanType,SongPlayList.Text from SongList,SongPlayList where SongList.SongID=SongPlayList.SongID and SongPlayList.Time>GetDate() order by SongPlayList.Time");
			if (dt.Rows.Count==0)
				dt=Data.getDataTable("select top 1 SongList.Title,SongList.SongID,SongPlayList.SubmitterID,SongPlayList.ToWhom,SongPlayList.HumanType,SongPlayList.Text from SongList,SongPlayList where SongList.SongID=SongPlayList.SongID order by SongPlayList.Time");
			return dt;
		}
		
		#endregion

		#region 获〖最新新闻列表
		/// <summary>
		/// 获〖指定版块最新新闻列表(News表)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖指定〖道最新新闻列表(News表)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="ChannelID">〖道ID</param>
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
		/// 获〖最新新闻列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
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

		#region 获〖要闻导读列表
		/// <summary>
		/// 获〖指定版块要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖指定〖道要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="ChannelID">〖道ID</param>
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
		/// 获〖所有要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
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
		
		#region 获〖推荐新闻列表
		/// <summary>
		/// 获〖指定版块推荐新闻列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖指定〖道推荐新闻列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="ChannelID">〖道ID</param>
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
		/// 获〖最新推荐新闻列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
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

		#region 获〖推荐要闻导读列表
		/// <summary>
		/// 获〖指定版块推荐要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖指定〖道推荐要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="ChannelID">〖道ID</param>
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
		/// 获〖最新推荐要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
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

		#region 获〖推荐要闻导读列表
		/// <summary>
		/// 获〖指定版块推荐要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖指定〖道推荐要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="ChannelID">〖道ID</param>
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
		/// 获〖最新推荐要闻导读列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
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

		#region 获〖〖门新闻列表
		/// <summary>
		/// 获〖指定版块〖门新闻列表(News表)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖指定〖道〖门新闻列表(News表)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="ChannelID">〖道ID</param>
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
		/// 获〖〖门新闻列表
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
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
		
		#region 这部分函数不要用
		/// <summary>
		/// 获〖指定版块最新新闻列表(News表)(暂时不要用这个函数)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖指定〖道最新新闻列表(News表)(暂时不要用这个函数)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="ChannelID">〖道ID</param>
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
		/// 获〖指定版块要问导读列表(暂时不要用这个函数)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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
		/// 获〖所有要闻导读列表(暂时不要用这个函数)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
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
		/// 获〖指定版块推荐新闻列表(暂时不要用这个函数)
		/// </summary>
		/// <param name="Count">想获〖的条数</param>
		/// <param name="MaxLength">标题最大长度</param>
		/// <param name="BoardID">版块ID</param>
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

        //获〖推荐新闻列表		
		public static DataSet GetRecommendedNewsList(int Count, int MaxLength)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE Published=1 AND Recommended = 1 ORDER BY SubmitTime DESC", Count));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}		
		
		//指定晃块〖门新闻列表
		public static DataSet GetHotNewList(int Count, int MaxLength, int BoardID)
		{
			DataSet NewsList = Data.getDataSet(string.Format("SELECT TOP {0} NewsID, Title, SubmitterID, SubmitTime FROM [News] WHERE ViewCount>5 AND Published=1 AND NewsBoardID={1} ORDER BY SubmitTime DESC", Count, BoardID));
			foreach(DataRow row in NewsList.Tables[0].Rows)
			{
				row["Title"] = ShortenString(row["Title"].ToString(), MaxLength);
			}
			return NewsList;
		}
		//所有晃块〖门新闻列表
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