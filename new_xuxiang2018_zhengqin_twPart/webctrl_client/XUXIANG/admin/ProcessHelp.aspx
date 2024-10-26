<%@ Page language="c#" Codebehind="ProcessHelp.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProcessHelp" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>�u�ǳ]�w</title>
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
										<TD>
											<P>�u�ǽs���]�п�J�^��W�A����a������^&nbsp;
												<asp:textbox id="txt_processid" runat="server"></asp:textbox></P>
											<P>�u�ǦW�١]���W�٬O�z��ڨϥΤu�ǦW�١^
												<asp:textbox id="txt_processname" runat="server"></asp:textbox></P>
											<p>����&nbsp;&nbsp;<asp:textbox id="txt_comment" runat="server"></asp:textbox></p>
											<P><FONT face="�s�ө���">�O�_�����x�[�u�u��&nbsp;
													<asp:dropdownlist id="ddl_needschedule" runat="server">
														<asp:ListItem Value="1">�O</asp:ListItem>
														<asp:ListItem Value="0">�_</asp:ListItem>
													</asp:dropdownlist></FONT></P>
											<P><FONT face="�s�ө���"><asp:label id="lab_priceType" runat="server">�u������</asp:label>&nbsp;
													<asp:dropdownlist id="dpl_priceType" runat="server">
														<asp:ListItem Value="0">��</asp:ListItem>
														<asp:ListItem Value="OUTSOURCE">�~�]</asp:ListItem>
														<asp:ListItem Value="CNC">CNC</asp:ListItem>
														<asp:ListItem Value="JG">JG��i�p��</asp:ListItem>
														<asp:ListItem Value="QUICKCUT">�֨���</asp:ListItem>
														<asp:ListItem Value="EDM">�E����r</asp:ListItem>
														<asp:ListItem Value="CUTMILLING">�u�ά�i</asp:ListItem>
														<asp:ListItem Value="SLOWCUT">�C����</asp:ListItem>
														<asp:ListItem Value="NOMACHINE">���ݭn�}�l</asp:ListItem>
														<asp:ListItem Value="ZULI">�ե�</asp:ListItem>
														<asp:ListItem Value="NEEDDESIGN">�ݳ]�p</asp:ListItem>
														<asp:ListItem Value="FANGDIAN">��q</asp:ListItem>
													</asp:dropdownlist></FONT></P><FONT face="�s�ө���"></FONT>
											<P><FONT face="�s�ө���">�O�_�ݭnQC&nbsp;
													<asp:dropdownlist id="dpl_isneedQC" runat="server">
														<asp:ListItem Value="1">�O</asp:ListItem>
														<asp:ListItem Value="0">�_</asp:ListItem>
													</asp:dropdownlist></FONT></P>
											<P><asp:button id="btn_save" runat="server" Text="�]�w"></asp:button></P>
										</TD>
									</TR>
									<tr>
										<td><br>
											<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
												CellPadding="2" AllowPaging="True">
												<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
												<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
												<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="�u�ǽs��">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_ProcessId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�u�ǦW��">
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
													<asp:TemplateColumn HeaderText="����">
														<ItemTemplate>
															&nbsp;
															<asp:Label ID="dg_lab_comment" Runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Comment")%>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_comment" Runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Comment")%>'>
															</asp:TextBox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�O�_�����x�[�u�u��">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="lab_needschedule" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CNeedSchedule") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�u������">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_pricetype" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CPriceType") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:dropdownlist id="dg_dpl_pricetype" runat="server">
																<asp:ListItem Value="0">��</asp:ListItem>
																<asp:ListItem Value="OUTSOURCE">�~�]</asp:ListItem>
																<asp:ListItem Value="CNC">CNC</asp:ListItem>
																<asp:ListItem Value="JG">JG��i�p��</asp:ListItem>
																<asp:ListItem Value="QUICKCUT">�֨���</asp:ListItem>
																<asp:ListItem Value="EDM">�E����r</asp:ListItem>
																<asp:ListItem Value="CUTMILLING">�u�ά�i</asp:ListItem>
																<asp:ListItem Value="SLOWCUT">�C����</asp:ListItem>
																<asp:ListItem Value="NOMACHINE">���ݭn�}�l</asp:ListItem>
																<asp:ListItem Value="ZULI">�ե�</asp:ListItem>
																<asp:ListItem Value="NEEDDESIGN">�ݳ]�p</asp:ListItem>
																<asp:ListItem Value="FANGDIAN">��q</asp:ListItem>
															</asp:dropdownlist>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="�O�_�ݭnQC">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="lab_isneedQC" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isNeedQC") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList ID="dg_dpl_isneedQC" Runat="server">
																<asp:ListItem Value="1">�O</asp:ListItem>
																<asp:ListItem Value="0">�_</asp:ListItem>
															</asp:DropDownList>
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
										<asp:label id="lab_message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label></TD>
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