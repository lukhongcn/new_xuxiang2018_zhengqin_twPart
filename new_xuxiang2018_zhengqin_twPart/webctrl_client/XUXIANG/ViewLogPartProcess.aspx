<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LogPartProcessSmallScheduleView" Src="controls/LogPartProcessSmallScheduleView.ascx" %>
<%@ Page language="c#" Codebehind="ViewLogPartProcess.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ViewLogPartProcess" %>
<%@ Register TagPrefix="uc1" TagName="LogPartProcessMiddleScheduleView" Src="controls/LogPartProcessMiddleScheduleView.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具初次計劃排程信息瀏覽</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<script language="JavaScript">
			self.moveTo(0,0); 
			self.resizeTo(screen.availWidth,screen.availHeight);
			self.focus(); 
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="TableView" width="100%" border="1" runat="server">
				<TR>
					<TD width="50%">模具編號<asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
					<TD width="50%"><asp:button id="btn_ViewMiddle" Text="工序統計信息" Runat="server"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="btn_ViewSmall" Text="零件加工信息" Runat="server"></asp:button></TD>
				</TR>
			</TABLE>
			<uc1:logpartprocesssmallscheduleview id="LogPartProcessSmallScheduleView" runat="server"></uc1:logpartprocesssmallscheduleview><uc1:logpartprocessmiddlescheduleview id="LogPartProcessMiddleScheduleView" runat="server"></uc1:logpartprocessmiddlescheduleview></form>
	</body>
</HTML>
