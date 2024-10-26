<%@ Page language="c#" Codebehind="EmailGroupEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.EmailGroupEdit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=menuname %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="#"><%=Utility.Translate.translateString("生產管理")%></a>
<img src="images/arrow.png" />
<a href="#"><%=menuname %></a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent"><%=Utility.Translate.translateString("登出")%></a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
</li>
<li class="btn5"><a href="EmailGroupList.aspx" title="檢視/ view">檢視/view</a>
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
<tr><td colSpan="2"><B><%=Utility.Translate.translateString("請選擇要維護的郵件群組")%></asp:Label></B>
</td>
</tr>
<TR>
<TD><%=Utility.Translate.translateString("郵件群組名稱")%></TD>
<TD><asp:DropDownList ID="drp_emailgrouplist" Runat="server" AutoPostBack="True"></asp:DropDownList>
<asp:DropDownList id="dpl_department" runat="server" 
        onselectedindexchanged="dpl_department_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
</TD>
</TR>
<TR>
<TD><%=Utility.Translate.translateString("用戶選擇")%></TD>
<TD><TABLE id="Table4" width="100%" align="center" class="tbone"><TR>
<TD vAlign="top" width="40%"><div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 300px; BORDER-BOTTOM-STYLE: ridge"><asp:CheckBoxList id="CheckBoxListUser" runat="server" Width="100%" Height="300"></asp:CheckBoxList>
</div>
</TD>
<TD width="20%" align="center">
<asp:Button id="ButtonInput" runat="server" Text="&gt;&gt;&gt;"></asp:Button>
<BR><BR><asp:Button id="ButtonOutput" runat="server" Text="&lt;&lt;&lt;"></asp:Button>
</TD>
<TD vAlign="top" width="40%">
<font color="red"><%=Utility.Translate.translateString("選擇的用戶列表")%></font>
<BR><asp:ListBox id="ListBoxSelectedUser" runat="server" Width="100%" SelectionMode="Multiple" Rows="23"></asp:ListBox>
</TD>
</TR>
</TABLE>
</TD>
</TR>
<TR>
<TD>&nbsp;</TD>
<TD><asp:button id="Button_AddEdit" runat="server" Text="編輯" visible="false"></asp:button>
</TD>
</TR>
</TBODY>
</TABLE>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B><%=Utility.Translate.translateString("提示")%></B>
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

