<%@ Page language="c#" Codebehind="PartUnnormalList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartUnnormalList" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PartUnnormalHeader" Src="controls/PartUnnormalHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>報廢零件瀏覽</title>
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
						<TD vAlign="top" width="79%"><uc1:partunnormalheader id="PartUnnormalHeader" runat="server"></uc1:partunnormalheader><BR>
							<TABLE id="Table_SetSearch" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td bgColor="#aaaadd" colSpan="6"><b>設定查詢條件</b></td>
								</tr>
								<tr>
									<td>設定客戶<asp:dropdownlist id="drp_customerlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td>選擇<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id="drp_modulelist" Runat="server"></asp:dropdownlist>
									</td>
									<td><asp:TextBox id="txt_moduleid" runat="server"></asp:TextBox></td>
									<td><asp:button id="btn_search" Runat="server" Text="查詢"></asp:button></td>
								</tr>
							</TABLE>
							<br>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											
												<%#DataBinder.Eval(Container, "DataItem.moduleid") %>
											
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="totalmins" HeaderText="總報廢工時"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="總報廢零件數">
										<ItemTemplate>
											<a href='#' onclick='javascript:showDiscardInfo("<%#DataBinder.Eval(Container, "DataItem.moduleid") %>","")'>
												<%#DataBinder.Eval(Container, "DataItem.totalcount") %>
											</a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="partnoid" HeaderText="零件編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="mins" HeaderText="零件報廢工時"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="報廢零件數">
										<ItemTemplate>
											<a href='#' onclick='javascript:showDiscardInfo("<%#DataBinder.Eval(Container, "DataItem.hiddenmoduleid") %>","<%#DataBinder.Eval(Container, "DataItem.partnoid") %>")'>
												<%#DataBinder.Eval(Container, "DataItem.count") %>
											</a>
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
