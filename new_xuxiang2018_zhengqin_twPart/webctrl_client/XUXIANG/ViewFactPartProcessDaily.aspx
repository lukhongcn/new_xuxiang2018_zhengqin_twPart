<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="ViewFactPartProcessDaily.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ViewFactPartProcessDaily" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>每日加工零件信息瀏覽</title>
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
							<table id="table" cellPadding="2" width="100%" border="1">
								<tr>
									<td>選擇工序<asp:dropdownlist id="ddl_processlist" runat="server"></asp:dropdownlist></td>
									<td>選擇狀態<asp:dropdownlist id="ddl_statuslist" runat="server"></asp:dropdownlist></td>
									<td>選擇日期<wc:inputcalendar id="txt_curdate" runat="server"></wc:inputcalendar></td>
									<td align="right"><asp:button id="btn_search" Text="查詢" Runat="server"></asp:button></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="moduleid" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="partno" HeaderText="零件編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件ID編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="Processid" HeaderText="工序"></asp:BoundColumn>
									<asp:BoundColumn DataField="Statusid" HeaderText="狀態"></asp:BoundColumn>
									<asp:BoundColumn DataField="startdate" HeaderText="計劃開始日期"></asp:BoundColumn>
									<asp:BoundColumn DataField="enddate" HeaderText="計劃結束日期"></asp:BoundColumn>
									<asp:BoundColumn DataField="factstartdate" HeaderText="實際開始日期"></asp:BoundColumn>
									<asp:BoundColumn DataField="factenddate" HeaderText="實際結束日期"></asp:BoundColumn>
									<asp:BoundColumn DataField="processneedminutes" HeaderText="計劃工時"></asp:BoundColumn>
									<asp:BoundColumn DataField="factprocessneedminutes" HeaderText="完成工時"></asp:BoundColumn>
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
