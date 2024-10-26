<%@ Register TagPrefix="uc1" TagName="RejectHeader" Src="controls/RejectHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="RejectView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.RejectView" %>
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
						<TD vAlign="top" width="79%">
							<uc1:RejectHeader id="RejectHeader" runat="server"></uc1:RejectHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label>
											<tr>
												<td><asp:Label ID="lab_rejectNo" runat="server" Text="退貨單號"></asp:Label></td>
												<td><asp:textbox id="txt_rejectNo" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_rejectDate" runat="server" Text="退貨日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_rejectDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_rejectType" runat="server" Text="退貨類型"></asp:Label></td>
												<td><asp:DropDownList id="dpl_rejectType" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_MerchindiseId" runat="server" Text="驗收單號"></asp:Label></td>
												<td><asp:DropDownList id="dpl_MerchindiseId" runat="server" AutoPostBack="True"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_rejectCreater" runat="server" Text="制單人"></asp:Label></td>
												<td><asp:DropDownList id="dpl_rejectCreater" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_createDate" runat="server" Text="制單日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_checker" runat="server" Text="審核人"></asp:Label></td>
												<td><asp:DropDownList id="dpl_checker" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_checkDate" runat="server" Text="審核日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_approver" runat="server" Text="核准人"></asp:Label></td>
												<td><asp:DropDownList id="dpl_approver" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_finicialApproveDate" runat="server" Text="核准日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_finicialApproveDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_factory" runat="server" Text="廠牌"></asp:Label></td>
												<td><asp:textbox id="txt_factory" runat="server" Enabled="False"></asp:textbox></td>
												<td><asp:Label ID="lab_finicialCheckDate" runat="server" Text="財務審核日期" Visible="False">財務審核日期</asp:Label></td>
												<td><wc:inputcalendar id="txt_finicialCheckDate" runat="server" Visible="False" Text=""></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_accountDate" runat="server" Text="記賬日期" Visible="False">記賬日期</asp:Label></td>
												<td><wc:inputcalendar id="txt_accountDate" runat="server" Visible="False" Text=""></wc:inputcalendar></td>
												<td><asp:Label ID="lab_finicialChecker" runat="server" Text="財務審核" Visible="False">財務審核</asp:Label></td>
												<td><asp:DropDownList id="dpl_finicialChecker" runat="server" Visible="False"></asp:DropDownList></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
										<asp:Button id="btn_Detail" runat="server" Text="退貨明細" Enabled="False"></asp:Button>
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
