<%@ Control Language="c#" AutoEventWireup="false" Codebehind="MachineStatusHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.MachineStatusHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left"><%=ProcessName%>���x�Ƶ{�]�w<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="MachineStatusList.aspx?processid=<%=processid%>">[ ��ܥ������ ]</a> 
				&nbsp;<a href="MachineStatusAdd.aspx?processid=<%=processid%>">[ 
					�K�[��� ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
