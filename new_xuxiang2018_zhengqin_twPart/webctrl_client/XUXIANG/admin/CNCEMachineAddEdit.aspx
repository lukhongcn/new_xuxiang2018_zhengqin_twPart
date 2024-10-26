<%@ Page language="c#" Codebehind="CNCEMachineAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.CNCEMachineAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="CNCEHeader" Src="controls/CNCEHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>CNC電極機設定</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
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
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<uc1:CNCEHeader id="CNCEHeader" runat="server"></uc1:CNCEHeader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>請填入以下信息</B>
											<asp:label id="Label_HiddenMachineId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%">機台編號</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="Textbox_MachineId" name="Textbox_MachineId" />
											<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入機台編號" ControlToValidate="Textbox_MachineId"></asp:RequiredFieldValidator>
										</TD>
									</TR>
									<TR>
										<TD width="20%">描述</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="Textbox_Description" name="Textbox_Description" />
										</TD>
									</TR>
									<TR>
										<TD width="20%">每天有效工作時間</TD>
										<TD width="80%">
											<asp:DropDownList id="DropDownList_HoursPerDay" runat="server">
												<asp:ListItem Value="24">24</asp:ListItem>
												<asp:ListItem Value="23">23</asp:ListItem>
												<asp:ListItem Value="22">22</asp:ListItem>
												<asp:ListItem Value="21">21</asp:ListItem>
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
											</asp:DropDownList>小時</TD>
									</TR>
									<TR>
										<TD width="20%">優先級</TD>
										<TD width="80%">
											<asp:DropDownList id="Dropdownlist_Priority" runat="server">
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
											</asp:DropDownList><font color="red">(最高優先級為01,最低優先級為20)</font>
										</TD>
									</TR>
									<TR>
										<TD>&nbsp;</TD>
										<TD><asp:button id="Button_AddEdit" runat="server" Text="Add"></asp:button></TD>
									</TR>
								</TBODY>
							</TABLE>
							<br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>
														<DIV align="center"><B>提示</B></DIV>
													</B>
												</DIV>
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
