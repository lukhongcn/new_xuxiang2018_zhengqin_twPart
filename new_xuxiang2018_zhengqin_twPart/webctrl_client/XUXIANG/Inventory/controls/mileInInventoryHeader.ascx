<%@ Control Language="c#" AutoEventWireup="false" Codebehind="mileInInventoryHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.mileInInventoryHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">入庫設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="ProductMaterialInventorySearchtype.aspx">[原物料查詢]</a> <a href="InInventorySearchtype.aspx">
					[入庫查詢]</a> <a href="mileInInventoryList.aspx">[ 顯示全部資料 ]</a> &nbsp;<a href="mileInInventoryView.aspx">[ 
					添加資料 ]</a><a href="mileInInventoryView1.aspx">[ 通用入庫添加 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
