<%@ Register TagPrefix="uc1" TagName="PartDesign" Src="controls/PartDesign.ascx" %>
<%@ Page language="c#" Codebehind="PartDesignList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartDesignList" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�Ҩ�޳N�}�o</title>
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
						<TD vAlign="top" width="79%"><uc1:partdesign id="partdesign" runat="server"></uc1:partdesign><BR>
							��ܼҨ�<asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="�Ҩ�j��"></asp:button>
							<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
								AllowPaging="True" Width="100%">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��" Visible="False"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�s�����O" Visible="False">
										<ItemTemplate>
											<asp:Label id="dg_lab_parttype1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartType1") %>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="PartNo" HeaderText="�]�p���O"></asp:BoundColumn>
									<asp:BoundColumn DataField="Material" HeaderText="����" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartCount" HeaderText="�s��ƶq" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�Ϥ�" Visible="False">
										<ItemTemplate>
											<IMG alt="�s��Ϥ�" src='<%# DataBinder.Eval(Container, "DataItem.PartPicture") %>' width="50px" height="50px">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="DesignProcess" HeaderText="�]�p���e"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�\��" Visible="False">
										<ItemTemplate>
											<a href='#' onclick='javascript:showPartInfo("<%#DataBinder.Eval(Container, "DataItem.moduleid") %>","<%#DataBinder.Eval(Container, "DataItem.PartNo") %>")'>
												�ԲӫH�� </a>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�ʧ@">
										<ItemTemplate>
											<asp:HyperLink id="HyperLink_EditProcess" runat="server" Text="�s��" NavigateUrl='<%# "milePartDesignAddEdit.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partno="+Server.UrlEncode(DataBinder.Eval(Container, "DataItem.PartNo").ToString())+"&func=edit" %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="�R��" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
							<asp:datagrid id="DetailDatagrid" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
								Width="100%">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="�u�Ƕ���" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessId" HeaderText="�]�p���e"></asp:BoundColumn>
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
							<P></P>
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
