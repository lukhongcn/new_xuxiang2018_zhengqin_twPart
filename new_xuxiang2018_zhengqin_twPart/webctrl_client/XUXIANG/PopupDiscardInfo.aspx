<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="PopupDiscardInfo.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PopupDiscardInfo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>���o�s��򥻫H��</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="JavaScript">
			self.moveTo(0,0); 
			self.resizeTo(screen.availWidth,screen.availHeight);
			self.focus(); 
		</script>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
	</HEAD>
	<body>
		<form id="form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD class="mainTitle" align="center">���o�s��򥻫H��</TD>
				</TR>
				<TR>
					<TD><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="2"
							CellPadding="2">
							<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
							<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
							<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
							<ItemStyle HorizontalAlign="Center"></ItemStyle>
							<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
								<asp:BoundColumn DataField="OldPartNoId" HeaderText="���o�s��s��"></asp:BoundColumn>
								<asp:BoundColumn DataField="PartNoId" HeaderText="���o�s����o�s��"></asp:BoundColumn>
								<asp:BoundColumn DataField="ProcessId" HeaderText="�u��"></asp:BoundColumn>
								<asp:BoundColumn DataField="ProcessOrder" HeaderText="�u�ǽs��"></asp:BoundColumn>
								<asp:BoundColumn DataField="FactStartDate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
								<asp:BoundColumn DataField="FactEndDate" HeaderText="��ڵ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
								<asp:BoundColumn DataField="FactMinutes" HeaderText="�s����o�u��"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></TD>
				</TR>
				<TR>
					<TD align="center"><asp:label id="lab_status" runat="server" Font-Bold="True" ForeColor="RED"></asp:label></TD>
				</TR>
				<TR>
					<TD align="center"><input onclick="javascript:window.close();" type="button" value="����" name="btn_close"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
