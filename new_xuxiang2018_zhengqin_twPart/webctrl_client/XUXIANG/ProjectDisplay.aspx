<%@ Page language="c#" Codebehind="ProjectDisplay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProjectDisplay" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>指示書設定</title>
		<script language="JavaScript">
			self.moveTo(0,0); 
			self.resizeTo(screen.availWidth,screen.availHeight);
			self.focus(); 
		</script>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD vAlign="top">
							<table id="Table_Header" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td width="50%"><font style="FONT-WEIGHT: bold" size="20">模具變更</font></td>
									<td align="right" width="50%">模具變更編號：[<asp:label id="label_ProjectId" Runat="server"></asp:label>]</td>
								</tr>
							</table>
							<table id="Table_Header1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr align="center">
										<td rowSpan="3">工程項目</td>
										<td><asp:checkbox id="RadioButton2" runat="server" Text="外部修模"></asp:checkbox></td>
										<td>製表日期</td>
										<td style="WIDTH: 168px" colSpan="3"><asp:label id="Label_CreateDate" runat="server"></asp:label></td>
										<td><FONT face="新細明體"><FONT face="新細明體"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></FONT></FONT></td>
										<td colSpan="3"><asp:label id="Label_ModuleId" runat="server"></asp:label></td>
									</tr>
									<tr align="center">
										<td><asp:checkbox id="RadioButton5" runat="server" Text="客戶設變"></asp:checkbox></td>
										<td><FONT face="新細明體">客戶名稱</FONT></td>
										<td style="WIDTH: 168px" colSpan="3"><asp:label id="Label_CustomerName" runat="server"></asp:label></td>
										<td><FONT face="新細明體">修模單編號</FONT></td>
										<td colSpan="3"><asp:label id="Label_XIUMOBIANHAO" runat="server"></asp:label></td>
									</tr>
									<tr align="center">
										<td><asp:checkbox id="RadioButton8" runat="server" Text="內部修模"></asp:checkbox></td>
									</tr>
								</TBODY>
							</table>
							<br>
							<asp:datagrid id="PictureDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="圖片">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<ItemTemplate>
											<img align="middle" src='<%# DataBinder.Eval(Container, "DataItem.picturepath") %>'>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn Visible="False" DataField="picturepath" HeaderText="路徑"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
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
								</Columns>
							</asp:datagrid><br>
							<table id="Table_SaveChange" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td align="center"><input onclick="javascirpt:window.close();" type="button" value="關閉當前窗口" name="close"></td>
								</tr>
							</table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
