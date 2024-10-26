<%@ Page language="c#" Codebehind="xuxiangOutSourceMerchindiseSearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangOutSourceMerchindiseSearch" %>
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
		<script language="javascript">
			function returnVal()
			{
				
				window.opener.document.forms['Form1'].txt_productmaterialno.value = '<% = moduleId %>';
				window.opener.document.forms['Form1'].txt_partNo.value = '<% = partNo %>';
				window.opener.document.forms['Form1'].txt_process.value = '<% = processId %>';
				window.opener.document.forms['Form1'].txt_partcomment.value = '<% = partcomment %>';
				window.opener.document.forms['Form1'].lab_outsourceDetailId.value = '<% = outsourceDetailId %>';
				window.close(); 
			}
		</script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_OutSourceApplyDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productOrderId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productOrderId" runat="server">制令單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productOrderId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductOrderId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productOrderId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productOrderId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server">工令單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partNo" runat="server">圖號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="processId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_processId" runat="server">工序</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_processId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_processId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partcomment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partcomment" runat="server">模具編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partcomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartComment")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="outsourceCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outsourceCount" runat="server">外包數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outsourceCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outsourceCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="選中" HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<asp:Label id="Lab_message" runat="server" Width="136px" ForeColor="Red"></asp:Label>
													<asp:Label id="lab_Id" runat="server" Visible="False"></asp:Label>
													<br>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</TABLE>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
			<%=closeWind%>
		</form>
	</body>
</HTML>
