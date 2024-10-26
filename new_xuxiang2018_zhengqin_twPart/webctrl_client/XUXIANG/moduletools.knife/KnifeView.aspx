<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="KnifeHeader" Src="controls/KnifeHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Page language="c#" Codebehind="KnifeView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.KnifeView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
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
							<uc1:KnifeHeader id="AssestRequistionHeader" runat="server"></uc1:KnifeHeader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionNo" runat="server" Text="申請單號"></asp:Label></td>
												<td><asp:textbox id="txt_assestRequisitionNo" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionApplyDate" runat="server" Text="申請日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_assestRequisitionApplyDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionInputter" runat="server" Text="制單人"></asp:Label></td>
												<td><asp:DropDownList id="dpl_assestRequisitionInputter" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionInputDate" runat="server" Text="制單日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_assestRequisitionInputDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionChecker" runat="server" Text="審核人" Visible="False"></asp:Label></td>
												<td><asp:DropDownList id="dpl_assestRequisitionChecker" runat="server" Visible="False"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionCheckDate" runat="server" Text="審核日期" Visible="False"></asp:Label></td>
												<td><wc:inputcalendar id="txt_assestRequisitionCheckDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestmentManager" runat="server" Text="資產管理員"></asp:Label></td>
												<td><asp:DropDownList id="dpl_assestmentManager" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestmentManagerDate" runat="server" Text="資產審核日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_assestmentManagerDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionApprover" runat="server" Text="核准人" Visible="False"></asp:Label></td>
												<td><asp:DropDownList id="dpl_assestRequisitionApprover" runat="server" Visible="False"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestRequisitionApproveDate" runat="server" Text="核准日期" Visible="False"></asp:Label></td>
												<td><wc:inputcalendar id="txt_assestRequisitionApproveDate" runat="server" Text="" Visible="False"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestDepartment" runat="server" Text="財務部"></asp:Label></td>
												<td><asp:DropDownList id="dpl_assestDepartment" runat="server"></asp:DropDownList></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_assestDepartmentDate" runat="server" Text="財務審核日期"></asp:Label></td>
												<td><wc:inputcalendar id="txt_assestDepartmentDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:Label ID="lab_status" runat="server" Text="狀態" Visible="False"></asp:Label></td>
												<td><asp:textbox id="txt_status" runat="server" Visible="False"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</TR>
										</table>
										<asp:Button id="btn_Detail" runat="server" Text="申請明細" Enabled="False"></asp:Button>
										<asp:Button id="btn_Attache" runat="server" Text="附件資料" Enabled="False"></asp:Button>
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
