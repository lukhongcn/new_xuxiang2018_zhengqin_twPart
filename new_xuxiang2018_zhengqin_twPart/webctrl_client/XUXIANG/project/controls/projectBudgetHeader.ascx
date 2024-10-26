<%@ Control Language="c#" AutoEventWireup="false" Codebehind="projectBudgetHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.projectBudgetHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left"> <asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
			
				<a href="ProjectBudgetList.aspx">[ 顯示全部資料 ]</a> &nbsp;<a href="ProjectBudgetView.aspx">[ 
					添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
