<%@ Page language="c#" Codebehind="MerchindiseApplyView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseApplyView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="MerchindiseApplyHeader" Src="controls/MerchindiseApplyHeader.ascx" %>
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
						<TD vAlign="top" width="79%"><uc1:merchindiseapplyheader id="MerchindiseApplyHeader" runat="server"></uc1:merchindiseapplyheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyNo" runat="server" Text="請購單號"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseApplyNo" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inputDate" runat="server" Text="請購日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_inputDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestRequisitionId" runat="server" Text="申請單號"></asp:label></td>
												<td><asp:dropdownlist id="dpl_assestRequisitionId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyCreater" runat="server" Text="制單人"></asp:label></td>
												<td><asp:dropdownlist id="dpl_MerchindiseApplyCreater" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyCreateDate" runat="server" Text="制單日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_MerchindiseApplyCreateDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyChecker" runat="server" Text="" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseApplyChecker" runat="server" Text="" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyCheckDate" runat="server" Text="" Visible="False"></asp:label></td>
												<td><wc:inputcalendar id="txt_MerchindiseApplyCheckDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyApprover" runat="server" Text="" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseApplyApprover" runat="server" Text="" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyApproveDate" runat="server" Text="" Visible="False"></asp:label></td>
												<td><wc:inputcalendar id="txt_MerchindiseApplyApproveDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyComment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseApplyComment" runat="server" Text=""></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_status" runat="server" Text="" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_status" runat="server" Text="" Visible="False"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
										<asp:button id="btn_Detail" runat="server" Text="請購明細" Enabled="False"></asp:button></td>
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
