<%@ Page language="c#" Codebehind="KnifeInventorySearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.moduletools.knife.KnifeInventorySearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			function returnVal()
			{
				window.opener.document.forms['Form1'].txt_productmaterialno.value = '<% = productmaterialno %>';
				window.opener.document.forms['Form1'].txt_name.value = '<% = name %>';
				window.close();
			}
		</script>
	</HEAD>
	<body topMargin="0">
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
												<td><asp:Label ID="lab_productmaterialno" runat="server" Text="刀具編號"></asp:Label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox><FONT face="宋體">&nbsp;
														<asp:DropDownList id="dpl_MaterialProduct" runat="server" AutoPostBack="True" Enabled="False" Visible="False"></asp:DropDownList>&nbsp;
													</FONT>
													<asp:button id="btn_search" runat="server" Text="查詢"></asp:button></td>
											</tr>
								</tr>
								<tr>
									<td colSpan="2"><asp:datagrid id="dg_ProductMaterialInventory" runat="server" CellPadding="2" CellSpacing="2"
											AutoGenerateColumns="False" AllowPaging="True">
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
												<asp:TemplateColumn HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_productmaterialno" runat="server">刀具編號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_productmaterialno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productmaterialno")%>'/>
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
			</TD> </tr> </TBODY> </TABLE>
			<%=closeWind%>
		</form>
	</body>
</HTML>
