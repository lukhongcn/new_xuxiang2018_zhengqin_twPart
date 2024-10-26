<%@ Control Language="c#" AutoEventWireup="false" Codebehind="newDesignView.ascx.cs" Inherits="ModuleWorkFlow.controls.NewDesignView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table id="table" cellPadding="2" width="100%" border="1">
	<tr>
		<td><asp:checkbox Runat="server" id="Checkbox_PartNo" Text="選擇零件" AutoPostBack="True"></asp:checkbox>
			<asp:dropdownlist id="DropDownList_PartNo" runat="server" AutoPostBack="True"></asp:dropdownlist>
		</td>
		<td>選擇工序<asp:dropdownlist id="DropDownList_Process" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
		<td>選擇狀態<asp:dropdownlist id="DropDownList_Status" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
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
			<asp:BoundColumn DataField="PartNo_ID" HeaderText="設計類型"></asp:BoundColumn>
			<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
			<asp:TemplateColumn HeaderText="狀態">
				<ItemTemplate>
					<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusId") %>' ID="Label1" NAME="Label1" >
					</asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:BoundColumn DataField="selfStartDate" HeaderText="自定義開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
			<asp:BoundColumn DataField="selfEndDate" HeaderText="自定義結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
			<asp:BoundColumn DataField="FactStartDate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></asp:BoundColumn>
			<asp:BoundColumn DataField="FactEndDate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></asp:BoundColumn>
			
			<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="排程工時"></asp:BoundColumn>
			<asp:BoundColumn DataField="FactProcessNeedMinutes" HeaderText="實際工時"></asp:BoundColumn>
			<asp:BoundColumn DataField="StatusId" HeaderText="狀態" Visible="False"></asp:BoundColumn>
			<asp:BoundColumn DataField="username" HeaderText="操作者"></asp:BoundColumn>
			<asp:BoundColumn DataField="StartDate" HeaderText="系統開始時間" DataFormatString="{0:yyyy-MM-dd H:mm:ss}" Visible=False></asp:BoundColumn>
			<asp:BoundColumn DataField="EndDate" HeaderText="系統結束時間" DataFormatString="{0:yyyy-MM-dd H:mm:ss}" Visible=False></asp:BoundColumn>
			<asp:TemplateColumn HeaderText="結束提前/延遲" Visible="False">
				<ItemTemplate>
					<asp:Label runat="server" Text='' ID="dg_lab_delaytime"></asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
			<asp:TemplateColumn HeaderText="開始提前/延遲" Visible="False">
				<ItemTemplate>
					<asp:Label runat="server" Text='' ID="dg_labstartdelaytime"></asp:Label>
				</ItemTemplate>
			</asp:TemplateColumn>
		</Columns>
	</asp:datagrid></div>
<asp:label id="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:label>
<TABLE id="Table4" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
	borderColorLight="#000066" border="1">
	<TR vAlign="middle">
		<TD class="msg" width="15%">總計排程工時</TD>
		<TD class="msg" width="35%">&nbsp;
			<asp:label id="lab_schedulehours" Runat="server" CssClass="content"></asp:label></TD>
		<TD class="msg" width="15%">總計實際工時</TD>
		<TD class="msg" width="35%">&nbsp;
			<asp:label id="lab_facthours" Runat="server" CssClass="content"></asp:label></TD>
	</TR>
</TABLE>
