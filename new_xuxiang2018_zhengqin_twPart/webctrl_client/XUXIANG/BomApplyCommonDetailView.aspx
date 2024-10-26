<%@ Page language="c#" Codebehind="BomApplyCommonDetailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.BomApplyCommonDetailView" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="BomApplyCommonHeader" Src="controls/BomApplyCommonHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
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
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left"><uc1:bomapplycommonheader id="BomApplyCommonHeader" runat="server"></uc1:bomapplycommonheader></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TBODY>
												<tr>
													<td style="HEIGHT: 32px"><asp:label id="lab_customerid" runat="server" Text="�Ȥ�"></asp:label></td>
									</td>
									<td style="HEIGHT: 32px"><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:label id="lab_Id" runat="server" Visible="False"></asp:label><asp:label id="lab_ApplyNo" runat="server" Visible="False"></asp:label></td>
									<td style="HEIGHT: 32px"><asp:label id="lab_moduleid" runat="server" Text="�Ҩ�s��"></asp:label></td>
									<td style="HEIGHT: 32px"><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td><asp:label id="lab_creater" runat="server" Text="�ЫؤH"></asp:label></td>
									<td><asp:dropdownlist id="dpl_creater" runat="server"></asp:dropdownlist></td>
									<td><asp:label id="lab_createDate" runat="server" Text="�Ыؤ��"></asp:label></td>
									<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar></td>
								</tr>
								<tr>
									<td style="HEIGHT: 25px"><asp:label id="lab_productno" runat="server" Text="���O�渹"></asp:label></td>
									<td style="HEIGHT: 25px"><asp:textbox id="txt_productno" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td vAlign="top">BOM����</td>
									<td colSpan="3"><asp:textbox id="txt_content" runat="server" Width="688px" Height="200px" TextMode="MultiLine"></asp:textbox></td>
								</tr>
								<tr>
									<td style="HEIGHT: 37px" colSpan="4">
										<hr>
									</td>
								</tr>
								<TR>
									<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
								</TR>
								<tr>
									<td colSpan="4"></td>
								</tr>
							</TABLE>
							<asp:datagrid id="dg_error" runat="server" AutoGenerateColumns="False">
								<Columns>
									<asp:BoundColumn DataField="ErrorLine" HeaderText="���"></asp:BoundColumn>
									<asp:BoundColumn DataField="ErrorMessage" HeaderText="���~��]"></asp:BoundColumn>
								</Columns>
							</asp:datagrid></TD>
					</tr>
				</TBODY>
			</TABLE>
			<br>
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
						<asp:label id="Label_Message" runat="server"></asp:label></TD>
				</TR>
			</table>
			</TD></TR>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
