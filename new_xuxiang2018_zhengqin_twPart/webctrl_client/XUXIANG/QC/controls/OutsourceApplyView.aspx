<%@ Register TagPrefix="uc1" TagName="OutSourceApplyHeader" Src="controls/OutSourceApplyHeader.ascx" %>
<%@ Register TagPrefix="GridSelectCheckBox" Namespace="Utility" Assembly="Utility" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/logisticheader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="OutsourceApplyView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.QC.control.OutsourceApplyView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�������s���~</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" name="Form1" method="post" runat="server">
			<FONT face="���顼�y">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</FONT>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:OutSourceApplyHeader id="OutSourceApplyHeader" runat="server"></uc1:OutSourceApplyHeader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td width="95">
											�]������
										</td>
										<td>
											<asp:TextBox id="txt_partid" runat="server" AutoPostBack="True"></asp:TextBox>
											<asp:RegularExpressionValidator id="reg_partid" runat="server" ControlToValidate="txt_partid" ValidationExpression="^\d+$"
												ErrorMessage="�s�����p��"></asp:RegularExpressionValidator></td>
										<td>
											�ѡ��a������
										</td>
										<td>
											<asp:CheckBox id="chk_moduleall" runat="server"></asp:CheckBox></td>
									</tr>
									<TR>
										<TD width="95">�a����</TD>
										<TD width="40%"><asp:dropdownlist id="dpl_module" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="�s�J�ڣV�����a����" ControlToValidate="dpl_module"></asp:requiredfieldvalidator></TD>
										<TD width="10%">������</TD>
										<TD width="40%"><asp:dropdownlist id="dpl_customer" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD width="95">�]����</TD>
										<TD width="40%">
											<asp:TextBox id="txt_partno" runat="server"></asp:TextBox>
										</TD>
										<TD>�������p</TD>
										<TD>
											<asp:Label id="lab_canOutSource" runat="server"></asp:Label></TD>
									</TR>
									<TR>
										<TD>�����p��</TD>
										<TD>
											<asp:TextBox id="txt_outsourcenumber" runat="server"></asp:TextBox></TD>
										<TD>�f�¡��W</TD>
										<TD>
											<wc:inputcalendar id="txt_requiredate" runat="server"></wc:inputcalendar></TD>
									</TR>
									<TR>
										<TD height="18">���s��</TD>
										<TD height="18">
											<asp:DropDownList id="dpl_user" runat="server"></asp:DropDownList></TD>
										<TD height="18">���s����</TD>
										<TD height="18">
											<asp:DropDownList id="dpl_department" runat="server"></asp:DropDownList></TD>
									</TR>
									<TR>
										<TD width="95">�������~</TD>
										<TD colSpan="3">
											<table id="tableSetting" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<td vAlign="top"><font color="red">�J�ڢs�f����</font>
														<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 250px; BORDER-BOTTOM-STYLE: ridge"><asp:checkboxlist id="chkl_Process" runat="server" AutoPostBack="True"></asp:checkboxlist></div>
													</td>
													<td vAlign="top"></td>
												</tr>
											</table>
											<asp:Button id="btn_add" runat="server" Text="�硼"></asp:Button>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>����</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label><asp:label id="lab_deleted" runat="server"></asp:label></TD>
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
