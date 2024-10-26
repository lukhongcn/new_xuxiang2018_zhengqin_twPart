<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MidView.ascx.cs" Inherits="ModuleWorkFlow.controls.MidView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
	<tr>
		<td align="center" width="20%">設定條件</td>
		<td width="80%">零件等級<asp:DropDownList ID="drp_partlevellist" Runat="server" AutoPostBack="True"></asp:DropDownList></td>
	</tr>
</table>
<asp:datagrid id="MainDatagrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:TemplateColumn HeaderText="ModuleId">
		<HeaderTemplate>
			<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
		</HeaderTemplate>
		<ItemTemplate>
			<asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
		</asp:Label>
		</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
		<asp:BoundColumn DataField="StartDate" HeaderText="計劃開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="EndDate" HeaderText="計劃結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factstartdate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factenddate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
<asp:Label ID="lab_HiddenModuleId" Runat="server" Visible="False" ForeColor="RED"></asp:Label>
<asp:Label ID="lab_HiddenEndDate" Runat="server" Visible="False" ForeColor="RED"></asp:Label>
