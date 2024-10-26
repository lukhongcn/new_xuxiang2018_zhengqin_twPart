<%@ Page language="c#" Codebehind="SceneSmallOperating.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.SceneSmallOperating" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�{���p�Ƶ{�T�{</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%">
							<table id="TableCondition" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<TR>
										<TD>�u��<asp:dropdownlist id="DropDownList_Process" Runat="server" AutoPostBack="True"></asp:dropdownlist>
											<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label>
											<asp:label id="Label_MultiProcess" runat="server" ForeColor="RED" Visible="False"></asp:label></TD>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
				CellPadding="2">
				<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
				<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
				<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
				<Columns>
					<asp:BoundColumn DataField="MACHINEID" HeaderText="���x�s��"></asp:BoundColumn>
					<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
					<asp:BoundColumn DataField="PartNo" HeaderText="�s��s��"></asp:BoundColumn>
					<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��s��-ID"></asp:BoundColumn>
					<asp:BoundColumn DataField="ProcessDate" HeaderText="���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
					<asp:BoundColumn DataField="ProcessMinutes" HeaderText="�[�u�ɶ�"></asp:BoundColumn>
					<asp:BoundColumn DataField="ProcessNo" HeaderText="�u�Ǹ�"></asp:BoundColumn>
					<asp:ButtonColumn Text="�}�l" ButtonType="PushButton" HeaderText="�\��" CommandName="start"></asp:ButtonColumn>
					<asp:ButtonColumn Text="�Ȱ�" ButtonType="PushButton" CommandName="holdon"></asp:ButtonColumn>
					<asp:ButtonColumn Text="����" ButtonType="PushButton" CommandName="end"></asp:ButtonColumn>
				</Columns>
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
					<TD class="msg" width="85%">&nbsp;&nbsp;</TD>
				</TR>
			</TABLE>
			</TD></TR>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE>
		</form>
	</body>
</HTML>
