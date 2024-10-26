<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PartModifyHeader" Src="controls/PartModifyHeader.ascx" %>
<%@ Page language="c#" Codebehind="PartModifyList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartModifyList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>零件設定</title>
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
						<TD vAlign="top" width="79%"><uc1:partmodifyheader id="PartModifyHeader" runat="server"></uc1:partmodifyheader><BR>&nbsp;選擇<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="搜索"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id="btn_true" Text="數據庫調整" Runat="server" Visible=False></asp:button>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
								CellSpacing="2" CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="priorityname" HeaderText="等級"></asp:BoundColumn>
									<asp:ButtonColumn Text="詳細信息" HeaderText="功能" CommandName="Detail"></asp:ButtonColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id="HyperLink_EditProcess" runat="server" Text="工序調整" NavigateUrl='<%# "PartModifyEdit.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partno="+DataBinder.Eval(Container, "DataItem.PartNo_Id")+"&priority="+DataBinder.Eval(Container, "DataItem.Priority") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id="HyperLink_EditAddProcess" runat="server" Text="工序順序調整" NavigateUrl='<%# "PartModifyProcessOrder.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partnoid="+DataBinder.Eval(Container, "DataItem.PartNo_Id") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
							<asp:datagrid id="DetailDatagrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="工序順序"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
									<asp:BoundColumn DataField="startdate" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="enddate" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="工時"></asp:BoundColumn>
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
