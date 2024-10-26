<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="GroupGetStation.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.GroupGetStation" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>批量刷條碼</title>
		<LINK href="css/common.css" rel="stylesheet">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function getFocus()
			{
				document.Form1.txt_partCount.focus();
			}
		</script>
	</HEAD>
	<body topMargin="0" onload="getFocus()">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" width="79%">
							<table cellSpacing="2" width="100%" border="0">
								<tr>
									<td>
										<div align="left">批量報工管理<asp:label id="Label_StatusMsg" runat="server"></asp:label></div>
									</td>
								</tr>
							</table>
							<hr>
							<table width="100%" align="center" border="0">
								<tr>
									<td><asp:label id="Label1" runat="server" text="條碼刷入"></asp:label></td>
									<td vAlign="top" colSpan="5">&nbsp; <INPUT id="txt_partCount" type="text" name="txt_partCount" runat="server">
										<asp:label id="lab_hiddenActionId" runat="server" Visible="False">Label</asp:label><asp:label id="lab_repeate" runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenModuleId" runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenPartNo" runat="server" Visible="False"></asp:label>
										<asp:Label id="lab_partno" runat="server" Visible="False"></asp:Label></td>
									<td colSpan="3"><asp:label id="lab_hiddennumvalue" runat="server" Visible="False"></asp:label><asp:button id="btn_submit" runat="server" Text="提 交"></asp:button><asp:label id="lab_hiddenprocess" runat="server" Visible="False"></asp:label><asp:button id="Button1" runat="server" Text="清空"></asp:button><asp:label id="lab_hidden_machine" runat="server"></asp:label><asp:label id="lab_parnohidden" runat="server" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td><asp:dropdownlist id="drp_processlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td><asp:label id="lab_user" runat="server" Text="操作者"></asp:label></td>
									<td><asp:label id="lab_user_value" runat="server" Visible="False"></asp:label>
										<asp:Label id="lab_username" runat="server"></asp:Label></td>
									<td><asp:label id="lab_action" runat="server" Text="操作"></asp:label></td>
									<td><asp:label id="lab_actionvalue" runat="server"></asp:label></td>
									<td><asp:label id="lab_machine" runat="server" Text="機台編號"></asp:label></td>
									<td><asp:label id="lab_machine_value" runat="server"></asp:label></td>
								</tr>
							</table>
							<br>
							<asp:label id="lab_totalcount" runat="server"></asp:label><asp:datagrid id="MainDatagrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="選擇">
										<HeaderTemplate>
											<asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"
												Checked="true"></asp:CheckBox>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:CheckBox id="CheckBox_Select" runat="server" Checked="true"></asp:CheckBox>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="dg_header_moduleid" runat="server" Text='模具編號' />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:label ID="dg_lab_moduleid" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.Moduleid") %>'>
											</asp:label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件號"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="工序編號"></asp:BoundColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label2" runat="server" Text='開始日期' />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:label ID="dg_lab_StartCount" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.FactStartDate") %>'>
											</asp:label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn Visible="False">
										<HeaderTemplate>
											<asp:Label id="Label3" runat="server" Text='' />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:label ID="dg_lab_processno" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.ProcessNo") %>'>
											</asp:label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label4" runat="server" Text='暫停時間' />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:label ID="dg_lab_HoldOnCount" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.holdontimes") %>'>
											</asp:label>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<HeaderTemplate>
											<asp:Label id="Label6" runat="server" Text='完成日期' />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:label ID="dg_lab_FactFinishedCount" Runat=server Text='<%# DataBinder.Eval(Container, "DataItem.FactEndDate") %>'>
											</asp:label>
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
							</asp:datagrid><br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
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
