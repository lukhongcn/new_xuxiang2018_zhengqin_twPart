<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="NewDesignView" Src="controls/newDesignView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SmallView" Src="controls/SmallView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="MidView" Src="controls/MidView.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PartUnnormal" Src="controls/PartUnnormal.ascx" %>
<%@ Register TagPrefix="uc1" TagName="DesignHoleView" Src="controls/DesignHoleView.ascx" %>
<%@ Page language="c#" Codebehind="ViewModulePartList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ViewModulePartList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具加工信息瀏覽</title>
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
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="20%">輸入關鍵字查詢</td>
									<td width="80%"><asp:textbox id="TextBox_key" Runat="server" Width="300px"></asp:textbox>&nbsp;&nbsp;<asp:button id="Button_Search" Runat="server" Text="查詢"></asp:button>
										<asp:label id="lab_key" runat="server" Visible="False"></asp:label><asp:button id="Button1" runat="server" Text="零件生產計劃及實際進度表"></asp:button><asp:label id="lab_partreport" runat="server"></asp:label></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False"
								AllowPaging="True">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProductName" HeaderText="模具名稱"></asp:BoundColumn>
									<asp:BoundColumn DataField="CustomerId" HeaderText="客戶"></asp:BoundColumn>
									<asp:BoundColumn DataField="TryDate0" HeaderText="T0" Visible="False" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:ButtonColumn Text="模具信息" HeaderText="功能" CommandName="Select"></asp:ButtonColumn>
									<asp:ButtonColumn Text="工藝設計信息" HeaderText="功能" CommandName="Design"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid>
							<TABLE id="TableView" width="100%" border="1" runat="server">
								<TR>
									<TD width="50%">當前選擇模具為<asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
									<TD width="50%"><asp:button id="Button_ViewMiddle" Runat="server" Text="工序統計信息"></asp:button>&nbsp;&nbsp;
										<asp:button id="Button_ViewSmall" Runat="server" Text="零件加工信息"></asp:button>&nbsp;&nbsp;
										<asp:button id="print" Runat="server" Text=" 打印明細 "></asp:button>
										<asp:Button id="btn_printpartno" runat="server" Text="零件工藝打印" Visible="False"></asp:Button>
										<asp:Button id="Button_PartUnnormal" Runat="server" Text="零件報廢信息" Visible="False"></asp:Button></TD>
								</TR>
							</TABLE>
							<TABLE id="TableView1" width="100%" border="1" runat="server">
								<TR>
									<TD width="50%"><asp:button id="but_Designinfo" Runat="server" Text="設計工序信息"></asp:button>&nbsp;&nbsp;
										<asp:button id="but_Designholdinfo" Runat="server" Text="設計暫停信息"></asp:button>&nbsp;&nbsp;
									</TD>
								</TR>
							</TABLE>
							<uc1:midview id="MidView" runat="server"></uc1:midview><uc1:smallview id="SmallView" runat="server"></uc1:smallview><uc1:newdesignview id="NewDesignView" runat="server"></uc1:newdesignview>
							<uc1:partunnormal id="PartUnnormal" runat="server"></uc1:partunnormal><uc1:DesignHoleView id="DesignHoleView" runat="server"></uc1:DesignHoleView><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label><asp:label id="Label_HiddenT0" runat="server" Visible="False" BackColor="Red"></asp:label></TD>
								</TR>
							</TABLE>
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
