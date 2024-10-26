<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MachineHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.MachineHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left"><%=ProcessName%>機台設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="MachineMachineList.aspx?processid=<%=processid%>">[ 顯示全部資料 ]</a>
				&nbsp;<a href="MachineMachineOneAddEdit.aspx?processid=<%=processid%>">[ 添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>

