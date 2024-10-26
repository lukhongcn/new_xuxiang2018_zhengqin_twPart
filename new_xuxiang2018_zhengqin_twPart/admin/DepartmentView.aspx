<%@ Page language="c#" Codebehind="DepartMentView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.DepartMentView" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=menuname %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
<link href="css/showDiv.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../css/sexybuttons.css" type="text/css" />
<script language="Javascript" src="../js/lib.js"></script>
<script language="Javascript" src="../js/showDiv.js"></script>
<script language="Javascript" src="../js/jquery.js"></script>
<meta content=JavaScript name=vs_defaultClientScript>
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
<div id='pop-div' style="width: 1000;display:none; border:solid 1px #6e8bde;margin:0 auto;" class="pop-box">  
    <div class="pop-box-h4"><%=Utility.Translate.translateString("部門設定")%></div>  
    <div class="pop-box-body" >



 <table class=tbone>
                    <tr>
                      <TD><asp:Label runat="server">部門名</asp:Label> </TD>
                      <TD><asp:textbox id=txt_department runat="server"></asp:textbox><asp:label id=lab_departmentid Runat="server" Visible="False"></asp:label><asp:customvalidator id=cv_department runat="server" ControlToValidate="txt_department" ErrorMessage="cv_department"></asp:customvalidator></TD>
                      <td vAlign=top><asp:Label runat="server">部門編碼</asp:Label></td>
                      <TD><asp:textbox id=txt_abbr runat="server"></asp:textbox></TD>
                      <TD><asp:Label runat="server">主管部門</asp:Label></TD>
                      <td><asp:dropdownlist id=ddl_parentdepartment runat="server"></asp:dropdownlist><asp:label id=lab_parentmentid Runat="server" Visible="False"></asp:label></td>
                   
                      </TR>
                    </table>
      <asp:label id=lab_edit_mode Runat="server" Visible="False">ADD</asp:label>

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
<li class="btn1"><a href="#" title="新增/ add" runat="server" onclick="popupDiv('pop-div')">新增/add</a>
</li>
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
</li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm(deleteConfirm); ">刪除/delete</asp:LinkButton>
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
 <td vAlign=top borderColorLight=#ccccff borderColorDark=#cccccc width="40%"  >
 <asp:panel id=pan_treeview runat="server"></asp:panel>
 </td>
 <td align="left">
 <asp:datagrid id="dgdpartment" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid" Width="80%">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<Columns>
<asp:TemplateColumn>
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>
</asp:TemplateColumn>
<asp:BoundColumn DataField="DepartMentId" ReadOnly="True" HeaderText="編號" Visible="false"></asp:BoundColumn>
<asp:TemplateColumn HeaderText="部門名">
<ItemTemplate><asp:Label id="Label1" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.DepartmentName&quot;) %&gt;"></asp:Label>
</ItemTemplate>
<EditItemTemplate><asp:TextBox id="dg_txt_name" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.DepartmentName&quot;) %&gt;"></asp:TextBox>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="部門編碼">
<ItemTemplate><asp:Label id="Label3" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.DepartAbbr&quot;) %&gt;"></asp:Label>
</ItemTemplate>
<EditItemTemplate><asp:TextBox id="dg_txt_abbr" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.DepartAbbr&quot;) %&gt;"/>
</EditItemTemplate>
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
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B><asp:label runat="server"> 提示</asp:label></B>
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

