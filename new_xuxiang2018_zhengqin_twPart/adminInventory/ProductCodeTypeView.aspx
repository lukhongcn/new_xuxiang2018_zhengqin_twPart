<%@ Page language="c#" Codebehind="ProductCodeTypeView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Inventory.ProductCodeTypeView" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>�зǥ������]�w</title>
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
<a href="../defaultmain.aspx">�Ͳ��޲z</a>
<img src="../images/arrow.png" />
<a href="#">�зǥ�����</a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">�n�X</a>
</div>
<div id='pop-div' style="width: 1000;display:none; border:solid 1px #6e8bde;margin:0 auto;" class="pop-box">  
    <div class="pop-box-h4">�зǥ������]�w</div>  
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

<li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="�x�s/save" OnClick="lnkbutton_save_Click">�x�s/save</asp:LinkButton>
</li>

<li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" 
        ToolTip="�˵� / view" onclick="lnkbutton_view_Click">�˵�/view</asp:LinkButton>
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
 
                      <%--<td vAlign="top">�����W</td>--%>
                      <td vAlign="top">�����W<asp:textbox id="txt_name" runat="server"></asp:textbox>
                      
                       <asp:label id="lab_parentid" Runat="server" Visible="False"></asp:label>
                    </td>
                      <%--<td vAlign="top">�����s�X</td>--%>
                      <td vAlign="top">�����s�X<asp:textbox id="txt_abbr" runat="server"></asp:textbox></td>
                      
                      <%--<td vAlign="top">������</td>--%>
                      <td vAlign="top">������<asp:dropdownlist id="ddl_parentcodetype" runat="server"></asp:dropdownlist><asp:label id="Label3" Runat="server" Visible="False"></asp:label></td>
                     
                  

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
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>����</B>
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

