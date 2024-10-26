<%@ Page language="c#" Codebehind="InInventoryList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.InInventoryList" %>
<%@ Register TagPrefix="uc1" TagName="InInventoryHeader" Src="controls/InInventoryHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
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
						<TD vAlign="top" width="79%"><uc1:ininventoryheader id="InInventoryHeader" runat="server"></uc1:ininventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_InInventory" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False">
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
															<asp:TemplateColumn HeaderText="myNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_myNo" runat="server">入庫編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_myNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MyNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_myNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.myNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="inventoryManage">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inventoryManage" runat="server">倉庫員</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inventoryManage" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryManage")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inventoryManage" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryManage") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="inventoryTypeId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inventoryTypeId" runat="server">入庫類別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inventoryTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryTypeId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inventoryTypeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryTypeId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="inDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inDate" runat="server">入庫日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inDate","{0:d}") %>'/>
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
															<asp:BoundColumn DataField="supplyId" HeaderText="供應商"></asp:BoundColumn>
															<asp:BoundColumn DataField="departmentid" HeaderText="部門"></asp:BoundColumn>
															<asp:BoundColumn DataField="inInventoryTypeNo" HeaderText="單號"></asp:BoundColumn>
															<asp:BoundColumn DataField="project" HeaderText="往來科目"></asp:BoundColumn>
															<asp:BoundColumn DataField="manager" HeaderText="保管人"></asp:BoundColumn>
															<asp:BoundColumn DataField="responsibler" HeaderText="負責人"></asp:BoundColumn>
															<asp:BoundColumn DataField="checker" HeaderText="驗收人"></asp:BoundColumn>
															<asp:BoundColumn DataField="busineer" HeaderText="業務員"></asp:BoundColumn>
															<asp:BoundColumn DataField="creater" HeaderText="制單人"></asp:BoundColumn>
															<asp:BoundColumn DataField="approver" HeaderText="審核人"></asp:BoundColumn>
															<asp:BoundColumn DataField="approveDate" HeaderText="審核日期"></asp:BoundColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "InInventoryView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="" EditText="入庫明細"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<asp:label id="lab_Id" runat="server" Visible="False"></asp:label><asp:datagrid id="dg_InInventoryDetail" runat="server" Visible="False" AllowPaging="True" CellPadding="2"
														CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="id">
																<HeaderTemplate>
																	<asp:Label id="Label1" runat="server">id</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label2" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="productMaterialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productMaterialId" runat="server">物料編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productMaterialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productMaterialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId") %>'/>
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
															<asp:TemplateColumn HeaderText="inPCS">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inPCS" runat="server">批號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inPCS" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InPCS")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inPCS" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inPCS") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="shelfId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_shelfId" runat="server">庫位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_shelfId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ShelfId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_shelfId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.shelfId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="inInventoryCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inInventoryCount" runat="server">入庫數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inInventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InInventoryCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inInventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inInventoryCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="inInventoryWeight">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inInventoryWeight" runat="server">入庫重量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inInventoryWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InInventoryWeight")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inInventoryWeight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inInventoryWeight") %>'/>
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
															<asp:TemplateColumn Visible="False" HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="Label3" runat="server">備註</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label4" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="Textbox1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="inInventoryId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inInventoryId" runat="server">inInventoryId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inInventoryId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InInventoryId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inInventoryId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inInventoryId") %>'/>
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
