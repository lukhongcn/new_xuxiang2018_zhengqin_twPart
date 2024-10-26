<%@ Page language="c#" Codebehind="KnifeChooseDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.KnifeChooseDetailList" %>
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
					<tr>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
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
														<asp:Label id="dg_header_comment" runat="server">備註</asp:Label>
													</HEADERTEMPLATE>
													<ITEMTEMPLATE>
														&nbsp;
														<asp:Label id=dg_lab_comment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'>
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
							</TABLE>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
