<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="ProductMaterialInventoryHeader" Src="controls/ProductMaterialInventoryHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ProductMaterialInventoryDetail.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProductMaterialInventoryDetail" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
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
						<TD vAlign="top" width="79%"><uc1:productmaterialinventoryheader id="ProductMaterialInventoryHeader" runat="server"></uc1:productmaterialinventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TBODY>
												<tr>
													<td><asp:label id="lab_Zdno" runat="server">料品類別</asp:label><asp:dropdownlist id="dpl_zdno" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<TR>
													<TD align="center" colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:label id="Label1" runat="server" Font-Bold="True">庫存明細表(數量)</asp:label></TD>
												</TR>
												<tr>
													<td colSpan="2"><asp:datagrid id="dg_ProductMaterialInventory" runat="server" AllowPaging="True" AutoGenerateColumns="False"
															CellSpacing="2" CellPadding="2">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn HeaderText="id" Visible="False">
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
																<asp:TemplateColumn HeaderText="specType">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_specType" runat="server">規格型號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_specType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SpecType")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_specType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.specType") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="productMaterialTypeId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_productMaterialTypeId" runat="server">料品類別</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_productMaterialTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Zdno")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_productMaterialTypeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.zdno") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="spec">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_spec" runat="server">規格</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_spec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.spec") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="materialId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_materialId" runat="server">材質</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_materialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialName") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="inventoryUnitId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_inventoryUnitId" runat="server">庫存單位</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_inventoryUnitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TypeName")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_inventoryUnitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.typeName") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="inventoryCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_inventoryCount" runat="server">庫存量</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_inventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_inventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn Visible="False" HeaderText="inventoryPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_inventoryPrice" runat="server">價格</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_inventoryPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryPrice")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_inventoryPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="safeCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_safeCount" runat="server">安全存量</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_safeCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SafeCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_safeCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.safeCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="lowestInputCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_lowestInputCount" runat="server">最小採購數</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_lowestInputCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LowestInputCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_lowestInputCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.lowestInputCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="averagePrice" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_averagePrice" runat="server">平均進價</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_averagePrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AveragePrice")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_averagePrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.averagePrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid></td>
												</tr>
												<tr>
													<td colSpan="2"><asp:button id="btn_print" runat="server" Text="打印報表"></asp:button><asp:label id="lab_print" runat="server" Visible="False"></asp:label>
													</td>
												</tr>
												<tr>
													<td align="center"><asp:label id="Label2" runat="server" Font-Bold="True">庫存明細表(金額)</asp:label></td>
												</tr>
												<tr>
													<td colspan="2">
														<asp:datagrid id="dg_productmaterialinventory1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
															CellSpacing="2" CellPadding="2">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn HeaderText="id" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_id1" runat="server">編號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_id1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="id">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_productmaterialno1" runat="server">原物料編號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_productmaterialno1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productmaterialno")%>'/>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="name">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_name1" runat="server">名稱</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_name1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_name1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.name") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="specType">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_specType1" runat="server">規格型號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_specType1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SpecType")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_specType1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.specType") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="productMaterialTypeId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_productMaterialTypeId1" runat="server">料品類別</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_productMaterialTypeId1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Zdno")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_productMaterialTypeId1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.zdno") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="spec">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_spec1" runat="server">規格</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_spec1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_spec1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.spec") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="materialId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_materialId1" runat="server">材質</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_materialId1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_materialId1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialName") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="inventoryUnitId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_inventoryUnitId1" runat="server">庫存單位</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_inventoryUnitId1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TypeName")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_inventoryUnitId1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.typeName") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="inventoryCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_inventoryCount1" runat="server">庫存量</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_inventoryCount1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_inventoryCount1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn Visible="False" HeaderText="inventoryPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_inventoryPrice1" runat="server">價格</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_inventoryPrice1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryPrice")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_inventoryPrice1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="averagePrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_averagePrice1" runat="server">平均進價</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_averagePrice1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AveragePrice")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_averagePrice1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.averagePrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="totalPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_totalPrice" runat="server">庫存額</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_totalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_totalPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="safeCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_safeCount1" runat="server">安全存量</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_safeCount1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SafeCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_safeCount1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.safeCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="lowestInputCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_lowestInputCount1" runat="server">最小採購數</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_lowestInputCount1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LowestInputCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_lowestInputCount1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.lowestInputCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid></td>
												</tr>
											</TBODY>
										</table>
										<asp:button id="btn_print1" runat="server" Text="打印報表"></asp:button><asp:label id="lab_print1" runat="server" Visible="False"></asp:label></td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center">提示信息</DIV>
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
