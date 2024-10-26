<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="UserView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.UserView" %>
<%@ Register TagPrefix="uc1" TagName="UserHeader" Src="controls/UserHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>用戶設定</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<uc1:UserHeader id="UserHeader" runat="server"></uc1:UserHeader>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#000660" cellSpacing="1" borderColorDark="#000066" cellPadding="0"
								width="100%" align="center" borderColorLight="#000066" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<tr>
												<TD>員工編號:</TD>
												<TD><asp:textbox id="txt_username" runat="server"></asp:textbox>
													<asp:CustomValidator id="val_username" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txt_username"></asp:CustomValidator></TD>
												<td valign="top">員工職能</td>
												<td valign="top"><asp:DropDownList id="ddl_department" runat="server"></asp:DropDownList></td>
											</tr>
											<TR>
												<TD>員工姓名</TD>
												<TD><asp:textbox id="txt_name" runat="server"></asp:textbox></TD>
												<TD>員工卡號</TD>
												<TD><asp:textbox id="txt_cardid" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>Email</TD>
												<TD colspan="3"><asp:textbox id="txt_email" runat="server"></asp:textbox></TD>
											</TR>
										</table>
										<table cellSpacing="2" width="100%" border="0">
											<TR>
												<TD colSpan="2"><asp:button id="bt_addUser" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>提示
												<DIV align="center"><B></B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</table>
		</form>
		</TD></TR></TBODY></TABLE>
	</body>
</HTML>
