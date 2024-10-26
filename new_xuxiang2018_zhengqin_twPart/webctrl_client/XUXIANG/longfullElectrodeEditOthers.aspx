<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="longfullElectrodeHeader" Src="controls/longfullElectrodeHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="longfullElectrodeEditOthers.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.longfullElectrodeEditOthers" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>電極設定</title>
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
						<TD vAlign="top" width="79%"><uc1:longfullElectrodeHeader id="longfullElectrodeHeader" runat="server"></uc1:longfullElectrodeHeader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										<TD width="10%">模具編號</TD>
										<TD width="40%"><asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
										<td>電極名稱</td>
										<td><asp:textbox id="txt_partName" runat="server"></asp:textbox></td>
									</TR>
									<tr>
										<td>零件類別</td>
										<td colspan="3">
											<asp:Button id="Button1" runat="server" Text="類別查詢"></asp:Button>
											<asp:TextBox id="txt_parttypeid" runat="server" ReadOnly="True">()</asp:TextBox>
											<asp:TextBox id="txt_name" runat="server" ReadOnly="True">[]</asp:TextBox></td>
									</tr>
									<TR>
										<TD>電極編號</TD>
										<TD><asp:label id="Label_PartNo" runat="server"></asp:label></TD>
										<TD>材質</TD>
										<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
									</TR>
									<tr>
										<TD width="10%">相關零件</TD>
										<TD width="40%"><asp:dropdownlist id="dpl_RelationPart" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
										<TD width="10%">相關工序</TD>
										<TD width="40%"><asp:dropdownlist id="dpl_RelationProcessno" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
									</tr>
									<TR>
										<TD>火花位(粗公)</TD>
										<TD><asp:textbox id="TextBox_JianCun1" runat="server"></asp:textbox></TD>
										<TD>數量(粗)</TD>
										<TD><asp:textbox id="TextBox_Count1" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>火花位(精公)</TD>
										<TD><asp:textbox id="TextBox_JianCun2" runat="server"></asp:textbox></TD>
										<TD>數量(精)</TD>
										<TD><asp:textbox id="TextBox_Count2" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>火花位(中公)</TD>
										<TD><asp:textbox id="Textbox_JianCun3" runat="server"></asp:textbox></TD>
										<TD>數量(中)</TD>
										<TD><asp:textbox id="Textbox_Count3" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>火花位(三角符號中公)</TD>
										<TD><asp:textbox id="Textbox_JianCun4" runat="server"></asp:textbox></TD>
										<TD>數量(三角符號中)</TD>
										<TD><asp:textbox id="Textbox_Count4" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>注意點</TD>
										<TD><asp:textbox id="TextBox_Comment" runat="server"></asp:textbox></TD>
										<TD>等級設定</TD>
										<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD>最少需要數量/個</TD>
										<TD><asp:textbox id="TextBox_LeastCount" runat="server"></asp:textbox></TD>
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
										<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="red"></asp:label><asp:label id="Label_HiddenCount1" runat="server" Visible="False"></asp:label><asp:label id="Label_HiddenCount2" runat="server" Visible="False"></asp:label>
										<asp:label id="Label_HiddenCount3" runat="server" Visible="False"></asp:label><asp:label id="Label_HiddenCount4" runat="server" Visible="False"></asp:label></TD>
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
