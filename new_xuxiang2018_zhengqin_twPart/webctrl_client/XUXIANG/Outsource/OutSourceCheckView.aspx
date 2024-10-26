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
												<td><asp:label id="lab_outsourceCheckNo" runat="server" Text="�ӽг渹">�禬�渹</asp:label></td>
												<td><asp:textbox id="txt_outsourceCheckNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_supplyId" runat="server" Text="�e�~?��">�e�~�t��</asp:label></td>
												<td><asp:dropdownlist id="dpl_supplyId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_payMent" runat="server" Text="�I�ڱ���"></asp:label></td>
												<td><asp:dropdownlist id="dpl_payMent" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 30px"><asp:label id="lab_taxRate" runat="server" Text="�|�v"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:dropdownlist id="dpl_taxRate" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_taxValue" runat="server" Text="�|�v��"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:textbox id="txt_taxValue" runat="server"></asp:textbox></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_outsourcePrice" runat="server" Text="�N�u���B"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:textbox id="txt_outsourcePrice" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_businessTax" runat="server" Text="��~�|�B"></asp:label></td>
												<td><asp:textbox id="txt_businessTax" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_totalPrice" runat="server" Text="�[�u�`��"></asp:label></td>
												<td><asp:textbox id="txt_totalPrice" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_expectedDate" runat="server" Text="�w�w���"></asp:label></td>
												<td><wc:inputcalendar id="txt_expectedDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td style="HEIGHT: 22px"><asp:label id="lab_executeMan" runat="server" Text="�g��H"></asp:label></td>
												<td style="HEIGHT: 22px"><asp:dropdownlist id="dpl_executeMan" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 22px"><asp:label id="lab_departmentId" runat="server" Text="����"></asp:label></td>
												<td style="HEIGHT: 22px"><asp:dropdownlist id="dpl_departmentId" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 22px"><asp:label id="lab_checker" runat="server" Text="�f�֤H"></asp:label></td>
												<td style="HEIGHT: 22px"><asp:textbox id="txt_checker" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 30px"><asp:label id="lab_checkDate" runat="server" Text="�f�֤��"></asp:label></td>
												<td style="HEIGHT: 30px"><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_approver" runat="server" Text="�֭�H"></asp:label></td>
												<td style="HEIGHT: 30px"><asp:textbox id="txt_approver" runat="server"></asp:textbox></td>
												<td style="HEIGHT: 30px"><asp:label id="lab_approveDate" runat="server" Text="�֭���"></asp:label></td>
												<td style="HEIGHT: 30px"><wc:inputcalendar id="txt_approveDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
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
											<asp:label id="lab_iddetail" runat="server" Text="" Visible="False"></asp:label><asp:label id="lab_outSourceCheckId" runat="server" Text="�ӽг渹" Visible="False"></asp:label><asp:textbox id="txt_outSourceCheckId" runat="server" Visible="False"></asp:textbox>
											<tr>
												<td><asp:label id="lab_outSourceNo" runat="server" Text="�e�~�渹"></asp:label></td>
												<td><asp:dropdownlist id="dpl_outSourceNo" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_outsourceProjectNo" runat="server" Text="�e�~���ظ�"></asp:label></td>
												<td><FONT face="�s�ө���"><asp:dropdownlist id="dpl_outsourceProjectNo" runat="server" AutoPostBack="True"></asp:dropdownlist></FONT></td>
												<td><asp:label id="lab_shelfNo" runat="server" Text="�x��"></asp:label></td>
												<td>
													<asp:DropDownList id="dpl_shelfNo" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:label id="lab_materialProductName" runat="server" Text="�ƫ~�W��" Visible="False">�ƫ~�W��</asp:label></td>
												<td><asp:textbox id="txt_materialProductName" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:label id="lab_materialProductId" runat="server" Text="�ƫ~�渹"></asp:label></td>
												<td><asp:textbox id="txt_materialProductId" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_PartNo" runat="server" Text="�ϸ�"></asp:label></td>
												<td><asp:textbox id="txt_PartNo" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_process" runat="server" Text="�[�u�u��"></asp:label></td>
												<td><asp:textbox id="txt_process" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_inInventory" runat="server" Text="���i�f��"></asp:label></td>
												<td><asp:textbox id="txt_inInventory" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_factInCome" runat="server" Text="��ڶi�f�ƶq"></asp:label></td>
												<td><asp:textbox id="txt_factInCome" runat="server" AutoPostBack="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_noinInventory" runat="server" Text="���i�f��"></asp:label></td>
												<td><asp:textbox id="txt_noinInventory" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_prices" runat="server" Text="�N�u����"></asp:label></td>
												<td><asp:textbox id="txt_prices" runat="server" AutoPostBack="True"></asp:textbox></td>
												<td><asp:label id="lab_price" runat="server" Text="�N�u�X�p"></asp:label></td>
												<td><asp:textbox id="txt_price" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkStatus" runat="server" Text="�禬���A"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checkStatus" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_commentdetail" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_commentdetail" runat="server"></asp:textbox></td>
												<TD colSpan="2"><asp:label id="func_detail" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_editdetail" runat="server" Text="�O�s" Enabled="False"></asp:button></TD>
											</tr>
											<tr>
												<td colSpan="6"><asp:datagrid id="dg_OutSourceCheckDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="�ӽг渹">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outSourceCheckId" runat="server">�ӽг渹</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outSourceCheckId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutSourceCheckId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outSourceCheckId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outSourceCheckId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="�e�~�渹">
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
															<asp:TemplateColumn HeaderText="�e�~���ظ�">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outsourceProjectNo" runat="server">�e�~���ظ�</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outsourceProjectNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceProjectNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outsourceProjectNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceProjectNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="�x��">
																<HeaderTemplate>
																	<asp:Label id="dg_header_shelfNo" runat="server">�x��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_shelfNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ShelfNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_shelfNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.shelfNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="��ڶi�f�ƶq">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factInCome" runat="server">��ڶi�f�ƶq</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factInCome" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactInCome")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_factInCome" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factInCome") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="�N�u����">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server">�N�u����</asp:Label>
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
																	<asp:Label id="dg_header_checkStatus" runat="server">�禬���A</asp:Label>
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
