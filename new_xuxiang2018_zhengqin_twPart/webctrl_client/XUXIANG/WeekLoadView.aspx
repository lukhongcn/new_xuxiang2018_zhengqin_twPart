<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="WeekLoadView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.WeekLoadView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML xmlns:o>
	<HEAD>
		<title>採購訂單管理</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body>
		<form method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">
											<P class="MsoNormal"><SPAN style="FONT-SIZE: 14pt; FONT-FAMILY: 標楷體">工別周產能負荷分析<SPAN lang="EN-US">
														<o:p></o:p>
													</SPAN></SPAN></P>
										</div>
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
							<table width="100%">
								<tr>
									<td>
										<asp:datagrid id="dg_machineload" runat="server" PageSize="25" AutoGenerateColumns="False" AllowPaging="True">
											<Columns>
												<asp:BoundColumn DataField="WeekTh" ReadOnly="True" HeaderText="周次"></asp:BoundColumn>
												<asp:BoundColumn DataField="Capacity" ReadOnly="True" HeaderText="產能"></asp:BoundColumn>
												<asp:BoundColumn DataField="Load" ReadOnly="True" HeaderText="負荷量"></asp:BoundColumn>
												<asp:BoundColumn DataField="LoadPercent" ReadOnly="True" HeaderText="負荷百分比%"></asp:BoundColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
									</td>
									<td align="left"><asp:Image id="chart" runat="server" BorderStyle="None"></asp:Image></td>
								</tr>
							</table>
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
						<TD colSpan="3"></TD>
					</TR>
				</TBODY></TABLE>
		</form>
	</body>
</HTML>
