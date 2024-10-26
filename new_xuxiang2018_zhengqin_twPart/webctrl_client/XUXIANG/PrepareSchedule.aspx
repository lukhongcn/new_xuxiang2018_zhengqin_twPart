<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="PrepareSchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PrepareSchedule" %>
<%@ Register TagPrefix="uc1" TagName="MachineGroupSelect" Src="controls/MachineGroupSelect.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PrepareMidView" Src="controls/PrepareMidView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PrepareSmallView" Src="controls/PrepareSmallView.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>創建排程</title>
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
								<td vAlign="top">模具編號&nbsp;
									<asp:textbox id="TextBox_ModuleId" runat="server" ReadOnly="True"></asp:textbox></td>
								<td vAlign="top">開始日期&nbsp;
									<wc:inputcalendar id="Textbox_StartDate" runat="server"></wc:inputcalendar></td>
								<td vAlign="top">T0日期&nbsp;
									<wc:inputcalendar id="Textbox_EndDate" runat="server"></wc:inputcalendar></td>
								<td vAlign="top">T1日期&nbsp;
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
								<td align="center"><asp:button id="Button_ForwardSchedule" runat="server" Text="排程"></asp:button></td>
								<!--<td align="center" ><asp:button id="Button_BackSchedule" runat="server" Text="從後向前排程" Visible="False"></asp:button></td>-->
								<td align="center"><asp:button id="Button_ConfirmSchedule" runat="server" Text="排程確認"></asp:button></td>
								<td align="center"><asp:button id="Button_CancelSchedule" runat="server" Text="排程取消"></asp:button></td>
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
						<table id="table_ScheduleHeader" cellPadding="2" width="100%" border="1" runat="server">
							<tr>
								<td align="center"><asp:button id="Button_MidView" runat="server" Text="中排程"></asp:button></td>
								<td align="center"><asp:button id="Button_SmallView" runat="server" Text="小排程"></asp:button></td>
							</tr>
						</table>
						<uc1:preparemidview id="PrepareMidView" runat="server"></uc1:preparemidview><uc1:preparesmallview id="PrepareSmallView" runat="server"></uc1:preparesmallview></td>
				</tr>
			</TABLE>
		</form>
	</body>
</HTML>
