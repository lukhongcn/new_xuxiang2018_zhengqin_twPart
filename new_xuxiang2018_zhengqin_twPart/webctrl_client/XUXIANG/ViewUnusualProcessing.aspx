<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="ViewUnusualProcessing.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ViewUnusualProcessing" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�[�u�u�ǲ��`�C��</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form2" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="0"
								CellPadding="0">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="�s��s��ID"></asp:BoundColumn>
									<asp:BoundColumn DataField="processorder" HeaderText="�u�Ǹ�"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="���A">
										<ItemTemplate>
											<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusDesc") %>' ID="Label1">
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="StartDate" HeaderText="�}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="EndDate" HeaderText="�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactStartDate" HeaderText="��ڶ}�l���" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="FactEndDate" HeaderText="��ڵ������" DataFormatString="{0:yyyy-MM-dd HH:mm}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�Ƶ{�u��"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="StatusColor" HeaderText="color"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="Statusid" HeaderText="statusid"></asp:BoundColumn>
									<asp:BoundColumn Visible="False" DataField="HoursPerDay" HeaderText="HoursPerDay"></asp:BoundColumn>
								</Columns>
							</asp:datagrid>
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
