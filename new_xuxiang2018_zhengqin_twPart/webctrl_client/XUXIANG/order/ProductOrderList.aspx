<%@ Page language="c#" Codebehind="ProductOrderList.aspx.cs" AutoEventWireup="false" Inherits="PlasticWorkFlow.ProductOrderList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Å±ÂÎ¡¼¡~</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="20%">¶ô¡¼»ÔÄÖ¡¼Ú¨°ª</td>
									<td width="80%"><asp:textbox id="TextBox_key" Width="300px" Runat="server"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="Ú¨°ª"></asp:button></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AllowPaging="True"
								AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="OrderNo" HeaderText="Å±ÂÎÚñ¸¡"></asp:BoundColumn>
									<asp:BoundColumn DataField="CustomerNo" HeaderText="¡¼¡¼"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProductName" HeaderText="¬ÁÏÑ¡¼¼K"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProductNo" HeaderText="¬ÁÏÑÚñ¸¡"></asp:BoundColumn>
									<asp:BoundColumn DataField="CustomerProductNo" HeaderText="¡¼¡¼¬ÁÏÑÚñ¸¡"></asp:BoundColumn>
									<asp:BoundColumn DataField="Color" HeaderText="?¡g"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProductCount" HeaderText="¬ÁÏÑ­pÏü"></asp:BoundColumn>
									<asp:BoundColumn DataField="Materialid" HeaderText="£KÏÑµe­É"></asp:BoundColumn>
									<asp:BoundColumn DataField="SendDate" HeaderText="¡¼ÒÝ¡¼ÂW"></asp:BoundColumn>
									<asp:BoundColumn DataField="IsForcaste" HeaderText="Öv¡¼ºç¡Y"></asp:BoundColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="Úñ¯ã" NavigateUrl='<%# "OrderAddEdit.aspx?func=edit&moduleid="+DataBinder.Eval(Container, "DataItem.moduleid") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id=Hyperlink_DesignSetting runat="server" Text="¡¼ÂW¡¼¡~" NavigateUrl='<%# "OrderDesignInfoSetting.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid") %>'>
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
