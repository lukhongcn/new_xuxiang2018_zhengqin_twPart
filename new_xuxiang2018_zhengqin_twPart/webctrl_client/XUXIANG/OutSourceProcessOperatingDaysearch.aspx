<%@ Page language="c#" Codebehind="OutSourceProcessOperatingDaysearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceProcessOperatingDaysearch" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OutSourceProcessOperatingDaysearchheader" Src="controls/OutSourceProcessOperatingDaysearchheader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>委外報工查詢</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
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
							<uc1:OutSourceProcessOperatingDaysearchheader id="OutSourceProcessOperatingDaysearchheader" runat="server"></uc1:OutSourceProcessOperatingDaysearchheader>
							<br>
							選擇
							<asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True">
								<asp:ListItem Value="Ready">出廠</asp:ListItem>
								<asp:ListItem Value="Implementation">回廠</asp:ListItem>
							</asp:dropdownlist>日期:
							<asp:dropdownlist id="dpl_date" runat="server">
								<asp:ListItem Value=">">></asp:ListItem>
								<asp:ListItem Value="<"><</asp:ListItem>
								<asp:ListItem Value="=">=</asp:ListItem>
								<asp:ListItem Value=">=">>=</asp:ListItem>
								<asp:ListItem Value="<="><=</asp:ListItem>
							</asp:dropdownlist><wc:inputcalendar id="txt_startdate" runat="server"></wc:inputcalendar>模具編號:<asp:textbox id="txt_searchmodelid" runat="server" AutoPostBack="True"></asp:textbox>
							&nbsp;
							<asp:button id="bnt_submission" runat="server" Text="查 詢"></asp:button><asp:button id="btn_print" Text="打印查詢結果" Visible="False" Runat="server"></asp:button>
							<asp:Label id="lab_date" runat="server" Visible="False"></asp:Label>
							<asp:Label id="lab_moduleid" runat="server" Visible="False"></asp:Label>
							<asp:Label id="lab_startdate" runat="server" Visible="False"></asp:Label>
							<asp:Label id="lab_status" runat="server" Visible="False"></asp:Label><asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False"
								AllowPaging="True" PageSize="15">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號ID"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="零件名稱">
										<ItemTemplate>
											<asp:Label runat="server" Text='' ID="dg_lab_partno"></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="processorder" HeaderText="工序號"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="狀態">
										<ItemTemplate>
											<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Statusid") %>' ID="dg_lab_statusid">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="StartDate" HeaderText="出廠日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndDate" HeaderText="回廠日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactStartDate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactEndDate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="ProcessNeedMinutes" HeaderText="排程工時"></asp:BoundColumn>
									<asp:ButtonColumn Visible="False" Text="開始" ButtonType="PushButton" HeaderText="功能" CommandName="start"></asp:ButtonColumn>
									<asp:ButtonColumn Visible="False" Text="暫停" ButtonType="PushButton" CommandName="holdon"></asp:ButtonColumn>
									<asp:ButtonColumn Visible="False" Text="結束" ButtonType="PushButton" CommandName="end"></asp:ButtonColumn>
									<asp:BoundColumn Visible="False" DataField="StatusColor" HeaderText="color"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="Statusid" HeaderText="statusid"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="ProcessNo" HeaderText="ProcessNo"></asp:BoundColumn>
								</Columns>
								<PagerStyle PageButtonCount="20" Mode="NumericPages"></PagerStyle>
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
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
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
