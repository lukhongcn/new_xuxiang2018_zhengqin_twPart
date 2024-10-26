<%@ Register TagPrefix="uc1" TagName="PartOutInventoryHeader" Src="controls/PartOutInventoryHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="PartOutInventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.PartOutInventoryView" %>
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
						<TD vAlign="top" width="79%"><uc1:partoutinventoryheader id="PartOutInventoryHeader" runat="server"></uc1:partoutinventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_outDate" runat="server" Text="出庫日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_outDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_outNo" runat="server" Text="出庫單">出庫單號</asp:label></td>
												<td><asp:textbox id="txt_outNo" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
												<td><asp:dropdownlist id="dpl_customerid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></td>
												<td><asp:dropdownlist id="dpl_moduleId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_productName" runat="server" Text="產品名稱"></asp:label></td>
												<td><asp:textbox id="txt_productName" runat="server" Enabled="False"></asp:textbox></td>
												<td><asp:label id="lab_productNo" runat="server" Text="產品編號"></asp:label></td>
												<td><asp:textbox id="txt_productNo" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_outer" runat="server" Text="領用人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_outer" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
										<asp:Button id="btn_detail" runat="server" Text="明細項目" Enabled="False"></asp:Button>
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
												<DIV align="center"><B>提示信息</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
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
