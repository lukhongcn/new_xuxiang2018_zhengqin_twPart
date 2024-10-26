<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/logisticheader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="MerchindiseView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MerchindiseView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>倉庫核料</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </HEAD>
	<body topMargin="0">
		<form method="post" runat="server">
			<TABLE height="721" cellSpacing="0" cellPadding="0" width="641" border="0" ms_2d_layout="TRUE">
				<TR vAlign="top">
					<TD height="706"></TD>
					<TD>
						<TABLE id="Table2" height="705" cellSpacing="0" cellPadding="0" width="639" border="0">
							<TBODY>
								<TR>
									<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
								</TR>
								<tr>
									<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
									<TD width="88">&nbsp;</TD>
									<TD vAlign="top" width="79%">
										<table cellSpacing="2" width="100%" border="0">
											<tr>
												<td>
													<div align="left">倉庫核料</div>
												</td>
											</tr>
										</table>
										<hr>
										<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
											width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
											<tr>
												<td>
													<table width="100%" align="center" border="0">
														<TR>
															<TD>零件類型</TD>
															<td><asp:textbox id="txt_type" runat="server" ReadOnly="True" Width="40"></asp:textbox></td>
															<TD>模具編號</TD>
															<TD><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
															<TD>BOM編號</TD>
															<td><asp:textbox id="txt_bomid" runat="server" ReadOnly="True" AutoPostBack="True"></asp:textbox></td>
															<TD>名稱</TD>
															<TD><asp:textbox id="txt_name" runat="server"></asp:textbox></TD>
															<td>採購重量<asp:textbox id="txt_weight" runat="server"></asp:textbox></td>
														</TR>
														<TR>
															<TD>零件編號</TD>
															<td><asp:textbox id="txt_partno" runat="server" ReadOnly="True" Width="40" AutoPostBack="True"></asp:textbox></td>
															<TD>規格</TD>
															<td><asp:textbox id="txt_specification" runat="server" Width="80"></asp:textbox></td>
															<TD>備註</TD>
															<TD><asp:textbox id="txt_comment" runat="server"></asp:textbox></TD>
															<TD>購買數量</TD>
															<td colSpan="2"><asp:textbox id="txt_quantity" runat="server">1</asp:textbox><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ErrorMessage="請輸入數字" ControlToValidate="txt_quantity"
																	ValidationExpression="[0-9.]{1,}"></asp:regularexpressionvalidator></td>
														</TR>
														<tr>
															<td colSpan="4">是否是精料
																<asp:textbox id="txt_materialid" runat="server" Visible="False"></asp:textbox><asp:textbox id="txt_erpspecification" runat="server" Visible="False"></asp:textbox><asp:checkbox id="chk_detail" runat="server"></asp:checkbox></td>
															<td colSpan="4">是否是外購成品
																<asp:checkbox id="chk_isProduct" runat="server"></asp:checkbox></td>
														</tr>
													</table>
													<table cellSpacing="2" width="100%" border="0">
														<TR>
															<TD width="20%"><asp:button id="BTaddmetal" runat="server" Text="保存"></asp:button><asp:button id="btn_reset" runat="server" Text="取消"></asp:button><asp:button id="btn_print" runat="server" Text="採購打印"></asp:button></TD>
															<td><asp:label id="Label_Message" runat="server"></asp:label></td>
														</TR>
													</table>
												</td>
											</tr>
										</TABLE>
										<asp:dropdownlist id="dpl_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:dropdownlist id="dpl_allselected" runat="server" AutoPostBack="True"></asp:dropdownlist><br>
										<asp:datagrid id="dg_checkedmerchindise" runat="server" AutoGenerateColumns="False" AllowPaging="True">
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
											<Columns>
												<asp:BoundColumn DataField="BomPartType" ReadOnly="True" HeaderText="零件類別"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseBomId" ReadOnly="True" HeaderText="編碼"></asp:BoundColumn>
												<asp:BoundColumn DataField="PartNo" ReadOnly="True" HeaderText="零件編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseName" ReadOnly="True" HeaderText="名稱"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="規格">
													<ItemTemplate>
														<asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MerchindiseSpecification") %>'>
														</asp:Label>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:TextBox id="dg_txt_specification" Width=100 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MerchindiseSpecification") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="數量">
													<ItemTemplate>
														<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MerchindiseQuantity") %>'>
														</asp:Label>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:TextBox id="dg_txt_quantity" Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MerchindiseQuantity") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="數量">
													<ItemTemplate>
														<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MerchindiseQuantity") %>'>
														</asp:Label>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:TextBox id="Textbox1" runat="server" Width=40 Text='<%# DataBinder.Eval(Container, "DataItem.MerchindiseQuantity") %>'/>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="Weight" ReadOnly="True" HeaderText="重量"></asp:BoundColumn>
												<asp:BoundColumn DataField="Material" ReadOnly="True" HeaderText="材質"></asp:BoundColumn>
												<asp:BoundColumn Visible="false" DataField="MaterialId" ReadOnly="True" HeaderText="materialid"></asp:BoundColumn>
												<asp:BoundColumn DataField="ModuleId" ReadOnly="True" HeaderText="模具編號"></asp:BoundColumn>
												<asp:BoundColumn Visible="False" DataField="ErpSpecification" ReadOnly="True" HeaderText="Erp規格"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="是否精料">
													<ItemTemplate>
														<asp:CheckBox id="isdetail" runat="server" Enabled=False Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container,"DataItem.isDetail"))%>' >
														</asp:CheckBox>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:CheckBox id="dg_checked_chk_isdetail" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container,"DataItem.isDetail"))%>'>
														</asp:CheckBox>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="是否外購成品">
													<ItemTemplate>
														<asp:CheckBox id="isproduct" runat="server" Enabled=False Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container,"DataItem.isProduct"))%>' >
														</asp:CheckBox>
													</ItemTemplate>
													<EditItemTemplate>
														<asp:CheckBox id="dg_checked_chk_isproduct" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container,"DataItem.isProduct"))%>'>
														</asp:CheckBox>
													</EditItemTemplate>
												</asp:TemplateColumn>
												<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
												<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;&gt;刪除&lt;/div&gt;" 
 HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
										<hr color="#ccccff">
										<asp:button id="btn_add" runat="server" Text="添加"></asp:button><asp:button id="btn_all" runat="server" Text="所有需採購"></asp:button><asp:button id="btn_inventry" runat="server" Text="倉庫核料打印"></asp:button><asp:datagrid id="dg_merchindise" runat="server" AutoGenerateColumns="False" AllowPaging="True"
											PageSize="15">
											<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
											<Columns>
												<asp:TemplateColumn>
													<ItemTemplate>
														<asp:CheckBox id="Chk_buy" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="BomPartType" ReadOnly="True" HeaderText="零件類別"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseBomId" ReadOnly="True" HeaderText="編碼"></asp:BoundColumn>
												<asp:BoundColumn DataField="PartNo" ReadOnly="True" HeaderText="零件編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseName" ReadOnly="True" HeaderText="名稱"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseSpecification" ReadOnly="True" HeaderText="規格"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseQuantity" ReadOnly="True" HeaderText="數量"></asp:BoundColumn>
												<asp:BoundColumn DataField="Weight" ReadOnly="True" HeaderText="重量"></asp:BoundColumn>
												<asp:BoundColumn Visible="false" DataField="MaterialId" ReadOnly="True" HeaderText="materialid"></asp:BoundColumn>
												<asp:BoundColumn DataField="ErpSpecification" ReadOnly="True" HeaderText="Erp規格"></asp:BoundColumn>
												<asp:BoundColumn DataField="ModuleId" ReadOnly="True" HeaderText="模具編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="Material" ReadOnly="True" HeaderText="材質"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="是否精料">
													<ItemTemplate>
														<asp:CheckBox id="dg_chk_isdetail" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="是否外購成品">
													<ItemTemplate>
														<asp:CheckBox id="dg_chk_isproduct" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
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
												<TD class="msg" width="85%">&nbsp;&nbsp;</TD>
											</TR>
										</table>
									</TD>
								</tr>
								<TR>
									<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
