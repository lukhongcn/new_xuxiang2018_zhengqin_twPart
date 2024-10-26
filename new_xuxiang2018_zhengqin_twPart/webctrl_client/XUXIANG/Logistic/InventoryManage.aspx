<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="InventoryManage.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Logistic.InventoryManage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>規格設置</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function getFocus()
			{
				document.Form1.txt_partCount.focus();
			}
		</script>
	</HEAD>
	<body topMargin="0" onload="getFocus()">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3">
							<uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><FONT face="新細明體">
								<uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></FONT></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">倉庫出入庫管理<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<table width="100%" align="center" border="0">
								<tr>
									<td><asp:label id="lab_user" runat="server" Text="領/送貨人"></asp:label>
									<td><asp:label id="lab_user_value" runat="server"></asp:label></td>
									<td><asp:label id="lab_moduleId" runat="server" Text="模具編號"></asp:label>
									<td><asp:label id="lab_moduleIdvalue" runat="server"></asp:label></td>
									<td><asp:label id="lab_partno" runat="server" Text="零件編號" /></td>
									<td>
										<asp:label id="lab_partnovalue" runat="server" /></td>
									<td><asp:label id="lab_action" runat="server" Text="出/入庫"></asp:label></td>
									<td><asp:label id="lab_actionvalue" runat="server"></asp:label></td>
								</tr>
								<tr>
									<td>
										<asp:label id="Label1" runat="server" text="條碼掃瞄" /></td>
									<td colspan="5" vAlign="top">&nbsp; <INPUT id="txt_partCount" type="text" name="txt_partCount" runat="server">
										<asp:Label id="lab_hiddenActionId" runat="server" Visible="False">Label</asp:Label>
									</td>
								</tr>
								<TR>
									<TD colSpan="6"><asp:button id="btn_out" runat="server" Text="直接出庫"></asp:button></TD>
								</TR>
							</table>
							<br>
							<asp:datagrid id="dg_Inventory" runat="server" AllowCustomPaging="True" AllowPaging="True" AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="Id">
										<HeaderTemplate>
											<asp:Label id="dg_header_Id" runat="server" text="編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_Id" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>' />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="moduleId">
										<HeaderTemplate>
											<asp:Label id="dg_header_moduleId" runat="server" text="模具編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_moduleId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_moduleId" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.moduleId") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partNo">
										<HeaderTemplate>
											<asp:Label id="dg_header_partNo" runat="server" text="零件編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.partNo") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partNoId">
										<HeaderTemplate>
											<asp:Label id="dg_header_partNoId" runat="server" text="零件小編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_partNoId" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartNoId") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_partNoId" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.PartNoId") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="shelfNo">
										<HeaderTemplate>
											<asp:Label id="dg_header_shelfNo" runat="server" text="貨架編號" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_shelfNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ShelfNo") %>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="Textbox1" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.shelfNo") %> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定出庫嗎？') &quot;&gt;出庫&lt;/div&gt;"
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
