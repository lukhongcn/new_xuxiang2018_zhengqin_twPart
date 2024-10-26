<%@ Page language="c#" Codebehind="ProcessHelp.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProcessHelp" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>工序設定</title>
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
										<TD>
											<P>工序編號（請輸入英文名，不能帶有中文）&nbsp;
												<asp:textbox id="txt_processid" runat="server"></asp:textbox></P>
											<P>工序名稱（此名稱是您實際使用工序名稱）
												<asp:textbox id="txt_processname" runat="server"></asp:textbox></P>
											<p>註釋&nbsp;&nbsp;<asp:textbox id="txt_comment" runat="server"></asp:textbox></p>
											<P><FONT face="新細明體">是否為機台加工工序&nbsp;
													<asp:dropdownlist id="ddl_needschedule" runat="server">
														<asp:ListItem Value="1">是</asp:ListItem>
														<asp:ListItem Value="0">否</asp:ListItem>
													</asp:dropdownlist></FONT></P>
											<P><FONT face="新細明體"><asp:label id="lab_priceType" runat="server">工序類型</asp:label>&nbsp;
													<asp:dropdownlist id="dpl_priceType" runat="server">
														<asp:ListItem Value="0">空</asp:ListItem>
														<asp:ListItem Value="OUTSOURCE">外包</asp:ListItem>
														<asp:ListItem Value="CNC">CNC</asp:ListItem>
														<asp:ListItem Value="JG">JG研磨計算</asp:ListItem>
														<asp:ListItem Value="QUICKCUT">快走絲</asp:ListItem>
														<asp:ListItem Value="EDM">激光刻字</asp:ListItem>
														<asp:ListItem Value="CUTMILLING">線割研磨</asp:ListItem>
														<asp:ListItem Value="SLOWCUT">慢走絲</asp:ListItem>
														<asp:ListItem Value="NOMACHINE">不需要開始</asp:ListItem>
														<asp:ListItem Value="ZULI">組立</asp:ListItem>
														<asp:ListItem Value="NEEDDESIGN">需設計</asp:ListItem>
														<asp:ListItem Value="FANGDIAN">放電</asp:ListItem>
													</asp:dropdownlist></FONT></P><FONT face="新細明體"></FONT>
											<P><FONT face="新細明體">是否需要QC&nbsp;
													<asp:dropdownlist id="dpl_isneedQC" runat="server">
														<asp:ListItem Value="1">是</asp:ListItem>
														<asp:ListItem Value="0">否</asp:ListItem>
													</asp:dropdownlist></FONT></P>
											<P><asp:button id="btn_save" runat="server" Text="設定"></asp:button></P>
										</TD>
									</TR>
									<tr>
										<td><br>
											<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
												CellPadding="2" AllowPaging="True">
												<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
												<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
												<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText="工序編號">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_ProcessId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessId") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="工序名稱">
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
													<asp:TemplateColumn HeaderText="註釋">
														<ItemTemplate>
															&nbsp;
															<asp:Label ID="dg_lab_comment" Runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Comment")%>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_comment" Runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.Comment")%>'>
															</asp:TextBox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="是否為機台加工工序">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="lab_needschedule" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CNeedSchedule") %>'>
															</asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="工序類型">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_pricetype" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CPriceType") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:dropdownlist id="dg_dpl_pricetype" runat="server">
																<asp:ListItem Value="0">空</asp:ListItem>
																<asp:ListItem Value="OUTSOURCE">外包</asp:ListItem>
																<asp:ListItem Value="CNC">CNC</asp:ListItem>
																<asp:ListItem Value="JG">JG研磨計算</asp:ListItem>
																<asp:ListItem Value="QUICKCUT">快走絲</asp:ListItem>
																<asp:ListItem Value="EDM">激光刻字</asp:ListItem>
																<asp:ListItem Value="CUTMILLING">線割研磨</asp:ListItem>
																<asp:ListItem Value="SLOWCUT">慢走絲</asp:ListItem>
																<asp:ListItem Value="NOMACHINE">不需要開始</asp:ListItem>
																<asp:ListItem Value="ZULI">組立</asp:ListItem>
																<asp:ListItem Value="NEEDDESIGN">需設計</asp:ListItem>
																<asp:ListItem Value="FANGDIAN">放電</asp:ListItem>
															</asp:dropdownlist>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="是否需要QC">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="lab_isneedQC" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isNeedQC") %>'>
															</asp:Label>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList ID="dg_dpl_isneedQC" Runat="server">
																<asp:ListItem Value="1">是</asp:ListItem>
																<asp:ListItem Value="0">否</asp:ListItem>
															</asp:DropDownList>
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
										<asp:label id="lab_message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label></TD>
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
