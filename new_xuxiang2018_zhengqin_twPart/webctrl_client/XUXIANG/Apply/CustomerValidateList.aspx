<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="CustomerValidateList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.CustomerValidateList" %>
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
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left"></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label>廠商評定
												</TD>
											</TR>
											<tr>
												<td><asp:label id="lab_search" Runat="server">廠商或物料編號:</asp:label><asp:textbox id="txt_search" Runat="server"></asp:textbox><asp:button id="btn_search" Text="搜索" Runat="server"></asp:button></td>
												<td><asp:Label ID="lab_searchhide" Runat="server"></asp:Label></td>
											</tr>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_CustomerValidate" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="Id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="supplyId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_supplyId" runat="server">廠商</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_supplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplyId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_supplyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.supplyId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="productMaterialInventoryId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productMaterialInventoryId" runat="server">物料編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productMaterialInventoryId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialInventoryId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productMaterialInventoryId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productMaterialNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productMaterialNo" runat="server">物料編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productMaterialNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productMaterialNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialNo") %>'/>
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
															<asp:TemplateColumn HeaderText="expectedDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectedDate" runat="server">預定日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_expectedDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="factedDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factedDate" runat="server">實際時間</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactedDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_factedDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factedDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseDate" runat="server">制單日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
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
