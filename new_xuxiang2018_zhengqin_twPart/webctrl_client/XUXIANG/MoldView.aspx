<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MoldView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MoldView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
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
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">�Ҫ��ɤJ</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<TBODY>
												<tr>
													<td style="HEIGHT: 18px"><asp:label id="lab_customerid" Runat="server"> �Ȥ�s��</asp:label></td>
													<TD><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
													<TD><asp:label id="lab_moduleid" runat="server" Text="moduleid">�Ҩ�s��</asp:label></TD>
													<TD><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="�п�ܦ��Ī��Ҩ�s��" ControlToValidate="ListBox_ModuleList"></asp:requiredfieldvalidator></TD>
													<td><asp:label id="lab_englishname" runat="server" Text="englishname">�^��W��</asp:label></td>
													<td><asp:textbox id="txt_englishname" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td style="HEIGHT: 18px"><asp:label id="lab_chinesename" runat="server" Text="chinesename">����W��</asp:label></td>
													<td style="HEIGHT: 18px"><asp:textbox id="txt_chinesename" runat="server"></asp:textbox></td>
													<td style="HEIGHT: 26px"><asp:label id="lab_long" runat="server" Text="long">��</asp:label></td>
													<td style="HEIGHT: 26px"><asp:textbox id="txt_long" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_Width" runat="server" Text="Width">�e</asp:label></td>
													<td><asp:textbox id="txt_Width" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_Thickness" runat="server" Text="Thickness">�p</asp:label></td>
													<td><asp:textbox id="txt_Thickness" runat="server"></asp:textbox></td>
													<td style="HEIGHT: 23px"><asp:label id="lab_materialId" runat="server" Text="materialId">����</asp:label></td>
													<TD style="HEIGHT: 23px"><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
													<td style="HEIGHT: 23px"><asp:label id="lab_heatmethod" runat="server" Text="heatmethod">���B�z�覡</asp:label></td>
													<td style="HEIGHT: 23px"><asp:textbox id="txt_heatmethod" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td style="HEIGHT: 23px"><asp:label id="lab_kok" runat="server" Text="kok">�ɨ�</asp:label></td>
													<td style="HEIGHT: 23px"><asp:textbox id="txt_kok" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_mcount" runat="server" Text="mcount">�ƶq</asp:label></td>
													<td><asp:textbox id="txt_mcount" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_partno" runat="server" Text="partno">�s��s��</asp:label></td>
													<td><asp:textbox id="txt_partno" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_creattype" runat="server" Text="creattype">�s�@����</asp:label></td>
													<td><asp:textbox id="txt_creattype" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_creatdate" runat="server" Text="creatdate">�s�@���</asp:label></td>
													<td><wc:inputcalendar id="txt_creatdate" runat="server"></wc:inputcalendar></td>
												</tr>
												<TR>
													<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
												</TR>
												<tr>
													<td colSpan="6"><asp:datagrid id="dg_Mold" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn HeaderText="englishname">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_englishname" runat="server">�^��W��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_englishname" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Englishname")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_englishname" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.englishname") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="chinesename">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_chinesename" runat="server">����W��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_chinesename" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Chinesename")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_chinesename" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.chinesename") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="long">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_long" runat="server">��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_long" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Long")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_long" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.long") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="Width">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_Width" runat="server">�e</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_Width" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Width")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_Width" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Width") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="Thickness">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_Thickness" runat="server">�p</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_Thickness" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Thickness")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_Thickness" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Thickness") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="lCushion">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_lCushion" runat="server">���E�q</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_lCushion" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LCushion")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_lCushion" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.lCushion") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="wCushion">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_wCushion" runat="server">�e�E�q</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_wCushion" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.WCushion")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_wCushion" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.wCushion") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="tCushion">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_tCushion" runat="server">�p�E�q</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_tCushion" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TCushion")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_tCushion" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tCushion") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="materialId">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_materialId" runat="server">����</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_materialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialId") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="heatmethod">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_heatmethod" runat="server">���B�z�覡</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_heatmethod" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Heatmethod")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_heatmethod" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.heatmethod") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="kok">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_kok" runat="server">�ɨ�</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_kok" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Kok")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_kok" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.kok") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="mcount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_mcount" runat="server">�ƶq</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_mcount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Mcount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_mcount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.mcount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="partno">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_partno" runat="server">�s��s��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_partno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partno")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_partno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partno") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="creattype">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_creattype" runat="server">�s�@����</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_creattype" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creattype")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_creattype" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.creattype") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="creatdate">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_creatdate" runat="server">�s�@���</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_creatdate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Creatdate","{0:d}")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_creatdate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.creatdate","{0:d}") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�s��" CancelText="����" EditText="�s��"></asp:EditCommandColumn>
																<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�нT�{�O�_�n�R��?')&quot;>�R��</div>"
																	HeaderText="�R��" CommandName="delete"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid>
														<hr style="COLOR: #ccccff">
														<br>
													</td>
												</tr>
											</TBODY>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"></DIV>
										<DIV align="center"><B>���ܫH��</B></DIV>
										</B>
										<DIV></DIV>
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
