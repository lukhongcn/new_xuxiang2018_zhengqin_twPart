<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="_PartModuleMiddleSchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.__PartModuleMiddleSchedule" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具中日程設定</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
	</HEAD>
	<body>
		<form id="subform" method="post" runat="server">
			<!--being the table of input schedule -->
			中排程時間設定
			<table id="tab_Out2" cellSpacing="0" cellPadding="0" width="100%" border="1">
				<tr>
					<td>
						<table id="tab_AddEdit" bordercolor="silver" cellSpacing="0" cellPadding="0" width="100%"
							border="1">
							<tr>
								<td colSpan="4">模具編號：<asp:label id="lab_moduleid" Runat="server"></asp:label></td>
							</tr>
							<tr>
								<td width="10%" bgColor="#cccccc">工序名稱</td>
								<td colspan="3"><asp:dropdownlist id="drp_processlist" Runat="server"></asp:dropdownlist></td>
							</tr>
							<tr>
								<td width="10%" bgColor="#cccccc">開始日期</td>
								<td width="40%"><wc:inputcalendar id="dat_startdate" runat="server" size="10"></wc:inputcalendar></td>
								<td width="10%" bgColor="#cccccc">結束日期</td>
								<td width="40%"><wc:inputcalendar id="dat_enddate" runat="server" size="10"></wc:inputcalendar></td>
							</tr>
							<tr>
								<td colSpan="4">&nbsp;</td>
							</tr>
							<tr>
								<td colSpan="4"><asp:button id="btn_submit" Runat="server" Text="保存設定"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<!-- end of the input schedule -->
			<!-- begin of the table of schedule -->
			<br>
			<asp:datagrid id="MainDataGrid" runat="server" CellPadding="0" Width="100%" AutoGenerateColumns="False">
				<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
				<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
				<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="processname" HeaderText="工序"></asp:BoundColumn>
					<asp:BoundColumn DataField="schedulestart" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
					<asp:BoundColumn DataField="scheduleend" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
					<asp:ButtonColumn Text="編輯" HeaderText="功能" CommandName="select"></asp:ButtonColumn>
					<asp:BoundColumn DataField="processid" HeaderText="Hidden" Visible="False"></asp:BoundColumn>
				</Columns>
			</asp:datagrid><br>
			<!-- end of the table of schedule -->
			<!-- begin of the note -->
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
						<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
				</TR>
			</TABLE>
			<!-- end of the note -->
		</form>
	</body>
</HTML>
