<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DesignHoleView.ascx.cs" Inherits="ModuleWorkFlow.controls.DesignHoleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<FONT face="�s�ө���"></FONT>
<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 100%; BORDER-BOTTOM-STYLE: ridge">
	<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
		Width="100%">
		<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
		<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
		<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
		<ItemStyle HorizontalAlign="Center"></ItemStyle>
		<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
		<Columns>
			<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
			<asp:BoundColumn DataField="PartNo" HeaderText="�s��s��"></asp:BoundColumn>
			<asp:BoundColumn DataField="ProcessId" HeaderText="�u��"></asp:BoundColumn>
			<asp:BoundColumn DataField="PartNo_Id" HeaderText="�p�s��""></asp:BoundColumn>
			<asp:BoundColumn DataField="Startdate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></asp:BoundColumn>
			<asp:BoundColumn DataField="Enddate" HeaderText="��ڼȰ����" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></asp:BoundColumn>
			<asp:BoundColumn DataField="Status" HeaderText="���A"></asp:BoundColumn>
			<asp:BoundColumn DataField="Comment" HeaderText="�Ȱ���]"></asp:BoundColumn>
		</Columns>
	</asp:datagrid></div>
