<%@ Register TagPrefix="uc1" TagName="ToolHeader" Src="controls/ToolHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="ToolList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ToolList" %>
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
							<uc1:ToolHeader id="ToolHeader" runat="server"></uc1:ToolHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label></TD>
											</TR>
											<tr>
												<td colSpan="2">
													<asp:datagrid id="dg_Tool" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn HeaderText="Id" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Id" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="toolno">
																<HeaderTemplate>
																	<asp:Label id="dg_header_toolno" runat="server">刀具編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_toolno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Toolno")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_toolno" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.toolno") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="toolname">
																<HeaderTemplate>
																	<asp:Label id="dg_header_toolname" runat="server">刀具名稱</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_toolname" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Toolname")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_toolname" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.toolname") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Tolerance" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Tolerance" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Tolerance" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tolerance")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Tolerance" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Tolerance") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="EdgeDrive" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_EdgeDrive" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_EdgeDrive" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EdgeDrive")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_EdgeDrive" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.EdgeDrive") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Edge" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Edge" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Edge" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Edge")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Edge" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Edge") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Edgefew" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Edgefew" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Edgefew" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Edgefew")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Edgefew" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Edgefew") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="firstangle" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_firstangle" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_firstangle" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Firstangle")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_firstangle" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.firstangle") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="BingDrive" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_BingDrive" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_BingDrive" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BingDrive")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_BingDrive" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BingDrive") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="length">
																<HeaderTemplate>
																	<asp:Label id="dg_header_length" runat="server">全長</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_length" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Length")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_length" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.length") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="unit">
																<HeaderTemplate>
																	<asp:Label id="dg_header_unit" runat="server">單位</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_unit" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Unit")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_unit" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unit") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="price">
																<HeaderTemplate>
																	<asp:Label id="dg_header_price" runat="server">價格(支)</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_price" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_price" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.price") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Rangle" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Rangle" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Rangle" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rangle")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Rangle" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rangle") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="rcomment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_rcomment" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_rcomment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rcomment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_rcomment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.rcomment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="singleangle" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_singleangle" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_singleangle" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Singleangle")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_singleangle" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.singleangle") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="TipDrive" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_TipDrive" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_TipDrive" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TipDrive")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_TipDrive" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.TipDrive") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ReadingDrive" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ReadingDrive" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ReadingDrive" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReadingDrive")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ReadingDrive" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ReadingDrive") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="RoughDrive" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_RoughDrive" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_RoughDrive" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RoughDrive")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_RoughDrive" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RoughDrive") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Effectivelong" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Effectivelong" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Effectivelong" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Effectivelong")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Effectivelong" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Effectivelong") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="FirstDrive" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_FirstDrive" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_FirstDrive" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FirstDrive")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_FirstDrive" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FirstDrive") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="UnderfirstDrive" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_UnderfirstDrive" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_UnderfirstDrive" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnderfirstDrive")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_UnderfirstDrive" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnderfirstDrive") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="material">
																<HeaderTemplate>
																	<asp:Label id="dg_header_material" runat="server">材質</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_material" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Material")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_material" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.material") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CornerR" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CornerR" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CornerR" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CornerR")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CornerR" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CornerR") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ad" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ad" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ad" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ad")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_ad" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ad") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Hardness" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Hardness" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Hardness" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Hardness")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Hardness" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Hardness") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Strength" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Strength" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Strength" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Strength")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Strength" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Strength") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Trailguide" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Trailguide" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Trailguide" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Trailguide")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Trailguide" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Trailguide") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Driveguide" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Driveguide" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Driveguide" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Driveguide")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Driveguide" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Driveguide") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="toolinput" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_toolinput" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_toolinput" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Toolinput")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_toolinput" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.toolinput") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="toolcount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_toolcount" runat="server">數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_toolcount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Toolcount")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_toolcount" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.toolcount") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "ToolView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
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
