<%@ Page language="c#" Codebehind="ProjectEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProjectEdit" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ProjectHeader" Src="controls/ProjectHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>指示書設定</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<script language="javascript" src="js/lib.js"></script>
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
						<TD vAlign="top"><uc1:projectheader id="ProjectHeader" runat="server"></uc1:projectheader><BR>
							<table id="Table_Header" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td width="50%"><asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="red"></asp:label></td>
									<td align="right" width="50%"><asp:label id="label_ProjectId" Runat="server" Visible="False"></asp:label></td>
								</tr>
							</table>
							<table id="Table_Header1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								
								<tr align="center">
									<td rowSpan="2">工程項目</td>
									<td width="10%"><asp:checkbox id="RadioButton5" runat="server" Text="客戶設變"></asp:checkbox></td>
									<td width="10%"><asp:checkbox id="RadioButton2" runat="server" Text="外部修模"></asp:checkbox></td>
									<td width="10%">製表日期</td>
									<td width="20%" colSpan="3"><wc:inputcalendar id="TextBox_CreateDate" runat="server" size="14"></wc:inputcalendar></td>
									<td style="WIDTH: 14px" width="14">修模單編號</td>
									<td width="20%" colSpan="3"><asp:label id="Label_XIUMOBIANHAO" runat="server" Width="150px"></asp:label></td>
								</tr>
								<tr align="center">
									<td width="10%"><asp:checkbox id="RadioButton8" runat="server" Text="內部修模"></asp:checkbox></td>
									<td width="10%"></td>
									<td width="10%">客戶名稱</td>
									<td width="20%" colSpan="3"><asp:label id="Label_CustomerName" Runat="server" Width="100px"></asp:label></td>
									<td style="WIDTH: 14px" width="14"><FONT face="新細明體"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></FONT></td>
									<td width="20%" colSpan="3"><asp:dropdownlist id="DropDownList_ModuleId" runat="server" Enabled="False"></asp:dropdownlist></td>
								</tr>
							</table>
							<br>
							<asp:datagrid id="PictureDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="圖片">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<ItemTemplate>
											<img align="middle" src='<%# DataBinder.Eval(Container, "DataItem.picturepath") %>' width="40px">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn Visible="False" HeaderText="路徑" DataField="picturepath"></asp:BoundColumn>
									<asp:ButtonColumn Text="刪除" ButtonType="PushButton" HeaderText="功能" CommandName="Delete">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
									</asp:ButtonColumn>
								</Columns>
							</asp:datagrid><br>
							<table id="Table_Header2" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td align="center" width="10%">上傳產品圖片</td>
									<td width="90%"><asp:textbox id="TextBox_Picture" Runat="server" Width="300px" ReadOnly="True"></asp:textbox>&nbsp;&nbsp;<input onclick="javascript:selectImage();" type="button" value="瀏覽..." name="browser">&nbsp;&nbsp;<asp:button id="Button_PicAdd" Runat="server" Text="添加圖片"></asp:button></td>
								</tr>
							</table>
							<br>
							<asp:datagrid id="MainDatagrid" runat="server" Width="100%" AutoGenerateColumns="False">
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
								<ItemStyle HorizontalAlign="Center"></ItemStyle>
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:BoundColumn DataField="subjectid" HeaderText="項次"></asp:BoundColumn>
									<asp:BoundColumn DataField="question" HeaderText="問題點說明"></asp:BoundColumn>
									<asp:BoundColumn DataField="reason" HeaderText="原因分析"></asp:BoundColumn>
									<asp:BoundColumn DataField="resolve" HeaderText="改善對策"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="是否為前次問題點">
										<ItemTemplate>
											<input type="checkbox" id="isPreProblem" name="isPreProblem" runat="server" disabled="true">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="times" HeaderText="第幾次發生"></asp:BoundColumn>
									<asp:ButtonColumn Text="修改" ButtonType="PushButton" CommandName="modify" HeaderText="功能"></asp:ButtonColumn>
									<asp:ButtonColumn Text="刪除" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
								</Columns>
							</asp:datagrid><br>
							<table id="Table_SettingSub" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td width="10%"><font style="FONT-WEIGHT: bold">功能:</font></td>
									<td colSpan="5"><font style="FONT-WEIGHT: bold"><asp:label id="label_showfunc" Runat="server">添加</asp:label></font><asp:label id="hidden_func" ForeColor="RED" Runat="server" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td width="10%"><font style="FONT-WEIGHT: bold">問題點說明:</font></td>
									<td colSpan="5"><asp:textbox id="TextBox_question" Runat="server" Width="500px"></asp:textbox></td>
								</tr>
								<tr>
									<td width="10%"><font style="FONT-WEIGHT: bold">原因分析:</font></td>
									<td colSpan="5"><asp:textbox id="TextBox_reason" Runat="server" Width="500px"></asp:textbox></td>
								</tr>
								<tr>
									<td width="10%"><font style="FONT-WEIGHT: bold">改善對策:</font></td>
									<td colSpan="5"><asp:textbox id="TextBox_resolve" Runat="server" Width="500px"></asp:textbox></td>
								</tr>
								<tr>
									<td width="10%"><font style="FONT-WEIGHT: bold">項次:</font></td>
									<td width="10%">&nbsp;<asp:label id="Label_subjectid" Runat="server"></asp:label></td>
									<td width="20%"><font style="FONT-WEIGHT: bold">是否為前次問題點:</font></td>
									<td width="20%"><asp:checkbox id="CheckBox_ispreproblem" Runat="server"></asp:checkbox></td>
									<td width="20%"><font style="FONT-WEIGHT: bold">第幾次發生:</font></td>
									<td width="20%"><asp:dropdownlist id="DropDownList_times" Runat="server"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td colSpan="6"><asp:button id="Button_AddSub" Runat="server" Text="Add"></asp:button></td>
								</tr>
							</table>
							<br>
							<table id="Table_SaveChange" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td><asp:button id="save" Runat="server" Text="保存指示書設定" BackColor="Teal"></asp:button></td>
								</tr>
							</table>
							<br>
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
									</TD>
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
