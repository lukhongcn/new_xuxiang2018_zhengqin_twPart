<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MachineStatusHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.MachineStatusHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left"><%=ProcessName%>機台排程設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="MachineStatusList.aspx?processid=<%=processid%>">[ 顯示全部資料 ]</a> 
				&nbsp;<a href="MachineStatusAdd.aspx?processid=<%=processid%>">[ 
					添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
