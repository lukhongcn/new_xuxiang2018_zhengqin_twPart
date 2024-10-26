<%@ Page language="c#" Codebehind="EmailGroupEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.EmailGroupEdit" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="EmailGroupHeader" Src="controls/EmailGroupHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�l��s�պ��@</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%">
							<uc1:EmailGroupHeader id="EmailGroupHeader" runat="server"></uc1:EmailGroupHeader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>�п�ܭn���@���l��s��</B></td>
									</tr>
									<TR>
										<TD width="20%">�l��s�զW��</TD>
										<TD width="80%"><asp:DropDownList ID="drp_emailgrouplist" Runat="server" AutoPostBack="True"></asp:DropDownList></TD>
									</TR>
									<TR>
										<TD>�Τ���</TD>
										<TD>
											<TABLE id="Table4" cellSpacing="1" cellPadding="1" width="100%" border="1">
												<TR>
													<TD vAlign="top" width="40%">
														<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 300px; BORDER-BOTTOM-STYLE: ridge">
															<asp:CheckBoxList id="CheckBoxListUser" runat="server" Width="100%" Height="300"></asp:CheckBoxList>
														</div>
													</TD>
													<TD width="20%" align="center">
														<asp:Button id="ButtonInput" runat="server" Text=">>>"></asp:Button><BR>
														<BR>
														<asp:Button id="ButtonOutput" runat="server" Text="<<<"></asp:Button></TD>
													<TD vAlign="top" width="40%"><font color="red">��ܪ��Τ�C��</font><BR>
														<asp:ListBox id="ListBoxSelectedUser" runat="server" Width="100%" SelectionMode="Multiple" Rows="23"></asp:ListBox></TD>
												</TR>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD>&nbsp;</TD>
										<TD><asp:button id="Button_AddEdit" runat="server" Text="�s��"></asp:button></TD>
									</TR>
								</TBODY>
							</TABLE>
							<br>
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
										<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label></TD>
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