<%@ Page language="c#" Codebehind="KnifeInventoryOutView.aspx.cs" AutoEventWireup="false" Inherits="moduletools.knife.KnifeInventoryOutView" %>
<%@ Register TagPrefix="uc1" TagName="KnifeInventoryOut" Src="controls/KnifeInventoryOutHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋體"></FONT>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD style="WIDTH: 38px" vAlign="top" align="left" width="38"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD style="WIDTH: 3px" width="3">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:knifeinventoryout id="KnifeInventoryOut" runat="server"></uc1:knifeinventoryout><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td style="HEIGHT: 10px"><asp:label id="lab_myNo" runat="server" Text="編號">領用單號</asp:label></td>
												<td style="HEIGHT: 10px"><asp:textbox id="txt_myNo" runat="server" ReadOnly="True"></asp:textbox></td>
												<td style="HEIGHT: 10px"><asp:label id="lab_outDate" runat="server" Text="出庫日期"></asp:label></td>
												<td style="HEIGHT: 10px"><wc:inputcalendar id="txt_outDate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 10px"><asp:label id="lab_inOutInventoryTypeId" runat="server" Text="出庫類型"></asp:label></td>
												<td style="HEIGHT: 10px"><asp:textbox id="txt_outInventoryType" runat="server" Enabled="False">刀具</asp:textbox></td>
											</tr>
											<tr>
												<td style="HEIGHT: 20px"><asp:label id="lab_inventoryOuter" runat="server" Text="領料人">領用員</asp:label></td>
												<td style="HEIGHT: 20px"><asp:dropdownlist id="dpl_inventoryOuter" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 20px"><asp:label id="lab_outDepartmentid" runat="server" Text="部門"></asp:label></td>
												<td style="HEIGHT: 20px"><asp:dropdownlist id="dpl_outDepartmentid" runat="server"></asp:dropdownlist></td>
												<td style="HEIGHT: 20px"><asp:label id="lab_inventoryManager" runat="server" Text="倉庫員"></asp:label></td>
												<td style="HEIGHT: 20px"><asp:dropdownlist id="dpl_inventoryManager" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_project" runat="server" Text="對方科目"></asp:label></td>
												<td><asp:textbox id="txt_project" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_creater" runat="server" Text="制單人"></asp:label></td>
												<td><asp:textbox id="txt_creater" runat="server" ReadOnly="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_approver" runat="server" Text="審核人"></asp:label></td>
												<td><asp:textbox id="txt_approver" runat="server" ReadOnly="True"></asp:textbox></td>
												<td><asp:label id="lab_paarovedate" runat="server" Text="審核日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_ApproveDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="func" runat="server" Visible="False" Text=""></asp:label>
													<asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></td>
											</tr>
										</table>
										<asp:panel id="pan_outInventorydetail" Runat="server">
											<TABLE id="Table4" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
												width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
												<TR>
													<TD>
														<TABLE id="Table3" width="100%" align="center" border="0">
															<asp:label id="Label3" runat="server" Text="" Visible="False"></asp:label>
															<TR>
																<TD>
																	<asp:label id="lab_productMaterialId" runat="server" Text="物料編號">刀具編號</asp:label></TD>
																<TD style="WIDTH: 394px">
																	<asp:textbox id="txt_productmaterialno" runat="server" AutoPostBack="True"></asp:textbox>
																	<asp:button id="btn_search" runat="server" Text="查詢"></asp:button></TD>
																<TD>
																	<asp:label id="lab_name" runat="server" Text="物料名稱">刀具名稱</asp:label></TD>
																<TD>
																	<asp:textbox id="txt_name" runat="server" Enabled="False"></asp:textbox></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_outPCS" runat="server" Text="出庫批號">工令單號</asp:label></TD>
																<TD>
																	<asp:textbox id="txt_outPCS" runat="server"></asp:textbox></TD>
																<TD>
																	<asp:label id="lab_process" runat="server" Text="工序">工序</asp:label></TD>
																<TD>
																	<asp:DropDownList id="dpl_process" runat="server" AutoPostBack="True"></asp:DropDownList></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_outInventoryCount" runat="server" Text="出庫數量">領用數量</asp:label></TD>
																<TD>
																	<asp:textbox id="txt_outInventoryCount" runat="server" Enabled="false">1</asp:textbox></TD>
																<TD><FONT face="宋體">
																		<asp:Label id="lab_machineId" runat="server" Width="64px">加工機台</asp:Label></FONT></TD>
																<TD>
																	<asp:DropDownList id="dpl_machineId" runat="server" DESIGNTIMEDRAGDROP="609"></asp:DropDownList></TD>
															</TR>
															<TR>
																<TD>
																	<asp:Label id="Label1" runat="server" Width="72px">模具編號</asp:Label></TD>
																<TD>
																	<asp:DropDownList id="dpl_moduleId" runat="server" AutoPostBack="True"></asp:DropDownList></TD>
																<TD>
																	<asp:Label id="lab_partNo" runat="server">零件編號</asp:Label></TD>
																<TD>
																	<asp:DropDownList id="dpl_partNo" runat="server"></asp:DropDownList></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_price" runat="server" Text="單價"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_price" runat="server"></asp:textbox></TD>
																<TD>
																	<asp:label id="lab_unitId" runat="server" Text="單位"></asp:label></TD>
																<TD>
																	<asp:dropdownlist id="dpl_unitId" runat="server"></asp:dropdownlist></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_factKnifeRound" runat="server" Text="實際刀徑"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_factKnifeRound" runat="server"></asp:textbox></TD>
																<TD>
																	<asp:label id="lab_shelfId" runat="server" Text="貨架">貨架</asp:label></TD>
																<TD>
																	<asp:dropdownlist id="dpl_shelfId" Runat="server"></asp:dropdownlist></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_outInventoryWeight" runat="server" Text="出庫重量"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_outInventoryWeight" runat="server"></asp:textbox></TD>
																<TD>
																	<asp:label id="lab_comment1" runat="server" Text="備註"></asp:label></TD>
																<TD>
																	<asp:textbox id="txt_comment1" runat="server"></asp:textbox></TD>
															</TR>
															<TR>
																<TD>
																	<asp:label id="lab_OutInventory" runat="server" Text="" Visible="False"></asp:label></TD>
															</TR>
															<TR>
																<TD style="WIDTH: 520px" colSpan="2">
																	<asp:label id="func_Detail" runat="server" Text="" Visible="False"></asp:label>
																	<asp:button id="btn_Detail" runat="server" Text="保存"></asp:button>
																	<asp:label id="lab_oldcount" runat="server" Visible="False"></asp:label></TD>
															</TR>
															<TR>
																<TD style="WIDTH: 520px" colSpan="2">
																	<asp:datagrid id="dg_KnifeOutInventoryDetail" runat="server" AllowPaging="True" AutoGenerateColumns="False"
																		CellSpacing="2" CellPadding="2">
																		<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
																		<Columns>
																			<asp:TemplateColumn Visible="False" HeaderText="id">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_id" runat="server">編號</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																				</ItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="name">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_name" runat="server">刀具名稱</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>' />
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:Label id="dg_txt_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId")%>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="productMaterialId">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_productMaterialId" runat="server">刀具編號</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_productMaterialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialId")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_productMaterialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productMaterialId") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="moduleId">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_moduleId" runat="server">模具</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="outPCS">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_outPCS" runat="server">工令單號</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_productNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutPCS")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_outPCS" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outPCS") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="partNoId">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_partNoId" runat="server">零件</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNoId")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_partNoId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNoId") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="outInventoryCount">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_outInventoryCount" runat="server">領用數量</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_outInventoryCountt" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventoryCount")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_outInventoryCountt" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outInventoryCount") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn HeaderText="comment">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_comment" runat="server">備註</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:TemplateColumn Visible="False" HeaderText="OutInventory">
																				<HeaderTemplate>
																					<asp:Label id="dg_header_OutInventory" runat="server">OutInventory</asp:Label>
																				</HeaderTemplate>
																				<ItemTemplate>
																					&nbsp;
																					<asp:Label id="dg_lab_OutInventory" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventory")%>'/>
																				</ItemTemplate>
																				<EditItemTemplate>
																					<asp:textbox id="dg_txt_OutInventory" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutInventory") %>'/>
																				</EditItemTemplate>
																			</asp:TemplateColumn>
																			<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
																			<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
																				HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
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
										</asp:panel>
										<table>
											<TR>
												<TD colSpan="2"></TD>
											</TR>
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
												<DIV align="center"><B>提示信息</B></DIV>
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
