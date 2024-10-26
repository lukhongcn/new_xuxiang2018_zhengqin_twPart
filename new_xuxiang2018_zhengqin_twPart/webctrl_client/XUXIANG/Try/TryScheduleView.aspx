<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="TryScheduleView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.TryScheduleView" %>
<%@ Register TagPrefix="uc1" TagName="TryScheduleListHeader" Src="controls/TryScheduleListHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>試模計劃</title>
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
						<TD vAlign="top" width="79%"><FONT face="新細明體"></FONT><FONT face="新細明體"></FONT>
							<uc1:TryScheduleListHeader id="TryScheduleListHeader1" runat="server"></uc1:TryScheduleListHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<TR>
												<TD width="10%" style="HEIGHT: 24px">客戶編號</TD>
												<TD width="40%" style="HEIGHT: 24px"><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist>
													<asp:Label id="lab_Id" runat="server" Visible="False"></asp:Label></TD>
												<TD width="10%" style="HEIGHT: 24px"><asp:Label ID="lab_moduleId" runat="server" Text="moduleId">模具編號</asp:Label></TD>
												<TD width="40%" style="HEIGHT: 24px"><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ErrorMessage="請選擇有效的模具編號" ControlToValidate="ListBox_ModuleList"></asp:requiredfieldvalidator></TD>
											</TR>
											<tr>
												<td><asp:Label ID="lab_TryScheduleNo" runat="server" Text="moduleName">試模編號</asp:Label></td>
												<td><asp:textbox id="txt_TryScheduleNo" runat="server" ReadOnly="True"></asp:textbox></td>
												<td><asp:Label ID="lab_expectTryDate" runat="server" Text="">預計完成日期</asp:Label></td>
												<td><wc:inputcalendar id="txt_expectTryDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_tryCount" runat="server" Text="tryCount">樣品需求數量</asp:Label></td>
												<td><asp:textbox id="txt_tryCount" runat="server"></asp:textbox></td>
												<TD width="10%"><FONT face="新細明體">材質</FONT></TD>
												<TD width="40%">&nbsp;<asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
											<TR>
												<td><asp:Label ID="lab_ColorNo" runat="server" Text="">色粉編號</asp:Label></td>
												<td><asp:textbox id="txt_ColorNo" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_ColorDate" runat="server" Text="">顏色送樣日期</asp:Label></td>
												<td><wc:inputcalendar id="txt_ColorDate" runat="server"></wc:inputcalendar></td>
											</TR>
											<tr>
												<td><asp:Label ID="lab_comment" runat="server" Text="comment">備註</asp:Label><asp:Label Visible=False ID="lab_statusid" Text="" Runat=server></asp:Label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</tr>
										</table>
									</td>
								</tr>
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
