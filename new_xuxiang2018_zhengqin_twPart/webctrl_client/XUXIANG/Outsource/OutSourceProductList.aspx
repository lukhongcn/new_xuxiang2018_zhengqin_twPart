<%@ Register TagPrefix="uc1" TagName="OutSourceProductHeader" Src="control/OutSourceProductHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="OutSourceProductList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceProductList" %>
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
							<uc1:OutSourceProductHeader id="OutSourceProductHeader" runat="server"></uc1:OutSourceProductHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_OutSourceProduct" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="Id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="createDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_createDate" runat="server">委外日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_createDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreateDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_createDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.createDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="outSourceNo">
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
															<asp:TemplateColumn HeaderText="outSourceApply">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outSourceApply" runat="server">委外廠商</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outSourceApply" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourceApply")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outSourceApply" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourceApply") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="payMent" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_payMent" runat="server">付款條件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_payMent" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PayMent")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_payMent" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.payMent") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="taxRate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_taxRate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_taxRate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TaxRate")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_taxRate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.taxRate") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="tax" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_tax" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_tax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tax")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_tax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tax") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="outSourcePrice">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outSourcePrice" runat="server">委外費用</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outSourcePrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourcePrice")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outSourcePrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourcePrice") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="count">
																<HeaderTemplate>
																	<asp:Label id="dg_header_count" runat="server">總數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_count" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_count" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="receivedCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_receivedCount" runat="server">已交數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_receivedCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReceivedCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_receivedCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.receivedCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="unreceivedCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_unreceivedCount" runat="server">未交數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_unreceivedCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnreceivedCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_unreceivedCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unreceivedCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="price">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server">加工金額</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="busingessTax">
																<HeaderTemplate>
																	<asp:Label id="dg_header_busingessTax" runat="server">營業稅額</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_busingessTax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BusingessTax")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_busingessTax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.busingessTax") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="totalPrice">
																<HeaderTemplate>
																	<asp:Label id="dg_header_totalPrice" runat="server">加工金額</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_totalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_totalPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="expectedDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectedDate" runat="server">預定交期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_expectedDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="creater">
																<HeaderTemplate>
																	<asp:Label id="dg_header_creater" runat="server">經手人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_creater" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_creater" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.creater") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="departmentId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_departmentId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_departmentId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.DepartmentId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_departmentId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.departmentId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checker" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checker" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkDate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="approver" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_approver" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_approver" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Approver")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_approver" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.approver") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="approverDate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_approverDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_approverDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApproveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_approverDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.approveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "OutSourceProductView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;>刪除</div>" HeaderText="動作"
																CommandName="Delete"></asp:ButtonColumn>
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
