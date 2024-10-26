<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="StandardPartHeader" Src="controls/StandardPartHeader.ascx" %>
<%@ Page language="c#" Codebehind="StandProcessType.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.standard.StandProcessType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>工序類型</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </HEAD>
	<body>
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="4"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><BR>
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div style="LEFT: 0%; FLOAT: right"><asp:label id="lab_title" runat="server" Text="lab_title">標準工序類型設置</asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<table id="Table1" style="BORDER-LEFT-COLOR: #ccccff; BORDER-BOTTOM-COLOR: #ccccff; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #ccccff; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; TEXT-ALIGN: center; BORDER-RIGHT-COLOR: #ccccff; BORDER-BOTTOM-STYLE: solid"
								cellSpacing="1" cellPadding="0" width="100%" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<tr>
												<td style="HEIGHT: 23px"><asp:label id="lab_typeName" runat="server" Text="類別名稱"></asp:label><asp:textbox id="txt_typeName" runat="server"></asp:textbox></td>
												<td style="HEIGHT: 23px"></td>
											</tr>
											<tr>
												<td colSpan="5"><asp:button id="btn_add" runat="server" Text="新增"></asp:button></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<asp:datagrid id="dg_StandProcessType" runat="server" AutoGenerateColumns="False" AllowPaging="True">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="Id">
										<HeaderTemplate>
											<asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id=dg_lab_Id runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Id")%>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="typeName">
										<HeaderTemplate>
											<asp:Label id="dg_header_typeName" runat="server">類型名稱</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_typeName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.TypeName")%>' />
										</ItemTemplate>
										<EditItemTemplate>
											<asp:textbox id="dg_txt_typeName" Width="40" runat="server" Text=' <%# DataBinder.Eval(Container, "DataItem.typeName")%> ' />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;&gt;刪除&lt;/div&gt;" HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
							<hr style="COLOR: #ccccff">
							<br>
							<table style="BORDER-LEFT-COLOR: #000660; BORDER-BOTTOM-COLOR: #000660; WIDTH: 100%; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #000660; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; TEXT-ALIGN: center; BORDER-RIGHT-COLOR: #000660; BORDER-BOTTOM-STYLE: solid"
								border="1">
								<tr>
									<td style="WIDTH: 15%">
										<div style="TEXT-ALIGN: left"><asp:label id="Label_Notice" runat="server">提示</asp:label></div>
									</td>
									<td style="WIDTH: 85%; TEXT-ALIGN: left"><asp:label id="Label_Message" runat="server" ForeColor="Red"></asp:label></td>
								</tr>
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
