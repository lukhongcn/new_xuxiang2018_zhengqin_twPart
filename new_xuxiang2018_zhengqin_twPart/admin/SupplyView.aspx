<%@ Page language="c#" Codebehind="SupplyView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.supplyview" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>應商設定</title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="#">生產管理</a>
<img src="images/arrow.png" />
<a href="#"><asp:label ID="lab_title" Runat="server" ></asp:label></a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><a href="#" title="新增 / add">新增/add</a>
</li>
<li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
</li>
<li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" ToolTip="檢視 / view" OnClick="lnkbutton_view_Click">檢視/view</asp:LinkButton>

</li>
</ul>
</div>
<div class="mod2"></div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="space1"></div>
<div class="Textbox">
<asp:Label ID="func" runat="server" Visible="false" />
<asp:label id="lab_parentid" Runat="server" Visible="False"></asp:label>
<table width="100%" align="center" class="tbmain"><TBODY>
<tr>

<td>
<asp:label id="lab_supplierId" runat="server" Text="廠商編號"></asp:label>
<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
<asp:label ID="lab_factorytype" Runat="server" Visible="false"></asp:label>
</td>
<td><asp:textbox id="txt_supplierId" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_supplierName" runat="server" Text="廠商名稱"></asp:label>
</td>
<td><asp:textbox id="txt_supplierName" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_invoiceTitle" runat="server" Text="發票標題"></asp:label>
</td>
<td><asp:textbox id="txt_invoiceTitle" runat="server"></asp:textbox>
</td>

<td align="left" valign="top">
 
 </td>
</tr>
<tr>
<td><asp:label id="lab_unityNo" runat="server" Text="統一編號"></asp:label>
</td>
<td><asp:textbox id="txt_unityNo" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_factoryRegisterNo" runat="server" Text="工廠登記號"></asp:label>
</td>
<td><asp:textbox id="txt_factoryRegisterNo" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_salesRegisterNo" runat="server" Text="營業登記號"></asp:label>
</td>
<td><asp:textbox id="txt_salesRegisterNo" runat="server"></asp:textbox>
</td>
</tr>
<tr>
<td><asp:label id="lab_companyTel" runat="server" Text="電話"></asp:label>
</td>
<td><asp:textbox id="txt_companyTel" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_englistFullName" runat="server" Text="英文全名"></asp:label>
</td>
<td><asp:textbox id="txt_englistFullName" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_foundType" runat="server" Text="資本類別"></asp:label>
</td>
<td><asp:textbox id="txt_foundType" runat="server"></asp:textbox>
</td>
</tr>
<tr>
<td><asp:label id="lab_responsibility" runat="server" Text="負責人"></asp:label>
</td>
<td><asp:dropdownlist id="dpl_responsibility" runat="server"></asp:dropdownlist>
</td>
<td><asp:label id="lab_conatcted" runat="server" Text="聯絡人"></asp:label>
</td>
<td><asp:textbox id="txt_conatcted" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_grender" runat="server" Text="性別"></asp:label>
</td>
<td><asp:dropdownlist id="dpl_grender" runat="server">
<asp:ListItem Value="先生">先生</asp:ListItem>
<asp:ListItem Value="小姐">小姐</asp:ListItem>
</asp:dropdownlist>
</td>
</tr>
<tr>
<td><asp:label id="lab_extNo" runat="server" Text="分機號"></asp:label>
</td>
<td><asp:textbox id="txt_extNo" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_mobile" runat="server" Text="手機號"></asp:label>
</td>
<td><asp:textbox id="txt_mobile" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_companyFax" runat="server" Text="傳真"></asp:label>
</td>
<td><asp:textbox id="txt_companyFax" runat="server"></asp:textbox>
</td>
</tr>
<tr>
<td><asp:label id="lab_email" runat="server" Text="E-Mail"></asp:label>
</td>
<td><asp:textbox id="txt_email" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_companyAddress" runat="server" Text="地址"></asp:label>
</td>
<td><asp:textbox id="txt_companyAddress" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_zip" runat="server" Text="郵政編碼"></asp:label>
</td>
<td><asp:textbox id="txt_zip" runat="server"></asp:textbox>
</td>
</tr>

<tr>
<td><asp:label id="Label1" runat="server" Text="長度增量"></asp:label>
</td>
<td><asp:textbox id="txt_ExtraLength" runat="server"></asp:textbox>
</td>

<td><asp:label id="Label2" runat="server" Text="寬度增量"></asp:label>
</td>
<td><asp:textbox id="txt_ExtraWeight" runat="server"></asp:textbox>
</td>

<td><asp:label id="Label3" runat="server" Text="高度增量"></asp:label>
</td>
<td><asp:textbox id="txt_ExtraHeight" runat="server"></asp:textbox>
</td>
</tr>


<tr>
<td><asp:label id="lab_factoryAddress" runat="server" Text="工廠地址"></asp:label>
</td>
<td><asp:textbox id="txt_factoryAddress" runat="server"></asp:textbox>
</td>
<td><asp:label id="lab_factoryTel" runat="server" Text="工廠電話"></asp:label>
</td>
<td><asp:textbox id="txt_factoryTel" runat="server"></asp:textbox>
</td>



<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label>
</td>
<td><asp:textbox id="txt_comment" runat="server"></asp:textbox>
</td>
</tr>


</TBODY>
</table>
<asp:Label ID="lab_productCodeTypeRela_Id" runat="server" Visible="false"></asp:Label>
 <asp:Table ID="tb_productCodeType" runat="server" BorderWidth="1">
 <asp:TableRow>
 
 <asp:TableCell><asp:Label runat="server" Text="物料類型"></asp:Label></asp:TableCell>
 <asp:TableCell><asp:DropDownList ID="dpl_productCodeType" runat="server"></asp:DropDownList></asp:TableCell>
 <asp:TableCell><asp:Button ID="btn_productCodeRela_submit" runat="server" Text="保存" OnClick="btn_productCodeRela_submit_Click"></asp:Button></asp:TableCell>
</asp:TableRow>
<asp:TableRow>


<asp:TableCell VerticalAlign="Top">
 <%--<td vAlign="top" borderColorLight="#ccccff" borderColorDark="#cccccc" width="40%"  >--%>
 <asp:panel id="pan_treeview" runat="server">
 <asp:TreeView ID="treeview" runat="server" OnSelectedNodeChanged="treeview_SelectedNodeChanged" ></asp:TreeView>
 </asp:panel>

 </asp:TableCell>


 <asp:TableCell ColumnSpan="3" VerticalAlign="Top">




 <asp:DataGrid ID="dg_productCodeRela" runat="server"  AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid" OnItemCommand="dg_productCodeRela_ItemCommand">
 <SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<Columns>

<asp:TemplateColumn HeaderText="Id" Visible ="false">
<HeaderTemplate><asp:Label id="dg_header_Id" runat="server"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_Id" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Id&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>



<asp:TemplateColumn HeaderText="ProductCodeTypeId" Visible ="false">
<HeaderTemplate><asp:Label id="dg_header_ProductCodeTypeId" runat="server"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_ProductCodeTypeId" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ProductCodeTypeId&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>


<asp:BoundColumn DataField="ProductCodeTypeName" HeaderText="類型名稱"></asp:BoundColumn>
<%--<asp:ButtonColumn Text="修改" ButtonType="PushButton" CommandName="Modify" HeaderText="功能"></asp:ButtonColumn>--%>
<asp:ButtonColumn Text="刪除"  ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
</Columns>
</asp:DataGrid>
 </asp:TableCell>
</asp:TableRow>
</asp:Table>
</div>
   
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
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

