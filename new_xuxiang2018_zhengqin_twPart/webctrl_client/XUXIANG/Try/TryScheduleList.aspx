<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="TryScheduleList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.TryScheduleList" %>
<%@ Register TagPrefix="uc1" TagName="TryScheduleListHeader" Src="controls/TryScheduleListHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>試模計劃</title>
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
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left"><uc1:tryschedulelistheader id="TryScheduleListHeader1" runat="server"></uc1:tryschedulelistheader></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_TrySchedule" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:BoundColumn DataField="TryScheduleNo" HeaderText="試模編號"></asp:BoundColumn>
															<asp:TemplateColumn HeaderText="expectTryDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectTryDate" runat="server" text="預計完成日期"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectTryDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectTryDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_expectTryDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectTryDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server" text="模具編號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleName" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleName" runat="server" text="模具名稱"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productNo" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productNo" runat="server" text="工令單號" Visible="False"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="cuostomerDate" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_cuostomerDate" runat="server" text="其客戶交期"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_cuostomerDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CuostomerDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_cuostomerDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.cuostomerDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Tn" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Tn" runat="server" text="Tn"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Tn" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tn")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Tn" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tn") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="trySite" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_trySite" runat="server" text="試模地點"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_trySite" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TrySite")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_trySite" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.trySite") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ton" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ton" runat="server" text="機械噸數"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ton" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ton")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ton" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ton") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="price" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server" text="單價"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="expectedMinutes" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectedMinutes" runat="server" text="預計時數"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectedMinutes" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedMinutes")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_expectedMinutes" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedMinutes") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="MaterialId" HeaderText="材質"></asp:BoundColumn>
															<asp:TemplateColumn HeaderText="tryCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_tryCount" runat="server" text="數量"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_tryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TryCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_tryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tryCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="ColorNo" HeaderText="色粉編號"></asp:BoundColumn>
															<asp:TemplateColumn HeaderText="cuostomerDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ColorDate" runat="server" text="顏色送樣日期"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ColorDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ColorDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ColorDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ColorDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:BoundColumn DataField="statusid" HeaderText="狀態"></asp:BoundColumn>
															<asp:TemplateColumn HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server" text="備註"></asp:Label>
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
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "TryScheduleView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定刪除嗎')&quot;>刪除</div>" HeaderText="刪除" CommandName="Delete"></asp:ButtonColumn>
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
