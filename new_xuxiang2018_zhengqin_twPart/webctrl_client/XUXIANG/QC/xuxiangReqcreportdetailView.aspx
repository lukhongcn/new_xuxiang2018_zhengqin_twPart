<%@ Page language="c#" Codebehind="xuxiangReqcreportdetailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangReqcreportdetailView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�s������</title>
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
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">&nbsp;</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Iddetail" runat="server" Text="" Visible="False"></asp:label><asp:label id="lab_QcreportId" runat="server" Text="" Visible="False"></asp:label>
											<asp:label id="lab_partnoid" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_Processid" runat="server" Text="�u�q�O"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Processid" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_Machineid" runat="server" Text="�X�x�s��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Machineid" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_Producter" runat="server" Text="�[�u��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Producter" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_CheckNumber" runat="server" Text="�˴��ƶq"></asp:label></td>
												<td><asp:textbox id="txt_CheckNumber" runat="server">0</asp:textbox></td>
												<td><asp:label id="lab_PartnoOuter" runat="server" Text="�~�["></asp:label></td>
												<td><asp:textbox id="txt_PartnoOuter" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_Checker" runat="server" Text="�˴��H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Checker" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_CheckDate" runat="server" Text="�˴����"></asp:label></td>
												<td><wc:inputcalendar id="txt_CheckDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_CheckMachineNo" runat="server" Text="���q����"></asp:label></td>
												<td><asp:dropdownlist id="dpl_CheckMachineNo" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_StandardSize" runat="server" Text="�Э�"></asp:label></td>
												<td><asp:textbox id="txt_StandardSize" runat="server" AutoPostBack="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Difference" runat="server" Text="���t"></asp:label></td>
												<td><asp:textbox id="txt_Difference" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_FactSize" runat="server" Text="���"></asp:label></td>
												<td><asp:textbox id="txt_FactSize" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_Partcount" runat="server" Text="���"></asp:label></td>
												<td><asp:textbox id="txt_Partcount" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_JudgeId" runat="server" Text="�P�w"></asp:label></td>
												<td><asp:dropdownlist id="dpl_JudgeId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_Judger" runat="server" Text="�P�w�H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Judger" runat="server"></asp:dropdownlist></td>
												<TD colSpan="2"><asp:label id="funcdetail" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_detailedit" runat="server" Text="�O�s"></asp:button></TD>
											</tr>
											<tr>
												<td colSpan="6"><asp:datagrid id="dg_Reqcreportdetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="QcreportId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_QcreportId" runat="server">QcreportId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_QcreportId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.QcreportId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_QcreportId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.QcreportId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Processid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Processid" runat="server">�u�q�O</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Processid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Processid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Machineid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Machineid" runat="server">�X�x�s��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Machineid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Machineid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Machineid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Machineid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Producter">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Producter" runat="server">�[�u��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Producter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Producter")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Producter" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Producter") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CheckNumber">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CheckNumber" runat="server">�˴��ƶq</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CheckNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckNumber")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CheckNumber" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckNumber") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="PartnoOuter">
																<HeaderTemplate>
																	<asp:Label id="dg_header_PartnoOuter" runat="server">�~�[</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_PartnoOuter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartnoOuter")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_PartnoOuter" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartnoOuter") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Checker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Checker" runat="server">�˴��H</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CheckDate" runat="server">�˴����</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CheckMachineNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CheckMachineNo" runat="server">���q����</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CheckMachineNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckMachineNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CheckMachineNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckMachineNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="StandardSize">
																<HeaderTemplate>
																	<asp:Label id="dg_header_StandardSize" runat="server">�Э�</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_StandardSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.StandardSize")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_StandardSize" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.StandardSize") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Difference">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Difference" runat="server">���t</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Difference" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Difference")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Difference" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Difference") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="FactSize">
																<HeaderTemplate>
																	<asp:Label id="dg_header_FactSize" runat="server">���</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_FactSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactSize")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_FactSize" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactSize") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Partcount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Partcount" runat="server">���</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Partcount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partcount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Partcount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partcount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="JudgeId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_JudgeId" runat="server">�P�w</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_JudgeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.JudgeId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_JudgeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.JudgeId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Judger">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Judger" runat="server">�P�w�H</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Judger" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Judger")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Judger" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Judger") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�s��" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�T�{�R���ܡH')&quot;>�R��</div>" HeaderText="�R��"
																CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<br>
												</td>
											</tr>
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
	</body>
</HTML>
