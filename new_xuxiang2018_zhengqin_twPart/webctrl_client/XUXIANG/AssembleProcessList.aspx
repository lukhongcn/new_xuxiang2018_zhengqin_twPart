<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="AssembleProcessList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.AssembleProcessList" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>�Ҩ�ե߬d��</title>
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
						<TD vAlign="top" width="79%">
							<table id="Table_Header1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc"
								cellPadding="0" width="100%" align="center" borderColorLight="#ccccff" border="1">
								<tr>
									<td width="15%"><asp:label id="Label1" runat="server">�Ȥ�</asp:label></td>
									<td><asp:dropdownlist id="dpl_customerid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td width="15%"><asp:label id="lab_status" runat="server">�եߪ��A</asp:label></td>
									<td width="40%"><asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True">
											<asp:ListItem Value="unzuli">���ե�</asp:ListItem>
											<asp:ListItem Value="zuliing">�եߤ�</asp:ListItem>
											<asp:ListItem Value="overzuli">�����ե�</asp:ListItem>
										</asp:dropdownlist></td>
									<td align="center">
									</td>
									<td width="60%"><asp:dropdownlist id="dpl_moduleid" runat="server" AutoPostBack="True" Visible=False></asp:dropdownlist><asp:button id="btn_search" runat="server" Visible="False" Text="�d��"></asp:button><asp:button id="btn_print" runat="server" Visible="False" Text="���L����"></asp:button></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True"
								CellSpacing="2" CellPadding="2" PageSize="20" Width="100%">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="dg_header_customer" runat="server">�Ȥ�
											</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_customer" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CustomerId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="dg_header_moduleid" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'>
											</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_Moduleid" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�u��" Visible="False">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_Productid" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�եߤu��" Visible="False">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_Count" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FactProcessNeedMinutes") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" runat="server" EditText="�ԲӫH��"></asp:EditCommandColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
							<BR>
							<asp:datagrid id="DataGetdetail" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
								PageSize="20" Width="100%" Visible="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label4" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'>
											</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label2" runat="server">�p�s��s��</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo_Id") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�u��">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label6" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label8" runat="server">���A</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label9" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.IsGet") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label10" runat="server">���</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label11" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.GetTime") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label12" runat="server">�ާ@��</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label13" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.User") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label7" runat="server">����</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label14" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment") %>'>
											</asp:Label>
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
												<DIV align="center"><B>����</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label></TD>
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
