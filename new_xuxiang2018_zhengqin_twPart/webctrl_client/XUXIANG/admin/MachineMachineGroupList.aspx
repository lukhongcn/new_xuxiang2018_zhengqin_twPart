<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MachineGroupHeader" Src="controls/MachineGroupHeader.ascx" %>
<%@ Page language="c#" Codebehind="MachineMachineGroupList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MachineMachineGroupList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>機台組設定</title>
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
						<TD vAlign="top" width="79%"><uc1:MachineGroupHeader id="MachineGroupHeader" runat="server"></uc1:MachineGroupHeader><BR>
							<table id="TableCondition" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR>
									<TD>選擇工序<asp:dropdownlist id="DropDownList_Process" Runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
								</TR>
							</table>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2" AllowPaging="True">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="GroupName" HeaderText="機台組名稱"></asp:BoundColumn>
									<asp:BoundColumn DataField="Description" HeaderText="描述"></asp:BoundColumn>
									<asp:BoundColumn DataField="Managetime" HeaderText="工作時間(小時)"></asp:BoundColumn>
									<asp:BoundColumn DataField="Priority" HeaderText="優先級"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="功能">
										<ItemTemplate>
											<asp:HyperLink id="HyperLink_Edit" runat="server" Text="編輯" NavigateUrl='<%# "MachineMachineGroupAddEdit.aspx?func=edit&processid="+processid+"&groupid="+DataBinder.Eval(Container, "DataItem.Groupid") %>'>
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
