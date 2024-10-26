<%@ Page language="c#" Codebehind="CustomerAdd.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.CustomerAdd" %>
<%@ Register TagPrefix="uc1" TagName="CustomerHeader" Src="controls/CustomerHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>¡¼¡¼¡¼¡~</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topmargin="0">
		<form id="Form1" method="post" runat="server">
			<P>
				<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TBODY>
						<TR>
							<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
						</TR>
						<TR>
							<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
							<TD width="1%">&nbsp;</TD>
							<TD vAlign="top" width="79%">
								<uc1:CustomerHeader id="CustomerHeader" runat="server"></uc1:CustomerHeader><BR>
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
									<tr>
										<td colspan="2">
											<b>¥s´c¡¼¡¼¡¼Ã¡¡¼</b>
										</td>
									</tr>
									<TR>
										<TD width="20%">¡¼¡¼Úñ¸¡</TD>
										<TD width="80%"><asp:textbox id="TextBoxCustomerID" runat="server"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCustomerID"
												ErrorMessage="Please input Customer ID"></asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD>¡¼¡¼¡¼¼K</TD>
										<TD><asp:textbox id="TextBoxCustomerName" runat="server"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="Please input Customer Name"
												ControlToValidate="TextBoxCustomerName"></asp:requiredfieldvalidator></TD>
									</TR>
									<TR>
										<TD></TD>
										<TD><asp:button id="ButtonAdd" runat="server" Text="Øo¡¼"></asp:button></TD>
									</TR>
								</TABLE>
								<br>
								<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
									borderColorLight="#000066" border="1">
									<TR vAlign="middle">
										<TD width="15%" height="28">
											<DIV align="center"><B>
													<DIV align="center"><B>Å÷¡¼</B></DIV>
												</B>
											</DIV>
										</TD>
										<TD class="msg" width="85%">&nbsp;&nbsp;
											<asp:label id="Label_Message" runat="server"></asp:label></TD>
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
		</P>
	</body>
</HTML>
