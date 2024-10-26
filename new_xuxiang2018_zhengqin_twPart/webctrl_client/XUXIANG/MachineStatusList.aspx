<%@ Page language="c#" Codebehind="MachineStatusList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MachineStatusList" %>
<%@ Register TagPrefix="uc1" TagName="MachineStatusHeader" Src="controls/MachineStatusHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>生管小排程確認</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
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
										<TD width="20%">工序<asp:dropdownlist id="DropDownList_Process" AutoPostBack="True" Runat="server"></asp:dropdownlist></TD>
										<TD width="20%"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id="DropDownList_ModuleId" AutoPostBack="True" Runat="server"></asp:dropdownlist></TD>
										<TD width="50%">日期<wc:inputcalendar id="Textbox_Date" runat="server"></wc:inputcalendar>到<wc:inputcalendar id="Textbox_EndDate" runat="server"></wc:inputcalendar></TD>
										<TD width="10%"><asp:button id="Button_Search" Runat="server" Text="查詢"></asp:button></TD>
									</TR>
								</TBODY>
							</table>
							<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="">
										<ItemTemplate>
											<asp:CheckBox ID="CheckBox_Select" Runat="server"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="MACHINEID" HeaderText="機台編號"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="ModuleId">
										<HeaderTemplate>
											<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="PartNo" HeaderText="零件編號"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="零件名稱">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_partname" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>' />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號-ID"></asp:BoundColumn>
									<asp:BoundColumn DataField="LengthProcessDate" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessMinutes" HeaderText="加工時間"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNo" HeaderText="工序號" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="工序號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessMinutes" HeaderText="加工時間" Visible="False"></asp:BoundColumn>
									
									<asp:TemplateColumn HeaderText="功能">
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "MachineStatusEdit.aspx?processid="+DataBinder.Eval(Container, "DataItem.processid")+"&machineid="+DataBinder.Eval(Container, "DataItem.machineid")+"&partnoid="+DataBinder.Eval(Container, "DataItem.partno_id")+"&moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&processorder="+DataBinder.Eval(Container, "DataItem.processno")+"&processdate="+DataBinder.Eval(Container, "DataItem.LengthProcessDate")+"&totalmins="+DataBinder.Eval(Container, "DataItem.processminutes")%>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="刪除" CommandName="Delete"></asp:ButtonColumn>
									<asp:BoundColumn DataField="ID" HeaderText="加工時間" Visible="False"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<table id="TableSubmit" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<TR>
										<TD width="10%"><asp:button id="Button_SelectAll" Runat="server" Text="全選"></asp:button></TD>
										<TD width="90%"><asp:button id="Button_Confirm" Runat="server" Text="確認"></asp:button></TD>
									</TR>
								</TBODY>
							</table>
							<asp:DropDownList id="dpl_machine" runat="server"></asp:DropDownList>
							<asp:Button id="Button2" runat="server" Text="報表打印"></asp:Button>
							<asp:Label id="lab_report" runat="server"></asp:Label><br>
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
