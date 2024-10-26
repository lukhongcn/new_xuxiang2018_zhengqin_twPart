<%@ Register TagPrefix="Forum1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="projectBudgetHeader" Src="controls/projectBudgetHeader.ascx" %>
<%@ Page smartNavigation="True" language="c#" Codebehind="ProjectBudgetView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProjectBudgetView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>���عw�����</title> 
		<!-- smartNavigation="True" -->
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript" src="../js/lib.js"></script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="6.18%"></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:projectbudgetheader id="projectBudgetHeader" runat="server"></uc1:projectbudgetheader><br>
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">���عw�����</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<TBODY>
									<tr>
										<td vAlign="top">
											<table width="100%" align="center" border="0">
												<asp:label id="lab_id" runat="server" Text="" Visible="False"></asp:label>
												<tr>
													<td style="WIDTH: 100px; HEIGHT: 47px"><asp:label id="lab_productName" runat="server" Text="���~�W��"></asp:label></td>
													<td style="WIDTH: 153px; HEIGHT: 47px"><asp:textbox id="txt_productName" runat="server"></asp:textbox></td>
													<td style="WIDTH: 86px; HEIGHT: 47px"><asp:label id="lab_productPictureNo" runat="server" Text="�ϸ�"></asp:label></td>
													<td style="WIDTH: 159px; HEIGHT: 47px"><asp:textbox id="txt_productPictureNo" runat="server"></asp:textbox></td>
													<td style="WIDTH: 53px; HEIGHT: 47px"><asp:label id="lab_porductPic" runat="server" Text="���~�Ϥ�"></asp:label></td>
													<td style="WIDTH: 188px; HEIGHT: 47px"><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox></td>
													<td style="WIDTH: 37px; HEIGHT: 150px" rowSpan="3"><asp:image id="img_product" runat="server" Visible="False"></asp:image></td>
												</tr>
												<tr>
													<td style="WIDTH: 100px; HEIGHT: 50px"><asp:label id="lab_customerId" runat="server" Text="�Ȥ�W��"></asp:label></td>
													<td style="WIDTH: 153px; HEIGHT: 50px"><asp:dropdownlist id="dpl_customerId" runat="server" Width="136px"></asp:dropdownlist></td>
													<td style="WIDTH: 86px; HEIGHT: 50px"><asp:label id="lab_budgetDate" runat="server" Text="�w����"></asp:label></td>
													<td style="WIDTH: 159px; HEIGHT: 50px"><wc:inputcalendar id="txt_budgetDate" runat="server"></wc:inputcalendar></td>
													<td style="WIDTH: 53px; HEIGHT: 50px"><asp:label id="lab_totalPrice" runat="server" Text="�O���`�p"></asp:label></td>
													<td style="WIDTH: 188px; HEIGHT: 50px"><asp:textbox id="txt_totalPrice" runat="server" Enabled="False"></asp:textbox></td>
												</tr>
												<tr>
													<td style="WIDTH: 37px; HEIGHT: 49px"><asp:label id="lab_creater" runat="server" Text="��w��"></asp:label></td>
													<td style="HEIGHT: 49px"><asp:textbox id="txt_creater" runat="server"></asp:textbox></td>
													<td style="WIDTH: 100px; HEIGHT: 49px"><asp:label id="lab_checker" runat="server" Text="�f��"></asp:label></td>
													<td style="WIDTH: 153px; HEIGHT: 49px"><asp:dropdownlist id="dpl_checker" runat="server" Width="136px"></asp:dropdownlist></td>
													<td style="WIDTH: 86px; HEIGHT: 49px"><asp:label id="lab_approver" runat="server" Text="�֭�"></asp:label></td>
													<td style="WIDTH: 159px; HEIGHT: 49px"><asp:dropdownlist id="dpl_approver" runat="server" Width="136px"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td style="WIDTH: 53px"><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
													<td style="WIDTH: 188px"><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
													<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s" Visible="False"></asp:button><asp:label id="lab_projectBudgetId" runat="server" Visible="False"></asp:label></TD>
												</tr>
											</table>
											<br>
											<br>
											<!-- test01- materialHeatedPrice -->
											<table width="100%" align="center" border="0">
												<tr>
													<hr style="COLOR: #ccccff">
													<asp:label id="labtest" runat="server" Visible="False">init</asp:label></tr>
												<tr>
													<td>����/���B�z�O</td>
												</tr>
												<asp:label id="lab_MaterialHeatedPriceid" runat="server" Text="" Visible="False"></asp:label>
												<tr>
													<td><asp:label id="lab_MaterialHeatedPriceprojectBudgetId" runat="server" Text="projectBudgetId"
															Visible="False"></asp:label></td>
												</tr>
												<tr>
													<td style="HEIGHT: 4px"><asp:label id="lab_MaterialHeatedPriceprojectTypeId" runat="server" Text="����"></asp:label></td>
													<td style="HEIGHT: 4px"><asp:dropdownlist id="dpl_MaterialHeatedPriceprojectTypeId" runat="server" Width="135px"></asp:dropdownlist></td>
													<td style="HEIGHT: 4px"><asp:label id="lab_MaterialHeatedPricematerialId" runat="server" Text="����"></asp:label></td>
													<td style="HEIGHT: 4px"><asp:dropdownlist id="dpl_MaterialHeatedPricematerialId" runat="server" Width="135px"></asp:dropdownlist></td>
												</tr>
												<tr>
													<td><asp:label id="lab_MaterialHeatedPricespec" runat="server" Text="�ؤo"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPricespec" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_MaterialHeatedPricecount" runat="server" Text="���"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPricecount" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_MaterialHeatedPriceweight" runat="server" Text="���q"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPriceweight" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_MaterialHeatedPricematerialPrice" runat="server" Text="���Ƴ��"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPricematerialPrice" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_MaterialHeatedPricematerialTotalPrice" runat="server" Text="���ƶO"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPricematerialTotalPrice" runat="server" Enabled="False">���Ƴ��&#215;���</asp:textbox><asp:label id="Label1" runat="server" DESIGNTIMEDRAGDROP="9146">�p��ұo</asp:label></td>
													<td><asp:label id="lab_MaterialHeatedPriceheatPrice" runat="server" Text="���B�z���"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPriceheatPrice" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_MaterialHeatedPriceheatTotalPrice" runat="server" Text="���B�z�O��"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPriceheatTotalPrice" runat="server" Enabled="False">���B�z���&#215;���q</asp:textbox><asp:label id="Label2" runat="server">�p��ұo</asp:label></td>
													<td><asp:label id="lab_MaterialHeatedPricecomment" runat="server" Text="�Ƶ�"></asp:label></td>
													<td><asp:textbox id="txt_MaterialHeatedPricecomment" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="MaterialHeatedPricefunc" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_MaterialHeatedPriceadd_edit" runat="server" Text="�O�s"></asp:button></td>
													<td><asp:label id="lab_materialHeatedPriceAllTotalPrice" Visible="False" Runat="server"></asp:label></td>
												</tr>
												<TR>
													<TD><asp:label id="lab_Mdplid" runat="server" Visible="False"></asp:label><asp:label id="lab_CZdplid" runat="server" Visible="False"></asp:label></TD>
													<td></td>
												</TR>
											</table>
											<table>
												<tr>
													<td><FORUM1:DGSELF id="dg_MaterialHeatedPrice" runat="server" AutoGenerateColumns="False" CellSpacing="2"
															CellPadding="2" AllowPaging="True">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn Visible="False" HeaderText="id">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceid" runat="server">id</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPriceid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																
