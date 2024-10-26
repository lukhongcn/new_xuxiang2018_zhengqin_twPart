<%@ Register TagPrefix="uc1" TagName="PartHeader" Src="controls/PartHeader.ascx" %>
<%@ Page language="c#" Codebehind="PartList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartList" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�s��]�w</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:partheader id="PartHeader" runat="server"></uc1:partheader><BR>
							��ܼҨ�<asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="�Ҩ�j��"></asp:button><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
								CellSpacing="2" CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo" HeaderText="�s��s��"></asp:BoundColumn>
									<asp:BoundColumn DataField="Material" HeaderText="����"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartCount" HeaderText="�s��ƶq"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartName" HeaderText="�s��W��"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�s��j��">
										<ItemTemplate>
											<asp:Label id="dg_lab_parttype1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartType1") %>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�s��p��">
										<ItemTemplate>
											<asp:Label id="dg_lab_parttype2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartType2") %>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�Ϥ�">
										<ItemTemplate>
											<IMG alt="�s��Ϥ�" src='<%# DataBinder.Eval(Container, "DataItem.PartPicture") %>' width="50px" height="50px">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="Process" HeaderText="�u��"></asp:BoundColumn>
									<asp:BoundColumn DataField="priorityname" HeaderText="����"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�\��">
										<ItemTemplate>
											<a href='#' onclick='javascript:showPartInfo("<%#DataBinder.Eval(Container, "DataItem.moduleid") %>","<%#DataBinder.Eval(Container, "DataItem.PartNo") %>")'>
												�ԲӫH�� </a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_EditOthers runat="server" Text="�򥻫H���s��" NavigateUrl='<%# "PartEditOthers.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partno="+DataBinder.Eval(Container, "DataItem.PartNo") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="False">
										<ItemTemplate>
											<asp:HyperLink id="HyperLink_EditProcess" runat="server" Text="�u�ǳ]�w�s��" NavigateUrl='<%# "PartEditProcess.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partno="+DataBinder.Eval(Container, "DataItem.PartNo")+"&partcount="+DataBinder.Eval(Container, "DataItem.PartCount")+"&priority="+DataBinder.Eval(Container, "DataItem.Priority") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="�R��" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
							<asp:datagrid id="DetailDatagrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="�u�Ƕ���"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessId" HeaderText="�u��"></asp:BoundColumn>
									<asp:BoundColumn DataField="startdate" HeaderText="�}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="enddate" HeaderText="�������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�u��"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>����</B></DIV>
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
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>