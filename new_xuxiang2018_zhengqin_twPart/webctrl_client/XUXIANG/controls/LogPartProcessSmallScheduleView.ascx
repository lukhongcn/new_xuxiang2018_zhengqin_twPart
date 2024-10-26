<%@ Control Language="c#" AutoEventWireup="false" Codebehind="LogPartProcessSmallScheduleView.ascx.cs" Inherits="ModuleWorkFlow.controls.LogPartProcessSmallScheduleView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table id="table" cellPadding="2" width="100%" border="1">
	<tr>
		<td><asp:checkbox Runat="server" id="Checkbox_PartNo" Text="��ܹs��" AutoPostBack="True"></asp:checkbox>
			<asp:dropdownlist id="DropDownList_PartNo" runat="server" AutoPostBack="True"></asp:dropdownlist>
		</td>
		<td>��ܤu��<asp:dropdownlist id="DropDownList_Process" runat="server" AutoPostBack="True"></asp:dropdownlist>
			<asp:Button id="btn_print" Text="���L����" runat="server"></asp:Button></td>
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
			<asp:BoundColumn DataField="PartNo_ID" HeaderText="�s��s��"></asp:BoundColumn>
			<asp:BoundColumn DataField="ProcessId" HeaderText="�u��"></asp:BoundColumn>
			<asp:TemplateColumn HeaderText="selfStartDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_selfStartDate" runat="server">�۩w�q�}�l���</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_selfStartDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.selfStartDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="selfEndDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_selfEndDate" runat="server">�۩w�q�������</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_selfEndDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.selfEndDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="StartDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_StartDate" runat="server">�}�l���</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_StartDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.startDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="EndDate">
			<HeaderTemplate>
				<asp:Label id="dg_header_EndDate" runat="server">�������</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_EndDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.endDate","{0:d}")%>'/>
			</ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�Ƶ{�u��"></asp:BoundColumn>
			<asp:TemplateColumn HeaderText="�}�l���e/����">
				<ItemTemplate>
					<asp:Label runat="server" Text='' ID="dg_labstartdelaytime"></asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="�������e/����">
				<ItemTemplate>
					<asp:Label runat="server" Text='' ID="dg_lab_delaytime"></asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid></div>
<asp:label id="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:label>
