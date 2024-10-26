<%@ Page language="c#" Codebehind="SupplyList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.Supply" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���ӳ]�w</title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx">�Ͳ��޲z</a>
<img src="images/arrow.png" />
<a href="#"><asp:label ID="lab_title" Runat="server" ></asp:label></a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">�n�X</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" 
        ToolTip ="�s�W / add" onclick="lnkbutton_add_Click">�s�W/add</asp:LinkButton>
</li>
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="�s��/edit">�s��/edit</asp:LinkButton>
</li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="�R��/delete" OnClientClick="return   confirm( '�z�T�w�n�R���� '); ">�R��/delete</asp:LinkButton>
</li>
</ul>
</div>
<div class="mod2"><ul>
<li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="�j�M/search" OnClick="lnkbutton_search_Click">�j�M/search</asp:LinkButton>
</li>
<li class="btn9"><asp:LinkButton ID="lnkbutton_print" runat="server" ToolTip="�C�L/printer" OnClick="lnkbutton_print_Click">�C�L/printer</asp:LinkButton>
</li>
</ul>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box">
<asp:label ID="lab_factorytype" Runat="server" Visible="false"></asp:label>
<table width="100%" align="center" class="tbone"><tr>
<td>
<asp:label ID="lab_search" Runat="server"></asp:label>
<asp:TextBox ID="txt_search" Runat="server"></asp:TextBox>
<asp:Button ID="btn_search" Runat="server" Text="�d��" visible="false"></asp:Button>
<asp:button ID="btn_print" Runat="server" Text="���L����" visible="false"></asp:button>
</td>
<td><asp:Label ID="lab_searchold" Runat="server" Visible="False"></asp:Label>
</td>
</tr>
</table>
</div>
<div class="Textbox"><asp:datagrid id="dg_Supply" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<Columns>
<asp:TemplateColumn>
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn>
<%--<HeaderTemplate><asp:Label id="dg_header_supplierId" runat="server"  /></HeaderTemplate>--%>
<ItemTemplate><asp:Label id="dg_lab_supplierId" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.SupplierId&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_supplierId" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.supplierId&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn>
<%--<HeaderTemplate><asp:Label id="dg_header_supplierName" runat="server"  /></HeaderTemplate>--%>
<ItemTemplate><asp:Label id="dg_lab_supplierName" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.SupplierName&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_supplierName" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.supplierName&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="companyTel">
<HeaderTemplate><asp:Label id="dg_header_companyTel" runat="server" text="���q�q��" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_companyTel" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.CompanyTel&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_companyTel" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.companyTel&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="responsibility">
<HeaderTemplate><asp:Label id="dg_header_responsibility" runat="server" text="�t�d�H" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_responsibility" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Responsibility&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_responsibility" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.responsibility&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="conatcted">
<HeaderTemplate><asp:Label id="dg_header_conatcted" runat="server" text="�p���H" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_conatcted" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Conatcted&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_conatcted" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.conatcted&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="grender">
<HeaderTemplate><asp:Label id="dg_header_grender" runat="server" text="�ʧO" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_grender" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Grender&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_grender" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.grender&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="extNo">
<HeaderTemplate><asp:Label id="dg_header_extNo" runat="server" text="�������X" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_extNo" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ExtNo&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_extNo" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.extNo&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="mobile">
<HeaderTemplate><asp:Label id="dg_header_mobile" runat="server" text="���" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_mobile" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Mobile&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_mobile" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.mobile&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="companyFax">
<HeaderTemplate><asp:Label id="dg_header_companyFax" runat="server" text="�ǯu" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_companyFax" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.CompanyFax&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_companyFax" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.companyFax&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="email">
<HeaderTemplate><asp:Label id="dg_header_email" runat="server" text="E-Mail" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_email" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Email&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_email" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.email&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="factoryTel">
<HeaderTemplate><asp:Label id="dg_header_factoryTel" runat="server" text="�u�t�q��" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_factoryTel" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.FactoryTel&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_factoryTel" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.factoryTel&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn visible="false"><ItemTemplate><asp:HyperLink id="HyperLink_Edit" runat="server" Text="�ק�" NavigateUrl="&lt;%# &quot;SupplyView.aspx?id=&quot;+DataBinder.Eval(Container, &quot;DataItem.Id&quot;) %&gt;"></asp:HyperLink>
</ItemTemplate>
</asp:TemplateColumn>
</Columns>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
</asp:datagrid>
</div>
<asp:datagrid id="dg_Contacter" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<Columns>
<asp:TemplateColumn HeaderText="contactName">
<HeaderTemplate><asp:Label id="dg_header_contactName" text="�m�W" runat="server" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_contactName" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactName&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_contactName" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.contactName&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="contactPosition">
<HeaderTemplate><asp:Label id="dg_header_contactPosition" runat="server" text="¾��" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_contactPosition" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactPosition&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_contactPosition" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.contactPosition&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="contactMobileCell">
<HeaderTemplate><asp:Label id="dg_header_contactMobileCell" runat="server" text="���" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_contactMobileCell" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactMobileCell&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_contactMobileCell" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.contactMobileCell&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="contactFax">
<HeaderTemplate><asp:Label id="dg_header_contactFax" runat="server" text="�ǯu" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_contactFax" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactFax&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_contactFax" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.contactFax&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="contactTel">
<HeaderTemplate><asp:Label id="dg_header_contactTel" runat="server" text="�q��" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_contactTel" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactTel&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_contactTel" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.contactTel&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="contactEmail">
<HeaderTemplate><asp:Label id="dg_header_contactEmail" runat="server" text="Email" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_contactEmail" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactEmail&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_contactEmail" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.contactEmail&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="contactComment">
<HeaderTemplate><asp:Label id="dg_header_contactComment" runat="server" text="�Ƶ�" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="dg_lab_contactComment" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactComment&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_contactComment" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.contactComment&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
</Columns>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
</asp:datagrid>
<asp:datagrid id="Datagrid1" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<Columns>
<asp:TemplateColumn HeaderText="supplierId">
<HeaderTemplate><asp:Label id="Label1" runat="server" text="�����ӽs��" />
</HeaderTemplate>
<ItemTemplate><asp:Label id="Label2" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.SupplierId&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="supplierName">
<HeaderTemplate><asp:Label id="Label3" runat="server" text="�����ӦW��" />
</HeaderTemplate>
<ItemTemplate><asp:Label id="Label4" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.SupplierName&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="companyTel">
<HeaderTemplate><asp:Label id="Label5" runat="server" text="���q�q��" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label6" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.CompanyTel&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="responsibility">
<HeaderTemplate><asp:Label id="Label7" runat="server" text="�t�d�H" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label8" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Responsibility&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="conatcted">
<HeaderTemplate><asp:Label id="Label9" runat="server" text="�p���H" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label10" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Conatcted&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="grender">
<HeaderTemplate><asp:Label id="Label11" runat="server" text="�ʧO" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label12" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Grender&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="extNo">
<HeaderTemplate><asp:Label id="Label13" runat="server" text="�������X" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label14" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ExtNo&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="mobile">
<HeaderTemplate><asp:Label id="Label15" runat="server" text="���" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label16" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Mobile&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="companyFax">
<HeaderTemplate><asp:Label id="Label17" runat="server" text="�ǯu" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label18" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.CompanyFax&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="email">
<HeaderTemplate><asp:Label id="Label19" runat="server" text="E-Mail" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label20" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Email&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="factoryTel">
<HeaderTemplate><asp:Label id="Label21" runat="server" text="�u�t�q��" />
</HeaderTemplate>
<ItemTemplate>
&nbsp;<asp:Label id="Label22" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.FactoryTel&quot;)%&gt;"/>
</ItemTemplate>
</asp:TemplateColumn>
</Columns>
</asp:datagrid>
<div class="box"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="30" height="28" style="WIDTH: 30px"><DIV align="center"><B><DIV align="center"><B>����</B>
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

