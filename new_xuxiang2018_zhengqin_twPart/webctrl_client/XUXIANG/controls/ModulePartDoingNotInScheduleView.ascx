<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ModulePartDoingNotInScheduleView.ascx.cs" Inherits="ModuleWorkFlow.controls.ModulePartDoingNotInScheduleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<font color="red" style="FONT-WEIGHT: bold">零件該工序正在加工，但沒有經過小排程確認的紀錄如下：</font>
<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
		<asp:BoundColumn DataField="partno_id" HeaderText="零件ID編號"></asp:BoundColumn>
		<asp:BoundColumn DataField="processid" HeaderText="工序"></asp:BoundColumn>
		<asp:BoundColumn DataField="statusid" HeaderText="狀態"></asp:BoundColumn>
		<asp:BoundColumn DataField="processorder" HeaderText="工序序號"></asp:BoundColumn>
		<asp:BoundColumn DataField="startdate" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="enddate" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factstartdate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factenddate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
