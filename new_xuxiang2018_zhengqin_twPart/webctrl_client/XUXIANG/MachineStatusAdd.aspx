<%@ Page language="c#" Codebehind="MachineStatusAdd.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MachineStatusAdd" %>
<%@ Register TagPrefix="uc1" TagName="MachineStatusHeader" Src="controls/MachineStatusHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>生管小排程確認</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
		<script language="javascript" src="js/lib.js"></script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<asp:label id="Label_TotalTime" runat="server" Visible="False"></asp:label>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:machinestatusheader id="MachineStatusHeader" runat="server"></uc1:machinestatusheader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>請填入以下信息</B>
											<asp:label id="Label_HiddenProcessId" runat="server" Visible="False" ForeColor="Red"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%">機台編號</TD>
										<TD width="80%"><asp:textbox id="txt_machineid" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="DropDownList_MachineId" runat="server" Visible="False" AutoPostBack="True"></asp:dropdownlist><asp:label id="Label_MachineInfo" runat="server" ForeColor="Red"></asp:label><asp:button id="btn_machineid" runat="server" Text="機台查詢"></asp:button></TD>
									</TR>
									<TR>
										<TD width="20%">模具編號</TD>
										<TD width="80%"><asp:textbox id="txt_moduleid" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" Visible="False" AutoPostBack="True"></asp:dropdownlist><asp:button id="btn_moduleid" runat="server" Text="模具查詢"></asp:button></TD>
									</TR>
									<TR>
										<TD width="20%">零件編號-ID</TD>
										<TD width="80%"><asp:dropdownlist id="Dropdownlist_Partnoid" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD style="HEIGHT: 16px" width="20%">工序號</TD>
										<TD style="HEIGHT: 16px" width="80%"><asp:dropdownlist id="Dropdownlist_ProcessOrder" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD style="HEIGHT: 17px" width="20%">開始日期</TD>
										<TD style="HEIGHT: 17px" width="80%"><wc:inputcalendar id="Textbox_StartDate" runat="server"></wc:inputcalendar><asp:dropdownlist id="dpl_startHours" runat="server"></asp:dropdownlist>時
											<asp:dropdownlist id="dpl_startMinutes" runat="server">
												<asp:ListItem Value="00">00</asp:ListItem>
												<asp:ListItem Value="30">30</asp:ListItem>
											</asp:dropdownlist>分</TD>
									</TR>
									<TR>
										<TD width="20%">結束日期</TD>
										<TD width="80%"><wc:inputcalendar id="Textbox_EndDate" runat="server"></wc:inputcalendar><asp:dropdownlist id="dpl_endHours" runat="server"></asp:dropdownlist>時
											<asp:dropdownlist id="dpl_endMinutes" runat="server">
												<asp:ListItem Value="00">00</asp:ListItem>
												<asp:ListItem Value="30">30</asp:ListItem>
											</asp:dropdownlist>分</TD>
									</TR>
									<TR>
										<TD>&nbsp;</TD>
										<TD><asp:button id="Button_AddEdit" runat="server" Text="添加"></asp:button></TD>
									</TR>
								</TBODY>
							</TABLE>
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
