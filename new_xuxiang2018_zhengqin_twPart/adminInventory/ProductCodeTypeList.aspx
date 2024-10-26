<%@ Page language="c#" Codebehind="ProductCodeTypeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.adminInventory.ProductCodeTypeList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>原物料類型</title>
<link href="../css/amd.css" rel="stylesheet" type="text/css" />
<link href="../css/showDiv.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/sexybuttons.css" type="text/css" />
<script language="Javascript" src="../js/lib.js"></script>
<script language="Javascript" src="../js/showDiv.js"></script>
<script language="Javascript" src="../js/jquery.js"></script>
<meta content=JavaScript name=vs_defaultClientScript>
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx">生產管理</a>
<img src="../images/arrow.png" />
<a href="#">原物料類型設定</a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a>
</div>
<div id='pop-div' style="width: 1000;display:none; border:solid 1px #6e8bde;margin:0 auto;" class="pop-box">  
    <div class="pop-box-h4">原物料類型設定</div>  
    <div class="pop-box-body" >



 <table class=tbone>
                    <tr>
                      <td>類型名</td>
                      <td><asp:textbox id="txt_name" runat="server"></asp:textbox>
                      <asp:label id="lab_id" Runat="server" Visible="False"></asp:label>
                       <asp:label id="lab_parentid" Runat="server" Visible="False"></asp:label>
                    </td>
                      <td vAlign="top">類型編碼</td>
                      <td><asp:textbox id="txt_abbr" runat="server"></asp:textbox></td>
                      <td>父類型</td>
                      <td><asp:dropdownlist id="ddl_parentcodetype" runat="server"></asp:dropdownlist><asp:label id="lab_parentmentid" Runat="server" Visible="False"></asp:label></td>
                   
                      </tr>
                    </table>
      <asp:label id="lab_edit_mode" Runat="server" Visible="False">ADD</asp:label>

 </div>  
    <div class='buttonPanel' style="text-align: right" mce_style="text-align: right">  
        <span><span><span class="ok"><asp:button id="btn_save" runat="server" Text="保存"></asp:button></span></span></span>
    </div>  
    </div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><a href="ProductCodeTypeView.aspx" title="新增">新增/add</a>
</li>
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
</li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎 '); ">刪除/delete</asp:LinkButton>
</li>
</ul>
</div>

<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box"> 
<table width="100%" align=center class=tbone>
 <tr>
 <td vAlign="top" borderColorLight="#ccccff" borderColorDark="#cccccc" width="40%"  >
 <asp:panel id="pan_treeview" runat="server">
 <asp:TreeView ID="treeview" runat="server" OnSelectedNodeChanged="treeview_SelectedNodeChanged" ></asp:TreeView>
 </asp:panel>
 </td>
 <td align="left" valign="top">
 <asp:datagrid id="dg_productCode" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid" Width="80%"  AllowPaging="True" onitemdatabound="dg_productCode_ItemDataBound" OnPageIndexChanged="dg_productCode_PageIndexChanged">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<Columns>
<asp:TemplateColumn>
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>
</asp:TemplateColumn>
<asp:BoundColumn DataField="Id" ReadOnly="True" HeaderText="編號" Visible="false"></asp:BoundColumn>
<asp:TemplateColumn HeaderText="類型名稱">
<ItemTemplate><asp:Label id="Label1" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Name&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="類型編碼">
<ItemTemplate><asp:Label id="Label3" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Abbr&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="" Visible="false">
<ItemTemplate><asp:Label id="dg_lab_IsReadOnly" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.IsReadOnly&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
</Columns>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
</asp:datagrid>
 </td>
 </tr>
 </table>
</div>
<div class="Textbox">
<TABLE id="Table3" width="100%" align="center" class="tbMessage" border="1"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label>
</TD>
</TR>
</TABLE>
</div>
</div>
</div>
</div>
</form>
</body>
</html>

