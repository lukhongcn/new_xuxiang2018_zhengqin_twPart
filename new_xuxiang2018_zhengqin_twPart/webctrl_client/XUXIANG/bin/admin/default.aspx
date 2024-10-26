<%@ Register TagPrefix="uc2" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc2" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="default.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.AdminMenu" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Welcome to using Module Work Flow System!</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topmargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3">
							<uc2:header id="Header" runat="server"></uc2:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%">
							<uc1:LeftMenu id="LeftMenu" runat="server"></uc1:LeftMenu></TD>
							<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
						請選擇左面菜單功能項執行相應的操作!</TD>
					</TR>
					<TR>
						<TD colSpan="3">
							<uc2:footer id="Footer" runat="server"></uc2:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
