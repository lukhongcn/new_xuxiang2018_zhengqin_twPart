<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="ScheduleListSmall.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ScheduleListSmall" %>
<%@ Register TagPrefix="uc1" TagName="ScheduleListSmallHeader" Src="controls/ScheduleListSmallHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SmallView" Src="controls/SmallView.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>小排程瀏覽</title>
		<Forum:Style id="Style" runat="server" />
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
							<uc1:ScheduleListSmallHeader id="ScheduleListSmallHeader" runat="server"></uc1:ScheduleListSmallHeader><BR>
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td width="20%">年&nbsp;<asp:dropdownlist id="DropDownList_Year" runat="server" AutoPostBack="True">
											<asp:ListItem Value="2004">2004</asp:ListItem>
											<asp:ListItem Value="2005">2005</asp:ListItem>
											<asp:ListItem Value="2006">2006</asp:ListItem>
											<asp:ListItem Value="2007">2007</asp:ListItem>
											<asp:ListItem Value="2008">2008</asp:ListItem>
											<asp:ListItem Value="2009">2009</asp:ListItem>
											<asp:ListItem Value="2010">2010</asp:ListItem>
										</asp:dropdownlist>
									</td>
									<td width="80%">月&nbsp;<asp:dropdownlist id="Dropdownlist_Month" runat="server" AutoPostBack="True">
											<asp:ListItem Value="01">01</asp:ListItem>
											<asp:ListItem Value="2">02</asp:ListItem>
											<asp:ListItem Value="3">03</asp:ListItem>
											<asp:ListItem Value="4">04</asp:ListItem>
											<asp:ListItem Value="5">05</asp:ListItem>
											<asp:ListItem Value="6">06</asp:ListItem>
											<asp:ListItem Value="7">07</asp:ListItem>
											<asp:ListItem Value="8">08</asp:ListItem>
											<asp:ListItem Value="9">09</asp:ListItem>
											<asp:ListItem Value="10">10</asp:ListItem>
											<asp:ListItem Value="11">11</asp:ListItem>
											<asp:ListItem Value="12">12</asp:ListItem>
										</asp:dropdownlist>
									</td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="Productname" HeaderText="產品名稱"></asp:BoundColumn>
									<asp:BoundColumn DataField="isStart" HeaderText="已排程"></asp:BoundColumn>
									<asp:ButtonColumn Text="詳細信息" HeaderText="功能" CommandName="Detail"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><BR>
							<table id="table_ScheduleHeader" cellPadding="2" width="100%" border="1" runat="server">
								<tr>
									<td align="left" nowrap>模具編號 :
										<asp:label id="Label_ModuleID" runat="server"></asp:label></td>
								</tr>
							</table>
							<uc1:SmallView id="SmallView" runat="server"></uc1:SmallView>
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
