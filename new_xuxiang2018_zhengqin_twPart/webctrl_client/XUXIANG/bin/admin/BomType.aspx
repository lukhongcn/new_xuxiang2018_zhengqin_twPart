<%@ Page language="c#" Codebehind="BomType.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomType" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
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
										<div align="left">零件大類設定<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
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
												<TD>大類首字符</TD>
												<TD><asp:textbox id="txtBomTypeFlag" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>描述</TD>
												<TD><asp:textbox id="txtBomTypeDescription" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>ERP編碼</TD>
												<TD><asp:textbox id="txt_erpid" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>備註</TD>
												<TD><asp:textbox id="txtBomTypeComment" runat="server"></asp:textbox></TD>
											</TR>
											<tr>
												<td>父類</td>
												<td><asp:dropdownlist id="ddl_parentid" runat="server"></asp:dropdownlist><asp:label id="lab_parentid" runat="server" Visible="False"></asp:label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:button id="Button_AddEdit" runat="server" Text="新增"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2"><asp:datagrid id="BomTypeDataGrid" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:BoundColumn DataField="BomTypeId" ReadOnly="True" HeaderText="大類編碼"></asp:BoundColumn>
															<asp:TemplateColumn HeaderText="大類首字符">
																<ItemTemplate>
																	<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeFlag") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id=txteditBTFlag runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeFlag") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="父類">
																<ItemTemplate>
																	<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartentDescription") %>'>
																	</asp:Label>
																	<asp:Label id="Label6" runat="server" Visible =False Text='<%# DataBinder.Eval(Container, "DataItem.ParentBomTypeId") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:DropDownList ID="bomtype" Runat="server" AutoPostBack="True"></asp:DropDownList>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ERP編碼">
																<ItemTemplate>
																	<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ErpId") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox ID="dg_txt_erpid" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ErpId") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="描述">
																<ItemTemplate>
																	<asp:Label id=Label2 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeDescription") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id=txteditBTD runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeDescription") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="備註">
																<ItemTemplate>
																	<asp:Label id=Label3 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeComment") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id=txteditBTC runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeComment") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;>刪除</div>" HeaderText="動作"
																CommandName="Delete"></asp:ButtonColumn>
														</Columns>
													</asp:datagrid></td>
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
