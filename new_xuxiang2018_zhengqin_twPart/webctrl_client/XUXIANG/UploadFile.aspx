<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="UploadFile.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.UploadFile" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>BOM零件導入</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function returnVal()
			{
				//window.opener.document.forms['Form1'].TextBox_Picture.value = '<% = returnVal %>';
				//window.close();
			}
		</script>
	</HEAD>
	<body>
		<form id="Form1" method="post" encType="multipart/form-data" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
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
									<div align="left">bom表導入</div>
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
											<TD><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
											<TD>模具</TD>
											<TD colSpan="2"><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox_ModuleList"
													ErrorMessage="請選擇有效的模具編號"></asp:requiredfieldvalidator></TD>
										</TR>
										<tr>
											<td><asp:button id="btn_partupload" Text="零件上傳" Runat="server"></asp:button></td>
											<td><asp:button id="btn_meatlupload" Text="五金件上傳" Runat="server"></asp:button></td>
											<td><asp:button id="btn_nailupload" Text="頂針上傳" Runat="server"></asp:button></FONT></td>
										</tr>
									</table>
									<asp:textbox id="txt_content" runat="server" TextMode="MultiLine" Height="344px" Width="688px"></asp:textbox></td>
							</tr>
							<tr>
								<td><asp:datagrid id="dg_error" runat="server" AutoGenerateColumns="False">
										<Columns>
											<asp:BoundColumn DataField="ErrorLine" HeaderText="行數"></asp:BoundColumn>
											<asp:BoundColumn DataField="ErrorMessage" HeaderText="錯誤原因"></asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td>
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
												<asp:label id="lab_msg" runat="server"></asp:label></TD>
										</TR>
									</table>
								</td>
							</tr>
						</TABLE>
					</TD>
				</tr>
			</TABLE>
			</TD></TR><TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></form>
	</body>
</HTML>
