<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ScheduleReport.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ScheduleReport" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>����ɥX</title>
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
												<td width="20%">��ܳ�������
												</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_ReportType" runat="server" AutoPostBack="True">
														<asp:ListItem Value="small">�p��{����</asp:ListItem>
														<asp:ListItem Value="module">�Ҥ��ؿ�</asp:ListItem>
														<asp:ListItem Value="electrode">�q���ؿ�</asp:ListItem>
														<asp:ListItem Value="barcode">���νX�s�X</asp:ListItem>
														<asp:ListItem Value="elcbarcode">�q�����νX�s�X</asp:ListItem>
														<asp:ListItem Value="userbarcode">���u���νX�]�w</asp:ListItem>
														<asp:ListItem Value="machinebarcode">���x���νX�]�w</asp:ListItem>
													</asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Customer" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">��ܫȤ�</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Customer" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Module" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">��ܼҨ�</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Module" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Process" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">��ܤu��</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Process" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_DepartMent" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">��ܳ���</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_DepartMent" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_ConfirmSmallSchedule" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">�p�Ƶ{�T�{</td>
												<td width="80%"><asp:checkbox id="CheckBox_ConfirmSmallSchedule" Checked="True" Text="�u�]�t�T�{���p�Ƶ{" Runat="server"></asp:checkbox></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table id="Table_Date" cellPadding="1" width="100%" border="1" runat="server">
											<tr>
												<td width="20%">�]�w����d��</td>
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
												<td width="20%">��ܹs�󵥯�</td>
												<td width="80%"><asp:dropdownlist id="Dropdownlist_Level" runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><asp:button id="Button_Report" runat="server" Text="�Ыس���"></asp:button></td>
								</tr>
							</table>
							<br>
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
