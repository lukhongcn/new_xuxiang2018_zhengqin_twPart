<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MerchindiseDetailSiteList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseDetailSiteList" %>
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
					<tr>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">���ʩ���</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_zdno" runat="server" Text="���ƽs��"></asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="�d��"></asp:button></td>
												<td><asp:label id="lab_assestName" runat="server" Text="�W��"></asp:label></td>
												<td><asp:textbox id="txt_name" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseDetailAccount" runat="server" Text="���ʼƶq"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailAccount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_MerchindiseDetailUnitPrice" runat="server" Text="���|���"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailUnitPrice" runat="server" AutoPostBack="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseDetailPrice" runat="server" Text="���|���B"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailPrice" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_MerchindiseDetailDate" runat="server" Text="�w�w��f��"></asp:label></td>
												<td><wc:inputcalendar id="txt_MerchindiseDetailDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td style="HEIGHT: 15px"><asp:label id="lab_MerchindiseDetailUnit" runat="server" Text="�J�w���"></asp:label></td>
												<td style="HEIGHT: 15px">
													<asp:TextBox id="txt_unit" runat="server" Enabled="False"></asp:TextBox></td>
												<td style="HEIGHT: 15px"><asp:label id="lab_MerchindiseDetailJudgeUnit" runat="server" Text="�p�����"></asp:label></td>
												<td style="HEIGHT: 15px"><asp:dropdownlist id="dpl_MerchindiseDetailJudgeUnit" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<asp:label id="lab_isBonded" runat="server" Text="�O�_�O�|" Visible="False">�O�_�O�|</asp:label>
												<asp:checkbox id="chk_isBonded" runat="server" Visible="False"></asp:checkbox>
												<td><asp:label id="lab_isInventory" runat="server" Text="�O�_�J�w"></asp:label></td>
												<td><asp:checkbox id="chk_isInventory" runat="server"></asp:checkbox></td>
												<td><asp:label id="lab_isCheck" runat="server" Text="�O�_�~��"></asp:label></td>
												<td><asp:checkbox id="chk_isCheck" runat="server"></asp:checkbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_cancelAccount" runat="server" Text="�����ƶq"></asp:label></td>
												<td><asp:textbox id="txt_cancelAccount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_RequistionDate" runat="server" Text="�ݨD���"></asp:label></td>
												<td><wc:inputcalendar id="txt_RequistionDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_loseRate" runat="server" Text="�l�Ӳv"></asp:label></td>
												<td><asp:textbox id="txt_loseRate" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_inputPeriod" runat="server" Text="�i�f�g��"></asp:label></td>
												<td><asp:textbox id="txt_inputPeriod" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_isInAccount" runat="server" Text="�O�_�O�b" Visible="False">�O�_�O�b</asp:label></td>
												<td><asp:checkbox id="chk_isInAccount" runat="server" Visible="False"></asp:checkbox></td>
												<td><asp:label id="lab_requistionUse" runat="server" Text="�γ~"></asp:label></td>
												<td><asp:textbox id="txt_requistionUse" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseId" runat="server" Text="" Visible="False"></asp:label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="4"><asp:datagrid id="dg_MerchindiseDetailSite" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
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
																	<asp:Label id="dg_header_MerchindiseDetailUnitPrice" runat="server">���|���</asp:Label>
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
																	<asp:Label id="dg_header_MerchindiseDetailPrice" runat="server">���|���B</asp:Label>
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
															<asp:TemplateColumn HeaderText="loseRate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_loseRate" runat="server">�l�Ӳv</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_loseRate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.LoseRate")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_loseRate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.loseRate") %>'/>
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
