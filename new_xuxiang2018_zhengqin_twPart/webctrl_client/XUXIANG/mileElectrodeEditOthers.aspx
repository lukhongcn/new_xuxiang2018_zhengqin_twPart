<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="mileElectrodeHeader" Src="controls/mileElectrodeHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="mileElectrodeEditOthers.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.mileElectrodeEditOthers"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>�q���]�w</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<script language="javascript" src="js/lib.js"></script>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:mileelectrodeheader id="mileElectrodeHeader" runat="server"></uc1:mileelectrodeheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										<TD width="10%"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></TD>
										<TD width="40%"><asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
										<td>�q���W��</td>
										<td><asp:textbox id="txt_partName" runat="server"></asp:textbox></td>
									</TR>
									<tr>
										<td>�s�����O</td>
										<td colSpan="3"><asp:button id="Button1" runat="server" Text="���O�d��"></asp:button><asp:textbox id="txt_parttypeid" runat="server" ReadOnly="True">()</asp:textbox><asp:textbox id="txt_name" runat="server" ReadOnly="True">[]</asp:textbox></td>
									</tr>
									<TR>
										<TD>�q���s��</TD>
										<TD><asp:label id="Label_PartNo" runat="server"></asp:label></TD>
										<TD>����</TD>
										<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
									</TR>
									<tr>
										<TD width="10%">�����s��</TD>
										<TD width="40%"><asp:textbox id="txt_RelationPart" runat="server"></asp:textbox><asp:button id="but_part" Text="��ܹs��" Runat="server"></asp:button></TD>
										<TD width="10%">�����u��</TD>
										<TD width="40%"><asp:textbox id="txt_RelationProcessno" runat="server"></asp:textbox><asp:label id="lab_RelationPart" Runat="server" Visible="False"></asp:label><asp:textbox id="lab_OldRelationProcessno" Runat="server" ></asp:textbox><asp:textbox id="lab_OldRelationPart" runat="server" ></asp:textbox><asp:textbox id="txt_relationpartno" runat="server" Visible="true"></asp:textbox></TD>
									</tr>
									<TR>
										<TD>��o(��)</TD>
										<TD><asp:textbox id="TextBox_JianCun1" runat="server"></asp:textbox></TD>
										<TD>�ƶq(��)</TD>
										<TD><asp:textbox id="TextBox_Count1" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>��o(��)</TD>
										<TD><asp:textbox id="TextBox_JianCun2" runat="server"></asp:textbox></TD>
										<TD>�ƶq(��)</TD>
										<TD><asp:textbox id="TextBox_Count2" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>�`�N�I</TD>
										<TD><asp:textbox id="TextBox_Comment" runat="server"></asp:textbox></TD>
										<TD>���ų]�w</TD>
										<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD>�ֻ̤ݭn�ƶq/��</TD>
										<TD><asp:textbox id="TextBox_LeastCount" runat="server"></asp:textbox></TD>
										<TD>&nbsp;</TD>
										<TD>&nbsp;</TD>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="edit"></asp:button><asp:label id="lab_hidden_pagecount" runat="server" Visible="False"></asp:label><asp:label id="lab_hidden_lines" runat="server" Visible="False"></asp:label><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>����</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="red" Font-Bold="True"></asp:label><asp:label id="Label_HiddenCount1" runat="server" Visible="False"></asp:label><asp:label id="Label_HiddenCount2" runat="server" Visible="False"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
