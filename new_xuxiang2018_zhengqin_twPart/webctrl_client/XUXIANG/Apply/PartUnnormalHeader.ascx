<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PartUnnormalHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.PartUnnormalHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">零件報廢處理</div>
    </td>
    <td>
      <div align="right"> 
        <a href="PartUnnormalList.aspx?customerid=<%=customerid%>&moduleid=<%=moduleid%>">[ 顯示全部資料 ]</a>
        &nbsp;<a href="PartUnnormalAdd.aspx">[ 報廢設定 ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>