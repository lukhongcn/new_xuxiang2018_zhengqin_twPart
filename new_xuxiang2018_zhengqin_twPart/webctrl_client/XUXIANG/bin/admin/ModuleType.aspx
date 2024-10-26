<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ModuleType.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.ModuleType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>零件大類設置</title>
		<LINK href="../css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">模具類型設定</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD>模具類型編號</TD>
												<TD><asp:textbox id="txt_Modeltype" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>模具類型名稱</TD>
												<TD><asp:textbox id="txt_Modelname" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD colSpan="2"><asp:button id="Button_AddEdit" runat="server" Text="新增"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_ModelType" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="TypeId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_TypeId" Text="類型編號" runat="server" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_TypeId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.TypeId")%>' />
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="TypeName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_TypeName" runat="server" Text="類型名稱" />
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label id="dg_lab_TypeName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.TypeName")%>' />
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_TypeName" Width="40" runat="server" Text='<%#  DataBinder.Eval(Container, "DataItem.TypeName") %>' />
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;>刪除</div>" HeaderText="動作"
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
										<DIV align="center"><B>提示
												<DIV align="center"><B></B></DIV>
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
