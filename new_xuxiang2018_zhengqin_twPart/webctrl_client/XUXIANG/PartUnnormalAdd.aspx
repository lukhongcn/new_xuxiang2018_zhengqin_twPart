<%@ Page language="c#" Codebehind="PartUnnormalAdd.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartUnnormalAdd" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="PartUnnormalHeader" Src="controls/PartUnnormalHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>零件報廢設定</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<script language="javascript" src="js/lib.js"></script>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:partunnormalheader id="PartUnnormalHeader" runat="server"></uc1:partunnormalheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<TR>
										<TD>客戶名稱<asp:dropdownlist id="drp_customerlist" AutoPostBack="True" Runat="server"></asp:dropdownlist></TD>
										<TD><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id="drp_modulelist" AutoPostBack="True" Runat="server"></asp:dropdownlist></TD>
										<TD>零件編號<asp:dropdownlist id="drp_partnolist" runat="server"></asp:dropdownlist></TD>
										<td><asp:button id="btn_search" Runat="server" Text="查詢"></asp:button></td>
									</TR>
								</TBODY>
							</TABLE>
							<br>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="加工順序">
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label runat="server" ID="Label_ProcessOrder" Text='<%# DataBinder.Eval(Container, "DataItem.processorder") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="true" HeaderText="工序名稱">
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessID") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="實際開始日期">
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label runat="server" ID="Label_FactStartDate" Text='<%# DataBinder.Eval(Container, "DataItem.factstartdate","{0:yyyy-MM-dd}") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="實際結束日期">
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label runat="server" ID="Label_FactEndDate" Text='<%# DataBinder.Eval(Container, "DataItem.factenddate","{0:yyyy-MM-dd}") %>' >
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="需要加工工時">
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<ItemTemplate>
											<asp:Label runat="server" ID="Label_ProcessNeedMinutes" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessNeedMinutes") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid><asp:button id="Button_Edit" runat="server" Text="報廢"></asp:button>&nbsp;&nbsp;&nbsp;<input onclick="javascript:window.location='partunnormalList.aspx'" type="button" value="取消"
								name="cancel">
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="red"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
			<script lang="javascirpt">
				initSelect();
			</script>
		</form>
	</body>
</HTML>
