<%@ Page language="c#" Codebehind="OutsourceApplyDesignApprov.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutsourceApplyDesignApprov" %>
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
										<div align="left">申請單核准</div>
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
														<asp:ListItem Value="CHECK_PASS">審核通過</asp:ListItem>
														<asp:ListItem Value="APPROV_PASS">核准通過</asp:ListItem>
														<asp:ListItem Value="APPROV_CONFUSE">核准拒絕</asp:ListItem>
													</asp:dropdownlist><asp:button id="btn_check" runat="server" Text="核准保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_OutsourceApplyDesign" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2" AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn>
																<HeaderTemplate>
																	<asp:Label id="dg_header_rdl" runat="server">通過|拒絕|核准等待</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:RadioButtonList ID="dg_rdl_check" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
																		<asp:ListItem Value="0" Text=""></asp:ListItem>
																		<asp:ListItem Value="1" Text=""></asp:ListItem>
																		<asp:ListItem Value="2" Text=""></asp:ListItem>
																	</asp:RadioButtonList>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="outsourceApplyNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outsourceApplyNo" runat="server">申請單編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outsourceApplyNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceApplyNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outsourceApplyNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceApplyNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="applyType">
																<HeaderTemplate>
																	<asp:Label id="dg_header_applyType" runat="server">申請單類型</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_applyType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyType")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_applyType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applyType") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="applyDepartmentId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_applyDepartmentId" runat="server">申請部門</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_applyDepartmentId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyDepartmentId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_applyDepartmentId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applyDepartmentId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="creater">
																<HeaderTemplate>
																	<asp:Label id="dg_header_creater" runat="server">制單人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_creater" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_creater" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.creater") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="createDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_createDate" runat="server">制單日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_createDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreateDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_createDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.createDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checker" runat="server">審核人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkDate" runat="server">審核日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="reChecker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_reChecker" runat="server">回復人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_reChecker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReChecker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_reChecker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.reChecker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="reCheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_reCheckDate" runat="server">回復日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_reCheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReCheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_reCheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.reCheckDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="approver" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_approver" runat="server">核准人</asp:Label>
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
																	<asp:Label id="dg_header_approverDate" runat="server">核准日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_approverDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApproverDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_approverDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.approverDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment" Visible="false">
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
															<asp:TemplateColumn HeaderText="status" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_status" runat="server">狀態</asp:Label>
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
