<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="longfullScanBarCode2.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.longfullScanBarCode2" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>條形碼掃瞄</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function getFocus()
			{
				document.Form2.txt_input.focus();
			}
		</script>
		<style type="text/css">BODY { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	TD { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	TR { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	TABLE { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	A { COLOR: #325ba3 }
	.spcr { MARGIN: 0px 0px 10px; FONT-FAMILY: "Arial", "Helvetica" }
	.shade { BACKGROUND: #7694c8 }
	.shade2 { BACKGROUND: #f2f2f2 }
	.shade1 { BACKGROUND: #d9e2f2 }
	.shade3 { BACKGROUND: #f1f4fa }
	.highlight { COLOR: #ff6600 }
	.titleb { FONT-WEIGHT: bold; FONT-SIZE: 18px; COLOR: #3300cc; FONT-FAMILY: "Arial", "Helvetica" }
	.titleb2 { FONT-WEIGHT: bold; FONT-SIZE: 24px; COLOR: #993399; FONT-FAMILY: "Arial", "Helvetica" }
	.content { FONT-WEIGHT: bold; FONT-SIZE: 18px; COLOR: #cc0033; FONT-FAMILY: "Arial", "Helvetica" }
	.content1 { FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #993399; FONT-FAMILY: "Arial", "Helvetica" }
	.process { FONT-WEIGHT: bold; FONT-SIZE: 128px; COLOR: #cc0033; FONT-FAMILY: "Arial", "Helvetica" }
		</style>
	</HEAD>
	<body topMargin="0" onload="getFocus()">
		<form id="Form2" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD><uc1:header id="Header" runat="server"></uc1:header><br>
							&nbsp;&nbsp;<A href="default.aspx">返回首頁</A></TD>
					</TR>
					<tr>
						<td class="titleb2" align="center" colSpan="2">條形碼掃瞄</td>
					</tr>
					<tr>
						<td>
							<table width="100%" border="0">
								<tr>
									<td width="50%">
										<TABLE id="table_main" cellSpacing="10" cellPadding="2" width="100%" align="center" border="1">
											<tr>
												<td class="titleb" width="40%">員工編號</td>
												<td width="60%"><asp:label id="lab_userno" Runat="server" CssClass="content"></asp:label><asp:label id="lab_hiddenUserno" Runat="server" Visible="False"></asp:label>&nbsp;</td>
											</tr>
											<tr>
												<td class="titleb">當前零件條碼</td>
												<td><asp:label id="lab_barcode" Runat="server" CssClass="content"></asp:label><asp:label id="lab_hiddenModuleId" Runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenPartNo" Runat="server" Visible="False"></asp:label>&nbsp;
												</td>
											</tr>
											<tr>
												<td class="titleb">當前的動作</td>
												<td><asp:label id="lab_action" Runat="server" CssClass="content"></asp:label><asp:label id="lab_hiddenActionId" Runat="server" Visible="False"></asp:label>&nbsp;
												</td>
											</tr>
											<tr>
												<td class="titleb">機台</td>
												<td><asp:label id="lab_machine" CssClass="content" Runat="server"></asp:label><asp:label id="lab_hidden_machine" Runat="server" Visible="False"></asp:label>&nbsp;</td>
											</tr>
											<tr>
												<td class="titleb">零件編號</td>
												<td class="titleb">零件輸入規則如"1" "1,2"或"1-2"</td>
											</tr>
											<tr>
												<td class="titleb">加工方式</td>
												<td class="titleb"><asp:checkbox id="cbx_groupdeal" Runat="server" Text="在一台機器上批量加工"></asp:checkbox></td>
											</tr>
											<tr>
												<td class="titleb">條碼輸入框</td>
												<td><input class="content" id="txt_input" size="25" name="txt_input" runat="server">&nbsp;</td>
											</tr>
										</TABLE>
									</td>
									<td vAlign="top" width="50%">
										<table cellSpacing="10" cellPadding="2" width="100%" align="center" border="0">
											<tr>
												<td class="titleb">當前的工序</td>
												<td><asp:dropdownlist id="drp_processlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td colSpan="2"><asp:label id="lab_process" Runat="server" CssClass="process"></asp:label></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<TR>
						<TD>
							<TABLE id="Table4" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>零件狀態</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="lab_status" Runat="server" CssClass="content"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
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
										<asp:label id="Label_Message" runat="server" CssClass="content1"></asp:label></TD>
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
