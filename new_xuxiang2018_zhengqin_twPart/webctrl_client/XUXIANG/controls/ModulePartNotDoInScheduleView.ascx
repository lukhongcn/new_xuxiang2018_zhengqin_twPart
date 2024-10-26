<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ModulePartNotDoInScheduleView.ascx.cs" Inherits="ModuleWorkFlow.controls.ModulePartNotDoInScheduleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<font color="red" style="FONT-WEIGHT: bold">小排程已經確認，但沒有開始加工的紀錄如下：</font>
<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
		<asp:BoundColumn DataField="partno_id" HeaderText="零件ID編號"></asp:BoundColumn>
		<asp:BoundColumn DataField="PROCESSID" HeaderText="工序"></asp:BoundColumn>
		<asp:BoundColumn DataField="machineid" HeaderText="機台"></asp:BoundColumn>
		<asp:BoundColumn DataField="processdate" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="PROCESSMINUTES" HeaderText="時長"></asp:BoundColumn>
		<asp:BoundColumn DataField="processno" HeaderText="序號"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
