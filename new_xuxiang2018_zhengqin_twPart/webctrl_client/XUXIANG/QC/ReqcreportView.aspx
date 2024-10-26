<%@ Register TagPrefix="uc1" TagName="ReqcreportHeader" Src="controls/ReqcreportHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ReqcreportView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.ReqcreportView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>QC</title>
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
						<TD vAlign="top" width="79%"><uc1:reqcreportheader id="ReqcreportHeader" runat="server"></uc1:reqcreportheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td><asp:label id="lab_testCategory" Text="檢驗類別" Runat="server"></asp:label></td>
												<td><asp:dropdownlist id="dpl_testCategory" Runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_testid" Runat="server">檢驗單號</asp:label></td>
												<td><asp:textbox id="txt_testid" Runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td style="WIDTH: 134px; HEIGHT: 35px"><asp:label id="lab_custom" runat="server" Text="用戶編號"></asp:label></td>
												<td style="WIDTH: 283px; HEIGHT: 35px"><asp:dropdownlist id="dpl_custome" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td style="WIDTH: 135px; HEIGHT: 35px"><asp:label id="lab_Moduleid" runat="server"></asp:label><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></td>
												<td style="HEIGHT: 35px"><FONT face="新細明體"><asp:dropdownlist id="dpl_Moduleid" runat="server" AutoPostBack="True"></asp:dropdownlist></FONT></td>
											</tr>
											<tr>
												<td style="WIDTH: 134px"><asp:label id="lab_partnoId" runat="server" Text="零件"></asp:label></td>
												<td style="WIDTH: 283px"><FONT face="新細明體"><asp:dropdownlist id="dpl_partnoId1" runat="server" AutoPostBack="True"></asp:dropdownlist></FONT></td>
												<td style="WIDTH: 135px; HEIGHT: 19px"><asp:label id="lab_ProductMaterialInventoryId" runat="server" Text="成品料號"></asp:label></td>
												<td style="HEIGHT: 19px"><asp:textbox id="txt_ProductMaterialInventoryId" runat="server" BackColor="Silver" ReadOnly="True"
														MaxLength="50" Width="300"></asp:textbox></td>
											</tr>
											<tr>
												<td style="WIDTH: 134px; HEIGHT: 19px"><asp:label id="lab_Pictureno" runat="server" Text="圖號"></asp:label></td>
												<td style="WIDTH: 283px; HEIGHT: 19px"><asp:textbox id="txt_Pictureno" runat="server" BackColor="Silver" ReadOnly="True" Width="200"></asp:textbox></td>
												<td style="WIDTH: 135px"><asp:label id="lab_materialId" runat="server" Text="材質"></asp:label></td>
												<td><asp:textbox id="txt_materialId" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox><asp:dropdownlist id="dpl_materialId" runat="server" Visible="False" AutoPostBack="True"></asp:dropdownlist><asp:button id="btn_materialId" runat="server" Text="選擇"></asp:button></td>
											</tr>
											<TR>
												<td style="WIDTH: 134px"><asp:label id="lab_Ver" runat="server" Text="版次"></asp:label></td>
												<td style="WIDTH: 283px"><asp:textbox id="txt_Ver" runat="server"></asp:textbox></td>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
										<TABLE id="Table3" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
											width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
											<tr>
												<td vAlign="top">
													<table width="100%" align="center" border="0">
														<asp:label id="lab_Iddetail" runat="server" Visible="False" Text=""></asp:label><asp:label id="lab_QcreportId" runat="server" Visible="False" Text=""></asp:label><asp:label id="lab_partnoId1" runat="server" Visible="False" Text=""></asp:label>
														<tr>
															<td><asp:label id="lab_Processid" runat="server" Text="工段別"></asp:label></td>
															<td><asp:dropdownlist id="dpl_Processid" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
															<td><asp:label id="lab_Machineid" runat="server" Text="機台編號"></asp:label></td>
															<td><asp:dropdownlist id="dpl_Machineid" runat="server"></asp:dropdownlist></td>
														</tr>
														<tr>
															<td><asp:label id="lab_Producter" runat="server" Text="加工者"></asp:label></td>
															<td><asp:textbox id="txt_Producter" runat="server"></asp:textbox><asp:dropdownlist id="dpl_Producter" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
															<td><asp:label id="lab_JudgeId" runat="server" Text="質量情況判定"></asp:label></td>
															<td><asp:dropdownlist id="dpl_JudgeId" runat="server"></asp:dropdownlist></td>
														</tr>
														<tr>
															<td><asp:label id="lab_Judger" runat="server" Text="判定人"></asp:label></td>
															<td><asp:textbox id="txt_Judger" runat="server"></asp:textbox><asp:dropdownlist id="dpl_Judger" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
															<td><asp:label id="lab_Checker" runat="server" Text="檢測人"></asp:label></td>
															<td><asp:textbox id="txt_Checker" runat="server"></asp:textbox><asp:dropdownlist id="dpl_Checker" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
														</tr>
														<tr>
															<td><asp:label id="lab_CheckDate" runat="server" Text="檢測日期"></asp:label></td>
															<td><wc:inputcalendar id="txt_CheckDate" runat="server"></wc:inputcalendar></td>
															<td><asp:label id="lab_CheckMachineNo" runat="server" Text="測量儀器"></asp:label></td>
															<td><asp:dropdownlist id="dpl_CheckMachineNo" runat="server"></asp:dropdownlist></td>
														</tr>
														<tr>
															<td><asp:label id="lab_Partcount" runat="server" Text="零件件數"></asp:label></td>
															<td><asp:textbox id="txt_Partcount" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
															<td><asp:label id="lab_partno_id" runat="server" Text="小零件"></asp:label></td>
															<td><asp:dropdownlist id="dpl_partno_id" runat="server"></asp:dropdownlist></td>
														</tr>
														<tr>
															<td><asp:label id="lab_CheckNumber" runat="server" Text="檢測數量"></asp:label></td>
															<td><asp:textbox id="txt_CheckNumber" runat="server">1</asp:textbox></td>
															<td><asp:label id="lab_FactSize" runat="server" Text="實測"></asp:label></td>
															<td><asp:textbox id="txt_FactSize" runat="server"></asp:textbox></td>
														</tr>
														<tr>
															<td><asp:label id="lab_PartnoOuter" runat="server" Text="備註"></asp:label></td>
															<td><asp:textbox id="txt_PartnoOuter" runat="server"></asp:textbox></td>
															<td><asp:label id="lab_Difference" runat="server" Visible="False" Text="公差"></asp:label></td>
															<td><asp:textbox id="txt_Difference" runat="server" Visible="False"></asp:textbox></td>
														</tr>
														<tr>
															<td><asp:label id="lab_StandardSize" runat="server" Visible="False" Text="標值"></asp:label></td>
															<td><asp:textbox id="txt_StandardSize" runat="server" Visible="False"></asp:textbox></td>
															<TD colSpan="2"><asp:label id="funcdetail" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_detailedit" runat="server" Text="保存"></asp:button></TD>
														</tr>
														<tr>
															<td colSpan="6"><asp:datagrid id="dg_Reqcreportdetail" runat="server" AllowPaging="True" AutoGenerateColumns="False"
																	CellSpacing="2" CellPadding="2">
																	<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
																	<Columns>
																		<asp:TemplateColumn Visible="False" HeaderText="QcreportId">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_QcreportId" runat="server">QcreportId</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_QcreportId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.QcreportId")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_QcreportId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.QcreportId") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="Processid">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Processid" runat="server">工段別</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Processid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processid")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_Processid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processid") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="Machineid">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Machineid" runat="server">機台編號</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Machineid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Machineid")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_Machineid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Machineid") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="Producter">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Producter" runat="server">加工者</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Producter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Producter")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_Producter" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Producter") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="CheckNumber">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_CheckNumber" runat="server">檢測數量</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_CheckNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckNumber")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_CheckNumber" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckNumber") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="Checker">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Checker" runat="server">檢測人</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_Checker" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="CheckDate">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_CheckDate" runat="server">檢測日期</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_CheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_CheckDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="CheckMachineNo">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_CheckMachineNo" runat="server">測量儀器</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_CheckMachineNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckMachineNo")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_CheckMachineNo" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckMachineNo") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn Visible="False" HeaderText="StandardSize">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_StandardSize" runat="server">標值</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_StandardSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.StandardSize")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_StandardSize" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.StandardSize") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn Visible="False" HeaderText="Difference">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Difference" runat="server">公差</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Difference" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Difference")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_Difference" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Difference") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="FactSize">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_FactSize" runat="server">實測</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_FactSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactSize")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_FactSize" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactSize") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="Partcount">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Partcount" runat="server">零件件數</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Partcount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partcount")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_Partcount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partcount") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:BoundColumn DataField="Partno_id" HeaderText="小零件編號"></asp:BoundColumn>
																		<asp:TemplateColumn HeaderText="JudgeId">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_JudgeId" runat="server">質量情況判定</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_JudgeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.JudgeId")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_JudgeId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.JudgeId") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="Judger">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_Judger" runat="server">判定人</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_Judger" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Judger")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_Judger" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Judger") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:TemplateColumn HeaderText="PartnoOuter">
																			<HeaderTemplate>
																				<asp:Label id="dg_header_PartnoOuter" runat="server">備註</asp:Label>
																			</HeaderTemplate>
																			<ItemTemplate>
																				&nbsp;
																				<asp:Label id="dg_lab_PartnoOuter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartnoOuter")%>'/>
																			</ItemTemplate>
																			<EditItemTemplate>
																				<asp:textbox id="dg_txt_PartnoOuter" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartnoOuter") %>'/>
																			</EditItemTemplate>
																		</asp:TemplateColumn>
																		<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="編輯" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
																		<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確認刪除嗎？')&quot;&gt;刪除&lt;/div&gt;"
																			HeaderText="刪除" CommandName="Delete"></asp:ButtonColumn>
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
												<DIV align="center"><B>提示</B></DIV>
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
