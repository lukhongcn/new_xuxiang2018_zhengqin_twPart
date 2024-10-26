<%@ Page language="c#" Codebehind="xuxiangBomDetailViewExcel.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.xuxiangBomDetailViewExcel" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="xuxiangBomDetailHeader" Src="controls/xuxiangBomDetailHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left"><uc1:xuxiangbomdetailheader id="xuxiangBomDetailHeader" runat="server"></uc1:xuxiangbomdetailheader></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<TBODY>
									<tr>
										<td vAlign="top">
											<table width="100%" align="center" border="0">
												<TBODY>
													<tr>
														<td style="HEIGHT: 32px"><asp:label id="lab_customerid" runat="server" Text="客戶"></asp:label></td>
										</td>
										<td style="HEIGHT: 32px"><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:label id="lab_Id" runat="server" Visible="False"></asp:label><asp:label id="lab_designNo" runat="server" Visible="False"></asp:label></td>
										<td>工令單號</td>
										<td><asp:dropdownlist id="dpl_moduleId" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
									</tr>
									<tr>
										<td style="HEIGHT: 32px"><asp:label id="lab_creater" runat="server" Text="創建人"></asp:label></td>
										<td style="HEIGHT: 32px"><asp:dropdownlist id="dpl_creater" runat="server"></asp:dropdownlist></td>
										<td><FONT face="新細明體"><asp:label id="lab_createDate" runat="server" Text="創建日期"></asp:label></FONT></td>
										<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar></td>
									</tr>
									<tr>
										<td><asp:label id="lab_productno" runat="server" Text="指令單號"></asp:label></td>
										<td><asp:textbox id="txt_productno" runat="server"></asp:textbox></td>
										<td><asp:label id="lab_version" runat="server" Text="版序"></asp:label></td>
										<td><asp:textbox id="txt_version" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td vAlign="top">BOM明細</td>
										<td colSpan="3"><asp:textbox id="txt_content" runat="server" TextMode="MultiLine" Height="200px" Width="688px"></asp:textbox></td>
									</tr>
									<tr>
										<td style="HEIGHT: 37px" colSpan="4">
											<hr>
										</td>
									</tr>
									<TR>
										<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
									</TR>
									<tr>
										<td colSpan="4"></td>
									</tr>
								</TBODY>
							</TABLE>
							<asp:datagrid id="dg_error" runat="server" AutoGenerateColumns="False">
								<Columns>
									<asp:BoundColumn DataField="ErrorLine" HeaderText="行數"></asp:BoundColumn>
									<asp:BoundColumn DataField="ErrorMessage" HeaderText="錯誤原因"></asp:BoundColumn>
								</Columns>
							</asp:datagrid></TD>
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
								<DIV align="center"><B>提示</B></DIV>
							</B>
						</DIV>
					</TD>
					<TD class="msg" width="85%">&nbsp;&nbsp;
						<asp:label id="Label_Message" runat="server"></asp:label></TD>
				</TR>
			</table>
			</TD></TR>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
		</TR></TBODY></TABLE></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
