<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="OrderAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderAddEdit" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�q��]�w</title>
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
							<TD vAlign="top" width="79%"><uc1:orderheader id="OrderHeader" runat="server"></uc1:orderheader><BR>
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
									<TBODY>
										<tr>
											<td colSpan="4"><b>�ж�g�p�U�H��</b>
												<asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
										</tr>
										<TR>
											<TD width="20%">�Ȥ�s��</TD>
											<TD width="30%"><asp:dropdownlist id="Dropdownlist_Customer" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
											<TD width="20%">�Ҩ�s��</TD>
											<TD width="30%"><font color="red">*
													<asp:textbox id="txt_moduleid" runat="server"></asp:textbox></font><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txt_moduleid" ErrorMessage="�п�ܦ��Ī��Ҩ�s��"></asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>�Ƶ�</TD>
											<TD><font color="red"><asp:textbox id="txt_DanDangZhe" runat="server"></asp:textbox></font></TD>
											<TD>���~�s��</TD>
											<TD><asp:textbox id="TextBox_ProcductId" runat="server"></asp:textbox><font color="red"></font></TD>
										</TR>
										<TR>
											<TD>���~����</TD>
											<TD><asp:dropdownlist id="ListBox_ProductTypeList" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
											<TD>���~�W��</TD>
											<TD><asp:textbox id="TextBox_ProductName" runat="server"></asp:textbox><font color="red">*</font><asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" ControlToValidate="TextBox_ProductName"
													ErrorMessage="�п�J���~�W��"></asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>����</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
											<TD>�Ҩ�����</TD>
											<TD><asp:dropdownlist id="dpl_moduletype" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
										</TR>
										<TR>
											<TD>�̲׹ϭ���m</FONT></TD>
											<TD><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox><font color="red">*</font><INPUT onclick="javascript:selectImage();" type="button" value="�W��"><asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ControlToValidate="TextBox_Picture"
													ErrorMessage="�п�ܹϤ�"></asp:requiredfieldvalidator></TD>
											<TD>�޼�</TD>
											<TD><asp:textbox id="TextBox_Holes" runat="server"></asp:textbox><font color="red">*</font><asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ControlToValidate="TextBox_Holes" ErrorMessage="�п�J�޼�"></asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>�Ѧҹϭ����</TD>
											<TD><wc:inputcalendar id="TextBox_ReferencePictureDate" runat="server"></wc:inputcalendar></TD>
											<TD>�̲׹ϭ����</TD>
											<TD><wc:inputcalendar id="TextBox_FinishPictureDate" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>���u���</TD>
											<TD><wc:inputcalendar id="TextBox_TryDate0" runat="server"></wc:inputcalendar></TD>
											<TD>�e�ˤ��</TD>
											<TD><wc:inputcalendar id="TextBox_TryDate3" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>������</TD>
											<TD><wc:inputcalendar id="TextBox_TryDateF" runat="server"></wc:inputcalendar></TD>
											<TD>�Ҩ㪬�A</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Status" runat="server"></asp:dropdownlist></TD>
										</TR>
										<TR>
											<TD>�t�d�s��</TD>
											<TD><asp:dropdownlist id="ListBox_UserGroupList" runat="server"></asp:dropdownlist></TD>
											<TD>�u������</TD>
											<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
										</TR>
										<TR>
											<TD>CAD�]�p</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Design_Day" runat="server"></asp:dropdownlist>��
												<asp:dropdownlist id="Dropdownlist_Design_Hour" runat="server"></asp:dropdownlist>�p��
												<asp:dropdownlist id="Dropdownlist_Design_Minute" runat="server"></asp:dropdownlist>��
											</TD>
											<TD>�ե�</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Assemble_Day" runat="server"></asp:dropdownlist>��
												<asp:dropdownlist id="Dropdownlist_Assemble_Hour" runat="server"></asp:dropdownlist>�p��
												<asp:dropdownlist id="Dropdownlist_Assemble_Minute" runat="server"></asp:dropdownlist>��
											</TD>
										</TR>
										<TR>
											<TD>�ƫe�˰Q�|���</TD>
											<TD><wc:inputcalendar id="TextBox_Review" runat="server"></wc:inputcalendar></TD>
											<TD>�򥻹ϥX�Ϥ��</TD>
											<TD><wc:inputcalendar id="TextBox_BasicTool" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>3D���ɥX�Ϥ��</TD>
											<TD><wc:inputcalendar id="TextBox_3DMTool" runat="server"></wc:inputcalendar></TD>
											<TD>�Ҥ��ϥX�Ϥ��</TD>
											<TD><wc:inputcalendar id="TextBox_MainParts" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>�s��ϥX�Ϥ��</TD>
											<TD><wc:inputcalendar id="TextBox_ToolDraw" runat="server"></wc:inputcalendar></TD>
											<TD>�q���ˬd���</TD>
											<TD><wc:inputcalendar id="TextBox_FlashCheck" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>����D�ʤJ���</TD>
											<TD><wc:inputcalendar id="TextBox_ReJiaoDao" runat="server"></wc:inputcalendar></TD>
											<TD>�Ҭ[�ʤJ���</TD>
											<TD><wc:inputcalendar id="TextBox_Skelection" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>�Ȥ�Ƹ�</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_YingYeDanDang" runat="server"></asp:textbox></font></TD>
											<TD>�u�{�t�d�H</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_GongChengDanDang" runat="server"></asp:textbox></font></TD>
										</TR>
										<TR>
											<TD>�]�p�t�d�H</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_SheJiDanDang" runat="server"></asp:textbox></font></TD>
											<TD>�ե߭t�d�H</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_ZuLiDanDang" runat="server"></asp:textbox></font></TD>
										</TR>
										<tr>
											<td>�wĵ�ɶ�</td>
											<td><asp:dropdownlist id="dpl_alertday" runat="server">
													<asp:ListItem Value="1">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="0">0</asp:ListItem>
												</asp:dropdownlist></td>
											<TD>
												<P>�j�ϸ�</P>
											</TD>
											<TD><asp:textbox id="txt_TotalModuleId" runat="server"></asp:textbox><font color="red"></font></TD>
										</tr>
									</TBODY>
								</TABLE>
								<asp:button id="Button_AddEdit" runat="server" Text="Add"></asp:button><br>
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
