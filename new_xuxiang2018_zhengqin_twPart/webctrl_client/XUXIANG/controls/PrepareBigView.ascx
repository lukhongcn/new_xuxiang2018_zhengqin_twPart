<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PrepareBigView.ascx.cs" Inherits="ModuleWorkFlow.controls.PrepareBigView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:datagrid id="MainDatagrid" AutoGenerateColumns="False" Width="100%" CellSpacing="2" CellPadding="2"
	runat="server">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
		<asp:BoundColumn DataField="ProcessId" HeaderText="�u�ǽs��"></asp:BoundColumn>
		<asp:BoundColumn DataField="StatusId" HeaderText="���A�s��"></asp:BoundColumn>
		<asp:BoundColumn DataField="StartDate" HeaderText="�}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="EndDate" HeaderText="�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
