<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PartModifyHeader" Src="controls/PartModifyHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="PartModifyProcessOrder.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartModifyProcessOrder" smartNavigation="True"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>零件工序調整</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<script language="javascript" src="js/lib.js"></script>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:partmodifyheader id="PartModifyHeader" runat="server"></uc1:partmodifyheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										<TD width="10%"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></TD>
										<TD width="40%"><asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
										<TD width="10%">零件編號</TD>
										<TD width="40%"><asp:label id="Label_PartNoId" runat="server"></asp:label></TD>
									</TR>
									<TR>
										<TD>工序設定</TD>
										<TD colSpan="5"><asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%">
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
															<asp:Label runat="server" ID="Label_StartDate" Text='<%# string.Format("{0:yyyy-MM-dd}",DataBinder.Eval(Container, "DataItem.selfStartDate")) %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="計劃結束日期" ItemStyle-HorizontalAlign="Center">
														<ItemTemplate>
															<asp:Label runat="server" ID="Label_EndDate" Text='<%# string.Format("{0:yyyy-MM-dd}",DataBinder.Eval(Container, "DataItem.selfEndDate")) %>'>
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
													<asp:TemplateColumn HeaderText="系統編號" Visible="False">
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
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="調整順序"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="window.history.back();" type="button" value="取消" name="back"><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label></TD>
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
