<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MachineGroupHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.MachineGroupHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left"></b><%=ProcessName%>���x�ճ]�w/b><asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="MachineMachineGroupList.aspx?processid=<%=processid%>">[ ��ܥ������ ]</a> &nbsp;<a href="MachineMachineGroupAddEdit.aspx?processid=<%=processid%>">[ 
					�K�[��� ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
