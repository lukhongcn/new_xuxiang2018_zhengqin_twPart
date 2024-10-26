<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="SmallView" Src="controls/SmallViewRecommand.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MidView" Src="controls/MidViewRecommand.ascx" %>
<%@ Page language="c#" Codebehind="ViewScheduleRecommandList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ViewScheduleRecommandList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>模?排程??</title>
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
						<TD vAlign="top" align="left" width="20%">
							<uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="20%">輸入關鍵字查詢</td>
									<td width="80%"><asp:textbox id="TextBox_key" Runat="server" Width="300px"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="查詢"></asp:button><asp:label ID="lab_searchmoduleid" Runat="server" Visible="False"></asp:label></td>
									<td><asp:button id="btn_acction" Runat="server" Text="小日程提交"></asp:button></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
								AllowPaging="True">
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
											<asp:CheckBox id="CheckBox_Select" runat="server" Checked="False"></asp:CheckBox>
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
									<asp:BoundColumn DataField="moduleid" HeaderText="模具名稱"></asp:BoundColumn>
									<asp:BoundColumn DataField="CustomerName" HeaderText="客戶"></asp:BoundColumn>
									<asp:BoundColumn DataField="tryDate0" HeaderText="需求日期" Visible="true" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="startdate" HeaderText="系統開始日期" Visible="true" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label ID="dg_header_scheduledstartdate" Runat="server">計劃開始日期</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:TextBox ID="dg_txt_scheduledstartdate" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.scheduledstartdate","{0:yyyy-MM-dd}")%>'>
											</asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="orderdelay" HeaderText="訂單延誤/提前天數" ></asp:BoundColumn>
									<asp:BoundColumn DataField="scheduledelay" HeaderText="計劃延誤提前天數" Visible=False ></asp:BoundColumn>
									<asp:TemplateColumn Visible=False>
										<ItemTemplate>
											&nbsp;
											<asp:label ID="dg_lab_isconfirm" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.isconfirm")%>'>
											</asp:label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="模擬排程信息" HeaderText="功能" CommandName="Select"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
							<TABLE id="TableView" width="100%" border="1" runat="server">
								<TR>
									<TD style="WIDTH: 344px" width="344">當前選擇模具為<asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
									<TD><asp:button id="Button_ViewMiddle" Runat="server" Text="工序小排程設定"></asp:button><asp:button id="Button_ViewSmall" Runat="server" Text="零件加工信息"></asp:button><asp:button id="bnt_print" runat="server" Text=" 導出 "></asp:button></TD>
								</TR>
							</TABLE>
							<uc1:midview id="MidViewRecommand" runat="server"></uc1:midview><uc1:smallview id="SmallViewRecommand" runat="server"></uc1:smallview><br>
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
