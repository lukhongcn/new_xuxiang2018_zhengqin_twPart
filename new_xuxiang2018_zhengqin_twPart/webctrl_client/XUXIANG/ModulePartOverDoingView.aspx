<%@ Page language="c#" Codebehind="ModulePartOverDoingView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModulePartOverDoingView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>正在超時加工的零件瀏覽</title>
		<LINK href="css/common.css" rel="stylesheet">
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
							<table id="table" cellPadding="2" width="100%" border="1">
								<tr>
									<td>選擇工序<asp:dropdownlist id="DropDownList_Process" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td>選擇狀態<asp:dropdownlist id="DropDownList_Status" runat="server" AutoPostBack="True"></asp:dropdownlist>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<asp:button ID="btn_print" runat="server" Text="打印"></asp:button></td>
								</tr>
							</table>
							<BR>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2" AllowPaging="True" PageSize="20">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="moduleid" HeaderText="工令單號"></asp:BoundColumn>
									<asp:BoundColumn DataField="partno" HeaderText="零件編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件ID編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="Process" HeaderText="工序"></asp:BoundColumn>
									<asp:BoundColumn DataField="Status" HeaderText="狀態"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedHours" HeaderText="計劃工時" DataFormatString="{0:0.0}"></asp:BoundColumn>
									<asp:BoundColumn DataField="DoneHours" HeaderText="完成工時" DataFormatString="{0:0.0}"></asp:BoundColumn>
									<asp:BoundColumn DataField="TryDate0" HeaderText="T0" Visible="False" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="TryDate1" HeaderText="T1" Visible="False" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>提示</B></DIV>
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
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
