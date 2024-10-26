<%@ Register TagPrefix="uc1" TagName="MeasuringHeader" Src="controls/MeasuringHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MeasuringView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MeasuringView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:measuringheader id="MeasuringHeader" runat="server"></uc1:measuringheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<TBODY>
									<tr>
										<td vAlign="top">
											<table width="100%" align="center" border="0">
												<asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label>
												<TBODY>
													<tr>
														<td><asp:label id="lab_InstrumentNo" runat="server" Text="InstrumentNo">儀器編號</asp:label></td>
														<td><asp:textbox id="txt_InstrumentNo" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_InstrumentName" runat="server" Text="InstrumentName">儀器名稱</asp:label></td>
														<td><asp:textbox id="txt_InstrumentName" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_salesupply" runat="server" Text="salesupply">銷售廠商</asp:label></td>
														<td><asp:dropdownlist id="dpl_salesupply" runat="server"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td><asp:label id="lab_stw" runat="server" Text="stw">廠牌</asp:label></td>
														<td><asp:textbox id="txt_stw" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_specifications" runat="server" Text="specifications">規格</asp:label></td>
														<td><asp:textbox id="txt_specifications" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_inputDate" runat="server" Text="inputDate">納入日期</asp:label></td>
														<td><wc:inputcalendar id="txt_inputDate" runat="server"></wc:inputcalendar></td>
													</tr>
													<tr>
														<td><asp:label id="lab_CorrectionCycle" runat="server" Text="CorrectionCycle">校正日期</asp:label></td>
														<td><wc:inputcalendar id="txt_correctionCycle" runat="server"></wc:inputcalendar></td>
													</tr>
													<tr>
														<td><asp:label id="lab_CorrectionStyle" runat="server" Text="CorrectionStyle">校正方式</asp:label></td>
														<td><asp:textbox id="txt_CorrectionStyle" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_minreading" runat="server" Text="minreading">最小讀值</asp:label></td>
														<td><asp:textbox id="txt_minreading" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_allowstandard" runat="server" Text="allowstandard">允許標準</asp:label></td>
														<td><asp:textbox id="txt_allowstandard" runat="server"></asp:textbox></td>
													</tr>
													<tr>
														<td><asp:label id="lab_unit" runat="server" Text="unit">單位</asp:label></td>
														<td><asp:dropdownlist id="dpl_unit" runat="server"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td><asp:label id="lab_testedDate" runat="server" Text="testedDate">預校驗日期</asp:label></td>
														<td><wc:inputcalendar id="txt_testedDate" runat="server"></wc:inputcalendar></td>
													</tr>
													<tr>
														<td><asp:label id="lab_CustodyDepartment" runat="server" Text="CustodyDepartment">保管部門</asp:label></td>
														<td><asp:dropdownlist id="dpl_CustodyDepartment" runat="server"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td><asp:label id="lab_Custodier" runat="server" Text="Custodier">保管人</asp:label></td>
														<td><asp:dropdownlist id="dpl_Custodier" runat="server"></asp:dropdownlist></td>
													</tr>
													<tr>
														<td><asp:label id="lab_comment" runat="server" Text="comment">備註</asp:label></td>
														<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
													</tr>
													<TR>
														<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
													</TR>
												</TBODY>
											</table>
										</td>
									</tr>
								</TBODY>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示信息</B></DIV>
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
		</TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
