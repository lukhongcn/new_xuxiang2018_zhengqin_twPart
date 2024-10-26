<%@ Page language="c#" Codebehind="OrderCamDesignInfoSetting.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderCamDesignInfoSetting" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
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
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:orderheader id="OrderHeader" runat="server"></uc1:orderheader><BR>
							��ܫȤ�<asp:dropdownlist id="Dropdownlist_Customer" runat="server" AutoPostBack="True"></asp:dropdownlist>
							��ܼҨ�<asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="�Ҩ�j��"></asp:button><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="4"><b>�ж�g
												<asp:label id="Label_ModuleId" runat="server"></asp:label>�H��</b></td>
									<TR>
										<TD align="center" bgColor="#9999ff">&nbsp;</TD>
										<TD align="center" bgColor="#9999ff">�p�����</TD>
										<TD align="center" bgColor="#9999ff">��ڤ��</TD>
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
									<TR>
										<TD>CAM�}�ʵ{��</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMK" runat="server"></wc:inputcalendar></TD>
										<td align="center"><wc:inputcalendar id="inc_CAMKF" runat="server"></wc:inputcalendar></td>
									</TR>
									<TR>
										<TD>CNC���</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMCNC" runat="server"></wc:inputcalendar></TD>
										<td align="center">
											<wc:inputcalendar id="inc_CAMCNCF" runat="server"></wc:inputcalendar></td>
									</TR>
									<TR>
										<TD>�q���]�p</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMELE" runat="server"></wc:inputcalendar></TD>
										<td align="center">
											<wc:inputcalendar id="inc_CAMELEF" runat="server"></wc:inputcalendar></td>
									</TR>
									<TR>
										<TD>��q�ϥX��</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMELEPIC" runat="server"></wc:inputcalendar></TD>
										<td align="center">
											<wc:inputcalendar id="inc_CAMELEPICF" runat="server"></wc:inputcalendar></td>
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
		</TR></TBODY></TABLE></FORM>
	</body>
</HTML>
