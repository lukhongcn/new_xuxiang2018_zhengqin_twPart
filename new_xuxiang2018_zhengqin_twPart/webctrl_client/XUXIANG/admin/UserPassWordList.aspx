<%@ Page language="c#" Codebehind="UserPassWordList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.UserPassWordList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>用戶密碼修改</title>
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
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">用戶密碼修改</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td><asp:label id="lab_UserName" runat="server" Text="用戶編號"></asp:label></td>
												<td><asp:textbox id="txt_UserName" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Name" runat="server" Text="用戶名"></asp:label></td>
												<td><asp:textbox id="txt_Name" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_oldPassWord" runat="server" Text="請輸入舊密碼"></asp:label></td>
												<td><asp:textbox id="txt_oldPassWord" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_newPassWord" runat="server" Text="請輸入新密碼"></asp:label></td>
												<td><asp:textbox id="txt_newPassWord" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="修改"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_UserPassWord" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
														Visible="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="UserName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_UserName" runat="server">用戶編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_UserName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UserName")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="PassWord">
																<HeaderTemplate>
																	<asp:Label id="dg_header_PassWord" runat="server">密碼</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_PassWord" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PassWord")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_PassWord" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PassWord") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="roleId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_roleId" runat="server">roleId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_roleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RoleId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_roleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.roleId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Name">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Name" runat="server">用戶名</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Name" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CardId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CardId" runat="server">卡號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CardId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CardId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CardId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CardId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Email" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Email" runat="server">Email</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Email" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Email")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Email" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Email") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="isAdmin" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_isAdmin" runat="server">isAdmin</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_isAdmin" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsAdmin")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_isAdmin" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isAdmin") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<br>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
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
							</table>
						</TD>
					</tr>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
