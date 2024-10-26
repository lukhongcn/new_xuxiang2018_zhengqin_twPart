<%@ Page language="c#" Codebehind="Login.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Login" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>登入</title>
		<Forum:Style id="Style" runat="server" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<FONT face="新細明體"></FONT><FONT face="新細明體"></FONT><FONT face="新細明體"></FONT><FONT face="新細明體">
			</FONT><FONT face="新細明體"></FONT><FONT face="新細明體"></FONT><FONT face="新細明體"></FONT>
			<FONT face="宋體"></FONT><FONT face="宋體"></FONT><FONT face="宋體"></FONT>
			<br>
			<br>
			<br>
			<br>
			<table cellspacing="0" cellpadding="2" rules="all" border="1" id="MainDataGrid" style="WIDTH:260px"
				align="center">
				<tr nowrap="nowrap" align="center" valign="middle" style="BACKGROUND-COLOR:#aaaadd">
					<td colspan="2"><DIV align="center"><B>系統登入</B></DIV>
					</td>
				</tr>
				<tr>
					<td>員工編號</td>
					<td><asp:TextBox ID="TextBox_UserName" Runat="server"></asp:TextBox></td>
				</tr>
				<tr>
					<td>口令</td>
					<td><INPUT type="password" name="HTML_Password" runat="server" id="HTML_Password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><asp:Button ID="Button_Login" Runat="server" Text="登入"></asp:Button>&nbsp;&nbsp;<INPUT type="reset" value="重填"></td>
				</tr>
			</table>
			<br>
			<TABLE id="Table2" borderColor="#000660" borderColorDark="#000066" style="WIDTH:260px"
				align="center" borderColorLight="#000066" border="1">
				<TR vAlign="middle">
					<TD width="15%" height="28">
						<DIV align="center"><B>
								<DIV align="center"><B>提示</B></DIV>
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
