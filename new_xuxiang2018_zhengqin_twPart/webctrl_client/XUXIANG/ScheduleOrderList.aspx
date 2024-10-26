<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="SmallView" Src="controls/SmallViewRecommand.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MidView" Src="controls/MidViewRecommand.ascx" %>
<%@ Page language="c#" Codebehind="ScheduleOrderList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ScheduleOrderList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>排程優先設定</title>
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
						<TD vAlign="top" width="79%">
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
							</table>
							<table id="Table_Header3" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td align="center" width="20%">模具編號</td>
									<td width="80%"><asp:textbox id="txt_moduleid" Runat="server" Width="600px"></asp:textbox></td>
								<tr>
									<td align="center" width="20%">零件編號</td>
									<td width="80%"><asp:textbox id="txt_partnoid" Runat="server" Width="600px"></asp:textbox></td>
								<tr>
									<td align="center" width="20%">動作
									</td>
									<td width="80%"><asp:dropdownlist id="dpl_scheduled" runat="server">
											<asp:ListItem Value="1">需排程</asp:ListItem>
											<asp:ListItem Value="0">不需要排程</asp:ListItem>
											<asp:ListItem Value="ALL" Selected="True">所有</asp:ListItem>
										</asp:dropdownlist>&nbsp;&nbsp;<asp:button id="Button1" runat="server" Text="查詢"></asp:button><asp:button id="Button3" runat="server" Text="保存"></asp:button>
									</td>
								</tr>
							</table>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
								AllowPaging="True" PageSize="20">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="選擇">
										<HeaderTemplate>
											<asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:CheckBox id="CheckBox_Select" runat="server" Checked='<%#DataBinder.Eval(Container, "DataItem.Scheduled")%>'>
											</asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Scheduleorder">
										<HeaderTemplate>
											<asp:Label id="dg_header_scheduleorder" runat="server" text="排程順序"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_scheduleorder" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Scheduleorder")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="moduleId">
										<HeaderTemplate>
											<asp:Label id="dg_header_moduleId" runat="server" text="模具編號"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="tryDate0">
										<HeaderTemplate>
											<asp:Label id="Label1" runat="server" text="T0試模日期"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_tryDate0" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tryDate0","{0:yyyy-MM-dd}")%>' />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="PartNoId">
										<HeaderTemplate>
											<asp:Label id="dg_header_partnoid" runat="server" text="零件編號"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partnoid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partnoid")%>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="NeedHours">
										<HeaderTemplate>
											<asp:Label id="Label2" runat="server" text="預估工時"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_NeedHours" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.NeedHours")%>' />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="TotalHours">
										<HeaderTemplate>
											<asp:Label id="Label3" runat="server" text="到試模日時閒"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_TotalHours" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalHours")%>' />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="RemainderHours">
										<HeaderTemplate>
											<asp:Label id="Label4" runat="server" text="剩餘時閒"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_RemainderHours" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RemainderHours")%>' />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="False">
										<ItemTemplate>
											<asp:Label ID="dg_lab_needminutes" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.Needminutes")%>' Visible="False">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="False">
										<ItemTemplate>
											<asp:Label ID="dg_lab_totalminutes" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.Totalminutes")%>' Visible="False">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="False">
										<ItemTemplate>
											<asp:Label ID="dg_lab_remainderminutes" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.Remainderminutes")%>' Visible="False">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="False">
										<ItemTemplate>
											<asp:Label ID="dg_lab_id" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="向上" ButtonType="PushButton" HeaderText="功能" CommandName="Upper"></asp:ButtonColumn>
									<asp:ButtonColumn Text="向下" ButtonType="PushButton" HeaderText="功能" CommandName="Lower"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid></TD>
					</TR>
				</TBODY>
			</TABLE>
			<BR>
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
						<asp:label id="Label_Message" runat="server"></asp:label><asp:label id="Label_HiddenT0" runat="server" BackColor="Red" Visible="False"></asp:label></TD>
				</TR>
			</TABLE>
			</TD></TR><TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
