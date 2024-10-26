<%@ Control Language="c#" AutoEventWireup="false" Codebehind="LogPartProcessSmallScheduleView.ascx.cs" Inherits="ModuleWorkFlow.controls.LogPartProcessSmallScheduleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table id="table" cellPadding="2" width="100%" border="1">
	<tr>
		<td><asp:checkbox Runat="server" id="Checkbox_PartNo" Text="選擇零件" AutoPostBack="True"></asp:checkbox>
			<asp:dropdownlist id="DropDownList_PartNo" runat="server" AutoPostBack="True"></asp:dropdownlist>
		</td>
		<td>選擇工序<asp:dropdownlist id="DropDownList_Process" runat="server" AutoPostBack="True"></asp:dropdownlist>
			<asp:Button id="btn_print" Text="打印明細" runat="server"></asp:Button></td>
	</tr>
</table>
<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 100%; BORDER-BOTTOM-STYLE: ridge">
	<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
		Width="100%">
		<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
		<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
		<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
		<ItemStyle HorizontalAlign="Center"></ItemStyle>
		<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
		<Columns>
			<asp:BoundColumn DataField="PartNo_ID" HeaderText="零件編號"></asp:BoundColumn>
			<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
			<asp:TemplateColumn HeaderText="selfStartDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_selfStartDate" runat="server">自定義開始日期</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_selfStartDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.selfStartDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="selfEndDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_selfEndDate" runat="server">自定義結束日期</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_selfEndDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.selfEndDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="StartDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_StartDate" runat="server">開始日期</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_StartDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.startDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="EndDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_EndDate" runat="server">結束日期</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_EndDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.endDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="排程工時"></asp:BoundColumn>
			<asp:TemplateColumn HeaderText="開始提前/延遲">
				<ItemTemplate>
					<asp:Label runat="server" Text='' ID="dg_labstartdelaytime"></asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="結束提前/延遲">
				<ItemTemplate>
					<asp:Label runat="server" Text='' ID="dg_lab_delaytime"></asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid></div>
<asp:label id="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:label>
