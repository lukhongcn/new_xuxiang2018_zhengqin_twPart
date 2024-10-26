<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="InventoryCheckHeader" Src="controls/InventoryCheckHeader.ascx" %>
<%@ Page language="c#" Codebehind="InventoryCheckView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.InventoryCheckView" %>
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
						<TD vAlign="top" width="79%"><uc1:inventorycheckheader id="InventoryCheckHeader" runat="server"></uc1:inventorycheckheader><br>
							<hr>
							<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id_main" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td><asp:label id="lab_startdate" runat="server" Text="�}�l�ɶ�"></asp:label></td>
												<td><wc:inputcalendar id="txt_startdate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_enddate" runat="server" Text="�����ɶ�"></asp:label></td>
												<td><wc:inputcalendar id="txt_enddate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkNo" runat="server" Text="�L�I�s��"></asp:label></td>
												<td><asp:textbox id="txt_checkNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_tablename" runat="server" Text="��W" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_tablename" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func_main" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit_main" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td><asp:label id="lab_checkDate" runat="server" Text="�L�I���"></asp:label></td>
												<td><cc1:DatePicker id="txt_checkDate" imgDirectory="images/" runat="server" DateType="yyyy-mm-dd" Enabled="True"></cc1:DatePicker></td>
												<td><asp:label id="lab_checkTime" runat="server" Text="�L�I�ɶ�"></asp:label></td>
												<td><asp:textbox id="txt_checkTime" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_productMaterialId" runat="server" Text="���ƽs��"></asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server" ReadOnly="True" AutoPostBack="True"></asp:textbox><asp:button id="btn_search" runat="server" Text="�d��"></asp:button></td>
												<td><asp:label id="lab_name" runat="server" Text="���ƦW��"></asp:label></td>
												<td><asp:textbox id="txt_name" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 17px"><asp:label id="lab_unitId" runat="server" Text="���"></asp:label></td>
												<td style="HEIGHT: 17px"><asp:textbox id="txt_unit" runat="server" Enabled="False"></asp:textbox></td>
												<td><asp:label id="lab_spec" runat="server" Text="�W��"></asp:label></td>
												<td><asp:textbox id="txt_spec" runat="server" ReadOnly="True" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryCount" runat="server" Text="�w�s�ƶq"></asp:label></td>
												<td><asp:textbox id="txt_inventoryCount" runat="server" ReadOnly="True" Enabled="False"></asp:textbox></td>
												<td><asp:label id="lab_inventoryWeight" runat="server" Text="�w�s���q"></asp:label></td>
												<td><asp:textbox id="txt_inventoryWeight" runat="server" ReadOnly="True" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_factCount" runat="server" Text="��ڼƶq"></asp:label></td>
												<td><asp:textbox id="txt_factCount" runat="server" AutoPostBack="True"></asp:textbox></td>
												<td><asp:label id="lab_factWeight" runat="server" Text="��ڭ��q"></asp:label></td>
												<td><asp:textbox id="txt_factWeight" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_losscount" runat="server" Text="�l�q�ƶq">�l�q�ƶq</asp:label></td>
												<td><asp:textbox id="txt_losscount" runat="server" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_checker" runat="server" Text="�L�I�H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checker" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s" Enabled="False"></asp:button></TD>
											</tr>
										</table>
										<asp:datagrid id="dg_InventoryCheck" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
											AutoGenerateColumns="False">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="id" Visible="False">
													<HeaderTemplate>
														<asp:Label id="dg_header_id" runat="server">�s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="productMaterialId">
													<HeaderTemplate>
														<asp:Label id="dg_header_productMaterialId" runat="server">�ƫ~�s��</asp:Label>
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
														<asp:Label id="dg_header_productMaterialName" runat="server">�ƫ~�W��</asp:Label>
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
														<asp:Label id="dg_header_checkDate" runat="server">�L�I���</asp:Label>
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
														<asp:Label id="dg_header_checkTime" runat="server">�L�I�ɶ�</asp:Label>
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
												<asp:TemplateColumn HeaderText="spec">
													<HeaderTemplate>
														<asp:Label id="dg_header_spec" runat="server">�W��</asp:Label>
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
														<asp:Label id="dg_header_inventoryCount" runat="server">�w�s�ƶq</asp:Label>
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
														<asp:Label id="dg_header_inventoryWeight" runat="server">�w�s���q</asp:Label>
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
														<asp:Label id="dg_header_factCount" runat="server">��ڼƶq</asp:Label>
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
														<asp:Label id="dg_header_factWeight" runat="server">��ڭ��q</asp:Label>
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
														<asp:Label id="Label1" runat="server">�l�q�ƶq</asp:Label>
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
														<asp:Label id="dg_header_checker" runat="server">�L�I�H</asp:Label>
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
												<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�ʧ@" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
												<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�w�O�_�R��')&quot;&gt;�R��&lt;/div&gt;" 
 HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
										<hr>
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
	</body>
</HTML>
