<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OutSourceOutInventoryHeader" Src="control/OutSourceOutInventoryHeader.ascx" %>
<%@ Page language="c#" Codebehind="OutSourceOutInventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceOutInventoryView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�e�~��ΥX�w�@�~</title>
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
						<TD vAlign="top" width="79%"><uc1:outsourceoutinventoryheader id="OutSourceOutInventoryHeader" runat="server"></uc1:outsourceoutinventoryheader><br>
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
											<asp:label id="lab_Id" runat="server" Text="id" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_myNo" runat="server" Text="��Ƴ渹"></asp:label></td>
												<td><asp:textbox id="txt_myNo" runat="server" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_outDate" runat="server" Text="��Ƥ��"></asp:label></td>
												<td><wc:inputcalendar id="txt_outDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_inOutInventoryTypeId" runat="server" Text="�X�w����" Visible="False">�X�w����</asp:label></td>
												<td><asp:textbox id="txt_inOutInventoryTypeId" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 10px"><asp:label id="lab_inventoryOuter" runat="server" Text="��ƤH"></asp:label></td>
												<td style="HEIGHT: 10px"><asp:dropdownlist id="dpl_inventoryOuter" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 10px"><asp:label id="lab_outDepartmentid" runat="server" Text="����"></asp:label></td>
												<td style="HEIGHT: 10px"><asp:dropdownlist id="dpl_outDepartmentid" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 10px"><asp:label id="lab_inventoryManager" runat="server" Text="�ܮw��"></asp:label></td>
												<td style="HEIGHT: 10px"><asp:dropdownlist id="dpl_inventoryManager" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_SupplyId" runat="server" Text="�e�~?��">�e�~�t��</asp:label></td>
												<td><asp:dropdownlist id="dpl_SupplyId" runat="server"></asp:dropdownlist></td>
											</tr>
											<TR>
												<td style="HEIGHT: 7px"><asp:label id="lab_OutSourceNo" runat="server" Text="�e�~�s��" Visible="False"></asp:label></td>
												<td style="HEIGHT: 7px"><asp:dropdownlist id="dpl_OutSourceNo" runat="server" Visible="False"></asp:dropdownlist></td>
											</TR>
											<tr>
												<TD style="HEIGHT: 7px" colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
												<TD colSpan="2"><asp:button id="btn_printOutInventory" runat="server" Visible="False" text="���L����"></asp:button><asp:label id="lab_print" runat="server"></asp:label><asp:label id="lab_check_myno" runat="server" Visible="False"></asp:label></TD>
											</tr>
											<tr>
												<td colSpan="6">
													<hr style="COLOR: #ccccff">
													<br>
													<asp:panel id="pan_outsourceDetail" Visible="False" Runat="server">
														<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
															width="100%" align="center" borderColorLight="#ccccff" border="1">
															<TBODY>
																<TR>
																	<TD vAlign="top">
																		<TABLE width="100%" align="center" border="0">
																			<asp:Label id="lab_iddetail" runat="server" Text="" Visible="False"></asp:Label>
																			<TR>
																				<TD>
																					<asp:Label id="lab_productmaterialno" runat="server" Text="�ƫ~�s��"></asp:Label></TD>
																				<TD>
																					<asp:textbox id="txt_productmaterialno" runat="server" AutoPostBack="True"></asp:textbox>
																					<asp:Button id="btn_search" runat="server" Text="�d��"></asp:Button></TD>
																				<TD>
																					<asp:Label id="lab_name" runat="server" Text="�ƫ~�W��"></asp:Label></TD>
																				<TD>
																					<asp:textbox id="txt_name" runat="server" Enabled="False"></asp:textbox></TD>
																				<TD>
																					<asp:Label id="lab_unitId" runat="server" Text="���"></asp:Label></TD>
																				<TD>
																					<asp:TextBox id="txt_unit" runat="server" Enabled="False"></asp:TextBox></TD>
																			</TR>
																			<TR>
																				<TD>
																					<asp:Label id="lab_shelfId" runat="server" Text="�f�["></asp:Label></TD>
																				<TD><FONT face="�s�ө���">
																						<asp:DropDownList id="dpl_shelfId" runat="server"></asp:DropDownList></FONT></TD>
																				<TD>
																					<asp:Label id="lab_outInventoryCount" runat="server" Text="�X�w�ƶq"></asp:Label></TD>
																				<TD>
																					<asp:textbox id="txt_outInventoryCount" runat="server"></asp:textbox></TD>
																				<TD>
																					<asp:Label id="lab_outInventoryWeight" runat="server" Text="�X�w���q"></asp:Label></TD>
																				<TD>
																					<asp:textbox id="txt_outInventoryWeight" runat="server"></asp:textbox></TD>
																			</TR>
																			<TR>
																				<TD>
																					<asp:Label id="lab_price" runat="server" Text="���"></asp:Label></TD>
																				<TD>
																					<asp:textbox id="txt_price" runat="server"></asp:textbox></TD>
																				<TD>
																					<asp:Label id="lab_commentdetail" runat="server" Text="�Ƶ�"></asp:Label></TD>
																				<TD>
																					<asp:textbox id="txt_commentdetail" runat="server"></asp:textbox></TD>
																				<asp:Label id="lab_OutInventory" runat="server" Text="OutInventory" Visible="False"></asp:Label>
																				<TD>
																					<asp:Label id="lab_outPCS" runat="server" Text="�X�w�帹"></asp:Label></FONT></TD>
																				<TD>
																					<asp:textbox id="txt_outPCS" runat="server"></asp:textbox></FONT></TD>
																			</TR>
																			<TR>
																				<TD>
																					<asp:Label id="lab_inventoryCount" runat="server" Text="�i���">�ܮw�ƶq</asp:Label></TD>
																				<TD><FONT face="����">
																						<asp:TextBox id="txt_inventoryCount" runat="server"></asp:TextBox></FONT></TD>
																				<TD>
																					<asp:label id="lab_ShouldOutNumber" runat="server" Text="����Ƽ�" Visible="False"></asp:label></TD>
																				<TD>
																					<asp:textbox id="txt_ShouldOutNumber" runat="server" Visible="False"></asp:textbox></TD>
																				<TD colSpan="2">
																					<asp:Label id="func_detail" runat="server" Text="" Visible="False"></asp:Label>
																					<asp:button id="Button1" runat="server" Text="�O�s"></asp:button></TD>
																			</TR>
																			<TR>
																				<TD colSpan="6">
																					<asp:datagrid id="dg_OutSourceOutInventoryDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
																						CellPadding="2">
																						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
																						<Columns>
																							<asp:TemplateColumn HeaderText="�ƫ~�W��">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_productMaterialId" runat="server">�ƫ~�W��</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_productMaterialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_productMaterialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="unitId">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_unitId" runat="server">���</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_unitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitId")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_unitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unitId") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="outPCS">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_outPCS" runat="server">�X�w�帹</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_outPCS" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutPCS")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_outPCS" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outPCS") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="shelfId">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_shelfId" runat="server">�f�[</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_shelfId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ShelfId")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_shelfId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.shelfId") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="outInventoryCount">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_outInventoryCount" runat="server">�X�w�ƶq</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_outInventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventoryCount")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_outInventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outInventoryCount") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="outInventoryWeight">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_outInventoryWeight" runat="server">�X�w���q</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_outInventoryWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventoryWeight")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_outInventoryWeight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outInventoryWeight") %>'/>
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
																							<asp:TemplateColumn HeaderText="OutInventory" Visible="False">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_OutInventory" runat="server">OutInventory</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_OutInventory" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventory")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_OutInventory" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventory") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="shouldOutNumber" Visible="False">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_shouldOutNumber" runat="server">�����</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_shouldOutNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ShouldOutNumber")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_shouldOutNumber" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.shouldOutNumber") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="canOutNumber" Visible="False">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_canOutNumber" runat="server">�i���</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_canOutNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CanOutNumber")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_canOutNumber" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.canOutNumber") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:TemplateColumn HeaderText="extraOutNumber" Visible="False">
																								<HeaderTemplate>
																									<asp:Label id="dg_header_extraOutNumber" runat="server">�B�~���</asp:Label>
																								</HeaderTemplate>
																								<ItemTemplate>
																									&nbsp;
																									<asp:Label id="dg_lab_extraOutNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExtraOutNumber")%>'/>
																								</ItemTemplate>
																								<EditItemTemplate>
																									<asp:textbox id="dg_txt_extraOutNumber" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.extraOutNumber") %>'/>
																								</EditItemTemplate>
																							</asp:TemplateColumn>
																							<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�s��" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
																							<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�T�{�R����')&quot;>�R��</div>" HeaderText="�R��"
																								CommandName="Delete"></asp:ButtonColumn>
																						</Columns>
																						<PagerStyle Mode="NumericPages"></PagerStyle>
																					</asp:datagrid>
																					<HR style="COLOR: #ccccff">
																					<BR>
																				</TD>
																			</TR>
																		</TABLE>
													</asp:panel></td>
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
												<DIV align="center"><B>���ܫH��</B></DIV>
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
		</TD></TR></TBODY></TABLE>
	</body>
</HTML>
