<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="BomDetailEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomDetailEdit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
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
										<div align="left"></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label><asp:label id="lab_detail" runat="server" Text="" Visible="False"></asp:label>
											<tr>
												<td><asp:label id="lab_bomDesignNo" runat="server" Text="�渹"></asp:label></td>
												<td><asp:textbox id="txt_bomDesignNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_partName" runat="server" Text="�s��W��"></asp:label></td>
												<td><asp:textbox id="txt_partName" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_partNo" runat="server" Text="�s��s��"></asp:label></td>
												<td><asp:textbox id="txt_partNo" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_pictureNo" runat="server" Text="pictureNo">�ϸ�</asp:label></td>
												<td><asp:textbox id="txt_pictureNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_spec" runat="server" Text="�W��"></asp:label></td>
												<td><asp:textbox id="txt_spec" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_prepareMethod" runat="server" Text="�ƮƤ覡"></asp:label></td>
												<td><asp:textbox id="txt_prepareMethod" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_materialId" runat="server" Text="����"></asp:label></td>
												<td><FONT face="�s�ө���"><asp:dropdownlist id="dpl_materialId" runat="server"></asp:dropdownlist></FONT></td>
												<td><asp:label id="lab_weight" runat="server" Text="�歫"></asp:label></td>
												<td><asp:textbox id="txt_weight" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_requireCount" runat="server" Text="�ݨD�ƶq"></asp:label></td>
												<td><asp:textbox id="txt_requireCount" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_isChecked" runat="server" Text="�O�_�֮�"></asp:label></td>
												<td><asp:dropdownlist id="dpl_isChecked" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_productMaterialInventoryId" runat="server" Text="���ƽs��"></asp:label></td>
												<td><asp:textbox id="txt_productMaterialInventoryId" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_coner" runat="server" Text="�ɨ�"></asp:label></td>
												<td><asp:textbox id="txt_coner" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_materialUsedWay" runat="server" Text="���ƥγ~"></asp:label></td>
												<td><asp:textbox id="txt_materialUsedWay" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_heatProcess" runat="server" Text="���B�z�覡"></asp:label></td>
												<td><asp:textbox id="txt_heatProcess" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_headHard" runat="server" Text="���B�z�w��"></asp:label></td>
												<td><asp:textbox id="txt_headHard" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_behindProcess" runat="server" Text="��B�z"></asp:label></td>
												<td><asp:textbox id="txt_behindProcess" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_interfaceProcess" runat="server" Text="���B�z"></asp:label></td>
												<td><asp:textbox id="txt_interfaceProcess" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_normalSize" runat="server" Text="�����ؤo"></asp:label></td>
												<td><asp:textbox id="txt_normalSize" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_glassSize" runat="server" Text="���O�ؤo"></asp:label></td>
												<td><asp:textbox id="txt_glassSize" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_uglySize" runat="server" Text="��Ƥؤo"></asp:label></td>
												<td><asp:textbox id="txt_uglySize" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_sizeType" runat="server" Text="�ؤo���O"></asp:label></td>
												<td><asp:textbox id="txt_sizeType" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_needChecked" runat="server" Text="�O�_�~��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_needChecked" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_materialUnit" runat="server" Text="���"></asp:label></td>
												<td><asp:textbox id="txt_materialUnit" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_moduleTypeId" runat="server" Text="�s������"></asp:label></td>
												<td><asp:dropdownlist id="dpl_moduleTypeId" runat="server"></asp:dropdownlist></td>
												<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button><asp:button id="btn_back" runat="server" Text="��  �^"></asp:button></TD>
											</tr>
											<tr>
												<td colSpan="6"><asp:datagrid id="dg_BomDetail" runat="server" AutoGenerateColumns="False" AllowPaging="True"
														CellPadding="2" CellSpacing="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="bomDesignNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_bomDesignNo" runat="server">�渹</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_bomDesignNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomDesignNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_bomDesignNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.bomDesignNo") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partName" runat="server">�s��W��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_partName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partName") %>'/>
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
															<asp:TemplateColumn Visible="False" HeaderText="pictureNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_pictureNo" runat="server">pictureNo</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_pictureNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_pictureNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pictureNo") %>'/>
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
															<asp:TemplateColumn HeaderText="prepareMethod">
																<HeaderTemplate>
																	<asp:Label id="dg_header_prepareMethod" runat="server">�ƮƤ覡</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_prepareMethod" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PrepareMethod")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_prepareMethod" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.prepareMethod") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialId" runat="server">����</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_materialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="weight">
																<HeaderTemplate>
																	<asp:Label id="dg_header_weight" runat="server">�歫</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_weight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Weight")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_weight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.weight") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="requireCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_requireCount" runat="server">�ݨD�ƶq</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_requireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_requireCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.requireCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server">�Ƶ�</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="isChecked">
																<HeaderTemplate>
																	<asp:Label id="dg_header_isChecked" runat="server">�O�_�֮�</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_isChecked" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsChecked")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_isChecked" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isChecked") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="productMaterialInventoryId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_productMaterialInventoryId" runat="server">���ƽs��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_productMaterialInventoryId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialInventoryId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_productMaterialInventoryId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="coner">
																<HeaderTemplate>
																	<asp:Label id="dg_header_coner" runat="server">�ɨ�</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_coner" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Coner")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_coner" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.coner") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialUsedWay">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialUsedWay" runat="server">���ƥγ~</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_materialUsedWay" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialUsedWay")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_materialUsedWay" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialUsedWay") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="heatProcess">
																<HeaderTemplate>
																	<asp:Label id="dg_header_heatProcess" runat="server">���B�z�覡</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_heatProcess" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeatProcess")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_heatProcess" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.heatProcess") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="headHard">
																<HeaderTemplate>
																	<asp:Label id="dg_header_headHard" runat="server">���B�z�w��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_headHard" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeadHard")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_headHard" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.headHard") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="behindProcess">
																<HeaderTemplate>
																	<asp:Label id="dg_header_behindProcess" runat="server">��B�z</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_behindProcess" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BehindProcess")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_behindProcess" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.behindProcess") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="interfaceProcess">
																<HeaderTemplate>
																	<asp:Label id="dg_header_interfaceProcess" runat="server">���B�z</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_interfaceProcess" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InterfaceProcess")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_interfaceProcess" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.interfaceProcess") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="normalSize">
																<HeaderTemplate>
																	<asp:Label id="dg_header_normalSize" runat="server">�����ؤo</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_normalSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.NormalSize")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_normalSize" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.normalSize") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="glassSize">
																<HeaderTemplate>
																	<asp:Label id="dg_header_glassSize" runat="server">���O�ؤo</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_glassSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.GlassSize")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_glassSize" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.glassSize") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="uglySize">
																<HeaderTemplate>
																	<asp:Label id="dg_header_uglySize" runat="server">��Ƥؤo</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_uglySize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglySize")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_uglySize" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.uglySize") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="sizeType">
																<HeaderTemplate>
																	<asp:Label id="dg_header_sizeType" runat="server">�ؤo���O</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_sizeType" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SizeType")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_sizeType" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.sizeType") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="needChecked">
																<HeaderTemplate>
																	<asp:Label id="dg_header_needChecked" runat="server">�O�_�~��</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_needChecked" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.NeedChecked")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_needChecked" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.needChecked") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialUnit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialUnit" runat="server">���</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_materialUnit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialUnit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_materialUnit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialUnit") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="moduleTypeId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_moduleTypeId" runat="server">�s������</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_moduleTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleTypeId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_moduleTypeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleTypeId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="�s��" CancelText="??" EditText="�s��"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�{�R����')&quot;&gt;�R��&lt;/div&gt;"
																HeaderText="�R��" CommandName="Delete"></asp:ButtonColumn>
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
												<DIV align="center"><B>message</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="Red"></asp:label></TD>
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
