<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="RecommandViewSmallScheduleList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.RecommandViewSmallScheduleList" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�Ҩ�p�Ƶ{�s��</title>
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
						<TD vAlign="top" width="92%">
							<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td vAlign="top">�u��
										<asp:dropdownlist id="Dropdownlist_ProcessId" AutoPostBack="False" Runat="server">
											<asp:ListItem Value="Design">�]�p</asp:ListItem>
											<asp:ListItem Value="Merchandise/PrePare/Texture">�~��/�Ʈ�</asp:ListItem>
											<asp:ListItem Value="Lathe/Milling/Milling/Grind">��/�i</asp:ListItem>
											<asp:ListItem Value="Cut">�u��</asp:ListItem>
											<asp:ListItem Value="CNC">CNC�[�u����</asp:ListItem>
											<asp:ListItem Value="CNCN">CNC���q��</asp:ListItem>
											<asp:ListItem Value="CNCE">CNC�q����</asp:ListItem>
											<asp:ListItem Value="Engraving">�J��</asp:ListItem>
											<asp:ListItem Value="EDM">��q</asp:ListItem>
											<asp:ListItem Value="Flash">����</asp:ListItem>
											<asp:ListItem Value="QC">�~��</asp:ListItem>
											<asp:ListItem Value="Assemble">�ե�</asp:ListItem>
										</asp:dropdownlist>
									</td>
									<td vAlign="top">�Ҩ�<asp:dropdownlist id="DropDownList_ModuleId" AutoPostBack="True" Runat="server"></asp:dropdownlist>
									</td>
									<td vAlign="top">�Ȥ�<asp:dropdownlist id="DropDownList_CustomerId" AutoPostBack="True" Runat="server"></asp:dropdownlist>
									</td>
									<td vAlign="top">�}�l���<wc:inputcalendar id="TextBox_StartDate" runat="server"></wc:inputcalendar>
									</td>
									<td vAlign="top">�������<wc:inputcalendar id="TextBox_EndDate" runat="server"></wc:inputcalendar>
									</td>
									<td vAlign="top"><asp:button id="Button_Search" Runat="server" Text="�d��"></asp:button></td>
								</tr>
							</TABLE>
							<BR>
							<div style="OVERFLOW-Y: scroll; FONT-SIZE: 10px; OVERFLOW-X: scroll; WIDTH: 980px; BORDER-TOP-STYLE: ridge; FONT-FAMILY: Arial; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 500px; BORDER-BOTTOM-STYLE: ridge"><asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" CellPadding="0" CellSpacing="0">
									<ItemStyle Wrap="False"></ItemStyle>
								</asp:datagrid></div>
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>����</B></DIV>
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