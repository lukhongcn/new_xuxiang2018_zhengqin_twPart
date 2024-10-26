<%@ Page language="c#" Codebehind="MerchindiseCheckView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseCheckView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="MerchindiseCheckHeader" Src="controls/MerchindiseCheckHeader.ascx" %>
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
							<uc1:MerchindiseCheckHeader id="MerchindiseCheckHeader" runat="server"></uc1:MerchindiseCheckHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label>
											<tr>
												<td><asp:Label ID="lab_checkNo" runat="server" Text="�禬��"></asp:Label></td>
												<td><asp:textbox id="txt_checkNo" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_checkDate" runat="server" Text="�禬���"></asp:Label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_merchindiseID" runat="server" Text="���ʳ渹"></asp:Label></td>
												<td><asp:DropDownList id="dpl_merchindiseID" runat="server" AutoPostBack="True"></asp:DropDownList></td>
												<td><asp:Label ID="lab_merchindiseDate" runat="server" Text="���ʤ��"></asp:Label></td>
												<td><asp:textbox id="txt_merchindiseDate" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
											</tr>
											<tr>
												<td><asp:Label ID="lab_faxType" runat="server" Text="�|�O"></asp:Label></td>
												<td><asp:DropDownList id="dpl_faxType" runat="server" Enabled="False"></asp:DropDownList></td>
												<td><asp:Label ID="lab_applierNo" runat="server" Text="������"></asp:Label></td>
												<td><asp:DropDownList id="dpl_applierNo" runat="server" Enabled="False"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_moneyTypeId" runat="server" Text="�x�O">���O</asp:Label></td>
												<td><asp:DropDownList id="dpl_moneyTypeId" runat="server" Enabled="False"></asp:DropDownList></td>
												<td><asp:Label ID="lab_changeRate" runat="server" Text="�ײv"></asp:Label></td>
												<td><asp:textbox id="txt_changeRate" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_payCondition" runat="server" Text="�I�ڱ���"></asp:Label></td>
												<td><asp:DropDownList id="dpl_payCondition" runat="server" Enabled="False"></asp:DropDownList></td>
												<td><asp:Label ID="lab_payDays" runat="server" Text="�I�ڤѼ�"></asp:Label></td>
												<td><asp:textbox id="txt_payDays" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_creater" runat="server" Text="���H"></asp:Label></td>
												<td><asp:DropDownList id="dpl_creater" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_createrDate" runat="server" Text="�����"></asp:Label></td>
												<td><wc:inputcalendar id="txt_createrDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_ohterCondition" runat="server" Text="��L����"></asp:Label></td>
												<td><asp:DropDownList id="dpl_ohterCondition" runat="server" Enabled="False"></asp:DropDownList></td>
												<td><asp:Label ID="lab_comment" runat="server" Text="�K�n"></asp:Label></td>
												<td><asp:textbox id="txt_comment" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_merchindiseOrderNo" runat="server" Text="merchindiseOrderNo" Visible="False"></asp:Label></td>
												<td><asp:textbox id="txt_merchindiseOrderNo" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:Label ID="lab_applierName" runat="server" Text="applierName" Visible="False"></asp:Label></td>
												<td><asp:textbox id="txt_applierName" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_applyDepartmentManage" runat="server" Text="applyDepartmentManage" Visible="False"></asp:Label></td>
												<td><asp:textbox id="txt_applyDepartmentManage" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:Label ID="lab_evaluateDate" runat="server" Text="evaluateDate" Visible="False"></asp:Label></td>
												<td><asp:textbox id="txt_evaluateDate" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_moneyTypeName" runat="server" Text="moneyTypeName" Visible="False"></asp:Label></td>
												<td><asp:textbox id="txt_moneyTypeName" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
										</table>
										<asp:Button id="btn_Detail" runat="server" Text="�禬����" Enabled="False"></asp:Button>
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
