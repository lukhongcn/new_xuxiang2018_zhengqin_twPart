<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ProductMaterialSearch1.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProductMaterialSearch1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			function returnVal()
			{
				window.opener.document.forms['Form1'].txt_materialNo.value = '<% = productmaterialno %>';
				window.opener.document.forms['Form1'].txt_inventoryCount.value = '<% = inventorycount %>';
				
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
												<td><asp:label id="lab_productmaterialno" runat="server" Text="埻昜蹋晤瘍">物料編號查詢</asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox><FONT face="冼極">&nbsp;&nbsp;&nbsp;
													</FONT>
													<asp:button id="btn_search" runat="server" Text="查詢"></asp:button></td>
											</tr>
								</tr>
								<tr>
									<td colSpan="2"><asp:datagrid id="dg_ProductMaterialInventory" runat="server" CellPadding="2" CellSpacing="2"
											AutoGenerateColumns="False" AllowPaging="True">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_productmaterialno" runat="server">原物料編號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_productmaterialno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productmaterialno")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="name">
													<HeaderTemplate>
														<asp:Label id="dg_header_name" runat="server">名稱</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_name" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.name") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_InventoryCount" runat="server">庫存量</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_InventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="選中" HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid><asp:button id="btn_no_material" runat="server" Text="需要採購"></asp:button>
										<hr style="COLOR: #ccccff">
										<br>
									</td>
								</tr>
							</TABLE>
						</TD>
					</tr>
			</TABLE>
			</TD></TR></TBODY></TABLE>
			<%=closeWind%>
		</form>
	</body>
</HTML>
