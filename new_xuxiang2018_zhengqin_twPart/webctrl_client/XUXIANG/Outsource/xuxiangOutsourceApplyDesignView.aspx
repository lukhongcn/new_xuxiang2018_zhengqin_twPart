<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="xuxiangOutsourceApplyDesignView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangOutsourceApplyDesignView" %>
<%@ Register TagPrefix="uc1" TagName="OutsourceApplyDesignHeader" Src="control/xuxiangOutsourceApplyDesignHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
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
										<div align="left"><uc1:outsourceapplydesignheader id="OutsourceApplyDesignHeader" runat="server"></uc1:outsourceapplydesignheader></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td><asp:label id="lab_outsourceApplyNo" runat="server" Text="�ӽг�s��"></asp:label></td>
												<td><asp:textbox id="txt_outsourceApplyNo" runat="server" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_applyDepartmentId" runat="server" Text="">�ӽг���</asp:label></td>
												<td><asp:dropdownlist id="dpl_applyDepartmentId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_createDate" runat="server" Text="">�����</asp:label></td>
												<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_creater" runat="server" Text="">���H</asp:label></td>
												<td><asp:textbox id="txt_creater" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="dpl_creater" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_checkDate" runat="server" Text="">�f�֤��</asp:label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_checker" runat="server" Text="">�f�֤H</asp:label></td>
												<td><asp:textbox id="txt_checker" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="dpl_checker" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_reCheckDate" runat="server" Text="">�Ю֤��</asp:label></td>
												<td><wc:inputcalendar id="txt_reCheckDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_reChecker" runat="server" Text="">�Ю֤H</asp:label></td>
												<td><asp:textbox id="txt_reChecker" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="dpl_reChecker" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 21px"><asp:label id="lab_approverDate" runat="server" Text="">�֭���</asp:label></td>
												<td style="HEIGHT: 21px"><wc:inputcalendar id="txt_approverDate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 21px"><asp:label id="lab_approver" runat="server" Text="">�֭�H</asp:label></td>
												<td style="HEIGHT: 21px"><asp:textbox id="txt_approver" runat="server" AutoPostBack="True"></asp:textbox><asp:dropdownlist id="dpl_approver" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="">�Ƶ�</asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_detailId" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td style="HEIGHT: 22px"><asp:label id="lab_productOrderId" runat="server" Text="�u�O�渹">��O�渹</asp:label></td>
												<td style="WIDTH: 204px; HEIGHT: 22px"><asp:textbox id="txt_productOrderId" runat="server" ReadOnly="True"></asp:textbox></td>
												<td style="HEIGHT: 22px"><asp:label id="lab_supplyId" runat="server" Text="supplyId">������</asp:label></td>
												<td style="HEIGHT: 22px"><asp:dropdownlist id="dpl_supplyId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 25px"><asp:label id="lab_requireDate" runat="server" Text="requireDate">�ݨD���</asp:label></td>
												<td style="HEIGHT: 25px"><wc:inputcalendar id="txt_requireDate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 25px"><asp:label id="lab_customerid" runat="server" Text="�Ȥ�"></asp:label></td>
												<td style="HEIGHT: 25px"><asp:dropdownlist id="dpl_customerid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 19px"><asp:label id="lab_moduleId" runat="server"></asp:label><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></td>
												<td style="WIDTH: 204px; HEIGHT: 19px"><asp:dropdownlist id="dpl_moduleId" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td style="HEIGHT: 19px"><asp:label id="lab_partNo" runat="server" Text="partNo">�s��s��</asp:label></td>
												<td style="HEIGHT: 19px"><asp:dropdownlist id="dpl_partNo" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_partno_id" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 15px"><asp:label id="lab_processId" runat="server" Text="processId">�e�~�u��</asp:label></td>
												<td style="WIDTH: 204px; HEIGHT: 15px"><asp:dropdownlist id="dpl_processId" runat="server"></asp:dropdownlist><asp:button id="Button1" runat="server" Text="�T�{"></asp:button><asp:label id="lab_processno" runat="server" Visible="False"></asp:label></td>
												<td style="HEIGHT: 15px"><asp:label id="lab_materialProductId" runat="server" Text="materialProductId">�s��W��</asp:label></td>
												<td style="HEIGHT: 15px"><asp:dropdownlist id="dpl_materialProductId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td style="HEIGHT: 12px"><asp:label id="lab_partcount" runat="server" Text="outsourceCount">�s��ƶq</asp:label></td>
												<td style="HEIGHT: 12px"><asp:textbox id="txt_partcount" runat="server" ReadOnly="True" BackColor="Silver"></asp:textbox></td>
												<td style="HEIGHT: 12px"><asp:label id="lab_outsourceCount" runat="server" Text="outsourceCount">�s��p�s��</asp:label></td>
												<td style="HEIGHT: 12px"><asp:textbox id="txt_outsourceCount" runat="server" ReadOnly="True" BackColor="Silver"></asp:textbox><asp:button id="Button2" runat="server" Text="�M��"></asp:button><asp:textbox id="txt_partno_id" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_spec" runat="server" Text="spec">�W��</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_spec" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_materialId" runat="server" Text="materialId">����</asp:label></td>
												<td style="WIDTH: 204px"><asp:dropdownlist id="dpl_materialId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_priceUnitId" runat="server" Text="priceUnitId">�p�����</asp:label></td>
												<td style="WIDTH: 204px"><asp:dropdownlist id="dpl_priceUnitId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_needQc" runat="server" Text="needQc">�O�_�~ų</asp:label></td>
												<td><asp:dropdownlist id="dpl_needQc" runat="server">
														<asp:ListItem Value="1">�O</asp:ListItem>
														<asp:ListItem Value="0">�_</asp:ListItem>
													</asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_inventoryUnitId" runat="server" Text="inventoryUnitId">�J�w���</asp:label></td>
												<td><asp:dropdownlist id="dpl_inventoryUnitId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_hardRequire" runat="server" Text="hardRequire">�w�׭n�D</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_hardRequire" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_lossRate" runat="server" Text="lossRate">�[�u�l�Ӳv</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_lossRate" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_weight" runat="server" Text="weight">���q</asp:label></td>
												<td><asp:textbox id="txt_weight" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_partcomment" Runat="server"></asp:label><%= System.Configuration.ConfigurationSettings.AppSettings["CommentShow"]%></td>
												<td><asp:textbox id="txt_partcomment" ReadOnly="True" Runat="server"></asp:textbox></td>
												<td><asp:label id="Label2" runat="server" Text="�Ƶ�"></asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_dcomment" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_partId" runat="server" Visible="False" Text="partId">partId</asp:label></td>
												<td><asp:textbox id="txt_partId" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_applyId" runat="server" Visible="False" Text="applyId">applyId</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_applyId" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:label id="lab_applyMerchindiseNo" runat="server" Visible="False" Text="applyMerchindiseNo">applyMerchindiseNo</asp:label></td>
												<td><asp:textbox id="txt_applyMerchindiseNo" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
											</tr>
											<tr>
												<td><asp:label id="lab_merchindiseNo" runat="server" Visible="False" Text="merchindiseNo">merchindiseNo</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_merchindiseNo" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:label id="lab_outProductNo" runat="server" Visible="False" Text="outProductNo">outProductNo</asp:label></td>
												<td><asp:textbox id="txt_outProductNo" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_isInBound" runat="server" Visible="False" Text="isInBound">isInBound</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_isInBound" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:label id="lab_supply" runat="server" Visible="False" Text="supply">supply</asp:label></td>
												<td><asp:textbox id="txt_supply" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_partnum" runat="server" Visible="False" Text="partnum">partnum</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_partnum" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:label id="lab_productNumber" runat="server" Visible="False" Text="productNumber">productNumber</asp:label></td>
												<td><asp:textbox id="txt_productNumber" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_partNoId" runat="server" Visible="False" Text="partNoId">partNoId</asp:label></td>
												<td style="WIDTH: 204px"><asp:textbox id="txt_partNoId" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<TR>
												<TD style="WIDTH: 346px; HEIGHT: 22px" colSpan="2"><asp:label id="func_detail" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_Detail" runat="server" Text="�O�s" Enabled="False"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="4"><asp:datagrid id="dg_OutSourceApplyDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="id">
																<HeaderTemplate>
																	<asp:Label id="dg_header_id" runat="server">�s��</asp:Label>
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
																	<asp:Label id="dg_header_productOrderId" runat="server">��O�渹</asp:Label>
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
																	<asp:Label id="dg_header_moduleId" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'>
																	</asp:Label>
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
																	<asp:Label id="dg_header_partNo" runat="server">�s��s��</asp:Label>
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
																	<asp:Label id="dg_header_processId" runat="server">�u��</asp:Label>
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
																	<asp:Label id="dg_header_materialId" runat="server">�~��</asp:Label>
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
																	<asp:Label id="dg_header_materialProductId" runat="server">�ƫ~�s��</asp:Label>
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
																	<asp:Label id="dg_header_spec" runat="server">�W��</asp:Label>
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
																	<asp:Label id="dg_header_hardRequire" runat="server">�w�׭n�D</asp:Label>
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
																	<asp:Label id="dg_header_weight" runat="server">���q</asp:Label>
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
																	<asp:Label id="dg_header_outsourceCount" runat="server">�e�~�ƶq</asp:Label>
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
																	<asp:Label id="dg_header_lossRate" runat="server">�[�u�l�Ӳv</asp:Label>
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
																	<asp:Label id="dg_header_requireDate" runat="server">�ݨD���</asp:Label>
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
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�ʧ@" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�T�w�O�_�R��')&quot;>�R��</div>" HeaderText="�ʧ@"
																CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr style="COLOR: #ccccff">
													<br>
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
												<DIV align="center"><B>���ܫH��</B></DIV>
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
