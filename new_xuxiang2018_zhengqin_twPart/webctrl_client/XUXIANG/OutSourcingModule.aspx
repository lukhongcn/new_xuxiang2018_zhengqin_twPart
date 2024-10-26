<%@ Page language="c#" Codebehind="OutSourcingModule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourcingModule" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>外包設置</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:DataGrid id="DGOutSourcing" style="Z-INDEX: 101; LEFT: 136px; POSITION: absolute; TOP: 48px"
				runat="server" BorderWidth="1" AutoGenerateColumns="false">
				<Columns>
					<asp:BoundColumn HeaderText="模具編號" DataField="ModuleId" />
					<asp:TemplateColumn HeaderText="計劃開始時間">
						<ItemTemplate>
							<asp:TextBox ID="txtStartDate" Runat="server" Text=''></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateColumn>
					<asp:TemplateColumn HeaderText="計劃結束時間">
						<ItemTemplate>
							<asp:TextBox ID="txtStopDate" Runat="server" Text=''></asp:TextBox>
						</ItemTemplate>
					</asp:TemplateColumn>
				</Columns>
			</asp:DataGrid>
			<asp:Button id="Button1" style="Z-INDEX: 102; LEFT: 168px; POSITION: absolute; TOP: 232px" runat="server"
				Text="Button"></asp:Button>
		</form>
		<!--
		 <iframe name="framemain" src="LeftTree.aspx" width="100%" height="500" scrolling="yes" frameborder="0">
		</iframe>
		-->
	</body>
</HTML>
