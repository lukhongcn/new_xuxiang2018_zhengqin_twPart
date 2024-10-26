<%@ Page language="c#" Codebehind="xuxiangOutSourceMerchindiseSiteView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangOutsourceMerchindiseSiteView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OutsourceMerchindiseSiteHeader" Src="control/xuxiangOutsourceMerchindiseSiteHeader.ascx" %>
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
						<TD vAlign="top" width="79%"><uc1:outsourcemerchindisesiteheader id="outsourceMerchindiseSiteHeader" runat="server"></uc1:outsourcemerchindisesiteheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0" DESIGNTIMEDRAGDROP="21">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<TBODY>
												<tr>
													<td><asp:label id="lab_merchindiseNo" runat="server" Text="採購單號"></asp:label></td>
													<td><asp:textbox id="txt_merchindiseNo" runat="server" ReadOnly="True"></asp:textbox></td>
													<td><asp:label id="lab_MerchindiseApplyId" runat="server" Text="委外申請單號"></asp:label></td>
													<td><asp:dropdownlist id="dpl_MerchindiseApplyId" runat="server"></asp:dropdownlist></td>
													<td><asp:label id="lab_merchindiseCreateDate" runat="server" Text="採購日期"></asp:label></td>
													<td><wc:inputcalendar id="txt_merchindiseCreateDate" runat="server"></wc:inputcalendar></td>
												</tr>
												<tr>
													<td><asp:label id="lab_merchindiseInputDate" runat="server" Text="到貨日"></asp:label></td>
													<td><wc:inputcalendar id="txt_merchindiseInputDate" runat="server"></wc:inputcalendar></td>
													<td><asp:label id="lab_supplyId" runat="server" Text="廠商"></asp:label></td>
													<td><asp:dropdownlist id="dpl_supplyId" runat="server"></asp:dropdownlist></td>
													<td><asp:label id="lab_merchindisePayCondition" runat="server" Text="付款條件"></asp:label></td>
													<td><asp:dropdownlist id="dpl_merchindisePayCondition" runat="server"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_merchindiseOhterCondition" runat="server" Text="其他條件"></asp:label></td>
													<td><asp:dropdownlist id="dpl_merchindiseOhterCondition" runat="server"></asp:dropdownlist></td>
													<td><asp:label id="lab_merchindisePayDays" runat="server" Text="付款天數"></asp:label></td>
													<td><asp:textbox id="txt_merchindisePayDays" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_merchindiseFaxType" runat="server" Text="稅別"></asp:label></td>
													<td><asp:dropdownlist id="dpl_merchindiseFaxType" runat="server"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_merchindiseMoneyId" runat="server" Text="幣別"></asp:label></td>
													<td><asp:dropdownlist id="dpl_merchindiseMoneyId" runat="server"></asp:dropdownlist></td>
													<td><asp:label id="lab_changeRate" runat="server" Text="匯率"></asp:label></td>
													<td><asp:textbox id="txt_changeRate" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_tradeCondition" runat="server" Text="交易條件"></asp:label></td>
													<td><asp:dropdownlist id="dpl_tradeCondition" runat="server"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_assertManage" runat="server" Text="資產管理員" Visible="False"></asp:label></td>
													<td><asp:dropdownlist id="dpl_assertManage" runat="server" Visible="False"></asp:dropdownlist></td>
													<td><asp:label id="lab_manageCheckDate" runat="server" Text="資產審核日期" Visible="False"></asp:label></td>
													<td><wc:inputcalendar id="txt_manageCheckDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
													<td><asp:label id="lab_departfinacial" runat="server" Text="財務部" Visible="False"></asp:label></td>
													<td><asp:dropdownlist id="dpl_departfinacial" runat="server" Visible="False"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_site" runat="server" Text="交易地點"></asp:label></td>
													<td><asp:textbox id="txt_site" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_merchindiseuser" runat="server" Text="使用者"></asp:label></td>
													<td><asp:dropdownlist id="dpl_merchindiseuser" runat="server"></asp:dropdownlist></td>
													<td><asp:label id="lab_creater" runat="server" Text="制單人"></asp:label></td>
													<td><asp:textbox id="txt_creater" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_createrDate" runat="server" Text="制單日期"></asp:label></td>
													<td><wc:inputcalendar id="txt_createrDate" runat="server"></wc:inputcalendar></td>
													<td><asp:label id="lab_comment" runat="server" Text="摘要"></asp:label></td>
													<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_approver" runat="server" Text="approver">審核人</asp:label></td>
													<td><asp:textbox id="txt_approver" runat="server" Text=""></asp:textbox></td>
												</tr>
								</tr>
								<tr>
									<td><asp:label id="lab_isAccountFinished" runat="server" Text="是否結帳" Visible="False"></asp:label></td>
									<td><asp:checkbox id="chk_isAccountFinished" runat="server" Visible="False"></asp:checkbox></td>
									<td><asp:label id="lab_finacialCheckDate" runat="server" Text="財務審核日期" Visible="False"></asp:label></td>
									<td><wc:inputcalendar id="txt_finacialCheckDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
								</tr>
								<tr>
									<td><asp:label id="lab_checker" runat="server" Text="checker" Visible="False"></asp:label></td>
									<td><asp:textbox id="txt_checker" runat="server" Text="" Visible="False"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:label id="lab_checkDeate" runat="server" Text="checkDeate" Visible="False"></asp:label></td>
									<td><wc:inputcalendar id="txt_checkDeate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
								</tr>
								<tr>
									<td><asp:label id="lab_approvDate" runat="server" Text="approvDate" Visible="False"></asp:label></td>
									<td><wc:inputcalendar id="txt_approvDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
								</tr>
								<tr>
									<td><asp:label id="lab_status" runat="server" Text="status" Visible="False"></asp:label></td>
									<td><asp:textbox id="txt_status" runat="server" Text="" Visible="False"></asp:textbox></td>
								</tr>
								<TR>
									<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button><asp:label id="lab_applyId" runat="server" Visible="False"></asp:label></TD>
								</TR>
							</TABLE>
							<asp:panel id="pan_outInventorydetail" Runat="server">
								<TABLE id="Table4" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
									width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
									<TR>
										<TD vAlign="top">
											<TABLE width="100%" align="center" border="0">
												<asp:label id="Label1" runat="server" Visible="False" Text=""></asp:label>
												<TR>
													<TD>
														<asp:label id="lab_zdno" runat="server" Visible=False></asp:label><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></TD>
													<TD style="WIDTH: 232px">
														<asp:textbox id="txt_productmaterialno" runat="server" ReadOnly="True"></asp:textbox>
														<asp:Button id="btn_search" runat="server" Text="搜索"></asp:Button></TD>
													<TD style="WIDTH: 156px">
														<asp:label id="lab_partId" runat="server" Text="零件名稱">零件</asp:label></TD>
													<TD>
														<asp:textbox id="txt_partNo" runat="server" ReadOnly="True"></asp:textbox></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 156px">
														<asp:Label id="lab_process" runat="server">工序</asp:Label></TD>
													<TD style="WIDTH: 232px">
														<asp:TextBox id="txt_process" runat="server" ReadOnly="True"></asp:TextBox></TD>
													<TD style="WIDTH: 156px">
														<asp:label id="lab_MerchindiseDetailUnitPrice" runat="server" Text="未稅單價"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_MerchindiseDetailUnitPrice" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="lab_partcomment" Runat="server" Visible=False></asp:Label><%=System.Configuration.ConfigurationSettings.AppSettings["CommentShow"]%></TD>
													<TD>
														<asp:TextBox id="txt_partcomment" ReadOnly="True" Runat="server"></asp:TextBox></TD>
													<TD>
														<asp:label id="lab_MerchindiseDetailAccount" runat="server" Text="採購數量"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_MerchindiseDetailAccount" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:Label id="sourceDetailId" Runat="server">申請單流水號</asp:Label></TD>
													<TD>
														<asp:TextBox id="lab_outsourceDetailId" runat="server" ReadOnly="True"></asp:TextBox></TD>
													<TD>
														<asp:label id="lab_MerchindiseDetailPrice" runat="server" Visible="False" Text="未稅金額"></asp:label></TD>
													<TD style="WIDTH: 232px">
														<asp:textbox id="txt_MerchindiseDetailPrice" runat="server" Visible="False" Enabled="False"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_MerchindiseId" runat="server" Visible="False" Text=""></asp:label></TD>
												</TR>
												<TR>
													<TD style="WIDTH: 365px" colSpan="2">
														<asp:label id="func_Detail" runat="server" Visible="False" Text=""></asp:label>
														<asp:button id="btn_detail_add_edit" runat="server" Text="保存"></asp:button>
														<asp:Label id="lab_oldCount" runat="server" Visible="False"></asp:Label>
														<asp:Button id="btn_print" runat="server" Text="打印報表"></asp:Button>
														<asp:Label id="lab_print" runat="server"></asp:Label></TD>
												</TR>
												<TR>
													<TD colSpan="4">
														<asp:datagrid id="dg_MerchindiseDetailSite" runat="server" AutoGenerateColumns="False" CellSpacing="2"
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
																<asp:TemplateColumn HeaderText="zdno">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_zdno" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_zdno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_zdno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="partNo">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_partNo" runat="server">零件</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="processId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_processId" runat="server">工序</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_processId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_processId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processId") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="OutsourceCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_OutsourceCount" runat="server">需採購數量</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_OutsourceCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_OutsourceCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="merchindiseCount1">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_merchindiseCount1" runat="server">已採購數量</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_merchindiseCount1" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.count")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_merchindiseCount1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.count") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailUnitPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailUnitPrice" runat="server">未稅單價</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailUnitPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitPriceNoTax")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailUnitPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitPriceNoTax") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailPrice" runat="server">未稅金額</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PriceNoTax")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PriceNoTax") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_merchindiseCount" runat="server">採購數</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_merchindiseCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_merchindiseCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseId" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseId" runat="server">MerchindiseId</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId") %>'/>
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
							</asp:panel></TD>
					</tr>
				</TBODY>
			</TABLE>
			<BR>
			<BR>
			<TABLE borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
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
			</TABLE>
			</TD></TR>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
