<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="milePartDesignAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.PartDesignAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="PartDesign" Src="controls/PartDesign.ascx" %>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>�Ҩ�޳N�}�o</title>
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
						<TD vAlign="top" width="79%"><uc1:partdesign id="partdesign" runat="server"></uc1:partdesign><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="4"><asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenPartNo" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenSelectRow" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_CustomerId" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<TD>�Ȥ�W��</TD>
										<TD><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
										<TD>�Ҩ�s��</TD>
										<TD><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox_ModuleList"
												ErrorMessage="�п�ܦ��Ī��Ҩ�s��"></asp:requiredfieldvalidator></TD>
										<TD>�]�p���O</TD>
										<TD><asp:dropdownlist id="Dropdownlist_designtype" Runat="server">
												<asp:ListItem Value="�]�p���">�]�p���</asp:ListItem>
												<asp:ListItem Value="���f">���f</asp:ListItem>
												<asp:ListItem Value="�X��">�X��</asp:ListItem>
												<asp:ListItem Value="����">����</asp:ListItem>
											</asp:dropdownlist></TD>
									</TR>
									<tr>
										<td>���~�W��</td>
										<td><asp:label id="lab_productName" Runat="server"></asp:label></td>
										<td><FONT face="�s�ө���">�ǰt�]��</FONT></td>
										<td><FONT face="�s�ө���">
												<asp:label id="lab_equipMent" Runat="server"></asp:label></FONT></td>
										<td style="HEIGHT: 21px"><FONT face="�s�ө���">�޼�</FONT></td>
										<td style="HEIGHT: 21px">
											<asp:label id="lab_hole" Runat="server"></asp:label></td>
									</tr>
									<tr>
										<td style="HEIGHT: 21px"><FONT face="�s�ө���">����</FONT></td>
										<td style="HEIGHT: 21px"><FONT face="�s�ө���">
												<asp:label id="lab_material" Runat="server"></asp:label></FONT></td>
										<td><FONT face="�s�ө���">���Y�v</FONT></td>
										<td><FONT face="�s�ө���">
												<asp:label id="lab_extractRate" Runat="server"></asp:label></FONT></td>
										<td><FONT face="�s�ө���">�_�l���</FONT></td>
										<td>
											<asp:label id="lab_startDate" Runat="server"></asp:label></td>
									</tr>
									<tr>
										<td><FONT face="�s�ө���">���حt�d�H</FONT></td>
										<td>
											<asp:label id="lab_YingYeDanDang" Runat="server"></asp:label></td>
										<td><FONT face="�s�ө���"></FONT></td>
										<td>
											<asp:textbox id="txt_partName" runat="server" Visible="False"></asp:textbox></td>
										<td><FONT face="�s�ө���"></FONT></td>
										<td></td>
									</tr>
									<tr>
										<td>�Ϥ�</td>
										<td align="center" colSpan="5"><asp:image id="img" Runat="server"></asp:image></td>
									</tr>
									<TR>
										<TD>�]�p���e�]�w</TD>
										<TD colSpan="5">
											<table id="tableSetting" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<td vAlign="top"><font color="red">��ܩһݳ]�p���e</font>
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
																<asp:ButtonColumn Text="�W��" ButtonType="PushButton" HeaderText="�\��" CommandName="Upper" Visible=False></asp:ButtonColumn>
																<asp:ButtonColumn Text="�U��" ButtonType="PushButton" CommandName="Lower" Visible=False></asp:ButtonColumn>
																<asp:ButtonColumn Text="�R��" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
																<asp:TemplateColumn Visible=False>
																	<ItemTemplate>
																		<asp:Label ID="dg_lab_statusid" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.StatusId") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn Visible=False>
																	<ItemTemplate>
																		<asp:Label ID="dg_lab_processno" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.ProcessNo") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
															</Columns>
														</asp:datagrid></td>
												</tr>
											</table>
										</TD>
									</TR>
									<TR>
										<TD>����</TD>
										<td colSpan="5"><TEXTAREA id="Text_Comments" name="Text_Comments" rows="2" cols="100" runat="server"></TEXTAREA>
										</td>
									</TR>
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
