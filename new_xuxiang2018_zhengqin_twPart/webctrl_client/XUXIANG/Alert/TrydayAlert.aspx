<%@ Page language="c#" Codebehind="TrydayAlert.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.TrydayAlert" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具進度警示</title>
		<LINK href="../css/common.css" rel="stylesheet">
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
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu>
						<TD vAlign="top" align="left" width="1%"></TD>
						<TD vAlign="top" width="79%"><FONT face="新細明體"></FONT><BR>
							<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td bgColor="#aaaadd" colSpan="6"><b>設定查詢條件</b></td>
								</tr>
								<tr>
									<td>提前天數<asp:dropdownlist id="dpl_beforedays" Runat="server" AutoPostBack="True">
											<asp:ListItem Value="0">0</asp:ListItem>
											<asp:ListItem Value="1">1</asp:ListItem>
											<asp:ListItem Value="2">2</asp:ListItem>
											<asp:ListItem Value="3">3</asp:ListItem>
											<asp:ListItem Value="4">4</asp:ListItem>
											<asp:ListItem Value="5">5</asp:ListItem>
											<asp:ListItem Value="6">6</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="15">15</asp:ListItem>
											<asp:ListItem Value="20">20</asp:ListItem>
											<asp:ListItem Value="25">25</asp:ListItem>
											<asp:ListItem Value="30">30</asp:ListItem>
										</asp:dropdownlist></td>
								</tr>
							</TABLE>
							<BR>
							<table>
								<tr>
									<td vAlign="top"><asp:datagrid id="MainDataGrid" runat="server" AllowPaging="True" PageSize="18" CellPadding="2"
											CellSpacing="2" Width="100%" AutoGenerateColumns="False">
											<Columns>
												<asp:ButtonColumn Text="Select" DataTextField="moduleid" HeaderText="模具編號" CommandName="Select"></asp:ButtonColumn>
												<asp:BoundColumn DataField="DonePercente" HeaderText="預計完成度%"></asp:BoundColumn>
												<asp:BoundColumn DataField="TryDate0" HeaderText="T0" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
												<asp:BoundColumn DataField="AlertDay" HeaderText="提前警告天數"></asp:BoundColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
									<td>&nbsp;</td>
									<td vAlign="top" align="left" width="50%"><asp:datagrid id="dg_part" runat="server" AllowPaging="True" PageSize="18" CellPadding="2" CellSpacing="2"
											Width="100%" AutoGenerateColumns="False">
											<Columns>
												<asp:BoundColumn Visible="False" DataField="StatusColor" HeaderText="StatusColor"></asp:BoundColumn>
												<asp:BoundColumn DataField="moduleid" HeaderText="模具編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="PartNo" HeaderText="零件編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="ProcessName" HeaderText="工序名稱"></asp:BoundColumn>
												<asp:BoundColumn DataField="FactStartDate" HeaderText="T0" DataFormatString="{0:yyyy-MM-dd}" Visible="False"></asp:BoundColumn>
												<asp:BoundColumn DataField="Status" HeaderText="狀態"></asp:BoundColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
							</table>
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
		</form>
	</body>
</HTML>
