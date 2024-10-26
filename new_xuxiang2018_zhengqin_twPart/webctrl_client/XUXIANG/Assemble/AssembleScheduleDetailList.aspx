<%@ Page language="c#" Codebehind="AssembleScheduleDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.AssembleScheduleDetailList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
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
					<tr>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">�ݨD����</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label>
											<tr>
												<td><asp:Label ID="lab_partNo" runat="server" Text="partNo">�s��s��</asp:Label></td>
												<td><asp:DropDownList id="dpl_partNo" runat="server" AutoPostBack="True"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_tuhao" runat="server" Text="tuhao">�ϸ�</asp:Label></td>
												<td><asp:textbox id="txt_tuhao" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_count" runat="server" Text="tuhao">�ݻ�X�ƶq</asp:Label></td>
												<td><asp:textbox id="txt_count" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_fcount" runat="server" Text="tuhao">�w������</asp:Label></td>
												<td><asp:textbox id="txt_fcount" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_wcount" runat="server" Text="tuhao">��������</asp:Label></td>
												<td><asp:textbox id="txt_wcount" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_comment" runat="server" Text="comment">�Ƶ�</asp:Label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_AssembleScheduleId" runat="server" Text="AssembleScheduleId" Visible="False"></asp:Label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_AssembleScheduleDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="Id" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">Id</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partNo" runat="server">�s��s��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="tuhao">
																<HeaderTemplate>
																	<asp:Label id="dg_header_tuhao" runat="server">�ϸ�</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_tuhao" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tuhao")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_tuhao" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.tuhao") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server">�Ƶ�</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="AssembleScheduleId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_AssembleScheduleId" runat="server">AssembleScheduleId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_AssembleScheduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssembleScheduleId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_AssembleScheduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssembleScheduleId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�ʧ@" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�T�w�O�_�R��')&quot;>�R��</div>" HeaderText="�ʧ@"
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
