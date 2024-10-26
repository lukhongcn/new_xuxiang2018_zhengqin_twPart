<%@ Page language="c#" Codebehind="mileInInventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.mileInInventoryView" %>
<%@ Register TagPrefix="uc1" TagName="mileInInventoryHeader" Src="controls/mileInInventoryHeader.ascx" %>
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
						<TD vAlign="top" width="79%"><uc1:mileininventoryheader id="mileInInventoryHeader" runat="server"></uc1:mileininventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<TBODY>
												<tr>
													<td style="HEIGHT: 15px"><asp:label id="lab_myNo" runat="server" Text="入庫單號"></asp:label></td>
													<td style="HEIGHT: 15px"><asp:textbox id="txt_myNo" runat="server" ReadOnly="True"></asp:textbox></td>
													<td style="HEIGHT: 15px"><asp:label id="lab_shlfId" runat="server" Text="入庫類別">庫位</asp:label></td>
													<td style="HEIGHT: 15px"><asp:dropdownlist id="dpl_shelfId" runat="server"></asp:dropdownlist></td>
													<td style="HEIGHT: 15px"><asp:label id="lab_inDate" runat="server" Text="入庫日期"></asp:label></td>
													<td style="HEIGHT: 15px"><wc:inputcalendar id="txt_inDate" runat="server" Enabled="False"></wc:inputcalendar></td>
												</tr>
												<tr>
													<td style="HEIGHT: 20px"><asp:label id="lab_supplyId" runat="server" Text="供應商"></asp:label></td>
													<td style="HEIGHT: 20px"><asp:dropdownlist id="dpl_supplyId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
													<td style="HEIGHT: 20px"><asp:label id="lab_manager" runat="server" Text="保管人"></asp:label></td>
													<td style="HEIGHT: 20px"><asp:textbox id="txt_manager" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="dpl_manager" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
													<td style="HEIGHT: 20px"><asp:label id="lab_responsibler" runat="server" Text="負責人"></asp:label></td>
													<td style="HEIGHT: 20px"><asp:textbox id="txt_responsibler" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="dpl_responsibler" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_creater" runat="server" Text="制單人"></asp:label></td>
													<td><asp:textbox id="txt_creater" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_approver" runat="server" Text="審核人"></asp:label></td>
													<td><asp:textbox id="txt_approver" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_checker" runat="server" Text="驗收人"></asp:label></td>
													<td><asp:textbox id="txt_checker" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="dpl_checker" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="Label3" runat="server" Text="審核日期"></asp:label></td>
													<td><wc:inputcalendar id="txt_ApproveDate" runat="server"></wc:inputcalendar></td>
													<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
												</tr>
											</TBODY>
										</table>
										<hr style="COLOR: #ccccff">
										<table>
											<tr>
												<td colSpan="2"><asp:button id="btn_merchindise" runat="server" Text="採購入庫" Enabled="False"></asp:button><asp:button id="btn_inInventoryDetailEdit" runat="server" Text="明細編輯" Enabled="False"></asp:button><asp:button id="btn_add_merchindise" runat="server" Visible="False" Text="入庫保存"></asp:button></td>
												<td><asp:button id="btn_printInInventory" runat="server" Visible="False" text="打印入庫單"></asp:button><asp:label id="lab_print" runat="server"></asp:label></td>
												<td colSpan="4"><FONT face="宋體"></FONT></td>
											</tr>
										</table>
										<asp:panel id="pan_inInventorydetail" Visible="False" Runat="server">
											<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
												width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
												<TR>
													<TD vAlign="top">
														<TABLE width="100%" align="center" border="0">
															<asp:label id="Label1" runat="server" Text="" Visible="False"></asp:label>
															<TR>
																<TD>
																	<asp:label id="lab_productMaterialId" runat="server" Text="物料編號"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_productmaterialno" runat="server" AutoPostBack="True"></asp:textbox>
																	<asp:button id="btn_search" runat="server" Text="查詢" Visible="False"></asp:button></TD>
																<TD>
																	<asp:label id="lab_name" runat="server" Text="物料名稱"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_name" runat="server" Enabled="False"></asp:textbox></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_inInventoryCount" runat="server" Text="入庫數量"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_inInventoryCount" runat="server"></asp:textbox></TD>
																<TD>
																	<asp:label id="lab_inPCS" runat="server" Text="批號"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_inPCS" runat="server"></asp:textbox></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_total" Text="金額" Runat="server">總金額</asp:label></TD>
																<TD>
																	<asp:textbox id="txt_total" Runat="server"></asp:textbox></TD>
																<TD>
																	<asp:label id="lab_unitId" runat="server" Text="單位">單位</asp:label></TD>
																<TD>
																	<asp:TextBox id="txt_unit" runat="server" Enabled="False"></asp:TextBox></TD>
															</TR>
															<TR>
																<TD>
																	<asp:button id="btn_Detail" runat="server" Text="保存" Enabled="False"></asp:button></TD>
																<TD>
																	<asp:label id="lab_inInventoryId" runat="server" Text="" Visible="False"></asp:label></TD>
																<TD>
																	<asp:label id="func_Detail" runat="server" Text="" Visible="False"></asp:label>
																	<asp:label id="lab_oldcount" runat="server" Visible="False"></asp:label>
																	<asp:Label id="lab_merchindiseNo" Visible="False" Runat="server"></asp:Label>
																	<asp:Label id="lab_merchindisedetailId" Visible="False" Runat="server"></asp:Label></TD>
																<TD>
																	<asp:label id="lab_Detail_Id" runat="server" Text="" Visible="False"></asp:label></TD>
															</TR>
															<TR>
																<TD colSpan="6">
																	<asp:datagrid id="dg_InInventoryDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
																		CellPadding="2" AllowPaging="True">
																		<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
																		<Columns>
																			<asp:TemplateColumn Visible="False" HeaderText="id">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_id" runat="server">id</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																				</ItemTemplate>
																			</asp:TemplateColumn>
																			<asp:BoundColumn DataField="merchindiseNo" HeaderText="採購單號"></asp:BoundColumn>
																			<asp:TemplateColumn HeaderText="productMaterialId">
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
																			<asp:TemplateColumn HeaderText="name">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_name" runat="server">物料名稱</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_name" runat="server" Text='' />
																				</ItemTemplate>
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
																					<asp:Label id="lab_merchindise2" runat="server">採購數量</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="lab_merchindise3" runat="server" Text='' />
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="Textbox1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inInventoryCount") %>'/>
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
																			<asp:TemplateColumn HeaderText="inInventoryWeight" Visible="false">
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
																					<asp:Label id="dg_header_price" runat="server">單價</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="total">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_total" runat="server">總金額</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_total" runat="server" Text='' />
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_total" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
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
																			<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="動作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
																			<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
																				HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
																		</Columns>
																		<PagerStyle Mode="NumericPages"></PagerStyle>
																	</asp:datagrid>
																	<HR style="COLOR: #ccccff">
																	<BR>
																</TD>
															</TR>
														</TABLE>
													</TD>
												</TR>
											</TABLE>
										</asp:panel><asp:panel id="pan_merchindise" Visible="False" Runat="server">
											<asp:DataGrid id="dg_Merchindise" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
												AllowPaging="True">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:BoundColumn HeaderText="採購單號" DataField="MerchindiseId"></asp:BoundColumn>
													<asp:BoundColumn HeaderText="物料編號" DataField="merchindiseNo" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn HeaderText="名稱" DataField="productName" ReadOnly="True"></asp:BoundColumn>
													<asp:BoundColumn HeaderText="採購數量" DataField="merchindiseCount" ReadOnly="True"></asp:BoundColumn>
													<asp:TemplateColumn HeaderText="已入庫數量">
														<ItemTemplate>
															<asp:Label id="dg_lab_inInventoryCountM" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inInventoryCount")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_inInverntoryM" Runat="server" Text=''></asp:TextBox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="入庫數量">
														<ItemTemplate>
															<asp:TextBox ID="dg_txt_inInverntoryCounts" Runat="server" Text='0' Width="100" />
														</ItemTemplate>
														<EditItemTemplate>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="單位" Visible="False">
														<ItemTemplate>
															<asp:TextBox ID="dg_txt_unitId_M" Runat="server" Text='' ReadOnly="True" Width="80" />
														</ItemTemplate>
														<EditItemTemplate>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="批號">
														<ItemTemplate>
															<asp:TextBox ID="dg_txt_inPCS_M" Runat="server" Text='' Width="100" />
														</ItemTemplate>
														<EditItemTemplate>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="單 價">
														<ItemTemplate>
															<asp:Label ID="dg_txt_price_M" Runat="server"></asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="編輯" CancelText="取消" EditText="編輯"
														Visible="False"></asp:EditCommandColumn>
												</Columns>
											</asp:DataGrid>
										</asp:panel></td>
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
