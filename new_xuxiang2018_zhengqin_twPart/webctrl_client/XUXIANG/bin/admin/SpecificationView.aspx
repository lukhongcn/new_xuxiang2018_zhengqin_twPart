<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="SpecificationView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.SpecificationView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>規格設置</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%">
							<uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">規格設定<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
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
												<TD style="HEIGHT: 37px">規格名</TD>
												<TD style="HEIGHT: 37px"><asp:textbox id="txt_specificationname" runat="server"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txt_specificationname"
														ErrorMessage="必須輸入名字"></asp:requiredfieldvalidator></TD>
												<TD style="HEIGHT: 37px">ERP編碼</TD>
												<TD style="HEIGHT: 37px"><asp:textbox id="txt_erpid" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>備註</TD>
												<TD><asp:textbox id="txt_specificationcomment" runat="server"></asp:textbox></TD>
												<TD colSpan="2"><asp:button id="Button_AddEdit" runat="server" Text="新增"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<table cellSpacing="2" border="0">
								<TR>
									<td>
										<asp:DropDownList id="dpl_type" runat="server" AutoPostBack="True"></asp:DropDownList></td>
									<td><asp:textbox id="txt_namelike" runat="server"></asp:textbox></td>
									<TD><asp:button id="Button1" runat="server" Text="規格搜索" CausesValidation="False"></asp:button></TD>
								</TR>
							</table>
							<br>
							<asp:datagrid id="dg_specification" runat="server" AutoGenerateColumns="False" CellSpacing="2"
								CellPadding="2" AllowPaging="True">
								<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="SpecificationId" ReadOnly="True" HeaderText="規格編碼"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="規格名">
										<ItemTemplate>
											<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SpecificationName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=dg_txt_name runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SpecificationName") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="ERP編碼">
										<ItemTemplate>
											<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Erpid") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_erpid" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ErpId") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="備註">
										<ItemTemplate>
											<asp:Label id=Label3 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SpecificationComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=dg_txt_comment runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SpecificationComment") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;&gt;刪除&lt;/div&gt;"
										HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
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
