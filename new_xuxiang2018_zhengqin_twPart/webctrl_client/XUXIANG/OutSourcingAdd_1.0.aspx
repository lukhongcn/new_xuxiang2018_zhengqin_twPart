<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="LeftTree.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OutSourcingHeader" Src="controls/OutSourcingHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="OutSourcingAdd_1.0.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourcingAdd" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�~�]�]�w</title>
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
						<TD vAlign="top" width="79%"><uc1:outsourcingheader id="OutSourcingHeader" runat="server"></uc1:outsourcingheader>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										<td style="HEIGHT: 146px">
											<TABLE id="tbl_selectcond" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<tr>
													<TD><asp:radiobutton id="rad_module" GroupName="1" Runat="server" Text="�Ҩ�~�]" AutoPostBack="True"></asp:radiobutton></TD>
												</tr>
												<tr>
													<TD><asp:radiobutton id="rad_partno" GroupName="1" Runat="server" Text="�P�����s��~�]" AutoPostBack="True"></asp:radiobutton></TD>
												</tr>
												<tr>
													<TD><asp:radiobutton id="rad_partnoid" GroupName="1" Runat="server" Text="��ӹs��~�]" AutoPostBack="True"
															Checked="True"></asp:radiobutton></TD>
												</tr>
											</TABLE>
										</td>
										<td style="HEIGHT: 146px">
											<TABLE id="tbl_selectmodulepartno" cellSpacing="0" cellPadding="0" width="100%" border="0">
												<tr>
													<TD>��ܫȤ�&nbsp;<asp:dropdownlist id="drp_customerlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
												</tr>
												<tr>
													<TD>��ܼҨ�&nbsp;<asp:dropdownlist id="drp_modulelist" Runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
												</tr>
												<tr>
													<TD>��ܹs��&nbsp;<asp:dropdownlist id="drp_partnolist" Runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
												</tr>
												<tr>
													<TD>��ܹs��ID&nbsp;<asp:dropdownlist id="drp_partnoidlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
												</tr>
											</TABLE>
										</td>
									</TR>
									<TR>
										<TD>�~�]�]�w</TD>
										<TD><asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
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
													<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��s��ID"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessId" HeaderText="�u��"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessOrder" HeaderText="�u�ǽs��"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�u��"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessId" HeaderText="�u�ǽs��" Visible="False"></asp:BoundColumn>
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
