<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="xuxiangOrderDesignView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangOrderDesignView" %>
<%@ Register TagPrefix="uc1" TagName="xuxiangOrderDesignHeader" Src="controls/xuxiangOrderDesignHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�q��]�w</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
	function selectImage()
	{
		window.open("../UploadImage.aspx","UploadImage","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
	}
		</script>
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
							<TD vAlign="top" width="79%"><uc1:xuxiangorderdesignheader id="xuxiangOrderHeader" runat="server"></uc1:xuxiangorderdesignheader><BR>
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
									<TBODY>
										<tr>
											<td colSpan="4"><b>�ж�g�p�U�H��</b>
												<asp:label id="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" Visible="False" ForeColor="Red"></asp:label></td>
										</tr>
										<tr>
											<td><asp:label id="lab_referencePictureDate" runat="server" Text="������"></asp:label></td>
											<td><wc:inputcalendar id="txt_referencePictureDate" runat="server"></wc:inputcalendar><FONT color="red">*</FONT></td>
											<TD width="20%">�Ȥ�W��</TD>
											<TD width="30%"><asp:dropdownlist id="dpl_Customer" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
										</tr>
										<TR>
											<TD width="20%"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></TD>
											<TD width="30%"><font color="red">
													<asp:dropdownlist id="dpl_isPart" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="txt_moduleid" runat="server"></asp:textbox></font><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ErrorMessage="�п�J�Ҩ�s��" ControlToValidate="txt_moduleid"></asp:requiredfieldvalidator></TD>
											<td><asp:label id="lab_price" runat="server" Text="���p����"></asp:label></td>
											<td><asp:textbox id="txt_price" runat="server"></asp:textbox></td>
										</TR>
										<TR>
											<TD>�Ҩ㪬�A</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Status" runat="server"></asp:dropdownlist><FONT color="red">*</FONT></TD>
											<TD>�q��O</TD>
											<TD><asp:dropdownlist id="dpl_ProductTypeList" runat="server"></asp:dropdownlist><font color="red"></font></TD>
										</TR>
										<TR>
											<TD>�Ҩ�W��</TD>
											<TD><asp:textbox id="txt_productname" runat="server"></asp:textbox><font color="red"></font></TD>
											<td style="HEIGHT: 24px"><asp:label id="lab_lastPictureDate" runat="server" Text="�X�u�ժ�"></asp:label></td>
											<td style="HEIGHT: 24px"><asp:textbox id="txt_lockManager" runat="server"></asp:textbox></td>
										</TR>
										<tr>
											<td style="HEIGHT: 24px">�ǰt�]��</td>
											<td style="HEIGHT: 24px"><asp:textbox id="txt_equipMent" Runat="server"></asp:textbox></td>
											<td>�޼�</td>
											<td><asp:textbox id="txt_hole" Runat="server"></asp:textbox></td>
										</tr>
										<tr>
											<td><FONT face="�s�ө���">�_�l���</FONT></td>
											<td>
												<wc:inputcalendar id="txt_startDate" runat="server"></wc:inputcalendar></td>
											<td>���Y�v</td>
											<td><asp:textbox id="txt_extractRate" Runat="server"></asp:textbox></td>
										</tr>
										<tr>
											<td><FONT face="�s�ө���">
													<asp:label id="lab_companyProductId" runat="server" Text="���q�Ƹ�"></asp:label></FONT></td>
											<td>
												<asp:textbox id="txt_companyProductId" runat="server"></asp:textbox></td>
											<TD style="HEIGHT: 18px">����</TD>
											<TD style="HEIGHT: 18px"><asp:dropdownlist id="dpl_material" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
										</tr>
										<tr>
											<td style="HEIGHT: 18px"><FONT face="�s�ө���">
													<asp:label id="lab_hasPrice" runat="server" Text="���S�P�_"></asp:label></FONT></td>
											<td style="HEIGHT: 18px">
												<asp:dropdownlist id="dpl_hasprice" runat="server">
													<asp:ListItem Value="0">�L�S</asp:ListItem>
													<asp:ListItem Value="1">���S</asp:ListItem>
												</asp:dropdownlist></td>
											<td><asp:label id="lab_customerModuleId" runat="server" Text="�Ȥ�ϸ�"></asp:label></td>
											<td><FONT face="�s�ө���"><asp:textbox id="txt_customerModuleId" runat="server"></asp:textbox></FONT></td>
										</tr>
										<tr>
											<td><FONT face="�s�ө���">
													<asp:label id="lab_tryPrice" runat="server" Text="�ռ˦X���"></asp:label></FONT></td>
											<td>
												<asp:textbox id="txt_tryPrice" runat="server"></asp:textbox></td>
											<td style="HEIGHT: 22px"><asp:label id="lab_signPrice" runat="server" Text="ñ����"></asp:label></td>
											<td style="HEIGHT: 22px"><FONT face="�s�ө���"><asp:textbox id="txt_signPrice" runat="server"></asp:textbox></FONT></td>
										</tr>
										<TR>
											<td style="HEIGHT: 22px">
												<asp:label id="lab_designEndDate" Text="�]�p�I���" Runat="server"></asp:label></td>
											<td style="HEIGHT: 22px">
												<wc:inputcalendar id="txt_designEndDate" runat="server"></wc:inputcalendar></td>
											<td><asp:label id="lab_ton" runat="server" Text="���~�Ƹ�"></asp:label></td>
											<td><asp:textbox id="txt_ton" runat="server"></asp:textbox></td>
										</TR>
										<tr>
											<td><asp:label id="lab_tryDate0" runat="server" Text="TryDate0">�w�w��f��(T0)</asp:label></td>
											<td><wc:inputcalendar id="txt_tryDate0" runat="server"></wc:inputcalendar><FONT color="red">*</FONT></td>
											<td><FONT face="�s�ө���"><FONT face="�s�ө���">
														<asp:label id="lab_tryDate1" runat="server" Text="TryDate1" Width="16px">T1</asp:label></FONT></FONT></td>
											<td><FONT face="�s�ө���">
													<wc:inputcalendar id="txt_tryDate1" runat="server"></wc:inputcalendar></FONT></td>
										</tr>
										<tr>
											<td><FONT face="�s�ө���"><asp:label id="lab_tryDate2" runat="server" Text="TryDate2">T2</asp:label></FONT></td>
											<td><wc:inputcalendar id="txt_tryDate2" runat="server"></wc:inputcalendar></td>
											<td>T3</td>
											<td><wc:inputcalendar id="txt_T3" runat="server"></wc:inputcalendar></td>
										</tr>
										<tr>
											<td><FONT face="�s�ө���">
													<asp:label id="lab_tryDateF" runat="server" Text="���ռҨ��Ƥ��"></asp:label></FONT></td>
											<td>
												<wc:inputcalendar id="txt_tryDateF" runat="server"></wc:inputcalendar></td>
											<td><asp:label id="lab_tryDate3" runat="server" Text="TryDate3">��ڥ�f��</asp:label></td>
											<td><wc:inputcalendar id="txt_tryDate3" runat="server"></wc:inputcalendar><FONT color="red">*</FONT></td>
										</tr>
										<tr>
											<td>�̲׹ϭ���m</td>
											<td>
												<asp:textbox id="TextBox_Picture" runat="server"></asp:textbox><FONT color="red">*</FONT></td>
											<td><asp:label id="lab_YingYeDanDang" runat="server" Text="���حt�d�H">���حt�d�H</asp:label></td>
											<td><asp:textbox id="txt_YingYeDanDang" runat="server"></asp:textbox></td>
										</tr>
										<tr>
											<td><FONT face="�s�ө���">
													<asp:label id="lab_checker" runat="server" Text="�f�֤H"></asp:label></FONT></td>
											<td><FONT face="�s�ө���">
													<asp:textbox id="txt_checker" runat="server"></asp:textbox><FONT color="red">*</FONT></FONT></td>
											<td><asp:label id="lab_creater" runat="server" Text="���H"></asp:label></td>
											<td><asp:textbox id="txt_creater" runat="server"></asp:textbox><FONT color="red">*</FONT></td>
										</tr>
										<tr>
											<td>
												<asp:label id="lab_checkDate" runat="server" Text="�f�֤��"></asp:label></td>
											<td><FONT face="�s�ө���">
													<wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar><FONT color="red">*</FONT></FONT></td>
										</tr>
										<tr>
											<td>�Ƶ�</td>
											<td colSpan="3"><asp:textbox id="txt_comment" runat="server" Width="600"></asp:textbox></td>
										</tr>
									</TBODY>
								</TABLE>
								<asp:button id="Button_AddEdit" runat="server" Text="�O�s"></asp:button><asp:label id="func" runat="server" Visible="False"></asp:label><br>
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
