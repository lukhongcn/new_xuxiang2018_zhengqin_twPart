<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Page language="c#" Codebehind="DepartPrivilegeAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.DepartPrivilegeAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="DepartMentPrivilegeHeader" Src="controls/DepartPrivilegeHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>部門權限設定</title>
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
						<TD vAlign="top" width="79%"><uc1:DepartMentPrivilegeHeader id="DepartMentPrivilegeHeader" runat="server"></uc1:DepartMentPrivilegeHeader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>請填入以下信息</B>
											<asp:label id="Label_HiddenDepartId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%">部門名稱</TD>
										<TD width="80%"><asp:textbox id="Textbox_DepartName" Runat="server" name="Textbox_DepartName"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入部門名稱" ControlToValidate="Textbox_DepartName"></asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD width="20%">權限設定</TD>
										<TD width="80%"><asp:datagrid id="DataGridPrivate" runat="server" CellPadding="2" CellSpacing="2" Width="100%"
												AutoGenerateColumns="False">
												<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
												<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
												<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:BoundColumn DataField="menuid" HeaderText="功能項"></asp:BoundColumn>
													<asp:BoundColumn DataField="menuname" HeaderText="功能項描述"></asp:BoundColumn>
													<asp:BoundColumn DataField="url" HeaderText="url" Visible="False"></asp:BoundColumn>
													<asp:TemplateColumn HeaderText="瀏覽">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="Checkbox_PQuery"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="添加">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="CheckBox_PAdd"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="編輯">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="Checkbox_PEdit"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="刪除">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="Checkbox_PDel"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
												</Columns>
											</asp:datagrid></TD>
									</TR>
									<TR>
										<TD width="20%">現場工序<br>
											權限設定</TD>
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
														<asp:TemplateColumn HeaderText="選擇">
															<ItemTemplate>
																<asp:CheckBox runat="server" ID="CheckBox_Select" Checked="False"></asp:CheckBox>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:BoundColumn DataField="Processid" HeaderText="工序" Visible="False"></asp:BoundColumn>
														<asp:BoundColumn DataField="Processname" HeaderText="工序"></asp:BoundColumn>
													</Columns>
												</asp:datagrid>
											</div>
											<asp:CheckBox id="CheckBox_SelectAll" runat="server" Text="全部選中" Checked="False" AutoPostBack="True"></asp:CheckBox>
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
