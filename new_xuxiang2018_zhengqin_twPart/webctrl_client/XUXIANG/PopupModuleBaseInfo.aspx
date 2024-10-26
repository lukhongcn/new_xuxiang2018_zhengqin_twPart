<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="PopupModuleBaseInfo.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PopupModuleBaseInfo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具基本信息</title>
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
					<TD align="center" class="mainTitle">模具基本信息</TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TR>
								<TD width="60%" valign="top">
									<TABLE id="tbl_info" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<TR>
											<TD width="20%">模具編號</TD>
											<TD colspan="3" width="80%"><asp:Label id="lab_moduleid" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD width="20%">客戶編號</TD>
											<TD width="30%"><asp:Label id="lab_customerid" runat="server"></asp:Label></TD>
											<TD width="20%">客戶名稱</TD>
											<TD width="30%"><asp:Label id="lab_customername" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>產品編號</TD>
											<TD><asp:Label id="lab_productid" runat="server"></asp:Label></TD>
											<TD>產品名稱</TD>
											<TD><asp:Label id="lab_productname" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>產品類型</TD>
											<TD><asp:Label id="lab_producttype" runat="server"></asp:Label></TD>
											<TD>材質</TD>
											<TD><asp:Label id="lab_material" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>頓數</TD>
											<TD><asp:Label id="lab_ton" runat="server"></asp:Label></TD>
											<TD>穴數</TD>
											<TD><asp:Label id="lab_hole" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>最終圖面位置</TD>
											<TD colspan="3"><asp:Label id="lab_piclocation" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>參考圖面日期</TD>
											<TD><asp:Label id="lab_picdate" runat="server"></asp:Label></TD>
											<TD>最終圖面日期</TD>
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
											<TD>營業擔當</TD>
											<TD><asp:Label id="lab_yingyedandang" runat="server"></asp:Label></TD>
											<TD>工程擔當</TD>
											<TD><asp:Label id="lab_gongchengdangdang" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>設計擔當</TD>
											<TD><asp:Label id="lab_shejidandang" runat="server"></asp:Label></TD>
											<TD>組立擔當</TD>
											<TD><asp:Label id="lab_zulidandang" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>擔當者</TD>
											<TD><asp:Label id="lab_dandangzhe" runat="server"></asp:Label></TD>
											<TD>組立天數</TD>
											<TD><asp:Label id="lab_zulidays" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>模具狀態</TD>
											<TD><asp:Label id="lab_status" runat="server"></asp:Label></TD>
											<TD>模具等級</TD>
											<TD><asp:dropdownlist id="ListBox_Priority" runat="server" Enabled="False"></asp:dropdownlist></TD>
										</TR>
									</TABLE>
									<br>
									<TABLE id="tbl_date" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<TR>
											<TD bgcolor="#9999ff" align="center">&nbsp;</TD>
											<TD bgcolor="#9999ff" align="center">計劃日期</TD>
											<TD bgcolor="#9999ff" align="center">實際日期</TD>
										</TR>
										<TR>
											<TD>事前檢討會日期</TD>
											<TD align="center"><asp:Label id="lab_jiantao" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_jiantao_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>基本圖出圖日期</TD>
											<TD align="center"><asp:Label id="lab_jibentu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_jibentu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>2D圖出圖日期</TD>
											<TD align="center"><asp:Label id="lab_2dtu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_2dtu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>3D圖檔出圖日期</TD>
											<TD align="center"><asp:Label id="lab_3dtu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_3dtu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>水路圖出圖日期</TD>
											<TD align="center"><asp:Label id="lab_shuilutu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_shuilutu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>模仁圖出圖日期</TD>
											<TD align="center"><asp:Label id="lab_morentu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_morentu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>零件圖出圖日期</TD>
											<TD align="center"><asp:Label id="lab_lingjiantu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_lingjiantu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>電極檢查日期</TD>
											<TD align="center"><asp:Label id="lab_dianji" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_dianji_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>熱澆道購入日期</TD>
											<TD align="center"><asp:Label id="lab_rejiaodao" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_rejiaodao_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>模架圖日期</TD>
											<TD align="center"><asp:Label id="lab_mojiatu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_mojiatu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>模架購入日期</TD>
											<TD align="center"><asp:Label id="lab_mojiagouru" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_mojiagouru_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>模架完成日期</TD>
											<TD align="center"><asp:Label id="lab_mojiawancheng" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_mojiawancheng_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>組立圖出圖日期</TD>
											<TD align="center"><asp:Label id="lab_zulitu" runat="server"></asp:Label></TD>
											<TD align="center"><asp:Label id="lab_zulitu_f" runat="server"></asp:Label></TD>
										</TR>
										<TR>
											<TD>入DCC</TD>
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
					<TD align="center"><input name="btn_close" type="button" value="關閉" onclick="javascript:window.close();"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
