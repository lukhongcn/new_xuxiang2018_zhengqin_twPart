<%@ Page language="c#" Codebehind="ProductCodeTypeView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Inventory.ProductCodeTypeView" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>標準件類型設定</title>
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
<a href="#">標準件類型</a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a>
</div>
<div id='pop-div' style="width: 1000;display:none; border:solid 1px #6e8bde;margin:0 auto;" class="pop-box">  
    <div class="pop-box-h4">標準件類型設定</div>  
    <div class="pop-box-body" >



 <table class=tbone>
                   
                    </table>
      <asp:label id="lab_edit_mode" Runat="server" Visible="False">ADD</asp:label>

 </div>  
    <div class='buttonPanel' style="text-align: right" mce_style="text-align: right">  
        
    </div>  
    </div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>

<li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
</li>

<li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" 
        ToolTip="檢視 / view" onclick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
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
 <asp:TreeView ID="treeview" runat="server" 
         OnSelectedNodeChanged="treeview_SelectedNodeChanged" ></asp:TreeView>
 </asp:panel>
 </td>
 <asp:Label ID="lab_func" runat="server" Visible="false"></asp:Label>
 <asp:Label ID="lab_Id" runat="server"  Visible="false"></asp:Label>
 
                      <%--<td vAlign="top">類型名</td>--%>
                      <td vAlign="top">類型名<asp:textbox id="txt_name" runat="server"></asp:textbox>
                      
                       <asp:label id="lab_parentid" Runat="server" Visible="False"></asp:label>
                    </td>
                      <%--<td vAlign="top">類型編碼</td>--%>
                      <td vAlign="top">類型編碼<asp:textbox id="txt_abbr" runat="server"></asp:textbox></td>
                      
                      <%--<td vAlign="top">父類型</td>--%>
                      <td vAlign="top">父類型<asp:dropdownlist id="ddl_parentcodetype" runat="server"></asp:dropdownlist><asp:label id="Label3" Runat="server" Visible="False"></asp:label></td>
                     
                  

 <%--<td vAlign="top" borderColorLight="#ccccff" borderColorDark="#cccccc" width="40%">
 <asp:panel id=pan_treeview runat="server"></asp:panel>--%>
 </td>
 <td align="left" valign="top">
 
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

