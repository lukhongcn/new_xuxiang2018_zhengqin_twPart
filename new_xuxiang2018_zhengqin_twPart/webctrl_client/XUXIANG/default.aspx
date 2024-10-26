<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow._default" %>
<%@ Register TagPrefix="uc1" TagName="ModulePartDoingNotInScheduleView" Src="controls/ModulePartDoingNotInScheduleView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ModulePartNotDoInScheduleView" Src="controls/ModulePartNotDoInScheduleView.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>歡迎使用模具工作流管理系統</title>
		<Forum:Style id="Style" runat="server" />
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topmargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">機加工類小排程完成情況查詢!
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="20%">設定條件</td>
									<td width="80%">日期:<wc:inputcalendar id="tbx_Date" runat="server"></wc:inputcalendar>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="查詢"></asp:button></td>
								</tr>
							</table>
							<uc1:ModulePartDoingNotInScheduleView id="modulePartDoingNotInScheduleView" runat="server"></uc1:ModulePartDoingNotInScheduleView>
							<BR>
							<BR>
							<uc1:ModulePartNotDoInScheduleView id="modulePartNotDoInScheduleView" runat="server"></uc1:ModulePartNotDoInScheduleView>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
