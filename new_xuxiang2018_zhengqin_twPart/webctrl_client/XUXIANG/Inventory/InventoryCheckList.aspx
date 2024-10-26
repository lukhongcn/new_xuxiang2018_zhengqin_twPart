<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="InventoryCheckHeader" Src="controls/InventoryCheckHeader.ascx" %>
<%@ Page language="c#" Codebehind="InventoryCheckList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.InventoryCheckList" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>盤點</title>
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
						<TD vAlign="top" width="79%"><uc1:inventorycheckheader id="InventoryCheckHeader" runat="server"></uc1:inventorycheckheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top"><asp:label id="lab_Id" Visible="False" Runat="server"></asp:label>
										<table width="100%" align="center" border="0">
											<TR>
												<TD style="HEIGHT: 15px" colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label></TD>
											</TR>
										</table>
										<br>
										<hr>
										<asp:datagrid id="dg_inventorycheckDesign" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
											AutoGenerateColumns="False">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn Visible="False" HeaderText="Id">
													<HeaderTemplate>
														<asp:Label id="dg_header_Id" runat="server">序號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<HeaderTemplate>
														<asp:Label id="dg_header_startdate" runat="server">開始日期</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_startdate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Startdate","{0:d}")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_startdate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.startdate","{0:d}") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="enddate">
													<HeaderTemplate>
														<asp:Label id="dg_header_enddate" runat="server">結束日期</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_enddate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Enddate","{0:d}")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_enddate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.enddate","{0:d}") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="tablename">
													<HeaderTemplate>
														<asp:Label id="dg_header_tablename" runat="server">表名</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_tablename" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tablename")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_tablename" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tablename") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="checkNo">
													<HeaderTemplate>
														<asp:Label id="dg_header_checkNo" runat="server">盤點編號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_checkNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckNo")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_checkNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkNo") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn>
													<ItemTemplate>
														<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "InventoryCheckView.aspx?func_main=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
														</asp:HyperLink>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="詳細信息" CommandName="detail"></asp:ButtonColumn>
												<asp:ButtonColumn Text="生成盤點表" CommandName="check"></asp:ButtonColumn>
												<asp:ButtonColumn Text="充帳" CommandName="fill"></asp:ButtonColumn>
												<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確認刪除嗎')&quot;&gt;刪除&lt;/div&gt;" HeaderText="刪除" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid><br>
										<hr>
										<table width="100%" align="center" border="0">
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_InventoryCheck" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False">
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
															<asp:TemplateColumn HeaderText="productMaterialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productMaterialId" runat="server">料品編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productMaterialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productMaterialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId") %>'/>
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
															<asp:TemplateColumn HeaderText="checkDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkDate" runat="server">盤點日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkTime">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkTime" runat="server">盤點時間</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkTime" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckTime")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkTime" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkTime") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="unitId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_unitId" runat="server">單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_unitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_unitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unitId") %>'/>
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
															<asp:TemplateColumn HeaderText="inventoryCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inventoryCount" runat="server">庫存數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="inventoryWeight">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inventoryWeight" runat="server">庫存重量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inventoryWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryWeight")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inventoryWeight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryWeight") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="factCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factCount" runat="server">實際數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_factCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="factWeight">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factWeight" runat="server">實際重量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactWeight")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_factWeight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factWeight") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="LossCount">
																<HeaderTemplate>
																	<asp:Label id="Label1" runat="server">損益數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label2" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LossCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="Textbox1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LossCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checker" runat="server">盤點人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server">備註</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
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
		</form>
	</body>
</HTML>
