<%@ Page language="c#" Codebehind="ViewBigScheduleList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ViewBigScheduleList" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>���ضi�׭p��</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<!--<TD vAlign="top" align="left" width="1%"></TD>
						<TD width="1%">&nbsp;</TD>-->
						<TD vAlign="top" width="92%"><A href="default.aspx">��^����</A>
							<TABLE id="Table_SetOver" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td vAlign="top">��ܼҨ�<asp:dropdownlist id="DropDownList_ModuleId" AutoPostBack="True" Runat="server"></asp:dropdownlist>
									</td>
									<td vAlign="top">�]�w�Ȥ�<asp:dropdownlist id="DropDownList_CustomerId" AutoPostBack="True" Runat="server"></asp:dropdownlist>
									</td>
								</tr>
							</TABLE>
							<BR>
							<div style="OVERFLOW-Y: scroll; FONT-SIZE: 10px; OVERFLOW-X: scroll; WIDTH: 980px; BORDER-TOP-STYLE: ridge; FONT-FAMILY: Arial; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 300px; BORDER-BOTTOM-STYLE: ridge"
								DESIGNTIMEDRAGDROP="111"><asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="1500px"
									AutoGenerateColumns="False">
									<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
									<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
									<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
									<Columns>
										<asp:BoundColumn DataField="Price" HeaderText="����"></asp:BoundColumn>
										<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
										<asp:BoundColumn Visible="False" DataField="customerid" HeaderText="customerid"></asp:BoundColumn>
										<asp:BoundColumn DataField="Customerid" HeaderText="�Ȥ�"></asp:BoundColumn>
										<asp:BoundColumn DataField="productname" HeaderText="���~�W��"></asp:BoundColumn>
										<asp:BoundColumn DataField="MATERIAL" HeaderText="����"></asp:BoundColumn>
										<asp:BoundColumn DataField="ton" HeaderText="���x" Visible=False></asp:BoundColumn>
										<asp:TemplateColumn HeaderText="���~�ܷN��">
											<ItemTemplate>
												<IMG alt="���~�ܷN��" src='<%# DataBinder.Eval(Container, "DataItem.FinishPicture") %>' width="50px" height="50px">
												</asp:Label>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:BoundColumn DataField="DesignEndDate" HeaderText="�]�p�I���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="MerchindiseEndDate" HeaderText="���ʺI���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="ProductEndDate" HeaderText="�s�@�I���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="TryDateF" HeaderText="�ռҨ��Ƥ��" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="TryDate1" HeaderText="T1" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="TryDate2" HeaderText="T2" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="T3" HeaderText="T3" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="80"></asp:BoundColumn>
										<asp:BoundColumn DataField="TryDate0" HeaderText="�w�w��f���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="TryDate3" HeaderText="��ڥ�f���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
										<asp:BoundColumn DataField="FlashCheckDate" HeaderText="�Ҩ㲾����" DataFormatString="{0:yyyy-MM-dd}" Visible=False></asp:BoundColumn>
										<asp:BoundColumn HeaderText="�[�u" Visible="False"></asp:BoundColumn>
										<asp:BoundColumn HeaderText="����" Visible="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="TryDate0" HeaderText="T0" DataFormatString="{0:MMdd}" Visible="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="TryDate1" HeaderText="T1" DataFormatString="{0:MMdd}" Visible="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="TRYDATEF" HeaderText="TF" DataFormatString="{0:MMdd}" Visible="False"></asp:BoundColumn>
									</Columns>
								</asp:datagrid></div>
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>����</B></DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
