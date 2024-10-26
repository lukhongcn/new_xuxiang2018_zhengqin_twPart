<%@ Register TagPrefix="uc1" TagName="UserHeader" Src="controls/UserHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Page language="c#" Codebehind="UserEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserEdit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>員工設定</title>
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
							<uc1:UserHeader id="UserHeader" runat="server"></uc1:UserHeader><br>
							<TABLE id="Table4" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td>
										<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<TBODY>
												<tr>
													<td colSpan="4"><B>請填入以下信息</B></td>
												</tr>
												<TR>
													<TD>員工編號</TD>
													<TD><asp:TextBox Runat="server" ID="txb_UserName" /></TD>
													<TD>員工卡號</TD>
													<TD><asp:TextBox Runat="server" ID="txb_CardId" /></TD>
												</TR>
												<TR>
													<TD>員工姓名</TD>
													<TD><asp:TextBox Runat="server" ID="txb_Name" /></TD>
													<td valign="top">員工部門</td>
													<td valign="top"><asp:DropDownList id="ddl_department" runat="server"></asp:DropDownList></td>
												</TR>
												<TR>
													<TD>電子郵件</TD>
													<TD colspan="3"><asp:TextBox Runat="server" ID="txb_Email" /></TD>
												</TR>
												<TR>
													<TD colspan="4"><asp:button id="Button_Edit" runat="server" Text="保存修改"></asp:button>
														<asp:Label id="lab_id" runat="server" Visible="False"></asp:Label>
														<asp:Label id="lab_name" runat="server" Visible="False"></asp:Label></TD>
												</TR>
											</TBODY>
										</TABLE>
									</td>
								</tr>
							</TABLE>
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
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
