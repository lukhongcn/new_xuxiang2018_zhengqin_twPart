<%@ Register TagPrefix="c1webgrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ModulePrice.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModulePrice" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>模具成本</title>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema><LINK href="css/common.css" rel=stylesheet >
  </HEAD>
<body topMargin=0>
<form id=Form1 method=post runat="server">
<TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD colSpan=3><uc1:header id=Header runat="server"></uc1:header></TD></TR>
  <tr>
    <TD vAlign=top align=left width="20%"><uc1:leftmenu id=LeftMenu runat="server"></uc1:leftmenu></TD>
    <TD width="1%">&nbsp;</TD>
    <TD vAlign=top width="79%">
      <table cellSpacing=2 width="100%" border=0>
        <tr>
          <td>
            <div align=left>模具成本</div></td></tr></table>
      <hr>

      <TABLE id=Table1 borderColor=#ccccff cellSpacing=1 borderColorDark=#cccccc 
      cellPadding=0 width="100%" align=center borderColorLight=#ccccff border=1 
       runat="server">
        <tr>
          <td vAlign=top>
            <table width="100%" align=center border=0>
              <TBODY>
              <tr>
                <td style="HEIGHT: 22px"><asp:label id=lab_customer runat="server">客戶</asp:label><asp:dropdownlist id=dpl_customer runat="server" AutoPostBack="True"></asp:dropdownlist><asp:label id=lab_moduleid runat="server"></asp:label><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id=dpl_moduleid runat="server" AutoPostBack="True"></asp:dropdownlist><asp:textbox id=txt_moduleid runat="server"></asp:textbox><asp:button id=btn_search runat="server" Text="查詢"></asp:button><asp:label id=lab_search Runat="server" Visible="False"></asp:label></td></td></tr>
              <tr>
                <td colSpan=2><c1webgrid:c1webgrid id=dg_detail runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False" PageSize="10000" DefaultRowHeight="22px" DefaultColumnWidth="120px">
<AlternatingItemStyle HorizontalAlign="Center">
</AlternatingItemStyle>

<ItemStyle HorizontalAlign="Center">
</ItemStyle>

<Columns>
<c1webgrid:C1TemplateColumn>
<HeaderTemplate>
															 <asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
																
														
</HeaderTemplate>

<ItemTemplate>
																	<asp:Label id="dg_lab_moduleid" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>' />
																
														
</ItemTemplate>
</c1webgrid:C1TemplateColumn>
<c1webgrid:C1TemplateColumn HeaderText="productId">
<HeaderTemplate>
																	<asp:Label id="dg_header_productId" runat="server" text='模具名稱'></asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	<asp:Label id="dg_lab_productId" runat="server" Text='' />
																
</ItemTemplate>
</c1webgrid:C1TemplateColumn>
<c1webgrid:C1BoundColumn HeaderText="零件編號" DataField="PartNo"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="零件名稱" DataField="PartName"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="數量" DataField="PartCount"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="材質" DataField="Material"></c1webgrid:C1BoundColumn>
<c1webgrid:C1TemplateColumn HeaderText="productId">
<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server" text='單價'></asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	<asp:Label id="dg_lab_price" runat="server" Text='' />
																
</ItemTemplate>
</c1webgrid:C1TemplateColumn>
<c1webgrid:C1BoundColumn HeaderText="尺寸規格" DataField="Sizespec"></c1webgrid:C1BoundColumn>

<c1webgrid:C1BoundColumn HeaderText="工序" DataField="ProcessName"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="加工費" DataField="MachinePrice"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="外包費" DataField="OutSourcePrice"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="材料費" DataField="MaterialPrice"></c1webgrid:C1BoundColumn>

<c1webgrid:C1BoundColumn HeaderText="模具變更費" DataField="projectPrice" visible="false"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="報廢費" DataField="DisCardPrice" visible="false"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="零件小計" DataField="ModuleIdPartNoPrice" ></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="總計費用" DataField="TotalPrice" ></c1webgrid:C1BoundColumn>
</Columns>

