<%@ Page language="c#" Codebehind="xuxiangPopupModuleBaseInfo.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangPopupOrderBaseInfo" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<TITLE>模具基本信息</TITLE>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
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
					<TD class="mainTitle" align="center">模具基本信息</TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TR>
								<TD vAlign="top">
									<TABLE id="tbl_info" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<tr>
											<td>接單日期</td>
											<td><asp:label id="lab_referencePictureDate" runat="server"></asp:label>&nbsp;</td>
											<TD>客戶名稱</TD>
											<TD><asp:label id="lab_customerid" runat="server"></asp:label>&nbsp;</TD>
										</tr>
										<TR>
											<td>工令單號</td>
											<td><asp:label id="lab_isPart" Runat="server"></asp:label>&nbsp;<asp:label id="lab_moduleid" runat="server"></asp:label></td>
											<td>估計價格</td>
											<td><asp:label id="lab_price" runat="server"></asp:label>&nbsp;</td>
										</TR>
										<tr>
											<TD>模具狀態</TD>
											<TD><asp:label id="lab_status" runat="server"></asp:label>&nbsp;</TD>
											<TD>訂單別</TD>
											<TD><asp:label id="lab_producttype" runat="server"></asp:label>&nbsp;</TD>
										</tr>
										<tr>
											<td>模具名稱</td>
											<td><asp:label id="lab_productname" Runat="server"></asp:label>&nbsp;</td>
											<td>匹配設備</td>
											<td><asp:label id="lab_equipMent" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>穴數</td>
											<td><asp:label id="lab_hole" Runat="server"></asp:label>&nbsp;</td>
											<td>收縮率</td>
											<td><asp:label id="lab_extractRate" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>起始日期</td>
											<td><asp:label id="lab_startDate" Runat="server"></asp:label>&nbsp;</td>
											<TD>材質名稱</TD>
											<TD><asp:label id="lab_material" runat="server"></asp:label>&nbsp;</TD>
										</tr>
										<tr>
											<td>客戶圖號</td>
											<td><asp:label id="lab_customerModuleId" runat="server"></asp:label>&nbsp;</td>
											<td>鉗工組長</td>
											<td><asp:label id="lab_lockManager" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>公司料號</td>
											<td><asp:label id="lab_companyProductId" runat="server"></asp:label>&nbsp;</td>
											<td>有酬與否</td>
											<td><asp:label id="lab_hasprice" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>簽約金</td>
											<td><asp:label id="lab_signPrice" runat="server"></asp:label>&nbsp;</td>
											<td>試樣合格金</td>
											<td><asp:label id="lab_tryPrice" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>成品料號</td>
											<td><asp:label id="lab_ton" runat="server"></asp:label>&nbsp;</td>
											<td>設計截止日</td>
											<td><asp:label id="lab_designEndDate" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>預定交貨日(T0)</td>
											<td><asp:label id="lab_tryDate0" runat="server"></asp:label>&nbsp;</td>
											<td>T1</td>
											<td><asp:label id="lab_tryDate1" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>T2</td>
											<td><asp:label id="lab_tryDate2" runat="server"></asp:label>&nbsp;</td>
											<td>T3</td>
											<td><asp:label id="lab_T3" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>實際交貨日</td>
											<td><asp:label id="lab_tryDate3" runat="server"></asp:label>&nbsp;</td>
											<td>取試模取料日期</td>
											<td><asp:label id="lab_tryDateF" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<TD>最終圖面位置</FONT></TD>
											<TD><asp:label id="lab_Picture" runat="server"></asp:label>&nbsp;</TD>
											<td><FONT face="新細明體">項目負責人</FONT></td>
											<td><asp:label id="lab_YingYeDanDang" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>制單人</td>
											<td><asp:label id="lab_creater" runat="server"></asp:label>&nbsp;</td>
											<td>審核人</td>
											<td><asp:label id="lab_checker" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>審核日期</td>
											<td><asp:label id="lab_checkDate" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<TD>備註</TD>
											<TD colSpan="3"><asp:label id="lab_comment" runat="server" Width=""></asp:label>&nbsp;</TD>
										</tr>
									</TABLE>
									<br>
								</TD>
								<TD vAlign="top" width="40%">
									<TABLE id="tbl_pic" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<TR>
											<TD><img src="<%=imgpath %>" 
                  ></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
							<tr>
								<td colSpan="3"><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="2"
										CellPadding="2">
										<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
										<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
										<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
										<ItemStyle HorizontalAlign="Center"></ItemStyle>
										<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="PartId" HeaderText="序號"></asp:BoundColumn>
											<asp:BoundColumn DataField="Comment" HeaderText="模具編號"></asp:BoundColumn>
											<asp:BoundColumn DataField="PartNo" HeaderText="零件編號">
												<ItemStyle Width="160px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="RelationPartNo" HeaderText="電機編號"></asp:BoundColumn>
											<asp:BoundColumn DataField="PartName" HeaderText="零件名稱"></asp:BoundColumn>
											<asp:BoundColumn DataField="PartCount" SortExpression="PartCount" HeaderText="數量"></asp:BoundColumn>
											<asp:BoundColumn DataField="Process" HeaderText="工序">
												<ItemStyle HorizontalAlign="Left" BackColor="White"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
									</asp:datagrid></td>
							</tr>
						</TABLE>
					</TD>
				</TR>
				<tr>
					<td>
						<table>
							<tr>
								<td colSpan="2">顏色對照表</td>
							</tr>
							<tr>
								<td><asp:label id="lab_color" runat="server"></asp:label></td>
							</tr>
						</table>
					</td>
				</tr>
				<TR>
					<TD align="center"><input onclick="javascript:window.close();" type="button" value="關閉" name="btn_close"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
