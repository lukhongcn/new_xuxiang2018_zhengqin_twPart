<%@ Control Language="c#" AutoEventWireup="false" Codebehind="LogPartProcessMiddleScheduleView.ascx.cs" Inherits="ModuleWorkFlow.controls.LogPartProcessMiddleScheduleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:datagrid id="MainDatagrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
		<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
		<asp:BoundColumn DataField="StartDate" HeaderText="計劃開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="EndDate" HeaderText="計劃結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
