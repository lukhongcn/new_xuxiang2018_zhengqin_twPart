<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="OutSourceMerchindiseSearchtype.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Outsource.OutSourceMerchindiseSearchtype" %>
<%@ Register TagPrefix="uc1" TagName="OutsourceMerchindiseSiteHeader" Src="control/OutsourceMerchindiseSiteHeader.ascx" %>
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
										<TD><asp:dropdownlist id="dpl_searchtype" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_condition" runat="server"></asp:dropdownlist><asp:textbox id="txt_search" runat="server"></asp:textbox><wc:inputcalendar id="txt_Date" runat="server"></wc:inputcalendar><asp:label id="lab_search" runat="server" Visible="False"></asp:label><asp:label id="lab_typeid" runat="server" Visible="False"></asp:label><asp:button id="btn_add" runat="server" Text="添加條件"></asp:button><asp:button id="btn_clear" runat="server" Text="清空"></asp:button><asp:button id="btn_search" runat="server" Text="查 詢"></asp:button></TD>
									</TR>
									<TR>
										<TD><asp:listbox id="ListBox_search" runat="server" Height="130px" Width="100%" Enabled="False"></asp:listbox></TD>
									</TR>
									<tr>
										<td><asp:button ID="btn_print" Runat="server" Text="打印查詢結果" Visible="False"></asp:button></td>
									</tr>
								</TABLE>
								<hr>
								<table>
									<TR>
										<TD><asp:datagrid id="dg_merchindise" runat="server" Width="100%" AllowPaging="True" CellSpacing="2"
												CellPadding="2" AutoGenerateColumns="False">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn Visible="False" HeaderText="id">
														<HeaderTemplate>
															<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False" HeaderText="MerchindiseId">
														<HeaderTemplate>
															<asp:Label id="dg_header_MerchindiseId" runat="server">採購編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_MerchindiseId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_inInventoryId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
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
													<asp:TemplateColumn HeaderText="merchindiseNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_moduleno" runat="server">模具編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_moduleno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="modulename">
														<HeaderTemplate>
															<asp:Label id="dg_header_modulename" runat="server">名稱</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_modulename" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductName")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_modulename" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productName") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_partNo" runat="server">零件</asp:Label>
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
													<asp:BoundColumn DataField="OutsourceCount" HeaderText="需採購數量"></asp:BoundColumn>
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
													<asp:TemplateColumn HeaderText="inInventoryCount">
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
													<asp:TemplateColumn HeaderText="unitPriceNoTax">
														<HeaderTemplate>
															<asp:Label id="dg_header_unitPriceNoTax" runat="server">價格</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_unitPriceNoTax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitPriceNoTax")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_unitPriceNoTax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unitPriceNoTax") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="assestMerchindiseApplyId">
														<HeaderTemplate>
															<asp:Label id="dg_header_assestMerchindiseApplyId" runat="server">供應商</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_assestMerchindiseApplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_assestMerchindiseApplyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="merchindiseArriveDate">
														<HeaderTemplate>
															<asp:Label id="dg_header_merchindiseArriveDate" runat="server">採購時間</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_merchindiseArriveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_merchindiseArriveDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False">
														<ItemTemplate>
															<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "InInventoryView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
															</asp:HyperLink>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:ButtonColumn Visible="False" Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
														HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
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
