<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="ModuleMiddleScheduleView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModuleMiddleScheduleView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具大排程瀏覽</title>
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
							<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="800" border="1">
								<tr>
									<td bgColor="#aaaadd" colSpan="6"><b>設定查詢條件</b></td>
								</tr>
								<tr>
									<td>設定客戶<asp:dropdownlist id="drp_customerlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td>選擇模具<asp:dropdownlist id="drp_modulelist" Runat="server"></asp:dropdownlist></td>
									<td>選擇重要等級<asp:dropdownlist id="drp_level" Runat="server"></asp:dropdownlist></td>
									<td>選擇年<asp:dropdownlist id="drp_year" Runat="server"></asp:dropdownlist></td>
									<td>選擇月<asp:dropdownlist id="drp_month" Runat="server"></asp:dropdownlist></td>
									<td><asp:button id="btn_search" Runat="server" Text="查詢"></asp:button></td>
								</tr>
							</TABLE>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" Width="1800px" CellSpacing="2" CellPadding="2"
								AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
							</asp:datagrid><br>
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
