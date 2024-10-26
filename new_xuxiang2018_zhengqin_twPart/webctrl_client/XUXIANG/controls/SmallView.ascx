<%@ Register TagPrefix="c1webgrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SmallView.ascx.cs" Inherits="ModuleWorkFlow.controls.SmallView" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
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
	<c1webgrid:c1webgrid id="MainDataGrid" runat="server" Width="904px" AutoGenerateColumns="False" CellSpacing="1"
		CellPadding="1" GroupIndent="15px" GridLines="None" DataMember="Invoices" Font-Names="Trebuchet MS"
		Font-Size="X-Small" BackColor="#999999" BorderWidth="1px" BorderStyle="None" BorderColor="#999999"
		DefaultRowHeight="22px" DefaultColumnWidth="120px">
		<AlternatingItemStyle BackColor="#CEEACE"></AlternatingItemStyle>
		<ItemStyle ForeColor="Black" BackColor="#E0FFE0"></ItemStyle>
		<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
		<COLUMNS>
			<C1WEBGRID:C1BOUNDCOLUMN Visible="False" DataField="CReturn" HeaderText="零件編號">
				<HEADERSTYLE Width="0px"></HEADERSTYLE>
				<GROUPINFO HeaderText="工序 <i>{0}</i> " Position="Header">
					<HEADERSTYLE BackColor="#007300"></HEADERSTYLE>
				</GROUPINFO>
			</C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="PartNo" HeaderText="零件編號"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="ProcessId" HeaderText="工序"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="StatusId" HeaderText="狀態"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="FactStartDate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="FactEndDate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="FactOutSourceSendDate" HeaderText="實際出廠日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}"  Visible="False"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="FactOutSourceGetDate" HeaderText="實際回廠日期" DataFormatString="{0:yyyy-MM-dd H:mm:ss}" Visible="False"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="ProcessNeedMinutes" HeaderText="排程工時"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="FactProcessNeedMinutes" HeaderText="實際工時"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN Visible="False" DataField="StatusId" HeaderText="狀態"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="GetUserName" HeaderText="接單者"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="OutUserName" HeaderText="消單者"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="username" HeaderText="操作者"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="IsUnnormal" HeaderText="是否返工"></C1WEBGRID:C1BOUNDCOLUMN>
			<C1WEBGRID:C1BOUNDCOLUMN DataField="NeedProduct" HeaderText="是否外包"></C1WEBGRID:C1BOUNDCOLUMN>
		</COLUMNS>
		<HEADERSTYLE ForeColor="White" BackColor="#005500" Font-Bold="True"></HEADERSTYLE>
		<SELECTEDITEMSTYLE ForeColor="White" BackColor="#008A8C" Font-Bold="True"></SELECTEDITEMSTYLE>
	</c1webgrid:c1webgrid>
</div>
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
