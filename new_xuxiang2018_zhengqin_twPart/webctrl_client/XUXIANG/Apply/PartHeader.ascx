<%@ Control Language="c#" AutoEventWireup="false" Codebehind="PartHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.PartHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">�s��]�w</div>
    </td>
    <td>
      <div align="right"> 
        <a href="PartList.aspx?customerid=<%=customerid%>&moduleid=<%=moduleid%>">[ ��ܥ������ ]</a>
        &nbsp;<a href="PartAddEdit.aspx?func=add&customerid=<%=customerid%>&moduleid=<%=moduleid%>">[ �K�[��� ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>