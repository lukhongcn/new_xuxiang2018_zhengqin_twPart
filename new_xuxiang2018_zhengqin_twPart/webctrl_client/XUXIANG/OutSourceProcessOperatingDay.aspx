<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OutSourceProcessOperatingDaysearchheader" Src="controls/OutSourceProcessOperatingDaysearchheader.ascx" %>
<%@ Page language="c#" Codebehind="OutSourceProcessOperatingDay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceProcessOperatingDay" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�~�]���u</title>
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
						<TD vAlign="top" width="79%">
							<uc1:OutSourceProcessOperatingDaysearchheader id="OutSourceProcessOperatingDaysearchheader" runat="server"></uc1:OutSourceProcessOperatingDaysearchheader>
							<br>
							��ܤu��<asp:dropdownlist id="Dropdownlist_Process" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True">
								<asp:ListItem Value="Ready">�X�t</asp:ListItem>
								<asp:ListItem Value="Implementation">�^�t</asp:ListItem>
								<asp:ListItem Value="Holdon">�Ȱ�</asp:ListItem>
								<asp:ListItem Value="allstart">�Ҧ��X�t</asp:ListItem>
							</asp:dropdownlist>�Ҩ�s���d�ߡG<asp:textbox id="txt_searchmodelid" runat="server" AutoPostBack="True"></asp:textbox>
							<asp:button id="bnt_submission" runat="server" Text="�� ��"></asp:button><asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False"
								AllowPaging="True" PageSize="15">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="���">
										<HeaderTemplate>
											<asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:CheckBox id="CheckBox_Select" runat="server" Checked="False"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�Τ�">
										<HeaderStyle Width="100px"></HeaderStyle>
										<ItemTemplate>
											<asp:TextBox id="dpl_txt_user" runat="server" Width="48px"></asp:TextBox>
											<asp:button id="dg_btn_user" runat="server" Text="�Τ�" OnClick="dg_btn_user_Click" Width="32px"></asp:button>
											<asp:dropdownlist id="dg_dpl_user" Visible="False" runat="server" AutoPostBack="True" onSelectedIndexChanged="dpl_userno_SelectedIndexChanged"></asp:dropdownlist>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="���" Visible="False">
										<HeaderStyle Width="100px"></HeaderStyle>
										<ItemTemplate>
											<cc1:DatePicker id="dp_StartDate" runat="server" DateType="yyyy-mm-dd" imgDirectory="images/"></cc1:DatePicker>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�ɶ�">
										<HeaderStyle Width="60px"></HeaderStyle>
										<ItemTemplate>
											<asp:dropdownlist id="dpl_StartTime" runat="server" AutoPostBack="True"></asp:dropdownlist>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��s��ID"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�s��W��">
										<ItemTemplate>
											<asp:Label runat="server" Text='' ID="dg_lab_partno"></asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="processorder" HeaderText="�u�Ǹ�"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="���A">
										<ItemTemplate>
											<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusDesc") %>' ID="Label1">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="StartDate" HeaderText="�X�t���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndDate" HeaderText="�^�t���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactStartDate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactEndDate" HeaderText="��ڵ������" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="ProcessNeedMinutes" HeaderText="�Ƶ{�u��"></asp:BoundColumn>
									<asp:ButtonColumn Visible="False" Text="�}�l" ButtonType="PushButton" HeaderText="�\��" CommandName="start"></asp:ButtonColumn>
									<asp:ButtonColumn Visible="False" Text="�Ȱ�" ButtonType="PushButton" CommandName="holdon"></asp:ButtonColumn>
									<asp:ButtonColumn Visible="False" Text="����" ButtonType="PushButton" CommandName="end"></asp:ButtonColumn>
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
												<DIV align="center"><B>����</B></DIV>
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
