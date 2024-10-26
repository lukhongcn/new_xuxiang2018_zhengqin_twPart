<%@ Page language="c#" Codebehind="FileListUpload.aspx.cs" AutoEventWireup="false" Inherits="VersionControler.FileListUpload" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FileListUpload</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="Style.css" type="text/css" rel="stylesheet">
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<div id="content-top"><INPUT id="filePosted" type="file" runat="server">
								<asp:button id="Button1" runat="server" Text="上傳"></asp:button><asp:label id="lbMessage111" runat="server"></asp:label><br>
								<table>
								</table>
							</div>
							<div id="content-mid"><asp:datagrid id="DataGrid1" runat="server" AutoGenerateColumns="False" CellSpacing="2" CellPadding="2">
									<Columns>
										<asp:TemplateColumn HeaderText="序號">
											<ItemTemplate>
												<%# (DataGrid1.CurrentPageIndex * DataGrid1.PageSize + Container.ItemIndex + 
1) %>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:HyperLinkColumn DataNavigateUrlField="FileID" DataNavigateUrlFormatString="Download.aspx?FileID={0}"
											DataTextField="FileName" HeaderText="文件名"></asp:HyperLinkColumn>
										<asp:BoundColumn DataField="Version" HeaderText="版本號"></asp:BoundColumn>
										<asp:BoundColumn DataField="updata" HeaderText="上傳時間"></asp:BoundColumn>
										<asp:ButtonColumn Text="修改" HeaderText="修改" ButtonType="LinkButton" CommandName="update"></asp:ButtonColumn>
										<asp:BoundColumn DataField="status" HeaderText="標誌"></asp:BoundColumn>
										<asp:TemplateColumn HeaderText="備註">
											<ItemTemplate>
												<asp:Label ID="lab_comment" Runat =server Text ='<%# DataBinder.Eval(Container, "DataItem.Comment") %>'>
												</asp:Label>
												<asp:TextBox ID="txt_comment" Visible="False" Runat="server"></asp:TextBox>
												<asp:Button ID="btn_comment" Runat="server" CommandName="comment" Text="添加備註"></asp:Button>
											</ItemTemplate>
										</asp:TemplateColumn>
										<asp:BoundColumn DataField="usename" HeaderText="姓名"></asp:BoundColumn>
										<asp:ButtonColumn Text="刪除" CommandName="Delete"></asp:ButtonColumn>
										<asp:TemplateColumn Visible="False">
											<ItemTemplate>
												<asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FileID") %>' ID="lbFileID">
												</asp:Label>
											</ItemTemplate>
										</asp:TemplateColumn>
									</Columns>
								</asp:datagrid></div>
							<div id="content-end"><asp:button id="Button2" runat="server" Text="返回"></asp:button></div>
							<br>
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
										<asp:label id="lbMessage" runat="server"></asp:label></TD>
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
