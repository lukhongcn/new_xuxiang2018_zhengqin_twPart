<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="popupOutSourceInfo.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Outsource.popupOutSourceInfo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�Ҩ�򥻫H��</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="JavaScript">
			self.moveTo(0,0); 
			self.resizeTo(screen.availWidth,screen.availHeight);
			self.focus(); 
		</script>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
	</HEAD>
	<body>
		<form id="form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD class="mainTitle" align="center">�Ҩ�򥻫H��</TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TR>
								<TD vAlign="top">
									<TABLE id="tbl_info" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<tr>
											<td width="95">�s��Ǹ�
											</td>
											<td><asp:label id="lab_partid" runat="server"></asp:label><asp:label id="lab_id" runat="server" Visible="False"></asp:label></td>
											<td>��M�Ҩ�~�]
											</td>
											<td><asp:checkbox id="chk_moduleall" runat="server"></asp:checkbox></td>
										</tr>
										<TR>
											<TD width="95">�Ҩ�s��</TD>
											<TD width="40%"><asp:label id="lab_module" runat="server"></asp:label></TD>
											<TD width="95">�s��s��</TD>
											<TD width="40%"><asp:label id="lab_partno" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD>�~�]�ƶq</TD>
											<TD><asp:label id="lab_outsourcenumber" runat="server"></asp:label></TD>
											<TD>�ݨD���</TD>
											<TD><asp:label id="lab_requiredate" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD>�ӽФH</TD>
											<TD><asp:label id="lab_user" runat="server"></asp:label></TD>
											<TD>�ӽг���</TD>
											<TD><asp:label id="lab_department" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD>���ʳ渹</TD>
											<TD><asp:label id="lab_applyMerchindiseNo" runat="server"></asp:label></TD>
											<TD>������</TD>
											<TD><asp:label id="lab_supply" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD>���</TD>
											<TD><asp:label id="lab_priceUnitId" runat="server"></asp:label></TD>
											<TD>�X�f�渹</TD>
											<TD><asp:label id="lab_outProductNo" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD>���ʳ渹</TD>
											<TD colSpan="3"><asp:label id="lab_merchindiseNo" runat="server"></asp:label></TD>
										</TR>
										<TR>
											<TD class="mainTitle" align="center" colSpan="4"><input onclick="javascript:window.close();" type="button" value="����" name="btn_close"></TD>
										</TR>
									</TABLE>
									<br>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
