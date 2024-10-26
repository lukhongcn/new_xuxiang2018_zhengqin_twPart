<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MachineGroupSelect.ascx.cs" Inherits="ModuleWorkFlow.controls.MachineGroupSelect" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table>
	<tr>
		<td>
			<asp:Label ID="lab_process" Runat="server">選擇工序</asp:Label><asp:DropDownList ID="dpl_process" Runat="server" AutoPostBack="True" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:datagrid id="dg_machingroup" AutoGenerateColumns="False" Width="100%" CellSpacing="2" CellPadding="2"
				runat="server">
				<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
				<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
				<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
				<Columns>
					<asp:TemplateColumn>
						<HeaderTemplate>
							<asp:CheckBox id="dg_chk_header" runat="server" AutoPostBack="true" OnCheckedChanged="chk_CheckedHeadChanged" />
						</HeaderTemplate>
						<ItemTemplate>
							<asp:CheckBox ID="dg_chk_selected" Runat="server" />
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<HeaderTemplate>
							<asp:Label ID="dg_lab_header_process" Runat="server" Text="工序"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="dg_lab_process" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'/>
							<asp:Label ID="dg_lab_processid" Runat="server" Visible="False" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
							</asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<HeaderTemplate>
							<asp:Label ID="dg_lab_header_machinegroupid" Runat="server" Text="機台組編號"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="dg_lab_machinegroupid" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Groupid") %>'>
							</asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn>
						<HeaderTemplate>
							<asp:Label ID="dg_lab_header_machinegroup" Runat="server" Text="機台組"></asp:Label>
						</HeaderTemplate>
						<ItemTemplate>
							<asp:Label ID="dg_lab_machinegroup" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Groupname") %>'>
							</asp:Label>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:datagrid>
		</td>
	</tr>
</table>
