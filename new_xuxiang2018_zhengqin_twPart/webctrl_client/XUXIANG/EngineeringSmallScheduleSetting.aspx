<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="EngineeringSmallScheduleSetting.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.EngineeringSmallScheduleSetting" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�ͺޤp�Ƶ{�T�w</title>
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
						<TD vAlign="top" width="92%"><A href="default.aspx">��^����</A>&nbsp;&nbsp;&nbsp;��ܤu��<asp:dropdownlist id="Dropdownlist_Process" runat="server" AutoPostBack="True"></asp:dropdownlist>
							��ܼҨ�<asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
							��ܤ��<wc:inputcalendar id="TextBox_CurrDate" runat="server" size="10"></wc:inputcalendar>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2">
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
									<asp:BoundColumn DataField="FactStartDate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactEndDate" HeaderText="��ڵ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�Ƶ{�u��"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactProcessNeedMinutes" HeaderText="��ڤu��"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactProcessNeedMinutes" HeaderText="���ær�q" Visible="False"></asp:BoundColumn>
									<asp:ButtonColumn Text="�s��" CommandName="Edit"></asp:ButtonColumn>
									<asp:BoundColumn DataField="HoursPerDay" HeaderText="���ær�q" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo" HeaderText="���ær�q" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="StatusColor" HeaderText="color" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="Statusid" HeaderText="statusid" Visible="False"></asp:BoundColumn>
								</Columns>
							</asp:datagrid>
							<br>
							<TABLE id="TableEdit" cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server">
								<TBODY>
									<tr>
										<td colSpan="6"><B>�ж�J�H�U�H���ק����</B>
											<asp:label id="Label_HiddenHoursPerDay" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenPartNo" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<TD width="10%">�Ҩ�s��</TD>
										<TD width="23%">&nbsp;<asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
										<TD width="10%">�s��s��-ID</TD>
										<TD width="23%">&nbsp;<asp:label id="Label_PartNoId" runat="server"></asp:label></TD>
										<TD width="10%">�u�Ǹ�</TD>
										<TD width="24%">&nbsp;<asp:dropdownlist id="DropDownList_Status" runat="server" Visible="False"></asp:dropdownlist><asp:label id="Label_ProcessOrder" runat="server"></asp:label></TD>
									</TR>
									<TR>
										<TD>�}�l���</TD>
										<TD>&nbsp;<asp:label id="Label_StartDate" Runat="server"></asp:label></TD>
										<TD>�������</TD>
										<TD>&nbsp;<asp:label id="Label_EndDate" Runat="server"></asp:label></TD>
										<TD>�Ƶ{�u��</TD>
										<TD>&nbsp;<asp:label id="Label_Minutes" Runat="server"></asp:label></TD>
									</TR>
									<TR>
										<TD>��ڶ}�l���</TD>
										<TD>&nbsp;<asp:textbox id="Textbox_FactStartDate" Runat="server" ReadOnly="False"></asp:textbox><asp:linkbutton id="Linkbutton_FactStartDate" runat="server">���</asp:linkbutton><asp:calendar id="Calendar_FactStartDate" runat="server" Visible="False"></asp:calendar></TD>
										<TD>��ڵ������</TD>
										<TD>&nbsp;<asp:textbox id="Textbox_FactEndDate" Runat="server" ReadOnly="False"></asp:textbox><asp:linkbutton id="Linkbutton_FactEndDate" runat="server">���</asp:linkbutton><asp:calendar id="Calendar_FactEndDate" runat="server" Visible="False"></asp:calendar></TD>
										<TD>��ڤu��</TD>
										<TD>&nbsp;
											<asp:dropdownlist id="Dropdownlist_Day" runat="server"></asp:dropdownlist>��
											<asp:dropdownlist id="Dropdownlist_Hour" runat="server"></asp:dropdownlist>�p��
											<asp:dropdownlist id="Dropdownlist_Minute" runat="server"></asp:dropdownlist>��
										</TD>
									</TR>
									<TR>
										<td colSpan="6"><asp:button id="Button_AddEdit" runat="server" Text="�O�s"></asp:button></td>
									</TR>
								</TBODY>
							</TABLE>
							<br>
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
