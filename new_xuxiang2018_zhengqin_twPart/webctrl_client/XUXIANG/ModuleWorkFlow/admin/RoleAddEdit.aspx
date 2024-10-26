<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RoleHeader" Src="controls/RoleHeader.ascx" %>
<%@ Page language="c#" Codebehind="RoleAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.RoleAddEdit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>¡¼¡g¡¼¡~</title>
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
							<uc1:RoleHeader id="RoleHeader" runat="server"></uc1:RoleHeader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>¥s´c¡¼¡¼¡¼Ã¡¡¼</B>
											<asp:label id="Label_HiddenRoleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%">¡¼¡gÚñ¸¡</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="Textbox_RoleId" name="Textbox_RoleId" />
											<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="¥s¶ô¡¼¡¼¡gÚñ¸¡" ControlToValidate="Textbox_RoleId"></asp:RequiredFieldValidator>
										</TD>
									</TR>
									<TR>
										<TD width="20%">¡¼¡g¡¼¼K</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="Textbox_RoleName" name="Textbox_RoleName" />
											<asp:RequiredFieldValidator id="Requiredfieldvalidator2" runat="server" ErrorMessage="¥s¶ô¡¼¡¼¡g¡¼¼K" ControlToValidate="Textbox_RoleName"></asp:RequiredFieldValidator>
										</TD>
									</TR>
									<TR>
										<TD>¡¼¡g¡¼¡~</TD>
										<TD>
											<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 300px; BORDER-BOTTOM-STYLE: ridge">
												<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
													CellPadding="2">
													<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
													<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
													<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
													<Columns>
														<asp:TemplateColumn HeaderText="¦J©Ú">
															<ItemTemplate>
																<asp:CheckBox runat="server" ID="CheckBox_Select" NAME="CheckBox_Select" Checked="False"></asp:CheckBox>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:BoundColumn DataField="MenuId" HeaderText="¹ÔÂÎÚñ¸¡"></asp:BoundColumn>
														<asp:BoundColumn DataField="MenuName" HeaderText="¹ÔÂÎ¡¼¼K"></asp:BoundColumn>
													</Columns>
												</asp:datagrid></div>
											&nbsp;<asp:CheckBox runat="server" ID="CheckBox_SelectAll" NAME="CheckBox_SelectAll" Checked="False"
												Text="¡¼³õ¦J¡¼" AutoPostBack="True" />
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