</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="projectTypeId" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceprojectTypeId" runat="server">����id</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																		&nbsp;
																		<asp:Label id="dg_lab_MaterialHeatedPriceprojectTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectTypeId")%>'/>
																		</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="ProjectName">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceProjectName" runat="server">����</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPriceProjectName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectName")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:DropDownList id="dg_txt_MaterialHeatedPriceprojectTypeId" Width="80" runat="server"></asp:DropDownList>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="MaterialId" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceMaterialId" runat="server">����id</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
&nbsp;
<asp:Label id="dg_lab_MaterialHeatedPriceMaterialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>

</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="materialName">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceMaterialName" runat="server">����</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPriceMaterialName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:DropDownList id="dg_txt_MaterialHeatedPricematerialId" Width="80" runat="server"></asp:DropDownList>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="spec">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPricespec" runat="server">�ؤo</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPricespec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPricespec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.spec") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="count">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPricecount" runat="server">���</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPricecount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Count")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPricecount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.count") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="weight">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceweight" runat="server">���q</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPriceweight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Weight")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPriceweight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.weight") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="materialPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPricematerialPrice" runat="server">���Ƴ��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPricematerialPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialPrice")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPricematerialPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="materialTotalPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPricematerialTotalPrice" runat="server">���ƶO</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPricematerialTotalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialTotalPrice")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPricematerialTotalPrice" Enabled=False Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialTotalPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="heatPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceheatPrice" runat="server">���B�z���</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPriceheatPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeatPrice")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPriceheatPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.heatPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="heatTotalPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPriceheatTotalPrice" runat="server">���B�z�O��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPriceheatTotalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeatTotalPrice")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPriceheatTotalPrice" Enabled=False Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.heatTotalPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="totalPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPricetotalPrice" runat="server">�p�p</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPricetotalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPricetotalPrice" Enabled=False Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="comment">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_MaterialHeatedPricecomment" runat="server">�Ƶ�</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MaterialHeatedPricecomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_MaterialHeatedPricecomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="" EditText="�s��"></asp:EditCommandColumn>
																<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�нT�{�O�_�R��')&quot;&gt;�R��&lt;/div&gt;"
																	HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</FORUM1:DGSELF><asp:label id="lab_totalM" runat="server">����/���B�z�O�X�p�G</asp:label><asp:label id="lab_totalMaterialHeatedPrice" runat="server"></asp:label>
														<hr style="COLOR: #ccccff">
														<br>
													</td>
												</tr>
											</table>
											<!-- end test01- materialHeatedPrice -->
											<!-- test02- standPart -->
											<table width="100%" align="center" border="0">
												<tr>
													<hr style="COLOR: #ccccff">
												</tr>
												<tr>
													<td>�зǥ�</td>
												</tr>
												<asp:label id="lab_StandPartid" runat="server" Text="" Visible="False"></asp:label>
												<tr>
													<td><asp:label id="lab_StandPartprojectBudgetId" runat="server" Text="projectBudgetId" Visible="False"></asp:label></td>
												</tr>
												<tr>
													<td><asp:label id="lab_StandPartprojectTypeId" runat="server" Text="�W��">����</asp:label></td>
													<td>
														<asp:dropdownlist id="dpl_StandPartprojectTypeId" runat="server" Width="136px"></asp:dropdownlist></td>
													<td><asp:label id="lab_StandPartcount" runat="server" Text="�ƶq"></asp:label></td>
													<td><asp:textbox id="txt_StandPartcount" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_StandPartregionalId" runat="server" Text="�ϰ�"></asp:label></td>
													<td><asp:dropdownlist id="txt_StandPartregionalId" runat="server" Width="136px"></asp:dropdownlist></td>
													<td><asp:label id="lab_StandPartcomment" runat="server" Text="�Ƶ�"></asp:label></td>
													<td><asp:textbox id="txt_StandPartcomment" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_StandParttotalPrice" runat="server" Text="�p�p"></asp:label></td>
													<td><asp:textbox id="txt_StandParttotalPrice" runat="server"></asp:textbox></td>
													<TD><asp:label id="StandPartfunc" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_StandPartadd_edit" runat="server" Text="�O�s"></asp:button></TD>
													<td><asp:label id="lab_standPartAllTotalPrice" Visible="False" Runat="server"></asp:label><asp:label id="lab_Sdplid" runat="server" Visible="False"></asp:label><asp:label id="lab_regn" runat="server" Visible="False"></asp:label></td>
												</tr>
											</table>
											<table>
												<tr>
													<td><FORUM1:DGSELF id="dg_StandPart" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
															AllowPaging="True">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn Visible="False" HeaderText="id">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_StandPartid" runat="server">id</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_StandPartid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="projectTypeId" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_StandPartProjectTypeId" runat="server">����</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
&nbsp;
<asp:Label id="dg_lab_StandPartProjectTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectTypeId")%>'/>
</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="projectName">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_StandPartProjectName" runat="server">����</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_StandPartProjectName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectName")%>'/>
																</ItemTemplate>
																	<EditItemTemplate>
																		<asp:DropDownList id="dg_txt_StandPartprojectName" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectName")%>'>
																		</asp:DropDownList>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="count">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_StandPartcount" runat="server">�ƶq</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_StandPartcount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Count")%>'/>
																</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_StandPartcount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.count") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="regionalId" visible="false">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_StandPartregionalId" runat="server">�ϰ�</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_RegionalId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RegionalId")%>'/>
																</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="regionalName">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_RegionalName" runat="server">�ϰ�</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
	&nbsp;
	<asp:Label id="dg_lab_RegionalName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RegionalName")%>'/>
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:DropDownList id="dg_txt_StandPartRegionalName" Width="40" runat="server" />
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="totalPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_StandParttotalPrice" runat="server">�p�p</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_StandParttotalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>
																</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_StandParttotalPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="comment">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_StandPartcomment" runat="server">�Ƶ�</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_StandPartcomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_StandPartcomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="" EditText="�s��"></asp:EditCommandColumn>
																<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�нT�{�O�_�R��')&quot;&gt;�R��&lt;/div&gt;"
																	HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</FORUM1:DGSELF><asp:label id="lab_totalS" runat="server">�зǥ�O�X�p�G</asp:label><asp:label id="lab_totalStanPart" runat="server"></asp:label>
														<hr style="COLOR: #ccccff">
														<br>
													</td>
												</tr>
											</table>
											<!-- end test02- standPart -->
											<!-- test03- productPrice -->
											<table width="100%" align="center" border="0">
												<tr>
													<hr style="COLOR: #ccccff">
												</tr>
												<tr>
													<td>�[�u�O</td>
												</tr>
												<asp:label id="lab_ProductPriceid" runat="server" Text="" Visible="False"></asp:label>
												<tr>
													<td><asp:label id="lab_ProductPriceprojectBudgetId" runat="server" Text="projectBudgetId" Visible="False">projectBudgetId</asp:label><asp:label id="lab_Pdplid" runat="server" Visible="False"></asp:label></td>
												</tr>
												<tr>
													<td><asp:label id="lab_ProductPriceprojectContentId" runat="server" Text="�[�u���e"></asp:label></td>
													<td><asp:dropdownlist id="dpl_ProductPriceprojectContentId" runat="server" Width="137px"></asp:dropdownlist></td>
													<td><asp:label id="lab_ProductPricehourCount" runat="server" Text="�u��"></asp:label></td>
													<td><asp:textbox id="txt_ProductPricehourCount" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td><asp:label id="lab_ProductPriceprice" runat="server" Text="��/�p��"></asp:label></td>
													<td><asp:textbox id="txt_ProductPriceprice" runat="server"></asp:textbox></td>
													<td><asp:label id="lab_ProductPricecomment" runat="server" Text="�Ƶ�"></asp:label></td>
													<td><asp:textbox id="txt_ProductPricecomment" runat="server"></asp:textbox></td>
												</tr>
												<tr>
													<td style="HEIGHT: 16px"><asp:label id="ProductPricefunc" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_ProductPriceadd_edit" runat="server" Text="�O�s"></asp:button></td>
													<td style="HEIGHT: 16px"><asp:label id="lab_productPriceAllTotalPrice" Visible="False" Runat="server"></asp:label></td>
												</tr>
												<TR>
													<TD></TD>
													<td></td>
												</TR>
											</table>
											<table>
												<tr>
													<td><FORUM1:DGSELF id="dg_ProductPrice" runat="server" AutoGenerateColumns="False" CellSpacing="2"
															CellPadding="2" AllowPaging="True">
															<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:TemplateColumn Visible="False" HeaderText="id">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_ProductPriceid" runat="server">id</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ProductPriceid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																
</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="projectContentId" Visible="False">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_ProductPriceProjectProjectContentId" runat="server">�[�u���eid</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
&nbsp;
<asp:Label id="dg_lab_ProductPriceProjectContentId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectContentId")%>'/>
</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="projectContent">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_ProductPriceProjectContent" runat="server">�[�u���e</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ProductPriceProjectContent" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectContent")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:DropDownList id="dg_txt_ProductPriceprojectContentId" Width="80" runat="server"></asp:DropDownList>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="hourCount">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_ProductPricehourCount" runat="server">�u��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ProductPricehourCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HourCount")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_ProductPricehourCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.hourCount") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="price">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_ProductPriceprice" runat="server">��/�p��</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ProductPriceprice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_ProductPriceprice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="totalPrice">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_ProductPricetotalPrice" runat="server">�p�p</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ProductPricetotalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_ProductPricetotalPrice" Enabled=False Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="comment">
																	<HeaderTemplate>
																		<asp:Label id="dg_header_ProductPricecomment" runat="server">�Ƶ�</asp:Label>
																	</HeaderTemplate>
																	<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ProductPricecomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																
