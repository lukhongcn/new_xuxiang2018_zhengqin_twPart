<%@ Page language="c#" Codebehind="KnifeDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.KnifeDetailList" %>
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
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"></TD>
					</TR>
					<tr>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">申請明細單</div>
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
												<td><asp:label id="lab_zdno" runat="server" Text="刀具編號"></asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="查詢"></asp:button></td>
												<td><asp:label id="lab_assestName" runat="server" Text="名稱"></asp:label></td>
												<td><asp:textbox id="txt_name" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestSpec" runat="server" Text="規格"></asp:label></td>
												<td><asp:textbox id="txt_assestSpec" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_assestFactory" runat="server" Text="廠商"></asp:label></td>
												<td><asp:dropdownlist id="dpl_assestFactory" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestRegion" runat="server" Text="產地"></asp:label></td>
												<td><asp:dropdownlist id="dpl_assestRegion" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_assestUnit" runat="server" Text="單位"></asp:label></td>
												<td><asp:dropdownlist id="dpl_assestUnit" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_assestApplyCount" runat="server" Text="申請數量"></asp:label></td>
												<td><asp:textbox id="txt_assestApplyCount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_assessmentDate" runat="server" Text="評估日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_assessmentDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_expectUserDepartment" runat="server" Text="預計使用部門"></asp:label></td>
												<td><asp:dropdownlist id="dpl_expectUserDepartment" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_RequistionDate" runat="server" Text="需求日期"></asp:label></td>
												<td><wc:inputcalendar id="txt_RequistionDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_applyReason" runat="server" Text="申請理由"></asp:label></td>
												<td><asp:textbox id="txt_applyReason" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_requistionConclusion" runat="server" Text="結論"></asp:label></td>
												<td><asp:textbox id="txt_requistionConclusion" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_AssestRequistionId" runat="server" Text="" Visible="False"></asp:label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="4"><asp:datagrid id="dg_AssestRequistionDetail" runat="server" AllowPaging="True" DESIGNTIMEDRAGDROP="96"
														CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="Id">
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
																	<asp:Label id="dg_header_zdno" runat="server">編號</asp:Label>
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
																	<asp:Label id="dg_header_assestFactory" runat="server">廠商</asp:Label>
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
															<asp:TemplateColumn Visible="False" HeaderText="assestUnit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestUnit" runat="server">單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestUnit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestUnit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestUnit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestUnit") %>'/>
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
															<asp:TemplateColumn HeaderText="assessmentDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assessmentDate" runat="server">評估日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assessmentDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssessmentDate","{0:d}")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assessmentDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assessmentDate","{0:d}") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="expectUserDepartment">
																<HeaderTemplate>
																	<asp:Label id="dg_header_expectUserDepartment" runat="server">預計使用部門</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_expectUserDepartment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectUserDepartment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_expectUserDepartment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectUserDepartment") %>'/>
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
															<asp:TemplateColumn Visible="False" HeaderText="applyReason">
																<HeaderTemplate>
																	<asp:Label id="dg_header_applyReason" runat="server">申請理由</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_applyReason" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyReason")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_applyReason" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.applyReason") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="requistionConclusion">
																<HeaderTemplate>
																	<asp:Label id="dg_header_requistionConclusion" runat="server">結論</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_requistionConclusion" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequistionConclusion")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_requistionConclusion" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.requistionConclusion") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="AssestRequistionId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_AssestRequistionId" runat="server">AssestRequistionId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_AssestRequistionId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequistionId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_AssestRequistionId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequistionId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="動作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;&gt;刪除&lt;/div&gt;"
																HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
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
