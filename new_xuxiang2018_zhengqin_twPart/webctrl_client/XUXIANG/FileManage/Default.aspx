<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="VersionControler.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>���ɺ޲z</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Style.css" type="text/css" rel="stylesheet">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%" valign=top><div style="WIDTH: 100px" style="flaot:left " ><asp:panel id="pan_treeview" runat="server"></asp:panel></div></TD>
						<TD vAlign="top" width="79%">
							
							<div id="content-mid"><asp:button id="Button1" runat="server" Text="�Ы�"></asp:button>
							<asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
									<Columns>
										<asp:TemplateColumn HeaderText="�Ǹ�">
											<ItemTemplate>
												<%# (DataGrid1.CurrentPageIndex * DataGrid1.PageSize + Container.ItemIndex + 
1) %>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:BoundColumn DataField="Name" HeaderText="�ɮצW��"></asp:BoundColumn>
										<asp:BoundColumn DataField="CreateDate" HeaderText="���ɤ��"></asp:BoundColumn>
										<asp:BoundColumn DataField="Creator" HeaderText="���ɤH"></asp:BoundColumn>
										<asp:HyperLinkColumn Text="�ԲӫH��" DataNavigateUrlField="ID" DataNavigateUrlFormatString="FileListUpload.aspx?ID={0}"></asp:HyperLinkColumn>
										<asp:ButtonColumn Text="�R��" CommandName="Delete"></asp:ButtonColumn>
										<asp:TemplateColumn Visible="False">
											<ItemTemplate>
												<asp:Label ID ="lbFileListID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ID") %>'>
												</asp:Label>
											</ItemTemplate>
										</asp:TemplateColumn>
									</Columns>
								</asp:datagrid></div>
							<div id="content-end"><asp:label id="lbMessage11" Runat="server"></asp:label></div>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>����</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="lbMessage" runat="server"></asp:label></TD>
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
