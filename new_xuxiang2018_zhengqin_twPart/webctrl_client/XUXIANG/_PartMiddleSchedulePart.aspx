<%@ Page language="c#" Codebehind="_PartMiddleSchedulePart.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow._PartMiddleSchedulePart" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具中日程設定</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD vAlign="top" align="left" width="10%">
							<table id="tab_processlist" cellSpacing="0" cellPadding="0" width="95%" align="left" border="0">
								<tr>
									<td><asp:datagrid id="dgd_processlist" runat="server" CellPadding="0" AutoGenerateColumns="False"
											Width="100%">
											<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
											<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="processid" Visible="False"></asp:BoundColumn>
												<asp:ButtonColumn Text="processname[processid]" CommandName="process" HeaderText="工序"></asp:ButtonColumn>
											</Columns>
										</asp:datagrid><br>
										<p align="center"><asp:button id="btn_allprocess" Runat="server" Text="選擇全部工序"></asp:button></p>
									</td>
								</tr>
							</table>
						</TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="89%">
							<table id="tab_Out2" borderColor="#0000ff" cellSpacing="0" cellPadding="0" width="100%"
								border="1">
								<tr>
									<td>
										<table id="tab_AddEdit" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<tr>
												<td colSpan="4">設定零件中日程</td>
											</tr>
											<tr>
												<td width="15%" bgColor="#cccccc">模具編號</td>
												<td width="35%"><asp:label id="lab_moduleid" Runat="server"></asp:label></td>
												<td width="15%" bgColor="#cccccc">零件編號</td>
												<td width="35%"><asp:label id="lab_partno" Runat="server"></asp:label></td>
											</tr>
											<tr>
												<td bgColor="#cccccc">零件編號ID</td>
												<td><asp:label id="lab_partnoid" Runat="server"></asp:label></td>
												<td bgColor="#cccccc">工序名稱</td>
												<td><asp:dropdownlist id="drp_processlist" Runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td bgColor="#cccccc">開始日期</td>
												<td><wc:inputcalendar id="dat_startdate" runat="server" size="10"></wc:inputcalendar></td>
												<td bgColor="#cccccc">結束日期</td>
												<td><wc:inputcalendar id="dat_enddate" runat="server" size="10"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td colSpan="4"><asp:button id="btn_submit" Runat="server" Text="設定"></asp:button></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<asp:datagrid id="MainDataGrid" runat="server" CellPadding="0" AutoGenerateColumns="False" Width="100%"
								CellSpacing="0">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="partno_id" HeaderText="零件編號ID"></asp:BoundColumn>
									<asp:BoundColumn DataField="processid" HeaderText="工序編號" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="processname" HeaderText="工序名稱"></asp:BoundColumn>
									<asp:BoundColumn DataField="middlestartdate" HeaderText="中排程開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="middleenddate" HeaderText="中排程結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
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
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
