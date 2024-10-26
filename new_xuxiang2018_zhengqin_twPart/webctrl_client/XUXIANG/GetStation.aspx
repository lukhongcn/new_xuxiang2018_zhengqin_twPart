<%@ Page language="c#" Codebehind="GetStation.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.GetStation" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>接單/銷單</title>
		<LINK href="css/common.css" rel="stylesheet">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function getFocus()
			{
				document.Form1.txt_partCount.focus();
			}
		</script>
	</HEAD>
	<body topMargin="0" onload="getFocus()">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">接單/銷單管理<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<table width="100%" align="center" border="0">
								<tr>
									<td><asp:label id="Label1" runat="server" text="條碼掃描/數量"></asp:label></td>
									<td vAlign="top" colSpan="5">&nbsp; <INPUT id="txt_partCount" type="text" name="txt_partCount" runat="server">
										<asp:label id="lab_hiddenActionId" runat="server" Visible="False">Label</asp:label></td>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td><asp:dropdownlist id="drp_processlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td><asp:label id="lab_user" runat="server" Text="操作者"></asp:label>
									<td><asp:label id="lab_user_value" runat="server"></asp:label></td>
									<td><asp:label id="lab_moduleId" runat="server" Text="模具編號"></asp:label>
									<td><asp:label id="lab_moduleIdvalue" runat="server"></asp:label></td>
									<td><asp:label id="lab_partno" runat="server" Text="零件編號"></asp:label></td>
									<td><asp:label id="lab_partnovalue" runat="server"></asp:label></td>
									<td><asp:label id="lab_action" runat="server" Text="接/銷單"></asp:label></td>
									<td><asp:label id="lab_actionvalue" runat="server"></asp:label></td>
								</tr>
							</table>
							<br>
							<asp:label id="lab_totalcount" runat="server"></asp:label><asp:datagrid id="MainDatagrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessName" HeaderText="工序"></asp:BoundColumn>
									<asp:BoundColumn DataField="GetTime" HeaderText="接單日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="OutTime" HeaderText="消單日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
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
							</table>
						</TD>
					</tr>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
