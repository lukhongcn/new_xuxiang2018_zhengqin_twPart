<%@ Control Language="c#" AutoEventWireup="false" Codebehind="InInventoryHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.InInventoryHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">入庫設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
			
				<a href="InInventoryList.aspx">[ 顯示全部資料 ]</a> &nbsp;<a href="InInventoryView.aspx">[ 
					添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
