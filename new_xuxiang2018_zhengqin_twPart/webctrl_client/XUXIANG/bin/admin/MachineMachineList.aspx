<%@ Page language="c#" Codebehind="MachineMachineList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MachineMachineList" %>
<%@ Register TagPrefix="uc1" TagName="MachineHeader" Src="controls/MachineHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>機台設定</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:machineheader id="MachineHeader" runat="server"></uc1:machineheader><BR>
							<table id="TableCondition" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TR>
									<TD>選擇工序<asp:dropdownlist id="DropDownList_Process" Runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
								</TR>
							</table>
							<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%" CellSpacing="2"
								CellPadding="2" AllowPaging="True">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="機台編號">
										<ItemTemplate>
											<asp:Label id=Label1 runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>'>
											</asp:Label>
											<asp:label id="Label_Hiddengroupid" runat="server" ForeColor="Red" Visible="False" Text='<%# DataBinder.Eval(Container, "DataItem.Groupid")%>'>
											</asp:label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id=dg_txt_module runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>' ReadOnly=True>
											</asp:TextBox>
											<asp:label id="Label_Hiddengroupid1" runat="server" ForeColor="Red" Visible="False" Text='<%# DataBinder.Eval(Container, "DataItem.Groupid")%>'>
											</asp:label>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="描述">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.description") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_description" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.description") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="工作組">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label_Group" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Groupname") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:DropDownList id="dpl_groupname" runat="server"></asp:DropDownList>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="價格">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="dg_lab_price" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Price") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="dg_txt_price" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Price") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="工作時間(小時)">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label3" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MaxPerday") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:TextBox id="DropDownList_HoursPerDay" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MaxPerday") %>'>
											</asp:TextBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="優先級">
										<ItemTemplate>
											&nbsp;
											<asp:Label id="Label4" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.priority") %>'>
											</asp:Label>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:dropdownlist id="Dropdownlist_Priority" runat="server">
												<asp:ListItem Value="20">20</asp:ListItem>
												<asp:ListItem Value="19">19</asp:ListItem>
												<asp:ListItem Value="18">18</asp:ListItem>
												<asp:ListItem Value="17">17</asp:ListItem>
												<asp:ListItem Value="16">16</asp:ListItem>
												<asp:ListItem Value="15">15</asp:ListItem>
												<asp:ListItem Value="14">14</asp:ListItem>
												<asp:ListItem Value="13">13</asp:ListItem>
												<asp:ListItem Value="12">12</asp:ListItem>
												<asp:ListItem Value="11">11</asp:ListItem>
												<asp:ListItem Value="10">10</asp:ListItem>
												<asp:ListItem Value="9">09</asp:ListItem>
												<asp:ListItem Value="8">08</asp:ListItem>
												<asp:ListItem Value="7">07</asp:ListItem>
												<asp:ListItem Value="6">06</asp:ListItem>
												<asp:ListItem Value="5">05</asp:ListItem>
												<asp:ListItem Value="4">04</asp:ListItem>
												<asp:ListItem Value="3">03</asp:ListItem>
												<asp:ListItem Value="2">02</asp:ListItem>
												<asp:ListItem Value="1">01</asp:ListItem>
											</asp:dropdownlist>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" HeaderText="動作" CancelText="取消" EditText="編輯"></asp:EditCommandColumn>
									<asp:ButtonColumn Text="刪除" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
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
