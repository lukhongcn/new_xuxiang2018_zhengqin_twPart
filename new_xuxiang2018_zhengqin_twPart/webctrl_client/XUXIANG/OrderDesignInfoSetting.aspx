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
		<title>�Ҩ�򥻫H���]�w</title>
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
						<TD vAlign="top" width="92%"><A href="default.aspx">��^����</A>
							<BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="4"><b>�ж�g�p�U�H��</b>&nbsp;&nbsp;&nbsp;&nbsp;<b>�Ҩ�s��</b><asp:label id="Label_ModuleId" runat="server" ForeColor="Red"></asp:label></td>
									</tr>
									<TR>
										<TD bgcolor="#9999ff" align="center">&nbsp;</TD>
										<TD bgcolor="#9999ff" align="center">�p�����</TD>
										<TD bgcolor="#9999ff" align="center">��ڤ��</TD>
									</TR>
									<TR>
										<TD>�ƫe�˰Q�|���</TD>
										<TD align="center"><wc:inputcalendar id="tbx_shiqianjiantao" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_shiqianjiantao_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�򥻹ϥX�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_jibentu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_jibentu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>2D�ϥX�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_2dtu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_2dtu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>3D���ɥX�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_3dtu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_3dtu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�����ϥX�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_shuilutu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_shuilutu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�Ҥ��ϥX�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_morentu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_morentu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�s��ϥX�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_lingjiantu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_lingjiantu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�q���ˬd���</TD>
										<TD align="center"><wc:inputcalendar id="tbx_dianjitu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_dianjitu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>����D�ʤJ���</TD>
										<TD align="center"><wc:inputcalendar id="tbx_rejiaodao" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_rejiaodao_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�Ҭ[�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiatu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiatu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�Ҭ[�ʤJ���</TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiagouru" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiagouru_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�Ҭ[�������</TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiawancheng" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_mojiawancheng_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�ե߹ϥX�Ϥ��</TD>
										<TD align="center"><wc:inputcalendar id="tbx_zulitu" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_zulitu_f" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD>�JDCC</TD>
										<TD align="center"><wc:inputcalendar id="tbx_rudcc" runat="server"></wc:inputcalendar></TD>
										<TD align="center"><wc:inputcalendar id="tbx_rudcc_f" runat="server"></wc:inputcalendar></TD>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_Setting" runat="server" Text="�]�w"></asp:button><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>����</B></DIV>
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
