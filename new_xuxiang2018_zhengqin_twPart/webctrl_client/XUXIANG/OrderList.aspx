<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="OrderList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderList" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>訂單設定</title>
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
						<TD vAlign="top" width="79%"><uc1:orderheader id="OrderHeader" runat="server"></uc1:orderheader>
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="20%">輸入關鍵字查詢</td>
									<td width="80%"><asp:textbox id="TextBox_key" Width="300px" Runat="server"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="查詢"></asp:button></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AllowPaging="True"
								AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProductName" HeaderText="模具名稱"></asp:BoundColumn>
									<asp:BoundColumn DataField="CustomerId" HeaderText="客戶"></asp:BoundColumn>
									<asp:BoundColumn DataField="priorityname" HeaderText="等級"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="圖片">
										<ItemTemplate>
											<IMG alt="模具圖片" src='<%# DataBinder.Eval(Container, "DataItem.FinishPicture") %>' width="50px" height="50px">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="操作">
										<ItemTemplate>
											<a href='#' onclick='javascript:showModuleInfo("<%#DataBinder.Eval(Container, "DataItem.moduleid") %>")'>
												詳細信息</a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="操作">
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "OrderAddEdit.aspx?func=edit&moduleid="+DataBinder.Eval(Container, "DataItem.moduleid") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="操作">
										<ItemTemplate>
											<asp:HyperLink id=Hyperlink_DesignSetting runat="server" Text="日期設定" NavigateUrl='<%# "OrderDesignInfoSetting.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="刪除" CommandName="Delete" HeaderText="操作"></asp:ButtonColumn>
									<asp:BoundColumn DataField="NoId" HeaderText="序號"></asp:BoundColumn>
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
										<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label></TD>
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
