<%@ Control Language="c#" AutoEventWireup="false" Codebehind="ElectrodeHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.ElectrodeHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">電極設定</div>
		</td>
		<td>
			<div align="right">
				<a href="ElectrodeList.aspx">[ 
					顯示全部資料 ]</a> &nbsp;<a href="ElectrodeAddEdit.aspx?func=add&amp;customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
