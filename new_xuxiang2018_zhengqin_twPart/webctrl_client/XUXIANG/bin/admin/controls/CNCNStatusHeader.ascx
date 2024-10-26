<%@ Control Language="c#" AutoEventWireup="false" Codebehind="CNCNStatusHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.CNCNStatusHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">CNC普通機排程設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
    </td>
    <td>
      <div align="right"> 
        <a href="CNCNMStatusList.aspx">[ 顯示全部資料 ]</a>
        &nbsp;<a href="CNCNMStatusAddEdit.aspx">[ 添加資料 ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>