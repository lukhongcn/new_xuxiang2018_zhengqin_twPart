<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="RejectHeader" Src="controls/mileRejectHeader.ascx" %>
<%@ Page language="c#" Codebehind="mileRejectList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.mileRejectList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>退貨</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
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
							<uc1:RejectHeader id="RejectHeader" runat="server"></uc1:RejectHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_Reject" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="Id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="rejectNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_rejectNo" runat="server">退貨單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_rejectNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_rejectNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.rejectNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="rejectDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_rejectDate" runat="server">退貨日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_rejectDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_rejectDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.rejectDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="rejectType">
																<HeaderTemplate>
																	<asp:Label id="dg_header_rejectType" runat="server">退貨單類別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_rejectType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectType")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_rejectType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.rejectType") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="rejectCreater">
																<HeaderTemplate>
																	<asp:Label id="dg_header_rejectCreater" runat="server">制單人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_rejectCreater" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectCreater")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_rejectCreater" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.rejectCreater") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="accountDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_accountDate" runat="server">記賬日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_accountDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AccountDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_accountDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.accountDate","{0:d}") %>'/>
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
															<asp:TemplateColumn HeaderText="approver">
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
															<asp:TemplateColumn HeaderText="finicialChecker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_finicialChecker" runat="server">財務審核</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_finicialChecker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FinicialChecker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_finicialChecker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.finicialChecker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="finicialCheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_finicialCheckDate" runat="server">財務審核日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_finicialCheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FinicialCheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_finicialCheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.finicialCheckDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="finicialApproveDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_finicialApproveDate" runat="server">核准日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_finicialApproveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FinicialApproveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_finicialApproveDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.finicialApproveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="MerchindiseId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "mileRejectView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
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
