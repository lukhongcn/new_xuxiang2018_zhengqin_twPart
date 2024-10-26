<%@ Page language="c#" Codebehind="AlertAnaliseView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.AlertAnaliseView" %>
<%@ Register TagPrefix="uc1" TagName="ModulePartDoingNotInScheduleView" Src="controls/ModulePartDoingNotInScheduleView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>零件已加工但未在計劃中警示信息</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<!--<TD vAlign="top" align="left" width="1%"></TD>
						<TD width="1%">&nbsp;</TD>-->
						<TD vAlign="top" width="92%"><A href="default.aspx">返回首頁</A>
							<BR>
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td align="left" width="20%">
										<uc1:LeftMenu id="LeftMenu1" runat="server"></uc1:LeftMenu>設定條件</td>
									<td align="left" width="1%">&nbsp;</td>
									<td valign="top">
										<table>
											<tr>
												<td>
													日期:<wc:inputcalendar id="tbx_Date" runat="server"></wc:inputcalendar>&nbsp;&nbsp;<asp:button id="Button_Search" Text="查詢" Runat="server"></asp:button>
												</td>
											</tr>
											<tr>
												<td>
													<asp:DataGrid id="dgAnalise" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:BoundColumn DataField="ProcessName" HeaderText="工序">
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</asp:BoundColumn>
															<asp:BoundColumn DataField="ExtreAccount" HeaderText="計劃但未執行"></asp:BoundColumn>
															<asp:BoundColumn DataField="NeedCount" HeaderText="計劃外加工"></asp:BoundColumn>
															<asp:BoundColumn DataField="DelayDoneCount" HeaderText="延遲完成"></asp:BoundColumn>
														</Columns>
													</asp:DataGrid><br>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>提示</B></DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
