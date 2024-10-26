<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="ModulePartNotDoInScheduleView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModulePartNotDoInScheduleView" %>
<%@ Register TagPrefix="uc1" TagName="ModulePartNotDoInScheduleView" Src="controls/ModulePartNotDoInScheduleView.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>計劃加工但未加工零件警示信息</title>
<FORUM:STYLE id=Style runat="server"></FORUM:STYLE>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
  </HEAD>
<body topMargin=0>
<form id=Form1 method=post runat="server">
<TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD><uc1:header id=Header runat="server"></uc1:header></TD></TR>
  <TR>
						<!--<TD vAlign="top" align="left" width="1%"></TD>
						<TD width="1%">&nbsp;</TD>-->
    <TD vAlign=top width="92%"><A href="default.aspx" >返回首頁</A> <BR 
      >
      <table id=Table_Header2 cellSpacing=0 cellPadding=0 width="100%" border=1 
      >
        <tr>
          <td align=center width="20%">設定條件</TD>
          <td align=center width="20%">工序<asp:dropdownlist id=drp_processlist Runat="server"></asp:DropDownList></TD>
          <td align=center width="20%">狀態<asp:dropdownlist id=drp_statuslist Runat="server"></asp:DropDownList></TD>
          <td width="40%">日期:<wc:inputcalendar id=tbx_Date runat="server"></wc:inputcalendar>&nbsp;&nbsp;<asp:button id=Button_Search Runat="server" Text="查詢"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<asp:button id=btn_print Runat="server" Text="打印"></asp:button></TD></TR></TABLE><uc1:modulepartnotdoinscheduleview id=modulePartNotDoInScheduleView runat="server"></uc1:ModulePartNotDoInScheduleView><br 
      >
      <TABLE id=Table3 borderColor=#000660 borderColorDark=#000066 width="100%" 
      align=center borderColorLight=#000066 border=1>
        <TR vAlign=middle>
          <TD width="15%" height=28>
            <DIV align=center><B 
            >提示</B></DIV></TD>
          <TD class=msg width="85%">&nbsp;&nbsp; <asp:label id=Label_Message runat="server"></asp:label></TD></TR></TABLE></TD></TR>
  <TR>
    <TD colSpan=3><uc1:footer id="Footer" runat="server"></uc1:footer></TD></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
