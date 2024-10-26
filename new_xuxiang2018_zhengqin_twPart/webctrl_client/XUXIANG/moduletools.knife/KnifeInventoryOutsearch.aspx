<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="KnifeInventoryOutHeader" Src="controls/KnifeInventoryOutHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="KnifeInventoryOutsearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.moduletools.knife.KnifeInventoryOutsearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>KnifeInventoryOutsearch</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="../css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%"><uc1:KnifeInventoryOutHeader id="KnifeInventoryOutHeader" runat="server"></uc1:KnifeInventoryOutHeader><br>
							<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="1">
								<TR>
									<TD><asp:dropdownlist id="dpl_searchtype" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_condition" runat="server"></asp:dropdownlist><asp:textbox id="txt_search" runat="server"></asp:textbox><wc:inputcalendar id="txt_Date" runat="server"></wc:inputcalendar><asp:label id="lab_search" runat="server" Visible="False"></asp:label><asp:label id="lab_typeid" runat="server" Visible="False"></asp:label><asp:button id="btn_add" runat="server" Text="添加條件"></asp:button><asp:button id="btn_clear" runat="server" Text="清空"></asp:button><asp:button id="btn_search" runat="server" Text="查 詢"></asp:button></TD>
								</TR>
								<TR>
									<TD><asp:listbox id="ListBox_search" runat="server" Height="130px" Width="100%" Enabled="False"></asp:listbox></TD>
								</TR>
							</TABLE>
							<hr>
							<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><FONT face="宋體"></FONT></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_KnifeOutInventoryDetail" runat="server" AllowPaging="True" CellPadding="2"
														CellSpacing="2" AutoGenerateColumns="False" Visible="False">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD">
</HeaderStyle>

<Columns>
<asp:TemplateColumn Visible="False" HeaderText="id">
<HeaderTemplate>
																	<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="name">
<HeaderTemplate>
																	<asp:Label id="dg_header_name" runat="server">刀具名稱</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>' />
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:Label id="dg_txt_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId")%>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="productMaterialId">
<HeaderTemplate>
																	<asp:Label id="dg_header_productMaterialId" runat="server">刀具編號</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productMaterialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_productMaterialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="moduleId">
<HeaderTemplate>
																	<asp:Label id="dg_header_moduleId" runat="server">模具</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="outPCS">
<HeaderTemplate>
																	<asp:Label id="dg_header_outPCS" runat="server">工令單號</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutPCS")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_outPCS" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outPCS") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="partNoId">
<HeaderTemplate>
																	<asp:Label id="dg_header_partNoId" runat="server">零件</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNoId")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_partNoId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNoId") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="outInventoryCount">
<HeaderTemplate>
																	<asp:Label id="dg_header_outInventoryCount" runat="server">領用數量</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_outInventoryCountt" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventoryCount")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_outInventoryCountt" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outInventoryCount") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="comment">
<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server">備註</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="False" HeaderText="OutInventory">
<HeaderTemplate>
																	<asp:Label id="dg_header_OutInventory" runat="server">OutInventory</asp:Label>
																
</HeaderTemplate>

<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_OutInventory" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventory")%>'/>
																
</ItemTemplate>

<EditItemTemplate>
																	<asp:textbox id="dg_txt_OutInventory" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventory") %>'/>
																
</EditItemTemplate>
</asp:TemplateColumn>
</Columns>

<PagerStyle Mode="NumericPages">
</PagerStyle>
													</asp:datagrid><br>
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
												<DIV align="center"><B>提示信息</B></DIV>
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
