<%@ Page language="c#" Codebehind="UserPasswordChange.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserPasswordChange" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=menuname %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../ui-lightness/jquery-ui-1.8.13.custom.css" type="text/css" />
<link rel="stylesheet" href="../jquery-ui-timepicker.css?v=0.2.2" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.ui.core.js"></script>
<script type="text/javascript" src="../js/jquery.ui.timepicker.js?v=0.2.2"></script>
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="#"><%=Utility.Translate.translateString("�Ͳ��޲z")%></a>
<img src="images/arrow.png" />
<a href="#"><%=menuname %></a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent"><%=Utility.Translate.translateString("�n�X")%></a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>

<li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="�x�s/save" OnClick="lnkbutton_save_Click">�x�s/save</asp:LinkButton>
</li>

</ul>
</div>
<div class="mod2"></div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="space1"></div>
<div class="Textbox"><TABLE id="Table1" width="100%" align="center" class="tbone"><TBODY>
<tr><td colSpan="4"><B><%=Utility.Translate.translateString("�ж�J�H�U�H��")%></B>
</td>
</tr>
<TR>
<TD><%=Utility.Translate.translateString("���u�s��")%></TD>
<TD><asp:Label Runat="server" ID="lab_UserName" /></TD>
<TD><%=Utility.Translate.translateString("���u�m�W")%></TD>
<TD><asp:Label Runat="server" ID="lab_Name" />
</TD>
<TD><%=Utility.Translate.translateString("�q�l�l��")%></TD>
<TD><asp:TextBox Runat="server" ID="txt_Email" />
</TD>
<TD><%=Utility.Translate.translateString("�K�X")%></TD>
<TD><asp:TextBox Runat="server" ID="txt_password" />
</TD>
</TR>

</TBODY>
</TABLE>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B><%=Utility.Translate.translateString("����")%></B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label>
</TD>
</TR>
</table>
</div>
</div>
</div>
</div>
</form>
</body>
</html>

