<%@ Page language="c#" Codebehind="MiddleDaySchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MiddleDaySchedule" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<HTML>
	<HEAD>
		<title>¡¼¡¼¡¼¥Ü½S¡o¡¼Úx</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<tr>
										<td vAlign="top">¬g¡È¡¼ÂW(T0)<wc:inputcalendar id="TextBox_StartDate" runat="server"></wc:inputcalendar></td>
										<td vAlign="top">¾×¡¼¡¼ÂW(T0)<wc:inputcalendar id="TextBox_EndDate" runat="server"></wc:inputcalendar></td>
										<td vAlign="top"><asp:button id="Button_Search" Text="Ú¨°ª" Runat="server"></asp:button></td>
									</tr>
									<tr>
										<td colSpan="3">
											<div style="OVERFLOW-Y: scroll; FONT-SIZE: 10px; OVERFLOW-X: scroll; WIDTH: 780px; BORDER-TOP-STYLE: ridge; FONT-FAMILY: Arial; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 300px; BORDER-BOTTOM-STYLE: ridge"><asp:panel id="Panel2" runat="server"></asp:panel><FONT id="FONT1" face="¡¼Àé¡¼¯y" runat="server"></FONT></div>
										</td>
									</tr>
									<tr>
										<td colSpan="3">
											<div style="OVERFLOW-Y: scroll; FONT-SIZE: 10px; OVERFLOW-X: scroll; WIDTH: 780px; BORDER-TOP-STYLE: ridge; FONT-FAMILY: Arial; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 300px; BORDER-BOTTOM-STYLE: ridge"><FONT face="¡¼Àé¡¼¯y"></FONT><FONT face="¡¼Àé¡¼¯y"></FONT><asp:panel id="Panel1" runat="server"></asp:panel></div>
										</td>
									</tr>
								</TBODY>
							</TABLE>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>Å÷¡¼</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</TABLE>
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