<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD">
</HeaderStyle>

<SelectedItemStyle HorizontalAlign="Center">
</SelectedItemStyle>

<EditItemStyle HorizontalAlign="Center">
</EditItemStyle>
</c1webgrid:c1webgrid><asp:label id=Label1 runat="server">模具統計總費用:</asp:label><asp:label id=lab_price runat="server"></asp:label><asp:label id=lab_ttp runat="server" Visible="False"></asp:label></td></tr></TABLE><asp:button id=btn_print runat="server" Text="生成報表"></asp:button><asp:label id=lab_print1 runat="server"></asp:label></TD></tr></TBODY></TABLE><br 
      ><br>
      <table borderColor=#000660 borderColorDark=#000066 width="100%" 
      align=center borderColorLight=#000066 border=1>
        <TR vAlign=middle>
          <TD width="15%" height=28>
            <DIV align=center><B>
            <DIV align=center><B 
            >提示信息</B></DIV></B></DIV></TD>
          <TD class=msg width="85%">&nbsp;&nbsp; <asp:label id=Label_Message runat="server"></asp:label><asp:label id=lab_print runat="server"></asp:label></TD></TR></table></TD></TR>
  <TR>
    <TD colSpan=3><uc1:footer id=Footer runat="server"></uc1:footer></TD></TR></TBODY></TABLE>
<table>
  <tr>
    <td><c1webgrid:c1webgrid id=C1webgrid1 runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False" PageSize="18" DefaultRowHeight="22px" DefaultColumnWidth="120px">
<AlternatingItemStyle HorizontalAlign="Center">
</AlternatingItemStyle>

<ItemStyle HorizontalAlign="Center">
</ItemStyle>

<PagerStyle Mode="NumericPages">
</PagerStyle>

<Columns>
<c1webgrid:C1TemplateColumn>
														<HeaderTemplate>
															 <asp:label id="Label8" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
																
														</HeaderTemplate>

														<ItemTemplate>
																	<asp:Label id="Label9" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>' />
																
														</ItemTemplate>
														</c1webgrid:C1TemplateColumn>
														<c1webgrid:C1TemplateColumn HeaderText="productId">
<HeaderTemplate>
																	<asp:Label id="Label2" runat="server" text='模具名稱'></asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	<asp:Label id="Label3" runat="server" Text='' />
																
</ItemTemplate>
</c1webgrid:C1TemplateColumn>
<c1webgrid:C1BoundColumn HeaderText="零件編號" DataField="PartNo"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="零件名稱" DataField="PartName"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="數量" DataField="PartCount"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="材質" DataField="Material"></c1webgrid:C1BoundColumn>
<c1webgrid:C1TemplateColumn HeaderText="productId">
<HeaderTemplate>
																	<asp:Label id="Label4" runat="server" text='單價'></asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	<asp:Label id="Label5" runat="server" Text='' />
																
</ItemTemplate>
</c1webgrid:C1TemplateColumn>
<c1webgrid:C1BoundColumn HeaderText="尺寸規格" DataField="Sizespec"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="工序" DataField="ProcessName"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="加工費" DataField="MachinePrice"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="外包費" DataField="OutSourcePrice"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="材料費" DataField="MaterialPrice"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="模具變更費" DataField="projectPrice" visible="false"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="報廢費" DataField="DisCardPrice" visible="false"></c1webgrid:C1BoundColumn>
<c1webgrid:C1BoundColumn HeaderText="總計費用" DataField="TotalPrice"></c1webgrid:C1BoundColumn>
</Columns>

<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD">
</HeaderStyle>

<SelectedItemStyle HorizontalAlign="Center">
</SelectedItemStyle>

<EditItemStyle HorizontalAlign="Center">
</EditItemStyle>
													</c1webgrid:c1webgrid></td></tr></table></form>
	</body>
</HTML>
