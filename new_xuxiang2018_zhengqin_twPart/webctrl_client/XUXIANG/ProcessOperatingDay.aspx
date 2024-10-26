<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="ProcessOperatingDay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProcessOperatingDay" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�D���x�p�Ƶ{�{���޲z</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">��ܤu��<asp:dropdownlist id="Dropdownlist_Process" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False"
								AllowPaging="True" PageSize="15">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��s��ID"></asp:BoundColumn>
									<asp:BoundColumn DataField="processorder" HeaderText="�u�Ǹ�"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="���A">
										<ItemTemplate>
											<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusDesc") %>' ID="Label1">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="StartDate" HeaderText="�}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndDate" HeaderText="�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactStartDate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactEndDate" HeaderText="��ڵ������" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�Ƶ{�u��"></asp:BoundColumn>
									<asp:ButtonColumn Text="�}�l" ButtonType="PushButton" HeaderText="�\��" CommandName="start"></asp:ButtonColumn>
									<asp:ButtonColumn Text="�Ȱ�" ButtonType="PushButton" CommandName="holdon"></asp:ButtonColumn>
									<asp:ButtonColumn Text="����" ButtonType="PushButton" CommandName="end"></asp:ButtonColumn>
									<asp:BoundColumn Visible="False" DataField="StatusColor" HeaderText="color"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="Statusid" HeaderText="statusid"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="HoursPerDay" HeaderText="HoursPerDay"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="ProcessNo" HeaderText="ProcessNo"></asp:BoundColumn>
								</Columns>
								<PagerStyle PageButtonCount="20" Mode="NumericPages"></PagerStyle>
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
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
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
