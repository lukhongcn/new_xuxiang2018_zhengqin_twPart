<%@ Page language="c#" Codebehind="BomType.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomType" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>ã]¡¼¡¼ºN¡¼¦î</title>
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
							<table width="100%" border="0" cellspacing="2">
								<tr>
									<td>
										<div align="left">ã]¡¼¡¼ºN¡¼¡~<asp:Label id="Label_StatusMsg" runat="server"></asp:Label></div>
									</td>
								</tr>
							</table>
							<hr>
							<TABLE id="Table1" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1" runat="server" cellspacing="1" cellpadding="0">
								<tr>
									<td>
										<table border="0" width="100%" align="center">
											<TR>
												<TD>§÷¡¼¡¼¡¼¤~</TD>
												<TD><asp:TextBox id="txtBomTypeFlag" runat="server"></asp:TextBox></TD>
											</TR>
											<TR>
												<TD>ê¦òv</TD>
												<TD><asp:TextBox id="txtBomTypeDescription" runat="server"></asp:TextBox></TD>
											</TR>
											<TR>
												<TD>¯R·ü</TD>
												<TD><asp:TextBox id="txtBomTypeComment" runat="server"></asp:TextBox></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<table width="100%" border="0" cellspacing="2">
								<TR>
									<TD colspan="2"><asp:Button id="Button_AddEdit" runat="server" Text="¡¼´²"></asp:Button></TD>
								</TR>
							</table>
							<br>
							<asp:DataGrid id="BomTypeDataGrid" runat="server" AutoGenerateColumns="False" CellSpacing="2"
								CellPadding="2">
								<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="BomTypeId" ReadOnly="True" HeaderText="¡¼ºNÚñÚò"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="¡¼ºN¡¼¡¼¤~">
										<ItemTemplate>
											<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeFlag") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=txteditBTFlag runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeFlag") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="¡¼¼K">
										<ItemTemplate>
											<asp:Label id=Label2 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeDescription") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=txteditBTD runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeDescription") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="¯R·ü">
										<ItemTemplate>
											<asp:Label id=Label3 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeComment") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=txteditBTC runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeComment") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="¡¼¡¼" HeaderText="¯¹¡¼" CancelText="¡¼¡¼"
										EditText="Úñ¯ã"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="¡¼®J" HeaderText="¯¹¡¼" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
							</asp:DataGrid>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>Å÷¡¼</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ></asp:label></TD>
								</TR>
							</table>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
