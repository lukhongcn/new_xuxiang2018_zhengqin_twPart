<%@ Page language="c#" Codebehind="Synchronize.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Synchronize" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<HTML>
	<HEAD>
		<title>¡¼¡¼¹G¥Ü</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
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
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<tr>
										<td><FONT color="red">(¡¼¡¼¹G¥Ü¡¼¥sÂÎÁñ¡¼¡¼¡¼¬\¡¼)</FONT>
										</td>
									</tr>
									<tr>
										<td>
											<P>&nbsp;</P>
											<P><FONT face="¡¼Àé¡¼¯y">&nbsp;&nbsp; </FONT>
												<asp:button id="Button_Submit" Text="¡¼¡¼¹G¥Ü" Runat="server"></asp:button></P>
											<P><FONT face="¡¼Àé¡¼¯y">
													<asp:Panel id="Panel1" runat="server"></asp:Panel></FONT></P>
											<asp:Panel id="Panel2" runat="server">Panel</asp:Panel>
										</td>
									</tr>
								</TBODY>
							</TABLE>
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
	</body>
</HTML>
