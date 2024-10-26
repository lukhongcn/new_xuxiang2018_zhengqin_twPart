<%@ Page language="c#" Codebehind="InitialInventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.InitialInventoryView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="InitialInventoryHeader" Src="controls/InitialInventoryHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:initialinventoryheader id="InitialInventoryHeader" runat="server"></uc1:initialinventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_myNo" runat="server" Text="�渹"></asp:label></td>
												<td><asp:textbox id="txt_myNo" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_productMaterialId" runat="server" Text="�ƫ~�W��">�ƫ~�s��</asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox>
													<asp:Button id="btn_detail" runat="server" Text="�d��"></asp:Button></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_name" Runat="server" Text="�ƫ~�W��"></asp:Label></td>
												<td><asp:TextBox ID="txt_name" Runat="server" Enabled="False" />
												</td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_unit" Runat="server" Text="���"></asp:Label></td>
												<td><asp:TextBox ID="txt_unit" Runat="server" Enabled="False" /></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryPCS" runat="server" Text="�J�w�s��"></asp:label></td>
												<td><asp:textbox id="txt_inventoryPCS" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_shelfNoId" runat="server" Text="�w��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_shelfNoId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryCount" runat="server" Text="�J�w�ƶq"></asp:label></td>
												<td><asp:textbox id="txt_inventoryCount" runat="server"></asp:textbox><asp:label ID="lab_oldcount" Runat="server" Visible="False"></asp:label></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryWeight" runat="server" Text="�J�w���q"></asp:label></td>
												<td><asp:textbox id="txt_inventoryWeight" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_price" runat="server" Text="���"></asp:label></td>
												<td><asp:textbox id="txt_price" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryDate" runat="server" Text="�J�w���"></asp:label></td>
												<td><wc:inputcalendar id="txt_inventoryDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>���ܫH��</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="Red"></asp:label></TD>
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
