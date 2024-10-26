<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="PartHeader" Src="controls/ScheduleHeader.ascx" %>
<%@ Page language="c#" Codebehind="ScheduleList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ScheduleList" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>���x�Ͳ����p</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<LINK href="css/common.css" rel="stylesheet">
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
													<asp:dropdownlist id="dpl_schedule" runat="server" AutoPostBack="True"></asp:dropdownlist>�}�l���<wc:inputcalendar id="TextBox_StartDate" runat="server"></wc:inputcalendar>
													�������<wc:inputcalendar id="TextBox_EndDate" runat="server"></wc:inputcalendar>
													<asp:button id="b_search" runat="server" Text="�d��"></asp:button><asp:button id="btn_print" runat="server" Text="���x���L"></asp:button><A href="ScheduleView.aspx">�d�߾��x�Ŷ����A</A></td>
											</tr>
										</TABLE>
									</td>
								<TR>
									<td><asp:label id="Label1" runat="server" Width="70px">�C�����</asp:label><asp:textbox id="txt_mod" runat="server" AutoPostBack="True" Width="58px">10</asp:textbox><asp:dropdownlist id="dpl_page" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
								</TR>
								<tr>
									<td><FONT face="�s�ө���"></FONT><br>
										<asp:datagrid id="MainDatagrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
											AllowPaging="True">
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
												<asp:TemplateColumn HeaderText="DoingNumber" Visible="False">
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
														<asp:textbox id="dg_txt_Factusedtime" Width="150" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedtime","{0:yyyy-MM-dd H:mm:ss}") %>'/>
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
														<asp:textbox id="dg_txt_CFactusedendtime" Width="150" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedendtime","{0:yyyy-MM-dd H:mm:ss}") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Schedulestatus">
													<HeaderTemplate>
														<asp:Label id="dg_header_Schedulestatus" runat="server">�B��ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_Schedulestatus" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Schedulestatus")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="startuserno">
													<HeaderTemplate>
														<asp:Label id="dg_header_startuserno" runat="server">�}�l�ާ@��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
													&nbsp;
														<asp:Label id="dg_lab_startuserno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.StartUserNo")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="enduserno">
													<HeaderTemplate>
														<asp:Label id="dg_header_enduserno" runat="server">�����ާ@��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
													&nbsp;
														<asp:Label id="dg_lab_enduserno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EndUserNo")%>'/>
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
												<asp:TemplateColumn Visible="False" HeaderText="ProcessNo">
													<HeaderTemplate>
														<asp:Label id="dg_header_ProcessNo" runat="server">�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_ProcessNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessNo")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False" HeaderText="ProcessOrder">
													<HeaderTemplate>
														<asp:Label id="Label21" runat="server">�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_ProcessOrder" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessOrder")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="����" EditText="�s��"></asp:EditCommandColumn>
											</Columns>
										</asp:datagrid>
										<asp:datagrid id="Datagrid1" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
											Visible="False">
											<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
											<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
											<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
											<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="MachinId">
													<HeaderTemplate>
														<asp:Label id="Label2" runat="server">���x�s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="Label3" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MachinId")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="DoingNumber" Visible="False">
													<HeaderTemplate>
														<asp:Label id="Label4" runat="server">���x���b�[�u��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="Label5" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.DoingProuductNumber")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="ModuleId">
													<HeaderTemplate>
														<asp:Label id="Label6" runat="server" text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'>
														</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg1_lab_ModuleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="PartNo">
													<HeaderTemplate>
														<asp:Label id="Label8" runat="server">�s��s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg1_lab_PartNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False" HeaderText="PartNo_Id">
													<HeaderTemplate>
														<asp:Label id="Label10" runat="server">�s��p�s��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="Label11" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Factusedtime">
													<HeaderTemplate>
														<asp:Label id="Label12" runat="server">�}�l�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="Label13" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedtime")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="Textbox1" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Factusedtime") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="CFactusedendtime">
													<HeaderTemplate>
														<asp:Label id="Label14" runat="server">�����ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="Label15" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CFactusedendtime")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="Textbox2" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CFactusedendtime") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Schedulestatus">
													<HeaderTemplate>
														<asp:Label id="Label16" runat="server">�B��ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="Label17" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Schedulestatus")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="startuserno">
													<HeaderTemplate>
														<asp:Label id="Label7" runat="server">�}�l�ާ@��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
													&nbsp;
														<asp:Label id="Label9" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.StartUserNo")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="enduserno">
													<HeaderTemplate>
														<asp:Label id="Label20" runat="server">�����ާ@��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
													&nbsp;
														<asp:Label id="Label22" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EndUserNo")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False" HeaderText="ProcessDate">
													<HeaderTemplate>
														<asp:Label id="Label18" runat="server">�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="Label19" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessDate")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False" HeaderText="ProcessNo">
													<HeaderTemplate>
														<asp:Label id="Label23" runat="server">�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg1_lab_ProcessNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessNo")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False" HeaderText="ProcessOrder">
													<HeaderTemplate>
														<asp:Label id="Label24" runat="server">�ɶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg1_lab_ProcessOrder" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessOrder")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
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
