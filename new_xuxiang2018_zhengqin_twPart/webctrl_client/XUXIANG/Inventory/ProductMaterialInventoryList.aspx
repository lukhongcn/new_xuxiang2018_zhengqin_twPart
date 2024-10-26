<%@ Page language="c#" Codebehind="ProductMaterialInventoryList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProductMaterialInventoryList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="ProductMaterialInventoryHeader" Src="controls/ProductMaterialInventoryHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			function showInventoryInfo(id,typeid)
			{
				window.open("InventorybaseInfo.aspx?id="+id+"&ProductMaterialtype="+typeid,"_blank","WIDTH=800,HEIGHT=550,resizable=yes,scrollbars=yes");
			}
		</script>
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
							<uc1:productmaterialinventoryheader id="ProductMaterialInventoryHeader" runat="server"></uc1:productmaterialinventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td>原物料編號或名稱:<asp:TextBox ID="txt_materialProductIdOrNameLike" Runat="server" />&nbsp;
													<asp:Button ID="btnSearch" Text="搜索" Runat="server" />
													<asp:Label id="lab_materialProductIdOrNameLike" runat="server" Visible="False"></asp:Label></td>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label>
												</TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_ProductMaterialInventory" runat="server" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False" AllowPaging="True">
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
															<asp:TemplateColumn HeaderText="englishName" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_englishName" runat="server">英文名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_englishName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EnglishName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_englishName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.englishName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="spec" Visible="False">
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
															<asp:TemplateColumn HeaderText="moduleId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server">圖號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="oldNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_oldNo" runat="server">舊編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_oldNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OldNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_oldNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.oldNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ErpNo" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ErpNo" runat="server">ERP編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ErpNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ErpNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ErpNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ErpNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="looseRate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_looseRate" runat="server">損耗率</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_looseRate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LooseRate")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_looseRate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.looseRate") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productMaterialTypeId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productMaterialTypeId" runat="server">料品類別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productMaterialTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialTypeId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productMaterialTypeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialTypeId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialId" runat="server">材質</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_materialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="inventoryUnitId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inventoryUnitId" runat="server">庫存單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inventoryUnitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryUnitId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inventoryUnitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryUnitId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="perWeight">
																<HeaderTemplate>
																	<asp:Label id="dg_header_perWeight" runat="server">單位重</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_perWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PerWeight")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_perWeight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.perWeight") %>'/>
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
															<asp:TemplateColumn Visible="False" HeaderText="wayCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_wayCount" runat="server">在途量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_wayCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.WayCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_wayCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.wayCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="prodcutCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_prodcutCount" runat="server">在制量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_prodcutCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProdcutCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_prodcutCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.prodcutCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="waitCheckCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_waitCheckCount" runat="server">待?量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_waitCheckCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.WaitCheckCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_waitCheckCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.waitCheckCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="defeatedCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_defeatedCount" runat="server">不良數</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_defeatedCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.DefeatedCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_defeatedCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.defeatedCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="borrowedCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_borrowedCount" runat="server">借調數</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_borrowedCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BorrowedCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_borrowedCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.borrowedCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="usedCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_usedCount" runat="server">已分配量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_usedCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UsedCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_usedCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.usedCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="conceptCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_conceptCount" runat="server">理論存量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_conceptCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ConceptCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_conceptCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.conceptCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="validCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_validCount" runat="server">可使用量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_validCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ValidCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_validCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.validCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="safeCount">
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
															<asp:TemplateColumn Visible="False" HeaderText="inventoryPrice">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inventoryPrice" runat="server">庫存量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inventoryPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryPrice")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inventoryPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryPrice") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="averagePrice">
																<HeaderTemplate>
																	<asp:Label id="dg_header_averagePrice" runat="server">平均進價</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_averagePrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price","{0:0.000}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_averagePrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="expectedDays" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectedDays" runat="server">預交天數</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectedDays" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedDays")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_expectedDays" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedDays") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="lowestInputCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_lowestInputCount" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_lowestInputCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LowestInputCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_lowestInputCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.lowestInputCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="factoryUnitId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factoryUnitId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factoryUnitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryUnitId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_factoryUnitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factoryUnitId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="merchindiseUnitId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseUnitId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseUnitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseUnitId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseUnitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseUnitId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="price">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="merchindiser">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiser" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiser" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Merchindiser")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiser" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiser") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="supplierId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_supplierId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_supplierId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplierId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_supplierId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.supplierId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="otherSpecitifaction">
																<HeaderTemplate>
																	<asp:Label id="dg_header_otherSpecitifaction" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_otherSpecitifaction" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OtherSpecitifaction")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_otherSpecitifaction" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.otherSpecitifaction") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="picture">
																<HeaderTemplate>
																	<asp:Label id="dg_header_picture" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_picture" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Picture")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_picture" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.picture") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="原物料圖片" Visible="False">
																<ItemTemplate>
																	<IMG alt="" src='../<%# DataBinder.Eval(Container, "DataItem.Picture") %>' width="50px" height="50px">
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="操作">
																<ItemTemplate>
																		<a href='#' onclick='javascript:showInventoryInfo("<%#DataBinder.Eval(Container, "DataItem.Id") %>","<%#DataBinder.Eval(Container, "DataItem.productMaterialTypeId") %>")'>
																		出入庫信息</a>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "ProductMaterialInventoryView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;" 
 HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
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
