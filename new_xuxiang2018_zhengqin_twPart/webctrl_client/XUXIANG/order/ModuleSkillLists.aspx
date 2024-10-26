<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ModuleSkillHeader" Src="controls/ModuleSkillHeader.ascx" %>
<%@ Page language="c#" Codebehind="ModuleSkillLists.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.ModuleSkill" %>
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
						<TD vAlign="top" width="79%"><uc1:moduleskillheader id="ModuleSkillHeader" runat="server"></uc1:moduleskillheader>
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td align="center" width="20%">
										訂單編號&nbsp;<asp:dropdownlist id="dpl_moduleid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td width="80%">訂單查詢&nbsp;<asp:textbox id="txt_moduleid" Runat="server" Width="300px"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="查詢"></asp:button></td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td colSpan="2"><asp:datagrid id="dg_ModuleSkill" runat="server" Width="100%" AllowPaging="True" CellPadding="2"
														CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="序號">
																<ItemTemplate>
																	<asp:Label id="lbskillno" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.skillno") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "txtskillno" runat="server" ReadOnly=True Text='<%# DataBinder.Eval(Container, "DataItem.skillno") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="模號" Visible="False">
																<ItemTemplate>
																	<asp:Label id="lbModuleID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.moduleid") %>' >
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox ID="txtModuleID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.moduleid") %>' >
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="內容">
																<ItemTemplate>
																	<asp:Label id="lbcontent" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.content") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "txtcontent" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.content") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="項目描述">
																<ItemTemplate>
																	<asp:Label id="lbdescrip" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.moduleDescription") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "txtdescrip" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.moduleDescription") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="客戶要求">
																<ItemTemplate>
																	<asp:Label id = "lbrequir" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.customerRequirement") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "txtrequir" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.customerRequirement") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="注意事項">
																<ItemTemplate>
																	<asp:Label id = "lbcomment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.comment") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id="txtcomment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.comment") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="執行部門">
																<ItemTemplate>
																	<asp:Label id = "lbdept" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.manageDepartment") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "txtdept" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.manageDepartment") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="執行部門確認" Visible="False">
																<ItemTemplate>
																	<asp:Label id="lbmanagerDepChk" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.manageDepartmentCheck") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "managerDepChk" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.manageDepartmentCheck") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="完成後檢驗確認" Visible="False">
																<ItemTemplate>
																	<asp:Label id="lbfinishChk" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.finishCheck") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "finishChk" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.finishCheck") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="項目經理確認" Visible="False">
																<ItemTemplate>
																	<asp:Label id="lbmanagerChk" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.managementCheck") %>'>
																	</asp:Label>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:TextBox id = "managerChk" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.managementCheck") %>'>
																	</asp:TextBox>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:LinkButton id="btndelete" runat="server" Text="&lt;div onclick=&quot;javascript:return &quot;&gt;刪除&lt;/div&gt;"
																		CommandName="Delete" CausesValidation="false"></asp:LinkButton>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False">
																<ItemTemplate>
																	<asp:Label id = "recdid" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.id") %>'>
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
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
