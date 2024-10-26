<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="PartMiddleSchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartMiddleSchedule" %>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具中日程設定</title>
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
						<TD vAlign="top" align="left" width="20%">
						<p align="center"><A href="default.aspx">返回首頁</A><br></p>
						<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 500px; BORDER-BOTTOM-STYLE: ridge">
							<table id="tab_processlist" cellSpacing="0" cellPadding="0" width="100%" align="center"
								border="0">
								<tr>
									<td>
									
										<iewc:treeview id="trv_module" runat="server" ImageUrl="/webctrl_client/1_0/images/folder.gif"
											ExpandedImageUrl="/webctrl_client/1_0/images/folderopen.gif" SystemImagesPath="webctrl_client/1_0/treeimages/"></iewc:treeview>&nbsp;</td>
								</tr>
							</table>
							</div>
						</TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<table id="tab_Out1" borderColor="#0000ff" cellSpacing="0" cellPadding="0" width="100%"
								border="1">
								<tr>
									<td>
										<table id="tab_condition" cellSpacing="0" cellPadding="0" width="100%" border="0">
											<tr>
												<td colSpan="4">請選擇模具瀏覽</td>
											</tr>
											<tr>
												<td width="10%" bgColor="#cccccc">選擇客戶</td>
												<td width="40%"><asp:dropdownlist id="drp_customerlist" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
												<td width="10%" bgColor="#cccccc">選擇模具</td>
												<td width="40%"><asp:dropdownlist id="drp_modulelist" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<br>
							<iframe name="framemain" src="_PartMiddleSchedulePart.aspx" width="100%" height="500px" scrolling="yes" 
								frameborder="0"></iframe>
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
