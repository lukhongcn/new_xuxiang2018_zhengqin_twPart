<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="BomApplyHeader" Src="controls/BomApplyHeader.ascx" %>
<%@ Page language="c#" Codebehind="BomApplyView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.BomApplyView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%"><uc1:bomapplyheader id="BomApplyHeader" runat="server"></uc1:bomapplyheader>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="0" borderColorDark="#cccccc" cellPadding="0"
								align="center" borderColorLight="#ccccff" border="0" runat="server" width="100%">
								<TBODY>
									<tr>
										<td><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
										<td><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
										<td><asp:label id="lab_moduleid" runat="server" Text="模具編號"></asp:label></td>
										<td><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									</tr>
									<tr>
										<td><asp:label id="lab_creater" runat="server" Text="創建人"></asp:label></td>
										<td><asp:dropdownlist id="dpl_creater" runat="server"></asp:dropdownlist></td>
										<td><asp:label id="lab_createDate" runat="server" Text="創建日期"></asp:label></td>
										<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar></td>
									</tr>
									<tr>
										<td><asp:label id="lab_productno" runat="server" Text="制令單號"></asp:label></td>
										<td colSpan="3"><asp:textbox id="txt_productno" runat="server"></asp:textbox><asp:label id="lab_Id" runat="server" Visible="False"></asp:label><asp:label id="lab_designNo" runat="server" Visible="False"></asp:label></td>
									</tr>
									<tr>
										<td colSpan="4">
											<hr>
										</td>
									</tr>
									<tr>
										<td colSpan="4">申購明細</td>
									</tr>
									<tr>
										<td><asp:label id="lab_productmateailid" Text="物料編號" Runat="server"></asp:label></td>
										<td><asp:textbox id="txt_name" runat="server"></asp:textbox></td>
										<td><asp:label id="lab_partName" runat="server" Text="名稱"></asp:label></td>
										<td><asp:textbox id="txt_partname" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_pictureNo" runat="server" Text="等級"></asp:label></td>
										<td><asp:textbox id="txt_pictureNo" runat="server"></asp:textbox></td>
										<td><asp:label id="lab_spec" runat="server" Text="規格"></asp:label></td>
										<td><asp:textbox id="txt_spec" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_materialId" runat="server" Text="材質"></asp:label></td>
										<td><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></td>
										<td><asp:label id="lab_requireCount" runat="server" Text="數量"></asp:label></td>
										<td><asp:textbox id="txt_requireCount" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_price" runat="server" Text="估價"></asp:label></td>
										<td><asp:textbox id="txt_price" runat="server"></asp:textbox></td>
										<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
										<td><asp:textbox id="txt_comment" runat="server" Width="430"></asp:textbox></td>
									</tr>
									<TR>
										<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="增加明細"></asp:button></TD>
									</TR>
									<tr>
										<td colspan="4"><asp:button id="btn_edit_design" Text="保存修改" Runat="server"></asp:button><asp:label id="lab_retrun_designid" runat="server" text="" visible="false"></asp:label></td>
									</tr>
									<tr>
										<td colSpan="4"><asp:datagrid id="dg_BomApplyDetail" runat="server" Width="600" AutoGenerateColumns="False" CellSpacing="2"
												CellPadding="2">
												<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
												<Columns>
													<asp:TemplateColumn HeaderText=" " Visible="False">
														<ItemTemplate>
															<asp:Label id="lab_check_bomDetailId" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="" Visible="False">
														<ItemTemplate>
															<asp:Label id="lab_bomApplyNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomApplyNo")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="moduleId" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_moduleId" runat="server" text="模具編號"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="partName">
														<HeaderTemplate>
															<asp:Label id="dg_header_partName" runat="server" text="名稱"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_partName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox Enabled=False id="dg_txt_partName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partName") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="productmaterialId">
														<HeaderTemplate>
															<asp:Label id="dg_header_productmaterialId" Runat="server" text="物料編號"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_productmaterialId" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox Enabled=False id="dg_txt_productmaterialId" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/></asp:textbox>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="productmaterialname" Visible="False">
														<HeaderTemplate>
															<asp:Label id="dg_header_productmaterialname" Runat="server" text="物料名稱"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_productmaterialname" Runat=server text='<%#DataBinder.Eval(Container, "DataItem.productMaterialInventoryId")%>'/></asp:Label>
														</ItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="pictureNo">
														<HeaderTemplate>
															<asp:Label id="dg_header_pictureNo" runat="server" text="等級"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_pictureNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PictureNo")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_pictureNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.pictureNo") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="price">
														<HeaderTemplate>
															<asp:Label id="dg_header_price" runat="server" text="估價"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="materialId">
														<HeaderTemplate>
															<asp:Label id="dg_header_materialId" runat="server" text="材質"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:DropDownList id="dg_txt_materialId" Width="40" runat="server"></asp:DropDownList>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="requireCount">
														<HeaderTemplate>
															<asp:Label id="dg_header_requireCount" runat="server" text="需求數量"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_requireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_requireCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="spec">
														<HeaderTemplate>
															<asp:Label id="dg_header_spec" runat="server" text="規格"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_spec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:TemplateColumn HeaderText="comment">
														<HeaderTemplate>
															<asp:Label id="dg_header_comment" runat="server" text="備註"></asp:Label>
														</HeaderTemplate>
														<ItemTemplate>
															<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
														</ItemTemplate>
														<EditItemTemplate>
															<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
														</EditItemTemplate>
													</asp:TemplateColumn>
													<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
													<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確認刪除?')&quot;>刪除</div>" HeaderText=""
														CommandName="Delete"></asp:ButtonColumn>
												</Columns>
												<PagerStyle Mode="NumericPages"></PagerStyle>
											</asp:datagrid></td>
									</tr>
								</TBODY>
							</TABLE>
							<br>
							<TABLE borderColor="#000660" borderColorDark="#000066" width="600" align="left" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="600">&nbsp;&nbsp;
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
