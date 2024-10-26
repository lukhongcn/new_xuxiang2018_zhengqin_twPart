<%@ Page language="c#" Codebehind="ElectrodeEditOthers.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ElectrodeEditOthers" smartNavigation="True" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="ElectrodeHeader" Src="controls/ElectrodeHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>電機設定</title>
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
						<TD vAlign="top" width="79%"><uc1:ElectrodeHeader id="PartHeader" runat="server"></uc1:ElectrodeHeader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										<TD width="10%">模具編號</TD>
										<TD width="40%"><asp:label id="Label_ModuleId" runat="server"></asp:label></TD><td>零件名稱</td><td><asp:TextBox id="txt_partName" runat="server"></asp:TextBox></td>
									</TR>
									<tr><td>零件大類</td>
						
										<td>
											<asp:DropDownList id="dpl_parttype1" runat="server" AutoPostBack="True"></asp:DropDownList></td><td>零件小類</td>
											<td>
											<asp:DropDownList id="dpl_parttype2" runat="server"></asp:DropDownList>
											</td></tr>
									<TR>
										<TD>零件編號</TD>
										<TD><asp:label id="Label_PartNo" runat="server"></asp:label></TD>
										<TD>材質</TD>
										<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD>減寸(粗)</TD>
										<TD>
											<asp:textbox id="TextBox_JianCun1" runat="server"></asp:textbox></TD>
										<TD>數量(粗)</TD>
										<TD>
											<asp:textbox id="TextBox_Count1" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>減寸(精)</TD>
										<TD>
											<asp:textbox id="TextBox_JianCun2" runat="server"></asp:textbox></TD>
										<TD>數量(精)</TD>
										<TD>
											<asp:textbox id="TextBox_Count2" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>注意點</TD>
										<TD><asp:textbox id="TextBox_Comment" runat="server"></asp:textbox></TD>
										<TD>等級設定</TD>
										<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD>最少需要數量/個</TD>
										<TD>
											<asp:TextBox id="TextBox_LeastCount" runat="server"></asp:TextBox></TD>
										<TD>&nbsp;</TD>
										<TD>&nbsp;</TD>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="edit"></asp:button><br>
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
										<asp:label id="Label_Message" runat="server" ForeColor="red" Font-Bold="True"></asp:label>
										<asp:label id="Label_HiddenCount1" runat="server" Visible="False"></asp:label>
										<asp:label id="Label_HiddenCount2" runat="server" Visible="False"></asp:label>
									</TD>
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
