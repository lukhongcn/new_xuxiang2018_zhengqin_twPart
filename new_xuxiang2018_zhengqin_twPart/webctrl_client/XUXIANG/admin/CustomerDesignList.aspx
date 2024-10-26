<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CustomerHeader" Src="controls/CustomerHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="CustomerDesignList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.CustomerDesignList" %>
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
							<asp:Label id="lab_Id" runat="server" Visible="False"></asp:Label>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_CustomerDesign" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2" AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="Id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server" Visible="False"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MakeFileDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MakeFileDate" runat="server">建檔日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MakeFileDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MakeFileDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MakeFileDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MakeFileDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CustomerId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CustomerId" runat="server">客戶編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CustomerId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerNumber")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CustomerId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerNumber") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CustomerName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CustomerName" runat="server">客戶名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CustomerName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CustomerName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Invoicesrise">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Invoicesrise" runat="server">發票?頭</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Invoicesrise" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Invoicesrise")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Invoicesrise" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Invoicesrise") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="UnityNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_UnityNo" runat="server">統一編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_UnityNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnityNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_UnityNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnityNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="EnglistName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_EnglistName" runat="server">英文全名</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_EnglistName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EnglistName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_EnglistName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EnglistName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Country">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Country" runat="server">國別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Country" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Country")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Country" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Country") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Regional">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Regional" runat="server">區域</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Regional" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Regional")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Regional" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Regional") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ForMan">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ForMan" runat="server">負責人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ForMan" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ForMan")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ForMan" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ForMan") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Contacter">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Contacter" runat="server">聯繫人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Contacter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Contacter")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Contacter" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Contacter") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Gender">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Gender" runat="server">性別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Gender" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Gender")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Gender" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Gender") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CompanyTel">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CompanyTel" runat="server">公司電話</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CompanyTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyTel")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CompanyTel" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyTel") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="CompanyFax">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CompanyFax" runat="server">公司傳真</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CompanyFax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyFax")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CompanyFax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyFax") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Email">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Email" runat="server">e-mail</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Email" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Email")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Email" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Email") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Ip">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Ip" runat="server">IP地址</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Ip" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ip")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Ip" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ip") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="FactoryTel">
																<HeaderTemplate>
																	<asp:Label id="dg_header_FactoryTel" runat="server">廠商電話</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_FactoryTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryTel")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_FactoryTel" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryTel") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="FactoryFax">
																<HeaderTemplate>
																	<asp:Label id="dg_header_FactoryFax" runat="server">廠商傳真</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_FactoryFax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryFax")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_FactoryFax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryFax") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="CompanyAddress">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CompanyAddress" runat="server">公司地址</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CompanyAddress" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyAddress")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CompanyAddress" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyAddress") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Rate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Rate" runat="server">稅率</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Rate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rate")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Rate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rate") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="TransactionsName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_TransactionsName" runat="server">交易條件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_TransactionsName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TransactionsName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_TransactionsName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TransactionsName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="PaymentName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_PaymentName" runat="server">付款條件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_PaymentName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PaymentName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_PaymentName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PaymentName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="TransportName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_TransportName" runat="server">運輸方式</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_TransportName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TransportName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_TransportName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TransportName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Correspondentbank">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Correspondentbank" runat="server">往來銀行</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Correspondentbank" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Correspondentbank")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Correspondentbank" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Correspondentbank") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="BankAccount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_BankAccount" runat="server">銀行賬號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_BankAccount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BankAccount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_BankAccount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BankAccount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Transactionshold">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Transactionshold" runat="server">交易幣別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Transactionshold" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Transactionshold")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Transactionshold" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Transactionshold") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Statementsways">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Statementsways" runat="server">月結方式</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Statementsways" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Statementsways")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Statementsways" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Statementsways") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Businesser">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Businesser" runat="server">業務員</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Businesser" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Businesser")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Businesser" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Businesser") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="AmendmentDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_AmendmentDate" runat="server">修正日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_AmendmentDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AmendmentDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_AmendmentDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AmendmentDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Remark">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Remark" runat="server">備註</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Remark" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Remark")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Remark" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Remark") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "CustomerDesignView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.CustomerId") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="" EditText="其他聯繫人"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<asp:button ID="btn_print" runat="server" text="打印聯繫人" Visible="False"></asp:button>
													<hr style="COLOR: #ccccff">
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
