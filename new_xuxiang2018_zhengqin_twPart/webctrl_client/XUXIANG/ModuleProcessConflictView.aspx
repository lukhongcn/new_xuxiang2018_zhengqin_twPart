<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="ModuleProcessConflictView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModuleProcessConflictView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具零件加工衝突瀏覽</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<!--<TD vAlign="top" align="left" width="1%"></TD>
						<TD width="1%">&nbsp;</TD>-->
						<TD vAlign="top" width="92%"><A href="default.aspx">返回首頁</A>
							<TABLE id="Table4" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>提示</B></DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_MessageUp" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
								</TR>
							</TABLE>
							<TABLE id="Table_Modify" cellSpacing="0" cellPadding="0" width="100%" border="1" runat="server">
								<TBODY>
									<TR>
										<TD width="10%">模具編號</TD>
										<TD width="40%"><asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
										<TD width="10%">零件編號</TD>
										<TD width="40%"><asp:label id="Label_PartNoId" runat="server"></asp:label></TD>
									</TR>
									<TR>
										<TD>工序設定</TD>
										<TD colSpan="3"><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="加工順序" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_OrderNo" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessOrder") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="false" HeaderText="工序編號">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessID") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="工序名稱" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_ProcessName" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessID") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="狀態" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_StatusID" Text='<%# DataBinder.Eval(Container, "DataItem.StatusID") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="計劃開始日期" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_StartDate" Text='<%# string.Format("{0:yyyy-MM-dd}",DataBinder.Eval(Container, "DataItem.StartDate")) %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="計劃結束日期" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_EndDate" Text='<%# string.Format("{0:yyyy-MM-dd}",DataBinder.Eval(Container, "DataItem.EndDate")) %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="實際開始日期" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_FactStartDate" Text='<%# string.Format("{0:yyyy-MM-dd}",DataBinder.Eval(Container, "DataItem.FactStartDate")) %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="實際結束日期" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_FactEndDate" Text='<%# string.Format("{0:yyyy-MM-dd}",DataBinder.Eval(Container, "DataItem.FactEndDate")) %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="系統編號" Visible="true">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_Processno" Text='<%# DataBinder.Eval(Container, "DataItem.processno") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:ButtonColumn Text="上移" ButtonType="PushButton" HeaderText="功能" CommandName="Upper" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
													<asp:ButtonColumn Text="下移" ButtonType="PushButton" CommandName="Lower" ItemStyle-HorizontalAlign="Center"></asp:ButtonColumn>
													<asp:BoundColumn DataField="factstartdate" HeaderText="factstartdate" Visible="false"></asp:BoundColumn>
													<asp:BoundColumn DataField="StatusID" HeaderText="StatusID" Visible="false"></asp:BoundColumn>
												</Columns>
											</asp:datagrid></TD>
									</TR>
									<TR>
										<TD colSpan="4"><asp:button id="Button_AddEdit" runat="server" Text="調整順序"></asp:button></TD>
									</TR>
								</TBODY>
							</TABLE>
							<br>
							<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td bgColor="#aaaadd" colSpan="6"><b>設定查詢條件</b></td>
								</tr>
								<tr>
									<td>零件加工衝突<asp:dropdownlist id="drp_processconflict" Runat="server"></asp:dropdownlist></td>
									<td><asp:button id="btn_search" Text="查詢" Runat="server"></asp:button></td>
								</tr>
							</TABLE>
							<BR>
							<asp:datagrid id="DataGridList" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="2"
								CellSpacing="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessName" HeaderText="工序名稱"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="工序編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ShouldProcessOrder" HeaderText="應為工序編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNo" HeaderText="編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="Responsible" HeaderText="負責人"></asp:BoundColumn>
									<asp:ButtonColumn Text="工序調整" HeaderText="功能" CommandName="Modify"></asp:ButtonColumn>
								</Columns>
							</asp:datagrid>
							<TABLE id="Table_Confirm" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td><asp:button id="Button_Conflict" Text="調整所有衝突情況" Runat="server"></asp:button></td>
								</tr>
							</TABLE>
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>提示</B></DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
