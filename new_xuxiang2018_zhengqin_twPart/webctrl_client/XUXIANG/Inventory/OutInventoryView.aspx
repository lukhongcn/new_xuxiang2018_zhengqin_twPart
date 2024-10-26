<%@ Page language="c#" Codebehind="OutInventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.OutInventoryView" %>
<%@ Register TagPrefix="uc1" TagName="OutInventoryHeader" Src="controls/OutInventoryHeader.ascx" %>
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
			<FONT face="����"></FONT>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:outinventoryheader id="OutInventoryHeader" runat="server"></uc1:outinventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td style="HEIGHT: 12px"><asp:label id="lab_myNo" runat="server" Text="�s��"></asp:label></td>
												<td style="HEIGHT: 12px"><asp:textbox id="txt_myNo" runat="server"></asp:textbox></td>
												<td style="HEIGHT: 12px"><asp:label id="lab_outDate" runat="server" Text="�X�w���"></asp:label></td>
												<td style="HEIGHT: 12px"><wc:inputcalendar id="txt_outDate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 12px"><asp:label id="lab_inOutInventoryTypeId" runat="server" Text="�X�w����"></asp:label></td>
												<td style="HEIGHT: 12px"><asp:dropdownlist id="dpl_inOutInventoryTypeId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryOuter" runat="server" Text="��ƤH"></asp:label></td>
												<td><asp:dropdownlist id="dpl_inventoryOuter" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_outDepartmentid" runat="server" Text="����"></asp:label></td>
												<td><asp:dropdownlist id="dpl_outDepartmentid" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_inventoryManager" runat="server" Text="�ܮw��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_inventoryManager" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_project" runat="server" Text="�����"></asp:label></td>
												<td><asp:textbox id="txt_project" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_creater" runat="server" Text="���H"></asp:label></td>
												<td><asp:textbox id="txt_creater" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_approver" runat="server" Text="�f�֤H"></asp:label></td>
												<td><asp:textbox id="txt_approver" runat="server" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_paarovedate" runat="server" Text="�f�֤��"></asp:label></td>
												<td><wc:inputcalendar id="txt_ApproveDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></td>
											</tr>
										</table>
										<asp:panel id="pan_outInventorydetail" Runat="server">
            <TABLE id=Table4 borderColor=#ccccff cellSpacing=1 
            borderColorDark=#cccccc cellPadding=0 width="100%" align=center 
            borderColorLight=#ccccff border=1 runat="server">
              <TR>
                <TD>
                  <TABLE id=Table3 width="100%" align=center border=0>
<asp:label id=Label3 runat="server" Text="" Visible="False"></asp:label>
                    <TR>
                      <TD>
<asp:label id=lab_productMaterialId runat="server" Text="���ƽs��"></asp:label></TD>
                      <TD>
<asp:textbox id=txt_productmaterialno runat="server" AutoPostBack="True"></asp:textbox>
<asp:button id=btn_search runat="server" Text="�d��"></asp:button></TD>
                      <TD>
<asp:label id=lab_name runat="server" Text="���ƦW��"></asp:label></TD>
                      <TD>
<asp:textbox id=txt_name runat="server" Enabled="False"></asp:textbox></TD></TR>
                    <TR>
                      <TD style="HEIGHT: 22px">
<asp:label id=lab_outPCS runat="server" Text="�X�w�帹"></asp:label></TD>
                      <TD style="HEIGHT: 22px">
<asp:textbox id=txt_outPCS runat="server"></asp:textbox></TD>
<asp:label id=lab_shelfId runat="server" Text="�f�[" Visible="False">�f�[</asp:label>
<asp:dropdownlist id=dpl_shelfId runat="server" Visible="False"></asp:dropdownlist>
                      <TD style="HEIGHT: 22px">
<asp:label id=lab_unitId runat="server" Text="���"></asp:label></TD>
                      <TD style="HEIGHT: 22px">
<asp:textbox id=txt_unit runat="server" Enabled="False"></asp:textbox></TD></TR>
                    <TR>
                      <TD>
<asp:label id=lab_outInventoryCount runat="server" Text="�X�w�ƶq"></asp:label></TD>
                      <TD>
<asp:textbox id=txt_outInventoryCount runat="server"></asp:textbox></TD>
                      <TD>
<asp:label id=lab_outInventoryWeight runat="server" Text="�X�w���q"></asp:label></TD>
                      <TD>
<asp:textbox id=txt_outInventoryWeight runat="server"></asp:textbox></TD></TR>
                    <TR>
                      <TD>
<asp:label id=lab_price runat="server" Text="���"></asp:label></TD>
                      <TD>
<asp:textbox id=txt_price runat="server"></asp:textbox></TD>
                      <TD>
<asp:label id=lab_comment1 runat="server" Text="�Ƶ�"></asp:label></TD>
                      <TD>
<asp:textbox id=txt_comment1 runat="server"></asp:textbox></TD></TR>
                    <TR>
                      <TD>
<asp:label id=lab_OutInventory runat="server" Text="" Visible="False"></asp:label></TD></TR>
                    <TR>
                      <TD colSpan=2>
<asp:label id=func_Detail runat="server" Text="" Visible="False"></asp:label>
<asp:button id=btn_Detail runat="server" Text="�O�s"></asp:button>
<asp:label id=lab_oldcount runat="server" Visible="False"></asp:label></TD></TR></TABLE>
              <TR>
                <TD colSpan=2>
<asp:datagrid id=dg_OutInventoryDetail runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False" AllowPaging="True">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn Visible="False" HeaderText="id">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_id" runat="server">�s��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="name">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_name" runat="server">���ƦW��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_name" runat="server" Text='' />
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="productMaterialId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_productMaterialId" runat="server">���ƽs��</asp:Label>
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
																		<asp:Label id="dg_header_unitId" runat="server">���</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_unitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitId")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_unitId" Width="40" runat="server"></asp:textbox>
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
																<asp:TemplateColumn Visible="False" HeaderText="shelfId">
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
																<asp:TemplateColumn Visible="False" HeaderText="comment">
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
																<asp:TemplateColumn Visible="False" HeaderText="OutInventory">
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
																<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�ʧ@" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
																<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�w�O�_�R��')&quot;&gt;�R��&lt;/div&gt;" 
 HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid>
                  <HR style="COLOR: #ccccff">
                  <BR></TD></TR></TD></TR></TABLE>
							</asp:panel>
							<table>
								<TR>
									<TD colSpan="2"></TD>
								</TR>
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
			</TD></tr>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
