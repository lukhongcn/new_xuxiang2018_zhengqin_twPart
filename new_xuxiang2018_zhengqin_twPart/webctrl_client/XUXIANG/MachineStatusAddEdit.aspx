<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MachineStatusHeader" Src="controls/MachineStatusHeader.ascx" %>
<%@ Page language="c#" Codebehind="MachineStatusAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MachineStatusAddEdit" %>
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
						<TD vAlign="top" width="79%">
							<uc1:MachineStatusHeader id="MachineStatusHeader" runat="server"></uc1:MachineStatusHeader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>請填入以下信息</B>
											<asp:label id="Label_HiddenMachineId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label>
											<asp:label id="Label_HiddenProcessId" runat="server" Visible="False" ForeColor="Red"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%" style="HEIGHT: 18px">機台編號</TD>
										<TD width="80%" style="HEIGHT: 18px">
											<asp:DropDownList id="DropDownList_MachineId" runat="server" AutoPostBack="True"></asp:DropDownList>
											<asp:label id="Label_MachineInfo" runat="server" ForeColor="Red"></asp:label>
										</TD>
									</TR>
									<TR>
										<TD width="20%">模具編號</TD>
										<TD width="80%"><asp:dropdownlist id="Dropdownlist_ModuleId" runat="server"></asp:dropdownlist>
										</TD>
									</TR>
									<TR>
										<TD width="20%">零件編號</TD>
										<TD width="80%">
											<input id="Textbox_PartNo" onkeyup="type_change(this);" type="text" size="10" name="Textbox_PartNo"
												runat="server">
											<asp:label id="Label_HintPartNoName" runat="server"></asp:label><input id="Text_HiddenPartNo" type="hidden" name="Text_HiddenPartNo">
										</TD>
									</TR>
									<TR>
										<TD width="20%">零件編號-ID</TD>
										<TD width="80%">
											<asp:TextBox ID="Textbox_PartNoId" Runat="server"></asp:TextBox>
										</TD>
									</TR>
									<TR>
										<TD width="20%">日期</TD>
										<TD width="80%">
											<wc:inputcalendar id="Textbox_Date" runat="server"></wc:inputcalendar>
										</TD>
									</TR>
									<TR>
										<TD width="20%" style="HEIGHT: 13px">加工時間</TD>
										<TD width="80%" style="HEIGHT: 13px">
											<asp:dropdownlist id="Dropdownlist_Day" runat="server"></asp:dropdownlist>天
											<asp:dropdownlist id="Dropdownlist_Hour" runat="server"></asp:dropdownlist>小時
											<asp:dropdownlist id="Dropdownlist_Minute" runat="server"></asp:dropdownlist>分
										</TD>
									</TR>
									<TR>
										<TD>&nbsp;</TD>
										<TD><asp:button id="Button_AddEdit" runat="server" Text="Add"></asp:button></TD>
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
