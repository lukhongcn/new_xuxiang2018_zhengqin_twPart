<%@ Register TagPrefix="uc1" TagName="mileElectrodeHeader" Src="controls/mileElectrodeHeader.ascx" %>
<%@ Page language="c#" Codebehind="mileElectrodeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.mileElectrodeList" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/mileElectrodeHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�q���]�w</title>
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
						<TD vAlign="top" width="79%">
							<P><uc1:mileelectrodeheader id="mileElectrodeHeader" runat="server"></uc1:mileelectrodeheader><BR>
								���<%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%><asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
								<asp:TextBox id="txt_moduleid" runat="server"></asp:TextBox>
								<asp:Label ID="lab_moduleid" Runat="server" Visible="False"></asp:Label>
								<asp:Button id="btn_search" runat="server" Text="�j��"></asp:Button>
								<br>
								<asp:label id="lab_print" Text="���L���X���" Runat="server"></asp:label><asp:textbox id="txt_print" Runat="server"></asp:textbox><asp:label id="lab_show" Text="�Ҧp:1-10" Runat="server"></asp:label><asp:button id="btn_print" Text="���L���X" Runat="server"></asp:button><asp:label id="lab_file" Runat="server"></asp:label>
								<asp:Label id="lab_pagecount" runat="server"></asp:Label>
								<br>
								<asp:label id="lab_page" runat="server" Width="70px">�C�����</asp:label><asp:textbox id="txt_mod" runat="server" AutoPostBack="True" Width="58px">10</asp:textbox><asp:dropdownlist id="dpl_page" runat="server" AutoPostBack="True"></asp:dropdownlist>
								<br>
								<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
									CellSpacing="2" CellPadding="2">
									<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
									<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
									<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
									<ItemStyle HorizontalAlign="Center"></ItemStyle>
									<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
									<Columns>
										<asp:BoundColumn DataField="idd" HeaderText="�y����"></asp:BoundColumn>
										<asp:BoundColumn DataField="Id" HeaderText="�Ǹ�"></asp:BoundColumn>
										<asp:BoundColumn DataField="ModuleId" HeaderText="�Ҩ�s��" Visible="False"></asp:BoundColumn>
										<asp:BoundColumn DataField="PartNo" HeaderText="�q���s��"></asp:BoundColumn>
										<asp:BoundColumn DataField="jiancun1" HeaderText="��q����" DataFormatString="{0:0.00}"></asp:BoundColumn>
										<asp:BoundColumn DataField="count1" HeaderText="�ƶq"></asp:BoundColumn>
										<asp:BoundColumn DataField="jiancun2" HeaderText="��q����" DataFormatString="{0:0.00}"></asp:BoundColumn>
										<asp:BoundColumn DataField="count2" HeaderText="�ƶq"></asp:BoundColumn>
										<asp:BoundColumn DataField="PartName" HeaderText="�q���W��"></asp:BoundColumn>
										<asp:BoundColumn DataField="comment" HeaderText="�`�N�I"></asp:BoundColumn>
										<asp:BoundColumn DataField="Process" HeaderText="�u��"></asp:BoundColumn>
										<asp:BoundColumn DataField="RelationPart" HeaderText="�����s��"></asp:BoundColumn>
										<asp:BoundColumn DataField="RelationprocessId" HeaderText="�����u��"></asp:BoundColumn>
										<asp:ButtonColumn Text="�ԲӫH��" HeaderText="�\��" CommandName="Detail"></asp:ButtonColumn>
										<asp:TemplateColumn>
											<ItemTemplate>
												<asp:HyperLink id=HyperLink_EditOthers runat="server" Text="�򥻫H���s��" NavigateUrl='<%#"mileElectrodeEditOthers.aspx?moduleid="+Server.UrlEncode(DataBinder.Eval(Container, "DataItem.moduleid").ToString())+"&partno="+Server.UrlEncode(DataBinder.Eval(Container, "DataItem.PartNo").ToString())+"&pagecount=" + dpl_page.SelectedValue + "&lines="+txt_mod.Text %>'>
												</asp:HyperLink>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:TemplateColumn Visible="False">
											<ItemTemplate>
												<asp:HyperLink id="HyperlinkProcess" runat="server" Text="�u�ǳ]�w�s��" NavigateUrl='<%# "mileElectrodeEditProcess.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partno="+DataBinder.Eval(Container, "DataItem.PartNo")+"&partcount="+DataBinder.Eval(Container, "DataItem.PartCount")+"&priority="+DataBinder.Eval(Container, "DataItem.Priority")+"&RelationprocessId="+DataBinder.Eval(Container, "DataItem.RelationprocessId")+"&RelationPart="+DataBinder.Eval(Container, "DataItem.RelationPart")+"" %>'>
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
							</P>
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
