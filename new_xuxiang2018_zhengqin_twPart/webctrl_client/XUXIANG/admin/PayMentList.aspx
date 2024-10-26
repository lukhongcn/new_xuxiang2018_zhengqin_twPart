<%@ Page language="c#" Codebehind="PayMentList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.PayMent" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
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
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">付款條件設定</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td><asp:Label ID="lab_paymentName" runat="server" Text="支付方式"></asp:Label></td>
												<td><asp:textbox id="txt_paymentName" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_paymentAbbr" runat="server" Text="縮寫"></asp:Label></td>
												<td><asp:textbox id="txt_paymentAbbr" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_PayMent" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server" Text="編碼" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<HeaderTemplate>
																	<asp:Label id="dg_header_paymentName" runat="server" Text="支付方式" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_paymentName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PaymentName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_paymentName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.paymentName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<HeaderTemplate>
																	<asp:Label id="dg_header_paymentAbbr" runat="server" Text="縮寫" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_paymentAbbr" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PaymentAbbr")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_paymentAbbr" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.paymentAbbr") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="編輯" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定要刪除嗎？')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="刪除" CommandName="Delete"></asp:ButtonColumn>
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
										<asp:label id="Label_Message" runat="server" ForeColor="Red"></asp:label></TD>
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
