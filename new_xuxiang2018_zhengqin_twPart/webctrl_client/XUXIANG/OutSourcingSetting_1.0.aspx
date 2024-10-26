<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="OutSourcingSetting_1.0.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourcingSetting" %>
<%@ Register TagPrefix="uc1" TagName="OutSourcingHeader" Src="controls/OutSourcingHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�~�]�]�w</title>
		<Forum:Style id="Style" runat="server" />
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
						<TD vAlign="top" width="79%">
							<uc1:OutSourcingHeader id="OutSourcingHeader" runat="server"></uc1:OutSourcingHeader><FONT face="�η�"><BR>
							</FONT>
							<BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<td colSpan="2">
											<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<TD>�Ȥ�W��<asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
													<TD>�Ҩ�s��<asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
													<TD>�s��s��<asp:dropdownlist id="ListBox_PartNoList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
													<TD><asp:Button id="Button_Search" runat="server" Text="�d��"></asp:Button></TD>
												</tr>
											</TABLE>
										</td>
									</TR>
									<TR>
										<TD>�~�]�]�w</TD>
										<TD>
											<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
												CellPadding="2">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="���">
														<ItemTemplate>
															<asp:CheckBox runat="server" ID="CheckBox_Select" Checked="False"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn DataField="PartNo" HeaderText="�s��s��"></asp:BoundColumn>
													<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��s��-ID"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessId" HeaderText="�u�ǽs��" Visible="False"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessId" HeaderText="�u�ǽs��"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="StatusId" HeaderText="���A"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�ɶ�"></asp:BoundColumn>
													<asp:BoundColumn DataField="NeedProduct" HeaderText="NeedProduct" Visible="False"></asp:BoundColumn>
												</Columns>
											</asp:datagrid>&nbsp;</TD>
									</TR>
									<TR>
										<TD colSpan="2"><asp:button id="Button_AddEdit" runat="server" Text="�~�]�襤���s��"></asp:button></TD>
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
