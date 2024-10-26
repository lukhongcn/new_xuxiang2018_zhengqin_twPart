<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="c1webgrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="tdx_testModulePrice.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.test.tdx_testModulePrice" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>tdx_testModulePrice</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
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
										<div align="left">模具成本</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td style="HEIGHT: 23px"><asp:label id="lab_customer" runat="server">客戶</asp:label><asp:dropdownlist id="dpl_customer" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:label id="lab_moduleid" runat="server">模具</asp:label><asp:dropdownlist id="dpl_moduleid" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="查詢"></asp:button></td>
											</tr>
											<tr>
												<td colSpan="2"><asp:label id="Label1" runat="server">模具加工費用</asp:label><asp:label id="lab_price" runat="server"></asp:label><c1webgrid:c1webgrid id="C1WebGrid1" runat="server" DefaultColumnWidth="120px" DefaultRowHeight="22px"
														AutoGenerateColumns="False" AllowPaging="True" CellPadding="1" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" BackColor="#999999" Font-Size="X-Small" Font-Names="Trebuchet MS" DataMember="Invoices" GridLines="None"
														GroupIndent="15px" Width="640px" CellSpacing="1">
														<AlternatingItemStyle BackColor="#CEEACE"></AlternatingItemStyle>
														<ItemStyle ForeColor="Black" BackColor="#E0FFE0"></ItemStyle>
														<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
														<Columns>
															<c1webgrid:C1BoundColumn Visible="False" HeaderText="模具編號" DataField="ModuleId">
																<HeaderStyle Width="0px"></HeaderStyle>
																<GroupInfo Position="Header" HeaderText="模具編號 &lt;i&gt;{0}&lt;/i&gt; ">
																	<HeaderStyle BackColor="#007300"></HeaderStyle>
																</GroupInfo>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1BoundColumn HeaderText="零件編號" DataField="PartNoPrice" Visible="False">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<GroupInfo Position="Header" HeaderText="零件編號 &lt;i&gt;{0}&lt;/i&gt; ">
																	<HeaderStyle BackColor="#007300"></HeaderStyle>
																</GroupInfo>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1BoundColumn HeaderText="工序" DataField="ProcessName">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<GroupInfo Position="Header" HeaderText="工序 &lt;i&gt;{0}&lt;/i&gt; ">
																	<HeaderStyle BackColor="#007300"></HeaderStyle>
																</GroupInfo>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1BoundColumn HeaderText="異常處理費用" DataField="DisCardPrice" Visible="False">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1BoundColumn HeaderText="機台編號" DataField="MachineId">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1BoundColumn HeaderText="機台耗時" DataField="Machineprocessminutes">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1BoundColumn HeaderText="機台費用" DataField="Machineprices" Aggregate="Sum">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1BoundColumn HeaderText="外包費用" DataField="OutSourcePrice" Visible="False">
																<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
																<ItemStyle HorizontalAlign="Center"></ItemStyle>
															</c1webgrid:C1BoundColumn>
															<c1webgrid:C1TemplateColumn HeaderText="材料費用" Visible="False">
																<HeaderStyle Width="100px"></HeaderStyle>
																<ItemTemplate>
																	<asp:Label id="dg_lab_processminutes" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MaterialPrice","{0:c}") %>'/>
																</ItemTemplate>
															</c1webgrid:C1TemplateColumn>
														</Columns>
														<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#005500"></HeaderStyle>
														<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
													</c1webgrid:c1webgrid></td>
											</tr>
										</table>
										<asp:button id="btn_print" runat="server" Text="打印報表"></asp:button><asp:label id="lab_print1" runat="server"></asp:label></td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示信息</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label><asp:label id="lab_print" runat="server"></asp:label></TD>
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
