<%@ Page language="c#" Codebehind="SelectPartSearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.SelectPartSearch" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>SelectPartSearch</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function returnVal()
			{
				window.opener.document.forms['Form1'].txt_RelationPart.value = '<% = partno %>';
				window.opener.document.forms['Form1'].txt_RelationProcessno.value = '<% = processId %>';	
				window.opener.document.forms['Form1'].txt_relationpartno.value = '<% = processno %>';	
				window.close();
			}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="新細明體">
				<asp:datagrid id="MainDataGrid" style="Z-INDEX: 101; LEFT: 8px; POSITION: absolute; TOP: 48px"
					runat="server" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False" AllowPaging="True"
					Width="100%">
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
						<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號" Visible="False"></asp:BoundColumn>
						<asp:TemplateColumn HeaderText="partNo">
							<HeaderTemplate>
								<asp:Label id="Label2" runat="server" text="零件編號"></asp:Label>
							</HeaderTemplate>
							<ItemTemplate>
								&nbsp;
								<asp:Label id="dg_lab_PartNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>'/>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="partNo">
							<HeaderTemplate>
								<asp:Label id="Label1" runat="server" text="工序"></asp:Label>
							</HeaderTemplate>
							<ItemTemplate>
								&nbsp;
								<asp:Label id="dg_lab_Process" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'/>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="processno" Visible="true">
							<HeaderTemplate>
								<asp:Label id="Label3" runat="server" text=""></asp:Label>
							</HeaderTemplate>
							<ItemTemplate>
								&nbsp;
								<asp:Label id="dg_lab_processno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessNo")%>'/>
							</ItemTemplate>
						</asp:TemplateColumn>
						<asp:TemplateColumn HeaderText="processid" Visible="true">
							<HeaderTemplate>
								<asp:Label id="Label4" runat="server" text=""></asp:Label>
							</HeaderTemplate>
							<ItemTemplate>
								&nbsp;
								<asp:Label id="dg_lab_ProcessId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'/>
							</ItemTemplate>
						</asp:TemplateColumn>
					</Columns>
					<PagerStyle Mode="NumericPages"></PagerStyle>
				</asp:datagrid><asp:label id="lab_partno" Visible="False" Runat="server"></asp:label><asp:Label ID="lab_RelationPart" Visible="False" Runat="server"></asp:Label><asp:button id="but_select" runat="server" Text="提交"></asp:button></FONT>
			<%=closeWind%>
		</form>
	</body>
</HTML>
