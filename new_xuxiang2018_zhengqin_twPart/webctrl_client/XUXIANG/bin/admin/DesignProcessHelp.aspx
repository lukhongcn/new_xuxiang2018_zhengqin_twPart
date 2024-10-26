<%@ Page language="c#" Codebehind="DesignProcessHelp.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.DesignProcessHelp" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>零件設計設定</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD style="WIDTH: 153px" vAlign="top" align="left" width="153"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table id="TableCondition" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<TR>
										<TD style="HEIGHT: 137px">
											<P>設計內容編號（請輸入英文名，不能帶有中文）&nbsp;
												<asp:textbox id="txt_processid" runat="server"></asp:textbox></P>
											<P>設計內容名稱（此名稱是您實際使用設計內容名稱）
												<asp:textbox id="txt_processname" runat="server"></asp:textbox></P>
											<P><FONT face="新細明體"><asp:label id="lab_priceType" runat="server">工序類型</asp:label>&nbsp;
													<asp:dropdownlist id="dpl_priceType" runat="server">
														<asp:ListItem Value="0">空</asp:ListItem>
														<asp:ListItem Value="DESIGNFINISH">設計完成</asp:ListItem>
													</asp:dropdownlist></FONT></P>
											<P><asp:button id="btn_save" runat="server" Text="設定"></asp:button></P>
										</TD>
									</TR>
									<tr>
										<td><br>
											<asp:datagrid id="MainDataGrid" runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2"
												Width="100%" AutoGenerateColumns="False">
												<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
												<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
												<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="設計內容編號">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_ProcessId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="設計內容名稱">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_ProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_ProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'>
															</asp:textbox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="工序類型">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_pricetype" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartProcessId") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:dropdownlist id="dg_dpl_pricetype" runat="server">
																<asp:ListItem Value="0">空</asp:ListItem>
																<asp:ListItem Value="DESIGNFINISH">設計完成</asp:ListItem>
															</asp:dropdownlist>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
													<asp:ButtonColumn Text="刪除" CommandName="Delete" HeaderText="功能"></asp:ButtonColumn>
												</Columns>
											</asp:datagrid></td>
									</tr>
								</TBODY>
							</table>
							<br>
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
										<asp:label id="lab_message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
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
