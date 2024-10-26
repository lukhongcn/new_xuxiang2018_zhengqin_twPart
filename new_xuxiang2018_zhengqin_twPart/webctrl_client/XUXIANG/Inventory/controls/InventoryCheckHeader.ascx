<%@ Control Language="c#" AutoEventWireup="false" Codebehind="InventoryCheckHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.InventoryCheckHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">盤點設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="InventoryChecksearchType.aspx">[查詢]</a>&nbsp;<a href="InventoryCheckList.aspx">[ 顯示全部資料 ]</a> &nbsp;<a href="InventoryCheckView.aspx">[ 
					添加資料 ]</a>&nbsp;<a href="TypeInventoryCheckView.aspx">[ 
					批量盤點 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
