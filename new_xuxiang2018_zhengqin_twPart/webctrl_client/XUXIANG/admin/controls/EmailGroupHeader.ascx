<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EmailGroupHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.EmailGroupHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">郵件群組維護<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="EmailGroupList.aspx">[ 顯示資料 ]</a> &nbsp;<a href="EmailGroupEdit.aspx">[ 
					維護資料 ]</a>
			</div>
		</td>
	</tr>
</table>
