<%@ Control Language="c#" AutoEventWireup="false" Codebehind="daxinPartHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.daxinPartHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">�s��]�w</div>
		</td>
		<td>
			<div align="right">
				<a href="daxinPartList.aspx?customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					��ܥ������ ]</a> &nbsp;<a href="daxinPartAddEdit.aspx?func=add&amp;customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					�K�[��� ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
