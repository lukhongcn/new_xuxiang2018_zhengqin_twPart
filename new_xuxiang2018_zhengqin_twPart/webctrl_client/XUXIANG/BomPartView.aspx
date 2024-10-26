<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="BomPartView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomPartView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>BOM設置</title>
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
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">模具零件設置</div>
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
												<TD>客戶</TD>
												<TD><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
												<TD>模具</TD>
												<TD><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox_ModuleList"
														ErrorMessage="請選擇有效的模具編號"></asp:requiredfieldvalidator></TD>
												<TD>零件編號</TD>
												<td><asp:textbox id="txt_partno" runat="server" AutoPostBack="True"></asp:textbox></td>
												<TD>零件名</TD>
												<td><asp:textbox id="txt_partname" runat="server"></asp:textbox></td>
											</TR>
											<TR>
												<TD>長</TD>
												<TD><asp:textbox id="txt_length" runat="server"></asp:textbox>
													<asp:RegularExpressionValidator id="RegularExpressionValidator4" runat="server" ErrorMessage="請輸入數字" ControlToValidate="txt_length"
														ValidationExpression="[0-9.]{1,}"></asp:RegularExpressionValidator></TD>
												<TD>寬</TD>
												<TD><asp:textbox id="txt_weigth" runat="server"></asp:textbox>
													<asp:RegularExpressionValidator id="RegularExpressionValidator3" runat="server" ErrorMessage="請輸入數字" ControlToValidate="txt_weigth"
														ValidationExpression="[0-9.]{1,}"></asp:RegularExpressionValidator></TD>
												<TD>高</TD>
												<TD><asp:textbox id="txt_height" runat="server"></asp:textbox>
													<asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" ErrorMessage="請輸入數字" ControlToValidate="txt_height"
														ValidationExpression="[0-9.]{1,}"></asp:RegularExpressionValidator></TD>
												<TD>數量</TD>
												<td><asp:textbox id="txt_quantity" runat="server"></asp:textbox><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ControlToValidate="txt_quantity"
														ErrorMessage="請輸入數字" ValidationExpression="[0-9.]{1,}"></asp:regularexpressionvalidator></td>
											</TR>
											<tr>
												<td>是否是Φ</td>
												<td><asp:checkbox id="chk_round" runat="server"></asp:checkbox></td>
												<TD>材質</TD>
												<td><asp:dropdownlist id="ddl_metarial" Runat="server"></asp:dropdownlist></td>
												<TD>備註</TD>
												<TD><asp:textbox id="txt_comment" runat="server"></asp:textbox></TD>
												<TD>版本</TD>
												<TD><asp:textbox id="txt_version" runat="server"></asp:textbox></TD>
											</tr>
										</table>
										<table cellSpacing="2" width="100%" border="0">
											<TR>
												<TD><asp:button id="BTaddmetal" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<asp:datagrid id="dgbompart" runat="server" AutoGenerateColumns="False">
								<Columns>
									<asp:BoundColumn DataField="BomPartId" ReadOnly="True" HeaderText="編碼"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo" ReadOnly="True" HeaderText="零件編號"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="零件名">
										<ItemTemplate>
											<asp:Label id="Label7" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_partname" Width=100 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="材質">
										<ItemTemplate>
											<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Material") %>'>
											</asp:Label>
											<asp:Label id="Label6" runat="server" Visible=False Text='<%# DataBinder.Eval(Container, "DataItem.MaterialId") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:DropDownList ID="dg_ddl_metarial" Width="100" Runat="server" AutoPostBack="True"></asp:DropDownList>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="Φ">
										<ItemTemplate>
											<asp:CheckBox id="isround" runat="server" Enabled=False Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container,"DataItem.IsRound"))%>' >
											</asp:CheckBox>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:CheckBox id="dg_chk_round" runat="server" Checked='<%# Convert.ToBoolean(DataBinder.Eval(Container,"DataItem.IsRound"))%>'>
											</asp:CheckBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="長">
										<ItemTemplate>
											<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartLength") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_length" Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartLength") %>'/>
											<asp:RegularExpressionValidator id="Regularexpressionvalidator6" runat="server" ErrorMessage="請輸入數字" ControlToValidate="dg_txt_quantity"
												ValidationExpression="[0-9.]{1,}"></asp:RegularExpressionValidator>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="寬">
										<ItemTemplate>
											<asp:Label id="Label8" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartWeigth") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_weigth" Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartWeigth") %>'/>
											<asp:RegularExpressionValidator id="Regularexpressionvalidator7" runat="server" ErrorMessage="請輸入數字" ControlToValidate="dg_txt_quantity"
												ValidationExpression="[0-9.]{1,}"></asp:RegularExpressionValidator>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="高">
										<ItemTemplate>
											<asp:Label id="Label9" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartHeight") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_height" Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartHeight") %>'/>
											<asp:RegularExpressionValidator id="Regularexpressionvalidator8" runat="server" ErrorMessage="請輸入數字" ControlToValidate="dg_txt_quantity"
												ValidationExpression="[0-9.]{1,}"></asp:RegularExpressionValidator>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="數量">
										<ItemTemplate>
											<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartQuantity") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_quantity" Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartQuantity") %>'/>
											<asp:RegularExpressionValidator id="Regularexpressionvalidator5" runat="server" ErrorMessage="請輸入數字" ControlToValidate="dg_txt_quantity"
												ValidationExpression="[0-9.]{1,}"></asp:RegularExpressionValidator>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="備註">
										<ItemTemplate>
											<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_comment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartComment") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="版本">
										<ItemTemplate>
											<asp:Label id="Label10" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartVersion") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_version" Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartVersion") %>'>
											</asp:TextBox>
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
