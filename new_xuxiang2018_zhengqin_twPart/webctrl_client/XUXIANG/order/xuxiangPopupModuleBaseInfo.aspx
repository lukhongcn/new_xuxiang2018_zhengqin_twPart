<%@ Page language="c#" Codebehind="xuxiangPopupModuleBaseInfo.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangPopupOrderBaseInfo" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<TITLE>�Ҩ�򥻫H��</TITLE>
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
					<TD class="mainTitle" align="center">�Ҩ�򥻫H��</TD>
				</TR>
				<TR>
					<TD>
						<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
							<TR>
								<TD vAlign="top">
									<TABLE id="tbl_info" cellSpacing="0" cellPadding="0" width="100%" border="1">
										<tr>
											<td>������</td>
											<td><asp:label id="lab_referencePictureDate" runat="server"></asp:label>&nbsp;</td>
											<TD>�Ȥ�W��</TD>
											<TD><asp:label id="lab_customerid" runat="server"></asp:label>&nbsp;</TD>
										</tr>
										<TR>
											<td>�u�O�渹</td>
											<td><asp:label id="lab_isPart" Runat="server"></asp:label>&nbsp;<asp:label id="lab_moduleid" runat="server"></asp:label></td>
											<td>���p����</td>
											<td><asp:label id="lab_price" runat="server"></asp:label>&nbsp;</td>
										</TR>
										<tr>
											<TD>�Ҩ㪬�A</TD>
											<TD><asp:label id="lab_status" runat="server"></asp:label>&nbsp;</TD>
											<TD>�q��O</TD>
											<TD><asp:label id="lab_producttype" runat="server"></asp:label>&nbsp;</TD>
										</tr>
										<tr>
											<td>�Ҩ�W��</td>
											<td><asp:label id="lab_productname" Runat="server"></asp:label>&nbsp;</td>
											<td>�ǰt�]��</td>
											<td><asp:label id="lab_equipMent" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>�޼�</td>
											<td><asp:label id="lab_hole" Runat="server"></asp:label>&nbsp;</td>
											<td>���Y�v</td>
											<td><asp:label id="lab_extractRate" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>�_�l���</td>
											<td><asp:label id="lab_startDate" Runat="server"></asp:label>&nbsp;</td>
											<TD>����W��</TD>
											<TD><asp:label id="lab_material" runat="server"></asp:label>&nbsp;</TD>
										</tr>
										<tr>
											<td>�Ȥ�ϸ�</td>
											<td><asp:label id="lab_customerModuleId" runat="server"></asp:label>&nbsp;</td>
											<td>�X�u�ժ�</td>
											<td><asp:label id="lab_lockManager" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>���q�Ƹ�</td>
											<td><asp:label id="lab_companyProductId" runat="server"></asp:label>&nbsp;</td>
											<td>���S�P�_</td>
											<td><asp:label id="lab_hasprice" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>ñ����</td>
											<td><asp:label id="lab_signPrice" runat="server"></asp:label>&nbsp;</td>
											<td>�ռ˦X���</td>
											<td><asp:label id="lab_tryPrice" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>���~�Ƹ�</td>
											<td><asp:label id="lab_ton" runat="server"></asp:label>&nbsp;</td>
											<td>�]�p�I���</td>
											<td><asp:label id="lab_designEndDate" Runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>�w�w��f��(T0)</td>
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
											<td>��ڥ�f��</td>
											<td><asp:label id="lab_tryDate3" runat="server"></asp:label>&nbsp;</td>
											<td>���ռҨ��Ƥ��</td>
											<td><asp:label id="lab_tryDateF" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<TD>�̲׹ϭ���m</FONT></TD>
											<TD><asp:label id="lab_Picture" runat="server"></asp:label>&nbsp;</TD>
											<td><FONT face="�s�ө���">���حt�d�H</FONT></td>
											<td><asp:label id="lab_YingYeDanDang" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>���H</td>
											<td><asp:label id="lab_creater" runat="server"></asp:label>&nbsp;</td>
											<td>�f�֤H</td>
											<td><asp:label id="lab_checker" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<td>�f�֤��</td>
											<td><asp:label id="lab_checkDate" runat="server"></asp:label>&nbsp;</td>
										</tr>
										<tr>
											<TD>�Ƶ�</TD>
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
											<asp:BoundColumn DataField="PartId" HeaderText="�Ǹ�"></asp:BoundColumn>
											<asp:BoundColumn DataField="Comment" HeaderText="�Ҩ�s��"></asp:BoundColumn>
											<asp:BoundColumn DataField="PartNo" HeaderText="�s��s��">
												<ItemStyle Width="160px"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="RelationPartNo" HeaderText="�q���s��"></asp:BoundColumn>
											<asp:BoundColumn DataField="PartName" HeaderText="�s��W��"></asp:BoundColumn>
											<asp:BoundColumn DataField="PartCount" SortExpression="PartCount" HeaderText="�ƶq"></asp:BoundColumn>
											<asp:BoundColumn DataField="Process" HeaderText="�u��">
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
								<td colSpan="2">�C���Ӫ�</td>
							</tr>
							<tr>
								<td><asp:label id="lab_color" runat="server"></asp:label></td>
							</tr>
						</table>
					</td>
				</tr>
				<TR>
					<TD align="center"><input onclick="javascript:window.close();" type="button" value="����" name="btn_close"></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
