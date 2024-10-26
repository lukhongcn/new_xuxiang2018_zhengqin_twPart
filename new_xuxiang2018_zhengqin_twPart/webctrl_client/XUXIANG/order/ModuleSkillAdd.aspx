<%@ Page language="c#" Codebehind="ModuleSkillAdd.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModuleSkill" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ModuleSkillHeader" Src="controls/ModuleSkillHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>客戶技術資料</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript" src="js/lib.js"></script>
		<LINK href="../css/common.css" rel="stylesheet">
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
							<TD vAlign="top" width="79%"><uc1:ModuleSkillHeader id="ModuleSkillHeader" runat="server"></uc1:ModuleSkillHeader><BR>
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
									<TBODY>
										<tr>
											<td colSpan="4"><b>請填寫如下信息</b>
												<asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
										</tr>
										<TR>
											<td>客戶編號</td>
											<td><asp:DropDownList ID="dpl_customerid" Runat="server" AutoPostBack="True"></asp:DropDownList></td>
											<TD>模具編號</TD>
											<TD align="left"><asp:dropdownlist id="dpl_moduleid" runat="server" AutoPostBack="False"></asp:dropdownlist><font color="red">*</font></TD>
										</TR>
									</TBODY>
								</TABLE>
								<table>
									<tr>
										<td vAlign="top">資料匯入：</td>
										<td><asp:textbox id="txt_content" runat="server" Width="688px" Height="200px" TextMode="MultiLine"
												Wrap="False"></asp:textbox></td>
									</tr>
								</table>
								<asp:button id="Button_AddEdit" runat="server" Text="保存"></asp:button>
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
