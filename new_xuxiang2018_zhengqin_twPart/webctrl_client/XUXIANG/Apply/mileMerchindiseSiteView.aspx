<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="mileMerchindiseSiteHeader" Src="controls/mileMerchindiseSiteHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="mileMerchindiseSiteView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.mileMerchindiseSiteView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>���ʳ]�w</title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<FONT face="����"></FONT>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:milemerchindisesiteheader id="mileMerchindiseSiteHeader" runat="server"></uc1:milemerchindisesiteheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0" DESIGNTIMEDRAGDROP="21">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<TBODY>
												<tr>
													<td><asp:label id="lab_merchindiseNo" runat="server" Text="���ʳ渹"></asp:label></td>
													<td><asp:textbox id="txt_merchindiseNo" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_createrDate" runat="server" Text="�����"></asp:label></td>
													<td><wc:inputcalendar id="txt_createrDate" runat="server"></wc:inputcalendar></td>
													<td><asp:label id="lab_merchindiseCreateDate" runat="server" Text="���ʤ��"></asp:label></td>
													<td><wc:inputcalendar id="txt_merchindiseCreateDate" runat="server"></wc:inputcalendar></td>
												</tr>
												<tr>
													<td><asp:label id="lab_merchindiseInputDate" runat="server" Text="��f��"></asp:label></td>
													<td><wc:inputcalendar id="txt_merchindiseInputDate" runat="server"></wc:inputcalendar></td>
													<td><asp:label id="lab_supplyId" runat="server" Text="�t��"></asp:label></td>
													<td><asp:dropdownlist id="dpl_supplyId" runat="server"></asp:dropdownlist></td>
													<td><asp:label id="lab_merchindiseOhterCondition" runat="server" Text="��L����"></asp:label></td>
													<td><asp:dropdownlist id="dpl_merchindiseOhterCondition" runat="server"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_merchindiseFaxType" runat="server" Text="�|�O"></asp:label></td>
													<td><FONT face="�s�ө���"><asp:dropdownlist id="dpl_merchindiseFaxType" runat="server"></asp:dropdownlist></FONT></td>
													<td><FONT face="�s�ө���"><asp:label id="lab_merchindiseMoneyId" runat="server" Text="���O"></asp:label></FONT></td>
													<td><asp:dropdownlist id="dpl_merchindiseMoneyId" runat="server"></asp:dropdownlist></td>
													<td><asp:label id="lab_tradeCondition" runat="server" Text="�������"></asp:label></td>
													<td><asp:dropdownlist id="dpl_tradeCondition" runat="server"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_assertManage" runat="server" Text="�겣�޲z��" Visible="False"></asp:label></td>
													<td><asp:dropdownlist id="dpl_assertManage" runat="server" Visible="False"></asp:dropdownlist></td>
													<td><asp:label id="lab_manageCheckDate" runat="server" Text="�겣�f�֤��" Visible="False"></asp:label></td>
													<td><wc:inputcalendar id="txt_manageCheckDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
													<td><asp:label id="lab_departfinacial" runat="server" Text="�]�ȳ�" Visible="False"></asp:label></td>
													<td><asp:dropdownlist id="dpl_departfinacial" runat="server" Visible="False"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_site" runat="server" Text="����a�I"></asp:label></td>
													<td><asp:textbox id="txt_site" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_creater" runat="server" Text="���H"></asp:label></td>
													<td><asp:textbox id="txt_creater" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_comment" runat="server" Text="�K�n"></asp:label></td>
													<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_approver" runat="server" Text="approver">�f�֤H</asp:label></td>
													<td><FONT face="�s�ө���"><asp:textbox id="txt_approver" runat="server" Text=""></asp:textbox><asp:dropdownlist id="dpl_approver" runat="server" AutoPostBack="True"></asp:dropdownlist></FONT></td>
													<td><asp:label id="lab_purchaserId" Text="�ӽФH�s��" Visible="False" Runat="server">�ӽФH�s��</asp:label></td>
													<td><asp:textbox id="txt_purchaserId" Visible="False" Runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_purchaser" Text="�ӽФH" Runat="server"></asp:label></td>
													<td><asp:textbox id="txt_purchaser" Runat="server"></asp:textbox><asp:dropdownlist id="dpl_purchaser" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
													<td><asp:label id="lab_deliverysite" Text="�e�f�a�I" Runat="server"></asp:label></td>
													<td><asp:textbox id="txt_deliverysite" Runat="server"></asp:textbox></td>
												</tr>
								</tr>
								<tr>
									<td><asp:label id="lab_isAccountFinished" runat="server" Text="�O�_���b" Visible="False"></asp:label></td>
									<td><asp:checkbox id="chk_isAccountFinished" runat="server" Visible="False"></asp:checkbox></td>
									<td><asp:label id="lab_finacialCheckDate" runat="server" Text="�]�ȼf�֤��" Visible="False"></asp:label></td>
									<td><wc:inputcalendar id="txt_finacialCheckDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
								</tr>
								<tr>
									<td><asp:label id="lab_checker" runat="server" Text="checker" Visible="False"></asp:label></td>
									<td><asp:textbox id="txt_checker" runat="server" Text="" Visible="False"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:label id="lab_checkDeate" runat="server" Text="checkDeate" Visible="False"></asp:label></td>
									<td><wc:inputcalendar id="txt_checkDeate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
								</tr>
								<tr>
									<td><asp:label id="lab_approvDate" runat="server" Text="approvDate" Visible="False"></asp:label></td>
									<td><wc:inputcalendar id="txt_approvDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
								</tr>
								<tr>
									<td><asp:label id="lab_status" runat="server" Text="status" Visible="False"></asp:label></td>
									<td><asp:textbox id="txt_status" runat="server" Text="" Visible="False"></asp:textbox></td>
								</tr>
								<TR>
									<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
								</TR>
							</TABLE>
							<asp:panel id="pan_outInventorydetail" Runat="server">
								<TABLE id="Table4" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
									width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
									<TR>
										<TD vAlign="top">
											<TABLE width="100%" align="center" border="0">
												<asp:label id="Label1" runat="server" Visible="False" Text=""></asp:label>
												<TR>
													<TD>
														<asp:label id="lab_zdno" runat="server" Text="���ƽs��"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_productmaterialno" runat="server" AutoPostBack="True"></asp:textbox>
														<asp:button id="btn_search" runat="server" Text="�d��"></asp:button></TD>
													<TD>
														<asp:label id="lab_assestName" runat="server" Text="�W��"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_name" runat="server" Enabled="False"></asp:textbox></TD>
												</TR>
												<TR>
													<TD style="HEIGHT: 21px">
														<asp:label id="lab_MerchindiseDetailAccount" runat="server" Text="���ʼƶq"></asp:label></TD>
													<TD style="HEIGHT: 21px">
														<asp:textbox id="txt_MerchindiseDetailAccount" runat="server" AutoPostBack="True"></asp:textbox></TD>
													<TD style="HEIGHT: 21px">
														<asp:label id="lab_MerchindiseDetailUnitPrice" runat="server" Text="�t�|���"></asp:label></TD>
													<TD style="HEIGHT: 21px">
														<asp:textbox id="txt_MerchindiseDetailUnitPrice" runat="server" AutoPostBack="True"></asp:textbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:label id="lab_MerchindiseDetailPrice" runat="server" Text="�t�|���B"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_MerchindiseDetailPrice" runat="server" Enabled="False"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_MerchindiseDetailDate" runat="server" Text="�w�w��f��"></asp:label></TD>
													<TD>
														<wc:inputcalendar id="txt_MerchindiseDetailDate" runat="server"></wc:inputcalendar></TD>
												</TR>
												<TR>
													<TD>
														<asp:label id="lab_MerchindiseDetailUnit" runat="server" Text="�J�w���"></asp:label></TD>
													<TD>
														<asp:TextBox id="txt_unit" runat="server" Enabled="False"></asp:TextBox></TD>
													<TD>
														<asp:label id="lab_MerchindiseDetailJudgeUnit" runat="server" Text="�p�����"></asp:label></TD>
													<TD>
														<asp:dropdownlist id="dpl_MerchindiseDetailJudgeUnit" runat="server"></asp:dropdownlist></TD>
												</TR>
												<TR>
													<asp:label id="lab_isBonded" runat="server" Visible="False" Text="�O�_�O�|">�O�_�O�|</asp:label>
													<asp:checkbox id="chk_isBonded" runat="server" Visible="False"></asp:checkbox>
													<TD>
														<asp:label id="lab_isCheck" runat="server" Text="�O�_�~��"></asp:label></TD>
													<TD>
														<asp:checkbox id="chk_isCheck" runat="server"></asp:checkbox></TD>
													<TD>
														<asp:label id="lab_requistionUse" runat="server" Text="�γ~"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_requistionUse" runat="server"></asp:textbox></TD>
													<asp:label id="lab_isInventory" runat="server" Visible="False" Text="�O�_�J�w"></asp:label>
													<asp:checkbox id="chk_isInventory" runat="server" Visible="False"></asp:checkbox></TR>
												<TR>
													<TD>
														<asp:label id="lab_cancelAccount" runat="server" Text="�����ƶq"></asp:label></TD>
													<TD>
														<asp:textbox id="txt_cancelAccount" runat="server"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_RequistionDate" runat="server" Text="�ݨD���"></asp:label></TD>
													<TD>
														<wc:inputcalendar id="txt_RequistionDate" runat="server"></wc:inputcalendar></TD>
												</TR>
												<TR>
													<TD><FONT face="�s�ө���">
															<asp:label id="lab_inputPeriod" runat="server" Text="�i�f�g��"></asp:label></FONT></TD>
													<TD>
														<asp:textbox id="txt_inputPeriod" runat="server"></asp:textbox></TD>
													<TD>
														<asp:label id="lab_isInAccount" runat="server" Visible="False" Text="�O�_�O�b">�O�_�O�b</asp:label></TD>
													<TD>
														<asp:checkbox id="chk_isInAccount" runat="server" Visible="False"></asp:checkbox></TD>
												</TR>
												<TR>
													<TD>
														<asp:label id="lab_MerchindiseId" runat="server" Visible="False" Text=""></asp:label></TD>
												</TR>
												<TR>
													<TD colSpan="2">
														<asp:label id="func_Detail" runat="server" Visible="False" Text=""></asp:label>
														<asp:button id="btn_detail_add_edit" runat="server" Text="�O�s"></asp:button></TD>
												</TR>
												<TR>
													<TD colSpan="4">
														<asp:datagrid id="dg_MerchindiseDetailSite" runat="server" AutoGenerateColumns="False" CellSpacing="2"
															CellPadding="2">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn HeaderText="Id" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_Id" runat="server">Id</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="zdno">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_zdno" runat="server">���ƽs��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_zdno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_zdno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseNo") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="assestName">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_assestName" runat="server">�W��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_assestName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductName")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_assestName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductName") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailAccount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailAccount" runat="server">���ʼƶq</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailAccount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseCount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailAccount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailUnitPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailUnitPrice" runat="server">�t�|���</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailUnitPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitPriceNoTax")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailUnitPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnitPriceNoTax") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailPrice" runat="server">�t�|���B</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PriceNoTax")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PriceNoTax") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailDate" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailDate" runat="server"></asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectArriveDate","{0:d}")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectArriveDate","{0:d}") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailUnit">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailUnit" runat="server">�J�w���</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailUnit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InputInventoryUnit")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailUnit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InputInventoryUnit") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:BoundColumn HeaderText="�w�J�w�ƶq" DataField="inInventoryCount"></asp:BoundColumn>
																<asp:TemplateColumn HeaderText="MerchindiseDetailJudgeUnit">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseDetailJudgeUnit" runat="server">�p�����</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseDetailJudgeUnit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ValidateUnit")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseDetailJudgeUnit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ValidateUnit") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="isBonded" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_isBonded" runat="server">isBonded</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_isBonded" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsBonded")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_isBonded" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isBonded") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="isCheck" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_isCheck" runat="server">isCheck</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_isCheck" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsCheck")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_isCheck" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isCheck") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="RequistionDate" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_RequistionDate" runat="server">�ݨD���</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_RequistionDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssetsDate","{0:d}")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_RequistionDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssetsDate","{0:d}") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="isInventory" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_isInventory" runat="server">�O�_�J�w</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_isInventory" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsStock")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_isInventory" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsStock") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="inputPeriod" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_inputPeriod" runat="server">inputPeriod</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_inputPeriod" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InputPeriod")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_inputPeriod" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inputPeriod") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="isInAccount" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_isInAccount" runat="server">isInAccount</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_isInAccount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsInAccount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_isInAccount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isInAccount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="cancelAccount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_cancelAccount" runat="server">�����ƶq</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_cancelAccount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CancelAccount")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_cancelAccount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.cancelAccount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="cancelAccount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_cavity" runat="server">�ҥ޼�</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_cavity" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.cavity")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_cavity" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.cavity") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="requistionUse" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_requistionUse" runat="server">requistionUse</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_requistionUse" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequistionUse")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_requistionUse" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.requistionUse") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MerchindiseId" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MerchindiseId" runat="server">MerchindiseId</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MerchindiseId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId")%>'/>
																	</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MerchindiseId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseId") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="���" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
																<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�T�w�O�_�R��')&quot;>�R��</div>" HeaderText="���"
																	CommandName="Delete"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</asp:datagrid>
														<HR style="COLOR: #ccccff">
														<BR>
													</TD>
												</TR>
											</TABLE>
										</TD>
									</TR>
								</TABLE>
							</asp:panel></TD>
					</tr>
				</TBODY>
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
			</TD></TR>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
