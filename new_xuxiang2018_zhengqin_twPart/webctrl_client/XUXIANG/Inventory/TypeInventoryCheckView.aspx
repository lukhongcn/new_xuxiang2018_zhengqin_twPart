<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="InventoryCheckHeader" Src="controls/InventoryCheckHeader.ascx" %>
<%@ Page language="c#" Codebehind="TypeInventoryCheckView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.TypeInventoryCheckView" %>
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
												<td><asp:label id="lab_startdate" runat="server" Text="開始時間"></asp:label></td>
												<td><wc:inputcalendar id="txt_startdate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_enddate" runat="server" Text="結束時間"></asp:label></td>
												<td><wc:inputcalendar id="txt_enddate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkNo" runat="server" Text="盤點編號"></asp:label></td>
												<td><asp:textbox id="txt_checkNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_tablename" runat="server" Text="表名" Visible=False></asp:label></td>
												<td><asp:textbox id="txt_tablename" runat="server" Visible=False></asp:textbox></td>
												
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func_main" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit_main" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<TBODY>
									<tr>
										<td vAlign="top">
											<table width="100%" align="center" border="0">
												<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
												<TBODY>
													<tr>
														<td><asp:label id="lab_checkDate" runat="server" Text="盤點日期"></asp:label></td>
														<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
														<td><asp:label id="lab_checkTime" runat="server" Text="盤點時間"></asp:label></td>
														<td><asp:textbox id="txt_checkTime" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_checker" runat="server" Text="盤點人"></asp:label></td>
														<td><asp:dropdownlist id="dpl_checker" runat="server"></asp:dropdownlist></td>
														<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
														<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td>原物料類別</td>
														<td><asp:dropdownlist id="dpl_productMaterialTypeId" runat="server"></asp:dropdownlist></td>
														<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="盤點" Enabled="False"></asp:button>
															<asp:Button id="btn_detail" runat="server" Text="數量保存" Enabled="False"></asp:Button></TD>
													</tr>
													<tr>
														<td colSpan="4">
															<asp:datagrid id="dg_InventoryCheck" runat="server" AutoGenerateColumns="False" CellSpacing="2"
																CellPadding="2" AllowPaging="True">
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
																	<asp:TemplateColumn HeaderText="productMaterialId">
																		<HeaderTemplate>
																			<asp:Label id="dg_header_productMaterialId" runat="server">料號</asp:Label>
																		</HeaderTemplate>
																		<ItemTemplate>
																			&nbsp;
																			<asp:Label id="dg_lab_productMaterialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
																		</ItemTemplate>
																	</asp:TemplateColumn>
																	<asp:TemplateColumn HeaderText="productMaterialId">
																		<HeaderTemplate>
																			<asp:Label id="Label1" runat="server">料品名稱</asp:Label>
																		</HeaderTemplate>
																		<ItemTemplate>
																			&nbsp;
																			<asp:Label id="dg_lab_productMaterialName" runat="server" Text='' />
																		</ItemTemplate>
																	</asp:TemplateColumn>
																	<asp:TemplateColumn HeaderText="inventoryCount">
																		<HeaderTemplate>
																			<asp:Label id="dg_header_inventoryCount" runat="server">庫存數量</asp:Label>
																		</HeaderTemplate>
																		<ItemTemplate>
																			&nbsp;
																			<asp:Label id="dg_lab_inventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
																		</ItemTemplate>
																	</asp:TemplateColumn>
																	<asp:TemplateColumn HeaderText="inventoryWeight">
																		<HeaderTemplate>
																			<asp:Label id="dg_header_inventoryWeight" runat="server">庫存重量</asp:Label>
																		</HeaderTemplate>
																		<ItemTemplate>
																			&nbsp;
																			<asp:Label id="dg_lab_inventoryWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryWeight")%>'/>
																		</ItemTemplate>
																	</asp:TemplateColumn>
																	<asp:TemplateColumn HeaderText="factCount">
																		<HeaderTemplate>
																			<asp:Label id="dg_header_factCount" runat="server">實際數量</asp:Label>
																		</HeaderTemplate>
																		<ItemTemplate>
																			&nbsp;
																			<asp:textbox id="dg_txt_factCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactCount")%>'/>
																		</ItemTemplate>
																	</asp:TemplateColumn>
																	<asp:TemplateColumn HeaderText="factWeight">
																		<HeaderTemplate>
																			<asp:Label id="dg_header_factWeight" runat="server">實際重量</asp:Label>
																		</HeaderTemplate>
																		<ItemTemplate>
																			<asp:textbox id="dg_txt_factWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factWeight") %>'/>
																		</ItemTemplate>
																	</asp:TemplateColumn>
																</Columns>
																<PagerStyle Mode="NumericPages"></PagerStyle>
															</asp:datagrid>
															<HR style="COLOR: #ccccff">
															<BR>
														</td>
													</tr>
												</TBODY>
											</table>
										</td>
									</tr>
								</TBODY>
							</TABLE>
							<BR>
							<BR>
							<TABLE borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TBODY>
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
								</TBODY>
							</TABLE>
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
