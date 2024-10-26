
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Page language="c#" Codebehind="UserEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserEdit" %>
<%--<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>--%>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=menuname %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../ui-lightness/jquery-ui-1.8.13.custom.css" type="text/css" />
<link rel="stylesheet" href="../jquery-ui-timepicker.css?v=0.2.2" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.ui.core.js"></script>
<script type="text/javascript" src="../js/jquery.ui.timepicker.js?v=0.2.2"></script>
</head>
<body><form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true"></asp:ScriptManager>
    <div id="Wrapper">
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
<div class="Textbox"><TABLE id="Table1" width="100%" align="center" class="tbone"><TBODY>
<tr><td colSpan="4"><B><%=Utility.Translate.translateString("�ж�J�H�U�H��")%></B>
</td>
</tr>
<TR>
<TD><%=Utility.Translate.translateString("���u�s��")%></TD>
<TD><asp:TextBox Runat="server" ID="txb_UserName" />
</TD>
<TD><%=Utility.Translate.translateString("���u�d��")%></TD>
<TD><asp:TextBox Runat="server" ID="txb_CardId" />
</TD>
</TR>
<TR>
<TD><%=Utility.Translate.translateString("���u�m�W")%></TD>
<TD><asp:TextBox Runat="server" ID="txb_Name" />
</TD>
<td valign="top"><%=Utility.Translate.translateString("���u����")%></td>
<td valign="top"><asp:DropDownList id="ddl_department" runat="server"></asp:DropDownList>
</td>
</TR>
<TR>
<TD><%=Utility.Translate.translateString("�q�l�l��")%></TD>
<TD><asp:TextBox Runat="server" ID="txb_Email" />
</TD>
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
<tr>
<td><%=Utility.Translate.translateString("�O�_��¾")%></td>
<td><asp:CheckBox runat="server" ID="chk_resignation" /></td>
<td><%=Utility.Translate.translateString("��¾�ɶ�")%></td>
<td><asp:TextBox ID="txt_resignDate" runat="server"></asp:TextBox>
    <ajaxtoolkit:calendarextender id="cal_sdate" runat="server" targetcontrolid="txt_resignDate"></ajaxtoolkit:calendarextender>
</td>
    </tr>
    <tr>
<td><%=Utility.Translate.translateString("�ƪ`")%></td>
<td colspan="3"><asp:TextBox ID="txt_comment" runat="server"></asp:TextBox></td>
</tr>

<TR><TD colspan="4">
<asp:button id="Button_Edit" runat="server" Text="�O�s�ק�" visible="false"></asp:button>
<asp:Label id="lab_id" runat="server" Visible="False"></asp:Label>
<asp:Label id="lab_name" runat="server" Visible="False"></asp:Label>
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

