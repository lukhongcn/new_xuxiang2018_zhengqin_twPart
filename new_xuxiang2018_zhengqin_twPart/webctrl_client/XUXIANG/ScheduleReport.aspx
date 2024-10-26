<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ScheduleReport.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ScheduleReport" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>報表導出</title>
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
						<TD vAlign="top" width="79%"><BR>
							<table id="Table_Right" cellPadding="1" width="100%" border="0" runat="server">
								<tr>
									<td>
										<table id="Table_Type" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">選擇報表類型
												</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_ReportType" runat="server" AutoPostBack="True">
														<asp:ListItem Value="small">小日程報表</asp:ListItem>
														<asp:ListItem Value="module">模仁目錄</asp:ListItem>
														<asp:ListItem Value="electrode">電極目錄</asp:ListItem>
														<asp:ListItem Value="barcode">條形碼編碼</asp:ListItem>
														<asp:ListItem Value="elcbarcode">電極條形碼編碼</asp:ListItem>
														<asp:ListItem Value="userbarcode">員工條形碼設定</asp:ListItem>
														<asp:ListItem Value="machinebarcode">機台條形碼設定</asp:ListItem>
													</asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Customer" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">選擇客戶</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Customer" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Module" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">選擇模具</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Module" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Process" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">選擇工序</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Process" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_DepartMent" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">選擇部門</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_DepartMent" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_ConfirmSmallSchedule" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">小排程確認</td>
												<td width="80%"><asp:checkbox id="CheckBox_ConfirmSmallSchedule" Checked="True" Text="只包含確認的小排程" Runat="server"></asp:checkbox></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Date" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">設定日期範圍</td>
												<td width="40%"><wc:inputcalendar id="Textbox_Startdate" runat="server"></wc:inputcalendar></td>
												<td width="40%"><wc:inputcalendar id="Textbox_Enddate" runat="server"></wc:inputcalendar></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table1" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">選擇零件等級</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Level" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><asp:button id="Button_Report" runat="server" Text="創建報表"></asp:button></td>
								</tr>
							</table>
							<br>
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
