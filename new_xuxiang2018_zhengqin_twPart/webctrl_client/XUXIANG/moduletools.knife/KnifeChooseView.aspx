<%@ Page language="c#" Codebehind="KnifeChooseView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.KnifeChooseView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="KnifeChooseHeader" Src="controls/KnifeChooseHeader.ascx" %>
<%@ Register TagPrefix="webview1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
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
						<TD vAlign="top" width="79%"><uc1:knifechooseheader id="KnifeChooseHeader" runat="server"></uc1:knifechooseheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td><asp:label id="lab_productNo" runat="server" Text="�u�O�渹"></asp:label></td>
												<td><asp:textbox id="txt_productNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_processId" runat="server" Text="�[�u�u��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_processId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_customerId" runat="server" Text="�Ȥ�s��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_customerId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td><asp:label id="lab_moduleId" runat="server" Text="�Ҩ�s��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_moduleId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_partId" runat="server" Text="�s��s��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_partId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td><asp:label id="lab_partNoId" runat="server" Text="�s��l�s��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_partNoId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_machineId" runat="server" Text="�X�x�s��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_machineId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_factStartDate" runat="server" Text="��ڶ}�u��"></asp:label></td>
												<td><wc:inputcalendar id="txt_factStartDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_factEndDate" runat="server" Text="��ڵ�����"></asp:label></td>
												<td><wc:inputcalendar id="txt_factEndDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_expectedStartDate" runat="server" Text="�w�p�}�u��"></asp:label></td>
												<td><wc:inputcalendar id="txt_expectedStartDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_expectedEndDate" runat="server" Text="�w�p���u��"></asp:label></td>
												<td><wc:inputcalendar id="txt_expectedEndDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td colSpan="4"></td>
											</tr>
											<tr>
												<TD colSpan="4"><asp:button id="btn_displayDetail" runat="server" Text="�M�����"></asp:button></TD>
											</tr>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top"><asp:panel id="pan_KnifeChooseDetail" Visible="False" Runat="server">
											<TABLE width="100%" align="center" border="0">
												<TR>
													<TD>
														<asp:label id="lab_programNo" runat="server" Text="�{���s��"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_programNo" runat="server"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_knifeId" runat="server" Text="�M��s��"></asp:label></TD>
													<TD>
														<asp:dropdownlist id="dpl_knifeId" runat="server"></asp:dropdownlist></TD>
												</TR>
												<TR>
													<TD>
														<asp:label id="lab_expectedLength" runat="server" Text="�w�p�[�u����"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_expectedLength" runat="server"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_zrax" runat="server" Text="Z�b�i��"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_zrax" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:label id="lab_xyrax" runat="server" Text="XY�b�i��"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_xyrax" runat="server"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_preserveredLength" runat="server" Text="�w�d�q"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_preserveredLength" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:label id="lab_doMethod" runat="server" Text="�[�u�Ҧ�"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_doMethod" runat="server"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_mainSpeed" runat="server" Text="�D�b��t"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_mainSpeed" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:label id="lab_processRate" runat="server" Text="�i���v"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_processRate" runat="server"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_comment_detail" runat="server" Text="�Ƶ�"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_comment_detail" runat="server"></asp:textbox></TD>
												</TR>
												<TR>
													<TD colSpan="4">
														<asp:button id="btn_add_detail" runat="server" Text="�O�s"></asp:button></TD>
												</TR>
												<TR>
													<TD colSpan="4">
														<webview1:dgSelf id="dg_KnifeChooseDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
															<HEADERSTYLE HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HEADERSTYLE>
															<COLUMNS>
																<ASP:TEMPLATECOLUMN HeaderText="programNo">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_programNo" runat="server">�{���s��</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_programNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProgramNo")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_programNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.programNo") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="knifeId">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_knifeId" runat="server">�M��s��</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_knifeId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.KnifeId")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_knifeId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.knifeId") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="expectedLength">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_expectedLength" runat="server">�w�p�[�u����</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_expectedLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedLength")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_expectedLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedLength") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="zrax">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_zrax" runat="server">Z�b�i��</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_zrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Zrax")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_zrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.zrax") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="xyrax">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_xyrax" runat="server">XY�b�i��</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_xyrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Xyrax")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_xyrax runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.xyrax") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="preserveredLength">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_preserveredLength" runat="server">�w�d�q</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_preserveredLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PreserveredLength")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_preserveredLength runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.preserveredLength") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="doMethod">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_doMethod" runat="server">�[�u�Ҧ�</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_doMethod runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.DoMethod")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_doMethod runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.doMethod") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="mainSpeed">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_mainSpeed" runat="server">�D�b��t</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_mainSpeed runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MainSpeed")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_mainSpeed runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.mainSpeed") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="processRate">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_processRate" runat="server">�i���v</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_processRate runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessRate")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_processRate runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processRate") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:TEMPLATECOLUMN HeaderText="comment">
																	<HEADERTEMPLATE>
																		<asp:Label id="dg_header_comment" runat="server">�Ƶ�</asp:Label>
																	</HEADERTEMPLATE>
																	<ITEMTEMPLATE>&nbsp; 
<asp:Label id=dg_lab_comment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'>
																		</asp:Label></ITEMTEMPLATE>
																	<EDITITEMTEMPLATE>
																		<asp:textbox id=dg_txt_comment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>' Width="40">
																		</asp:textbox>
																	</EDITITEMTEMPLATE>
																</ASP:TEMPLATECOLUMN>
																<ASP:EDITCOMMANDCOLUMN HeaderText="�s��" ButtonType="LinkButton" UpdateText="��s" EditText="�s��"></ASP:EDITCOMMANDCOLUMN>
																<ASP:BUTTONCOLUMN Text="<div onclick=&quot;javascript:return confirm('�O�_�R��')&quot;>�R��</div>" HeaderText="�ʧ@"
																	CommandName="Delete"></ASP:BUTTONCOLUMN>
															</COLUMNS>
														</webview1:dgSelf></TD>
												</TR>
												<TR>
													<TD colSpan="4">
														<asp:label id="func" runat="server" Visible="False" Text=""></asp:label>
														<asp:button id="btn_add_edit" runat="server" Text="�O�s����"></asp:button></TD>
												</TR>
											</TABLE>
										</asp:panel></td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
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
							</table>
						</TD>
					</tr>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
		</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
