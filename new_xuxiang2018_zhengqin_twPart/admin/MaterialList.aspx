<%@ Page language="c#" Codebehind="MaterialList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MaterialList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=menuname %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        var deleteConfirm = '<%=Utility.Translate.translateString("您確定要刪除嗎")%>';
    </script>

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
<li class="btn1"><a href="MaterialAddEdit.aspx" runat="server" title="新增/add">新增/add</a>
</li>
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
</li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm(deleteConfirm); ">刪除/delete</asp:LinkButton>
</li>
</ul>
</div>
<div class="mod2"><ul>
<li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
</li>
</ul>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box">
<table width="100%" align="center" class="tbone">
				<tr>
					<td><asp:Label ID="lab_materialname" Runat="server" Text="材質名稱"></asp:Label><asp:TextBox ID="txt_materialname" Runat="server"></asp:TextBox><asp:label ID="lab_namesearch" Runat=server Visible=False></asp:Label></td>
				</tr>
			</table>
</div>
<div class="Textbox"><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid">
<SelectedItemStyle HorizontalAlign="Left"></SelectedItemStyle>
<EditItemStyle HorizontalAlign="Left"></EditItemStyle>
<AlternatingItemStyle HorizontalAlign="Left"></AlternatingItemStyle>
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
<Columns>
<asp:TemplateColumn ItemStyle-Width="10px">
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>
</asp:TemplateColumn>
<asp:BoundColumn Visible="False" DataField="id" HeaderText="ID"></asp:BoundColumn>
<asp:BoundColumn DataField="name" HeaderText="材質名稱"></asp:BoundColumn>
<asp:BoundColumn DataField="MaterialAbbr" HeaderText="材質縮寫"></asp:BoundColumn>
<asp:BoundColumn DataField="typeid" HeaderText="材質類型" Visible="False"></asp:BoundColumn>

<asp:BoundColumn DataField="Price" HeaderText="價格"></asp:BoundColumn>
<asp:BoundColumn DataField="Density" HeaderText="密度"></asp:BoundColumn>
</Columns>
<PagerStyle Mode="NumericPages" CssClass="tbPager"></PagerStyle>
</asp:datagrid>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B><asp:Label ID="Label2" runat="server">提示</asp:Label></B>
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

