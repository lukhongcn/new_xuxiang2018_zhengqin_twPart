<%@ Register TagPrefix="uc1" TagName="AssembleInInventoryHeader" Src="controls/AssembleInInventoryHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="AssembleInInventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.AssembleInInventoryView" %>
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
						<TD vAlign="top" width="79%"><uc1:assembleininventoryheader id="AssembleInInventoryHeader" runat="server"></uc1:assembleininventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_inventoryNo" runat="server" Text="入庫單號"></asp:label></td>
												<td><asp:textbox id="txt_inventoryNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_inventoryDate" runat="server" Text="入庫日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_inventoryDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td style="HEIGHT: 20px"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></td>
												<td style="HEIGHT: 20px"><asp:textbox id="txt_productmaterialno" runat="server" ReadOnly="True"></asp:textbox>&nbsp;&nbsp;&nbsp;&nbsp;<asp:button ID="btn_search" Runat="server" Text="查詢"></asp:button></td>
												<td style="HEIGHT: 20px"><asp:label id="lab_moduleName" runat="server" Text="模具名稱"></asp:label></td>
												<td style="HEIGHT: 20px"><asp:textbox id="txt_name" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												
												<td><asp:label id="lab_pictureNo" runat="server" Text="圖號"></asp:label></td>
												<td><asp:textbox id="txt_pictureNo" runat="server"></asp:textbox></td>
											
												<td><asp:label id="lab_inNum" runat="server" Text="數量"></asp:label></td>
												<td><asp:textbox id="txt_inNum" runat="server" ReadOnly="True"></asp:textbox><asp:label ID="lab_oldnum" Runat="server" Visible="False"></asp:label></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inShelfNo" runat="server" Text="庫位"></asp:label></td>
												<td><asp:dropdownlist id="dpl_inShelfNo" runat="server"></asp:dropdownlist></td>
											
												<td><asp:label id="lab_inInventorier" runat="server" Text="入庫人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_inInventorier" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checker" runat="server" Text="申核人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checker" runat="server"></asp:dropdownlist></td>
											
												<td><asp:label id="lab_checkDate" runat="server" Text="申核日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_reApprover" runat="server" Text="復核人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_reApprover" runat="server"></asp:dropdownlist></td>
											
												<td><asp:label id="lab_reApproveDate" runat="server" Text="復核日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_reApproveDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_approver" runat="server" Text="核准人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_approver" runat="server"></asp:dropdownlist></td>
											
												<td><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
												<td><asp:textbox id="txt_customerid" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_approveDate" runat="server" Text="核准日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_approveDate" runat="server"></wc:inputcalendar></td>
											
												<td><asp:label id="lab_comment" runat="server" Text="註釋"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</tr>
										</table>
										<asp:button id="btn_detail" runat="server" Text="項目" Enabled="False" Visible="False"></asp:button></td>
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
