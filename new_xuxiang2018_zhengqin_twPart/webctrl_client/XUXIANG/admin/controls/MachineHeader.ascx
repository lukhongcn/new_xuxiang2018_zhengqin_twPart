<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MachineHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.MachineHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left"><%=ProcessName%>���x�]�w<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="MachineMachineList.aspx?processid=<%=processid%>">[ ��ܥ������ ]</a>
				&nbsp;<a href="MachineMachineOneAddEdit.aspx?processid=<%=processid%>">[ �K�[��� ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>

