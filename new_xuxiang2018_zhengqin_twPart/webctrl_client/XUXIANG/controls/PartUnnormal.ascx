<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PartUnnormal.ascx.cs" Inherits="ModuleWorkFlow.controls.PartUnnormal" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="2"
	CellPadding="2">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:TemplateColumn>
			<HeaderTemplate>
				<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<%#DataBinder.Eval(Container, "DataItem.moduleid") %>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="OldPartNoId" HeaderText="零件編號"></asp:BoundColumn>
		<asp:BoundColumn DataField="partnoid" HeaderText="報廢零件編號"></asp:BoundColumn>
		<asp:TemplateColumn>
			<HeaderTemplate>
				<asp:label id="dg_header_Process" runat="server" Text="工序" /></asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label ID="dg_lab_Process" Runat="server"></asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn Visible="False">
			<HeaderTemplate>
				<asp:label id="dg_header_ProcessId" runat="server" Text="工序" /></asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label ID="dg_lab_ProcessId" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<HeaderTemplate>
				<asp:label id="dg_header_FactStartDate" runat="server" Text="開始時間" /></asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				&nbsp;
				<asp:Label ID="dg_lab_FactStartDate" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.FactStartDate") %>'>
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<HeaderTemplate>
				<asp:label id="dg_header_FactEndDate" runat="server" Text="結束時間" /></asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				&nbsp;
				<asp:Label ID="dg_lab_FactEndDate" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.FactEndDate") %>'>
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:datagrid>
