<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/logisticheader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="BomView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>採購訂單管理</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body>
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
										<div align="left">BOM表</div>
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
												<TD><asp:dropdownlist id="dpl_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
												<TD>模具</TD>
												<TD><asp:dropdownlist id="dpl_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
												<td><asp:textbox id="txt_module" runat="server" AutoPostBack="True"></asp:textbox></td>
												<TD><asp:button id="Button1" runat="server" Text="搜索"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<asp:datagrid id="dg_bom" runat="server" PageSize="25" AutoGenerateColumns="False" AllowPaging="True">
								<Columns>
									<asp:BoundColumn DataField="ModuleId" ReadOnly="True" HeaderText="模具編碼"></asp:BoundColumn>
									<asp:BoundColumn DataField="Specification" ReadOnly="True" HeaderText="規格"></asp:BoundColumn>
									<asp:BoundColumn DataField="SWeight" ReadOnly="True" HeaderText="重量"></asp:BoundColumn>
									<asp:BoundColumn DataField="MaterialErpId" ReadOnly="True" HeaderText="材質ERP編碼"></asp:BoundColumn>
									<asp:BoundColumn DataField="ErpSpecification" ReadOnly="True" HeaderText="ERP規格"></asp:BoundColumn>
									<asp:BoundColumn DataField="Material" ReadOnly="True" HeaderText="材質"></asp:BoundColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
							<hr color="#ccccff">
							<br>
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
				</TBODY></TABLE>
		</form>
	</body>
</HTML>
