<%@ Control Language="c#" AutoEventWireup="false" Codebehind="xuxiangPartHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.xuxiangPartHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">�s��]�w</div>
		</td>
		<td>
			<div align="right">
				<a href="xuxiangPartList.aspx?customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					��ܥ������ ]</a> &nbsp;<a href="xuxiangPartAddEdit.aspx?func=add&amp;customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					�K�[��� ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
