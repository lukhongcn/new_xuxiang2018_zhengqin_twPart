<%@ Page language="c#" Codebehind="ToolView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.ToolView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="ToolHeader" Src="controls/ToolHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
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
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<uc1:ToolHeader id="ToolHeader" runat="server"></uc1:ToolHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label>
											<tr>
												<td><asp:Label ID="lab_toolno" runat="server" Text="toolno">�M��s��</asp:Label></td>
												<td><asp:textbox id="txt_toolno" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_toolname" runat="server" Text="toolname">�M��W��</asp:Label></td>
												<td><asp:textbox id="txt_toolname" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Tolerance" runat="server" Text="Tolerance">�`�|���t</asp:Label></td>
												<td><asp:textbox id="txt_Tolerance" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_EdgeDrive" runat="server" Text="EdgeDrive">�b�|</asp:Label></td>
												<td><asp:textbox id="txt_EdgeDrive" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Edge" runat="server" Text="Edge">�b��</asp:Label></td>
												<td><asp:textbox id="txt_Edge" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Edgefew" runat="server" Text="Edgefew">�b��</asp:Label></td>
												<td><asp:textbox id="txt_Edgefew" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_firstangle" runat="server" Text="firstangle">����</asp:Label></td>
												<td><asp:textbox id="txt_firstangle" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_BingDrive" runat="server" Text="BingDrive">�`�|</asp:Label></td>
												<td><asp:textbox id="txt_BingDrive" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_length" runat="server" Text="length">����</asp:Label></td>
												<td><asp:textbox id="txt_length" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_material" runat="server" Text="material">�Q���d����</asp:Label></td>
												<td><asp:DropDownList id="dpl_material" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_unit" runat="server" Text="unit">���</asp:Label></td>
												<td><asp:DropDownList id="dpl_unit" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_price" runat="server" Text="price">����]��^</asp:Label></td>
												<td><asp:textbox id="txt_price" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_Rangle" runat="server" Text="Rangle">R��</asp:Label></td>
												<td><asp:textbox id="txt_Rangle" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_rcomment" runat="server" Text="rcomment">R���ӰѼ�</asp:Label></td>
												<td><asp:textbox id="txt_rcomment" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_singleangle" runat="server" Text="singleangle">�樤</asp:Label></td>
												<td><asp:textbox id="txt_singleangle" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_TipDrive" runat="server" Text="TipDrive">���ݨ�</asp:Label></td>
												<td><asp:textbox id="txt_TipDrive" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_ReadingDrive" runat="server" Text="ReadingDrive">�j�ݨ�</asp:Label></td>
												<td><asp:textbox id="txt_ReadingDrive" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_RoughDrive" runat="server" Text="RoughDrive">�ʺݮ|</asp:Label></td>
												<td><asp:textbox id="txt_RoughDrive" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_Effectivelong" runat="server" Text="Effectivelong">���Ī�</asp:Label></td>
												<td><asp:textbox id="txt_Effectivelong" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_FirstDrive" runat="server" Text="FirstDrive">���|</asp:Label></td>
												<td><asp:textbox id="txt_FirstDrive" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_UnderfirstDrive" runat="server" Text="UnderfirstDrive">���U�|</asp:Label></td>
												<td><asp:textbox id="txt_UnderfirstDrive" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_ad" runat="server" Text="ad" Visible="False"></asp:Label></td>
												<td><asp:textbox id="txt_ad" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:Label ID="lab_Strength" runat="server" Text="Strength">�j��</asp:Label></td>
												<td><asp:textbox id="txt_Strength" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Hardness" runat="server" Text="Hardness">�w��</asp:Label></td>
												<td><asp:textbox id="txt_Hardness" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_CornerR" runat="server" Text="CornerR">�ݨ�R</asp:Label></td>
												<td><asp:textbox id="txt_CornerR" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Trailguide" runat="server" Text="Trailguide">�޾ɮ|</asp:Label></td>
												<td><asp:textbox id="txt_Trailguide" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Driveguide" runat="server" Text="Driveguide">�޾ɮ|��</asp:Label></td>
												<td><asp:textbox id="txt_Driveguide" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_toolinput" runat="server" Text="toolinput">�M��i�f����</asp:Label></td>
												<td><asp:textbox id="txt_toolinput" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_toolcount" runat="server" Text="toolcount">�M��ƶq</asp:Label></td>
												<td><asp:textbox id="txt_toolcount" runat="server" ReadOnly="True">0</asp:textbox></td>
												<td><asp:Label ID="lab_comment" runat="server" Text="comment">�Ƶ�</asp:Label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
										</table>
										<asp:Button id="btn_Detail" runat="server" Text="���Ӹ��" Enabled="False"></asp:Button>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>���ܫH��</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</table>
						</TD>
					</tr>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
