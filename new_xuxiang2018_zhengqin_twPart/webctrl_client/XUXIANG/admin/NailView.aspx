<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="NailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.NailView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>���w���]�m</title>
		<LINK href="../css/common.css" rel="stylesheet">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
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
										<div align="left">���w���]�w<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<TR>
												<TD>���w�����W</TD>
												<TD><asp:textbox id="txt_nailname" runat="server"></asp:textbox><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txt_nailname" ErrorMessage="������J�W�r"></asp:requiredfieldvalidator></TD>
											</TR>
											<TR>
												<TD>ERP�s�X</TD>
												<TD><asp:textbox id="txt_erpid" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>�Ƶ�</TD>
												<TD><asp:textbox id="txt_nailcomment" runat="server"></asp:textbox></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<table cellSpacing="2" width="100%" border="0">
								<TR>
									<TD colSpan="2"><asp:button id="Button_AddEdit" runat="server" Text="�s�W"></asp:button></TD>
								</TR>
							</table>
							<br>
							<asp:datagrid id="dg_nail" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
								<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="NailId" ReadOnly="True" HeaderText="���w���s�X"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="���w���W">
										<ItemTemplate>
											<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.NailName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=dg_txt_name runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.NailName") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="ERP�s�X">
										<ItemTemplate>
											<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ErpId") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_erpid" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ErpId") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�Ƶ�">
										<ItemTemplate>
											<asp:Label id=Label3 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.NailComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=dg_txt_comment runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.NailComment") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="����" EditText="�s��"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�w�R���ܡH')&quot;&gt;�R��&lt;/div&gt;"
										HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
							</asp:datagrid><br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
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
