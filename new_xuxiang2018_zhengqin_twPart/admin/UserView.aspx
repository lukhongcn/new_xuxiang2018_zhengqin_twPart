<%@ Page language="c#" Codebehind="UserView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.UserView" %>
<%--<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>--%>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
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
<li class="btn1"><a href="UserView.aspx" runat="server" title="�s�W/ add">�s�W/add</a>
</li>
<li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="�x�s/save" OnClick="lnkbutton_save_Click">�x�s/save</asp:LinkButton>
</li>
<li class="btn5"><a href="UserList.aspx" runat="server" title="�˵�/ view">�˵�/view</a>
</li>
</ul>
</div>
<div class="mod2"></div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="space1"></div>
<div class="Textbox"><table width="100%" align="center" border="0">
<tr>
<TD><%=Utility.Translate.translateString("���u�s��")%>:</TD>
<TD>
<asp:textbox id="txt_username" runat="server"></asp:textbox>
<asp:CustomValidator id="val_username" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txt_username"></asp:CustomValidator>
</TD>
<td valign="top"><%=Utility.Translate.translateString("���u¾��")%></td>
<td valign="top"><asp:DropDownList id="ddl_department" runat="server"></asp:DropDownList>
</td>
</tr>
<TR>
<TD><%=Utility.Translate.translateString("���u�m�W")%></TD>
<TD><asp:textbox id="txt_name" runat="server"></asp:textbox>
</TD>
<TD><%=Utility.Translate.translateString("���u�d��")%></TD>
<TD><asp:textbox id="txt_cardid" runat="server"></asp:textbox>
</TD>
</TR>
<TR>
<TD>Email</TD>
<TD><asp:textbox id="txt_email" runat="server"></asp:textbox></TD>
<td><%=Utility.Translate.translateString("�W�Z�ɶ�")%></td>
<td>
 <asp:textbox id="txt_starttime" runat="server" Width="70" />
                                                        <script type="text/javascript">
                                                            $(document).ready(function() {
                                                                $('#txt_starttime').timepicker({
                                                                    showPeriod: false,
                                                                    showLeadingZero: false
                                                                });
                                                            });
                                                        </script>
</td>
</TR>
<tr>
<td><%=Utility.Translate.translateString("�u�@�ɶ�")%></td>
<td><asp:TextBox ID="txt_workhours" runat="server"></asp:TextBox></td>
<td><%=Utility.Translate.translateString("�𮧮ɶ�")%></td>
<td><asp:TextBox ID="txt_breakhours" runat="server"></asp:TextBox></td>
</tr>
</table>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B>
<asp:Label ID="Label2" runat="server">����</asp:Label><DIV align="center"><B></B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
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

