<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="AssestRequistionHeader" Src="controls/KnifeHeader.ascx" %>
<%@ Page language="c#" Codebehind="KnifeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.KnifeList" %>
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
							<uc1:AssestRequistionHeader id="AssestRequistionHeader" runat="server"></uc1:AssestRequistionHeader><br>
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
													<asp:datagrid id="dg_AssestRequistion" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="Id" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionNo" runat="server">申請單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionApplyDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionApplyDate" runat="server">申請日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionApplyDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionApplyDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionApplyDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionApplyDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionInputter">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionInputter" runat="server">制單人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionInputter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionInputter")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionInputter" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionInputter") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionInputDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionInputDate" runat="server">制單日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionInputDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionInputDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionInputDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionInputDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionChecker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionChecker" runat="server">審核人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionChecker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionChecker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionChecker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionChecker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionCheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionCheckDate" runat="server">審核日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionCheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionCheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionCheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionCheckDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestmentManager">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestmentManager" runat="server">資產管理員</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestmentManager" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestmentManager")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestmentManager" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestmentManager") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestmentManagerDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestmentManagerDate" runat="server">資產審核日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestmentManagerDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestmentManagerDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestmentManagerDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestmentManagerDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionApprover" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionApprover" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionApprover" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionApprover")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionApprover" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionApprover") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionApproveDate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequisitionApproveDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequisitionApproveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequisitionApproveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequisitionApproveDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionApproveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestDepartment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestDepartment" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestDepartment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestDepartment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestDepartment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestDepartment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestDepartmentDate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestDepartmentDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestDepartmentDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestDepartmentDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestDepartmentDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestDepartmentDate","{0:d}") %>'/>
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
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "KnifeView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;>刪除</div>" HeaderText="動作"
																CommandName="Delete"></asp:ButtonColumn>
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
