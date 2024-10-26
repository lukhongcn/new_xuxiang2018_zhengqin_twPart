<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="CreateFileList.aspx.cs" AutoEventWireup="false" Inherits="VersionControler.CreateFileList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>CreateFileList</title>
<meta content=True name=vs_showGrid>
<meta content="Microsoft Visual Studio .NET 7.1" name=GENERATOR>
<meta content=C# name=CODE_LANGUAGE>
<meta content=JavaScript name=vs_defaultClientScript>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema><LINK href="../css/common.css" rel=stylesheet >
  </HEAD>
<body>
<form id=Form1 method=post runat="server">
<TABLE id=Table3 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD colSpan=3><uc1:header id=Header runat="server"></uc1:header></TD></TR>
  <tr>
    <TD vAlign=top align=left width="20%"><uc1:leftmenu id=LeftMenu runat="server"></uc1:leftmenu></TD>
    <TD width="1%">&nbsp;</TD>
    <TD vAlign=top width="79%">
      <div><asp:label id=Label1 runat="server">檔案名稱</asp:label><br 
      ><asp:textbox id=txtBoxName tabIndex=1 runat="server" Width="184px"></asp:textbox><br 
      ><asp:label id=Label5 runat="server">上級菜單</asp:label><br 
      ><asp:dropdownlist id=dpl_ParentFileid tabIndex=2 runat="server" Width="184px"></asp:DropDownList><br 
      ><asp:label id=Label2 runat="server">類型</asp:label><br 
      ><asp:textbox id=txtBoxType tabIndex=3 runat="server" Width="184px"></asp:textbox><br 
      ><asp:label id=Label3 runat="server">建檔人</asp:label><br 
      ><asp:textbox id=txtBoxCreator tabIndex=4 runat="server" Width="184px"></asp:textbox><br 
      ><asp:label id=Label4 runat="server">備註</asp:label><br 
      ><asp:textbox id=txtBoxComment tabIndex=5 runat="server" Height="136px" TextMode="MultiLine"></asp:textbox><br 
      ><asp:button id=Button1 tabIndex=6 runat="server" Text="創建"></asp:button>&nbsp; 
<asp:button id=Button2 runat="server" Text="返回"></asp:button>&nbsp; 
<asp:label id=lbMessage11 runat="server"></asp:label></DIV><br 
      >
      <table borderColor=#000660 borderColorDark=#000066 width="100%" 
      align=center borderColorLight=#000066 border=1>
        <TR vAlign=middle>
          <TD width="15%" height=28>
            <DIV align=center><B>
            <DIV align=center><B 
            >提示</B></DIV></B></DIV></TD>
          <TD class=msg width="85%">&nbsp;&nbsp;
										<asp:label id="lbMessage" runat="server"></asp:label></TD></TR></TABLE></TD></TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR></TBODY></TABLE></FORM>
	</body>
</HTML>
