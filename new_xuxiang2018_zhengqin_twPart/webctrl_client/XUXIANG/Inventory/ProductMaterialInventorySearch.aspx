<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="ProductMaterialInventoryHeader" Src="controls/ProductMaterialInventoryHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ProductMaterialInventorySearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProductMaterialInventorySearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			function returnVal()
			{
				window.opener.document.forms['Form1'].txt_productmaterialno.value = '<% = productmaterialno %>';
				window.opener.document.forms['Form1'].txt_name.value = '<% = name %>';
				window.opener.document.forms['Form1'].txt_price.value= '<% = price %>';
				window.opener.document.forms['Form1'].txt_unitId.value='<% = type %>';
				window.close();
			}
		</script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
											<tr>
												<td><asp:label id="lab_productmaterialno" runat="server" Text="�쪫�ƽs��"></asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox><FONT face="����">&nbsp;
														<asp:dropdownlist id="dpl_MaterialProduct" runat="server" AutoPostBack="True"></asp:dropdownlist>&nbsp;
													</FONT>
													<asp:button id="btn_search" runat="server" Text="�d��"></asp:button></td>
											</tr>
								</tr>
								<tr>
									<td colSpan="2"><asp:datagrid id="dg_ProductMaterialInventory" runat="server" AllowPaging="True" AutoGenerateColumns="False"
											CellSpacing="2" CellPadding="2">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_id" runat="server">�s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_productmaterialno" runat="server">�쪫�ƽs��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_productmaterialno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productmaterialno")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="name">
													<HeaderTemplate>
														<asp:Label id="dg_header_name" runat="server">�W��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_name" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.name") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="name">
													<HeaderTemplate>
														<asp:Label id="dg_header_price" runat="server">���</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="���">
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_type" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryUnitId")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_type" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryUnitId") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="�襤" HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
										<hr style="COLOR: #ccccff">
										<br>
									</td>
								</tr>
							</TABLE>
						</TD>
					</tr>
			</TABLE>
			</TD></tr></TBODY></TABLE>
			<%=closeWind%>
		</form>
	</body>
</HTML>
