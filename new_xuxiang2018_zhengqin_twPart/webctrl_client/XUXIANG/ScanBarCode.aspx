<%@ Page language="c#" Codebehind="ScanBarCode.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ScanBarCode" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>條形碼掃瞄</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function getFocus()
			{
				document.Form2.txtbarcode.focus();
			}
		</script>
		
	</HEAD>
	<body topMargin="0" onload="getFocus()">
		<form id="Form2" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<td>
							<TABLE id="table_main" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td width="15%">選擇工序</td>
									<td width="85%">
										<TABLE id="table_process" borderColor="#0000ff" cellSpacing="0" cellPadding="0" width="100%"
											border="1">
											<tr>
												<td><asp:radiobuttonlist id="rbl_process" runat="server" Font-Bold="true"></asp:radiobuttonlist></td>
											</tr>
										</TABLE>
									</td>
								</tr>
								<tr>
									<td>選擇狀態</td>
									<td>
										<TABLE id="table_status" borderColor="#0000ff" cellSpacing="0" cellPadding="0" width="100%"
											border="1">
											<tr>
												<td><asp:radiobuttonlist id="rbl_status" runat="server" Font-Bold="true"></asp:radiobuttonlist></td>
											</tr>
										</TABLE>
									</td>
								</tr>
								<tr>
									<td>輸入條碼</td>
									<td><input id="txtbarcode" size="50" name="txtbarcode" runat="server">
										<asp:label id="lab_barcode" runat="server"></asp:label></td>
								</tr>
							</TABLE>
						</td>
					</tr>
					<TR>
						<TD>
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
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
