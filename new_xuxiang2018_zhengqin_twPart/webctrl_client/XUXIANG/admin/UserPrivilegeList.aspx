<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Page language="c#" Codebehind="UserPrivilegeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserPrivilegeList" %>
<%@ Register TagPrefix="uc1" TagName="UserPrivilegeHeader" Src="controls/UserPrivilegeHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>員工權限設定</title>
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
						<TD vAlign="top" width="79%"><uc1:userprivilegeheader id="UserPrivilegeHeader" runat="server"></uc1:userprivilegeheader><BR>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<TR>
												<td>輸入姓名或卡號</td>
												<td><asp:textbox id="txt_namecard_like" runat="server"></asp:textbox></td>
												<TD><asp:button id="btn_search" runat="server" Text="搜索"></asp:button><asp:label ID="lab_remenber" Runat=server Visible=False></asp:label></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<asp:datagrid id="MainDataGrid" runat="server" PageSize="20" AutoGenerateColumns="False" Width="100%"
								CellSpacing="2" CellPadding="2" AllowPaging="True">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="UserName" HeaderText="員工編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="Name" HeaderText="員工姓名"></asp:BoundColumn>
									<asp:BoundColumn DataField="Password" HeaderText="口令"></asp:BoundColumn>
									<asp:BoundColumn DataField="RoleName" HeaderText="角色"></asp:BoundColumn>
									<asp:BoundColumn DataField="Email" HeaderText="電子郵件"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="系統管理員">
										<ItemTemplate>
											<asp:Label ID="Label_IsAdmin" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isadmin") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="功能">
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "UserPrivilegeAddEdit.aspx?func=edit&userid="+DataBinder.Eval(Container, "DataItem.username") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
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
