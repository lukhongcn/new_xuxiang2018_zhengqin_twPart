<%@ Register TagPrefix="uc1" TagName="OrderDesignHeader" Src="controls/OrderDesignHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="OrderDesignList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderDesignList" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�q��]�w</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="Javascript" src="../js/lib.js"></script>
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
						<TD vAlign="top" width="79%"><uc1:orderdesignheader id="OrderDesignHeader" runat="server"></uc1:orderdesignheader>
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td><asp:label id="lab_overStatus" Runat="server" Text="���ת��A"></asp:label><asp:dropdownlist id="dpl_overStatus" Runat="server" AutoPostBack="True">
											<asp:ListItem Value="0">&#160;</asp:ListItem>
											<asp:ListItem Value="1"> ���� </asp:ListItem>
											<asp:ListItem Value="2">������</asp:ListItem>
											<asp:ListItem Value="3">�w����</asp:ListItem>
										</asp:dropdownlist></td>
									<td><asp:label id="lab_orderSingle" Runat="server" Text="�u�O�渹�d��" Visible="False"></asp:label><asp:textbox id="txt_orderSingle" Runat="server" Visible="False"></asp:textbox><asp:button id="btn_search_orderSingle" Runat="server" Text="�d��" Visible="False"></asp:button></td>
								</tr>
								<tr>
									<td>�Ȥ�<asp:dropdownlist id="dpl_customer" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td>��J����r�d��<asp:textbox id="TextBox_key" Runat="server" Width="180px"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="�d��"></asp:button>
										<asp:label id="lab_oldremenber" Runat="server" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td>�������<asp:dropdownlist id="dpl_datetime" Runat="server">
											<asp:ListItem Value="0">&#160;</asp:ListItem>
											<asp:ListItem Value="1">������</asp:ListItem>
											<asp:ListItem Value="2">��f���</asp:ListItem>
										</asp:dropdownlist></td>
									<td>�}�l<wc:inputcalendar id="txt_startdatetime" runat="server"></wc:inputcalendar>
										����<wc:inputcalendar id="txt_endstartdatetime" runat="server"></wc:inputcalendar>
										<asp:button id="btn_referencePictureDate" Runat="server" Text="����d��"></asp:button></td>
								</tr>
								<tr>
									<td><asp:button id="btn_printReferencePictureDate" Runat="server" Text="���L����" Visible="False"></asp:button></td>
									<td><asp:label id="lab_search" Runat="server" Visible="False"></asp:label><asp:label id="lab_searchsingle" Runat="server" Visible="False"></asp:label></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" AllowPaging="True"
								CellSpacing="2" CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProductName" HeaderText="�Ҩ�W��"></asp:BoundColumn>
									<asp:BoundColumn DataField="OrderSingle" HeaderText="�u�O�渹"></asp:BoundColumn>
									<asp:BoundColumn DataField="CustomerId" HeaderText="�Ȥ�"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="trydate0">
										<HeaderTemplate>
											<asp:Label id="dg_header_trydate0" runat="server">�w�w��f���(T0)</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_trydate0" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.trydate0","{0:d}")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�Ϥ�">
										<ItemTemplate>
											<IMG alt="�Ҩ�Ϥ�" src='<%# DataBinder.Eval(Container, "DataItem.FinishPicture") %>' width="50px" height="50px">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<a href='#' onclick='javascript:showModuleInfo("<%#DataBinder.Eval(Container, "DataItem.Id") %>")'>
												�ԲӫH��</a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="�s��" NavigateUrl='<%# "OrderDesignView.aspx?func=edit&moduleid="+DataBinder.Eval(Container, "DataItem.moduleid") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="�R��" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
							<br>
							<asp:datagrid id="DataGridDate" runat="server" Visible="False" Width="100%" AutoGenerateColumns="False"
								AllowPaging="True" CellSpacing="2" CellPadding="2" FooterStyle-Font-Size="10pt" FooterStyle-Font-Bold="True"
								FooterStyle-ForeColor="White" FooterStyle-BackColor="Blue" ShowFooter="True">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProductName" HeaderText="�Ҩ�W��" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="OrderSingle" HeaderText="�u�O�渹"></asp:BoundColumn>
									<asp:BoundColumn DataField="CustomerId" HeaderText="�Ȥ�"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="price">
										<HeaderTemplate>
											<asp:Label id="dg_heard_price" runat="server">���p����</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="SignPrice">
										<HeaderTemplate>
											<asp:Label id="dg_heard_signprice" runat="server">ñ����</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_signprice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.signprice")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="startdate">
										<HeaderTemplate>
											<asp:Label id="dg_heard_startdate" runat="server">������</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_startdate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReferencePictureDate","{0:d}")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="trydate0">
										<HeaderTemplate>
											<asp:Label id="dg_heard_trydatetime0" runat="server">�w�w��f���(T0)</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_trydatetime0" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.trydate0","{0:d}")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="t1">
										<HeaderTemplate>
											<asp:Label ID="dg_heard_t1" Runat="server">T1</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label ID="dg_lab_t1" Runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.trydate1","{0:d}")%>'>
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
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
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
