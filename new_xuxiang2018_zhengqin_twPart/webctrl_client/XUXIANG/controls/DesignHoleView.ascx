<%@ Control Language="c#" AutoEventWireup="false" Codebehind="DesignHoleView.ascx.cs" Inherits="ModuleWorkFlow.controls.DesignHoleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<FONT face="新細明體"></FONT>
<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 100%; BORDER-BOTTOM-STYLE: ridge">
	<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
		Width="100%">
		<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
		<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
		<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
		<ItemStyle HorizontalAlign="Center"></ItemStyle>
		<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
		<Columns>
			<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
			<asp:BoundColumn DataField="PartNo" HeaderText="零件編號"></asp:BoundColumn>
			<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
			<asp:BoundColumn DataField="PartNo_Id" HeaderText="小零件號""></asp:BoundColumn>
			<asp:BoundColumn DataField="Startdate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></asp:BoundColumn>
			<asp:BoundColumn DataField="Enddate" HeaderText="實際暫停日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></asp:BoundColumn>
			<asp:BoundColumn DataField="Status" HeaderText="狀態"></asp:BoundColumn>
			<asp:BoundColumn DataField="Comment" HeaderText="暫停原因"></asp:BoundColumn>
		</Columns>
	</asp:datagrid></div>
