<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/ElectrodeHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="ElectrodeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ElectrodeList" %>
<%@ Register TagPrefix="uc1" TagName="ElectrodeHeader" Src="controls/ElectrodeHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>電極設定</title>
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
						<TD vAlign="top" width="79%"><uc1:electrodeheader id="ElectrodeHeader" runat="server"></uc1:electrodeheader><BR>
							選擇模具<asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True"></asp:dropdownlist>
							<asp:TextBox id="txt_moduleid" runat="server"></asp:TextBox>
							<asp:Button id="btn_search" runat="server" Text="搜索"></asp:Button>
							<asp:datagrid id="MainDataGrid" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False"
								CellSpacing="2" CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ModuleId" HeaderText="模具編號" Visible="False"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartNo" HeaderText="電極編號"></asp:BoundColumn>
									<asp:BoundColumn DataField="jiancun1" HeaderText="放電間隙" DataFormatString="{0:0.00}"></asp:BoundColumn>
									<asp:BoundColumn DataField="count1" HeaderText="數量"></asp:BoundColumn>
									<asp:BoundColumn DataField="jiancun2" HeaderText="放電間隙" DataFormatString="{0:0.00}"></asp:BoundColumn>
									<asp:BoundColumn DataField="count2" HeaderText="數量"></asp:BoundColumn>
									<asp:BoundColumn DataField="PartName" HeaderText="零件名稱"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="零件大類">
										<ItemTemplate>
											<asp:Label id="dg_lab_parttype1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartType1") %>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn HeaderText="零件小類">
										<ItemTemplate>
											<asp:Label id="dg_lab_parttype2" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartType2") %>'/>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="comment" HeaderText="注意點"></asp:BoundColumn>
									<asp:BoundColumn DataField="Process" HeaderText="工序"></asp:BoundColumn>
									<asp:BoundColumn DataField="priorityname" HeaderText="等級"></asp:BoundColumn>
									<asp:BoundColumn DataField="RelationPart" HeaderText="相關零件"></asp:BoundColumn>
									<asp:BoundColumn DataField="RelationprocessId" HeaderText="相關工序"></asp:BoundColumn>
									<asp:ButtonColumn Text="詳細信息" HeaderText="功能" CommandName="Detail"></asp:ButtonColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id=HyperLink_EditOthers runat="server" Text="基本信息編輯" NavigateUrl='<%# "ElectrodeEditOthers.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partno="+DataBinder.Eval(Container, "DataItem.PartNo") %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:TemplateColumn>
										<ItemTemplate>
											<asp:HyperLink id="HyperlinkProcess" runat="server" Text="工序設定編輯" NavigateUrl='<%# "ElectrodeEditProcess.aspx?moduleid="+DataBinder.Eval(Container, "DataItem.moduleid")+"&partno="+DataBinder.Eval(Container, "DataItem.PartNo")+"&partcount="+DataBinder.Eval(Container, "DataItem.PartCount")+"&priority="+DataBinder.Eval(Container, "DataItem.Priority")+"&RelationprocessId="+DataBinder.Eval(Container, "DataItem.RelationprocessId")+"&RelationPart="+DataBinder.Eval(Container, "DataItem.RelationPart")+"" %>'>
											</asp:HyperLink>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:ButtonColumn Text="刪除" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
								<PagerStyle Mode="NumericPages"></PagerStyle>
							</asp:datagrid><br>
							<asp:datagrid id="DetailDatagrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="2"
								CellPadding="2">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="ProcessOrder" HeaderText="工序順序"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessId" HeaderText="工序"></asp:BoundColumn>
									<asp:BoundColumn DataField="startdate" HeaderText="開始日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="enddate" HeaderText="結束日期" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
									<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="工時"></asp:BoundColumn>
								</Columns>
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
