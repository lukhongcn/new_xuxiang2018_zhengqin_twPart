<%@ Page language="c#" Codebehind="MeasuringList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MeasuringList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="MeasuringHeader" Src="controls/MeasuringHeader.ascx" %>
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
							<uc1:MeasuringHeader id="MeasuringHeader" runat="server"></uc1:MeasuringHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_Measuring" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
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
															<asp:TemplateColumn HeaderText="InstrumentNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_InstrumentNo" runat="server">儀器編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_InstrumentNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InstrumentNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_InstrumentNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InstrumentNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="InstrumentName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_InstrumentName" runat="server">儀器名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_InstrumentName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InstrumentName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_InstrumentName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InstrumentName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="salesupply">
																<HeaderTemplate>
																	<asp:Label id="dg_header_salesupply" runat="server">銷售廠商</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_salesupply" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Salesupply")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_salesupply" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.salesupply") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="stw">
																<HeaderTemplate>
																	<asp:Label id="dg_header_stw" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_stw" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Stw")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_stw" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.stw") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="specifications">
																<HeaderTemplate>
																	<asp:Label id="dg_header_specifications" runat="server">規格</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_specifications" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Specifications")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_specifications" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.specifications") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="inputDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inputDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inputDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InputDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inputDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inputDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="CorrectionCycle">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CorrectionCycle" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CorrectionCycle" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CorrectionCycle")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CorrectionCycle" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CorrectionCycle") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="CorrectionStyle">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CorrectionStyle" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CorrectionStyle" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CorrectionStyle")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CorrectionStyle" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CorrectionStyle") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="minreading">
																<HeaderTemplate>
																	<asp:Label id="dg_header_minreading" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_minreading" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Minreading")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_minreading" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.minreading") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="allowstandard">
																<HeaderTemplate>
																	<asp:Label id="dg_header_allowstandard" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_allowstandard" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Allowstandard")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_allowstandard" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.allowstandard") %>'/>
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
															<asp:TemplateColumn Visible="False" HeaderText="testedDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_testedDate" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_testedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TestedDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_testedDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.testedDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CustodyDepartment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CustodyDepartment" runat="server">保管部門</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CustodyDepartment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustodyDepartment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CustodyDepartment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustodyDepartment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Custodier">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Custodier" runat="server">保管人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Custodier" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Custodier")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Custodier" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Custodier") %>'/>
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
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "MeasuringView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定要刪除嗎?')&quot;&gt;刪除&lt;/div&gt;"
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
