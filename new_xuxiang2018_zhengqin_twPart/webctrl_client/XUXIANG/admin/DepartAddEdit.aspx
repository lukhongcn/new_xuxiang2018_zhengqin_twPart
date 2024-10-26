<%@ Register TagPrefix="uc1" TagName="DepartHeader" Src="controls/DepartHeader.ascx" %>
<%@ Page language="c#" Codebehind="DepartAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.DepartAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>部門設定</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
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
							<uc1:DepartHeader id="DepartHeader" runat="server"></uc1:DepartHeader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>請填入以下信息</B>
											<asp:label id="Label_HiddenDepartId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%">部門編號</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="Textbox_DepartId" name="Textbox_DepartId" />
											<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入部門編號" ControlToValidate="Textbox_DepartId"></asp:RequiredFieldValidator>
										</TD>
									</TR>
									<TR>
										<TD width="20%">部門名稱</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="Textbox_DepartName" name="Textbox_DepartName" />
											<asp:RequiredFieldValidator id="Requiredfieldvalidator2" runat="server" ErrorMessage="請輸入部門名稱" ControlToValidate="Textbox_DepartName"></asp:RequiredFieldValidator>
										</TD>
									</TR>
									<TR>
										<TD>&nbsp;</TD>
										<TD><asp:button id="Button_AddEdit" runat="server" Text="編輯"></asp:button></TD>
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
