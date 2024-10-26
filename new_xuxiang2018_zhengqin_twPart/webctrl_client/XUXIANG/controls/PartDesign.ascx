<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PartDesign.ascx.cs" Inherits="ModuleWorkFlow.controls.PartDesign" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">模具技術開發</div>
		</td>
		<td>
			<div align="right">
				<a href="PartDesignList.aspx?customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					顯示全部資料 ]</a> &nbsp;<a href="milePartDesignAddEdit.aspx?func=add&amp;customerid=<%=customerid%>&amp;moduleid=<%=moduleid%>">[ 
					添加資料 ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
