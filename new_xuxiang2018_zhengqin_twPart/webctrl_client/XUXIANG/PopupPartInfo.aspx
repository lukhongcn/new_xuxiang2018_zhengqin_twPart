<%@ Page language="c#" Codebehind="PopupPartInfo.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PopupPartInfo" %>
<%@ Register TagPrefix="uc1" TagName="SmallView" Src="controls/SmallView.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>零件基本信息</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="JavaScript">
			self.moveTo(0,0); 
			self.resizeTo(screen.availWidth,screen.availHeight);
			self.focus(); 
		</script>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
	</HEAD>
	<body>
		<form id="form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD class="mainTitle" align="center">零件基本信息</TD>
				</TR>
				<TR>
					<TD>
						<uc1:SmallView id="SmallView1" runat="server"></uc1:SmallView></TD>
				</TR>
				<TR>
					<TD align="center"><input onclick="javascript:window.close();" type="button" value="關閉" name="btn_close"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
