<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SupplyHeader" Src="controls/SupplyHeader.ascx" %>
<%@ Page language="c#" Codebehind="SupplyList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.Supply" %>
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
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_Supply" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="supplierId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_supplierId" runat="server" text="供應商編號" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_supplierId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplierId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_supplierId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.supplierId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="supplierName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_supplierName" runat="server" text="供應商名稱" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_supplierName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplierName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_supplierName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.supplierName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="companyTel">
																<HeaderTemplate>
																	<asp:Label id="dg_header_companyTel" runat="server" text="公司電話" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_companyTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyTel")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_companyTel" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.companyTel") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="responsibility">
																<HeaderTemplate>
																	<asp:Label id="dg_header_responsibility" runat="server" text="負責人" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_responsibility" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Responsibility")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_responsibility" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.responsibility") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="conatcted">
																<HeaderTemplate>
																	<asp:Label id="dg_header_conatcted" runat="server" text="聯絡人" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_conatcted" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Conatcted")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_conatcted" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.conatcted") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="grender">
																<HeaderTemplate>
																	<asp:Label id="dg_header_grender" runat="server" text="性別" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_grender" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Grender")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_grender" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.grender") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="extNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_extNo" runat="server" text="分機號碼" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_extNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExtNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_extNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.extNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="mobile">
																<HeaderTemplate>
																	<asp:Label id="dg_header_mobile" runat="server" text="手機" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_mobile" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Mobile")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_mobile" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.mobile") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="companyFax">
																<HeaderTemplate>
																	<asp:Label id="dg_header_companyFax" runat="server" text="傳真" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_companyFax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyFax")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_companyFax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.companyFax") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="email">
																<HeaderTemplate>
																	<asp:Label id="dg_header_email" runat="server" text="E-Mail" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_email" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Email")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_email" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.email") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="factoryTel">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factoryTel" runat="server" text="工廠電話" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_factoryTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryTel")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_factoryTel" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.factoryTel") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="修改" NavigateUrl='<%# "SupplyView.aspx?id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="" EditText="其他聯繫人"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定要刪除嗎')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<br>
													<asp:datagrid id="dg_Contacter" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False" Visible="False">
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
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<asp:label id="lab_Id" runat="server" Visible="False"></asp:label>
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
									<TD width="30" height="28" style="WIDTH: 30px">
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
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
