<%@ Page language="c#" Codebehind="ToolDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ToolDetailList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
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
					<tr>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">明細資料</div>
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
												<td><asp:Label ID="lab_toolid" runat="server" Text="toolid" Visible="False">toolid</asp:Label></td>
												<td><asp:textbox id="txt_toolid" runat="server" Visible="False" Text=""></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_rangle" runat="server" Text="rangle">R角</asp:Label></td>
												<td><asp:textbox id="txt_rangle" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_CuttingDeep" runat="server" Text="CuttingDeep">切削深</asp:Label></td>
												<td><asp:textbox id="txt_CuttingDeep" runat="server"></asp:textbox></td>
											</tr>
											<tr>
											</tr>
											<tr>
												<td><asp:Label ID="lab_Cuttingwidth" runat="server" Text="Cuttingwidth">切削寬</asp:Label></td>
												<td><asp:textbox id="txt_Cuttingwidth" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Cutspeed" runat="server" Text="Cutspeed">切削速度</asp:Label></td>
												<td><asp:textbox id="txt_Cutspeed" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_afeed" runat="server" Text="afeed">一次進刀量</asp:Label></td>
												<td><asp:textbox id="txt_afeed" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_FeedAdxRd" runat="server" Text="FeedAdxRd">進刀量Adxrd</asp:Label></td>
												<td><asp:textbox id="txt_FeedAdxRd" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_feedspeed" runat="server" Text="feedspeed">進刀速度mm/</asp:Label></td>
												<td><asp:textbox id="txt_feedspeed" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Rotarymin" runat="server" Text="Rotarymin">回轉速min</asp:Label></td>
												<td><asp:textbox id="txt_Rotarymin" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_FeedspeedBored" runat="server" Text="FeedspeedBored">進刀速度（鑽孔）</asp:Label></td>
												<td><asp:textbox id="txt_FeedspeedBored" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Feedspeedgroove" runat="server" Text="Feedspeedgroove">進刀速度（溝切）</asp:Label></td>
												<td><asp:textbox id="txt_Feedspeedgroove" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_Feedrateside" runat="server" Text="Feedrateside">進刀速度(側面)</asp:Label></td>
												<td><asp:textbox id="txt_Feedrateside" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_Feedprocessing" runat="server" Text="Feedprocessing">進刀速前加工</asp:Label></td>
												<td><asp:textbox id="txt_Feedprocessing" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_Feedworship" runat="server" Text="Feedworship">進刀速仕上加工</asp:Label></td>
												<td><asp:textbox id="txt_Feedworship" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_comment" runat="server" Text="comment">備註</asp:Label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
											<tr>
												<td colSpan="4">
													<asp:datagrid id="dg_ToolDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
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
															<asp:TemplateColumn HeaderText="toolid" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_toolid" runat="server">toolid</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_toolid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Toolid")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_toolid" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.toolid") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="rangle">
																<HeaderTemplate>
																	<asp:Label id="dg_header_rangle" runat="server">R角</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_rangle" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rangle")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_rangle" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.rangle") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CuttingDeep">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CuttingDeep" runat="server">切削深</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CuttingDeep" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CuttingDeep")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_CuttingDeep" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CuttingDeep") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Cuttingwidth">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Cuttingwidth" runat="server">切削寬</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Cuttingwidth" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Cuttingwidth")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Cuttingwidth" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Cuttingwidth") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Cutspeed">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Cutspeed" runat="server">切削速度</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Cutspeed" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Cutspeed")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Cutspeed" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Cutspeed") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="afeed">
																<HeaderTemplate>
																	<asp:Label id="dg_header_afeed" runat="server">進刀量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_afeed" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Afeed")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_afeed" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.afeed") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="FeedAdxRd" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_FeedAdxRd" runat="server">FeedAdxRd</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_FeedAdxRd" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FeedAdxRd")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_FeedAdxRd" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FeedAdxRd") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="feedspeed">
																<HeaderTemplate>
																	<asp:Label id="dg_header_feedspeed" runat="server">進刀速度mm/</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_feedspeed" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedspeed")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_feedspeed" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.feedspeed") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Rotarymin" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Rotarymin" runat="server">Rotarymin</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Rotarymin" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rotarymin")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Rotarymin" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Rotarymin") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="FeedspeedBored" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_FeedspeedBored" runat="server">FeedspeedBored</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_FeedspeedBored" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FeedspeedBored")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_FeedspeedBored" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FeedspeedBored") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Feedspeedgroove" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Feedspeedgroove" runat="server">Feedspeedgroove</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Feedspeedgroove" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedspeedgroove")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Feedspeedgroove" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedspeedgroove") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Feedrateside" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Feedrateside" runat="server">Feedrateside</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Feedrateside" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedrateside")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Feedrateside" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedrateside") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Feedprocessing" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Feedprocessing" runat="server">Feedprocessing</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Feedprocessing" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedprocessing")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Feedprocessing" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedprocessing") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Feedworship" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Feedworship" runat="server">Feedworship</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Feedworship" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedworship")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_Feedworship" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Feedworship") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="comment" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_comment" runat="server">comment</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
																</ItemTemplate>
																<EditItemTemplate>
																	<asp:textbox id="dg_txt_comment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>'/>
																</EditItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="??" HeaderText="操作" CancelText="??" EditText="編輯"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('確定是否刪除')&quot;>刪除</div>" HeaderText="操作"
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
