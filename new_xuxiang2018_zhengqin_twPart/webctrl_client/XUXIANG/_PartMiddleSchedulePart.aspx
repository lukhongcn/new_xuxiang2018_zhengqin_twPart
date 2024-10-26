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
		<title>�Ҩ㤤��{�]�w</title>
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
												<asp:ButtonColumn Text="processname[processid]" CommandName="process" HeaderText="�u��"></asp:ButtonColumn>
											</Columns>
										</asp:datagrid><br>
										<p align="center"><asp:button id="btn_allprocess" Runat="server" Text="��ܥ����u��"></asp:button></p>
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
												<td colSpan="4">�]�w�s�󤤤�{</td>
											</tr>
											<tr>
												<td width="15%" bgColor="#cccccc">�Ҩ�s��</td>
												<td width="35%"><asp:label id="lab_moduleid" Runat="server"></asp:label></td>
												<td width="15%" bgColor="#cccccc">�s��s��</td>
												<td width="35%"><asp:label id="lab_partno" Runat="server"></asp:label></td>
											</tr>
											<tr>
												<td bgColor="#cccccc">�s��s��ID</td>
												<td><asp:label id="lab_partnoid" Runat="server"></asp:label></td>
												<td bgColor="#cccccc">�u�ǦW��</td>
												<td><asp:dropdownlist id="drp_processlist" Runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td bgColor="#cccccc">�}�l���</td>
												<td><wc:inputcalendar id="dat_startdate" runat="server" size="10"></wc:inputcalendar></td>
												<td bgColor="#cccccc">�������</td>
												<td><wc:inputcalendar id="dat_enddate" runat="server" size="10"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td colSpan="4"><asp:button id="btn_submit" Runat="server" Text="�]�w"></asp:button></td>
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
									<asp:BoundColumn DataField="partno_id" HeaderText="�s��s��ID"></asp:BoundColumn>
									<asp:BoundColumn DataField="processid" HeaderText="�u�ǽs��" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="processname" HeaderText="�u�ǦW��"></asp:BoundColumn>
									<asp:BoundColumn DataField="middlestartdate" HeaderText="���Ƶ{�}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="middleenddate" HeaderText="���Ƶ{�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
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
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
