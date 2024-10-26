<%@ Page language="c#" Codebehind="OutsourceRejectView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.OutsourceRejectView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="OutsourceRejectHeader" Src="control/OutsourceRejectHeader.ascx" %>
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
						<TD vAlign="top" width="79%"><uc1:outsourcerejectheader id="OutsourceRejectHeader" runat="server"></uc1:outsourcerejectheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_outsourceRejectNo" runat="server" Text="�h�f�渹"></asp:label></td>
												<td><asp:textbox id="txt_outsourceRejectNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_outsourceCheckId" runat="server" Text="�禬�渹"></asp:label></td>
												<td><asp:dropdownlist id="dpl_outsourceCheckId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td><asp:label id="lab_supplyId" runat="server" Text="�e�~?��">�e�~�t��</asp:label></td>
												<td><asp:textbox id="txt_supplyId" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_payMent" runat="server" Text="�I�ڱ���"></asp:label></td>
												<td><asp:textbox id="txt_payMent" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_taxRate" runat="server" Text="�|�v"></asp:label></td>
												<td><asp:textbox id="txt_taxRate" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_taxValue" runat="server" Text="�|�v��"></asp:label></td>
												<td><asp:textbox id="txt_taxValue" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_rejectPrice" runat="server" Text="�h�f���B"></asp:label></td>
												<td><asp:textbox id="txt_rejectPrice" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_businessTax" runat="server" Text="��~�|�B"></asp:label></td>
												<td><asp:textbox id="txt_businessTax" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_rejectTotalPrice" runat="server" Text="�h�f?�B">�h�f���B</asp:label></td>
												<td><asp:textbox id="txt_rejectTotalPrice" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryManager" runat="server" Text="�ܺޭ�"></asp:label></td>
												<td><asp:dropdownlist id="dpl_inventoryManager" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_specialProject" runat="server" Text="�M��"></asp:label></td>
												<td><asp:textbox id="txt_specialProject" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_departmentId" runat="server" Text="����"></asp:label></td>
												<td><asp:dropdownlist id="dpl_departmentId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checker" runat="server" Text="�f�֤H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checker" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_checkDate" runat="server" Text="�f�֤��"></asp:label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_approver" runat="server" Text="�֭�H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_approver" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_approveDate" runat="server" Text="�֭���"></asp:label></td>
												<td><wc:inputcalendar id="txt_approveDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</tr>
										</table>
										<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
											width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
											<tr>
												<td vAlign="top">
													<table width="100%" align="center" border="0">
														<asp:label id="lab_Iddetail" runat="server" Text="" Visible="False"></asp:label><asp:label id="lab_outSourceRejectId" runat="server" Text="" Visible="False"></asp:label>
														<tr>
															<td><asp:label id="lab_outSourceCheckDetailId" runat="server" Text="�e�~�禬�渹"></asp:label></td>
															<td><asp:dropdownlist id="dpl_outSourceCheckDetailId" runat="server"></asp:dropdownlist></td>
															<td><asp:label id="lab_name" runat="server" Text="�ƫ~�s��"></asp:label></td>
															<td><asp:textbox id="txt_name" runat="server" ReadOnly="True" BackColor="DarkGray"></asp:textbox></td>
														</tr>
														<tr>
															<td><asp:label id="lab_rejectCount" runat="server" Text="�h�f��"></asp:label></td>
															<td><asp:textbox id="txt_rejectCount" runat="server" AutoPostBack="True"></asp:textbox></td>
															<td><asp:label id="lab_totalPrice" runat="server" Text="���B"></asp:label></td>
															<td><asp:textbox id="txt_totalPrice" runat="server"></asp:textbox></td>
														</tr>
														<tr>
															<td><asp:label id="lab_price" runat="server" Text="���"></asp:label></td>
															<td><asp:textbox id="txt_price" runat="server" AutoPostBack="True"></asp:textbox></td>
															<td><asp:label id="lab_commentdetail" runat="server" Text="�Ƶ�"></asp:label></td>
															<td><asp:textbox id="txt_commentdetail" runat="server"></asp:textbox></td>
															<td><asp:label id="lab_outSourceNo" runat="server" Text="�e�~�渹" Visible="False">�e�~�渹</asp:label></td>
															<td><asp:textbox id="txt_outSourceNo" runat="server" Visible="False"></asp:textbox></td>
														</tr>
														<tr>
															<TD colSpan="4"><asp:label id="funcdetail" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_editdetail" runat="server" Text="�O�s" Visible="False"></asp:button></TD>
														</tr>
														<tr>
															<td colSpan="4"><asp:datagrid id="dg_OutsourceRejectDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
																	<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
																	<Columns>
																		<asp:TemplateColumn HeaderText="Id">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Id" runat="server">�s��</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																			</ItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="outSourceRejectId" Visible="False">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_outSourceRejectId" runat="server">outSourceRejectId</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_outSourceRejectId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourceRejectId")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_outSourceRejectId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourceRejectId") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="outSourceNo">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_outSourceNo" runat="server">�e�~�渹</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_outSourceNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourceNo")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_outSourceNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourceNo") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="outSourceCheckDetailId">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_outSourceCheckDetailId" runat="server">�e�~�禬�渹</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_outSourceCheckDetailId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourceCheckDetailId")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_outSourceCheckDetailId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourceCheckDetailId") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="rejectCount">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_rejectCount" runat="server">�h�f��</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_rejectCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectCount")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_rejectCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.rejectCount") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="totalPrice">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_totalPrice" runat="server">���B</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_totalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_totalPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="price">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_price" runat="server">���</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="comment">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_comment" runat="server">�Ƶ�</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�s��" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
																		<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�T�{�R����')&quot;>�R��</div>" HeaderText="�R��"
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
												<DIV align="center"><B>����</B></DIV>
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
