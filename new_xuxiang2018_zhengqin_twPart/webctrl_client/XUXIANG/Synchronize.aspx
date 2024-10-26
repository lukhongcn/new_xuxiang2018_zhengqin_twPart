<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="Synchronize.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Synchronize" ContentType="text/html" ResponseEncoding="gb2312"%>

<HTML>
  <HEAD>
		<title>重新排程</title>
<FORUM:STYLE id=Style runat="server"></FORUM:STYLE>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema><LINK href="js/jsgantt.css" type=text/css rel=stylesheet >
<script language=javascript src="js/jsgantt.js"></script>

<script language=javascript>
		<%=xml%>
		</script>
</HEAD>
<body topMargin=0>
<form id=Form1 method=post runat="server">
<TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD colSpan=3><uc1:header id=Header runat="server"></uc1:header></TD></TR>
  <TR>
    <TD vAlign=top align=left width="20%"><uc1:leftmenu id=LeftMenu runat="server"></uc1:leftmenu></TD>
    <TD width="1%">&nbsp;</TD>
    <TD vAlign=top width="79%">
      <TABLE id=Table1 cellSpacing=0 cellPadding=0 width="100%" border=0 
      >
        <TBODY>
        <tr>
          <td><FONT color=red 
            >(重新排程，請單擊下面按鈕！)</FONT> </TD></TR>
        <tr>
          <td>
            <P>&nbsp;</P>
            <P><FONT face=新細明體 
            >&nbsp;&nbsp; </FONT><asp:button id=Button_Submit Runat="server" Text="重新排程"></asp:button><asp:button id=btn_gant runat="server" Text="排程瀏覽"></asp:button><FONT 
            face=新細明體>客戶</FONT><asp:dropdownlist id=dpl_customer runat="server" AutoPostBack="True"></asp:DropDownList><FONT 
            face=新細明體>工令單號</FONT><asp:dropdownlist id=dpl_moduleid runat="server" AutoPostBack="True"></asp:DropDownList><asp:textbox id=txt_module runat="server"></asp:TextBox></P>
            <P><FONT face=新細明體 
            ><asp:panel id=Panel1 runat="server" 
            ></asp:panel></FONT></P></TD></TR></TBODY></TABLE>
      <div class=gantt id=GanttChartDIV style="POSITION: relative" 
      ></DIV>
      <TABLE id=Table3 borderColor=#000660 borderColorDark=#000066 width="100%" 
      align=center borderColorLight=#000066 border=1>
        <TR vAlign=middle>
          <TD width="15%" height=28>
            <DIV align=center><B>
            <DIV align=center><B 
            >提示</B></DIV></B></DIV></TD>
          <TD class=msg width="85%">&nbsp;&nbsp; <asp:label id=Label_Message runat="server"></asp:label></TD></TR></TABLE></TD></TR>
  <TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD></TR></TBODY></TABLE>
			<%=closeWind%>
		</FORM>
	</body>
</HTML>
