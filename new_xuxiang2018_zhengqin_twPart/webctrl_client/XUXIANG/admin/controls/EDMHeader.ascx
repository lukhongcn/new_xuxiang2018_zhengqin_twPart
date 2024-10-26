<%@ Control Language="c#" AutoEventWireup="false" Codebehind="EDMHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.EDMHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">EDM機台設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
    </td>
    <td>
      <div align="right"> 
        <a href="EDMMachineList.aspx">[ 顯示全部資料 ]</a>
        &nbsp;<a href="EDMMachineAddEdit.aspx">[ 添加資料 ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>