<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ModulePartDoingNotInScheduleView.ascx.cs" Inherits="ModuleWorkFlow.controls.ModulePartDoingNotInScheduleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<font color="red" style="FONT-WEIGHT: bold">�s��Ӥu�ǥ��b�[�u�A���S���g�L�p�Ƶ{�T�{�������p�U�G</font>
<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
		<asp:BoundColumn DataField="partno_id" HeaderText="�s��ID�s��"></asp:BoundColumn>
		<asp:BoundColumn DataField="processid" HeaderText="�u��"></asp:BoundColumn>
		<asp:BoundColumn DataField="statusid" HeaderText="���A"></asp:BoundColumn>
		<asp:BoundColumn DataField="processorder" HeaderText="�u�ǧǸ�"></asp:BoundColumn>
		<asp:BoundColumn DataField="startdate" HeaderText="�}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="enddate" HeaderText="�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factstartdate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
		<asp:BoundColumn DataField="factenddate" HeaderText="��ڵ������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
	</Columns>
</asp:datagrid>
