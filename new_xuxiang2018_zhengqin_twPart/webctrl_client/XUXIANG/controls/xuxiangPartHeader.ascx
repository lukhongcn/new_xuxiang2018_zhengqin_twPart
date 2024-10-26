<%@ Control Language="c#" AutoEventWireup="false" Codebehind="xuxiangPartHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.xuxiangPartHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">零件設定</div>
		</td>
		<td>
			<div align="right">
				<a href="xuxiangPartList.aspx?customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					顯示全部資料 ]</a> &nbsp;<a href="xuxiangPartAddEdit.aspx?func=add&amp;customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
