<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="PrepareSchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PrepareSchedule" %>
<%@ Register TagPrefix="uc1" TagName="MachineGroupSelect" Src="controls/MachineGroupSelect.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PrepareMidView" Src="controls/PrepareMidView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PrepareSmallView" Src="controls/PrepareSmallView.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�ЫرƵ{</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="JavaScript">
			self.moveTo(0,0); 
			self.resizeTo(screen.availWidth,screen.availHeight);
			self.focus(); 
		</script>
		<base target="_self">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td>
						<table id="table2" cellPadding="2" width="100%" border="1">
							<tr>
								<td vAlign="top">�Ҩ�s��&nbsp;
									<asp:textbox id="TextBox_ModuleId" runat="server" ReadOnly="True"></asp:textbox></td>
								<td vAlign="top">�}�l���&nbsp;
									<wc:inputcalendar id="Textbox_StartDate" runat="server"></wc:inputcalendar></td>
								<td vAlign="top">T0���&nbsp;
									<wc:inputcalendar id="Textbox_EndDate" runat="server"></wc:inputcalendar></td>
								<td vAlign="top">T1���&nbsp;
									<wc:inputcalendar id="Textbox_T1" runat="server"></wc:inputcalendar></td>
							</tr>
						</table>
						<table id="tableInfo" cellPadding="2" width="100%" border="1">
							<tr>
								<td align="center"><asp:label id="DateInfo" Runat="server" ForeColor="RED"></asp:label></td>
							</tr>
						</table>
						<table id="table3" cellPadding="2" width="100%" border="1">
							<tr>
								<td align="center"><asp:button id="Button_ForwardSchedule" runat="server" Text="�Ƶ{"></asp:button></td>
								<!--<td align="center" ><asp:button id="Button_BackSchedule" runat="server" Text="�q��V�e�Ƶ{" Visible="False"></asp:button></td>-->
								<td align="center"><asp:button id="Button_ConfirmSchedule" runat="server" Text="�Ƶ{�T�{"></asp:button></td>
								<td align="center"><asp:button id="Button_CancelSchedule" runat="server" Text="�Ƶ{����"></asp:button></td>
							</tr>
						</table>

						<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
							borderColorLight="#000066" border="1">
							<TR vAlign="middle">
								<TD width="15%" height="28">
									<DIV align="center"><B>
											<DIV align="center"><B>����</B></DIV>
										</B>
									</DIV>
								</TD>
								<TD class="msg" width="85%">&nbsp;&nbsp;
									<asp:label id="Label_Message" runat="server"></asp:label></TD>
							</TR>
						</TABLE>
						<table id="table_ScheduleHeader" cellPadding="2" width="100%" border="1" runat="server">
							<tr>
								<td align="center"><asp:button id="Button_MidView" runat="server" Text="���Ƶ{"></asp:button></td>
								<td align="center"><asp:button id="Button_SmallView" runat="server" Text="�p�Ƶ{"></asp:button></td>
							</tr>
						</table>
						<uc1:preparemidview id="PrepareMidView" runat="server"></uc1:preparemidview><uc1:preparesmallview id="PrepareSmallView" runat="server"></uc1:preparesmallview></td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
