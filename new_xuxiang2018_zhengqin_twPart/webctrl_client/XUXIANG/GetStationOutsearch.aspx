<%@ Page language="c#" Codebehind="GetStationOutsearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.GetStationOutsearch" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="GetStationOutHearder" Src="controls/GetStationOutHearder.ascx"%>
<HTML>
	<HEAD>
		<title>出貨查詢</title>
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
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:getstationouthearder id="GetStationOutHearder" runat="server"></uc1:getstationouthearder>
							<hr>
							<table width="100%" align="center" border="0">
								<tr>
									<td><asp:label id="lab_outsearch" runat="server" text="條碼掃描/數量">出貨查詢</asp:label></td>
									<td>開始<wc:inputcalendar id="txt_startdatetime" runat="server"></wc:inputcalendar>
										結束<wc:inputcalendar id="txt_endstartdatetime" runat="server"></wc:inputcalendar>
										<asp:button id="btn_referencePictureDate" Text="日期查詢" Runat="server"></asp:button><asp:button id="but_print" runat="server" Text="報表打印"></asp:button></td>
									<td colSpan="3"></td>
								</tr>
							</table>
							<br>
							<asp:datagrid id="MainDatagrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="customerId" HeaderText="客戶"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="ModuleId">
										<HeaderTemplate>
											<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="referencePictureDate" HeaderText="接單日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="comment" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="outdate" HeaderText="出貨日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="outer" HeaderText="出貨員工"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
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
