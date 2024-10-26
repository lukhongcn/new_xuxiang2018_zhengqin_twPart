<%@ Page language="c#" Codebehind="CustomerDesignView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.CustomerDesignView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CustomerHeader" Src="controls/CustomerHeader.ascx" %>
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
							<uc1:CustomerHeader id="CustomerHeader" runat="server"></uc1:CustomerHeader>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td><asp:label id="lab_MakeFileDate" runat="server" Text="建檔日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_MakeFileDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_CustomerId" runat="server" Text="客戶編號"></asp:label></td>
												<td><asp:textbox id="txt_CustomerId" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_CustomerName" runat="server" Text="客戶名稱"></asp:label></td>
												<td><asp:textbox id="txt_CustomerName" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_Invoicesrise" runat="server" Text="發票台頭"></asp:label></td>
												<td><asp:textbox id="txt_Invoicesrise" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_UnityNo" runat="server" Text="統一編號"></asp:label></td>
												<td><asp:textbox id="txt_UnityNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_EnglistName" runat="server" Text="英文全名"></asp:label></td>
												<td><asp:textbox id="txt_EnglistName" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Country" runat="server" Text="國別"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Country" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_Regional" runat="server" Text="區域"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Regional" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_ForMan" runat="server" Text="負責人">本公司負責人</asp:label></td>
												<td><asp:dropdownlist id="dpl_ForMan" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_Contacter" runat="server" Text="聯繫人">客戶聯絡人</asp:label></td>
												<td><asp:textbox id="txt_Contacter" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Gender" runat="server" Text="性別"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Gender" runat="server">
														<asp:ListItem Value="先生">先生</asp:ListItem>
														<asp:ListItem Value="小姐">小姐</asp:ListItem>
													</asp:dropdownlist></td>
												<td><asp:label id="lab_CompanyTel" runat="server" Text="公司電話"></asp:label></td>
												<td><asp:textbox id="txt_CompanyTel" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_CompanyFax" runat="server" Text="公司傳真"></asp:label></td>
												<td><asp:textbox id="txt_CompanyFax" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_Email" runat="server" Text="e-mail"></asp:label></td>
												<td><asp:textbox id="txt_Email" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Ip" runat="server" Text="網絡地址"></asp:label></td>
												<td><asp:textbox id="txt_Ip" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_FactoryTel" runat="server" Text="公司電話">工廠電話</asp:label></td>
												<td><asp:textbox id="txt_FactoryTel" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_FactoryFax" runat="server" Text="公司傳真">工廠傳真</asp:label></td>
												<td><asp:textbox id="txt_FactoryFax" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_CompanyAddress" runat="server" Text="公司地址">工廠地址</asp:label></td>
												<td><asp:textbox id="txt_CompanyAddress" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Rate" runat="server" Text="稅率"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Rate" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_TransactionsName" runat="server" Text="交易條件"></asp:label></td>
												<td><asp:dropdownlist id="dpl_TransactionsName" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_PaymentName" runat="server" Text="付款條件"></asp:label></td>
												<td><asp:dropdownlist id="dpl_PaymentName" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_TransportName" runat="server" Text="運輸方式"></asp:label></td>
												<td><asp:dropdownlist id="dpl_TransportName" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Correspondentbank" runat="server" Text="往來銀行"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Correspondentbank" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_BankAccount" runat="server" Text="銀行賬號"></asp:label></td>
												<td><asp:textbox id="txt_BankAccount" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Transactionshold" runat="server" Text="交易幣別"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Transactionshold" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_Statementsways" runat="server" Text="月結方式"></asp:label></td>
												<td><asp:textbox id="txt_Statementsways" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Businesser" runat="server" Text="業務員"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Businesser" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_AmendmentDate" runat="server" Text="修正日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_AmendmentDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Remark" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_Remark" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td colSpan="4">
													<table width="100%" align="center" border="0">
														<tr>
															<td><asp:label id="lab_contactName" runat="server" Text="聯絡人姓名">新增客戶聯絡人姓名</asp:label></td>
															<td><asp:textbox id="txt_contactName" runat="server"></asp:textbox></td>
															<td><asp:label id="lab_contactPosition" runat="server" Text="職務"></asp:label></td>
															<td><asp:textbox id="txt_contactPosition" runat="server"></asp:textbox></td>
															<td><asp:label id="lab_contactMobileCell" runat="server" Text="手機"></asp:label></td>
															<td><asp:textbox id="txt_contactMobileCell" runat="server"></asp:textbox></td>
														</tr>
														<tr>
															<td><asp:label id="lab_contactFax" runat="server" Text="傳真"></asp:label></td>
															<td><asp:textbox id="txt_contactFax" runat="server"></asp:textbox></td>
															<td><asp:label id="lab_contactTel" runat="server" Text="電話"></asp:label></td>
															<td><asp:textbox id="txt_contactTel" runat="server"></asp:textbox></td>
															<td><asp:label id="lab_contactEmail" runat="server" Text="E-Mail"></asp:label></td>
															<td><asp:textbox id="txt_contactEmail" runat="server"></asp:textbox></td>
														</tr>
														<tr>
															<td><asp:label id="lab_contactComment" runat="server" Text="備註 "></asp:label></td>
															<td><asp:textbox id="txt_contactComment" runat="server"></asp:textbox></td>
														</tr>
														<TR>
															<TD><asp:button id="Btn_addContacter" runat="server" Text="增加其它聯繫人"></asp:button></TD>
														</TR>
														<tr>
															<td colSpan="6"><asp:datagrid id="dg_Contacter" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
																	AllowPaging="True">
																	<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
																	<Columns>
																		<asp:TemplateColumn HeaderText="contactName">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_contactName" text="姓名" runat="server" />
																			</HeaderTemplate>
																			<ItemTemplate>
																				<asp:Label id="dg_lab_contactName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactName")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_contactName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactName") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="contactPosition">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_contactPosition" runat="server" text="職務" />
																			</HeaderTemplate>
																			<ItemTemplate>
																				<asp:Label id="dg_lab_contactPosition" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactPosition")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_contactPosition" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactPosition") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="contactMobileCell">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_contactMobileCell" runat="server" text="手機" />
																			</HeaderTemplate>
																			<ItemTemplate>
																				<asp:Label id="dg_lab_contactMobileCell" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactMobileCell")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_contactMobileCell" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactMobileCell") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="contactFax">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_contactFax" runat="server" text="傳真" />
																			</HeaderTemplate>
																			<ItemTemplate>
																				<asp:Label id="dg_lab_contactFax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactFax")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_contactFax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactFax") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="contactTel">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_contactTel" runat="server" text="電話" />
																			</HeaderTemplate>
																			<ItemTemplate>
																				<asp:Label id="dg_lab_contactTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactTel")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_contactTel" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactTel") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="contactEmail">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_contactEmail" runat="server" text="Email" />
																			</HeaderTemplate>
																			<ItemTemplate>
																				<asp:Label id="dg_lab_contactEmail" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactEmail")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_contactEmail" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactEmail") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="contactComment">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_contactComment" runat="server" text="備註" />
																			</HeaderTemplate>
																			<ItemTemplate>
																				<asp:Label id="dg_lab_contactComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactComment")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_contactComment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactComment") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="編輯" EditText="編輯"></asp:EditCommandColumn>
																		<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('是否刪除')&quot;>刪除</div>" HeaderText="動作"
																			CommandName="Delete"></asp:ButtonColumn>
																	</Columns>
																	<PagerStyle Mode="NumericPages"></PagerStyle>
																</asp:datagrid><asp:label id="Label1" runat="server" Visible="False" Text=""></asp:label><asp:button id="Button1" runat="server" Text="增加"></asp:button>
																<hr style="COLOR: #ccccff">
																<br>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
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
