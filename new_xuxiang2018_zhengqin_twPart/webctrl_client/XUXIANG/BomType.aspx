<%@ Page language="c#" Codebehind="BomType.aspx.cs" AutoEventWireup="false" Inherits="BOM.BomType" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<table style="Z-INDEX: 101; LEFT: 64px; POSITION: absolute; TOP: 0px">
			<tr>
				<td>
					<form id="Form1" method="post" runat="server">
						<TABLE id="Table1" style="Z-INDEX: 101; LEFT: 136px; POSITION: absolute; TOP: 72px" cellSpacing="1"
							cellPadding="1" width="300" border="1">
							<TR>
								<TD style="WIDTH: 170px"><FONT face="ËÎ·¥">BomTypeFlag</FONT></TD>
								<TD>
									<asp:TextBox id="txtBomTypeFlag" runat="server"></asp:TextBox></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 170px"><FONT face="ËÎ·¥">BomTypeDescription</FONT></TD>
								<TD>
									<asp:TextBox id="txtBomTypeDescription" runat="server"></asp:TextBox></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 168px"><FONT face="ËÎ·¥">BomTypeComment</FONT></TD>
								<TD>
									<asp:TextBox id="txtBomTypeComment" runat="server"></asp:TextBox></TD>
							</TR>
							<TR>
								<TD style="WIDTH: 168px" align="center" colSpan="2"><FONT face="ËÎ·¥">
										<asp:Button id="Button_AddEdit" runat="server" Text="Add" Width="45px"></asp:Button></FONT></TD>
								<FONT face="ËÎ·¥"></FONT>
							</TR>
						</TABLE>
						<asp:Label id="Title" style="Z-INDEX: 102; LEFT: 264px; POSITION: absolute; TOP: 24px" runat="server">BomType</asp:Label>
						<asp:DataGrid id="BomTypeDataGrid" style="Z-INDEX: 103; LEFT: 56px; POSITION: absolute; TOP: 224px"
							runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
							<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
							<Columns>
								<asp:BoundColumn DataField="BomTypeId" ReadOnly="True" HeaderText="BomTypeId"></asp:BoundColumn>
								<asp:TemplateColumn HeaderText="BomTypeFlag">
									<ItemTemplate>
										<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeFlag") %>'>
										</asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox id=txteditBTFlag runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeFlag") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="BomTypeDescription">
									<ItemTemplate>
										<asp:Label id=Label2 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeDescription") %>'>
										</asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox id=txteditBTD runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeDescription") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="BomTypeComment">
									<ItemTemplate>
										<asp:Label id=Label3 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeComment") %>'>
										</asp:Label>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:TextBox id=txteditBTC runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BomTypeComment") %>'>
										</asp:TextBox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" HeaderText="Action" CancelText="Cancel"
									EditText="Edit"></asp:EditCommandColumn>
								<asp:ButtonColumn Text="&lt;div onclick=&quot;JavaScript:return confirm('Äã¡¼¶¨É¾³ýÂð')&quot;&gt;É¾³ý&lt;/div&gt;"
									HeaderText="Action" CommandName="Delete"></asp:ButtonColumn>
							</Columns>
						</asp:DataGrid>
					</form>
				</td>
			</tr>
		</table>
		<table style="Z-INDEX: 101; LEFT: 100px; POSITION: absolute; TOP: 400px" borderColor="#000660"
			borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066" border="1">
			<tr>
				<TD class="msg" width="85%">&nbsp;&nbsp;
					<asp:label id="Label_Message" runat="server" Visible="False">É¾³ý´íÎó</asp:label></TD>
			</tr>
		</table>
	</body>
</HTML>
