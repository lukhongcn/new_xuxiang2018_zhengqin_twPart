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
		<title>模具基本信息設定</title>
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
							選擇客戶<asp:dropdownlist id="Dropdownlist_Customer" runat="server" AutoPostBack="True"></asp:dropdownlist>
							選擇模具<asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="模具搜索"></asp:button><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="4"><b>請填寫
												<asp:label id="Label_ModuleId" runat="server"></asp:label>信息</b></td>
									<TR>
										<TD align="center" bgColor="#9999ff">&nbsp;</TD>
										<TD align="center" bgColor="#9999ff">計劃日期</TD>
										<TD align="center" bgColor="#9999ff">實際日期</TD>
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
									<TR>
										<TD>CAM開粗程式</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMK" runat="server"></wc:inputcalendar></TD>
										<td align="center"><wc:inputcalendar id="inc_CAMKF" runat="server"></wc:inputcalendar></td>
									</TR>
									<TR>
										<TD>CNC精銑</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMCNC" runat="server"></wc:inputcalendar></TD>
										<td align="center">
											<wc:inputcalendar id="inc_CAMCNCF" runat="server"></wc:inputcalendar></td>
									</TR>
									<TR>
										<TD>電機設計</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMELE" runat="server"></wc:inputcalendar></TD>
										<td align="center">
											<wc:inputcalendar id="inc_CAMELEF" runat="server"></wc:inputcalendar></td>
									</TR>
									<TR>
										<TD>放電圖出圖</TD>
										<TD align="center"><wc:inputcalendar id="inc_CAMELEPIC" runat="server"></wc:inputcalendar></TD>
										<td align="center">
											<wc:inputcalendar id="inc_CAMELEPICF" runat="server"></wc:inputcalendar></td>
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
		</TR></TBODY></TABLE></FORM>
	</body>
</HTML>
