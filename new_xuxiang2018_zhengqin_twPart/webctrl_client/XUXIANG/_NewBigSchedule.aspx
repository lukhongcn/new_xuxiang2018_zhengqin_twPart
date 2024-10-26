<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="_PartModuleMiddleSchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.test.__PartModuleMiddleSchedule" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具中日程設定</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script language="javascript" type="text/javascript">
	  alert(form1.dat_startdate.value);
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<!--being the table of input schedule -->
			模具編號：<asp:label id="lab_moduleid" Runat="server"></asp:label>
			<table id="tab_Out2" borderColor="#0000ff" cellSpacing="0" cellPadding="0" width="100%"
				border="1">
				<tr>
					<td>
						<table id="tab_AddEdit" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<tr>
								<td colSpan="4" rowSpan="1">添加模具中日程</td>
							</tr>
							<tr>
								<td width="10%" bgColor="#cccccc">工序名稱</td>
								<td width="40%"><asp:dropdownlist id="drp_processlist" Runat="server"></asp:dropdownlist></td>
								<td width="10%" bgColor="#cccccc">開始日期</td>
								<td width="40%"><wc:inputcalendar id="dat_startdate" runat="server" size="10"></wc:inputcalendar></td>
							</tr>
							<tr>
								<td width="10%" bgColor="#cccccc">加工時間</td>
								<td width="40%"><asp:TextBox id="tb_processtime" Runat="server"></asp:TextBox></td>
								<td width="10%" bgColor="#cccccc">結束日期</td>
								<td width="40%"><wc:inputcalendar id="dat_enddate" runat="server" size="10"></wc:inputcalendar></td>
							</tr>
							<tr>
								<td colSpan="4"><asp:button id="btn_submit" Runat="server" Text="保存添加"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<!-- end of the input schedule -->
			<!-- begin of the table of schedule -->
			<br>
			<asp:datagrid id="MainDataGrid" runat="server" CellPadding="0" Width="100%">
				<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
				<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
				<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="id" HeaderText="工序"></asp:BoundColumn>
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
						<asp:label id="Label_Message" runat="server"></asp:label></TD>
				</TR>
			</TABLE>
			<!-- end of the note -->
		</form>
	</body>
</HTML>
