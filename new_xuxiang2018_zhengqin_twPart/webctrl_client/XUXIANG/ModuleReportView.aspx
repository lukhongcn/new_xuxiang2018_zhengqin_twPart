<%@ Page language="c#" Codebehind="ModuleReportView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModuleReportView" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>機台故障設定</title>
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
							<TABLE id="Table_Condition1" cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server">
								<tr>
									<td colSpan="4"><B>請填入以下信息</B>
										<asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td>選擇客戶</td>
									<td><asp:dropdownlist id="dpl_customerId" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<TD>模具單號選擇</TD>
									<TD><asp:dropdownlist id="dpl_moduleid" Runat="server"></asp:dropdownlist></TD>
								</tr>
								<TR>
									<TD colSpan="4"><asp:button id="Button_AddEdit" runat="server" Text="打印報表"></asp:button><FONT face="新細明體">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</FONT>
										<asp:label id="lab_report" runat="server" Visible="False"></asp:label></TD>
								</TR>
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
