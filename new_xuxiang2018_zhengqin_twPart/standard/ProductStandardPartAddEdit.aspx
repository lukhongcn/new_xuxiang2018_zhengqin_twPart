<%@ Page language="c#" Codebehind="ProductStandardPartAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProductStandardPartAddEdit" smartNavigation="True" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title> </title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="#">�Ͳ��޲z</a>
<img src="images/arrow.png" />
<a href="#">���~���O�u���]�w</a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">�n�X</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><asp:LinkButton ID="LinkButton1" runat="server" ToolTip="�s�W/add" OnClick="lnkbutton_add_Click">�s�W/add</asp:LinkButton>
</li>
<li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="�x�s/save" OnClick="lnkbutton_save_Click">�x�s/save</asp:LinkButton>
</li>
<li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" ToolTip="�˵�/view" OnClick="lnkbutton_view_Click">�˵�/view</asp:LinkButton>
</li>
</ul>
</div>
<div class="mod2"></div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="space1"></div>
<div class="Textbox"><TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0"><TBODY>
<TR><TD vAlign="top" width="79%">

</div>
<asp:label id="Label_HiddenFuncMode" runat="server" Visible="False"></asp:label>
<asp:label id="Label_HiddenSelectRow" runat="server" Visible="False"></asp:label>
<BR><TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1"><TBODY>
<TR>
<TD width="10%">���~���O�u���]�w</TD>
<TD width="40%">
<asp:dropdownlist id="dpl_parentStandardType" runat="server" AutoPostBack="True" 
        onselectedindexchanged="dpl_parentStandardType_SelectedIndexChanged"/>
<asp:dropdownlist id="dpl_standardtype" runat="server"/>&nbsp;&nbsp;&nbsp;
<asp:Label ID="lab_partno" runat = "server" Text = "�s��:" />
<asp:TextBox ID= "txt_partno" runat ="server" />

</TD>
<TD width="10%">�s��W</TD>
<TD width="40%">
<asp:textbox id="txt_name" runat="server" Width="60"></asp:textbox>&nbsp;&nbsp;&nbsp;
<asp:Label ID="lab_partcount" runat = "server" Text = "�ƶq:"/>
<asp:TextBox ID="txt_partcount" runat="server"  Width="60" />
</TD>
</TR>
<TR>
<TD>�u�ǳ]�w</TD>
<TD colSpan="3"><table id="tableSetting" width="100%" align="center" class="tbone" border="1"><tr>
<td vAlign="top">
<font color="red">��ܩһݤu��</font>
<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 250px; BORDER-BOTTOM-STYLE: ridge"><asp:checkboxlist id="CheckBoxList_Process" runat="server" AutoPostBack="True"></asp:checkboxlist>
</div>
</td>
<td vAlign="top"><asp:datagrid id="MainDataGrid" runat="server" 
        AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" 
        CssClass="Grid" onitemcreated="MainDataGrid_ItemCreated" >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<Columns>
<asp:ButtonColumn Text="���" ButtonType="PushButton" CommandName="Select"></asp:ButtonColumn>
<asp:TemplateColumn HeaderText="�[�u����"><ItemTemplate><asp:Label runat="server" ID="Label_OrderNo" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ListOrder&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="False" HeaderText="�u�ǽs��"><ItemTemplate><asp:Label runat="server" ID="Label_ProcessID" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessID&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="�u�ǦW��"><ItemTemplate><asp:Label runat="server" ID="Label_CustomerProcessName" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.CustomerProcessName&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn  Visible="False" HeaderText="��(�p��{)"><ItemTemplate><asp:TextBox Runat="server" ID="dg_txt_day" Width="40"  Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ScheduleDay&quot;) %&gt;"></asp:TextBox>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="�p��"><ItemTemplate><asp:TextBox Runat="server" ID="dg_txt_hour" Width="40"></asp:TextBox>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="����" Visible="False"><ItemTemplate><asp:TextBox Runat="server" ID="dg_txt_minute" Width="40"></asp:TextBox>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="needminutes" Visible="false"><ItemTemplate><asp:Label runat="server" ID="lab_ProcessNeedMinutes" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessNeedMinutes&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="id" Visible="false"><ItemTemplate><asp:Label runat="server" ID="lab_id" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Id&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:ButtonColumn Text="�W��" ButtonType="PushButton" HeaderText="�\��" CommandName="Upper"></asp:ButtonColumn>
<asp:ButtonColumn Text="�U��" ButtonType="PushButton" CommandName="Lower"></asp:ButtonColumn>
<asp:ButtonColumn Text="�R��" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
<asp:TemplateColumn Visible="False" HeaderText="�u������"><ItemTemplate><asp:Label runat="server" ID="dg_lab_pricetype" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.pricetype&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="true" HeaderText="�w�q�u�ǽs��"><ItemTemplate><asp:Label runat="server" ID="Label_CustomerProcessID" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.CustomerProcessID&quot;) %&gt;"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>
</Columns>
</asp:datagrid>
</td>
</tr>
</table>
</TD>
</TR>
</TBODY>
</TABLE>

</div>
<div class="box"><TABLE id="Table3" width="100%" align="center" class="tbMessage" border="1"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>����</B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label>
<asp:label id="lab_zuli" runat="server" Visible="false"></asp:label>
</TD>
</TR>
</TABLE>
</div>
</div>
</div>
</form>
</body>
</html>

