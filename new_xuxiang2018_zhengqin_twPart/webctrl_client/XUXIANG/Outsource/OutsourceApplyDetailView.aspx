<%@ Register TagPrefix="uc1" TagName="OutSourceApplyHeader" Src="controls/OutSourceApplyHeader.ascx" %>
<%@ Register TagPrefix="GridSelectCheckBox" Namespace="Utility" Assembly="Utility" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/logisticheader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="OutsourceApplyDetailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutsourceApplyDetailView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�~�]�ӽк޲z</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" name="Form1" method="post" runat="server">
			<FONT face="�s�ө���">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</FONT>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td width="95">�s��Ǹ�
										</td>
										<td><asp:label id="lab_partid" runat="server"></asp:label><asp:label id="lab_id" runat="server" Visible="False"></asp:label></td>
										<td>��M�Ҩ�~�]
										</td>
										<td><asp:checkbox id="chk_moduleall" runat="server"></asp:checkbox></td>
									</tr>
									<TR>
										<TD width="95">�Ҩ�s��</TD>
										<TD width="40%"><asp:label id="lab_module" runat="server"></asp:label></TD>
										<TD width="95">�s��s��</TD>
										<TD width="40%"><asp:label id="lab_partno" runat="server"></asp:label></TD>
									</TR>
									<TR>
										<TD>�~�]�ƶq</TD>
										<TD><asp:label id="lab_outsourcenumber" runat="server"></asp:label></TD>
										<TD>�ݨD���</TD>
										<TD><asp:label id="lab_requiredate" runat="server"></asp:label></TD>
									</TR>
									<TR>
										<TD>���ʳ渹</TD>
										<TD><asp:textbox id="txt_applyMerchindiseNo" runat="server"></asp:textbox></TD>
										<TD>������</TD>
										<TD><asp:textbox id="txt_supply" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>���</TD>
										<TD><asp:textbox id="txt_priceUnitId" runat="server"></asp:textbox></TD>
										<TD>�X�f�渹</TD>
										<TD><asp:textbox id="txt_outProductNo" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD>���ʳ渹</TD>
										<TD colSpan="3"><asp:textbox id="txt_merchindiseNo" runat="server"></asp:textbox></TD>
									</TR>
									<TR>
										<TD colSpan="4"><asp:button id="btn_save" runat="server" Text="�O�s"></asp:button></TD>
									</TR>
								</TBODY></TABLE>
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
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label><asp:label id="lab_deleted" runat="server"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY></TABLE>
		</form>
	</body>
</HTML>
