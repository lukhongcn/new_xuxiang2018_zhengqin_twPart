<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="ModulePartOverTimeOptView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModulePartOverTimeOptView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具零件超時加工情況瀏覽</title>
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
							<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td bgColor="#aaaadd" colSpan="6"><b>設定查詢條件</b></td>
								</tr>
								<tr>
									<td>超時情況<asp:dropdownlist id="drp_OverOpt" Runat="server"></asp:dropdownlist></td>
									<td><asp:button id="btn_search" Runat="server" Text="查詢"></asp:button></td>
								</tr>
							</TABLE>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="moduleid" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="partno" HeaderText="零件編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件ID編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="計劃工時"></asp:BoundColumn>
									<asp:BoundColumn DataField="DoneMinutes" HeaderText="完成工時"></asp:BoundColumn>
									<asp:BoundColumn DataField="TryDate0" HeaderText="T0" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="TryDate1" HeaderText="T1" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
								</Columns>
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
