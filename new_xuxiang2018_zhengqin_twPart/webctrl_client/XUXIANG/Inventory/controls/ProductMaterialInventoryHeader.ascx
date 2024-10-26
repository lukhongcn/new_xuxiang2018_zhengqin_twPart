<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ProductMaterialInventoryHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.ProductMaterialInventoryHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">原物料設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href = "ProductMaterialInventorySearchtype.aspx">[查詢]</a>
				<a href = "ProductMaterialInventoryDetail.aspx">[庫存報表打印]</a>
				<a href="ProductMaterialInventoryList.aspx">[ 顯示全部資料 ]</a> &nbsp;<a href="ProductMaterialInventoryView.aspx">[ 添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
