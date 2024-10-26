<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OutSourcingHeader" Src="controls/OutSourcingHeader.ascx" %>
<%@ Page language="c#" Codebehind="OutSourcingSetting.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourcingSetting" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>外包設定</title>
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
						<TD vAlign="top" width="79%"><uc1:outsourcingheader id="OutSourcingHeader" runat="server"></uc1:outsourcingheader><FONT face="冼極"><BR>
							</FONT>
							<BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><asp:label id="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" Visible="False" ForeColor="Red"></asp:label></td>
									</tr>
									<TR>
										<td colSpan="2">
											<TABLE id="Table4" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<TD>模具編號<asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
													<TD>零件編號<asp:dropdownlist id="ListBox_PartNoList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
													<TD><asp:button id="Button_Search" runat="server" Text="零件查詢"></asp:button></TD>
													<TD>電極編號<asp:dropdownlist id="dpl_eleno" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
													<TD><asp:button id="btn_elesearch" runat="server" Text="電極查詢"></asp:button></TD>
												</tr>
											</TABLE>
										</td>
									</TR>
									<TR>
										<TD>外包設定</TD>
										<TD><asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="選擇">
														<HeaderTemplate>
															<asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:CheckBox id="CheckBox_Select" runat="server" Checked="False"></asp:CheckBox>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:BoundColumn DataField="PartNo" HeaderText="零件編號"></asp:BoundColumn>
													<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號-ID"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="ProcessId" HeaderText="工序編號"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessName" HeaderText="工序編號"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="StatusId" HeaderText="狀態"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="時間"></asp:BoundColumn>
													<asp:BoundColumn Visible="False" DataField="NeedProduct" HeaderText="NeedProduct"></asp:BoundColumn>
												</Columns>
											</asp:datagrid>&nbsp;</TD>
									</TR>
									<TR>
										<TD colSpan="2"><asp:button id="Button_AddEdit" runat="server" Text="保存"></asp:button></TD>
									</TR>
								</TBODY>
							</TABLE>
							<br>
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
