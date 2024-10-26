<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="OrderDesignInfoSetting.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderDesignInfoSetting" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>模具基本信息設定</title>
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
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="4"><b>請填寫如下信息</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>模具編號</b><asp:label id="Label_ModuleId" runat="server" ForeColor="Red"></asp:label></td>
									</tr>
									<TR>
										<TD bgcolor="#9999ff" align="center">&nbsp;</TD>
										<TD bgcolor="#9999ff" align="center">計劃日期</TD>
										<TD bgcolor="#9999ff" align="center">實際日期</TD>
									</TR>
									<TR>
										<TD>事前檢討會日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_shiqianjiantao" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_shiqianjiantao_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>基本圖出圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_jibentu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_jibentu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>2D圖出圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_2dtu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_2dtu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>3D圖檔出圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_3dtu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_3dtu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>水路圖出圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_shuilutu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_shuilutu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>模仁圖出圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_morentu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_morentu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>零件圖出圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_lingjiantu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_lingjiantu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>電極檢查日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_dianjitu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_dianjitu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>熱澆道購入日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_rejiaodao" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_rejiaodao_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>模架圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiatu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiatu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>模架購入日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiagouru" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiagouru_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>模架完成日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiawancheng" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiawancheng_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>組立圖出圖日期</TD>
										<TD align="center"><wc:inputcalendar id="tbx_zulitu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_zulitu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>入DCC</TD>
										<TD align="center"><wc:inputcalendar id="tbx_rudcc" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_rudcc_f" runat="server"></wc:inputcalendar></TD>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_Setting" runat="server" Text="設定"></asp:button><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
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
