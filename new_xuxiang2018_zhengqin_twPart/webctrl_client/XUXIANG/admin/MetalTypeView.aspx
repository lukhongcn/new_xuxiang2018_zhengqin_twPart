<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MetalTypeView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.MetalTypeView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�s��j���]�m</title>
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
										<div align="left">�����j���]�w<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#000660" cellSpacing="1" borderColorDark="#000066" cellPadding="0"
								width="100%" align="center" borderColorLight="#000066" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<TR>
												<TD>�j���W</TD>
												<TD><asp:textbox id="txtMetalTypeName" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>�y�z</TD>
												<TD><asp:textbox id="txtMetalTypeDescription" runat="server"></asp:textbox></TD>
											</TR>
											<TR>
												<TD>�Ƶ�</TD>
												<TD><asp:textbox id="txtMetalTypeComment" runat="server"></asp:textbox></TD>
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
							<asp:datagrid id="MetalTypeDataGrid" runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
								<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="MetalTypeId" ReadOnly="True" HeaderText="�j���s�X"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�j���W">
										<ItemTemplate>
											<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalTypeName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=txt_name runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalTypeName") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�y�z">
										<ItemTemplate>
											<asp:Label id=Label2 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalTypeDescription") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=txt_description runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalTypeDescription") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�Ƶ�">
										<ItemTemplate>
											<asp:Label id=Label3 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalTypeComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=txt_comment runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalTypeComment") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="����" EditText="�s��"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="<div onclick=&quot;javascript:return confirm('�T�w�R���ܡH')&quot;>�R��</div>" HeaderText="�ʧ@"
										CommandName="Delete"></asp:ButtonColumn>
								</Columns>
							</asp:datagrid><br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B> ���� </B>
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
