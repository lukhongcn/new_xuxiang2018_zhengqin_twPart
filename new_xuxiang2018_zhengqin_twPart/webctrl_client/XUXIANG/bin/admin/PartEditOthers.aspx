<%@ Page language="c#" Codebehind="PartEditOthers.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartEditOthers" smartNavigation="True"%>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PartHeader" Src="controls/PartHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>零件設定</title>
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
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:partheader id="PartHeader" runat="server"></uc1:partheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										
										<TD>模具編號</TD>
										<TD><asp:label id="Label_ModuleId" runat="server"></asp:label></TD><td>零件名稱</td><td><asp:TextBox id="txt_partName" runat="server"></asp:TextBox></td>
									</TR>
									<tr><td>零件大類</td>
						
										<td>
											<asp:DropDownList id="dpl_parttype1" runat="server" AutoPostBack="True"></asp:DropDownList></td><td>零件小類</td>
											<td>
											<asp:DropDownList id="dpl_parttype2" runat="server"></asp:DropDownList>
											</td></tr>
									<TR>
										<TD>零件編號</TD>
										<TD><asp:label id="Label_PartNo" runat="server"></asp:label></TD>
										<TD>材質</TD>
										<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
									</TR>
									<TR>
										<TD>零件圖面</TD>
										<TD><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox><INPUT onclick="javascript:selectImage();" type="button" value="上傳"></TD>
										<TD>註釋</TD>
										<TD><TEXTAREA id="Text_Comments" name="Text_Comments" rows="2" cols="50" runat="server"></TEXTAREA></TD>
									</TR>
									<TR>
										<TD>數量</TD>
										<TD><asp:textbox id="TextBox_PartCount" runat="server"></asp:textbox><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_PartCount"
												ErrorMessage="請輸入數字類型" ValidationExpression="[0-9.]{1,}"></asp:regularexpressionvalidator></TD>
										<TD>等級設定</TD>
										<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="edit"></asp:button><br>
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
										<asp:label id="Label_Message" runat="server" ForeColor="red" Font-Bold="True"></asp:label><asp:label id="Label_HiddenPartCount" runat="server" Visible="False"></asp:label></TD>
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
