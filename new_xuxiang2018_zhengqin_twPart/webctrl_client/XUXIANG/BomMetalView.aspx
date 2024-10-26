<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="BomMetalView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomMetalView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>BOM�]�m </title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="4"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">�Ҩ�s��]�m</div>
									</td>
								</tr>
							</table>
							<hr>
							<table>
								<TR>
									<TD>�Ȥ�</TD>
									<TD><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
									<TD>�Ҩ�</TD>
									<TD><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox_ModuleList"
											ErrorMessage="�п�ܦ��Ī��Ҩ�s��"></asp:requiredfieldvalidator></TD>
								</TR>
							</table>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td>
										<table width="100%" align="center" border="0">
											<TR>
												<TD>�W��</TD>
												<td><asp:dropdownlist id="dpl_metalname" runat="server"></asp:dropdownlist></td>
												<TD>�W��</TD>
												<TD><asp:textbox id="txt_specification" runat="server" ></asp:textbox></TD>
											</TR>
											<tr>
												<TD>�ƶq</TD>
												<td><asp:textbox id="txt_quantity" runat="server"></asp:textbox><asp:rangevalidator id="RangeValidator1" runat="server" ControlToValidate="txt_quantity" ErrorMessage="�п�J�Ʀr"
														Type="Integer" MinimumValue="0" MaximumValue="5000"></asp:rangevalidator></td>
												<TD>�Ƶ�</TD>
												<TD><asp:textbox id="txt_comment" runat="server"></asp:textbox></TD>
												<TD>����</TD>
												<TD><asp:textbox id="txt_version" runat="server"></asp:textbox></TD>
											</tr>
										</table>
										<table cellSpacing="2" width="100%" border="0">
											<TR>
												<TD colSpan="2"><asp:button id="BTaddmetal" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<asp:datagrid id="dgbommetal" runat="server" AutoGenerateColumns="False">
								<Columns>
									<asp:BoundColumn DataField="BomMetalId" ReadOnly="True" HeaderText="�s��"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="������W��">
										<ItemTemplate>
											<asp:Label id="Label7" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalName") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:dropdownlist id="dg_dpl_metalname" runat="server"></asp:dropdownlist>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�W��">
										<ItemTemplate>
											<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalSpecification") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_specification"  Width=80 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalSpecification") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�ƶq">
										<ItemTemplate>
											<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalQuantity") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_quantity"  Width=40 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalQuantity") %>'/>
											<asp:RangeValidator id="Rangevalidator2" runat="server" ErrorMessage="pls input number" Type="Integer"
												ControlToValidate="dg_txt_quantity" MinimumValue="0" MaximumValue="5000" />
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="�Ƶ�">
										<ItemTemplate>
											<asp:Label id="Label5" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_comment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalComment") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="����">
										<ItemTemplate>
											<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalVersion") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_version" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MetalVersion") %>'/>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" CancelText="����" EditText="�s��"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�w�R���ܡH')&quot;&gt;�R��&lt;/div&gt;"
										HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
							</asp:datagrid>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
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
