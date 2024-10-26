<%@ Page language="c#" Codebehind="MachineBrokenAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MachineBrokenAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="MachineBrokenHeader" Src="controls/MachineBrokenHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>���x�G�ٳ]�w</title>
<FORUM:STYLE id=Style runat="server"></FORUM:STYLE>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema>
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
    <TD vAlign=top width="79%"><uc1:machinebrokenheader id=MachineBrokenHeader runat="server"></uc1:machinebrokenheader>
      <TABLE id=Table_Condition1 cellSpacing=0 cellPadding=0 width="100%" 
      border=1 runat="server">
        <tr>
          <td colSpan=2><B 
            >�ж�J�H�U�H��</B> <asp:label id=Label_HiddenFuncMode runat="server" Visible="False" ForeColor="Red"></asp:label></TD></TR>
        <tr>
          <td width="20%">��ܤu��</TD>
          <td width="80%"><asp:dropdownlist id=DropDownList_ProcessId AutoPostBack="True" Runat="server"></asp:dropdownlist></TD></TR>
        <TR>
          <TD>���x�s��</TD>
          <TD><asp:dropdownlist id=Dropdownlist_MachineId Runat="server"></asp:dropdownlist><asp:requiredfieldvalidator id=RequiredFieldValidator1 runat="server" ControlToValidate="Dropdownlist_MachineId" ErrorMessage="�п�ܦ��Ī����x�s��"></asp:requiredfieldvalidator></TD></TR>
        <tr>
          <td>�}�l���</TD>
          <td><asp:textbox id=Textbox_StartDate Runat="server" ReadOnly="True"></asp:textbox><asp:linkbutton id=Linkbutton_StartDate runat="server">���</asp:linkbutton><asp:calendar id=Calendar_StartDate runat="server" Visible="False"></asp:calendar></TD></TR>
        <tr>
          <td>�������</TD>
          <td><asp:textbox id=Textbox_EndDate Runat="server" ReadOnly="True"></asp:textbox><asp:linkbutton id=Linkbutton_EndDate runat="server">���</asp:linkbutton><asp:calendar id=Calendar_EndDate runat="server" Visible="False"></asp:calendar></TD></TR>
        <TR>
          <TD>&nbsp;</TD>
          <TD><asp:button id=Button_AddEdit runat="server" Text="Add"></asp:button></TD></TR></TABLE>
      <TABLE id=Table_Condition2 cellSpacing=0 cellPadding=0 width="100%" 
      border=1 runat="server">
        <TR>
          <TD width="20%">�Ҧ����v<br 
            >�T���Ƶ{</TD>
          <TD width="80%">
            <div 
            style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 200px; BORDER-BOTTOM-STYLE: ridge" 
            ><asp:datagrid id=MainDataGrid runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2" CellPadding="2">
												<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
												<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
												<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
													<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��s��ID"></asp:BoundColumn>
													<asp:BoundColumn DataField="MachinId" HeaderText="���x�s��"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessDate" HeaderText="���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessMinute" HeaderText="�Ƶ{�u��"></asp:BoundColumn>
													<asp:BoundColumn DataField="ProcessMinute" HeaderText="���ær�q" Visible="False"></asp:BoundColumn>
													<asp:BoundColumn DataField="BrokenMinutes" HeaderText="���ær�q" Visible="False"></asp:BoundColumn>
													<asp:ButtonColumn Text="�s��" CommandName="Edit"></asp:ButtonColumn>
												</Columns>
											</asp:datagrid>&nbsp;</DIV></TD></TR>
        <tr>
          <TD width="20%">&nbsp;</TD>
          <TD width="80%">
            <TABLE id=TableEdit cellSpacing=0 cellPadding=0 width="100%" 
            border=1 runat="server">
              <TBODY>
              <tr>
                <td colSpan=4><B 
                  >�ж�J�H�U�H���ק����</B> <asp:label id=Label_HiddenIndex runat="server" Visible="False"></asp:label></TD></TR>
              <TR>
                <TD width="20%">�Ҩ�s��</TD>
                <TD width="30%">&nbsp;<asp:label id=Label_ModuleId runat="server"></asp:label></TD>
                <TD width="20%">�s��s��-ID</TD>
                <TD width="30%">&nbsp;<asp:label id=Label_PartNoId runat="server"></asp:label></TD></TR>
              <TR>
                <TD>���x�s��</TD>
                <TD>&nbsp;<asp:label id=Label_MachineId Runat="server"></asp:label></TD>
                <TD>���</TD>
                <TD>&nbsp;<asp:label id=Label_ProcessDate Runat="server"></asp:label></TD></TR>
              <TR>
                <TD>�w�����u��</TD>
                <TD>&nbsp; <asp:dropdownlist id=Dropdownlist_ProcessHour runat="server"></asp:dropdownlist>�p�� 
<asp:dropdownlist id=Dropdownlist_ProcessMinute runat="server"></asp:dropdownlist>�� 
                </TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD></TR>
              <TR>
                <td colSpan=4><asp:button id=Button_ProcessEdit runat="server" Text="�ק�"></asp:button></TD></TR></TBODY></TABLE>&nbsp; 
          </TD></TR>
        <tr>
          <TD width="20%">&nbsp;</TD>
          <TD width="80%">&nbsp;</TD></TR>
        <tr>
          <TD width="20%">&nbsp;</TD>
          <TD width="80%"><asp:button id=Button_Back runat="server" Text="�W�@�B"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;<asp:button id=Button_Submit runat="server" Text="�O�s"></asp:button></TD></TR></TABLE><br 
      >
      <TABLE id=Table3 borderColor=#000660 borderColorDark=#000066 width="100%" 
      align=center borderColorLight=#000066 border=1>
        <TR vAlign=middle>
          <TD width="15%" height=28>
            <DIV align=center><B>
            <DIV align=center><B 
            >����</B></DIV></B></DIV></TD>
          <TD class=msg width="85%">&nbsp;&nbsp; <asp:label id=Label_Message runat="server"></asp:label></TD></TR></TABLE></TD></TR>
  <TR>
    <TD colSpan=3><uc1:footer id=Footer runat="server"></uc1:footer></TD></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
