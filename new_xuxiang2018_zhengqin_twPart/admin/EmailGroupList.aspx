<%@ Page language="c#" Codebehind="EmailGroupList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.EmailGroupList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=menuname %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx"><%=Utility.Translate.translateString("�Ͳ��޲z")%></a>
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
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="�s��/edit">�s��/edit</asp:LinkButton>
</li>
</ul>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box"><TABLE id="Table_SetOver" width="100%" align="center" class="tbone">
<tr><td bgColor="#E3E3E4"><b><asp:Label runat="server"> �]�w�d�߱���</asp:Label></b>
</td>
</tr>
<tr><td><asp:Label runat="server">
��ܶl��s������</asp:Label><asp:DropDownList ID="drp_emailgrouplist" Runat="server" AutoPostBack="True"></asp:DropDownList>
</td>
</tr>
</TABLE>
</div>
<div class="Textbox"><asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid">
<SelectedItemStyle HorizontalAlign="Left"></SelectedItemStyle>
<EditItemStyle HorizontalAlign="Left"></EditItemStyle>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
<Columns>
<asp:BoundColumn DataField="mailid" HeaderText="�s��ID"></asp:BoundColumn>
<asp:BoundColumn DataField="maildesc" HeaderText="�s�մy�z"></asp:BoundColumn>
<asp:BoundColumn DataField="userid" HeaderText="���u�s��"></asp:BoundColumn>
<asp:BoundColumn DataField="username" HeaderText="���u�W��"></asp:BoundColumn>
</Columns>
<PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
</asp:datagrid>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B><asp:Label runat="server">����</asp:Label></B>
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

