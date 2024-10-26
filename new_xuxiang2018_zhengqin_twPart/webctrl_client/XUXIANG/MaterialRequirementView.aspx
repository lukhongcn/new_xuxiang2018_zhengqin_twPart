<%@ Register TagPrefix="uc1" TagName="MaterialRequirementHeader" Src="controls/MaterialRequirementHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Page language="c#" Codebehind="MaterialRequirementView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MaterialRequirementView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="css/common.css" rel="stylesheet">
		<script language="javascript" src="js/lib.js"></script>
</HEAD>
	<body topMargin="0">
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
							<uc1:MaterialRequirementHeader id="MaterialRequirementHeader" runat="server"></uc1:MaterialRequirementHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td><asp:Label ID="lab_requireNo" runat="server" Text="需求單號"></asp:Label><asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label></td>
												<td><asp:textbox id="txt_requireNo" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_productNo" runat="server" Text="工令單號"></asp:Label></td>
												<td><asp:textbox id="txt_productNo" runat="server"></asp:textbox></td>
												<td><asp:Label ID="lab_moduleId" runat="server" Text="模具編號"></asp:Label></td>
												<td>
													<asp:DropDownList id="dpl_moduleId" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_pictureDate" runat="server" Text="出圖日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_pictureDate" runat="server"></wc:inputcalendar></td>
												<td><asp:Label ID="lab_factFinishedDate" runat="server" Text="實際完成日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_factFinishedDate" runat="server"></wc:inputcalendar></td>
												<td><asp:Label ID="lab_expectedDate" runat="server" Text="預交日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_expectedDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_createDate" runat="server" Text="開單日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar></td>
												<td><asp:Label ID="lab_preparedDate" runat="server" Text="備料日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_preparedDate" runat="server"></wc:inputcalendar></td>
												<td><asp:Label ID="lab_planedFinishedDate" runat="server" Text="預定完成日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_planedFinishedDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_creater" runat="server" Text="制單人"></asp:Label></td>
												<td><asp:DropDownList id="dpl_creater" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_checker" runat="server" Text="審核人"></asp:Label></td>
												<td><asp:DropDownList id="dpl_checker" runat="server"></asp:DropDownList></td>
												<td><asp:Label ID="lab_checkDate" runat="server" Text="審核日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td style="HEIGHT: 14px"><asp:Label ID="lab_reApprover" runat="server" Text="覆核人"></asp:Label></td>
												<td style="HEIGHT: 14px"><asp:DropDownList id="dpl_reApprover" runat="server"></asp:DropDownList></td>
												<td style="HEIGHT: 14px"><asp:Label ID="lab_reApproveDate" runat="server" Text="復合日期"></asp:Label></td>
												<td style="HEIGHT: 14px"><wc:inputcalendar id="txt_reApproveDate" runat="server"></wc:inputcalendar></td>
												<td style="HEIGHT: 14px"><asp:Label ID="lab_approver" runat="server" Text="核准人"></asp:Label></td>
												<td style="HEIGHT: 14px"><asp:DropDownList id="dpl_approver" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_approverDate" runat="server" Text="核准日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_approverDate" runat="server"></wc:inputcalendar></td>
												<td><asp:Label ID="lab_comment" runat="server" Text="備註"></asp:Label></td>
												<td colspan="3"><asp:textbox id="txt_comment" runat="server" Width="400"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button>
													<asp:Button id="btn_check" runat="server" Text="核料" Enabled="False"></asp:Button></TD>
											</TR>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<hr>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示信息</B></DIV>
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
