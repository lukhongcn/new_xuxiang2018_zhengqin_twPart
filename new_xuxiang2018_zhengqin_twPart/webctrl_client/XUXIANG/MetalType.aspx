<%@ Page language="c#" Codebehind="MetalType.aspx.cs" AutoEventWireup="false" Inherits="BOM.WebForm1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>WebForm1</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form method="post" runat="server">
			<table>
				<tr>
					<td></td>
				</tr>
			</table>
			<FONT face="ËÎ·¥"></FONT>
			<TABLE id="Table1" style="Z-INDEX: 102; LEFT: 216px; WIDTH: 400px; POSITION: absolute; TOP: 56px; HEIGHT: 217px"
				cellSpacing="1" cellPadding="1" width="400" border="1">
				<TR>
					<TD style="WIDTH: 172px; HEIGHT: 23px"><STRONG><EM>MetalName:</EM></STRONG></TD>
					<TD style="HEIGHT: 23px"><asp:textbox id="txtmetalname" runat="server" Width="208px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 172px; HEIGHT: 90px"><STRONG><EM>Metal Destription:</EM></STRONG></TD>
					<TD style="HEIGHT: 90px"><asp:textbox id="txtmetaldpt" runat="server" Width="208px" TextMode="MultiLine" Height="76px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 172px"><STRONG><EM>Metal Specification:</EM></STRONG></TD>
					<TD><asp:textbox id="txtspecification" runat="server" Width="208px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 172px"><STRONG><EM>Metal Comment:</EM></STRONG></TD>
					<TD><asp:textbox id="txtmetalcomment" runat="server" Width="208px"></asp:textbox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 172px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="BTaddmetal" runat="server" Width="64px" Text="Add"></asp:button></TD>
					<TD>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<asp:button id="BTresetmetal" runat="server" Width="64px" Text="Cancel"></asp:button></TD>
				</TR>
			</TABLE>
			<asp:datagrid id="dtmetal" style="Z-INDEX: 101; LEFT: 88px; POSITION: absolute; TOP: 288px" runat="server"
				Width="672px" Height="141px" AutoGenerateColumns="False">
				<Columns>
					<asp:BoundColumn DataField="Metalid" HeaderText="MetalId"></asp:BoundColumn>
					<asp:BoundColumn DataField="Metalname" HeaderText="MetalName"></asp:BoundColumn>
					<asp:BoundColumn DataField="Metaldescription" HeaderText="Metail Destripition"></asp:BoundColumn>
					<asp:BoundColumn DataField="Metalspecification" HeaderText="Metal Specification"></asp:BoundColumn>
					<asp:BoundColumn DataField="Metalcomment" HeaderText="Metal Comment"></asp:BoundColumn>
					<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" HeaderText="Action" CancelText="Cancel"
						EditText="Edit"></asp:EditCommandColumn>
					<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('Äã¡¼¶¨ÒªÉ¾³ýÂð?')&quot;&gt;Delete&lt;/div&gt;"
						HeaderText="Action" CommandName="Delete"></asp:ButtonColumn>
				</Columns>
			</asp:datagrid>
			<FONT face="ËÎ·¥">
				<DIV style="DISPLAY: inline; Z-INDEX: 103; LEFT: 360px; WIDTH: 70px; POSITION: absolute; TOP: 24px; HEIGHT: 15px"
					ms_positioning="FlowLayout"><STRONG><EM>MetalInfo</EM></STRONG></DIV>
			</FONT>
		</form>
	</body>
</HTML>
