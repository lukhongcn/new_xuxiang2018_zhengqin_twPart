<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MachineStatusHeader" Src="controls/MachineStatusHeader.ascx" %>
<%@ Page language="c#" Codebehind="MachineStatusList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MachineStatusList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>機台排程設定</title>
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
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:machinestatusheader id="MachineStatusHeader" runat="server"></uc1:machinestatusheader><BR>
							<table id="TableCondition" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<TR>
										<TD width="15%">工序<asp:dropdownlist id="DropDownList_Process" AutoPostBack="True" Runat="server"></asp:dropdownlist></TD>
										<TD width="15%">模具<asp:dropdownlist id="DropDownList_ModuleId" AutoPostBack="True" Runat="server"></asp:dropdownlist></TD>
										<TD width="26%">開始日期<asp:textbox id="Textbox_StartDate" Runat="server"></asp:textbox>
											<asp:linkbutton id="LinkButton_StartDate" runat="server">選擇</asp:linkbutton><asp:calendar id="Calendar_StartDate" runat="server" Visible="False"></asp:calendar></TD>
										<TD width="26%">結束日期<asp:textbox id="Textbox_EndDate" Runat="server"></asp:textbox>
											<asp:linkbutton id="LinkButton_EndDate" runat="server">選擇</asp:linkbutton><asp:calendar id="Calendar_EndDate" runat="server" Visible="False"></asp:calendar></TD>
										<TD width="8%"><asp:button id="Button_Search" Runat="server" Text="查詢"></asp:button></TD>
									</TR>
								</TBODY>
							</table>
							<asp:datagrid id="MainDataGrid" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
								Width="100%" AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="MACHINEID" HeaderText="機台編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo" HeaderText="零件編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號-ID"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessDate" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessMinutes" HeaderText="加工時間"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="功能">
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "MachineStatusAddEdit.aspx?processid="+processid+"&func=edit&machineid="+DataBinder.Eval(Container, "DataItem.machineid")+"&partno="+DataBinder.Eval(Container, "DataItem.partno")+"&partno_id="+DataBinder.Eval(Container, "DataItem.partno_id")+"&moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&processdate="+string.Format("{0:yyyy-MM-dd}",DataBinder.Eval(Container, "DataItem.processdate"))%>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="刪除" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
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
