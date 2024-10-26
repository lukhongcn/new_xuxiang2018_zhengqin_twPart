<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PartHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.PartHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">零件設定</div>
    </td>
    <td>
      <div align="right"> 
        <a href="PartList.aspx?customerid=<%=customerid%>&moduleid=<%=moduleid%>">[ 顯示全部資料 ]</a>
        &nbsp;<a href="PartAddEdit.aspx?func=add&customerid=<%=customerid%>&moduleid=<%=moduleid%>">[ 添加資料 ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>