<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="xuxiangBomDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangBomDetailList" %>
<%@ Register TagPrefix="uc1" TagName="xuxiangBomDetailHeader" Src="controls/xuxiangBomDetailHeader.ascx" %>
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
						<TD vAlign="top" width="79%"><uc1:xuxiangbomdetailheader id="xuxiangBomDetailHeader" runat="server"></uc1:xuxiangbomdetailheader>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td><asp:label id="lab_moduleId" text="工令單號" Runat="server"></asp:label><asp:dropdownlist id="dpl_moduleId" Runat="server" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="txt_moduleId" Runat="server"></asp:textbox><asp:button id="btn_search" Runat="server" Text="工令單號查詢"></asp:button></td>
												<td><asp:label id="lab_print" runat="server"></asp:label></td>
											</tr>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_BomDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False">
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_bomDesignNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="projectname">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_projectname" runat="server" text="項目名稱"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_projectname" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectName")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="version">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_version" runat="server" text="版本"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_version" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Version")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_moduleId" runat="server" text="工令單號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="creater">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_creater" runat="server" text="創建人"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_creater" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="createDate">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_createDate" runat="server" text="創建日期"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_createDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreateDate","{0:d}")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productNo">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_productNo" runat="server" text="制令單號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="" EditText="Bom明細"></asp:EditCommandColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	&nbsp;
																	<asp:HyperLink id=HyperLink_bom runat="server" Text="BOM詳細明細編輯" NavigateUrl='<%# "xuxiangBomDetailView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	&nbsp;
																	<asp:HyperLink ID="HyperLink_Eitd" runat="server" text="BOM編輯" NavigateUrl='<%# "xuxiangBomDetailViewExcel.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確認刪除?')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
															<asp:ButtonColumn Text="打印報表" HeaderText="動作" CommandName="PRINT"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<br>
												</td>
											</tr>
											<tr>
												<td colSpan="4"><asp:datagrid id="Datagrid_bomdetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2" Visible="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="" Visible="False">
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="lab_bomDesignNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomDesignNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partNo">
																<HeaderTemplate>
																	<asp:Label id="Label2" runat="server" text="零件編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label3" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partName">
																<HeaderTemplate>
																	<asp:Label id="Label4" runat="server" text="零件名稱"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label5" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productmaterialId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productmaterialId" Runat="server" text="物料編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productmaterialId" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productmaterialId" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/></asp:textbox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productmaterialname" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productmaterialname" Runat="server" text="物料名稱"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productmaterialname" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/></asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moldSkleton">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_moldSkleton" runat="server" text="模架"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moldSkleton" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MoldSkleton")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moldSkleton" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MoldSkleton") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="stand">
																<HeaderTemplate>
																	<asp:Label id="dg_header_stand" runat="server" text="標準件"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_stand" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Stand")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_stand" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Stand") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="pictureNo" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="Label6" runat="server" text="零件標準"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label7" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_pictureNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="heatprocess">
																<HeaderTemplate>
																	<asp:Label id="dg_header_heatprocess" runat="server" text="熱處理"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_heatprocess" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeatProcess")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:DropDownList id="dg_dpl_heatprocess" runat="server">
																		<asp:ListItem Value="1">是</asp:ListItem>
																		<asp:ListItem Value="0">否</asp:ListItem>
																	</asp:DropDownList>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="spec">
																<HeaderTemplate>
																	<asp:Label id="dg_header_spec" runat="server" text="規格(實際)"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_spec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="uglyspec">
																<HeaderTemplate>
																	<asp:Label id="dg_header_uglyspec" runat="server" text="規格(毛料)"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_uglyspec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglySpec")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_uglyspec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglySpec") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="length">
																<HeaderTemplate>
																	<asp:Label id="dg_header_length" runat="server" text="長(實際)"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_length" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Length")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_length" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Length") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="uglylength">
																<HeaderTemplate>
																	<asp:Label id="dg_header_uglylength" runat="server" text="長(毛料)"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_uglylength" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglyLength")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_uglylength" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglyLength") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="prepareMethod" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_prepareMethod" runat="server" text="備料方式"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_prepareMethod" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PrepareMethodName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:DropDownList id="dg_dpl_prepareMethod" runat="server">
																		<asp:ListItem Value="PRODUCT">自製</asp:ListItem>
																		<asp:ListItem Value="MERCHINDISE">外購</asp:ListItem>
																	</asp:DropDownList>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialId" runat="server" text="材質"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pictureNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:DropDownList id="dg_txt_materialId" Width="40" runat="server"></asp:DropDownList>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="requireCount">
																<HeaderTemplate>
																	<asp:Label id="Label10" runat="server" text="數量"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label11" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_requireCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="headHard">
																<HeaderTemplate>
																	<asp:Label id="dg_head_headHard" runat="server" text="硬度" Visible="False"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_headHard" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeadHard")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_headHard" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeadHard") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="isMerchindise">
																<HeaderTemplate>
																	<asp:Label ID="dg_head_isMerchindise" Runat="server" text="是否采購"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label ID="dg_lab_isMerchindise" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.IsMerchindise")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox ID="dg_txt_isMerchindise" Runat="server" TextMode='<%#DataBinder.Eval(Container, "DataItem.IsMerchindise")%>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="cryogenic">
																<HeaderTemplate>
																	<asp:Label ID="dg_head_cryogenic" Runat="server" text='深冷' />
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label ID="dg_lab_cryogenic" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.Cryogenic")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox ID="dg_txt_cryogenic" Runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Cryogenic")%>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="request">
																<HeaderTemplate>
																	<asp:Label ID="dg_head_request" Runat="server" text='要求' />
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label ID="dg_lab_request" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.Request")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox ID="dg_txt_request" Runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Request")%>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialer">
																<HeaderTemplate>
																	<asp:Label ID="dg_head_materialer" Runat="server" text='領料人' />
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label ID="dg_lab_materialer" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.Materialer")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox ID="dg_txt_materialer" Runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Materialer")%>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server" text="模具編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleComment ")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="Comment" HeaderText="備註"></asp:BoundColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid></td>
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
												<DIV align="center"><B>提示信息</B></DIV>
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
			<asp:datagrid id="Datagrid_print" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
				visible="False">
				<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
				<Columns>
					<asp:TemplateColumn HeaderText="" Visible="False">
						<ItemTemplate>
							&nbsp;
							<asp:Label id="Label8" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="projectname">
						<HeaderTemplate>
							<asp:Label id="Label9" runat="server" text="項目名稱"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							&nbsp;
							<asp:Label id="Label12" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectName")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="version">
						<HeaderTemplate>
							<asp:Label id="Label13" runat="server" text="版本"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							&nbsp;
							<asp:Label id="Label14" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Version")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="moduleId">
						<HeaderTemplate>
							<asp:Label id="Label15" runat="server" text="模具編號"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							&nbsp;
							<asp:Label id="Label16" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="creater">
						<HeaderTemplate>
							<asp:Label id="Label17" runat="server" text="創建人"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							&nbsp;
							<asp:Label id="Label18" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="createDate">
						<HeaderTemplate>
							<asp:Label id="Label19" runat="server" text="創建日期"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							&nbsp;
							<asp:Label id="Label20" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreateDate","{0:d}")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="productNo">
						<HeaderTemplate>
							<asp:Label id="Label21" runat="server" text="制令單號"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							&nbsp;
							<asp:Label id="Label22" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid></form>
	</body>
</HTML>
