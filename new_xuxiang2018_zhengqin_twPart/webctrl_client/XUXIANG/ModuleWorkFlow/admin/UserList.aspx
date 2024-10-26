<%@ Register TagPrefix="uc1" TagName="UserHeader" Src="controls/UserHeader.ascx" %>
<%@ Page language="c#" Codebehind="UserList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserList" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>¡¼¡¼¡¼¡~</title>
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
							<uc1:UserHeader id="UserHeader" runat="server"></uc1:UserHeader><BR>
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="20%">¶ô¡¼»ÔÄÖ¡¼Ú¨°ª</td>
									<td width="80%"><asp:textbox id="TextBox_key" Width="300px" Runat="server"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="Ú¨°ª"></asp:button></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2" AllowPaging="True">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="UserName" HeaderText="¡¼¡¼Úñ¸¡"></asp:BoundColumn>
									<asp:BoundColumn DataField="CardID" HeaderText="¡¼¡¼¡¼¸¡"></asp:BoundColumn>
									<asp:BoundColumn DataField="Name" HeaderText="¡¼¡¼¡É¡¼"></asp:BoundColumn>
									<asp:BoundColumn DataField="Email" HeaderText="±ø¡¼Ïý¡¼"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="¡¼¡¼">
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="Úñ¯ã" NavigateUrl='<%# "UserEdit.aspx?username="+DataBinder.Eval(Container, "DataItem.username") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="¡¼®J" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
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
										<asp:label id="Label_Message" runat="server" Font-Bold=True ForeColor=RED></asp:label></TD>
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
