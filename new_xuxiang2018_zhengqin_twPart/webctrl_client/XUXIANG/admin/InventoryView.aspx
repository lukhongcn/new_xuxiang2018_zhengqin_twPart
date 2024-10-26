<%@ Page language="c#" Codebehind="InventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.InventoryView" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>規格設置</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3">
							<uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><FONT face="新細明體">
								<uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></FONT></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">倉庫出入庫管理<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<table width="100%" align="center" border="0">
								<tr>
									<td><asp:label id="lab_moduleId" runat="server" Text="模具編號"></asp:label></td>
									<td><asp:textbox id="txt_moduleId" runat="server"></asp:textbox></td>
									<td><asp:label id="lab_partNo" runat="server" Text="零件編號"></asp:label></td>
									<td><asp:textbox id="txt_partNo" runat="server"></asp:textbox></td>
									<td><asp:label id="lab_partCount" runat="server" Text="數量"></asp:label></td>
									<td><asp:textbox id="txt_partCount" runat="server" AutoPostBack="True"></asp:textbox></td>
								</tr>
								<tr>
									<td colspan="6" vAlign="top"><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
											<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="零件小編號">
													<ItemTemplate>
														<asp:TextBox Runat="server" ID="dt_txt_partnoid" Text='<%# DataBinder.Eval(Container, "DataItem.PartNoId") %>'>
														</asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="貨架">
													<ItemTemplate>
														<asp:TextBox Runat="server" ID="dg_txt_shelfno"></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="層數">
													<ItemTemplate>
														<asp:TextBox Runat="server" ID="dg_txt_level"></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="橫向座標">
													<ItemTemplate>
														<asp:TextBox Runat="server" ID="dg_txt_x"></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="縱向座標">
													<ItemTemplate>
														<asp:TextBox Runat="server" ID="dg_txt_y"></asp:TextBox>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
										</asp:datagrid>
									</td>
								</tr>
								<tr>
									<td colSpan="5"><asp:button id="btn_add" runat="server" Text="保存"></asp:button></td>
								</tr>
							</table>
							<br>
							<asp:datagrid id="dg_Inventory" runat="server" OnPageIndexChanged="dg_Inventory_PageIndexChanged"
								OnDeleteCommand="dg_Inventory_DeleteCommand" OnUpdateCommand="dg_Inventory_UpdateCommand"
								OnCancelCommand="dg_Inventory_CancelCommand" OnEditCommand="dg_Inventory_EditCommand" AllowPaging="True"
								AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="Id">
										<HeaderTemplate>
											<asp:Label id="dg_header_Id" runat="server" text="編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_Id" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>' />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="moduleId">
										<HeaderTemplate>
											<asp:Label id="dg_header_moduleId" runat="server" text="模具編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_moduleId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.moduleId") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partNo">
										<HeaderTemplate>
											<asp:Label id="dg_header_partNo" runat="server" text="零件編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.partNo") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="PartNoId">
										<HeaderTemplate>
											<asp:Label id="dg_header_partNoId" runat="server" text="零件小編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartNoId") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_partCount" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.PartNoId") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="shelfNo">
										<HeaderTemplate>
											<asp:Label id="dg_header_shelfNo" runat="server" text="貨架編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_shelfNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ShelfNo") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_shelfNo" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.shelfNo") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎？') &quot;&gt;刪除&lt;/div&gt;"
										HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
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
