<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="iewc" Namespace="Microsoft.Web.UI.WebControls" Assembly="Microsoft.Web.UI.WebControls" %>
<%@ Page language="c#" Codebehind="ModuleMiddleSchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModuleMiddleSchedule" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>模具中日程設定</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<style type="text/css">BODY { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	TD { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	TR { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	TABLE { MARGIN-TOP: 0px; FONT-SIZE: 12px; FONT-FAMILY: "Arial", "Helvetica" }
	A { COLOR: #325ba3 }
	.spcr { MARGIN: 0px 0px 10px; FONT-FAMILY: "Arial", "Helvetica" }
	.shade { BACKGROUND: #7694c8 }
	.shade2 { BACKGROUND: #f2f2f2 }
	.shade1 { BACKGROUND: #d9e2f2 }
	.shade3 { BACKGROUND: #f1f4fa }
	.highlight { COLOR: #ff6600 }
	.titleb { FONT-WEIGHT: bold; FONT-SIZE: 18px; COLOR: #3300cc; FONT-FAMILY: "Arial", "Helvetica" }
	.titleb2 { FONT-WEIGHT: bold; FONT-SIZE: 24px; COLOR: #993399; FONT-FAMILY: "Arial", "Helvetica" }
	.content { FONT-WEIGHT: bold; FONT-SIZE: 18px; COLOR: #cc0033; FONT-FAMILY: "Arial", "Helvetica" }
	.content1 { FONT-WEIGHT: bold; FONT-SIZE: 12px; COLOR: #993399; FONT-FAMILY: "Arial", "Helvetica" }
		</style>
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
							<TABLE id="tbl_condition" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td>&nbsp;&nbsp;<A href="default.aspx">返回首頁</A></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;選擇模具<asp:dropdownlist id="drp_modulelist" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;選擇年份<asp:dropdownlist id="drp_year" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;選擇月份<asp:dropdownlist id="drp_month" AutoPostBack="True" Runat="server"></asp:dropdownlist></td>
								</tr>
								<tr>
									<td>
									<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 500px; BORDER-BOTTOM-STYLE: ridge">
									<iewc:treeview id="trv_module" runat="server" ImageUrl="/webctrl_client/1_0/images/folder.gif"
									ExpandedImageUrl="/webctrl_client/1_0/images/folderopen.gif" SystemImagesPath="webctrl_client/1_0/treeimages/"></iewc:treeview>
									</div>
									</td>
								</tr>
							</TABLE>
							<!--<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 500px; BORDER-BOTTOM-STYLE: ridge">-->
							<!--</div>-->
						</TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<iframe name="framemain" src="_PartModuleMiddleSchedule.aspx" width="100%" height="600" scrolling="yes"
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
