<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="mileRejectDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Inventory.mileRejectDetailList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>mileRejectDetailList</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">退貨明細設定</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_RejectDetailNo" runat="server" Text="退貨明細單號"></asp:label></td>
												<td><asp:textbox id="txt_RejectDetailNo" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestsName" runat="server" Text="物料編號"></asp:label></td>
												<td><asp:dropdownlist id="dpl_assestsName" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 21px"><asp:label id="lab_MerchindiseNo" text="採購單號" Runat="server"></asp:label></td>
												<td style="HEIGHT: 21px"><asp:dropdownlist id="dpl_MerchindiseNo" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestRequisitionId" text="供應商" Runat="server"></asp:label></td>
												<td><asp:dropdownlist id="apl_assestRequisitionId" Runat="server" Enabled="False"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 17px"><asp:label id="lab_assestNuit" runat="server" Text="單位"></asp:label></td>
												<td style="HEIGHT: 17px"><asp:dropdownlist id="dpl_assestNuit" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_price" runat="server" Text="金額"></asp:label></td>
												<td><asp:textbox id="txt_price" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseInputType" runat="server" Text="規格"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseInputType" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_unitprice" runat="server" Text="單價"></asp:label></td>
												<td><asp:textbox id="txt_unitprice" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkAccount" runat="server" Text="進貨數量">採購數量</asp:label></td>
												<td><asp:textbox id="txt_checkAccount" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 23px"><asp:label id="Label1" runat="server" Text="進貨數量"></asp:label></td>
												<td style="HEIGHT: 23px"><asp:textbox id="Textbox1" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestAccount" runat="server" Text="退貨數量"></asp:label></td>
												<td><asp:textbox id="txt_assestAccount" runat="server" AutoPostBack="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestComment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_assestComment" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseDetailId" runat="server" Text="MerchindiseDetailId" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailId" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_RejectId" runat="server" Text="RejectId" Visible="False"></asp:label><asp:label id="lab_inInventoryId" runat="server" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_RejectId" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button><asp:label id="lab_oldRejectCount" runat="server" Visible="False"></asp:label></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_RejectDetail" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
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
															<asp:TemplateColumn HeaderText="assestNuit">
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
															<asp:TemplateColumn HeaderText="merchindiseInputType">
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
															<asp:TemplateColumn Visible="False" HeaderText="assestComment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestComment" runat="server">assestComment</asp:Label>
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
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="動作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
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
