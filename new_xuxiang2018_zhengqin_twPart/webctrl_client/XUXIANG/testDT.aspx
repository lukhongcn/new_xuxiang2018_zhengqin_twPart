<%@ Page language="c#" Codebehind="testDT.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.testDT" %>
<%@ Register TagPrefix="esshs" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>testDT</title>
		<Forum:Style id="Style" runat="server" />
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<esshs:InputCalendar id="STime" runat="server"></esshs:InputCalendar>
			<asp:TextBox id="TextBox1" runat="server" onfocus="javascript:show_cele_date(this,'','',this);"></asp:TextBox>
			<asp:Button id="Button1" runat="server" Text="Button"></asp:Button>
		</form>
	</body>
</HTML>
