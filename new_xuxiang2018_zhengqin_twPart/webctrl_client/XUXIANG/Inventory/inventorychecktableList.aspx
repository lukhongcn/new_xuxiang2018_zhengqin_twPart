<%@ Page language="c#" Codebehind="inventorychecktableList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Inventory.inventorychecktableList" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�L�I����</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
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
										<div align="left">�L�I����<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<asp:label id="lab_tablename" Runat="server" Visible="False"></asp:label><asp:button id="btn_back" runat="server" Text="�� ��"></asp:button><asp:button ID="btn_print" Runat="server" Text="���L�d�ߵ��G"></asp:button>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td><asp:datagrid id="dg_checktable" runat="server" AllowPaging="True" PageSize="15" CellPadding="2"
											CellSpacing="2" AutoGenerateColumns="False">
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="id" HeaderText="�Ǹ�" ItemStyle-Width="40px"></asp:BoundColumn>
												<asp:BoundColumn DataField="checkDate" HeaderText="�|�p�ɶ�" ItemStyle-Width="40px"></asp:BoundColumn>
												<asp:BoundColumn DataField="productMaterialId" HeaderText="���ƽs��" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="productMaterialId" HeaderText="���ƦW��"></asp:BoundColumn>
												<asp:BoundColumn DataField="spec" HeaderText="�W�櫬��"></asp:BoundColumn>
												<asp:BoundColumn DataField="unitId" HeaderText="���"></asp:BoundColumn>
												<asp:BoundColumn DataField="startinventory" HeaderText="���쵲�s�ƶq" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="startPrice" HeaderText="���쵲�s���" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="startTotalPrice" HeaderText="���쵲�s���B" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="inInventoryCount" HeaderText="�������J�ƶq" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="inInventoryPrice" HeaderText="�������J���" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="inInventoryTotalPrice" HeaderText="�������J���B" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="outInventoryCount" HeaderText="�����o�X�ƶq" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="outInventoryPrice" HeaderText="�����o�X���" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="outInventoryTotalPrice" HeaderText="�����o�X���B" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="endinventory" HeaderText="�����ƶq" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="factcount" HeaderText="��ڼƶq" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="factcountPrice" HeaderText="�������s���" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="factcountTotalPrice" HeaderText="�������s���B" ItemStyle-Width="70px"></asp:BoundColumn>
												<asp:BoundColumn DataField="surplus" HeaderText="�l�q" ItemStyle-Width="70px"></asp:BoundColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
								</TALBE></TABLE>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>���ܫH��</B></DIV>
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
