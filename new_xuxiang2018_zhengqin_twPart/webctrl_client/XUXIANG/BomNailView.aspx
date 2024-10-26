<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="BomNailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomNailView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>BOM頂針設置</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="4"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">BOM頂針設置</div>
									</td>
								</tr>
							</table>
							<hr>
							<table>
								<TR>
									<TD>客戶</TD>
									<TD><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
									<TD>模具</TD>
									<TD><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="請選擇有效的模具編號" ControlToValidate="ListBox_ModuleList"></asp:requiredfieldvalidator></TD>
								</TR>
							</table>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<TR>
												<TD width="20%">名稱<asp:dropdownlist id="dpl_nailname" runat="server"></asp:dropdownlist></TD>
												<TD width="20%">零件編號
													<asp:textbox id="txt_partno" runat="server" Width="40px"></asp:textbox></TD>
												<td width="30%">材質<asp:dropdownlist id="dpl_material" runat="server"></asp:dropdownlist></td>
												<td align="right" widht="20%">硬度</td>
												<td align="left"><asp:textbox id="txt_hard" runat="server" Width="60px"></asp:textbox></td>
											</TR>
											<tr>
												<TD>d
													<asp:textbox id="txt_d" runat="server" Width="40"></asp:textbox></TD>
												<td>H
													<asp:textbox id="txt_H" runat="server" Width="40"></asp:textbox></td>
												<TD>d1
													<asp:textbox id="txt_d1" runat="server" Width="40"></asp:textbox>d2
													<asp:textbox id="txt_d2" runat="server" Width="40"></asp:textbox></TD>
												<TD align="right">d3</TD>
												<td align="left"><asp:textbox id="txt_d3" runat="server" Width="40"></asp:textbox></td>
												<TD>d4
													<asp:textbox id="txt_d4" runat="server" Width="40"></asp:textbox></TD>
											</tr>
											<tr>
												<TD>D
													<asp:textbox id="txt_ud" runat="server" Width="40"></asp:textbox></TD>
												<td>M
													<asp:textbox id="txt_M" runat="server" Width="40"></asp:textbox></td>
												<TD>W
													<asp:textbox id="txt_W" runat="server" Width="40"></asp:textbox>P
													<asp:textbox id="txt_P" runat="server" Width="40"></asp:textbox></TD>
												<TD align="right">L</TD>
												<TD><asp:textbox id="txt_L" runat="server" Width="40"></asp:textbox></TD>
												<TD>N<asp:textbox id="txt_N" runat="server" Width="40"></asp:textbox></TD>
											</tr>
											<tr>
												<td>數量
													<asp:textbox id="txt_quantity" runat="server" Width="40"></asp:textbox></td>
												<td>套數
													<asp:textbox id="txt_set" runat="server" Width="40"></asp:textbox></td>
												<td>備註
													<asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<td>版本</td>
												<td><asp:textbox id="txt_version" runat="server" Width="40"></asp:textbox></td>
											</tr>
										</table>
										<table cellSpacing="2" width="100%" border="0">
											<TR>
												<TD colSpan="2"><asp:button id="BTaddmetal" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<asp:datagrid id="dg_bomnail" runat="server" AutoGenerateColumns="False">
								<Columns>
									<asp:BoundColumn DataField="BomNailId" ReadOnly="True" HeaderText="編號"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="頂針名稱">
										<ItemTemplate>
											<asp:Label id="Label7" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:dropdownlist id="dg_dpl_nailname" runat="server"></asp:dropdownlist>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="零件編號">
										<ItemTemplate>
											<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailPartNo") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_partno" Width=60 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailPartNo") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="材質">
										<ItemTemplate>
											<asp:Label id="Label18" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailMaterialName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:dropdownlist id="dg_dpl_materialname" runat="server"></asp:dropdownlist>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="d1">
										<ItemTemplate>
											<asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD1") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_d1" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD1") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="d2">
										<ItemTemplate>
											<asp:Label id="Label6" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD2") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_d2" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD2") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="d3">
										<ItemTemplate>
											<asp:Label id="Label8" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD3") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_d3" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD3") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="d4">
										<ItemTemplate>
											<asp:Label id="Label9" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD4") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_d4" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD4") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="D">
										<ItemTemplate>
											<asp:Label id="Label10" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailUD") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_ud" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailUD") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="d">
										<ItemTemplate>
											<asp:Label id="Label11" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_d" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailD") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="W">
										<ItemTemplate>
											<asp:Label id="Label12" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailW") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_w" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailW") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="P">
										<ItemTemplate>
											<asp:Label id="Label13" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailP") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_p" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailP") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="L">
										<ItemTemplate>
											<asp:Label id="Label14" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailL") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_l" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailL") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="N">
										<ItemTemplate>
											<asp:Label id="Label15" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailN") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_n" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailN") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="H">
										<ItemTemplate>
											<asp:Label id="Label16" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailH") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_h" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailH") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="M">
										<ItemTemplate>
											<asp:Label id="Label17" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailM") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_M" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailM") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="硬度">
										<ItemTemplate>
											<asp:Label id="Label19" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailHard") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_hard" width=80 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailHard") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="數量">
										<ItemTemplate>
											<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailQuantity") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_quantity" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailQuantity") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="套數">
										<ItemTemplate>
											<asp:Label id="Label20" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailSet") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_set" width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailSet") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="備註">
										<ItemTemplate>
											<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_comment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailComment") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="版本">
										<ItemTemplate>
											<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailVersion") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_version" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomNailVersion") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;&gt;刪除&lt;/div&gt;"
										HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
							</asp:datagrid><br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>提示
												<DIV align="center"><B></B></DIV>
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
