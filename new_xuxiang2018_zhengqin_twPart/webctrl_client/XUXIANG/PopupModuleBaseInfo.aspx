<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="PopupModuleBaseInfo.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PopupModuleBaseInfo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�Ҩ�򥻫H��</title>
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
					<TD align="center" class="mainTitle">�Ҩ�򥻫H��</TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TR>
								<TD width="60%" valign="top">
									<TABLE id="tbl_info" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<TR>
											<TD width="20%">�Ҩ�s��</TD>
											<TD colspan="3" width="80%"><asp:Label id="lab_moduleid" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD width="20%">�Ȥ�s��</TD>
											<TD width="30%"><asp:Label id="lab_customerid" runat="server"></asp:Label></TD>
											<TD width="20%">�Ȥ�W��</TD>
											<TD width="30%"><asp:Label id="lab_customername" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>���~�s��</TD>
											<TD><asp:Label id="lab_productid" runat="server"></asp:Label></TD>
											<TD>���~�W��</TD>
											<TD><asp:Label id="lab_productname" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>���~����</TD>
											<TD><asp:Label id="lab_producttype" runat="server"></asp:Label></TD>
											<TD>����</TD>
											<TD><asp:Label id="lab_material" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�y��</TD>
											<TD><asp:Label id="lab_ton" runat="server"></asp:Label></TD>
											<TD>�޼�</TD>
											<TD><asp:Label id="lab_hole" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�̲׹ϭ���m</TD>
											<TD colspan="3"><asp:Label id="lab_piclocation" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�Ѧҹϭ����</TD>
											<TD><asp:Label id="lab_picdate" runat="server"></asp:Label></TD>
											<TD>�̲׹ϭ����</TD>
											<TD><asp:Label id="lab_picfinaldate" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>T0</TD>
											<TD><asp:Label id="lab_t0" runat="server"></asp:Label></TD>
											<TD>T1</TD>
											<TD><asp:Label id="lab_t1" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>T2</TD>
											<TD><asp:Label id="lab_t2" runat="server"></asp:Label></TD>
											<TD>TF</TD>
											<TD><asp:Label id="lab_tf" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>��~���</TD>
											<TD><asp:Label id="lab_yingyedandang" runat="server"></asp:Label></TD>
											<TD>�u�{���</TD>
											<TD><asp:Label id="lab_gongchengdangdang" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�]�p���</TD>
											<TD><asp:Label id="lab_shejidandang" runat="server"></asp:Label></TD>
											<TD>�ե߾��</TD>
											<TD><asp:Label id="lab_zulidandang" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>����</TD>
											<TD><asp:Label id="lab_dandangzhe" runat="server"></asp:Label></TD>
											<TD>�եߤѼ�</TD>
											<TD><asp:Label id="lab_zulidays" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�Ҩ㪬�A</TD>
											<TD><asp:Label id="lab_status" runat="server"></asp:Label></TD>
											<TD>�Ҩ㵥��</TD>
											<TD><asp:dropdownlist id="ListBox_Priority" runat="server" Enabled="False"></asp:dropdownlist></TD>
										</TR>
									</TABLE>
									<br>
									<TABLE id="tbl_date" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<TR>
											<TD bgcolor="#9999ff" align="center">&nbsp;</TD>
											<TD bgcolor="#9999ff" align="center">�p�����</TD>
											<TD bgcolor="#9999ff" align="center">��ڤ��</TD>
										</TR>
										<TR>
											<TD>�ƫe�˰Q�|���</TD>
											<TD align="center"><asp:Label id="lab_jiantao" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_jiantao_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�򥻹ϥX�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_jibentu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_jibentu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>2D�ϥX�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_2dtu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_2dtu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>3D���ɥX�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_3dtu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_3dtu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�����ϥX�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_shuilutu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_shuilutu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�Ҥ��ϥX�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_morentu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_morentu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�s��ϥX�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_lingjiantu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_lingjiantu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�q���ˬd���</TD>
											<TD align="center"><asp:Label id="lab_dianji" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_dianji_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>����D�ʤJ���</TD>
											<TD align="center"><asp:Label id="lab_rejiaodao" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_rejiaodao_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�Ҭ[�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_mojiatu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_mojiatu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�Ҭ[�ʤJ���</TD>
											<TD align="center"><asp:Label id="lab_mojiagouru" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_mojiagouru_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�Ҭ[�������</TD>
											<TD align="center"><asp:Label id="lab_mojiawancheng" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_mojiawancheng_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�ե߹ϥX�Ϥ��</TD>
											<TD align="center"><asp:Label id="lab_zulitu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_zulitu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>�JDCC</TD>
											<TD align="center"><asp:Label id="lab_rudcc" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_rudcc_f" runat="server"></asp:Label></TD>
										</TR>
									</TABLE>
								</TD>
								<TD width="40%" valign="top">
									<TABLE id="tbl_pic" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<TR>
											<TD><img src='<%=imgpath %>'></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
				<TR>
					<TD align="center"><input name="btn_close" type="button" value="����" onclick="javascript:window.close();"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
