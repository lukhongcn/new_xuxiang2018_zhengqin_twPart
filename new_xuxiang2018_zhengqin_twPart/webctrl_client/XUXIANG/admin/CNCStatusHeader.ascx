<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CNCStatusHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.CNCStatusHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">CNC高速機排程設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
    </td>
    <td>
      <div align="right"> 
        <a href="CNCMStatusList.aspx">[ 顯示全部資料 ]</a>
        &nbsp;<a href="CNCMStatusAddEdit.aspx">[ 添加資料 ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>