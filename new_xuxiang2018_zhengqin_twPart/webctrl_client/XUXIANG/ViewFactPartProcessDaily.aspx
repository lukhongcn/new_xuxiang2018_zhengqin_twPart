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
		<title>�C��[�u�s��H���s��</title>
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
						<TD vAlign="top" width="92%"><A href="default.aspx">��^����</A>
							<table id="table" cellPadding="2" width="100%" border="1">
								<tr>
									<td>��ܤu��<asp:dropdownlist id="ddl_processlist" runat="server"></asp:dropdownlist></td>
									<td>��ܪ��A<asp:dropdownlist id="ddl_statuslist" runat="server"></asp:dropdownlist></td>
									<td>��ܤ��<wc:inputcalendar id="txt_curdate" runat="server"></wc:inputcalendar></td>
									<td align="right"><asp:button id="btn_search" Text="�d��" Runat="server"></asp:button></td>
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
									<asp:BoundColumn DataField="moduleid" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="partno" HeaderText="�s��s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��ID�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="Processid" HeaderText="�u��"></asp:BoundColumn>
									<asp:BoundColumn DataField="Statusid" HeaderText="���A"></asp:BoundColumn>
									<asp:BoundColumn DataField="startdate" HeaderText="�p���}�l���"></asp:BoundColumn>
									<asp:BoundColumn DataField="enddate" HeaderText="�p���������"></asp:BoundColumn>
									<asp:BoundColumn DataField="factstartdate" HeaderText="��ڶ}�l���"></asp:BoundColumn>
									<asp:BoundColumn DataField="factenddate" HeaderText="��ڵ������"></asp:BoundColumn>
									<asp:BoundColumn DataField="processneedminutes" HeaderText="�p���u��"></asp:BoundColumn>
									<asp:BoundColumn DataField="factprocessneedminutes" HeaderText="�����u��"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>����</B></DIV>
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
