<%@ Page language="c#" Codebehind="StandardPartList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.standard.StandardPartList" %>
<%@ Register TagPrefix="c1webgrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
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
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
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
										<div style="LEFT: 0%; FLOAT: right"><asp:label id="lab_title" runat="server" Text="lab_title">標準工序瀏覽</asp:label></div>
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
												<td><asp:label id="lab_typeName" runat="server" Text="typeName">類型名稱</asp:label><asp:dropdownlist id="dpl_standardtype" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
												<td></td>
											</tr>
											<tr>
												<td colSpan="5"><FONT face="新細明體"></FONT></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<table width="100%" align="center" border="0">
								<tr>
									<td>
										<c1webgrid:c1webgrid id="dg_StandProcess" runat="server" AllowPaging="True" AutoGenerateColumns="False"
											DefaultColumnWidth="120px" DefaultRowHeight="22px" DataMember="Invoices" GroupIndent="15px" Width="640px"
											CellSpacing="0" CellPadding="0" Font-Size="X-Small" Font-Names="Trebuchet MS" BorderColor="Black">
											<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
											<ItemStyle HorizontalAlign="Center"></ItemStyle>
											<Columns>
												<c1webgrid:C1BoundColumn HeaderText="編號" DataField="Id"></c1webgrid:C1BoundColumn>
												<c1webgrid:C1BoundColumn HeaderText="加工順序" DataField="ListOrder"></c1webgrid:C1BoundColumn>
												<c1webgrid:C1BoundColumn HeaderText="工序名" DataField="ProcessName"></c1webgrid:C1BoundColumn>
												<c1webgrid:C1BoundColumn HeaderText="需要時間" DataField="ProcessNeedMinutes"></c1webgrid:C1BoundColumn>
												<c1webgrid:C1BoundColumn HeaderText="標準工序類型" DataField="StandardProcessType"></c1webgrid:C1BoundColumn>
												<c1webgrid:C1TemplateColumn>
													<HeaderTemplate>
														<asp:Label id="dg_header_productId" runat="server" text='標準工序名稱'></asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_StandardProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StandardProcessName") %>' />
													</ItemTemplate>
												</c1webgrid:C1TemplateColumn>
												<c1webgrid:C1TemplateColumn HeaderText="動作">
													<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
													<ItemTemplate>
														<asp:HyperLink id="HyperLink_EditProcess" runat="server" Text="工序設定編輯" NavigateUrl='<%# "StandardPartAddEdit.aspx?type="+Server.UrlEncode((string)DataBinder.Eval(Container, "DataItem.StandardProcessType"))+"&name="+Server.UrlEncode((string)DataBinder.Eval(Container, "DataItem.StandardProcessName"))+"&func=edit" %>'>
														</asp:HyperLink>
													</ItemTemplate>
												</c1webgrid:C1TemplateColumn>
												<c1webgrid:C1ButtonColumn CommandName="Delete" Text="刪除"></c1webgrid:C1ButtonColumn>
											</Columns>
											<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
											<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
										</c1webgrid:c1webgrid>
									</td>
								</tr>
							</table>
							<hr style="COLOR: #ccccff">
							<br>
							<table style="BORDER-LEFT-COLOR: #000660; BORDER-BOTTOM-COLOR: #000660; WIDTH: 100%; BORDER-TOP-STYLE: solid; BORDER-TOP-COLOR: #000660; BORDER-RIGHT-STYLE: solid; BORDER-LEFT-STYLE: solid; TEXT-ALIGN: center; BORDER-RIGHT-COLOR: #000660; BORDER-BOTTOM-STYLE: solid"
								border="1">
								<tr style="VERTICAL-ALIGN: middle">
									<td style="WIDTH: 15%">
										<div style="TEXT-ALIGN: center"><asp:label id="Label_Notice" runat="server">提示</asp:label></div>
									</td>
									<td class="msg" style="WIDTH: 85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="Red"></asp:label></td>
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
