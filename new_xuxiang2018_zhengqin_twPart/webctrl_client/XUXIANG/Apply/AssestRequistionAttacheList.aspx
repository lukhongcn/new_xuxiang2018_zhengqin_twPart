<%@ Page language="c#" Codebehind="AssestRequistionAttacheList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.AssestRequistionAttacheList" %>
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
						<TD width="1%"></TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">附件資料設置</div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label>
											<tr>
												<td><asp:Label ID="lab_assestRequistionAttacheName" runat="server" Text="附件名稱"></asp:Label></td>
												<td><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox>
													<asp:Button id="btn_image" runat="server" Text="瀏覽"></asp:Button></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequistionAttacheSpecification" runat="server" Text="附件規格"></asp:Label></td>
												<td><asp:textbox id="txt_assestRequistionAttacheSpecification" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequistionAttacheUnit" runat="server" Text="附件單位"></asp:Label></td>
												<td><asp:DropDownList id="dpl_assestRequistionAttacheUnit" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequistionAttacheCount" runat="server" Text="附件數量"></asp:Label></td>
												<td><asp:textbox id="txt_assestRequistionAttacheCount" runat="server">0</asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequistionId" runat="server" Text="" Visible="False"></asp:Label></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_AssestRequistionAttache" runat="server" AutoGenerateColumns="False" CellSpacing="2"
														CellPadding="2">
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
															<asp:TemplateColumn HeaderText="assestRequistionAttacheName" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequistionAttacheName" runat="server">附件名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequistionAttacheName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequistionAttacheName")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequistionAttacheName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequistionAttacheName") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequistionAttacheSpecification">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequistionAttacheSpecification" runat="server">附件規格</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequistionAttacheSpecification" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequistionAttacheSpecification")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequistionAttacheSpecification" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequistionAttacheSpecification") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequistionAttacheUnit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequistionAttacheUnit" runat="server">單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequistionAttacheUnit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequistionAttacheUnit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequistionAttacheUnit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequistionAttacheUnit") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequistionAttacheCount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequistionAttacheCount" runat="server">數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequistionAttacheCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequistionAttacheCount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequistionAttacheCount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequistionAttacheCount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="assestRequistionId" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_assestRequistionId" runat="server">assestRequistionId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_assestRequistionId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.AssestRequistionId")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_assestRequistionId" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.assestRequistionId") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="動作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
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
						<TD colSpan="3"></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
