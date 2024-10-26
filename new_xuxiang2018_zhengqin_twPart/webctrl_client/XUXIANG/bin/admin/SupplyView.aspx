<%@ Page language="c#" Codebehind="SupplyView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.supplyview" %>
<%@ Register TagPrefix="uc1" TagName="SupplyHeader" Src="controls/SupplyHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>供應商設定</title>
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
							<uc1:SupplyHeader id="SupplyHeader" runat="server"></uc1:SupplyHeader><br>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<TBODY>
									<tr>
										<td vAlign="top">
											<table width="100%" align="center" border="0">
												<TBODY>
													<tr>
														<td><asp:label id="lab_supplierId" runat="server" Text="供應商編號"></asp:label><asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label></td>
														<td><asp:textbox id="txt_supplierId" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_supplierName" runat="server" Text="供應商名稱"></asp:label></td>
														<td><asp:textbox id="txt_supplierName" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_invoiceTitle" runat="server" Text="發票標題"></asp:label></td>
														<td><asp:textbox id="txt_invoiceTitle" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_unityNo" runat="server" Text="統一編號"></asp:label></td>
														<td><asp:textbox id="txt_unityNo" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_factoryRegisterNo" runat="server" Text="工廠登記號"></asp:label></td>
														<td><asp:textbox id="txt_factoryRegisterNo" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_salesRegisterNo" runat="server" Text="營業登記號"></asp:label></td>
														<td><asp:textbox id="txt_salesRegisterNo" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_companyTel" runat="server" Text="電話"></asp:label></td>
														<td><asp:textbox id="txt_companyTel" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_englistFullName" runat="server" Text="英文全名"></asp:label></td>
														<td><asp:textbox id="txt_englistFullName" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_foundType" runat="server" Text="資本類別"></asp:label></td>
														<td><asp:textbox id="txt_foundType" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_responsibility" runat="server" Text="負責人"></asp:label></td>
														<td><asp:dropdownlist id="dpl_responsibility" runat="server"></asp:dropdownlist></td>
														<td><asp:label id="lab_conatcted" runat="server" Text="聯絡人"></asp:label></td>
														<td><asp:textbox id="txt_conatcted" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_grender" runat="server" Text="性別"></asp:label></td>
														<td><asp:dropdownlist id="dpl_grender" runat="server">
																<asp:ListItem Value="先生">先生</asp:ListItem>
																<asp:ListItem Value="小姐">小姐</asp:ListItem>
															</asp:dropdownlist></td>
													</tr>
													<tr>
														<td><asp:label id="lab_extNo" runat="server" Text="分機號"></asp:label></td>
														<td><asp:textbox id="txt_extNo" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_mobile" runat="server" Text="手機號"></asp:label></td>
														<td><asp:textbox id="txt_mobile" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_companyFax" runat="server" Text="傳真"></asp:label></td>
														<td><asp:textbox id="txt_companyFax" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_email" runat="server" Text="E-Mail"></asp:label></td>
														<td><asp:textbox id="txt_email" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_companyAddress" runat="server" Text="地址"></asp:label></td>
														<td><asp:textbox id="txt_companyAddress" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_zip" runat="server" Text="郵政編碼"></asp:label></td>
														<td><asp:textbox id="txt_zip" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_factoryAddress" runat="server" Text="工廠地址"></asp:label></td>
														<td><asp:textbox id="txt_factoryAddress" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_factoryTel" runat="server" Text="工廠電話"></asp:label></td>
														<td><asp:textbox id="txt_factoryTel" runat="server"></asp:textbox></td>
														<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
														<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_moneyTypeId" runat="server" Text="幣別"></asp:label></td>
														<td><asp:dropdownlist id="dpl_moneyTypeId" runat="server"></asp:dropdownlist></td>
														<td><asp:label id="lab_faxId" runat="server" Text="稅別"></asp:label></td>
														<td><asp:dropdownlist id="dpl_faxId" runat="server"></asp:dropdownlist></td>
														<td><asp:label id="lab_tradeCondittionId" runat="server" Text="交易條件"></asp:label></td>
														<td><asp:dropdownlist id="dpl_tradeCondittionId" runat="server"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td><asp:label id="lab_transferId" runat="server" Text="運輸方式"></asp:label></td>
														<td><asp:dropdownlist id="dpl_transferId" runat="server"></asp:dropdownlist></td>
														<td><asp:label id="lab_paymentId" runat="server" Text="付款條件"></asp:label></td>
														<td><asp:dropdownlist id="dpl_paymentId" runat="server"></asp:dropdownlist></td>
													</tr>
												</TBODY>
											</table>
										</td>
									</tr>
									<tr>
									</tr>
								</TBODY>
							</TABLE>
							<table width="100%" align="center" border="0">
								<tr>
									<td><asp:label id="lab_contactName" runat="server" Text="聯絡人姓名"></asp:label></td>
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
									<td colSpan="6"><asp:datagrid id="dg_Contacter" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
											AutoGenerateColumns="False">
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
												<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('是否刪除')&quot;>刪除</div>" HeaderText="刪除"
													CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="增加"></asp:button>
										<hr style="COLOR: #ccccff">
										<br>
									</td>
								</tr>
							</table>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</table>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
			</TD></TR></TBODY></TABLE></TBODY></TABLE></TD></TR></TBODY></TABLE><br>
			<br>
			</TD></TR><TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
		<TBODY>
		</TBODY>
		</TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
