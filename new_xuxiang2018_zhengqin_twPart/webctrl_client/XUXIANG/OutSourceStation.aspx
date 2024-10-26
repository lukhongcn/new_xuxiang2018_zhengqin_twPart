<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="OutSourceStation.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceStation" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�X�t/�^�t</title>
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
										<div align="left">�X�t/�^�t�޲z<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<table width="100%" align="center" border="0">
								<tr>
									<td><asp:label id="Label1" runat="server" text="���X����/�ƶq"></asp:label></td>
									<td vAlign="top" colSpan="5">&nbsp; <INPUT id="txt_partCount" type="text" name="txt_partCount" runat="server">
										<asp:label id="lab_hiddenActionId" runat="server" Visible="False">Label</asp:label><asp:label id="lab_repeate" runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenModuleId" runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenPartNo" runat="server" Visible="False"></asp:label></td>
									<td colSpan="3"><asp:checkbox id="chk_all" runat="server" Text="����"></asp:checkbox><asp:label id="lab_hiddennumvalue" runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenprocess" runat="server" Visible="False"></asp:label><asp:label id="lab_parnohidden" runat="server" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td><asp:dropdownlist id="drp_processlist" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
									<td><asp:label id="lab_user" runat="server" Text="�ާ@��"></asp:label></td>
									<td><asp:label id="lab_user_value" runat="server" Visible="False"></asp:label>
										<asp:Label id="lab_user_name" runat="server"></asp:Label></td>
									<td>�Ҩ�s��</td>
									<td><asp:label id="lab_moduleIdvalue" runat="server"></asp:label></td>
									<td><asp:label id="lab_partno" runat="server" Text="�s��s��"></asp:label></td>
									<td><asp:label id="lab_partnovalue" runat="server"></asp:label></td>
									<td><asp:label id="lab_action" runat="server" Text="��/�P��">�X�t/�^�t</asp:label></td>
									<td><asp:label id="lab_actionvalue" runat="server"></asp:label></td>
								</tr>
							</table>
							<br>
							<asp:label id="lab_totalcount" runat="server" Visible="False"></asp:label><asp:datagrid id="MainDatagrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="�u�ǽs��"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessName" HeaderText="�u��"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactOutSourceSendDate" HeaderText="�X�t���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactOutSourceSendCount" HeaderText="�X�t��"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactOutSourceGetDate" HeaderText="�^�t���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactOutSourceGetCount" HeaderText="�^�t��"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>����</B></DIV>
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