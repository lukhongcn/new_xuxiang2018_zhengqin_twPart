<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="OutsourceApplyView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutsourceApplyView" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/logisticheader.ascx" %>
<%@ Register TagPrefix="GridSelectCheckBox" Namespace="Utility" Assembly="Utility" %>
<%@ Register TagPrefix="uc1" TagName="OutSourceApplyHeader" Src="control/OutSourceApplyHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>外包申請管理</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" name="Form1" method="post" runat="server">
			<FONT face="新細明體">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</FONT>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:outsourceapplyheader id="OutSourceApplyHeader" runat="server"></uc1:outsourceapplyheader>
							<asp:Label id="lab_func" runat="server" Visible="False"></asp:Label>
							<asp:Label id="lab_id" runat="server" Visible="False"></asp:Label><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<TD width="95">模具編號</TD>
										<TD width="40%"><asp:dropdownlist id="dpl_module" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="請選擇有效的模具編號" ControlToValidate="dpl_module"></asp:requiredfieldvalidator></TD>
										<TD width="10%">客戶編號</TD>
										<TD width="40%"><asp:dropdownlist id="dpl_customer" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
									</tr>
									<TR>
										<TD width="95">零件編號</TD>
										<TD width="40%"><asp:textbox id="txt_partno" runat="server" AutoPostBack="True"></asp:textbox></TD>
										<TD width="95">零件小編號</TD>
										<TD width="40%"><asp:textbox id="txt_partnoid" runat="server" AutoPostBack="True">1</asp:textbox><asp:label id="Label1" runat="server" ForeColor="Red">格式輸入"1"或"1-4"或"1,3"</asp:label></TD>
									</TR>
									<TR>
										<TD height="18">申請人</TD>
										<TD height="18"><asp:dropdownlist id="dpl_user" runat="server"></asp:dropdownlist></TD>
										<TD height="18">申請部門</TD>
										<TD height="18"><asp:dropdownlist id="dpl_department" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD>需求日期</TD>
										<TD colspan="3"><wc:inputcalendar id="txt_requiredate" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD width="95">工序設定</TD>
										<TD colSpan="3">
											<table id="tableSetting" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<td vAlign="top"><font color="red">選擇所需工序</font>
														<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 250px; BORDER-BOTTOM-STYLE: ridge"><asp:checkboxlist id="chkl_Process" runat="server" AutoPostBack="True"></asp:checkboxlist></div>
													</td>
													<td vAlign="top"></td>
												</tr>
											</table>
											<asp:button id="btn_add" runat="server" Text="保存"></asp:button></TD>
									</TR>
								</TBODY></TABLE>
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label><asp:label id="lab_deleted" runat="server"></asp:label><asp:label id="lab_partidcount" runat="server" Visible="False"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY></TABLE>
		</form>
	</body>
</HTML>
