<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="BomApplyList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomApplyList" %>
<%@ Register TagPrefix="uc1" TagName="BomApplyHeader" Src="controls/BomApplyHeader.ascx" %>
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
						<TD vAlign="top" width="79%"><uc1:bomapplyheader id="BomApplyHeader" runat="server"></uc1:bomapplyheader>
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
											<tr>
												<td><asp:label id="lab_print" runat="server"></asp:label></td>
											</tr>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_BomApplyDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="" Visible="False">
																<ItemTemplate>
																	<asp:Label id="dg_bomApplyNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_moduleId" runat="server" text="模具編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="creater">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_creater" runat="server" text="創建人"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_creater" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="createDate">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_createDate" runat="server" text="創建日期"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_createDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreateDate","{0:d}")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productNo">
																<HeaderTemplate>
																	<asp:Label id="dg_haeder_productNo" runat="server" text="制令單號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" runat="server" EditText="申購明細"></asp:EditCommandColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_bom runat="server" Text="申購明細編輯" NavigateUrl='<%# "BomApplyView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink ID="HyperLink_Eitd" runat="server" text="申購編輯" NavigateUrl='<%# "BomApplyDetailViewExcel.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確認刪除?')&quot;>刪除</div>" HeaderText="動作"
																CommandName="Delete"></asp:ButtonColumn>
															<asp:ButtonColumn Text="打印報表" CommandName="PRINT" HeaderText="動作"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<br>
												</td>
											</tr>
											<tr>
												<td colSpan="4"><asp:datagrid id="Datagrid_BomApplyDetail" runat="server" Visible="False" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="" Visible="False">
																<ItemTemplate>
																	<asp:Label id="lab_bomApplyNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomApplyNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server" text="模具編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="Label1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partName">
																<HeaderTemplate>
																	<asp:Label id="Label4" runat="server" text="名稱"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="Label5" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productmaterialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productmaterialId" Runat="server" text="物料編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
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
																	<asp:Label id="dg_lab_productmaterialname" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/></asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="pictureNo">
																<HeaderTemplate>
																	<asp:Label id="Label6" runat="server" text="等級"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="Label7" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_pictureNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="spec">
																<HeaderTemplate>
																	<asp:Label id="dg_header_spec" runat="server" text="規格"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_spec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="price">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server" text="估價"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialId" runat="server" text="材質"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:DropDownList id="dg_txt_materialId" Width="40" runat="server"></asp:DropDownList>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="requireCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_requireCount" runat="server" text="需求數量"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_requireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_requireCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
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
			<asp:datagrid id="Datagrid_print" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
				visible="False">
				<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
				<Columns>
					<asp:TemplateColumn HeaderText="" Visible="False">
						<ItemTemplate>
							<asp:Label id="Label8" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="projectname">
						<HeaderTemplate>
							<asp:Label id="Label9" runat="server" text="項目名稱"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label id="Label12" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectName")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="version">
						<HeaderTemplate>
							<asp:Label id="Label13" runat="server" text="版本"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label id="Label14" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Version")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="moduleId">
						<HeaderTemplate>
							<asp:Label id="Label15" runat="server" text="模具編號"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label id="Label16" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="creater">
						<HeaderTemplate>
							<asp:Label id="Label17" runat="server" text="創建人"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label id="Label18" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="createDate">
						<HeaderTemplate>
							<asp:Label id="Label19" runat="server" text="創建日期"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label id="Label20" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreateDate","{0:d}")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="productNo">
						<HeaderTemplate>
							<asp:Label id="Label21" runat="server" text="制令單號"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label id="Label22" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid></form>
	</body>
</HTML>
