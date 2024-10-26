<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SearchCondition.ascx.cs" Inherits="ModuleWorkFlow.controls.SearchCondition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
	<tr>
		<td bgColor="#aaaadd" colSpan="6"><b>設定查詢條件</b></td>
	</tr>
	<tr>
		<td>設定客戶<asp:dropdownlist id="drp_customerlist" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
		<td>選擇模具<asp:dropdownlist id="drp_modulelist" Runat="server"></asp:dropdownlist></td>
		<td>選擇重要等級<asp:dropdownlist id="drp_level" Runat="server"></asp:dropdownlist></td>
		<td>選擇年<asp:dropdownlist id="drp_year" Runat="server"></asp:dropdownlist></td>
		<td>選擇月<asp:dropdownlist id="drp_month" Runat="server"></asp:dropdownlist></td>
		<td><asp:button id="btn_search" Runat="server" Text="查詢"></asp:button></td>
	</tr>
</TABLE>
