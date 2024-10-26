<%@ Register TagPrefix="uc1" TagName="UserPrivilegeHeader" Src="controls/UserPrivilegeHeader.ascx" %>
<%@ Page language="c#" Codebehind="UserPrivilegeAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserPrivilegeAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>���u�v���]�w</title>
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
						<TD vAlign="top" width="79%"><uc1:userprivilegeheader id="UserPrivilegeHeader" runat="server"></uc1:userprivilegeheader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>�ж�J�H�U�H��</B>
											<asp:label id="Label_HiddenUserId" runat="server" Visible="False" ForeColor="Red"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" Visible="False" ForeColor="Red"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%">���u�s��</TD>
										<TD width="80%"><asp:textbox id="Textbox_UserId" name="Textbox_UserId" Runat="server"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="Textbox_UserId" ErrorMessage="�п�J���u�s��"></asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD width="20%">�f�O</TD>
										<TD width="80%"><asp:textbox id="Textbox_Password" name="Textbox_Password" Runat="server"></asp:textbox><asp:requiredfieldvalidator id="Requiredfieldvalidator3" runat="server" ControlToValidate="Textbox_Password"
												ErrorMessage="�п�J�f�O"></asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD width="20%">����</TD>
										<TD width="80%"><asp:dropdownlist id="DropDownList_Role" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD width="20%">�v���]�w</TD>
										<TD width="80%">
											<asp:datagrid id="DataGridPrivate" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
												CellPadding="2">
												<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
												<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
												<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:BoundColumn DataField="menuid" HeaderText="�\�ඵ"></asp:BoundColumn>
													<asp:BoundColumn DataField="menuname" HeaderText="�\�ඵ�y�z"></asp:BoundColumn>
													<asp:BoundColumn DataField="url" HeaderText="url" Visible="False"></asp:BoundColumn>
													<asp:TemplateColumn HeaderText="�s��">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="Checkbox_PQuery"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�K�[">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="CheckBox_PAdd"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�s��">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="Checkbox_PEdit"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�R��">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="Checkbox_PDel"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
												</Columns>
											</asp:datagrid>
										</TD>
									</TR>
									<TR>
										<TD width="20%">�{���u��<br>
											�v���]�w</TD>
										<TD width="80%">
											<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 200px; BORDER-BOTTOM-STYLE: ridge">
												<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
													CellPadding="2">
													<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
													<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
													<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
													<Columns>
														<asp:TemplateColumn HeaderText="���">
															<ItemTemplate>
																<asp:CheckBox runat="server" ID="CheckBox_Select" Checked="False"></asp:CheckBox>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:BoundColumn DataField="processid" HeaderText="�u��" Visible="False"></asp:BoundColumn>
														<asp:BoundColumn DataField="processname" HeaderText="�u��"></asp:BoundColumn>
													</Columns>
												</asp:datagrid>
											</div>
											<asp:CheckBox id="CheckBox_SelectAll" runat="server" Text="�����襤" Checked="False" AutoPostBack="True"></asp:CheckBox>
										</TD>
									</TR>
									<TR>
										<TD width="20%">�t�κ޲z��</TD>
										<TD width="80%"><asp:radiobuttonlist id="RadioButtonList_IsAdmin" runat="server"></asp:radiobuttonlist></TD>
									</TR>
									<TR>
										<TD>&nbsp;</TD>
										<TD><asp:button id="Button_AddEdit" runat="server" Text="�s��"></asp:button></TD>
									</TR>
								</TBODY>
							</TABLE>
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
