<%@ Register TagPrefix="uc1" TagName="OutSourceCheckHeader" Src="control/OutSourceCheckHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="OutSourceCheckView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.OutSourceCheckView" %>
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
						<TD vAlign="top" width="79%"><uc1:outsourcecheckheader id="OutSourceCheckHeader" runat="server"></uc1:outsourcecheckheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_outsourceCheckNo" runat="server" Text="申請單號">驗收單號</asp:label></td>
												<td><asp:textbox id="txt_outsourceCheckNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_supplyId" runat="server" Text="委外?商">委外廠商</asp:label></td>
												<td><asp:dropdownlist id="dpl_supplyId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_payMent" runat="server" Text="付款條件"></asp:label></td>
												<td><asp:dropdownlist id="dpl_payMent" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 30px"><asp:label id="lab_taxRate" runat="server" Text="稅率"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:dropdownlist id="dpl_taxRate" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_taxValue" runat="server" Text="稅率值"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:textbox id="txt_taxValue" runat="server"></asp:textbox></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_outsourcePrice" runat="server" Text="代工金額"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:textbox id="txt_outsourcePrice" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_businessTax" runat="server" Text="營業稅額"></asp:label></td>
												<td><asp:textbox id="txt_businessTax" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_totalPrice" runat="server" Text="加工總價"></asp:label></td>
												<td><asp:textbox id="txt_totalPrice" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_expectedDate" runat="server" Text="預定交期"></asp:label></td>
												<td><wc:inputcalendar id="txt_expectedDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td style="HEIGHT: 22px"><asp:label id="lab_executeMan" runat="server" Text="經手人"></asp:label></td>
												<td style="HEIGHT: 22px"><asp:dropdownlist id="dpl_executeMan" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 22px"><asp:label id="lab_departmentId" runat="server" Text="部門"></asp:label></td>
												<td style="HEIGHT: 22px"><asp:dropdownlist id="dpl_departmentId" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 22px"><asp:label id="lab_checker" runat="server" Text="審核人"></asp:label></td>
												<td style="HEIGHT: 22px"><asp:textbox id="txt_checker" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 30px"><asp:label id="lab_checkDate" runat="server" Text="審核日期"></asp:label></td>
												<td style="HEIGHT: 30px"><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_approver" runat="server" Text="核准人"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:textbox id="txt_approver" runat="server"></asp:textbox></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_approveDate" runat="server" Text="核准日期"></asp:label></td>
												<td style="HEIGHT: 30px"><wc:inputcalendar id="txt_approveDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</tr>
										</table>
									</td>
								</tr>
							</TABLE>
							<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_iddetail" runat="server" Text="" Visible="False"></asp:label><asp:label id="lab_outSourceCheckId" runat="server" Text="申請單號" Visible="False"></asp:label><asp:textbox id="txt_outSourceCheckId" runat="server" Visible="False"></asp:textbox>
											<tr>
												<td><asp:label id="lab_outSourceNo" runat="server" Text="委外單號"></asp:label></td>
												<td><asp:dropdownlist id="dpl_outSourceNo" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_outsourceProjectNo" runat="server" Text="委外項目號"></asp:label></td>
												<td><FONT face="新細明體"><asp:dropdownlist id="dpl_outsourceProjectNo" runat="server" AutoPostBack="True"></asp:dropdownlist></FONT></td>
												<td><asp:label id="lab_shelfNo" runat="server" Text="儲位"></asp:label></td>
												<td>
													<asp:DropDownList id="dpl_shelfNo" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:label id="lab_materialProductName" runat="server" Text="料品名稱" Visible="False">料品名稱</asp:label></td>
												<td><asp:textbox id="txt_materialProductName" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:label id="lab_materialProductId" runat="server" Text="料品單號"></asp:label></td>
												<td><asp:textbox id="txt_materialProductId" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_PartNo" runat="server" Text="圖號"></asp:label></td>
												<td><asp:textbox id="txt_PartNo" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_process" runat="server" Text="加工工序"></asp:label></td>
												<td><asp:textbox id="txt_process" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_inInventory" runat="server" Text="應進貨數"></asp:label></td>
												<td><asp:textbox id="txt_inInventory" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_factInCome" runat="server" Text="實際進貨數量"></asp:label></td>
												<td><asp:textbox id="txt_factInCome" runat="server" AutoPostBack="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_noinInventory" runat="server" Text="未進貨數"></asp:label></td>
												<td><asp:textbox id="txt_noinInventory" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_prices" runat="server" Text="代工價格"></asp:label></td>
												<td><asp:textbox id="txt_prices" runat="server" AutoPostBack="True"></asp:textbox></td>
												<td><asp:label id="lab_price" runat="server" Text="代工合計"></asp:label></td>
												<td><asp:textbox id="txt_price" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkStatus" runat="server" Text="驗收狀態"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checkStatus" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_commentdetail" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_commentdetail" runat="server"></asp:textbox></td>
												<TD colSpan="2"><asp:label id="func_detail" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_editdetail" runat="server" Text="保存" Enabled="False"></asp:button></TD>
											</tr>
											<tr>
												<td colSpan="6"><asp:datagrid id="dg_OutSourceCheckDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="申請單號">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outSourceCheckId" runat="server">申請單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outSourceCheckId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourceCheckId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outSourceCheckId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourceCheckId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="委外單號">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outSourceNo" runat="server">委外單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outSourceNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourceNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outSourceNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourceNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="委外項目號">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outsourceProjectNo" runat="server">委外項目號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outsourceProjectNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceProjectNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outsourceProjectNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceProjectNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="儲位">
																<HeaderTemplate>
																	<asp:Label id="dg_header_shelfNo" runat="server">儲位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_shelfNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ShelfNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_shelfNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.shelfNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="實際進貨數量">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factInCome" runat="server">實際進貨數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factInCome" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactInCome")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_factInCome" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factInCome") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="代工價格">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server">代工價格</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkStatus">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkStatus" runat="server">驗收狀態</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkStatus" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckStatus")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkStatus" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkStatus") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment">
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
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="編輯" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確認刪除嗎')&quot;>刪除</div>" HeaderText="刪除"
																CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<br>
												</td>
											</tr>
										</table>
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
									</td>
								</tr>
								<TR>
									<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
								</TR>
							</TABLE>
		</form>
		</TD></TR></TBODY></TABLE>
	</body>
</HTML>
