<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="milePartHeader" Src="controls/milePartHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="milePartEditOthers.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.milePartEditOthers" smartNavigation="True"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�s��]�w</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<script language="javascript" src="js/lib.js"></script>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:milepartheader id="milePartHeader" runat="server"></uc1:milepartheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										-
										<TD>�Ҩ�s��</TD>
										<TD><asp:label id="Label_ModuleId" runat="server"></asp:label>
											<asp:Label ID="lab_specCount" Runat="server" Visible="False"></asp:Label></TD>
										<td>�s��W��</td>
										<td><asp:textbox id="txt_partName" runat="server"></asp:textbox></td>
									</TR>
									<TR>
										<TD>�s��s��</TD>
										<TD><asp:label id="Label_PartNo" runat="server"></asp:label></TD>
										<TD>����</TD>
										<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD>�s��ϭ�</TD>
										<TD><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox></TD>
										<TD>�ƶq</TD>
										<TD><asp:textbox id="TextBox_PartCount" runat="server"></asp:textbox><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_PartCount"
												ErrorMessage="�п�J�Ʀr����" ValidationExpression="[0-9.]{1,}"></asp:regularexpressionvalidator></TD>
									</TR>
									<TR>
										<TD>���ų]�w</TD>
										<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
										<TD>�W��</TD>
										<TD><asp:textbox id="txt_spec" runat="server"></asp:textbox><asp:TextBox ID="txt_moduleComment" Runat="server" Visible="False"></asp:TextBox></TD>
									</TR>
									<TR>
										<td>�s��j��</td>
										<td><asp:dropdownlist id="dpl_parttype1" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_parttype2" runat="server"></asp:dropdownlist><asp:dropdownlist id="dpl_parttype3" runat="server"></asp:dropdownlist><asp:dropdownlist id="dpl_parttype4" runat="server"></asp:dropdownlist><asp:dropdownlist id="dpl_parttype5" runat="server"></asp:dropdownlist></td>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="edit"></asp:button><br>
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
										<asp:label id="Label_Message" runat="server" ForeColor="red" Font-Bold="True"></asp:label><asp:label id="Label_HiddenPartCount" runat="server" Visible="False"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
