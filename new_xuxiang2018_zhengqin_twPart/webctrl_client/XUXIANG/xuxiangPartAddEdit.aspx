<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="xuxiangPartAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangPartAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="xuxiangPartHeader" Src="controls/xuxiangPartHeader.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�s��]�w</title>
		<meta content="False" name="vs_showGrid">
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
						<TD vAlign="top" width="79%"><uc1:xuxiangpartheader id="xuxiangPartHeader" runat="server"></uc1:xuxiangpartheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="4"><asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenPartNo" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenSelectRow" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_CustomerId" runat="server" ForeColor="Red" Visible="False"></asp:label>�u������
											<asp:dropdownlist id="dpl_processtype" runat="server" AutoPostBack="True"></asp:dropdownlist>�зǤu��
											<asp:dropdownlist id="dpl_standprocess" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									</tr>
									<TR>
										<TD width="10%">�Ȥ�s��</TD>
										<TD width="40%"><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
										<td><asp:label id="lab_moduleId" runat="server" Text="�u�O�渹"></asp:label></td>
										<td><asp:dropdownlist id="dpl_moduleId" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
									</TR>
									<tr>
										<td>�Ҩ�s��</td>
										<td><asp:DropDownList ID="dpl_Comment" Runat="server" AutoPostBack="True"></asp:DropDownList></td>
										<td style="HEIGHT: 32px">�s��s��</td>
										<td style="HEIGHT: 32px"><asp:dropdownlist id="dpl_PartNo" AutoPostBack="True" Runat="server"></asp:dropdownlist><asp:label id="Label_HintPartNoName" runat="server"></asp:label><input id="Text_HiddenPartNo" type="hidden" name="Text_HiddenPartNo"></td>
									</tr>
									<tr>
										<TD width="10%"><FONT face="�s�ө���">����</FONT></TD>
										<TD width="40%">&nbsp;<asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
										<TD><FONT face="�s�ө���">�s��W��</FONT></TD>
										<TD><asp:textbox id="txt_partName" runat="server"></asp:textbox></TD>
									</tr>
									<tr>
										<td><FONT face="�s�ө���">�s�����O</FONT></td>
										<td><asp:button id="Button1" runat="server" Text="���O�d��"></asp:button><asp:textbox id="txt_parttypeid" runat="server" ReadOnly="True">()</asp:textbox><asp:textbox id="txt_name" runat="server" ReadOnly="True">[]</asp:textbox></td>
									</tr>
									<tr>
										<TD>�u�ǳ]�w</TD>
										<TD colSpan="3">
											<table id="tableSetting" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<td vAlign="top"><font color="red">��ܩһݤu��</font>
														<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 250px; BORDER-BOTTOM-STYLE: ridge"><asp:checkboxlist id="CheckBoxList_Process" runat="server" AutoPostBack="True"></asp:checkboxlist></div>
													</td>
													<td vAlign="top"><asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%">
															<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:ButtonColumn Text="���" ButtonType="PushButton" CommandName="Select"></asp:ButtonColumn>
																<asp:TemplateColumn HeaderText="�[�u����">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_OrderNo" Text='<%# DataBinder.Eval(Container, "DataItem.ListOrder") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn Visible="False" HeaderText="�u�ǽs��">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessID") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="�u�ǦW��">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_ProcessName" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="��">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="Dropdownlist_Day"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="�p��">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="DropDownList_Hour"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="����">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="Dropdownlist_Minute"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="�p���}�l�ɶ�">
																	<ItemTemplate>
																		<cc1:DatePicker id="txt_startDate" imgDirectory="images/" runat="server" DateType="yyyy-mm-dd"></cc1:DatePicker>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="�p�������ɶ�">
																	<ItemTemplate>
																		<cc1:DatePicker id="txt_endDate" imgDirectory="images/" runat="server" DateType="yyyy-mm-dd"></cc1:DatePicker>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:ButtonColumn Text="�W��" ButtonType="PushButton" HeaderText="�\��" CommandName="Upper"></asp:ButtonColumn>
																<asp:ButtonColumn Text="�U��" ButtonType="PushButton" CommandName="Lower"></asp:ButtonColumn>
																<asp:ButtonColumn Text="�R��" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
															</Columns>
														</asp:datagrid></td>
												</tr>
											</table>
										</TD>
									</tr>
									<TR>
										<TD>�s��ϭ�</TD>
										<TD><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox></TD>
										<TD><FONT face="�s�ө���">�ƶq</FONT></TD>
										<TD><FONT face="�s�ө���"><asp:textbox id="TextBox_PartCount" runat="server"></asp:textbox><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ValidationExpression="[0-9]{1,}"
													ControlToValidate="TextBox_PartCount" ErrorMessage="�п�J�Ʀr����"></asp:regularexpressionvalidator></FONT></TD>
									</TR>
									<TR>
										<TD><FONT face="�s�ө���">���ų]�w</FONT></TD>
										<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
										<TD><FONT face="�s�ө���">�W��</FONT></TD>
										<TD><asp:textbox id="txt_spec" runat="server"></asp:textbox></TD>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="Add"></asp:button><asp:label id="lab_pagecount" Visible="False" Runat="server"></asp:label><asp:label id="lab_search" Visible="False" Runat="server"></asp:label><br>
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
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
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
