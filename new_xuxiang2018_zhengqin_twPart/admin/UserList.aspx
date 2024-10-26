<%@ Page language="c#" Codebehind="UserList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=menuname %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx"><%=Utility.Translate.translateString("生產管理")%></a>
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
<li class="btn1"><a href="UserView.aspx" runat="server" title="新增/ add">新增/add</a>
</li>
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
</li>
<li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
</li>
</ul>
</div>

<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box"><table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1"><tr>
<td>
<%=Utility.Translate.translateString("部門")%>
<asp:DropDownList ID="dpl_department" runat="server" AutoPostBack="True"></asp:DropDownList>
</td>
<td>
    <%=Utility.Translate.translateString("輸入關鍵字查詢")%>
<asp:textbox id="TextBox_key" Runat="server" Width="300px"></asp:textbox>
    <%=Utility.Translate.translateString("已離職")%>
<asp:CheckBox runat="server" ID="chk_resignation" />
&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="查詢" visible="false"></asp:button>
<asp:label id="lab_remerber" Runat="server" Visible="False"></asp:label>
</td>
</tr>
</table>
</div>
<div class="Textbox"><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid">
<SelectedItemStyle HorizontalAlign="Left"></SelectedItemStyle>
<EditItemStyle HorizontalAlign="Left"></EditItemStyle>
<AlternatingItemStyle HorizontalAlign="Left"  BackColor="#F8F7FF"></AlternatingItemStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<Columns>
<asp:TemplateColumn>
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>
</asp:TemplateColumn>
<asp:BoundColumn DataField="UserName" HeaderText="員工編號"></asp:BoundColumn>
<asp:BoundColumn DataField="CardID" HeaderText="員工卡號"></asp:BoundColumn>
<asp:BoundColumn DataField="Name" HeaderText="員工姓名"></asp:BoundColumn>
<asp:BoundColumn DataField="Email" HeaderText="電子郵件"></asp:BoundColumn>
<asp:BoundColumn DataField="Comment" HeaderText="備註"></asp:BoundColumn>
<asp:TemplateColumn HeaderText="功能" visible="false"><ItemTemplate><asp:HyperLink id="HyperLink_Edit" runat="server" Text="編輯" NavigateUrl="&lt;%# &quot;UserEdit.aspx?username=&quot;+DataBinder.Eval(Container, &quot;DataItem.username&quot;) %&gt;"></asp:HyperLink>
</ItemTemplate>
</asp:TemplateColumn>
<asp:ButtonColumn Text="刪除" CommandName="Delete" Visible="false"></asp:ButtonColumn>
</Columns>
<PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
</asp:datagrid>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B><asp:Label ID="Label2" runat="server">提示</asp:Label></B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label>
<asp:Label id="Label1" runat="server" Visible="False"></asp:Label>
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

