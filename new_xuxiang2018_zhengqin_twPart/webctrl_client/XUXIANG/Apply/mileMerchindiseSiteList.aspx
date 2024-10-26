<%@ Page language="c#" Codebehind="mileMerchindiseSiteList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.mileMerchindiseSiteList" %>
<%@ Register TagPrefix="uc1" TagName="mileMerchindiseSiteHeader" Src="controls/mileMerchindiseSiteHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
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
						<TD vAlign="top" width="79%"><uc1:milemerchindisesiteheader id="mileMerchindiseSiteHeader" runat="server"></uc1:milemerchindisesiteheader><br>
							<hr>
							<asp:label id="lab_print" Text="" Runat="server"></asp:label>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_MerchindiseSite" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="Id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseNo" runat="server">採購單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="MerchindiseApplyId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestMerchindiseApplyId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestMerchindiseApplyId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseCreateDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseCreateDate" runat="server">採購日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseCreateDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseArriveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseCreateDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseArriveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseInputDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseInputDate" runat="server">到貨日</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseInputDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseInputDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseInputDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseInputDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="supplyId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_supplyId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_supplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestMerchindiseApplyId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_supplyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestMerchindiseApplyId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseOhterCondition">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseOhterCondition" runat="server">其他條件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseOhterCondition" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseOhterCondition")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseOhterCondition" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseOhterCondition") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="merchindisePayDays">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindisePayDays" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindisePayDays" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindisePayDays")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindisePayDays" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindisePayDays") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="merchindiseFaxType">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseFaxType" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseFaxType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseFaxType")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseFaxType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseFaxType") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="merchindiseMoneyId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseMoneyId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseMoneyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseMoneyId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseMoneyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseMoneyId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="changeRate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_changeRate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_changeRate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ChangeRate")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_changeRate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.changeRate") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="tradeCondition">
																<HeaderTemplate>
																	<asp:Label id="dg_header_tradeCondition" runat="server">交易條件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_tradeCondition" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TradeCondition")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_tradeCondition" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tradeCondition") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="site">
																<HeaderTemplate>
																	<asp:Label id="dg_header_site" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_site" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Site")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_site" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.site") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment") %>'/>
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
																	<asp:textbox id="dg_txt_creater" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creater") %>'/>
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
															<asp:TemplateColumn Visible="False" HeaderText="checker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checker" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="checkDeate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkDeate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkDeate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckerDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkDeate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckerDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="approver">
																<HeaderTemplate>
																	<asp:Label id="dg_header_approver" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_approver" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Approver")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_approver" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.approver") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="approvDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_approvDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_approvDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApproverDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_approvDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApproverDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assertManage">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assertManage" runat="server">資產管理員</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assertManage" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssertManage")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assertManage" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assertManage") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="purchaserId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_purchaserId" runat="server">申購編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_purchaserId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.purchaserId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_purchaserId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.purchaserId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="purchaser">
																<HeaderTemplate>
																	<asp:Label id="dg_header_purchaser" runat="server">申購人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_purchaser" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.purchaser")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_purchaser" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.purchaser") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="deliverysite">
																<HeaderTemplate>
																	<asp:Label id="dg_header_deliverysite" runat="server">送貨地點</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_deliverysite" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.deliverysite")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_deliverysite" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.deliverysite") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="manageCheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_manageCheckDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_manageCheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ManageCheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_manageCheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.manageCheckDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="departfinacial">
																<HeaderTemplate>
																	<asp:Label id="dg_header_departfinacial" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_departfinacial" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestMerchindiseApplyNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_departfinacial" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestMerchindiseApplyNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="finacialCheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_finacialCheckDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_finacialCheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FinacialCheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_finacialCheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.finacialCheckDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="isAccountFinished">
																<HeaderTemplate>
																	<asp:Label id="dg_header_isAccountFinished" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_isAccountFinished" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsAccountFinished")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_isAccountFinished" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isAccountFinished") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="status">
																<HeaderTemplate>
																	<asp:Label id="dg_header_status" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_status" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Status")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_status" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.status") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "mileMerchindiseSiteView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="" EditText="採購明細"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
															<asp:ButtonColumn Text="採購單打印" HeaderText="採購單打印" CommandName="print"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<asp:label id="lab_Id" runat="server" Visible="False"></asp:label><asp:datagrid id="dg_merchindiseSiteDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="id">
																<HeaderTemplate>
																	<asp:Label id="Label1" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="Label2" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseNoDetail">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseNoDetail" runat="server">採購單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseNoDetail" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseNoDetail" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseCreateDateDetail">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseCreateDateDetail" runat="server">採購日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseCreateDateDetail" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseArriveDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseCreateDateDetail" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseArriveDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseInputDateDetail">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseInputDateDetail" runat="server">交貨日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseInputDateDetail" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseInputDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseInputDateDetail" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseInputDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productName" runat="server">物料名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assetsType" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assetsType" runat="server">類型</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assetsType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssetsType")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assetsType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assetsType") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseCount" runat="server">數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseCount") %>'/>
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
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_priceNoTax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.priceNoTax") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid><asp:button id="btn_print" runat="server" Text=" 打印" Visible="False"></asp:button>
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
