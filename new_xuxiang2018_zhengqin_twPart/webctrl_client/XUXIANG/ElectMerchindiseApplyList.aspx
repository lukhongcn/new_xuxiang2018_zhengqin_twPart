<%@ Page language="c#" Codebehind="ElectMerchindiseApplyList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ElectMerchindiseApply" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>電極物料申請</title>
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
										<div align="left">電極物料申請</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_id" runat="server" Visible="False" Text=""></asp:label>
											<TBODY>
												<tr>
													<td style="HEIGHT: 43px"><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
									</td>
									<td style="WIDTH: 195px; HEIGHT: 43px"><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True" Width="157px"></asp:dropdownlist><asp:label id="Label1" runat="server" Visible="False"></asp:label><asp:label id="lab_ApplyNo" runat="server" Visible="False"></asp:label></td>
									<td style="HEIGHT: 43px"><asp:label id="lab_moduleId" runat="server" Text="模具編號"></asp:label></td>
									<td style="WIDTH: 171px; HEIGHT: 43px"><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True" Width="157px"></asp:dropdownlist></td>
									<TD style="HEIGHT: 43px"><asp:label id="lab_expectedDate" runat="server" Text="交貨期"></asp:label></TD>
									<td style="HEIGHT: 43px"><wc:inputcalendar id="txt_expectedDate" runat="server"></wc:inputcalendar></td>
								</tr>
								<TR>
									<td style="HEIGHT: 30px"><asp:label id="Label2" runat="server">材料</asp:label></td>
									<TD style="WIDTH: 195px; HEIGHT: 30px"><asp:dropdownlist id="ListBox_mat" runat="server" AutoPostBack="True" Width="157px" Enabled="False"></asp:dropdownlist></TD>
									<td style="HEIGHT: 30px"><asp:label id="Label3" runat="server">工藝類型</asp:label></td>
									<TD style="WIDTH: 171px; HEIGHT: 30px"><asp:dropdownlist id="ListBox_process" runat="server" AutoPostBack="True" Width="157px" Enabled="False"></asp:dropdownlist></TD>
								</TR>
								<TR>
									<TD vAlign="top">申請單明細</TD>
									<td style="WIDTH: 625px" colSpan="5"><asp:textbox id="txt_content" runat="server" Width="688px" Height="200px" TextMode="MultiLine"></asp:textbox></td>
								</TR>
								<tr>
									<td><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button><asp:label id="func" runat="server" Visible="False" Text=""></asp:label></td>
									<td style="WIDTH: 195px"><asp:label id="lab_mat" runat="server" Visible="False"></asp:label><asp:label id="lab_process" runat="server" Visible="False"></asp:label></td>
								</tr>
							</TABLE>
							<table>
								<tr>
									<td><asp:datagrid id="dg_error" runat="server" AllowPaging="True" AutoGenerateColumns="False">
											<Columns>
												<asp:BoundColumn DataField="ErrorLine" HeaderText="行數"></asp:BoundColumn>
												<asp:BoundColumn DataField="ErrorMessage" HeaderText="錯誤原因"></asp:BoundColumn>
											</Columns>
										</asp:datagrid></td>
								</tr>
							</table>
							<table>
								<TR>
									<TD style="WIDTH: 578px; HEIGHT: 4px" colSpan="2"></TD>
								</TR>
								<tr>
									<td style="WIDTH: 578px" colSpan="2"><asp:datagrid id="dg_ElectMerchindiseApply" runat="server" AllowPaging="True" AutoGenerateColumns="False"
											CellSpacing="2" CellPadding="2">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:TemplateColumn Visible="False" HeaderText="id">
													<HeaderTemplate>
														<asp:Label id="dg_header_id" runat="server">序號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="moduleId">
													<HeaderTemplate>
														<asp:Label id="dg_header_moduleId" runat="server">模具編號</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.moduleId") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="partno">
													<HeaderTemplate>
														<asp:Label id="dg_header_partno" runat="server">原物料名稱</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_partno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partno")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_partno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partno") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="electSpec">
													<HeaderTemplate>
														<asp:Label id="dg_header_electSpec" runat="server">電極規格</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_electSpec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ElectSpec")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_electSpec" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.electSpec") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="materialId">
													<HeaderTemplate>
														<asp:Label id="dg_header_materialId" runat="server">材質</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_materialId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialId") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="count">
													<HeaderTemplate>
														<asp:Label id="dg_header_count" runat="server">件數</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_count" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Count")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_count" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.count") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="electProcessId">
													<HeaderTemplate>
														<asp:Label id="dg_header_electProcessId" runat="server">工藝類型</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_electProcessId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ElectProcessId")%>'/>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_electProcessId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.electProcessId") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="expectedDate" Visible="False">
													<HeaderTemplate>
														<asp:Label id="dg_header_expectedDate" runat="server">交貨期</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_expectedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpectedDate","{0:d}")%>'/>&nbsp;
													</ItemTemplate>
													<EditItemTemplate>
														<asp:textbox id="dg_txt_expectedDate" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.expectedDate","{0:d}") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="ExpDate">
													<HeaderTemplate>
														<asp:Label id="dg_header_ExpDate" runat="server">交貨期</asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														&nbsp;
														<asp:Label id="dg_lab_ExpDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ExpDate")%>'/>&nbsp;
													</ItemTemplate>
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
												<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="動作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
												<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確認是否刪除')&quot;&gt;刪除&lt;/div&gt;"
													HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
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
								<DIV align="center"><B>提示信息</B></DIV>
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
