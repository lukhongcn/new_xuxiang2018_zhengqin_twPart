<%@ Page language="c#" Codebehind="CaseOverSetting.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.CaseOverSetting" %>
<%@ Register TagPrefix="uc1" TagName="CaseOverSetting" Src="controls/CaseOverSetting.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>模具結案處理</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header1" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><FONT face="宋體"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></FONT>
						<TD vAlign="top" width="79%"><uc1:CaseOverSetting id="CaseOverSetting" runat="server"></uc1:CaseOverSetting>
							<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<TR>
										<!--<TD vAlign="top" align="left" width="1%"></TD>
						<TD width="1%">&nbsp;</TD>-->
										<TD vAlign="top" width="92%"><A href="default.aspx">返回首頁</A>
											<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<td vAlign="top">選擇未結案<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id="DropDownList_ModuleId" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
													<td vAlign="top">設定結案日期<wc:inputcalendar id="Textbox_OverDate" Runat="server"></wc:inputcalendar>
													</td>
													<td vAlign="top"><asp:button id="Button_Over" runat="server" Text="結案"></asp:button></td>
												</tr>
												<tr>
													<td vAlign="top">選擇已結案<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id="DropDownList_OverModuleId" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
													<td vAlign="top">&nbsp;</td>
													<td vAlign="top"><asp:button id="Button_UnOver" runat="server" Text="反結案" ForeColor="RED" Font-Bold="True"></asp:button></td>
												</tr>
											</TABLE>
											<BR>
											<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 300px; BORDER-BOTTOM-STYLE: ridge"><asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
													CellPadding="2">
													<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
													<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
													<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
													<Columns>
														<asp:TemplateColumn HeaderText="ModuleId">
															<HeaderTemplate>
																<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
															</HeaderTemplate>
															<ItemTemplate>
																<asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
																</asp:Label>
															</ItemTemplate>
														</asp:TemplateColumn>
														<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號ID"></asp:BoundColumn>
														<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
														<asp:BoundColumn DataField="StartDate" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
														<asp:BoundColumn DataField="EndDate" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
														<asp:BoundColumn DataField="FactStartDate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
														<asp:BoundColumn DataField="FactEndDate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
														<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="排程工時"></asp:BoundColumn>
														<asp:BoundColumn DataField="FactProcessNeedMinutes" HeaderText="實際工時"></asp:BoundColumn>
														<asp:BoundColumn DataField="FactProcessNeedMinutes" HeaderText="隱藏字段" Visible="False"></asp:BoundColumn>
														<asp:ButtonColumn Text="編輯" CommandName="Edit"></asp:ButtonColumn>
														<asp:BoundColumn DataField="ProcessId" HeaderText="Hidden" Visible="False"></asp:BoundColumn>
														<asp:BoundColumn DataField="ProcessNo" HeaderText="Hidden" Visible="False"></asp:BoundColumn>
													</Columns>
												</asp:datagrid></div>
											<br>
											<TABLE id="TableEdit" cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server">
												<TBODY>
													<tr>
														<td colSpan="6"><B>請填入以下信息修改紀錄</B><asp:Label ID="Label_HiddenProcessNo" Runat="server" Visible="False"></asp:Label>
														</td>
													</tr>
													<TR>
														<TD width="10%"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></TD>
														<TD width="24%"><asp:label id="Label_ProcessId" runat="server"></asp:label></TD>
														<TD width="10%">零件編號-ID</TD>
														<TD width="23%">&nbsp;<asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
														<TD width="10%">工序</TD>
														<TD width="23%">&nbsp;<asp:label id="Label_PartNoId" runat="server"></asp:label></TD>
													</TR>
													<TR>
														<TD>開始日期</TD>
														<TD>&nbsp;<asp:label id="Label_StartDate" Runat="server"></asp:label></TD>
														<TD>結束日期</TD>
														<TD>&nbsp;<asp:label id="Label_EndDate" Runat="server"></asp:label></TD>
														<TD>排程工時</TD>
														<TD>&nbsp;<asp:label id="Label_Minutes" Runat="server"></asp:label></TD>
													</TR>
													<TR>
														<TD>實際開始日期</TD>
														<TD>&nbsp;<wc:inputcalendar id="Textbox_FactStartDate" Runat="server"></wc:inputcalendar></TD>
														<TD>實際結束日期</TD>
														<TD>&nbsp;<wc:inputcalendar id="Textbox_FactEndDate" Runat="server"></wc:inputcalendar></TD>
														<TD>實際工時</TD>
														<TD>&nbsp;
															<asp:dropdownlist id="Dropdownlist_Day" runat="server"></asp:dropdownlist>天
															<asp:dropdownlist id="Dropdownlist_Hour" runat="server"></asp:dropdownlist>小時
															<asp:dropdownlist id="Dropdownlist_Minute" runat="server"></asp:dropdownlist>分
														</TD>
													</TR>
													<TR>
														<td colSpan="6"><asp:button id="Button_AddEdit" runat="server" Text="修改"></asp:button></td>
													</TR>
												</TBODY>
											</TABLE>
											<br>
											<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
												borderColorLight="#000066" border="1">
												<TR vAlign="middle">
													<TD width="15%" height="28">
														<DIV align="center"><B>提示</B></DIV>
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
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
