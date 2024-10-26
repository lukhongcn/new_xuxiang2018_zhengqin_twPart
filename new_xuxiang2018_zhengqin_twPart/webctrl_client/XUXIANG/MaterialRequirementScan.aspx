<%@ Register TagPrefix="uc1" TagName="MaterialRequirementHeader" Src="controls/MaterialRequirementHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="MaterialRequirementScan.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MaterialRequirementScan" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%"><br>
							<hr>
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">物料需求鎏欖</div>
									</td>
								</tr>
							</table>
							模具編號:<asp:textbox id="txtModuleId" Runat="server"></asp:textbox><asp:button id="btnSearch" Runat="server" Text="搜索"></asp:button>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<TBODY>
									<tr>
										<td vAlign="top">
											<table width="100%" align="center" border="0">
												<tr>
													<td colSpan="2"><asp:datagrid id="dg_MaterialRequirement" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
															AllowPaging="True">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn HeaderText="requireNo">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_Id" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.id") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="requireNo">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_requireNo" runat="server">需求單號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_requireNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireNo")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_requireNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.requireNo") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="productNo">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_productNo" runat="server">工令單號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_productNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productNo") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="moduleId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_moduleId" runat="server">模具編號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="factFinishedDate">
																	<HeaderTemplate>
																		<asp:Label id="Label1" runat="server">實際完成日期</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="Label2" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactFinishedDate","{0:d}")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="Textbox1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factFinishedDate","{0:d}") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="createDate">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_createDate" runat="server">開單日期</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_createDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreateDate","{0:d}")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_createDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.createDate","{0:d}") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="expectedDate">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_expectedDate" runat="server">預交日期</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_expectedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedDate","{0:d}")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_expectedDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedDate","{0:d}") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:ButtonColumn Text="物料明細" CommandName="Detail"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid>
														<hr style="COLOR: #ccccff">
														<br>
													</td>
												</tr>
											</table>
											<asp:panel id="pan_detail" Runat="server" Visible="False">
            <P><FONT face=新細明體></FONT>&nbsp;</P>
            <P>類型: 
<asp:DropDownList id=ddlType runat="server" AutoPostBack="True">
														<asp:ListItem Value="ALL">全部</asp:ListItem>
														<asp:ListItem Value="SELF">自製</asp:ListItem>
														<asp:ListItem Value="OUTSOURCE">外包</asp:ListItem>
														<asp:ListItem Value="BUY">採購</asp:ListItem>
													</asp:DropDownList></P>
<asp:datagrid id=dg_bomdetail runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
													<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
													<Columns>
														<asp:TemplateColumn HeaderText="materialRequirementId">
															<HeaderTemplate>
																<asp:Label id="dg_header_materialRequirementId" runat="server" Text="請求僤號"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_materialRequirementId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialRequirementId")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_materialRequirementId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialRequirementId") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="materialNo">
															<HeaderTemplate>
																<asp:Label id="dg_header_materialNo" runat="server" Text="物料編號"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_materialNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialNo")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_materialNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialNo") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="materialName">
															<HeaderTemplate>
																<asp:Label ID="dg_header_materialName" Runat="server" Text="物料名稱"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_materialName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_materialName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialName") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="spec">
															<HeaderTemplate>
																<asp:Label id="dg_header_spec" runat="server" Text="規格"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_spec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.spec") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="inventoryCount">
															<HeaderTemplate>
																<asp:Label id="dg_header_inventoryCount" runat="server" Text="庫存量"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_inventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_inventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryCount") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="usedCount">
															<HeaderTemplate>
																<asp:Label id="dg_header_usedCount" runat="server" Text="使用藪量"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_usedCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UsedCount")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_usedCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.usedCount") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="pictureNo">
															<HeaderTemplate>
																<asp:Label id="dg_header_pictureNo" runat="server" Text="圓號"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_pictureNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_pictureNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pictureNo") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="usedPartNoCount">
															<HeaderTemplate>
																<asp:Label id="dg_header_usedPartNoCount" runat="server" Text="零件藪量"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_usedPartNoCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UsedPartNoCount")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_usedPartNoCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.usedPartNoCount") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="materialRequireCount">
															<HeaderTemplate>
																<asp:Label id="dg_header_materialRequireCount" runat="server" Text="物料需求藪"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_materialRequireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialRequireCount")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_materialRequireCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialRequireCount") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
														<asp:TemplateColumn HeaderText="materialTypeId">
															<HeaderTemplate>
																<asp:Label id="dg_header_materialTypeId" runat="server" Text="零件類型"></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																&nbsp;
																<asp:Label id="dg_lab_materialTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialTypeId")%>'/>
															</ItemTemplate>
															<EditItemTemplate>
																<asp:textbox id="dg_txt_materialTypeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialTypeId") %>'/>
															</EditItemTemplate>
														</asp:TemplateColumn>
													</Columns>
													<PagerStyle Mode="NumericPages"></PagerStyle>
												</asp:datagrid>
											</asp:panel></td>
									</tr>
								</TBODY>
							</TABLE>
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
