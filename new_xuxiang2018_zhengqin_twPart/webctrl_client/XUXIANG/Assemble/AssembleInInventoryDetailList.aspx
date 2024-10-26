<%@ Page language="c#" Codebehind="AssembleInInventoryDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.AssembleInInventoryDetailList" %>
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
										<div align="left">�ե߻�w���ة��ӧ@�~</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_partNo" runat="server" Text="partNo">�s��s��</asp:label></td>
												<td><asp:dropdownlist id="dpl_partNo" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_partNoName" runat="server" Text="partNoName" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_partNoName" runat="server" Text="" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_count" runat="server" Text="�ثe��μ�"></asp:label></td>
												<td><asp:textbox id="txt_count" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_partNoid" runat="server" Text="partNoid">�s��p�s��</asp:label></td>
												<td><asp:textbox id="txt_partNoid" runat="server">1</asp:textbox><FONT face="�s�ө���">�п�J"1","1-3","1,4"�Φ�</FONT></td>
											</tr>
											<tr>
												<td><asp:label id="lab_outCount" runat="server" Text="outCount" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_outCount" runat="server" Text="" Visible="False" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="comment">�Ƶ�</asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_AssembleInInventoryId" runat="server" Text="" Visible="False"></asp:label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_AssembleInInventoryDetail" runat="server" CellPadding="2" CellSpacing="2"
														AutoGenerateColumns="False" AllowPaging="True">
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
																	<asp:Label id="dg_header_partNo" runat="server">partNo</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="partNoName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partNoName" runat="server">partNoName</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partNoName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNoName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partNoName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNoName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="outCount" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_outCount" runat="server">outCount</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_outCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outCount") %>'/>
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
															<asp:TemplateColumn HeaderText="partNoid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partNoid" runat="server">�s��p�s��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partNoid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNoid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partNoid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNoid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�ʧ@" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�w�O�_�R��')&quot;&gt;�R��&lt;/div&gt;" HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
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
