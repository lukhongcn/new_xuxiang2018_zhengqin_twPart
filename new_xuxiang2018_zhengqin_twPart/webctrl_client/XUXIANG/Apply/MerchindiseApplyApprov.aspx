<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MerchindiseApplyApprov.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseApplyApprov" %>
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
										<div align="left">請購核准設定</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True">
														<asp:ListItem Value="CHECK_PASS">未核准</asp:ListItem>
														<asp:ListItem Value="APPROV_PASS">已核准</asp:ListItem>
														<asp:ListItem Value="APPROV_CONFUSE">拒絕核准</asp:ListItem>
													</asp:dropdownlist><asp:button id="btn_check" runat="server" Text="核准保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_MerchindiseApply" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderTemplate>
																	<asp:Label id="dg_header_rdl" runat="server">通過|拒絕|未審核</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:RadioButtonList ID="dg_rdl_check" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
																		<asp:ListItem Value="0" Text=""></asp:ListItem>
																		<asp:ListItem Value="1" Text=""></asp:ListItem>
																		<asp:ListItem Value="2" Text=""></asp:ListItem>
																	</asp:RadioButtonList>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Id" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyNo" runat="server">請購單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="inputDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inputDate" runat="server">請購日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inputDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InputDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inputDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inputDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyCreater">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyCreater" runat="server">制單人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyCreater" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyCreater")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyCreater" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyCreater") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyCreateDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyCreateDate" runat="server">制單日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyCreateDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyCreateDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyCreateDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyCreateDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyChecker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyChecker" runat="server">審核人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyChecker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyChecker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyChecker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyChecker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyCheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyCheckDate" runat="server">審核日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyCheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyCheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyCheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyCheckDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyApprover" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyApprover" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyApprover" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyApprover")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyApprover" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyApprover") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyApproveDate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyApproveDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyApproveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyApproveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyApproveDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyApproveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyComment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyComment" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyComment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyComment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyComment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="status" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_status" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_status" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Status")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_status" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.status") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
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
