<%@ Page language="c#" Codebehind="ProjectDisplay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProjectDisplay" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>���ܮѳ]�w</title>
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
									<td width="50%"><font style="FONT-WEIGHT: bold" size="20">�Ҩ��ܧ�</font></td>
									<td align="right" width="50%">�Ҩ��ܧ�s���G[<asp:label id="label_ProjectId" Runat="server"></asp:label>]</td>
								</tr>
							</table>
							<table id="Table_Header1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr align="center">
										<td rowSpan="3">�u�{����</td>
										<td><asp:checkbox id="RadioButton2" runat="server" Text="�~���׼�"></asp:checkbox></td>
										<td>�s����</td>
										<td style="WIDTH: 168px" colSpan="3"><asp:label id="Label_CreateDate" runat="server"></asp:label></td>
										<td><FONT face="�s�ө���"><FONT face="�s�ө���"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></FONT></FONT></td>
										<td colSpan="3"><asp:label id="Label_ModuleId" runat="server"></asp:label></td>
									</tr>
									<tr align="center">
										<td><asp:checkbox id="RadioButton5" runat="server" Text="�Ȥ�]��"></asp:checkbox></td>
										<td><FONT face="�s�ө���">�Ȥ�W��</FONT></td>
										<td style="WIDTH: 168px" colSpan="3"><asp:label id="Label_CustomerName" runat="server"></asp:label></td>
										<td><FONT face="�s�ө���">�׼ҳ�s��</FONT></td>
										<td colSpan="3"><asp:label id="Label_XIUMOBIANHAO" runat="server"></asp:label></td>
									</tr>
									<tr align="center">
										<td><asp:checkbox id="RadioButton8" runat="server" Text="�����׼�"></asp:checkbox></td>
									</tr>
								</TBODY>
							</table>
							<br>
							<asp:datagrid id="PictureDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
								<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="�Ϥ�">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<ItemTemplate>
											<img align="middle" src='<%# DataBinder.Eval(Container, "DataItem.picturepath") %>'>
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn Visible="False" DataField="picturepath" HeaderText="���|"></asp:BoundColumn>
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
									<asp:BoundColumn DataField="subjectid" HeaderText="����"></asp:BoundColumn>
									<asp:BoundColumn DataField="question" HeaderText="���D�I����"></asp:BoundColumn>
									<asp:BoundColumn DataField="reason" HeaderText="��]���R"></asp:BoundColumn>
									<asp:BoundColumn DataField="resolve" HeaderText="�ﵽ�ﵦ"></asp:BoundColumn>
									<asp:TemplateColumn HeaderText="�O�_���e�����D�I">
										<ItemTemplate>
											<input type="checkbox" id="isPreProblem" name="isPreProblem" runat="server" disabled="true">
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="times" HeaderText="�ĴX���o��"></asp:BoundColumn>
								</Columns>
							</asp:datagrid><br>
							<table id="Table_SaveChange" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<tr>
									<td align="center"><input onclick="javascirpt:window.close();" type="button" value="������e���f" name="close"></td>
								</tr>
							</table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form></TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
