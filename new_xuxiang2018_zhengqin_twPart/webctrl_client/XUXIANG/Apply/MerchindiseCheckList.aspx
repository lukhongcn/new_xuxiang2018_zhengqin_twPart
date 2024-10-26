<%@ Page language="c#" Codebehind="MerchindiseCheckList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseCheckList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="MerchindiseCheckHeader" Src="controls/MerchindiseCheckHeader.ascx" %>
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
							<uc1:MerchindiseCheckHeader id="MerchindiseCheckHeader" runat="server"></uc1:MerchindiseCheckHeader><br>
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
													<asp:datagrid id="dg_MerchindiseCheck" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
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
															<asp:TemplateColumn HeaderText="checkNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkNo" runat="server">驗收單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkDate" runat="server">驗收日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseOrderNo" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseOrderNo" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseOrderNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseOrderNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseOrderNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseOrderNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseID" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseID" runat="server">採購單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseID" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseID")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseID" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseID") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseDate" runat="server">採購日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="faxType">
																<HeaderTemplate>
																	<asp:Label id="dg_header_faxType" runat="server">稅別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_faxType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FaxType")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_faxType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.faxType") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="applierNo" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_applierNo" runat="server">供應商</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_applierNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplierNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_applierNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applierNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="applierName" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_applierName" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_applierName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplierName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_applierName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applierName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moneyTypeId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moneyTypeId" runat="server">憋別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moneyTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MoneyTypeId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moneyTypeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moneyTypeId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moneyTypeName" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moneyTypeName" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moneyTypeName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MoneyTypeName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moneyTypeName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moneyTypeName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="changeRate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_changeRate" runat="server">匯率</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_changeRate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ChangeRate")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_changeRate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.changeRate") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="payCondition">
																<HeaderTemplate>
																	<asp:Label id="dg_header_payCondition" runat="server">付款條件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_payCondition" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PayCondition")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_payCondition" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.payCondition") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="payDays">
																<HeaderTemplate>
																	<asp:Label id="dg_header_payDays" runat="server">付款天數</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_payDays" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PayDays")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_payDays" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.payDays") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ohterCondition">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ohterCondition" runat="server">其他條件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ohterCondition" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OhterCondition")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ohterCondition" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ohterCondition") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server">摘要</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
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
															<asp:TemplateColumn HeaderText="createrDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_createrDate" runat="server">制單日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_createrDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreaterDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_createrDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.createrDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="applyDepartmentManage" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_applyDepartmentManage" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_applyDepartmentManage" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyDepartmentManage")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_applyDepartmentManage" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applyDepartmentManage") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="evaluateDate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_evaluateDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_evaluateDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EvaluateDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_evaluateDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.evaluateDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "MerchindiseCheckView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
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
