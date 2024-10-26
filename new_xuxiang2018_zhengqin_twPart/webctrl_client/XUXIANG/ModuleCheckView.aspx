<%@ Page language="c#" Codebehind="ModuleCheckView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.ModuleCheck" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="ModuleCheckHeader" Src="controls/ModuleCheckHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>模具檢驗</title>
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
						<TD vAlign="top" width="79%"><uc1:modulecheckheader id="ModuleCheckHeader" runat="server"></uc1:modulecheckheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td style="HEIGHT: 19px"><asp:label id="lab_checkdate" runat="server" Text="日期"></asp:label></td>
												<td style="HEIGHT: 19px"><wc:inputcalendar id="txt_checkdate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 19px"><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
												<td style="HEIGHT: 19px"><asp:dropdownlist id="dpl_customerid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 6px"><asp:label id="lab_moduleid" runat="server" Text="模具編號"></asp:label></td>
												<td style="HEIGHT: 6px"><asp:dropdownlist id="dpl_moduleid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td style="HEIGHT: 6px"><asp:label id="lab_productname" runat="server" Text="模具名稱"></asp:label></td>
												<td style="HEIGHT: 6px"><asp:textbox id="txt_productname" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checker" runat="server" Text="審核人"></asp:label></td>
												<td><asp:textbox id="txt_checker" runat="server" width="80"></asp:textbox><asp:dropdownlist id="dpl_checker" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_inputer" runat="server" Text="填表人"></asp:label></td>
												<td><asp:textbox id="txt_inputer" runat="server" width="80"></asp:textbox><asp:dropdownlist id="dpl_inputer" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
												<td colSpan="3"><asp:textbox id="txt_comment" runat="server" Width="260"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="Label1" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_qcproduct" runat="server" Text="檢查項目"></asp:label></td>
												<td><asp:dropdownlist id="dpl_qcproduct" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 15px"><asp:label id="lab_checkstandard" runat="server" Text="驗收標準"></asp:label></td>
												<td style="HEIGHT: 15px"><asp:textbox id="txt_checkstandard" runat="server" Width="260"></asp:textbox><asp:dropdownlist id="dpl_checkstandard" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_ispass" runat="server" Text="是否合格"></asp:label></td>
												<td><asp:dropdownlist id="dpl_ispass" runat="server">
														<asp:ListItem Value="0">合格</asp:ListItem>
														<asp:ListItem Value="1">不合格</asp:ListItem>
													</asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_qccomment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_qccomment" runat="server"></asp:textbox><asp:label id="lab_qcmoduleid" Visible="False" Runat="server"></asp:label><asp:label id="lab_modulecheckid" Visible="False" Runat="server"></asp:label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="qcfunc" runat="server" Text="" Visible="False"></asp:label><asp:button id="tb_qcadd_edit" runat="server" Text="保存" Enabled="False"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_QcProductList" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="id" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_id" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="modulecheckid" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_modulecheckid" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_modulecheckid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_modulecheckid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkno">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkno" runat="server">序號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkno" runat="server" Text=""></asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="qcproduct">
																<HeaderTemplate>
																	<asp:Label id="dg_header_qcproduct" runat="server">檢查項目</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_qcproduct" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Qcproduct")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_qcproduct" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.qcproduct") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkstandard">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkstandard" runat="server">驗收標準</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkstandard" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checkstandard")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkstandard" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkstandard") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ispass">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ispass" runat="server">是否合格</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ispass" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ispass")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ispass" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ispass") %>'/>
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
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定刪除')&quot;>刪除</div>" HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
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
												<DIV align="center"><B>提示</B></DIV>
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
