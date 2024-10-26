<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="OutsourceApplyDesignHeader" Src="control/xuxiangOutsourceApplyDesignHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="xuxiangOutsourceApplyDesignSearchtype.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Inventory.xuxiangOutsourceApplyDesignSearchtype" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>ProductMaterialInventorySearchtype</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
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
						<TD vAlign="top" width="79%"><uc1:OutsourceApplyDesignHeader id="OutsourceApplyDesignHeader" runat="server"></uc1:OutsourceApplyDesignHeader><br>
							<hr>
							<FONT face="宋體">
								<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="100%" border="1">
									<TR>
										<TD><asp:dropdownlist id="dpl_searchtype" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_condition" runat="server"></asp:dropdownlist><asp:textbox id="txt_search" runat="server"></asp:textbox><wc:inputcalendar id="txt_Date" runat="server"></wc:inputcalendar><asp:label id="lab_search" runat="server" Visible="False"></asp:label><asp:label id="lab_typeid" runat="server" Visible="False"></asp:label><asp:button id="btn_add" runat="server" Text="添加條件"></asp:button><asp:button id="btn_clear" runat="server" Text="清空"></asp:button><asp:button id="btn_search" runat="server" Text="查 詢"></asp:button></TD>
									</TR>
									<TR>
										<TD><asp:listbox id="ListBox_search" runat="server" Height="130px" Width="100%" Enabled="False"></asp:listbox></TD>
									</TR>
								</TABLE>
								<hr>
								<table>
									<tr>
										<td><asp:button ID="btn_print" Runat="server" Text="打印查詢結果" Visible="False"></asp:button></td>
									</tr>
									<TR>
										<TD>
											<asp:datagrid id="dg_OutSourceApplyDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
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
													<asp:TemplateColumn HeaderText="applyTypeId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_applyTypeId" runat="server">applyTypeId</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_applyTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyTypeId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_applyTypeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applyTypeId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="supplyId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_supplyId" runat="server">supplyId</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_supplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplyId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_supplyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.supplyId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="productOrderId">
														<HeaderTemplate>
															<asp:Label id="dg_header_productOrderId" runat="server">制令單號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_productOrderId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductOrderId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_productOrderId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productOrderId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="moduleId">
														<HeaderTemplate>
															<asp:Label id="dg_header_moduleId" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_partNo" runat="server">圖號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partNoId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_partNoId" runat="server">partNoId</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNoId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_partNoId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNoId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_partId" runat="server">partId</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_partId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_partId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="processId">
														<HeaderTemplate>
															<asp:Label id="dg_header_processId" runat="server">工序</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_processId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_processId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="materialId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_materialId" runat="server">材質</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_materialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="materialProductId">
														<HeaderTemplate>
															<asp:Label id="dg_header_materialProductId" runat="server">料品編號</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_materialProductId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialProductId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_materialProductId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialProductId") %>'/>
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
													<asp:TemplateColumn HeaderText="inventoryUnitId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_inventoryUnitId" runat="server">inventoryUnitId</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_inventoryUnitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryUnitId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_inventoryUnitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryUnitId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="priceUnitId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_priceUnitId" runat="server">priceUnitId</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_priceUnitId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PriceUnitId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_priceUnitId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.priceUnitId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="needQc" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_needQc" runat="server">needQc</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_needQc" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.NeedQc")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_needQc" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.needQc") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="hardRequire" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_hardRequire" runat="server">硬度要求</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_hardRequire" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HardRequire")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_hardRequire" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.hardRequire") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="weight" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_weight" runat="server">重量</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_weight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Weight")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_weight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.weight") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="outsourceCount">
														<HeaderTemplate>
															<asp:Label id="dg_header_outsourceCount" runat="server">委外數量</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_outsourceCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceCount")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_outsourceCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceCount") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="lossRate" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_lossRate" runat="server">加工損耗率</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_lossRate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LossRate")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_lossRate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.lossRate") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="requireDate">
														<HeaderTemplate>
															<asp:Label id="dg_header_requireDate" runat="server">需求日期</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_requireDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireDate","{0:d}")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_requireDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.requireDate","{0:d}") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="comment" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_comment" runat="server">comment</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="applyId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_applyId" runat="server">applyId</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_applyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_applyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applyId") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="applyMerchindiseNo" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_applyMerchindiseNo" runat="server">applyMerchindiseNo</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_applyMerchindiseNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyMerchindiseNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_applyMerchindiseNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applyMerchindiseNo") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="merchindiseNo" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_merchindiseNo" runat="server">merchindiseNo</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_merchindiseNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_merchindiseNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.merchindiseNo") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="outProductNo" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_outProductNo" runat="server">outProductNo</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_outProductNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutProductNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_outProductNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outProductNo") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="supply" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_supply" runat="server">supply</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_supply" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Supply")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_supply" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.supply") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partnum" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_partnum" runat="server">partnum</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_partnum" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partnum")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_partnum" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partnum") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="productNumber" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_productNumber" runat="server">productNumber</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_productNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductNumber")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_productNumber" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productNumber") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
												</Columns>
												<PagerStyle Mode="NumericPages"></PagerStyle>
											</asp:datagrid>
										</TD>
									</TR>
								</table>
							</FONT>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
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
