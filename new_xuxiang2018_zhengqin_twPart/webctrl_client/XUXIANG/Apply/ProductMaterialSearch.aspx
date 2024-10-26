<%@ Page language="c#" Codebehind="ProductMaterialSearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProductMaterialSearch" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			window.onerror = handleErrors;
			function returnVal()
			{				
				window.opener.document.forms['Form1'].txt_name.value = '<% = name %>';
				//兩個值傳回時,第一個控件為不可見時,第二個值將拿不到.關鍵在於哪個值是第一個返回.
				//add
				
				window.opener.document.forms['Form1'].txt_productmaterialno.value = '<% = productmaterialno %>';
				window.opener.document.forms['Form1'].txt_unit.value = '<% = unit %>';
				window.opener.document.forms['Form1'].txt_inventoryCount.value = '<% = inventoryCount %>';//通用入庫用到
				window.opener.document.forms['Form1'].submit();
				window.close(); 
			}
			
			function handleErrors()
			{
				window.opener.document.forms['Form1'].txt_name.value = '<% = name %>';
				//兩個值傳回時,第一個控件為不可見時,第二個值將拿不到.關鍵在於哪個值是第一個返回.
				
				window.opener.document.forms['Form1'].txt_productmaterialno.value = '<% = productmaterialno %>';
				window.opener.document.forms['Form1'].txt_unit.value = '<% = unit %>';
				window.opener.document.forms['Form1'].submit();
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
									<td vAlign="top" borderColorLight="#ccccff" borderColorDark="#cccccc"><asp:panel id="pan_treeview" runat="server"></asp:panel></td>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
											<TR>
												<TD style="WIDTH: 63px"><asp:label id="lab_productmaterialno" runat="server" Text="原物料編號"></asp:label></TD>
												<td><asp:textbox id="txt_productmaterialno" runat="server" Width="80px"></asp:textbox><FONT face="宋體">&nbsp;
														<asp:dropdownlist id="dpl_MaterialProduct" runat="server" AutoPostBack="True"></asp:dropdownlist>&nbsp;
													</FONT>
													<asp:button id="btn_search" runat="server" Text="查詢"></asp:button><asp:label id="lab_parentid" runat="server" Visible="False"></asp:label>
													每頁顯示的行數<asp:textbox id="txt_pageNumber" runat="server" Width="80px"></asp:textbox>
												</td>
											</TR>
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
												<asp:TemplateColumn HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_productmaterialno" runat="server">原物料編號</asp:Label>
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
												<asp:TemplateColumn HeaderText="inventoryCount">
													<HeaderTemplate>
														<asp:Label id="dg_header_inventoryCount" runat="server">倉庫數量</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_inventoryCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryCount")%>'/>
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
										<asp:label id="Lab_message" runat="server" Width="136px" ForeColor="Red"></asp:label><br>
									</td>
								</tr>
							</TABLE>
						</TD>
					</tr>
			</TABLE>
			</TD></tr></TBODY></TABLE>
			<%=closeWind%>
		</form>
		</TD></TR></TBODY></TABLE>
	</body>
</HTML>
