<%@ Page language="c#" Codebehind="MiddleScheduleCantt.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MiddleScheduleCantt" %>
<%@ Register TagPrefix="esshs" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="PartModifyHeader" Src="controls/PartModifyHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>中日程甘特圖</title>
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
						<TD vAlign="top" align="left" width="20%"></TD>
						<TD vAlign="top" width="1%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD vAlign="top" width="79%"><BR>
							選擇客戶<asp:dropdownlist id="Dropdownlist_Customer" runat="server" AutoPostBack="True"></asp:dropdownlist>
							選擇模具<asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist><br>
							<br>
							<table>
								<tr>
									<td>
										<DIV style="OVERFLOW-Y: scroll; FONT-SIZE: 10px; OVERFLOW-X: scroll; WIDTH: 780px; BORDER-TOP-STYLE: ridge; FONT-FAMILY: Arial; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 400px; BORDER-BOTTOM-STYLE: ridge"><FONT face="新細明體"></FONT><FONT face="新細明體"></FONT><FONT face="新細明體"></FONT><FONT face="新細明體"></FONT><asp:panel id="Panel2" runat="server"></asp:panel><esshs:eventcalendarcontrol id="MiddleCalendarControl" runat="server" XMLData="<NewDataSet><group><name></name><blockcolor>blue</blockcolor></group></NewDataSet>"
												Year="2007" Height="15px"></esshs:eventcalendarcontrol></DIV>
									</td>
								</tr>
							</table>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
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
