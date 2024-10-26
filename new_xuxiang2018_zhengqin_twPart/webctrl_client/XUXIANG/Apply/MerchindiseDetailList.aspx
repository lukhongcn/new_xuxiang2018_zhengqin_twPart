<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MerchindiseDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseDetailList" %>
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
										<div align="left">請購單號</div>
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
												<td><asp:label id="lab_zdno" runat="server" Text="物料編號"></asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="查詢"></asp:button></td>
												<td><asp:label id="lab_assestName" runat="server" Text="名稱"></asp:label></td>
												<td><asp:textbox id="txt_name" runat="server" Enabled="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestSpec" runat="server" Text="規格"></asp:label></td>
												<td><asp:textbox id="txt_assestSpec" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_assestFactory" runat="server" Text="廠牌"></asp:label></td>
												<td><asp:textbox id="txt_assestFactory" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestRegion" runat="server" Text="產地"></asp:label></td>
												<td><asp:textbox id="txt_assestRegion" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_assestApplyCount" runat="server" Text="申請數量"></asp:label></td>
												<td><asp:textbox id="txt_assestApplyCount" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_RequistionDate" runat="server" Text="需求日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_RequistionDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_Material" runat="server" Text="材質"></asp:label></td>
												<td><asp:dropdownlist id="dpl_Material" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseDetailUnit" runat="server" Text="入庫單位"></asp:label></td>
												<td>
													<asp:TextBox id="txt_unit" runat="server" Enabled="False"></asp:TextBox></td>
												<td><asp:label id="lab_MerchindiseDetailJudgeUnit" runat="server" Text="計價單位(採購單位)"></asp:label></td>
												<td><asp:dropdownlist id="dpl_MerchindiseDetailJudgeUnit" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseDetailAccount" runat="server" Text="採購數量"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailAccount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_MerchindiseDetailUnitPrice" runat="server" Text="未稅單價"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailUnitPrice" runat="server" AutoPostBack="True"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseDetailPrice" runat="server" Text="未稅金額"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailPrice" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_MerchindiseDetailDate" runat="server" Text="預定到貨日"></asp:label></td>
												<td><wc:inputcalendar id="txt_MerchindiseDetailDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_Merchindise" runat="server" Text="核准請購單" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_Merchindise" runat="server" Visible="False"></asp:textbox></td>
												<td><asp:label id="lab_MerchindiseDetailApprov" runat="server" Text="查採購單" Visible="False"></asp:label></td>
												<td><asp:textbox id="txt_MerchindiseDetailApprov" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_isCheck" runat="server" Text="是否品檢"></asp:label></td>
												<td><asp:checkbox id="chk_isCheck" runat="server"></asp:checkbox></td>
												<asp:label id="lab_isBonded" runat="server" Text="是否保稅" Visible="False"></asp:label><asp:checkbox id="chk_isBonded" runat="server" Visible="False"></asp:checkbox>
												<td><asp:label id="lab_isMerchindise" runat="server" Text="是否採購"></asp:label></td>
												<td><asp:checkbox id="chk_isMerchindise" runat="server"></asp:checkbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_ApplyWeight" runat="server" Text="申請重量"></asp:label></td>
												<td><asp:textbox id="txt_ApplyWeight" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_requistionUse" runat="server" Text="用途"></asp:label></td>
												<td><asp:textbox id="txt_requistionUse" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_MerchindiseApplyId" runat="server" Text="" Visible="False"></asp:label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="4"><asp:datagrid id="dg_MerchindiseDetail" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
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
																	<asp:Label id="dg_header_zdno" runat="server">物料編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_zdno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Zdno")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_zdno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.zdno") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestName">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestName" runat="server">名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestSpec">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestSpec" runat="server">規格</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestSpec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestSpec")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestSpec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestSpec") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestFactory">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestFactory" runat="server">廠牌</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestFactory" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestFactory")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestFactory" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestFactory") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRegion">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRegion" runat="server">產地</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRegion" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRegion")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRegion" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRegion") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestApplyCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestApplyCount" runat="server">申請數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestApplyCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestApplyCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestApplyCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestApplyCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="RequistionDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_RequistionDate" runat="server">需求日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_RequistionDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequistionDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_RequistionDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequistionDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Material">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Material" runat="server">材質</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Material" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Material")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Material" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Material") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseDetailUnit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailUnit" runat="server">入庫單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailUnit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailUnit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailUnit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailUnit") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseDetailJudgeUnit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailJudgeUnit" runat="server">計價單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailJudgeUnit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailJudgeUnit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailJudgeUnit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailJudgeUnit") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseDetailAccount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailAccount" runat="server">採購數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailAccount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailAccount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailAccount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailAccount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseDetailUnitPrice">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailUnitPrice" runat="server">未稅單價</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailUnitPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailUnitPrice")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailUnitPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailUnitPrice") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseDetailPrice">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailPrice" runat="server">未稅金額</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailPrice" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailPrice")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailPrice" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailPrice") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseDetailDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailDate" runat="server">預定到貨日</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Merchindise" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Merchindise" runat="server">核准請購單</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Merchindise" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Merchindise")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Merchindise" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Merchindise") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseDetailApprov" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseDetailApprov" runat="server">查採購單</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseDetailApprov" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailApprov")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseDetailApprov" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseDetailApprov") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="isBonded" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_isBonded" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_isBonded" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsBonded")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_isBonded" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isBonded") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="isMerchindise" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_isMerchindise" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_isMerchindise" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsMerchindise")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_isMerchindise" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isMerchindise") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="isCheck" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_isCheck" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_isCheck" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsCheck")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_isCheck" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isCheck") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ApplyWeight">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ApplyWeight" runat="server">申請重量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ApplyWeight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyWeight")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ApplyWeight" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyWeight") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="requistionUse" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_requistionUse" runat="server">用途</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_requistionUse" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequistionUse")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_requistionUse" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.requistionUse") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="MerchindiseApplyId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_MerchindiseApplyId" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_MerchindiseApplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_MerchindiseApplyId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MerchindiseApplyId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="action" CancelText="動作" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;>刪除</div>" HeaderText="動作"
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
