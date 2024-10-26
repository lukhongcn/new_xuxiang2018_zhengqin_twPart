<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="ScheduleView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ScheduleView" %>
<%@ Register TagPrefix="uc1" TagName="PartHeader" Src="controls/ScheduleHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>���x�Ŷ��d��</title>
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
						<TD vAlign="top" width="79%"><uc1:partheader id="ScheduleHeader" runat="server"></uc1:partheader>
							<table>
								<tr>
									<td>
										<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
											width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
											<tr>
												<td>�u��
													<asp:dropdownlist id="dpl_process" runat="server" AutoPostBack="True"></asp:dropdownlist>���x
													<asp:dropdownlist id="dpl_schedule" runat="server" AutoPostBack="True"></asp:dropdownlist>���A
													<asp:dropdownlist id="dpl_status" AutoPostBack="True" Runat="server">
														<asp:ListItem Value="ALL">����</asp:ListItem>
														<asp:ListItem Value="BUSY">���L</asp:ListItem>
														<asp:ListItem Value="AVAILABILITY">�Ŷ�</asp:ListItem>
													</asp:dropdownlist></td>
											</tr>
											<tr>
												<td><A href="ScheduleList.aspx">�^����x�Ͳ����p�s��</A></td>
											</tr>
										</TABLE>
									</td>
								<tr>
									<td><asp:label id="lab_serach_status" Runat="server" Text="��J���x�s��"></asp:label><asp:textbox id="txt_serach_status" Runat="server"></asp:textbox><asp:button id="btn_search_status" Runat="server" Text="�d��"></asp:button><asp:label id="lab_old_search" Runat="server" Visible="False"></asp:label></td>
								</tr>
								<TR>
									<td><asp:label id="Label1" runat="server" Width="70px">�C�����</asp:label><asp:textbox id="txt_mod" runat="server" AutoPostBack="True" Width="58px">10</asp:textbox><asp:dropdownlist id="dpl_page" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
								</TR>
								<tr>
									<td><FONT face="�s�ө���"></FONT><br>
										<asp:datagrid id="MainDatagrid" runat="server" Width="100%" AllowPaging="True" CellPadding="2"
											CellSpacing="2" AutoGenerateColumns="False">
											<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
											<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
											<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
											<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="MachinId">
													<HeaderTemplate>
														<asp:Label id="dg_header_MachinId" runat="server">���x�s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_MachinId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MachinId")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="DoingNumber">
													<HeaderTemplate>
														<asp:Label id="dg_header_DoingProuductNumber" runat="server">���x���b�[�u��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_DoingProductNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.DoingProuductNumber")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="ModuleId">
													<HeaderTemplate>
														<asp:Label id="dg_header_ModuleId" runat="server" text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'>
														</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_ModuleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="PartNo">
													<HeaderTemplate>
														<asp:Label id="dg_header_PartNo" runat="server">�s��s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_PartNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="PartNo_Id">
													<HeaderTemplate>
														<asp:Label id="dg_header_PartNo_Id" runat="server">�s��p�s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_PartNo_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Factusedtime">
													<HeaderTemplate>
														<asp:Label id="dg_header_Factusedtime" runat="server">�}�l�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_Factusedtime" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedtime","{0:yyyy-MM-dd H:mm:ss}")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_Factusedtime" Width="100" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedtime","{0:yyyy-MM-dd H:mm:ss}") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="CFactusedendtime">
													<HeaderTemplate>
														<asp:Label id="dg_header_CFactusedendtime" runat="server">�����ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_CFactusedendtime" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedendtime","{0:yyyy-MM-dd H:mm:ss}")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_CFactusedendtime" Width="100" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedendtime","{0:yyyy-MM-dd H:mm:ss}") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Schedulestatus" Visible="False">
													<HeaderTemplate>
														<asp:Label id="dg_header_Schedulestatus" runat="server">�B��ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_Schedulestatus" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Schedulestatus")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False" HeaderText="ProcessDate">
													<HeaderTemplate>
														<asp:Label id="dg_header_ProcessDate" runat="server">�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_ProcessDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessDate")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
							</table>
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
			</TABLE></TD></TR><TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR></TBODY></TABLE></form>
	</body>
</HTML>
