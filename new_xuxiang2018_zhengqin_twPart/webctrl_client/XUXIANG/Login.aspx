<%@ Page language="c#" Codebehind="Login.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Login" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�n�J</title>
		<Forum:Style id="Style" runat="server" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="�s�ө���"></FONT><FONT face="�s�ө���"></FONT><FONT face="�s�ө���"></FONT><FONT face="�s�ө���">
			</FONT><FONT face="�s�ө���"></FONT><FONT face="�s�ө���"></FONT><FONT face="�s�ө���"></FONT>
			<FONT face="����"></FONT><FONT face="����"></FONT><FONT face="����"></FONT>
			<br>
			<br>
			<br>
			<br>
			<table cellspacing="0" cellpadding="2" rules="all" border="1" id="MainDataGrid" style="WIDTH:260px"
				align="center">
				<tr nowrap="nowrap" align="center" valign="middle" style="BACKGROUND-COLOR:#aaaadd">
					<td colspan="2"><DIV align="center"><B>�t�εn�J</B></DIV>
					</td>
				</tr>
				<tr>
					<td>���u�s��</td>
					<td><asp:TextBox ID="TextBox_UserName" Runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<td>�f�O</td>
					<td><INPUT type="password" name="HTML_Password" runat="server" id="HTML_Password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><asp:Button ID="Button_Login" Runat="server" Text="�n�J"></asp:Button>&nbsp;&nbsp;<INPUT type="reset" value="����"></td>
				</tr>
			</table>
			<br>
			<TABLE id="Table2" borderColor="#000660" borderColorDark="#000066" style="WIDTH:260px"
				align="center" borderColorLight="#000066" border="1">
				<TR vAlign="middle">
					<TD width="15%" height="28">
						<DIV align="center"><B>
								<DIV align="center"><B>����</B></DIV>
							</B>
						</DIV>
					</TD>
					<TD class="msg" width="85%">&nbsp;&nbsp;
						 <asp:label id="Label_Message" runat="server" ForeColor="Red"></asp:label></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
