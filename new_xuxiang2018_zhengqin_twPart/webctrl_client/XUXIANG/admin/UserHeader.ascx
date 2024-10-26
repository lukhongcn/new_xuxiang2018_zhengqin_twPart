<%@ Control Language="c#" AutoEventWireup="false" Codebehind="UserHeader.ascx.cs" Inherits="ModuleWorkFlow.admin.controls.UserHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">用戶設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
    </td>
    <td>
      <div align="right"> 
        <a href="UserList.aspx">[ 顯示全部資料 ]</a>
        <a href="UserView.aspx">[ 添加資料 ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>