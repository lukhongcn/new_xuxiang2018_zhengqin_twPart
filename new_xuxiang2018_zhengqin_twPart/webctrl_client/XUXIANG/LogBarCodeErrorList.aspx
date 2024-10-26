<%@ Page language="c#" Codebehind="LogBarCodeErrorList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.LogBarCodeErrorList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
  </HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">用戶工序查詢
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD style="HEIGHT: 5px" colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:label id="Label1" runat="server">用戶名</asp:label><asp:textbox id="txt_user" runat="server"></asp:textbox><asp:dropdownlist id="dpl_userlist" runat="server" Visible="False" AutoPostBack="True"></asp:dropdownlist><asp:button id="btn_user" runat="server" Text="查詢用戶"></asp:button><FONT face="新細明體">時段查詢
														<wc:inputcalendar id="txt_start" runat="server" Text=""></wc:inputcalendar>到
														<wc:inputcalendar id="txt_end" runat="server" Text=""></wc:inputcalendar><asp:dropdownlist id="dpl_department" runat="server" AutoPostBack="True"></asp:dropdownlist><br>
														<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>查詢<asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="查詢"></asp:button>
														<asp:button id="btn_print" runat="server" Text="報表打印"></asp:button></FONT><asp:label id="lab_userremenber" Visible="False" Runat="server"></asp:label><asp:label id="lab_moduleremenber" Visible="False" Runat="server"></asp:label></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_LogBarCode" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
														AllowPaging="True">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="no">
																<HeaderTemplate>
																	<asp:Label id="dg_header_no" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_no" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.No")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="processno">
																<HeaderTemplate>
																	<asp:Label id="dg_header_processno" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_processno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processno")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_processno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processno") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="userno">
																<HeaderTemplate>
																	<asp:Label id="dg_header_userno" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_userno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Userno")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_userno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.userno") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="username">
																<HeaderTemplate>
																	<asp:Label id="dg_header_username" runat="server">用戶名</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_username" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Username")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_username" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.username") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleid" runat="server" text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Moduleid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partnoid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partnoid" runat="server">零件名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partnoid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partnoid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partnoid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partnoid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="processid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_processid" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_processid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_processid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="processname">
																<HeaderTemplate>
																	<asp:Label id="dg_header_processname" runat="server">工序名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_processname" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processname")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_processname" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processname") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="actionid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_actionid" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_actionid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Actionid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_actionid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.actionid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="actionname">
																<HeaderTemplate>
																	<asp:Label id="dg_header_actionname" runat="server">操作</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_actionname" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Actionname")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_actionname" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.actionname") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="inputtime">
																<HeaderTemplate>
																	<asp:Label id="dg_header_inputtime" runat="server">開始時間</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_inputtime" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Inputtime")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_inputtime" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inputtime") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="outtime">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outtime" runat="server">結束時間</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outtime" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outtime")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ProcessMinutes">
																<HeaderTemplate>
																	<asp:Label id="dg_header_processminutes" runat="server">實際工時</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_processminutes" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessMinutes")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_processminutes" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessMinutes") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<asp:label id="Label2" runat="server">總實際工時</asp:label><asp:label id="lab_allprocess" runat="server"></asp:label></td>
											</tr>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示信息</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</table>
						</TD>
					</tr>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
