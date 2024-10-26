<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="MachineBrokenList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MachineBrokenList" %>
<%@ Register TagPrefix="uc1" TagName="MachineBrokenHeader" Src="controls/MachineBrokenHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>機台故障設定</title>
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
						<TD vAlign="top" width="79%"><uc1:machinebrokenheader id="MachineBrokenHeader" runat="server"></uc1:machinebrokenheader>
							<TABLE id="Table_Condition" cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server">
								<tr>
									<td>選擇工序<asp:dropdownlist id="DropDownList_ProcessId" Runat="server" AutoPostBack="True"></asp:dropdownlist>
										<asp:CheckBox id="CheckBox_StartDate" runat="server" Text="開始日期大於等於" AutoPostBack="True"></asp:CheckBox>
										<asp:textbox id="Textbox_StartDate" Runat="server" ReadOnly="True"></asp:textbox><asp:linkbutton id="Linkbutton_StartDate" runat="server">選擇</asp:linkbutton><asp:calendar id="Calendar_StartDate" runat="server" Visible="False"></asp:calendar>
									</td>
								</tr>
							</TABLE>
							<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="MachineId" HeaderText="機台編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="starttime" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="endtime" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="BrokenMinutes" HeaderText="故障工時" Visible="False"></asp:BoundColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "MachineBrokenAddEdit.aspx?func=edit&machineid="+DataBinder.Eval(Container, "DataItem.MachineId")+"&processid="+DataBinder.Eval(Container, "DataItem.ProcessId")+"&starttime="+DataBinder.Eval(Container, "DataItem.starttime","{0:yyyy-MM-dd}")+"&endtime="+DataBinder.Eval(Container, "DataItem.endtime","{0:yyyy-MM-dd}")+"&minutes="+DataBinder.Eval(Container, "DataItem.BrokenMinutes") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid><br>
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
