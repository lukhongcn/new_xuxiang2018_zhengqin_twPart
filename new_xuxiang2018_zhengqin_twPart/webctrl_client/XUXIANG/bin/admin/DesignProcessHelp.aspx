<%@ Page language="c#" Codebehind="DesignProcessHelp.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.DesignProcessHelp" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�s��]�p�]�w</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 153px" vAlign="top" align="left" width="153"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table id="TableCondition" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<TR>
										<TD style="HEIGHT: 137px">
											<P>�]�p���e�s���]�п�J�^��W�A����a������^&nbsp;
												<asp:textbox id="txt_processid" runat="server"></asp:textbox></P>
											<P>�]�p���e�W�١]���W�٬O�z��ڨϥγ]�p���e�W�١^
												<asp:textbox id="txt_processname" runat="server"></asp:textbox></P>
											<P><FONT face="�s�ө���"><asp:label id="lab_priceType" runat="server">�u������</asp:label>&nbsp;
													<asp:dropdownlist id="dpl_priceType" runat="server">
														<asp:ListItem Value="0">��</asp:ListItem>
														<asp:ListItem Value="DESIGNFINISH">�]�p����</asp:ListItem>
													</asp:dropdownlist></FONT></P>
											<P><asp:button id="btn_save" runat="server" Text="�]�w"></asp:button></P>
										</TD>
									</TR>
									<tr>
										<td><br>
											<asp:datagrid id="MainDataGrid" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
												Width="100%" AutoGenerateColumns="False">
												<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
												<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
												<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="�]�p���e�s��">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_ProcessId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�]�p���e�W��">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_ProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_ProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'>
															</asp:textbox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�u������">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_pricetype" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartProcessId") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:dropdownlist id="dg_dpl_pricetype" runat="server">
																<asp:ListItem Value="0">��</asp:ListItem>
																<asp:ListItem Value="DESIGNFINISH">�]�p����</asp:ListItem>
															</asp:dropdownlist>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="����" EditText="�s��"></asp:EditCommandColumn>
													<asp:ButtonColumn Text="�R��" CommandName="Delete" HeaderText="�\��"></asp:ButtonColumn>
												</Columns>
											</asp:datagrid></td>
									</tr>
								</TBODY>
							</table>
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
										<asp:label id="lab_message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
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
