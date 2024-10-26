<%@ Page language="c#" Codebehind="ProjectList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProjectList" %>
<%@ Register TagPrefix="uc1" TagName="ProjectHeader" Src="controls/ProjectHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<HTML>
	<HEAD>
		<title>�Ҩ��ܧ�]�w</title>
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
						<TD vAlign="top" width="79%"><uc1:projectheader id="ProjectHeader" runat="server"></uc1:projectheader>
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="20%">��J����r�d��</td>
									<td width="80%"><asp:textbox id="TextBox_key" Runat="server" Width="300px"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="�d��"></asp:button></td>
								</tr>
							</table>
							<br>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
								CellSpacing="2" CellPadding="2" PageSize="20">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="DisProjectid" HeaderText="�Ҩ��ܧ�s��" Visible="False"></asp:BoundColumn>
									<asp:templatecolumn HeaderText="moduleid">
									<HeaderTemplate>
										<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
										<asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
										</asp:Label>
									</ItemTemplate>
									</asp:templatecolumn>
									<asp:BoundColumn DataField="ModifyId" HeaderText="�׼ҳ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="JDECode" HeaderText="JDE�s��" Visible=False></asp:BoundColumn>
									<asp:BoundColumn DataField="Txyz" HeaderText="Txy" Visible=False></asp:BoundColumn>
									<asp:BoundColumn DataField="createdate" HeaderText="�Ыؤ��" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�\��">
										<ItemTemplate>
											<a href="#" id="view" onclick="javascrit:viewProject('<%#DataBinder.Eval(Container, "DataItem.projectid")%>')">�s��</a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="����EXCEL��" CommandName="OpenExcel" Visible="False"></asp:ButtonColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="�ק�" NavigateUrl='<%# "ProjectEdit.aspx?projectid="+DataBinder.Eval(Container, "DataItem.projectid") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="�R��" CommandName="Delete"></asp:ButtonColumn>
									<asp:BoundColumn DataField="projectid" HeaderText="���ܮѽs��" Visible=False></asp:BoundColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
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
