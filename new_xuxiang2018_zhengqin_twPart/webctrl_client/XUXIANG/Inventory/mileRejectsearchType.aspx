<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RejectHeader" Src="controls/mileRejectHeader.ascx" %>
<%@ Page language="c#" Codebehind="mileRejectsearchType.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Inventory.mileRejectsearchType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>mileRejectsearchType</title>
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
						<TD vAlign="top" width="79%"><FONT face="宋體"></FONT><FONT face="宋體"></FONT><uc1:rejectheader id="RejectHeader" runat="server"></uc1:rejectheader><br>
							<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="1">
								<TR>
									<TD><asp:dropdownlist id="dpl_searchtype" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_condition" runat="server"></asp:dropdownlist><asp:textbox id="txt_search" runat="server"></asp:textbox><wc:inputcalendar id="txt_Date" runat="server"></wc:inputcalendar><asp:label id="lab_timeand" Text="到" Runat="server"></asp:label><wc:inputcalendar id="txt_endDate" runat="server"></wc:inputcalendar><asp:label id="lab_search" runat="server" Visible="False"></asp:label><asp:label id="lab_typeid" runat="server" Visible="False"></asp:label><asp:button id="btn_add" runat="server" Text="添加條件"></asp:button><asp:button id="btn_clear" runat="server" Text="清空"></asp:button><asp:button id="btn_search" runat="server" Text="查 詢"></asp:button><asp:button id="btn_print" Visible="true" Text="打印查詢結果" Runat="server"></asp:button></TD>
								</TR>
								<tr>
									<td><asp:label id="lab_numbercount" Text="顯示行數" Runat="server"></asp:label><asp:textbox id="txt_numbercount" Runat="server"></asp:textbox></td>
								</tr>
								<TR>
									<TD><asp:listbox id="ListBox_search" runat="server" Height="130px" Width="100%" Enabled="False"></asp:listbox></TD>
								</TR>
							</TABLE>
							<hr>
							<TABLE id="Table2" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><FONT face="宋體"></FONT></TD>
											</TR>
											<tr>
												<td colSpan="2"><FONT face="宋體"></FONT><br>
													<asp:datagrid id="dg_RejectDetail" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False" ShowFooter="True" FooterStyle-BackColor="#AAAADD">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<FooterStyle ForeColor="#00C0C0"></FooterStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="RejectNo">
																<HeaderTemplate>
																	<asp:Label ID="dg_header_rejectNo" Runat="server">退貨單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label ID="dg_lab_rejectNo" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.RejectNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">Id</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="RejectDetailNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_RejectDetailNo" runat="server">退貨明細單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_RejectDetailNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectDetailNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_RejectDetailNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectDetailNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="rejectDate">
																<HeaderTemplate>
																	<asp:Label ID="dg_header_rejectDate" Runat="server">退貨日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label ID="dg_lab_rejectDate" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.RejectDate","{0:d}") %>'>
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseNo">
																<HeaderTemplate>
																	<asp:Label ID="dg_header_merchindiseNo" Runat="server">採購單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label ID="dg_lab_merchindiseNo" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo") %>'>
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequisitionId">
																<HeaderTemplate>
																	<asp:Label ID="dg_header_assestRequisitionId" Runat="server">供應商</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label ID="dg_lab_assestRequisitionId" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.SupplierName") %>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestsName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestsName" runat="server">物料編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestsName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestsName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestsName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestsName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="assestNuit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestNuit" runat="server">單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestNuit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestNuit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestNuit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestNuit") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="merchindiseInputType">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseInputType" runat="server">規格</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseInputType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseInputType")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseInputType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseInputType") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="unitprice">
																<HeaderTemplate>
																	<asp:Label id="dg_header_unitprice" runat="server">單價</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_unitprice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unitprice")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_unitprice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unitprice") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="price">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server">金額</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestAccount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestAccount" runat="server">退貨數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestAccount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestAccount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestAccount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestAccount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestComment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestComment" runat="server">備註</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestComment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestComment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestComment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="MerchindiseDetailId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailId" runat="server">MerchindiseDetailId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="RejectId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_RejectId" runat="server">RejectId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_RejectId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_RejectId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RejectId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid></td>
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
