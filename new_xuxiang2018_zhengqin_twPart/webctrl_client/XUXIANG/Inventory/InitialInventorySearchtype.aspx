<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="InitialInventoryHeader" Src="controls/InitialInventoryHeader.ascx" %>
<%@ Page language="c#" Codebehind="InitialInventorySearchtype.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Inventory.InitialInventorySearchtype" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ProductMaterialInventorySearchtype</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:initialInventoryheader id="InitialInventoryHeader" runat="server"></uc1:initialInventoryheader><br>
							<hr>
							<FONT face="宋體">
								<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="1">
									<TR>
										<TD><asp:dropdownlist id="dpl_searchtype" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_condition" runat="server"></asp:dropdownlist><asp:textbox id="txt_search" runat="server"></asp:textbox><wc:inputcalendar id="txt_Date" runat="server"></wc:inputcalendar><asp:label id="lab_search" runat="server" Visible="False"></asp:label><asp:label id="lab_typeid" runat="server" Visible="False"></asp:label><asp:button id="btn_add" runat="server" Text="添加條件"></asp:button><asp:button id="btn_clear" runat="server" Text="清空"></asp:button><asp:button id="btn_search" runat="server" Text="查 詢"></asp:button></TD>
									</TR>
									<TR>
										<TD><asp:listbox id="ListBox_search" runat="server" Height="130px" Width="100%" Enabled="False"></asp:listbox></TD>
									</TR>
									<tr>
										<td><asp:button ID="btn_print" Runat="server" Text="打印查詢結果" Visible="False"></asp:button></td>
									</tr>
								</TABLE>
								<hr>
								<table>
									<TR>
										<TD><asp:datagrid id="dg_InitialInventory" runat="server" Width="100%" AllowPaging="True" CellSpacing="2"
												CellPadding="2" AutoGenerateColumns="False">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn Visible="False" HeaderText="id">
														<HeaderTemplate>
															<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="myNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_myNo" runat="server">單號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_myNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MyNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_myNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.myNo") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="productMaterialno">
														<HeaderTemplate>
															<asp:Label id="dg_header_productMaterialNo" runat="server">料品編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_productMaterialNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_productMaterialNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="productMaterialName">
														<HeaderTemplate>
															<asp:Label id="dg_header_productMaterialName" runat="server">料品名稱</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_productMaterialName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_productMaterialName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="inventoryPCS">
														<HeaderTemplate>
															<asp:Label id="dg_header_inventoryPCS" runat="server">入庫編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_inventoryPCS" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryPCS")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_inventoryPCS" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryPCS") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False" HeaderText="shelfNoId">
														<HeaderTemplate>
															<asp:Label id="dg_header_shelfNoId" runat="server">庫位</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_shelfNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ShelfNoId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_shelfNoId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.shelfNoId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="inventoryCount">
														<HeaderTemplate>
															<asp:Label id="dg_header_inventoryCount" runat="server">入庫數量</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_inventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_inventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryCount") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="price">
														<HeaderTemplate>
															<asp:Label id="dg_header_price" runat="server">價格</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="inventoryDate">
														<HeaderTemplate>
															<asp:Label id="dg_header_inventoryDate" runat="server">入庫日期</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_inventoryDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryDate","{0:d}")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_inventoryDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryDate","{0:d}") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
												</Columns>
												<PagerStyle Mode="NumericPages"></PagerStyle>
											</asp:datagrid></TD>
									</TR>
								</table>
							</FONT>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
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
