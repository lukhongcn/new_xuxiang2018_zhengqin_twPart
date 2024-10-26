<%@ Page language="c#" Codebehind="DepartMentView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.DepartMentView" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>部門設置</title>
<LINK href="../css/common.css" rel=stylesheet >
<meta content="Microsoft Visual Studio .NET 7.1" name=GENERATOR>
<meta content=C# name=CODE_LANGUAGE>
<meta content=JavaScript name=vs_defaultClientScript>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
  </HEAD>
<body MS_POSITIONING="GridLayout">
<form method=post runat="server">
<TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD colSpan=3><uc1:header id=Header runat="server"></uc1:header></TD></TR>
  <tr>
    <TD vAlign=top align=left width="20%"><uc1:leftmenu id=LeftMenu runat="server"></uc1:leftmenu></TD>
    <TD width="1%">&nbsp;</TD>
    <TD vAlign=top width="79%">
      <table cellSpacing=2 width="100%" border=0>
        <tr>
          <td>
            <div align=left>部門設置<asp:label id=Label_StatusMsg runat="server"></asp:label></DIV></TD></TR></TABLE>
      <hr>

      <TABLE id=Table4 borderColor=#ccccff cellSpacing=1 borderColorDark=#cccccc 
      cellPadding=0 width="100%" align=center borderColorLight=#ccccff border=1 
       runat="server">
        <tr>
          <td>
            <table width="100%" align=center border=0>
              <tr>
                <td vAlign=top borderColorLight=#ccccff borderColorDark=#cccccc 
                ><asp:panel id=pan_treeview 
                   runat="server"></asp:Panel></TD>
                <td vAlign=top>
                  <table>
                    <tr>
                      <TD>部門名</TD>
                      <TD><asp:textbox id=txt_department runat="server"></asp:textbox><asp:label id=lab_departmentid Runat="server" Visible="False"></asp:Label><asp:customvalidator id=cv_department runat="server" ControlToValidate="txt_department" ErrorMessage="cv_department"></asp:CustomValidator></TD></TR>
                    <tr>
                      <td vAlign=top>部門編碼</TD>
                      <TD><asp:textbox id=txt_abbr runat="server"></asp:textbox></TD></TR>
                    <TR>
                      <TD>主管部門</TD>
                      <td><asp:dropdownlist id=ddl_parentdepartment runat="server"></asp:DropDownList><asp:label id=lab_parentmentid Runat="server" Visible="False"></asp:Label></TD></TR>
                    <TR>
                      <TD colSpan=2><asp:button id=btn_save runat="server" Text="新增保存"></asp:button><asp:label id=lab_edit_mode Runat="server" Visible="False">ADD</asp:Label></TD></TR>
                    <tr>
                      <td vAlign=top colSpan=2><asp:datagrid id=dgdpartment runat="server" AutoGenerateColumns="False">
																	<Columns>
																		<asp:BoundColumn DataField="DepartMentId" ReadOnly="True" HeaderText="編號"></asp:BoundColumn>
																		<asp:TemplateColumn HeaderText="部門名">
																			<ItemTemplate>
																				<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DepartmentName") %>'>
																				</asp:Label>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:TextBox id=dg_txt_name runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DepartmentName") %>'>
																				</asp:TextBox>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="部門編碼">
																			<ItemTemplate>
																				<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DepartAbbr") %>'>
																				</asp:Label>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:TextBox id="dg_txt_abbr" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DepartAbbr") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
																		<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;&gt;刪除&lt;/div&gt;" HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
																	</Columns>
																</asp:datagrid></TD></TR></TABLE></TD></TR></TABLE>
            <table borderColor=#000660 borderColorDark=#000066 width="100%" 
            align=center borderColorLight=#000066 border=1 
              >
              <TR vAlign=middle>
                <TD width="15%" height=28>
                  <DIV align=center><B>提示 
                  <DIV align=center><B></B></DIV></B></DIV></TD>
                <TD class=msg width="85%">&nbsp;&nbsp; 
<asp:label id=Label_Message runat="server" ForeColor="Red"></asp:label></TD></TR></TABLE></TD></TR></TABLE></TD></TR></TBODY></TABLE><br><br></FORM></TD></TR></TBODY></TABLE>
	</body>
</HTML>
