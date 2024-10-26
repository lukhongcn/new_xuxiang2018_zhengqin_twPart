<%@ Page language="c#" Codebehind="KnifeChooseList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.KnifeChooseList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="KnifeChooseHeader" Src="controls/KnifeChooseHeader.ascx" %>
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
							<uc1:knifechooseheader id="KnifeChooseHeader" runat="server"></uc1:knifechooseheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_KnifeChoose" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_id" runat="server">索引</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productNo" runat="server">工令單號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="machineId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_machineId" runat="server">幾台編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_machineId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MachineId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server">模具編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partNoId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partNoId" runat="server">零件子編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNoId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="processId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_processId" runat="server">加工工序</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_processId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="factStartDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factStartDate" runat="server">實際開工日</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factStartDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactStartDate","{0:d}")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="factEndDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_factEndDate" runat="server">實際結束日</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_factEndDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactEndDate","{0:d}")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="expectedStartDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectedStartDate" runat="server">預計開工日</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectedStartDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedStartDate","{0:d}")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="expectedEndDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectedEndDate" runat="server">預計完工日</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectedEndDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedEndDate","{0:d}")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server">備註</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn ButtonType="LinkButton" CommandName="Detail" Text="顯示全部信息"></asp:ButtonColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "KnifeChooseView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定要刪除此記錄嗎？')&quot;>刪除</div>"
																HeaderText="" CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<asp:datagrid id="dg_KnifeChooseDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<ASP:TEMPLATECOLUMN HeaderText="programNo">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_programNo" runat="server">程式編號</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_programNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProgramNo")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_programNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.programNo") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="knifeId">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_knifeId" runat="server">刀具編號</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_knifeId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.KnifeId")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_knifeId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.knifeId") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="expectedLength">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_expectedLength" runat="server">預計加工長度</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_expectedLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedLength")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_expectedLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedLength") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="zrax">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_zrax" runat="server">Z軸進給</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_zrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Zrax")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_zrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.zrax") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="xyrax">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_xyrax" runat="server">XY軸進給</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_xyrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Xyrax")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_xyrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.xyrax") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="preserveredLength">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_preserveredLength" runat="server">預留量</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_preserveredLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PreserveredLength")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_preserveredLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.preserveredLength") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="doMethod">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_doMethod" runat="server">加工模式</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_doMethod runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.DoMethod")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_doMethod runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.doMethod") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="mainSpeed">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_mainSpeed" runat="server">主軸轉速</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_mainSpeed runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MainSpeed")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_mainSpeed runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.mainSpeed") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="processRate">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_processRate" runat="server">進給率</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id=dg_lab_processRate runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessRate")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_processRate runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processRate") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="comment">
																<HEADERTEMPLATE>
																	<asp:Label id="Label1" runat="server">備註</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	&nbsp;
																	<asp:Label id="Label2" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_comment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
														</Columns>
													</asp:datagrid>
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
