<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="OrderCopy.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderCopy" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>訂單-零件工序複製</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><A href="OrderCopy.aspx?func=order">訂單複製</A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="OrderCopy.aspx?func=Part">零件複製</A>
							<asp:panel id="pan_order" Runat="server">
								<TABLE cellSpacing="1" cellPadding="1" width="100%" border="1">
									<TR>
										<TD>老訂單號：</TD>
										<TD>
											<asp:TextBox id="txt_oldOrderId" Runat="server" Text=""></asp:TextBox></TD>
										<TD>新訂單號：</TD>
										<TD>
											<asp:TextBox id="txt_newOrderId" Runat="server" Text=""></asp:TextBox>
											<asp:button id="btn_partialCopy" Runat="server" Text="選擇零件"></asp:button></TD>
										<TD>
											<asp:Button id="btn_copy" Runat="server" Text="複製"></asp:Button></TD>
									</TR>
								</TABLE>
							</asp:panel><br>
							<asp:panel id="pan_part" Runat="server">
								<TABLE cellSpacing="1" cellPadding="1" width="100%" border="1">
									<TR>
										<TD>模具編號：</TD>
										<TD>
											<asp:TextBox id="txt_oldModuleidbypart" Runat="server" Text=""></asp:TextBox></TD>
										<TD>舊零件號：</TD>
										<TD>
											<asp:TextBox id="txt_oldPartNobypart" Runat="server" Text=""></asp:TextBox></TD>
										<TD>新零件號：</TD>
										<TD>
											<asp:TextBox id="txt_newPartNobypart" Runat="server" Text=""></asp:TextBox></TD>
										<TD>
											<asp:Button id="but_partcopy" Runat="server" Text="複製"></asp:Button></TD>
									</TR>
								</TABLE>
							</asp:panel><br>
							<asp:datagrid id="MainDataGrid" runat="server" CellPadding="2" CellSpacing="2" Width="100%" AutoGenerateColumns="False"
								PageSize="15">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="選擇">
										<HeaderTemplate>
											<asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:CheckBox id="CheckBox_Select" runat="server" Checked="False"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="ModuleId">
										<HeaderTemplate>
											<asp:label id="dg_header_moduleid" runat=server Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partno">
										<HeaderTemplate>
											<asp:Label ID="dg_header_partno" Runat="server">零件編號</asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label ID="dg_lab_partno" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="partname">
										<HeaderTemplate>
											<asp:label id="dg_header_partname" runat="server">零件名稱</asp:label>
										</HeaderTemplate>
										<ItemTemplate>
											&nbsp;
											<asp:Label runat="server" ID="dg_lab_partname" Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="comment">
										<HeaderTemplate>
											<asp:label id="dg_header_comment" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["CommentShow"]%>'/></asp:label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label ID="dg_lab_comment" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Comment") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="False" HeaderText="process">
										<HeaderTemplate>
											<asp:label id="dg_header_process" runat="server">工序</asp:label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label ID="dg_lab_process" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Process") %>'>
											</asp:Label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="Material" HeaderText="材質"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartCount" HeaderText="零件數量"></asp:BoundColumn>
								</Columns>
								<PagerStyle PageButtonCount="20" Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
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
