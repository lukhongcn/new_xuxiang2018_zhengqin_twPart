<%@ Control Language="c#" AutoEventWireup="false" Codebehind="SearchCondition.ascx.cs" Inherits="ModuleWorkFlow.controls.SearchCondition" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
	<tr>
		<td bgColor="#aaaadd" colSpan="6"><b>�]�w�d�߱���</b></td>
	</tr>
	<tr>
		<td>�]�w�Ȥ�<asp:dropdownlist id="drp_customerlist" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
		<td>��ܼҨ�<asp:dropdownlist id="drp_modulelist" Runat="server"></asp:dropdownlist></td>
		<td>��ܭ��n����<asp:dropdownlist id="drp_level" Runat="server"></asp:dropdownlist></td>
		<td>��ܦ~<asp:dropdownlist id="drp_year" Runat="server"></asp:dropdownlist></td>
		<td>��ܤ�<asp:dropdownlist id="drp_month" Runat="server"></asp:dropdownlist></td>
		<td><asp:button id="btn_search" Runat="server" Text="�d��"></asp:button></td>
	</tr>
</TABLE>
