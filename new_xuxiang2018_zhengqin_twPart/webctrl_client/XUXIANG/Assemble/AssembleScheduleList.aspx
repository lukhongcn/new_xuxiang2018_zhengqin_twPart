<%@ Register TagPrefix="uc1" TagName="AssembleScheduleHeader" Src="controls/AssembleScheduleHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="AssembleScheduleList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.AssembleScheduleList" %>
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
						<TD vAlign="top" width="79%"><uc1:assemblescheduleheader id="AssembleScheduleHeader" runat="server"></uc1:assemblescheduleheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_AssembleSchedule" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="scheduleDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_scheduleDate" runat="server">日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_scheduleDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ScheduleDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_scheduleDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.scheduleDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assembleNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assembleNo" runat="server">組立單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assembleNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssembleNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assembleNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assembleNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productNo" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productNo" runat="server">工令單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server" text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="pictureNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_pictureNo" runat="server">圖號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_pictureNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_pictureNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pictureNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="requireDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_requireDate" runat="server">需求日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_requireDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_requireDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.requireDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="expectedDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectedDate" runat="server">預組立日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_expectedDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Assembler">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Assembler" runat="server">組立人員</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Assembler" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Assembler")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Assembler" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Assembler") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Creater" Visible=False>
																<HeaderTemplate>
																	<asp:Label id="dg_header_Creater" runat="server">制單人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Creater" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Creater" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Checker" Visible=False>
																<HeaderTemplate>
																	<asp:Label id="dg_header_Checker" runat="server">審核人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkDate" Visible=False>
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
															<asp:TemplateColumn HeaderText="reApprover" Visible=False>
																<HeaderTemplate>
																	<asp:Label id="dg_header_reApprover" runat="server">複核人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_reApprover" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReApprover")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_reApprover" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.reApprover") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="reApproveDate" Visible=False>
																<HeaderTemplate>
																	<asp:Label id="dg_header_reApproveDate" runat="server">複核日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_reApproveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReApproveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_reApproveDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.reApproveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="approver" Visible=False>
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
															<asp:TemplateColumn HeaderText="approveDate" Visible=False>
																<HeaderTemplate>
																	<asp:Label id="dg_header_approveDate" runat="server">核准日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_approveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApproveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_approveDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.approveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment" Visible=False>
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
															<asp:ButtonColumn Text="詳細信息" CommandName="detail" ></asp:ButtonColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "AssembleScheduleView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確認刪除')&quot;&gt;刪除&lt;/div&gt;" HeaderText="刪除" CommandName="Delete"></asp:ButtonColumn>
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
							<asp:Label ID= "lab_id_detail" Runat=server Visible=False></asp:Label>
							<asp:datagrid id=dg_AssembleScheduleDetail runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False" AllowPaging="True" Visible=False>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD">
</HeaderStyle>

<Columns>
<asp:TemplateColumn Visible="False" HeaderText="Id">
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
																	<asp:Label id="Label1" runat="server">備註</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_detailcomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_detailcomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="False" HeaderText="AssembleScheduleId">
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
</Columns>

<PagerStyle Mode="NumericPages">
</PagerStyle>
													</asp:datagrid>
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
