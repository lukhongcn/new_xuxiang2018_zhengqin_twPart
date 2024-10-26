<%@ Page language="c#" Codebehind="AssembleScheduleView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.AssembleScheduleView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="AssembleScheduleHeader" Src="controls/AssembleScheduleHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>組立計劃</title>
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
						<TD vAlign="top" width="79%"><uc1:assemblescheduleheader id="AssembleScheduleHeader" runat="server"></uc1:assemblescheduleheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_scheduleDate" runat="server" Text="日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_scheduleDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_assembleNo" runat="server" Text="組立單號"></asp:label></td>
												<td><asp:textbox id="txt_assembleNo" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
												<td><asp:dropdownlist id="dpl_customerid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></td>
												<td><asp:dropdownlist id="dpl_moduleId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_pictureNo" runat="server" Text="圖號"></asp:label></td>
												<td><asp:textbox id="txt_pictureNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_requireDate" runat="server" Text="需求日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_requireDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_developeMentId" runat="server" Text="開發部門"></asp:label></td>
												<td><asp:dropdownlist id="dpl_developeMentId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_expectedDate" runat="server" Text="預組立日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_expectedDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Assembler" runat="server" Text="組立人員"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Assembler" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_Creater" runat="server" Text="制單人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Creater" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Checker" runat="server" Text="審核人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Checker" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_checkDate" runat="server" Text="審核日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_reApprover" runat="server" Text="複核人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_reApprover" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_reApproveDate" runat="server" Text="複核日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_reApproveDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_approver" runat="server" Text="核准人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_approver" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_approveDate" runat="server" Text="核准日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_approveDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
										<asp:Button id="btn_Detail" runat="server" Text="需求物料明細" Enabled="False"></asp:Button></td>
								</tr>
							</TABLE>
							<br>
							<hr>
							<asp:Panel ID="pan_detail" Visible="False" Runat="server">
								<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
									width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
									<TR>
										<TD vAlign="top">
											<TABLE width="100%" align="center" border="0">
												<asp:Label id="lab_detail_Id" runat="server" Visible="False" Text=""></asp:Label>
												<TR>
													<TD style="HEIGHT: 17px">
														<asp:Label id="lab_partNo" runat="server" Text="partNo">零件編號</asp:Label></TD>
													<TD style="HEIGHT: 17px">
														<asp:DropDownList id="dpl_partNo" runat="server" AutoPostBack="True"></asp:DropDownList></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="lab_tuhao" runat="server" Text="tuhao">圖號</asp:Label></TD>
													<TD>
														<asp:textbox id="txt_tuhao" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="lab_count" runat="server" Text="tuhao">需領出數量</asp:Label></TD>
													<TD>
														<asp:textbox id="txt_count" runat="server" Enabled="False"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="lab_fcount" runat="server" Text="tuhao">已完成數</asp:Label></TD>
													<TD>
														<asp:textbox id="txt_fcount" runat="server" Enabled="False"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="lab_wcount" runat="server" Text="tuhao">未完成數</asp:Label></TD>
													<TD>
														<asp:textbox id="txt_wcount" runat="server" Enabled="False"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="lab_detail_comment" runat="server" Text="comment">備註</asp:Label></TD>
													<TD>
														<asp:textbox id="txt_detail_comment" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="lab_AssembleScheduleId" runat="server" Visible="False" Text="AssembleScheduleId"></asp:Label></TD>
												</TR>
												<TR>
													<TD colSpan="2">
														<asp:Label id="funcdetail" runat="server" Visible="False" Text=""></asp:Label>
														<asp:button id="btn_add_edit_detail" runat="server" Text="保存"></asp:button></TD>
												</TR>
												<TR>
													<TD colSpan="2">
														<asp:datagrid id="dg_AssembleScheduleDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
															CellPadding="2">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn HeaderText="Id" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_Id" runat="server">Id</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="partNo">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_partNo" runat="server">零件編號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="tuhao">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_tuhao" runat="server">圖號</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_tuhao" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tuhao")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_tuhao" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tuhao") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="comment">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_comment" runat="server">備註</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_detailcomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_detailcomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="AssembleScheduleId" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_AssembleScheduleId" runat="server">AssembleScheduleId</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_AssembleScheduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssembleScheduleId")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_AssembleScheduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssembleScheduleId") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="動作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
																<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;>刪除</div>" HeaderText="動作"
																	CommandName="Delete"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid>
														<HR style="COLOR: #ccccff">
														<BR>
													</TD>
												</TR>
											</TABLE>
										</TD>
									</TR>
								</TABLE>
							</asp:Panel>
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
