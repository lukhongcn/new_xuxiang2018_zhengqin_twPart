<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MerchindiseCheckDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseCheckDetailList" %>
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
					<tr>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">驗收明細</div>
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
												<td><asp:label id="lab_merchindiseCheckDetailNo" runat="server" Text="驗收明細單號"></asp:label></td>
												<td><asp:textbox id="txt_merchindiseCheckDetailNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_productName" runat="server" Text="物料編號"></asp:label></td>
												<td><asp:dropdownlist id="dpl_productName" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_merchindiseInputType" runat="server" Text="規格"></asp:label></td>
												<td><asp:textbox id="txt_merchindiseInputType" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_unit" runat="server" Text="單位"></asp:label></td>
												<td><asp:dropdownlist id="dpl_unit" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_merchindiseCount" runat="server" Text="訂貨數量"></asp:label></td>
												<td><asp:textbox id="txt_merchindiseCount" runat="server" Enabled="False"></asp:textbox></td>
												<td><asp:label id="lab_checkAccount" runat="server" Text="驗收數量"></asp:label></td>
												<td><asp:textbox id="txt_checkAccount" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_pachageComment" runat="server" Text="包裝狀況描述"></asp:label></td>
												<td><asp:textbox id="txt_pachageComment" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_accountMaterialComment" runat="server" Text="數量及資料狀況描述"></asp:label></td>
												<td><asp:textbox id="txt_accountMaterialComment" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_qualityComment" runat="server" Text="品質狀況描述"></asp:label></td>
												<td><asp:textbox id="txt_qualityComment" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_isPass" runat="server" Text="是否合格"></asp:label></td>
												<td><asp:checkbox id="chk_isPass" runat="server"></asp:checkbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkDepartement" runat="server" Text="驗收部門"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checkDepartement" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_checker" runat="server" Text="驗收人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checker" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkDate" runat="server" Text="驗收日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_merchindiseCheckId" runat="server" Text="merchindiseCheckId" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_merchindiseCheckId" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_price" runat="server" Text="price" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_price" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_unitprice" runat="server" Text="unitprice" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_unitprice" runat="server" Visible="False"></asp:textbox>
													<asp:Label id="lab_merchindiseID" runat="server" Visible="False"></asp:Label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="4"><asp:datagrid id="dg_MerchindiseCheckDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="Id" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">Id</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="merchindiseCheckDetailNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseCheckDetailNo" runat="server">驗收編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseCheckDetailNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseCheckDetailNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseCheckDetailNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseCheckDetailNo") %>'/>
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
															<asp:TemplateColumn HeaderText="unit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_unit" runat="server">單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_unit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Unit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_unit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unit") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
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
															<asp:TemplateColumn HeaderText="checkAccount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkAccount" runat="server">驗收數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkAccount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckAccount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkAccount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkAccount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="pachageComment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_pachageComment" runat="server">pachageComment</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_pachageComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PachageComment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_pachageComment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pachageComment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="accountMaterialComment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_accountMaterialComment" runat="server">accountMaterialComment</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_accountMaterialComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AccountMaterialComment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_accountMaterialComment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.accountMaterialComment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="qualityComment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_qualityComment" runat="server">qualityComment</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_qualityComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.QualityComment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_qualityComment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.qualityComment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="isPass" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_isPass" runat="server">isPass</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_isPass" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsPass")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_isPass" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isPass") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checkDepartement">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checkDepartement" runat="server">驗收部門</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checkDepartement" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDepartement")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checkDepartement" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checkDepartement") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="checker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_checker" runat="server">驗收人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.checker") %>'/>
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
															<asp:TemplateColumn HeaderText="merchindiseCheckId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_merchindiseCheckId" runat="server">merchindiseCheckId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_merchindiseCheckId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseCheckId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_merchindiseCheckId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseCheckId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="price" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server">price</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="unitprice" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_unitprice" runat="server">unitprice</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_unitprice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Unitprice")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_unitprice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unitprice") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="動作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
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
