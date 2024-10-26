<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="StandardProductAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.StandardProductAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="StandHeader" Src="controls/StandProductHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>訂單設定</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<P>
				<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TBODY>
						<TR>
							<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
						</TR>
						<TR>
							<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
							<TD width="1%">&nbsp;</TD>
							<TD vAlign="top" width="79%"><uc1:StandHeader id="StandHeader" runat="server"></uc1:StandHeader><BR>
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
									<TBODY>
										<tr>
											<td colSpan="4"><b>請填寫如下信息</b>
												<asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
										</tr>
										<TR>
											<TD width="15%">標準件訂單編號</TD>
											<TD width="35%"><font color="red">
													<asp:TextBox id="txt_standid" runat="server" Width="165px"></asp:TextBox>*<asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txt_standid" ErrorMessage="請輸入標準件編號"></asp:requiredfieldvalidator></font></TD>
											<TD width="15%">標準件名</TD>
											<TD width="35%"><font color="red">
													<asp:DropDownList id="dpl_stand" runat="server"></asp:DropDownList></font></TD>
										</TR>
									</TBODY>
								</TABLE>
								<asp:button id="Button_AddEdit" runat="server" Text="Add"></asp:button><br>
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
											<asp:label id="Label_Message" runat="server"></asp:label></TD>
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
		</P>
	</body>
</HTML>
