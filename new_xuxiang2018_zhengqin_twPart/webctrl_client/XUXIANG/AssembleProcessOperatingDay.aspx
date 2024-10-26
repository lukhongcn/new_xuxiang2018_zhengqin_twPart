<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="AssembleProcessOperatingDay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.AssembleProcessOperatingDay" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>組立報工</title>
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
						<TD vAlign="top" width="79%">選擇客戶<asp:dropdownlist id="dpl_customer" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>
							<asp:dropdownlist id="dpl_module" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True">
								<asp:ListItem Value="Ready">開始</asp:ListItem>
								<asp:ListItem Value="Implementation">結束</asp:ListItem>
								<asp:ListItem Value="Holdon">暫停</asp:ListItem>
								<asp:ListItem Value="Continue">繼續</asp:ListItem>
								<asp:ListItem Value="Rezuli">組立返修</asp:ListItem>
							</asp:dropdownlist><asp:button id="bnt_submission" runat="server" Text="提 交"></asp:button><br>
							員工編號<asp:textbox id="txt_alluserno" Runat="server"></asp:textbox><asp:dropdownlist id="dpl_alluserno" AutoPostBack="True" Runat="server"></asp:dropdownlist>
							開始日期<wc:inputcalendar id="txt_allstartdate" runat="server"></wc:inputcalendar>
							時間<asp:dropdownlist id="dpl_allstarthours" runat="server" AutoPostBack="True"></asp:dropdownlist>:
							<asp:dropdownlist id="dpl_allstartminutes" runat="server" AutoPostBack="True">
								<asp:ListItem Value="00">00</asp:ListItem>
								<asp:ListItem Value="30">30</asp:ListItem>
							</asp:dropdownlist><br>
							<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>
							查詢：<asp:textbox id="txt_searchmodelid" runat="server" AutoPostBack="True"></asp:textbox>
							<asp:datagrid id="MainDataGrid" runat="server" PageSize="15" AutoGenerateColumns="False" Width="100%"
								CellSpacing="2" CellPadding="2">
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
									<asp:TemplateColumn HeaderText="用戶">
										<HeaderStyle Width="100px"></HeaderStyle>
										<ItemTemplate>
											<asp:TextBox id="dpl_txt_user" runat="server" Width="120px"></asp:TextBox>
											<asp:button id="dg_btn_user" runat="server" Text="用戶" OnClick="dg_btn_user_Click" Width="32px"></asp:button>
											<asp:dropdownlist id="dg_dpl_user" Visible="False" runat="server" AutoPostBack="True" onSelectedIndexChanged="dpl_userno_SelectedIndexChanged"></asp:dropdownlist>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="開始">
										<HeaderStyle Width="60px"></HeaderStyle>
										<ItemTemplate>
											<cc1:DatePicker id="dp_StartDate" runat="server" DateType="yyyy-mm-dd" imgDirectory="images/"></cc1:DatePicker>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="時間">
										<HeaderStyle Width="95px"></HeaderStyle>
										<ItemTemplate>
											<asp:dropdownlist id="dpl_StartTime" runat="server" AutoPostBack="True"></asp:dropdownlist>:
											<asp:dropdownlist id="dpl_StartMinutes" runat="server" AutoPostBack="True">
												<asp:ListItem Value="00">00</asp:ListItem>
												<asp:ListItem Value="30">30</asp:ListItem>
											</asp:dropdownlist>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="ModuleId">
										<HeaderTemplate>
											<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="零件名稱" Visible="False">
										<ItemTemplate>
											<asp:Label runat="server" Text='' ID="dg_lab_partno"></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="processid" HeaderText="工序"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="狀態">
										<ItemTemplate>
											<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusId") %>' ID="dg_lab_statusid">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="StartDate" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndDate" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactStartDate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactEndDate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="ProcessNo" HeaderText="ProcessNo"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="StatusColor" HeaderText="color"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="Comment" Visible="False">
										<HeaderTemplate>
											<asp:Label runat="server" ID="dg_header_comment" Text="備註"></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:TextBox id="txt_comment" runat="server" Text=""></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateColumn>
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
				</TBODY>
			</TABLE>
			</TD></TR><TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
