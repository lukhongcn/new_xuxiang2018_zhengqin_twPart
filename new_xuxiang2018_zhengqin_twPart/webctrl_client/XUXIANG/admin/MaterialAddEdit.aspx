<%@ Register TagPrefix="uc1" TagName="Footer" Src="controls/Footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="controls/Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="MaterialAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.MaterialAddEdit" %>
<%@ Register TagPrefix="uc1" TagName="MaterialHeader" Src="controls/MaterialHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>材質設定</title>
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
							<uc1:MaterialHeader id="MaterialHeader" runat="server"></uc1:MaterialHeader><br>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="2"><B>請填入以下信息</B><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label>
											<asp:label id="Label_HiddenId" runat="server" Visible="False" ForeColor="Red"></asp:label></td>
									</tr>
									<TR>
										<TD width="20%">材質名稱</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="Textbox_Name" name="Textbox_Name" />
											<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入材料名稱" ControlToValidate="Textbox_Name"></asp:RequiredFieldValidator>
										</TD>
									</TR>
									<TR>
										<TD width="20%">ERP編碼</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="txt_erpid" name="txt_erpid" />
											<asp:RequiredFieldValidator id="Requiredfieldvalidator2" runat="server" ErrorMessage="請輸入ERP編碼" ControlToValidate="txt_erpid"></asp:RequiredFieldValidator>
										</TD>
									</TR>
									<TR>
										<TD width="20%">材質類型</TD>
										<TD width="80%"><asp:DropDownList ID="DropDownList_TypeId" Runat="server">
												<asp:ListItem Value="Production">產品</asp:ListItem>
												<asp:ListItem Value="Part">零件</asp:ListItem>
											</asp:DropDownList>
										</TD>
									</TR>
									<TR>
										<TD width="20%">價格</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="txt_price" name="Textbox_Name" />
											<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="txt_price" ErrorMessage="請輸入數字"
												ValidationExpression="^\d+(\.\d+)?$"></asp:RegularExpressionValidator>
										</TD>
									</TR>
									<TR>
										<TD width="20%">密度</TD>
										<TD width="80%"><asp:TextBox Runat="server" ID="txt_density" name="Textbox_Name" />
											<asp:RegularExpressionValidator id="Regularexpressionvalidator2" runat="server" ControlToValidate="txt_density"
												ErrorMessage="請輸入數字" ValidationExpression="^\d+(\.\d+)?$"></asp:RegularExpressionValidator>
										</TD>
									</TR>
									<TR>
										<TD>&nbsp;</TD>
										<TD><asp:button id="Button_AddEdit" runat="server" Text="編輯"></asp:button></TD>
									</TR>
								</TBODY>
							</TABLE>
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
