<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ModulePartNotDoInScheduleView.ascx.cs" Inherits="ModuleWorkFlow.controls.ModulePartNotDoInScheduleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<font color="red" style="FONT-WEIGHT: bold">�p�Ƶ{�w�g�T�{�A���S���}�l�[�u�������p�U�G</font>
<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
		<asp:BoundColumn DataField="partno_id" HeaderText="�s��ID�s��"></asp:BoundColumn>
		<asp:BoundColumn DataField="PROCESSID" HeaderText="�u��"></asp:BoundColumn>
		<asp:BoundColumn DataField="machineid" HeaderText="���x"></asp:BoundColumn>
		<asp:BoundColumn DataField="processdate" HeaderText="���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="PROCESSMINUTES" HeaderText="�ɪ�"></asp:BoundColumn>
		<asp:BoundColumn DataField="processno" HeaderText="�Ǹ�"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
