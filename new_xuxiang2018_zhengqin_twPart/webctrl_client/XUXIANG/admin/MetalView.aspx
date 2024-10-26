<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="MetalView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MetalView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>五金類零件設置</title>
		<LINK href="../css/common.css" rel="stylesheet">
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
										<div align="left">五金類零件設置<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#000660" cellSpacing="1" borderColorDark="#000066" cellPadding="0"
								width="100%" align="center" borderColorLight="#000066" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<tr>
												<TD>品名:</TD>
												<TD><asp:textbox id="txtmetalname" runat="server"></asp:textbox></TD>
												<td vAlign="top" rowSpan="4">
													<table>
														<tr>
															<td valign="top">類型:</td>
															<td valign="top"><asp:radiobuttonlist id="rbl_metaltype" runat="server"></asp:radiobuttonlist></td>
														</tr>
													</table>
												</td>
											</tr>
											<TR>
												<TD>描述:</TD>
												<TD><asp:textbox id="txtmetaldescription" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>規格:</TD>
												<TD><asp:textbox id="txtspecification" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>ERP編碼:</TD>
												<TD><asp:textbox id="txt_erpid" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>備註:</EM></STRONG></TD>
												<TD><asp:textbox id="txtmetalcomment" runat="server"></asp:textbox></TD>
											</TR>
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
							<asp:datagrid id="dgmetal" runat="server" AutoGenerateColumns="False">
								<Columns>
									<asp:BoundColumn DataField="MetalId" ReadOnly="True" HeaderText="編碼"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="品名">
										<ItemTemplate>
											<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=txt_name runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalName") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="類型">
										<ItemTemplate>
											<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalType") %>'>
											</asp:Label>
											<asp:Label id="Label6" runat="server" Visible =false Text='<%# DataBinder.Eval(Container, "DataItem.MetalTypeId") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:DropDownList ID="metaltype" Runat="server" AutoPostBack="True"></asp:DropDownList>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="描述">
										<ItemTemplate>
											<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalDescription") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="txt_description" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalDescription") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="規格">
										<ItemTemplate>
											<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalSpecification") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="txt_specification" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalSpecification") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="ERP編碼">
										<ItemTemplate>
											<asp:Label id="Label7" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ErpId") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_erpid" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ErpId") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="備註">
										<ItemTemplate>
											<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="txt_comment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalComment") %>'/>
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
		</form>
		</TD></TR>
		<TR>
			<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
		</TR>
		</TBODY></TABLE>
	</body>
</HTML>
