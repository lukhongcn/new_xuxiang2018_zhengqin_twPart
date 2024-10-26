<%@ Register TagPrefix="uc1" TagName="MaterialRequirementDetailHeader" Src="controls/MaterialRequirementHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MaterialRequirementDetailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MaterialRequirementDetailView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
		<script language="javascript" src="js/lib.js"></script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="Leftmenu1" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td><asp:label id="lab__requireNo" runat="server" Text="需求單號"></asp:label></td>
												<td><asp:textbox id="txt_requireNo" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_productNo" runat="server" Text="工令單號"></asp:label></td>
												<td><asp:textbox id="txt_productNo" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_moduleId1" runat="server" Text="模具編號"></asp:label></td>
												<td><asp:textbox id="txt_moduleId1" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_materialNo" runat="server" Text="物料編號"></asp:label><asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_materialNo" runat="server"></asp:textbox><asp:label id="lab_materialRequirementId" runat="server" Text="materialRequirementId" Visible="False"></asp:label><asp:button id="btn_search" runat="server" Text="查詢"></asp:button></td>
											</tr>
											<tr>
												<td><asp:label id="lab_model" runat="server" Text="型號"></asp:label></td>
												<td><asp:textbox id="txt_model" runat="server"></asp:textbox><asp:label id="lab_moduleid" runat="server" Visible="False"></asp:label></td>
												<td><asp:label id="lab_spec" runat="server" Text="規格"></asp:label></td>
												<td><asp:textbox id="txt_spec" runat="server"></asp:textbox><asp:label id="lab_bomdesignNo" runat="server" Visible="False"></asp:label></td>
											</tr>
											<tr>
												<td><asp:label id="lab_unitId" runat="server" Text="單位"></asp:label></td>
												<td><asp:dropdownlist id="dpl_unitId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_inventoryCount" runat="server" Text="庫存量"></asp:label></td>
												<td><asp:textbox id="txt_inventoryCount" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_usedCount" runat="server" Text="使用數量"></asp:label></td>
												<td><asp:textbox id="txt_usedCount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_usedPartNo" runat="server" Text="使用零件"></asp:label></td>
												<td><asp:textbox id="txt_usedPartNo" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_usedPartNoCount" runat="server" Text="使用零件數量"></asp:label></td>
												<td><asp:textbox id="txt_usedPartNoCount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_type" runat="server" Text="類別"></asp:label></td>
												<td><asp:dropdownlist id="dpl_type" runat="server">
														<asp:ListItem Value="SELF">自製</asp:ListItem>
														<asp:ListItem Value="OUTSOURCE">外包</asp:ListItem>
														<asp:ListItem Value="BUY">外購</asp:ListItem>
													</asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_lose" runat="server" Text="損耗"></asp:label></td>
												<td><asp:textbox id="txt_lose" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_materialRequireCount" runat="server" Text="物料需求數"></asp:label></td>
												<td><asp:textbox id="txt_materialRequireCount" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 19px"><asp:label id="lab_materialTypeId" runat="server" Text="物料類型"></asp:label></td>
												<td style="HEIGHT: 19px"><asp:dropdownlist id="dpl_materialTypeId" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 19px"><asp:label id="lab_supplyId" runat="server" Text="供應商"></asp:label></td>
												<td style="HEIGHT: 19px"><asp:dropdownlist id="dpl_supplyId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_pictureNo" runat="server" Text="圖號"></asp:label></td>
												<td><asp:textbox id="txt_pictureNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server" Width="400"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button><asp:button id="btn_back" runat="server" Text="返  回"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="4">
													<hr>
												</td>
											</tr>
											<tr>
												<td colSpan="4"><asp:datagrid id="dg_BomDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="" Visible="False">
																<ItemTemplate>
																	<asp:Label id="dg_lab_bomDesignNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomDesignNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="Label1" runat="server" text="模具編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="lab_dg_moduelid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partNo" runat="server" text="零件編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partName" runat="server" text="零件名稱"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_partName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="pictureNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_pictureNo" runat="server" text="圖號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_pictureNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="spec">
																<HeaderTemplate>
																	<asp:Label id="dg_header_spec" runat="server" text="規格"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="prepareMethod">
																<HeaderTemplate>
																	<asp:Label id="dg_header_prepareMethod" runat="server" text="備料方式"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_prepareMethod" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.prepareMethod")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialId" runat="server" text="材質"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="weight">
																<HeaderTemplate>
																	<asp:Label id="dg_header_weight" runat="server" text="重量"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_weight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Weight")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="requireCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_requireCount" runat="server" text="需求數量"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_requireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="" HeaderText="核料" CancelText="" EditText="核料"></asp:EditCommandColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><asp:datagrid id="dg_MaterialRequirementDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
											CellPadding="2">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="materialNo">
													<HeaderTemplate>
														<asp:Label id="dg_header_materialNo" runat="server">物料編號</asp:Label>
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
														<asp:Label id="dg_header_materialName" runat="server">物料名稱</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_materialName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_materialName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialName") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="model">
													<HeaderTemplate>
														<asp:Label id="dg_header_model" runat="server">型號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_model" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Model")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_model" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.model") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="spec">
													<HeaderTemplate>
														<asp:Label id="Label3" runat="server">規格</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="Label4" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_spec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.spec") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="usedPartNo">
													<HeaderTemplate>
														<asp:Label id="dg_header_usedPartNo" runat="server">使用零件</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_usedPartNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UsedPartNo")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_usedPartNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.usedPartNo") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="materialRequireCount">
													<HeaderTemplate>
														<asp:Label id="dg_header_materialRequireCount" runat="server">物料需求數</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_materialRequireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialRequireCount")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_materialRequireCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialRequireCount") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="pictureNo">
													<HeaderTemplate>
														<asp:Label id="Label5" runat="server">圖號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="Label6" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_pictureNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pictureNo") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:EditCommandColumn ButtonType="LinkButton" runat="server" HeaderText="動作" EditText="編輯"></asp:EditCommandColumn>
												<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確認刪除')&quot;>刪除</div>" HeaderText="刪除"
													CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
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