</ItemTemplate>
																	<EditItemTemplate>
																		<asp:textbox id="dg_txt_ProductPricecomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																	</EditItemTemplate>
																</asp:TemplateColumn>
																<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="" EditText="�s��"></asp:EditCommandColumn>
																<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�нT�{�O�_�R��')&quot;&gt;�R��&lt;/div&gt;"
																	HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
															</Columns>
															<PagerStyle Mode="NumericPages"></PagerStyle>
														</FORUM1:DGSELF><asp:label id="lab_totalP" runat="server">�[�u�O�X�p�G</asp:label><asp:label id="lab_totalProductPrice" runat="server"></asp:label>
														<hr style="COLOR: #ccccff">
														<br>
													</td>
												</tr>
											</table>
											<!-- end test03- productPrice -->
											<!-- test04- humanPrice -->
											<table width="100%" align="center" border="0">
												<TBODY>
													<tr>
														<td>�H�u�O
															<asp:label id="lab_Hdplid" runat="server"></asp:label></td>
													</tr>
													<asp:label id="lab_HumanPriceid" runat="server" Text="" Visible="False"></asp:label>
													<TBODY>
														<tr>
															<td><asp:label id="lab_HumanPriceprojectBudgetId" runat="server" Text="projectBudgetId" Visible="False"></asp:label></td>
														</tr>
														<tr>
															<td><asp:label id="lab_HumanPriceprojectProcessId" runat="server" Text="���ؤu��"></asp:label></td>
															<td><asp:dropdownlist id="dpl_HumanPriceprojectProcessId" runat="server" Width="137px"></asp:dropdownlist></td>
															<td><asp:label id="lab_HumanPricehourCount" runat="server" Text="�u��" Visible="False">�u��</asp:label><asp:label id="Label3" runat="server">�`��</asp:label></td>
															<td><asp:textbox id="txt_HumanPricehourCount" runat="server" Visible="False" Width="34px">0</asp:textbox><asp:textbox id="txt_humanTot" runat="server"></asp:textbox></td>
														</tr>
														<tr>
															<td><asp:label id="lab_HumanPriceprice" runat="server" Text="��/�p��" Visible="False">��/�p��</asp:label><asp:label id="lab_HumanPricecomment" runat="server" Text="�Ƶ�"></asp:label></td>
															<td><asp:textbox id="txt_HumanPriceprice" runat="server" Visible="False" Width="37px">0</asp:textbox><asp:textbox id="txt_HumanPricecomment" runat="server"></asp:textbox></td>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td><asp:button id="btn_humanadd_edit" runat="server" Text="�O�s"></asp:button><asp:label id="HumanPricefunc" runat="server" Text="" Visible="False"></asp:label></td>
															<td><asp:label id="lab_humanAllTotalPrice" Visible="False" Runat="server"></asp:label></td>
															<TD></TD>
															<td></td>
														</tr>
													</TBODY>
											</table>
											<table>
												<TBODY>
													<FORUM1:DGSELF id="dg_HumanPrice" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
														<HEADERSTYLE BackColor="#AAAADD" VerticalAlign="Middle" HorizontalAlign="Center"></HEADERSTYLE>
														<COLUMNS>
															<ASP:TEMPLATECOLUMN Visible="false" HeaderText="id">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_humanid" runat="server">id</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>&nbsp; 
																			<asp:Label id=dg_lab_HumanPriceid runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'>
																	</asp:Label>
																		</ITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="projectProcessId" Visible="False">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_humanPriceProjectProcessId" runat="server">���ؤu��id</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>&nbsp; 
	<asp:Label id=dg_lab_HumanPriceProjectProcessId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectProcessId")%>'>
																	</asp:Label>
</ITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="projectProcess">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_humanPriceProjectProcess" runat="server">���ؤu��</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>&nbsp; 
																			<asp:Label id=dg_lab_HumanPriceProjectProcess runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectProcess")%>'>
																	</asp:Label>
																		</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:DropDownList id="dg_txt_HumanPriceprojectProcessId" Width="80" runat="server"></asp:DropDownList>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN visible="false" HeaderText="hourCount">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_humanhourCount" runat="server">�u��</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>&nbsp; 
																			<asp:Label id=dg_lab_HumanPricehourCount runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HourCount")%>'>
																	</asp:Label>
																		</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id="dg_txt_HumanPricehourCount" runat="server" Text="0" Width="40"></asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN visible="false" HeaderText="price">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_humanprice" runat="server">��/�p��</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>&nbsp; 
																			<asp:Label id="dg_lab_HumanPriceprice" runat="server" Text="0"></asp:Label>
																		</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id="dg_txt_HumanPriceprice" runat="server" Text="0" Width="40"></asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="totalPrice">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_humantotalPrice" runat="server">�`��</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>&nbsp; 
																			<asp:Label id=dg_lab_HumanPricetotalPrice runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'>
																	</asp:Label>
																		</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_HumanPricetotalPrice Enabled=true runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:TEMPLATECOLUMN HeaderText="comment">
																<HEADERTEMPLATE>
																	<asp:Label id="dg_header_humancomment" runat="server">�Ƶ�</asp:Label>
																</HEADERTEMPLATE>
																<ITEMTEMPLATE>
																	<asp:Label id=dg_lab_HumanPricecomment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'>
																	</asp:Label>
																</ITEMTEMPLATE>
																<EDITITEMTEMPLATE>
																	<asp:textbox id=dg_txt_HumanPricecomment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>' Width="40">
																	</asp:textbox>
																</EDITITEMTEMPLATE>
															</ASP:TEMPLATECOLUMN>
															<ASP:EDITCOMMANDCOLUMN HeaderText="�ʧ@" EditText="�s��" CancelText="" UpdateText="��s" ButtonType="LinkButton"></ASP:EDITCOMMANDCOLUMN>
															<ASP:BUTTONCOLUMN Text="<div onclick=&quot;javascript:return confirm('�нT�{�O�_�R��?')&quot;>�R��</div>" HeaderText="�ʧ@"
																CommandName="Delete"></ASP:BUTTONCOLUMN>
														</COLUMNS>
														<PAGERSTYLE Mode="NumericPages"></PAGERSTYLE>
													</FORUM1:DGSELF><asp:label id="lab_totalH" runat="server">�H�u�O�X�p�G</asp:label><asp:label id="lab_totalHumanPrice" runat="server"></asp:label>
													<hr style="COLOR: #ccccff">
										</td>
									</tr>
								</TBODY>
							</TABLE>
							<table width="100%" align="center" border="0">
								<TR>
									<HR style="COLOR: #ccccff">
								</TR>
								<TR>
									<TD>��L�O��
										<asp:label id="lab_Odplid" runat="server"></asp:label></TD>
								</TR>
								<asp:label id="lab_OtherPriceid" runat="server" Text="" Visible="False"></asp:label>
								<TR>
									<TD><asp:label id="lab_OtherPriceprojectBudgetId" runat="server" Text="projectBudgetId" Visible="False">projectBudgetId</asp:label></TD>
								</TR>
								<TR>
									<TD><asp:label id="lab_OtherPriceprojectProcessId" runat="server" Text="�u��">�W��</asp:label></TD>
									<TD>
										<asp:textbox id="txt_OtherPriceprojectProcess" runat="server"></asp:textbox></TD>
									<TD><asp:label id="lab_OtherPricehourCount" runat="server" Text="�u��" Visible="False">�u��</asp:label><asp:label id="Label5" runat="server">�`��</asp:label></TD>
									<TD><asp:textbox id="txt_OtherPricehourCount" runat="server" Visible="False" Width="60px">0</asp:textbox><asp:textbox id="txt_otherTot" runat="server"></asp:textbox></TD>
								</TR>
								<TR>
									<TD><asp:label id="lab_OtherPriceprice" runat="server" Text="�����p��" Visible="False">�����p��</asp:label><asp:label id="lab_OtherPricecomment" runat="server" Text="�Ƶ�"></asp:label></TD>
									<TD><asp:textbox id="txt_OtherPriceprice" runat="server" Visible="False" Width="42px">0</asp:textbox><asp:textbox id="txt_OtherPricecomment" runat="server"></asp:textbox></TD>
									<TD></TD>
									<TD></TD>
								</TR>
								<TR>
									<TD><asp:label id="OtherPricefunc" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_OtherPriceadd_edit" runat="server" Text="�O�s"></asp:button></TD>
									<TD><asp:label id="lab_otherPriceAllTotalPrice" Visible="False" Runat="server"></asp:label></TD>
									<TD></TD>
									<TD></TD>
								</TR>
							</table>
							<FORUM1:DGSELF id="dg_OtherPrice" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
								AllowPaging="True">
								<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn Visible="False" HeaderText="id">
										<HeaderTemplate>
											<asp:Label id="dg_header_OtherPriceid" runat="server">id</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_OtherPriceid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																
</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="projectProcessId" Visible="False">
										<HeaderTemplate>
											<asp:Label id="dg_header_OtherPriceProjectProcessId" runat="server">�u��id</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
	&nbsp;
	<asp:Label id="dg_lab_OtherPriceProjectProcessId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectProcessId")%>'/>		
</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="projectProcess">
										<HeaderTemplate>
											<asp:Label id="dg_header_OtherPriceProjectProcess" runat="server">�W��</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_OtherPriceProjectProcess" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectProcess")%>'/>
																
</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_OtherPriceprojectProcess" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProjectProcess")%>'/></asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="hourCount" Visible="False">
										<HeaderTemplate>
											<asp:Label id="dg_header_OtherPricehourCount" runat="server">�u��</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_OtherPricehourCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HourCount")%>'/>
																
</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_OtherPricehourCount" Width="40" runat="server" Text="0" />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="price" Visible="False">
										<HeaderTemplate>
											<asp:Label id="dg_header_OtherPriceprice" runat="server">�����p��</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_OtherPriceprice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																
</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_OtherPriceprice" Width="40" runat="server" Text="0" />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="totalPrice">
										<HeaderTemplate>
											<asp:Label id="dg_header_OtherPricetotalPrice" runat="server">�`��</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_OtherPricetotalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>
																
</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_OtherPricetotalPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.totalPrice") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="comment">
										<HeaderTemplate>
											<asp:Label id="dg_header_OtherPricecomment" runat="server">�Ƶ�</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_OtherPricecomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																
</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_OtherPricecomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="" EditText="�s��"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�нT�{�O�_�R��')&quot;&gt;�R��&lt;/div&gt;"
										HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</FORUM1:DGSELF>
							<!-- end test04- humanPrice -->
							<!-- test05- otherPrice -->
							<table>
								<tr>
									<td><asp:label id="lab_totalO" runat="server">��L�O�ΦX�p�G</asp:label><asp:label id="lab_totalOtherPrice" runat="server"></asp:label>
										<hr style="COLOR: #ccccff">
										<br>
									</td>
								</tr>
							</table>
							<!-- end test05- otherPrice -->
							<!-- test06- ElectPrice -->
							<table width="100%" align="center" border="0">
								<tr>
									<hr style="COLOR: #ccccff">
								</tr>
								<tr>
									<td>�q���O</td>
								</tr>
								<asp:label id="lab_ElectPriceid" runat="server" Text="" Visible="False"></asp:label>
								<tr>
									<td><asp:label id="lab_ElectPriceprojectBudgetId" runat="server" Text="projectBudgetId" Visible="False">projectBudgetId</asp:label><asp:label id="lab_Edplid" runat="server" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td><asp:label id="lab_ElectPriceName" runat="server" Text="�W��"></asp:label></td>
									<td><asp:textbox id="txt_ElectPriceName" runat="server" Width="137px"></asp:textbox></td>
									<td><asp:label id="lab_ElectPricetotal" runat="server" Text="�p�p"></asp:label></td>
									<td><asp:textbox id="txt_ElectPricetotal" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:label id="lab_ElectPricecomment" runat="server" Text="�Ƶ�"></asp:label></td>
									<td><asp:textbox id="txt_ElectPricecomment" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td style="HEIGHT: 16px"><asp:label id="ElectPricefunc" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_ElectPriceadd_edit" runat="server" Text="�O�s"></asp:button></td>
									<td style="HEIGHT: 16px"><asp:label id="lab_ElectPriceAllTotalPrice" Visible="False" Runat="server"></asp:label></td>
								</tr>
								<TR>
									<TD></TD>
									<td></td>
								</TR>
							</table>
							<table>
								<tr>
									<td><FORUM1:DGSELF id="dg_ElectPrice" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2"
											AllowPaging="True">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn Visible="False" HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_ElectPriceid" runat="server">id</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
	&nbsp;
	<asp:Label id="dg_lab_ElectPriceid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>

</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="ElectName">
													<HeaderTemplate>
														<asp:Label id="dg_header_ElectPriceName" runat="server">�W��</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
	&nbsp;
	<asp:Label id="dg_lab_ElectPriceName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>

</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_ElectPriceName" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'>
														</asp:textbox>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="totalPrice">
													<HeaderTemplate>
														<asp:Label id="dg_header_ElectPriceTotalPrice" runat="server">�p�p</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
	&nbsp;
	<asp:Label id="dg_lab_ElectPriceTotalPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice")%>'/>

</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_ElectPriceTotalPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TotalPrice") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="comment">
													<HeaderTemplate>
														<asp:Label id="dg_header_ElectPricecomment" runat="server">�Ƶ�</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
	&nbsp;
	<asp:Label id="dg_lab_ElectPricecomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>

</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_ElectPricecomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="" EditText="�s��"></asp:EditCommandColumn>
												<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�нT�{�O�_�R��')&quot;&gt;�R��&lt;/div&gt;"
													HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</FORUM1:DGSELF><asp:label id="Label4" runat="server">
										<br>�q���O�X�p�G</asp:label><asp:label id="lab_totalElectPrice" runat="server"></asp:label>
										<hr style="COLOR: #ccccff">
										<br>
									</td>
								</tr>
							</table>
							<!-- end test06- ElectPrice -->
							<table>
								<tr>
									<td><asp:button id="btn_savaAll" runat="server" Text="�O�s����" Width="99px"></asp:button></td>
								</tr>
							</table>
							<table>
								<tr>
									<td style="WIDTH: 819px" colSpan="2">
										<hr style="COLOR: #ccccff">
										<br>
									</td>
								</tr>
							</table>
						</TD>
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
