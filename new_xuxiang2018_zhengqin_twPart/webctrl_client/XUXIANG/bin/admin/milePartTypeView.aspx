<%@ Page language="c#" Codebehind="milePartTypeView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.milePartTypeView" %>
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
										<div align="left">零件類別設定</FONT></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top" borderColorLight="#ccccff" borderColorDark="#cccccc"><asp:panel id="pan_treeview" runat="server"></asp:panel></td>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td style="HEIGHT: 24px"><asp:label id="lab_Name" runat="server" Text="零件名稱"></asp:label></td>
												<td style="HEIGHT: 24px"><asp:textbox id="txt_Name" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 21px"><asp:label id="lab_PartSort" runat="server" Text="零件類別" Visible="False"></asp:label></td>
												<td style="HEIGHT: 21px"><asp:DropDownList id="dpl_PartSort" runat="server" Visible="False">
														<asp:ListItem Value="sort1">零件類別1</asp:ListItem>
														<asp:ListItem Value="sort2">零件類別2</asp:ListItem>
														<asp:ListItem Value="sort3">零件類別3</asp:ListItem>
														<asp:ListItem Value="sort4">零件類別4</asp:ListItem>
														<asp:ListItem Value="sort5">零件類別5</asp:ListItem>
													</asp:DropDownList></td>
											</tr>
											<tr>
												<td style="HEIGHT: 21px"><asp:label id="lab_ParentId" runat="server" Text="父類"></asp:label></td>
												<td style="HEIGHT: 21px"><FONT face="新細明體">
														<asp:DropDownList id="dpl_ParentId" runat="server"></asp:DropDownList></FONT></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_PartType" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="Id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Name">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Name" runat="server">零件類名</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Name" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ParentId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ParentId" runat="server">父類</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ParentId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ParentId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ParentId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ParentId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="編輯" HeaderText="編輯" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確認刪除嗎')&quot;>刪除</div>" HeaderText="刪除"
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
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="Red"></asp:label></TD>
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
