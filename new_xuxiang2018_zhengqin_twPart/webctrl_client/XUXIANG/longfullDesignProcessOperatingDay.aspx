<%@ Page language="c#" Codebehind="longfullDesignProcessOperatingDay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.longfullDesignProcessOperatingDay" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具設計報工</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%">選擇工序<asp:dropdownlist id="Dropdownlist_Process" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True">
								<asp:ListItem Value="allstart">開始</asp:ListItem>
								<asp:ListItem Value="Implementation">結束</asp:ListItem>
								<asp:ListItem Value="Holdon">暫停</asp:ListItem>
							</asp:dropdownlist>模具編號查詢：<asp:textbox id="txt_searchmodelid" runat="server" AutoPostBack="True"></asp:textbox>
							<asp:button id="bnt_submission" runat="server" Text="提 交"></asp:button><asp:datagrid id="MainDataGrid" runat="server" PageSize="15" AllowPaging="True" AutoGenerateColumns="False"
								Width="100%" CellSpacing="2" CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="選擇">
										<HeaderTemplate>
											<asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:CheckBox id="CheckBox_Select" runat="server" Checked="False"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="用戶" HeaderStyle-Width="140px">
										<ItemTemplate>
											<asp:TextBox id="dpl_txt_user" runat="server" Width="100px"></asp:TextBox>
											<asp:button id="dg_btn_user" runat="server" Text="用戶" OnClick="dg_btn_user_Click" Width="32px"></asp:button>
											<asp:dropdownlist id="dg_dpl_user" Visible="False" runat="server" AutoPostBack="True" onSelectedIndexChanged="dpl_userno_SelectedIndexChanged"></asp:dropdownlist>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="模具編號">
										<ItemTemplate>
											&nbsp;
											<asp:Label runat="server" ID="dg_lab_ModuleId" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號ID" Visible="False"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="設計類別">
										<ItemTemplate>
											&nbsp;
											<asp:Label runat="server" Text='' ID="dg_lab_partno"></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="processorder" HeaderText="工序號"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="狀態">
										<ItemTemplate>
											<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusDesc") %>' ID="Label1">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="SelfStartDate" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="SelfEndDate" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactStartDate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactEndDate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="排程工時" Visible="False"></asp:BoundColumn>
									<asp:ButtonColumn Text="開始" ButtonType="PushButton" HeaderText="功能" CommandName="start" Visible="False"></asp:ButtonColumn>
									<asp:ButtonColumn Text="暫停" ButtonType="PushButton" CommandName="holdon" Visible="False"></asp:ButtonColumn>
									<asp:ButtonColumn Text="結束" ButtonType="PushButton" CommandName="end" Visible="False"></asp:ButtonColumn>
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
