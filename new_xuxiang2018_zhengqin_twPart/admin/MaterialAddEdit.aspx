<%@ Page language="c#" Codebehind="MaterialAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MaterialAddEdit" %>

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
<li class="btn1"><a href="MaterialAddEdit.aspx" title="新增/add" runat="server">新增/add</a>
</li>
<li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
</li>
<li class="btn5"><a href="MaterialList.aspx" title="檢視/view" runat="server">檢視/view</a>
</li>
</ul>
</div>
<div class="mod2"></div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="space1"></div>
<div class="Textbox"><table width="100%" align="center" class="tbone"><TBODY>
<tr><td colSpan="2">
<B><asp:Label ID="Label1" runat="server">請填入以下信息</asp:Label></B>
<asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label>
<asp:label id="Label_HiddenId" runat="server" Visible="False" ForeColor="Red"></asp:label>
</td>
</tr>
<TR>
<TD><asp:Label runat="server">材質名稱</asp:Label></TD>
<TD>
<asp:TextBox Runat="server" ID="Textbox_Name" name="Textbox_Name" />
<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="" ControlToValidate="Textbox_Name"></asp:RequiredFieldValidator>
</TD>
</TR>
<TR>
<TD><asp:Label runat="server">材質縮寫</asp:Label></TD>
<TD>
<asp:TextBox Runat="server" ID="txt_abbr" />
</TD>
</TR>
<TR>
<TD><asp:Label runat="server">材質類型</asp:Label></TD>
<TD>
    <asp:DropDownList ID="DropDownList_TypeId" runat="server">
    </asp:DropDownList>
</TD>
</TR>
<TR>
<TD><asp:Label runat="server">價格</asp:Label></TD>
<TD>
<asp:TextBox Runat="server" ID="txt_price" name="Textbox_Name" />
<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="txt_price" ErrorMessage="請輸入數字" ValidationExpression="^\d+(\.\d+)?$"></asp:RegularExpressionValidator>
</TD>
</TR>
<TR>
<TD><asp:Label runat="server">密度</asp:Label></TD>
<TD>
<asp:TextBox Runat="server" ID="txt_density" name="Textbox_Name" />
<asp:RegularExpressionValidator id="Regularexpressionvalidator2" runat="server" ControlToValidate="txt_density" ErrorMessage="請輸入數字" ValidationExpression="^\d+(\.\d+)?$"></asp:RegularExpressionValidator>
</TD>
</TR>


</TBODY>
</table>
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

