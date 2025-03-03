<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SmallViewRecommand.ascx.cs" Inherits="ModuleWorkFlow.controls.SmallViewRecommand" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register TagPrefix="c1webgrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid" %>
<table id="table" cellPadding="0" width="100%" border="0">
	<tr>
		<td><asp:checkbox id="Checkbox_PartNo" Runat="server" Text="選擇零件" AutoPostBack="True"></asp:checkbox><asp:dropdownlist id="DropDownList_PartNo" AutoPostBack="True" runat="server"></asp:dropdownlist></td>
		<td>選擇工序<asp:dropdownlist id="DropDownList_Process" AutoPostBack="True" runat="server"></asp:dropdownlist></td>
	</tr>
</table>
<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 100%; BORDER-BOTTOM-STYLE: ridge"><c1webgrid:c1webgrid id="MainDataGrid" runat="server" DefaultColumnWidth="120px" DefaultRowHeight="22px"
		BorderColor="#999999" BorderStyle="None" BorderWidth="1px" BackColor="#999999" Font-Size="X-Small" Font-Names="Trebuchet MS" DataMember="Invoices" GridLines="None" GroupIndent="15px" CellPadding="1" CellSpacing="1" AutoGenerateColumns="False" Width="904px">
		<AlternatingItemStyle BackColor="#CEEACE"></AlternatingItemStyle>
		<ItemStyle ForeColor="Black" BackColor="#E0FFE0"></ItemStyle>
		<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
		<Columns>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="PartNo_ID" HeaderText="零件編號">
				<GROUPINFO HeaderText=" <i>{0}</i> " Position="Header">
					<HEADERSTYLE BackColor="#007300"></HEADERSTYLE>
				</GROUPINFO>
			</C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="ProcessId" HeaderText="工序"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="StatusId" HeaderText="狀態"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="ProcessNeedMinutes" HeaderText="排程工時"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="SchMachineId" HeaderText="機台編號"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="ProcessDate" HeaderText="加工日期"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="ProcessMinutes" HeaderText="加工時間"></C1WEBGRID:C1BOUNDCOLUMN>
		</Columns>
		<HEADERSTYLE ForeColor="White" BackColor="#005500" Font-Bold="True"></HEADERSTYLE>
		<SELECTEDITEMSTYLE ForeColor="White" BackColor="#008A8C" Font-Bold="True"></SELECTEDITEMSTYLE>
	</c1webgrid:c1webgrid></div>
<asp:label id="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:label>
<TABLE id="Table4" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
	borderColorLight="#000066" border="1">
	<TR vAlign="middle">
		<TD class="msg" width="15%">總計加工時間</TD>
		<TD class="msg" width="35%">&nbsp;
			<asp:label id="lab_schedulehours" Runat="server" CssClass="content"></asp:label></TD>
	</TR>
</TABLE>
