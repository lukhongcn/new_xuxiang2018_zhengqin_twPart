<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="xuxiangReqcreportHeader.ascx.cs" Inherits="ModuleWorkFlow.QC.control.xuxiangReqcreportHeader" TargetSchema="http://schemas.microsoft.com/Mobile/WebUserControl" %>
<table width="100%" border="0" cellspacing="2">
	<tr>
		<td>
			<div align="left">QC<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
		</td>
		<td>
			<div align="right">
				<a href="xuxiangReqcreportList.aspx">[ ��ܥ������ ]</a> &nbsp;<a href="xuxiangReqcreportView.aspx">[ 
					�K�[��� ]</a>
			</div>
		</td>
	</tr>
</table>
<hr>
