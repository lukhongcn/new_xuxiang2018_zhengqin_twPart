<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Page language="c#" Codebehind="OrderAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderAddEdit" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>訂單設定</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<P>
				<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
					<TBODY>
						<TR>
							<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
						</TR>
						<TR>
							<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
							<TD width="1%">&nbsp;</TD>
							<TD vAlign="top" width="79%"><uc1:orderheader id="OrderHeader" runat="server"></uc1:orderheader><BR>
								<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
									<TBODY>
										<tr>
											<td colSpan="4"><b>請填寫如下信息</b>
												<asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
										</tr>
										<TR>
											<TD width="20%">客戶編號</TD>
											<TD width="30%"><asp:dropdownlist id="Dropdownlist_Customer" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
											<TD width="20%">模具編號</TD>
											<TD width="30%"><font color="red">*
													<asp:textbox id="txt_moduleid" runat="server"></asp:textbox></font><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="txt_moduleid" ErrorMessage="請選擇有效的模具編號"></asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>備註</TD>
											<TD><font color="red"><asp:textbox id="txt_DanDangZhe" runat="server"></asp:textbox></font></TD>
											<TD>產品編號</TD>
											<TD><asp:textbox id="TextBox_ProcductId" runat="server"></asp:textbox><font color="red"></font></TD>
										</TR>
										<TR>
											<TD>產品類型</TD>
											<TD><asp:dropdownlist id="ListBox_ProductTypeList" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
											<TD>產品名稱</TD>
											<TD><asp:textbox id="TextBox_ProductName" runat="server"></asp:textbox><font color="red">*</font><asp:requiredfieldvalidator id="Requiredfieldvalidator2" runat="server" ControlToValidate="TextBox_ProductName"
													ErrorMessage="請輸入產品名稱"></asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>材質</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
											<TD>模具類型</TD>
											<TD><asp:dropdownlist id="dpl_moduletype" runat="server"></asp:dropdownlist><font color="red">*</font></TD>
										</TR>
										<TR>
											<TD>最終圖面位置</FONT></TD>
											<TD><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox><font color="red">*</font><INPUT onclick="javascript:selectImage();" type="button" value="上傳"><asp:requiredfieldvalidator id="Requiredfieldvalidator4" runat="server" ControlToValidate="TextBox_Picture"
													ErrorMessage="請選擇圖片"></asp:requiredfieldvalidator></TD>
											<TD>穴數</TD>
											<TD><asp:textbox id="TextBox_Holes" runat="server"></asp:textbox><font color="red">*</font><asp:requiredfieldvalidator id="Requiredfieldvalidator5" runat="server" ControlToValidate="TextBox_Holes" ErrorMessage="請輸入穴數"></asp:requiredfieldvalidator></TD>
										</TR>
										<TR>
											<TD>參考圖面日期</TD>
											<TD><wc:inputcalendar id="TextBox_ReferencePictureDate" runat="server"></wc:inputcalendar></TD>
											<TD>最終圖面日期</TD>
											<TD><wc:inputcalendar id="TextBox_FinishPictureDate" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>完工日期</TD>
											<TD><wc:inputcalendar id="TextBox_TryDate0" runat="server"></wc:inputcalendar></TD>
											<TD>送樣日期</TD>
											<TD><wc:inputcalendar id="TextBox_TryDate3" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>移交日期</TD>
											<TD><wc:inputcalendar id="TextBox_TryDateF" runat="server"></wc:inputcalendar></TD>
											<TD>模具狀態</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Status" runat="server"></asp:dropdownlist></TD>
										</TR>
										<TR>
											<TD>負責群組</TD>
											<TD><asp:dropdownlist id="ListBox_UserGroupList" runat="server"></asp:dropdownlist></TD>
											<TD>優先等級</TD>
											<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
										</TR>
										<TR>
											<TD>CAD設計</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Design_Day" runat="server"></asp:dropdownlist>天
												<asp:dropdownlist id="Dropdownlist_Design_Hour" runat="server"></asp:dropdownlist>小時
												<asp:dropdownlist id="Dropdownlist_Design_Minute" runat="server"></asp:dropdownlist>分
											</TD>
											<TD>組立</TD>
											<TD><asp:dropdownlist id="Dropdownlist_Assemble_Day" runat="server"></asp:dropdownlist>天
												<asp:dropdownlist id="Dropdownlist_Assemble_Hour" runat="server"></asp:dropdownlist>小時
												<asp:dropdownlist id="Dropdownlist_Assemble_Minute" runat="server"></asp:dropdownlist>分
											</TD>
										</TR>
										<TR>
											<TD>事前檢討會日期</TD>
											<TD><wc:inputcalendar id="TextBox_Review" runat="server"></wc:inputcalendar></TD>
											<TD>基本圖出圖日期</TD>
											<TD><wc:inputcalendar id="TextBox_BasicTool" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>3D圖檔出圖日期</TD>
											<TD><wc:inputcalendar id="TextBox_3DMTool" runat="server"></wc:inputcalendar></TD>
											<TD>模仁圖出圖日期</TD>
											<TD><wc:inputcalendar id="TextBox_MainParts" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>零件圖出圖日期</TD>
											<TD><wc:inputcalendar id="TextBox_ToolDraw" runat="server"></wc:inputcalendar></TD>
											<TD>電極檢查日期</TD>
											<TD><wc:inputcalendar id="TextBox_FlashCheck" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>熱澆道購入日期</TD>
											<TD><wc:inputcalendar id="TextBox_ReJiaoDao" runat="server"></wc:inputcalendar></TD>
											<TD>模架購入日期</TD>
											<TD><wc:inputcalendar id="TextBox_Skelection" runat="server"></wc:inputcalendar></TD>
										</TR>
										<TR>
											<TD>客戶料號</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_YingYeDanDang" runat="server"></asp:textbox></font></TD>
											<TD>工程負責人</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_GongChengDanDang" runat="server"></asp:textbox></font></TD>
										</TR>
										<TR>
											<TD>設計負責人</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_SheJiDanDang" runat="server"></asp:textbox></font></TD>
											<TD>組立負責人</TD>
											<TD><font color="red">*
													<asp:textbox id="txt_ZuLiDanDang" runat="server"></asp:textbox></font></TD>
										</TR>
										<tr>
											<td>預警時間</td>
											<td><asp:dropdownlist id="dpl_alertday" runat="server">
													<asp:ListItem Value="1">1</asp:ListItem>
													<asp:ListItem Value="2">2</asp:ListItem>
													<asp:ListItem Value="3">3</asp:ListItem>
													<asp:ListItem Value="4">4</asp:ListItem>
													<asp:ListItem Value="5">5</asp:ListItem>
													<asp:ListItem Value="6">6</asp:ListItem>
													<asp:ListItem Value="7">7</asp:ListItem>
													<asp:ListItem Value="0">0</asp:ListItem>
												</asp:dropdownlist></td>
											<TD>
												<P>大圖號</P>
											</TD>
											<TD><asp:textbox id="txt_TotalModuleId" runat="server"></asp:textbox><font color="red"></font></TD>
										</tr>
									</TBODY>
								</TABLE>
								<asp:button id="Button_AddEdit" runat="server" Text="Add"></asp:button><br>
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
		</P>
	</body>
</HTML>
