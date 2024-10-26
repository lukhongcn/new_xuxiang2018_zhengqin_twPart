<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Page language="c#" Codebehind="RegnoHelp.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Regno.RegnoHelp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>RegnoHelp</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="4"></TD>
					</TR>
					<tr>
						<td>·øÚò»H¡¼Ã¡¡¼</td>
						<td><asp:label id="BaseInfo" runat="server"></asp:label></td>
						<td><asp:button id="Button1" runat="server" Text="±w¡¼"></asp:button></td>
					</tr>
					<tr>
						<td>¯R¡¼Úò</td>
						<td><asp:TextBox id="txt_regno" runat="server"></asp:TextBox></td>
						<td><asp:Button id="Button2" runat="server" Text="÷ç¡¼"></asp:Button></td>
					</tr>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
