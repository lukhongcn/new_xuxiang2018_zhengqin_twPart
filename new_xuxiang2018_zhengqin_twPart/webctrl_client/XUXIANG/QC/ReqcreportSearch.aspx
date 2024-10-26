<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="ReqcreportSearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.QC.ReqcreportSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ReqcreportSearch</title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			function returnVal()
			{
				window.opener.document.forms['Form1'].txt_ProductMaterialInventoryId.value = '<% = name %>';
			/*	window.opener.document.forms['Form1'].txt_spec.value = '<% = sped %>';
				window.opener.document.forms['Form1'].txt_inventoryCount.value = '<% = inventorycount %>';
				window.opener.document.forms['Form1'].txt_inventoryWeight.value = '<% = perweight %>';*/
				window.close();
			}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
											<tr>
												<td><asp:label id="lab_productmaterialno" runat="server" Text="原物料編號">原物料名稱</asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox><FONT face="宋體">&nbsp;
														<asp:dropdownlist id="dpl_MaterialProduct" runat="server" AutoPostBack="True"></asp:dropdownlist>&nbsp;
													</FONT>
													<asp:button id="btn_search" runat="server" Text="查詢"></asp:button></td>
											</tr>
								</tr>
								<tr>
									<td colSpan="2"><asp:datagrid id="dg_ProductMaterialInventory" runat="server" AllowPaging="True" AutoGenerateColumns="False"
											CellSpacing="2" CellPadding="2">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn HeaderText="id">
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
														<asp:Label id="dg_header_name" runat="server">名稱</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_name" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.name") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="spec">
													<HeaderTemplate>
														<asp:Label id="dg_header_spec" runat="server">規格</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_spec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.spec") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="perWeight">
													<HeaderTemplate>
														<asp:Label id="dg_header_perWeight" runat="server">單位重</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_perWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PerWeight")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_perWeight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.perWeight") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="inventoryCount">
													<HeaderTemplate>
														<asp:Label id="dg_header_inventoryCount" runat="server">庫存量</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_inventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryCount")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_inventoryCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryCount") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="選中" HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
										<hr style="COLOR: #ccccff">
										<br>
									</td>
								</tr>
							</TABLE>
						</TD>
					</tr>
			</TABLE>
			</TD></tr></TBODY></TABLE>
			<%=closeWind%>
		</form>
	</body>
</HTML>
