<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MidViewFact.ascx.cs" Inherits="ModuleWorkFlow.controls.MidViewFact" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<asp:label ID="lab_search" Runat="server">零件編號</asp:label><asp:TextBox ID="txt_search" Runat="server"></asp:TextBox><asp:Button ID="btn_search" Runat="server" Text="查詢"></asp:Button><asp:Label ID="lab_searchpartno" Runat=server Visible=False></asp:Label>
<asp:datagrid id="MainDatagrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False">
	<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
	<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
	<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
	<ItemStyle HorizontalAlign="Center"></ItemStyle>
	<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
	<Columns>
		<asp:TemplateColumn HeaderText="選擇">
			<HeaderTemplate>
				<asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:CheckBox id="CheckBox_Select" runat="server" Checked="False"></asp:CheckBox>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="moduleId" Visible="False">
			<HeaderTemplate>
				<asp:Label id="dg_header_moduleId" runat="server" text="模具編號">
				</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="partno">
			<HeaderTemplate>
				<asp:Label id="dg_header_partno" runat="server">零件編號</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_partno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>'/>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="processid">
			<HeaderTemplate>
				<asp:Label id="dg_header_processid" runat="server">工序</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_processid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'/>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn HeaderText="processid">
			<HeaderTemplate>
				<asp:Label id="Label1" runat="server">工序時間</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:Label id="dg_lab_processNeedMinutes" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessNeedMinutes")%>'/>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:BoundColumn DataField="StartDate" HeaderText="系統開始日期"></asp:BoundColumn>
		<asp:BoundColumn DataField="EndDate" HeaderText="系統結束日期"></asp:BoundColumn>
		<asp:TemplateColumn ItemStyle-Width="35">
			<HeaderTemplate>
				<asp:label ID="dg_header_date" Runat="server">間隔天數</asp:label>
			</HeaderTemplate>
			<ItemTemplate>
				&nbsp;
				<asp:Label ID="dg_lab_date" Runat="server" Text=" "></asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<HeaderTemplate>
				<asp:Label ID="dg_header_scheduledstartdate" Runat="server">計劃開始日期</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:TextBox ID="dg_txt_scheduledstartdate" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.scheduledstartdate")%>'>
				</asp:TextBox>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn>
			<HeaderTemplate>
				<asp:Label ID="dg_header_scheduledenddate" Runat="server">計劃結束日期</asp:Label>
			</HeaderTemplate>
			<ItemTemplate>
				<asp:TextBox ID="dg_txt_scheduledenddate" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.scheduledenddate")%>'>
				</asp:TextBox>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn Visible="False">
			<ItemTemplate>
				<asp:Label ID="dg_lab_processno" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.processno")%>' >
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
		<asp:TemplateColumn Visible="False">
			<ItemTemplate>
				<asp:Label ID="dg_lab_customername" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.CustomerName")%>'>
				</asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn >
		<asp:TemplateColumn Visible="False">
			<ItemTemplate>
				<asp:label ID="dg_lab_isconfirm" Runat=server Text='<%#DataBinder.Eval(Container, "DataItem.IsConfirm")%>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateColumn>
	</Columns>
</asp:datagrid>
<asp:Label ID="lab_HiddenModuleId" Runat="server" Visible="False" ForeColor="RED"></asp:Label>
<asp:Label ID="lab_HiddenEndDate" Runat="server" Visible="False" ForeColor="RED"></asp:Label>
