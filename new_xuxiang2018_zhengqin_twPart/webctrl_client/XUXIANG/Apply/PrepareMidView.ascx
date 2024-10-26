<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PrepareMidView.ascx.cs" Inherits="ModuleWorkFlow.controls.PrepareMidView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:datagrid id="MainDatagrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
		<asp:BoundColumn DataField="ProcessId" HeaderText="�u��"></asp:BoundColumn>
		<asp:BoundColumn DataField="StartDate" HeaderText="�}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="EndDate" HeaderText="�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factstartdate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factenddate" HeaderText="��ڵ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
