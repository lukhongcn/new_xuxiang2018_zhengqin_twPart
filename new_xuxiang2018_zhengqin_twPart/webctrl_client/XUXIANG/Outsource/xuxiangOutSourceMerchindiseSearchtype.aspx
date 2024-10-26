<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="xuxiangOutSourceMerchindiseSearchtype.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Outsource.xuxiangOutSourceMerchindiseSearchtype" %>
<%@ Register TagPrefix="uc1" TagName="OutsourceMerchindiseSiteHeader" Src="control/xuxiangOutsourceMerchindiseSiteHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>ProductMaterialInventorySearchtype</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
  </HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:outsourcemerchindisesiteheader id="OutSourceMerchindiseSiteHeader" runat="server"></uc1:outsourcemerchindisesiteheader><br>
							<hr>
							<FONT face="宋體">
								<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="1">
									<TR>
										<TD><asp:dropdownlist id="dpl_searchtype" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_condition" runat="server"></asp:dropdownlist><asp:textbox id="txt_search" runat="server"></asp:textbox><wc:inputcalendar id="txt_Date" runat="server"></wc:inputcalendar><asp:label ID="lab_timeand" Runat="server" Text="到"></asp:label><wc:inputcalendar id="txt_endDate" runat="server"></wc:inputcalendar><asp:label id="lab_search" runat="server" Visible="False"></asp:label><asp:label id="lab_typeid" runat="server" Visible="False"></asp:label><asp:button id="btn_add" runat="server" Text="添加條件"></asp:button><asp:button id="btn_clear" runat="server" Text="清空"></asp:button><asp:button id="btn_search" runat="server" Text="查 詢"></asp:button></TD>
									</TR>
									<TR>
										<TD><asp:listbox id="ListBox_search" runat="server" Height="130px" Width="100%" Enabled="False"></asp:listbox></TD>
									</TR>
									<tr>
										<td><asp:button ID="btn_print" Runat="server" Text="打印查詢結果" Visible="False"></asp:button></td>
									</tr>
									<tr>
										<td><asp:label id="lab_numbercount" Text="顯示行數" Runat="server"></asp:label><asp:textbox id="txt_numbercount" Runat="server"></asp:textbox></td>
									</tr>
								</TABLE>
								<hr>
								<table>
									<TR>
										<TD><asp:datagrid id="dg_merchindise" runat="server" Width="100%" AllowPaging="True" CellSpacing="2"
												CellPadding="2" AutoGenerateColumns="False" ShowFooter="True" FooterStyle-BackColor="#AAAADD">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<FooterStyle ForeColor="#00C0C0"></FooterStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="merchindiseNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_merchindiseNo" runat="server">採購單號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_merchindiseNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_merchindiseNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False" HeaderText="id">
														<HeaderTemplate>
															<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="outsourceApplyNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_outsourceApplyNo" runat="server">申請單號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_outsourceApplyNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceDetailId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_outsourceApplyNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceDetailId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="assestMerchindiseApplyId">
														<HeaderTemplate>
															<asp:Label id="dg_header_assestMerchindiseApplyId" runat="server">供應商</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_assestMerchindiseApplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequisitionId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_assestMerchindiseApplyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchassestRequisitionIdindiseId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="merchindiseArriveDate">
														<HeaderTemplate>
															<asp:Label id="dg_header_merchindiseArriveDate" runat="server">採購日期</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_merchindiseArriveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseArriveDate")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_merchindiseArriveDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseArriveDate","{0:d}") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="merchindiseNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_moduleno" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_moduleno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partcomment">
														<HeaderTemplate>
															<asp:Label id="dg_header_partcomment" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["CommentShow"]%>'></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_partcomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartComment")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_partcomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartComment") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_partNo" runat="server">零件編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="processId">
														<HeaderTemplate>
															<asp:Label id="dg_header_processId" runat="server">工序</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_processId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processId")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn DataField="OutsourceCount" HeaderText="需採購數量" Visible=False></asp:BoundColumn>
													<asp:TemplateColumn HeaderText="merchindiseCount">
														<HeaderTemplate>
															<asp:Label id="dg_header_merchindiseCount" runat="server">採購數量</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_merchindiseCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseCount")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_merchindiseCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseCount") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="inInventoryCount" Visible=False>
														<HeaderTemplate>
															<asp:Label id="dg_header_inInventoryCount" runat="server">庫存量</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_inInventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InInventoryCount")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_inInventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inInventoryCount") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="merchinediseInputDate">
														<HeaderTemplate>
															<asp:Label id="dg_header_merchinediseInputDate" Runat=server>到貨日期</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_merchinediseInputDate" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseInputDate","{0:d}")%>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="unitPriceNoTax">
														<HeaderTemplate>
															<asp:Label id="dg_header_unitPriceNoTax" runat="server">單價</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_unitPriceNoTax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitPriceNoTax")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_unitPriceNoTax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unitPriceNoTax") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="priceNoTax">
														<HeaderTemplate>
															<asp:Label id="dg_header_priceNoTax" runat="server">金額</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_priceNoTax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PriceNoTax")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
												</Columns>
												<PagerStyle Mode="NumericPages"></PagerStyle>
											</asp:datagrid></TD>
									</TR>
								</table>
							</FONT>
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
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
