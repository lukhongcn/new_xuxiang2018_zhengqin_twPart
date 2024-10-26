<%@ Control Language="c#" AutoEventWireup="false" Codebehind="InitialInventoryHeader.ascx.cs" Inherits="ModuleWorkFlow.controls.InitialInventoryHeader" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<table width="100%" border="0" cellspacing="2">
  <tr>
    <td>
      <div align="left">期初入庫設定<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
    </td>
    <td>
      <div align="right"> 
       <a href="InitialInventorySearchtype.aspx">[ 期初入庫查詢 ]</a>
        <a href="InitialInventoryList.aspx">[ 顯示全部資料 ]</a>
        &nbsp;<a href="InitialInventoryView.aspx">[ 添加資料 ]</a>
      </div>
    </td>
  </tr>
</table>
<hr>