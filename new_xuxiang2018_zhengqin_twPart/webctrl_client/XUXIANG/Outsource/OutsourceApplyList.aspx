<%@ Page language="c#" Codebehind="OutsourceApplyList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.Outsource.OutsourceApplyList" %>
<%@ Register TagPrefix="esshs" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OutSourceApplyHeader" Src="control/OutSourceApplyHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�~�]�ӽк޲z</title>
		<LINK href="../css/common.css" rel="stylesheet">
			<script language="javascript" src="../js/lib.js"></script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" name="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
					<TD width="1%">&nbsp;</TD>
					<TD vAlign="top" width="79%">
						<TABLE cellSpacing="2" width="100%" border="0">
							<TR>
								<TD>
									<DIV align="left"><uc1:outsourceapplyheader id="OutSourceApplyHeader" runat="server"></uc1:outsourceapplyheader></DIV>
								</TD>
							</TR>
						</TABLE>
						<HR>
						<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
							width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
							<TR>
								<TD>
									<TABLE width="100%" align="center" border="0">
										<TR>
											<TD>�Ȥ�</TD>
											<TD><asp:dropdownlist id="dpl_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
											<td>�Ҩ�s��:</td>
											<td><asp:textbox id="txt_moduleid" runat="server"></asp:textbox><asp:button id="btn_search" runat="server" Text="�j��"></asp:button></td>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<BR>
						<asp:datagrid id="dg_sourceapply" runat="server" AllowCustomPaging="True" AllowPaging="True" AutoGenerateColumns="False">
							<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
							<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
							<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
							<ItemStyle HorizontalAlign="Center"></ItemStyle>
							<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn Visible="False" DataField="Id" ReadOnly="True" HeaderText="�s��"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="�Ҩ�s�X">
									<ItemTemplate>
										<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'/>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:DropDownList ID="dg_dpl_module" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="dg_dpl_module_changed" />
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="�s��">
									<ItemTemplate>
										<asp:Label id="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>'/>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:DropDownList ID="dg_dpl_partno" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="dg_dpl_partno_changed"></asp:DropDownList>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="Processid" ReadOnly="True" HeaderText="�u��"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="�s��ƶq">
									<ItemTemplate>
										<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Partnum") %>'/>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id="dg_txt_partnum" Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Partnum") %>'/>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="�Ƶ�">
									<ItemTemplate>
										<asp:Label id="Label8" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment") %>'/>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id="dg_txt_comment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment") %>'/>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn>
									<ItemTemplate>
										<a href='#' onclick='javascript:showOutSourceInfo("<%#DataBinder.Eval(Container, "DataItem.id") %>")'>
											�ԲӫH��</a>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="�ʧ@">
									<ItemTemplate>
										<asp:HyperLink id=HyperLink_Edit runat="server" Text="�s��" NavigateUrl='<%# "OutsourceApplyView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.id") %>'>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="�ʧ@">
									<ItemTemplate>
										<asp:HyperLink id="Hyperlink1" runat="server" Text="����ʳ�" NavigateUrl='<%# "OutsourceApplyDetailView.aspx?id="+DataBinder.Eval(Container, "DataItem.id") %>'>
										</asp:HyperLink>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�w�R���ܡH')&quot;&gt;�R��&lt;/div&gt;"
									HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
							</Columns>
							<PagerStyle Mode="NumericPages"></PagerStyle>
						</asp:datagrid>
						<HR color="#ccccff">
						<BR>
						<TABLE borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
							border="1">
							<TR vAlign="middle">
								<TD width="15%" height="28">
									<DIV align="center"><B>����
											<DIV align="center"><B></B></DIV>
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
			</TABLE>
			</FONT>
			<P></P>
		</form>
	</body>
</HTML>
