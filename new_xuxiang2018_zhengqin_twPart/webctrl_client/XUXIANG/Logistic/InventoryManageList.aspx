<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="InventoryManageList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Logistic.InventoryManageList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>InventoryManageList</title>
		<LINK href="../css/common.css" rel="stylesheet">
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
						<TD vAlign="top" align="left" width="20%">
							<uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu>
						</TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" cellSpacing="2" width="100%" border="0">
								<TR>
									<TD>
										<DIV align="left">倉庫出入庫管理
											<asp:label id="Label_StatusMsg" runat="server"></asp:label></DIV>
									</TD>
								</TR>
							</TABLE>
							<TABLE id="Table3" width="100%" align="center" border="0">
								<TR>
									<td>
										<asp:textbox id="txt_like" runat="server"></asp:textbox>
										<asp:button id="btn_like" runat="server" Text="查詢"></asp:button>
										<asp:Button id="btn_noshelfno" runat="server" Text="未填貨架"></asp:Button>
									</td>
								</TR>
							</TABLE>
							<BR>
							<asp:datagrid id="dg_Inventory" runat="server" AutoGenerateColumns="False" AllowPaging="True">
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
											<asp:textbox id="dg_txt_moduleId" Width="140" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.moduleId") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partNo">
										<HeaderTemplate>
											<asp:Label id="dg_header_partNo" runat="server" text="零件編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_partNo" Width="140" runat="server" Text=' <%#DataBinder.Eval(Container, "DataItem.partNo")%> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partNoId">
										<HeaderTemplate>
											<asp:Label id="dg_header_partNoId" runat="server" text="零件小編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partNoId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartNoId") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_partNoId" Width="140" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.PartNoId") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partCount">
										<HeaderTemplate>
											<asp:Label id="dg_header_partCount" runat="server" text="數量" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_partCount" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.PartCount") %> ' />
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
											<asp:textbox id="dg_txt_shelfNo" Width="140" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.shelfNo") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><BR>
							<TABLE id="Table4" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B> 提示 </B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</tr>
					<TR>
						<TD colSpan="3"><FONT face="新細明體">
								<uc1:footer id="Footer" runat="server"></uc1:footer></FONT></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
		</FONT></TABLE>
	</body>
</HTML>
