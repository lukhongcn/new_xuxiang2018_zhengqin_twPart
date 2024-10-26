<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="BomDetailHeader" Src="controls/BomDetailHeader.ascx" %>
<%@ Page language="c#" Codebehind="BomDetailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.BomDetailView" %>
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
										<div align="left"><uc1:bomdetailheader id="BomDetailHeader" runat="server"></uc1:bomdetailheader></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<TBODY>
									<tr>
										<td><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
										<td><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:label id="lab_Id" runat="server" Visible="False"></asp:label><asp:label id="lab_designNo" runat="server" Visible="False"></asp:label><asp:label id="lab_retrun_designid" runat="server" Visible="False"></asp:label></td>
										<td><asp:label id="lab_moduleid" runat="server"></asp:label><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></td>
										<td><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									</tr>
									<tr>
										<td><asp:label id="lab_creater" runat="server" Text="創建人"></asp:label></td>
										<td><asp:dropdownlist id="dpl_creater" runat="server"></asp:dropdownlist></td>
										<td><asp:label id="lab_createDate" runat="server" Text="創建日期"></asp:label></td>
										<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar></td>
									</tr>
									<tr>
										<td><asp:label id="lab_productno" runat="server" Text="工令單號"></asp:label></td>
										<td colSpan="3"><asp:textbox id="txt_productno" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td colSpan="4">BOM明細</td>
									</tr>
									<tr>
										<td><asp:label id="lab_partNo" runat="server" Text="零件編號"></asp:label></td>
										<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox></td>
										<td><asp:label id="lab_partName" runat="server" Text="零件名稱"></asp:label></td>
										<td><asp:textbox id="txt_name" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_uglySpec" text="規格（毛）" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_uglySpec" Runat="server"></asp:textbox></td>
										<td><asp:label id="lab_spec" runat="server" Text="規格（實）"></asp:label></td>
										<td><asp:textbox id="txt_spec" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_uglyLength" Text="長（毛）" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_uglyLength" Runat="server"></asp:textbox></td>
										<td><asp:label id="lab_length" Text="長（實）" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_length" Runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_materialId" runat="server" Text="材料"></asp:label></td>
										<td><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></td>
										<td><asp:label id="lab_requireCount" runat="server" Text="數量"></asp:label></td>
										<td><asp:textbox id="txt_requireCount" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_moldSkleton" Text="模架" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_moldSkleton" Runat="server"></asp:textbox></td>
										<td><asp:label id="lab_stand" Text="標準件" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_stand" Runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_skillRequirement" text="HRC" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_skillRequirement" Runat="server"></asp:textbox></td>
										<td><asp:label id="lab_IsMerchindise" Text="是否採購" Runat="server"></asp:label></td>
										<td><asp:dropdownlist id="dpl_isMerchindise" Runat="server">
												<asp:ListItem Value="0">否</asp:ListItem>
												<asp:ListItem Value="1">是</asp:ListItem>
											</asp:dropdownlist></td>
									</tr>
									<tr>
										<td><asp:label id="lab_heatProcess" Text="熱處理" Runat="server"></asp:label></td>
										<td><asp:dropdownlist id="dpl_heatProcess" Runat="server">
												<asp:ListItem Value="0">否</asp:ListItem>
												<asp:ListItem Value="1">是</asp:ListItem>
											</asp:dropdownlist></td>
										<td><asp:label id="lab_cryogenic" Text="深冷" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_cryogenic" Runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_request" Text="要求" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_request" Runat="server"></asp:textbox></td>
										<td><asp:label id="lab_materialer" Text="領料人" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_materialer" Runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
										<td colSpan="3"><asp:textbox id="txt_comment" runat="server" Width="430"></asp:textbox></td>
									</tr>
									<TR>
										<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
									</TR>
									<tr>
										<td colSpan="4"><asp:datagrid id="dg_BomDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn Visible="False">
														<ItemTemplate>
															&nbsp;
															<asp:Label id="lab_bomDesignNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomDesignNo")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partNo">
														<HeaderTemplate>
															<asp:Label id="Label2" runat="server" text="零件編號"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partName">
														<HeaderTemplate>
															<asp:Label id="Label4" runat="server" text="零件名稱"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="Label5" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_partName" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partName") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False" HeaderText="productmaterialId">
														<HeaderTemplate>
															<asp:Label id="dg_header_productmaterialId" Runat="server" text="物料編號"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_productmaterialId" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_productmaterialId" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/></asp:textbox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False" HeaderText="productmaterialname">
														<HeaderTemplate>
															<asp:Label id="dg_header_productmaterialname" Runat="server" text="物料名稱"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_productmaterialname" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="moldSkleton">
														<HeaderTemplate>
															<asp:Label id="dg_haeder_moldSkleton" runat="server" text="模架"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_moldSkleton" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MoldSkleton")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_moldSkleton" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MoldSkleton") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="stand">
														<HeaderTemplate>
															<asp:Label id="dg_header_stand" runat="server" text="標準件"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_stand" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Stand")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_stand" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Stand") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False" HeaderText="pictureNo">
														<HeaderTemplate>
															<asp:Label id="Label6" runat="server" text="零件標準"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="Label7" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_pictureNo" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="heatprocess">
														<HeaderTemplate>
															<asp:Label id="dg_header_heatprocess" runat="server" text="熱處理"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_heatprocess" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeatProcess")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList id="dg_dpl_heatprocess" runat="server">
																<asp:ListItem Value="1">是</asp:ListItem>
																<asp:ListItem Value="0">否</asp:ListItem>
															</asp:DropDownList>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="spec">
														<HeaderTemplate>
															<asp:Label id="dg_header_spec" runat="server" text="規格(實際)"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_spec" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="uglyspec">
														<HeaderTemplate>
															<asp:Label id="dg_header_uglyspec" runat="server" text="規格(毛料)"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_uglyspec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglySpec")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_uglyspec" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglySpec") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="length">
														<HeaderTemplate>
															<asp:Label id="dg_header_length" runat="server" text="長(實際)"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_length" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Length")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_length" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Length") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="uglylength">
														<HeaderTemplate>
															<asp:Label id="dg_header_uglylength" runat="server" text="長(毛料)"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_uglylength" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglyLength")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_uglylength" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UglyLength") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn Visible="False" HeaderText="prepareMethod">
														<HeaderTemplate>
															<asp:Label id="dg_header_prepareMethod" runat="server" text="備料方式"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_prepareMethod" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PrepareMethodName")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList id="dg_dpl_prepareMethod" runat="server">
																<asp:ListItem Value="PRODUCT">自製</asp:ListItem>
																<asp:ListItem Value="MERCHINDISE">外購</asp:ListItem>
															</asp:DropDownList>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="materialId">
														<HeaderTemplate>
															<asp:Label id="dg_header_materialId" runat="server" text="材質"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pictureNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList id="dg_txt_materialId" Width="80" runat="server"></asp:DropDownList>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="requireCount">
														<HeaderTemplate>
															<asp:Label id="Label10" runat="server" text="數量"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="Label11" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_requireCount" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="headHard">
														<HeaderTemplate>
															<asp:Label id="dg_head_headHard" runat="server" text="硬度"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_headHard" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeadHard")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_headHard" Width="80" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HeadHard") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="isMerchindise">
														<HeaderTemplate>
															<asp:Label ID="dg_head_isMerchindise" Runat="server" text="是否采購"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label ID="dg_lab_isMerchindise" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.IsMerchindise")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList id="dg_dpl_isMerchindise" runat="server">
																<asp:ListItem Value="0">否</asp:ListItem>
																<asp:ListItem Value="1">是</asp:ListItem>
															</asp:DropDownList>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="cryogenic">
														<HeaderTemplate>
															<asp:Label ID="dg_head_cryogenic" Runat="server" text='深冷' />
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label ID="dg_lab_cryogenic" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.Cryogenic")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_cryogenic" Runat="server" Width="20" Text='<%#DataBinder.Eval(Container, "DataItem.Cryogenic")%>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="request">
														<HeaderTemplate>
															<asp:Label ID="dg_head_request" Runat="server" text='要求' />
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label ID="dg_lab_request" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.Request")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_request" Runat="server" Width="20" Text='<%#DataBinder.Eval(Container, "DataItem.Request")%>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="materialer">
														<HeaderTemplate>
															<asp:Label ID="dg_head_materialer" Runat="server" text='領料人' />
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label ID="dg_lab_materialer" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.Materialer")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_materialer" Runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Materialer")%>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="SkillRequirement">
														<HeaderTemplate>
															<asp:Label ID="dg_head_skillRequirement" Runat="server" text='HRC' />
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label ID="dg_lad_skillRequirement" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.SkillRequirement")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_skillRequirement" Runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SkillRequirement")%>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="moduleId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_moduleComment" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["CommentShow"]%>'>
															</asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_moduleComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleComment")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:TextBox ID="dg_txt_moduleComment" Runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleComment")%>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="comment">
														<HeaderTemplate>
															<asp:Label id="Comment" runat="server" text="備註"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															&nbsp;
															<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
													<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確認刪除?')&quot;&gt;刪除&lt;/div&gt;"
														CommandName="Delete"></asp:ButtonColumn>
												</Columns>
												<PagerStyle Mode="NumericPages"></PagerStyle>
											</asp:datagrid></td>
									</tr>
								</TBODY>
							</TABLE>
							<br>
							<TABLE borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
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
							</TABLE>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
			<br>
			</TD></TR><TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
