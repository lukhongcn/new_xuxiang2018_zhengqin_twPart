<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="PartAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartAddEdit" smartNavigation="True"%>
<%@ Register TagPrefix="uc1" TagName="PartHeader" Src="controls/PartHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>零件设定</title>
		<meta content="False" name="vs_showGrid">
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
						<!--<TD vAlign=top align=left width="20%"><uc1:leftmenu id=LeftMenu runat="server"></uc1:leftmenu></TD>
    <TD width="1%">&nbsp;</TD>-->
						<TD vAlign="top" width="79%"><uc1:partheader id="PartHeader" runat="server"></uc1:partheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="4"><asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenPartNo" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenSelectRow" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_CustomerId" runat="server" ForeColor="Red" Visible="False"></asp:label>美摸
<asp:dropdownlist id=dpl_processtype runat="server" AutoPostBack="True"></asp:dropdownlist> 
            夹非美
<asp:dropdownlist id=dpl_standprocess runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									</tr>	
						</TD>
					</TR>
					<TR>
						<TD width="10%">客户编号</TD>
						<TD width="40%"><asp:dropdownlist id="ListBox_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
						<TD width="10%">模具编号</TD>
						<TD width="40%"><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox_ModuleList"
								ErrorMessage="请选择有效的模具编号"></asp:requiredfieldvalidator></TD>
					</TR>
					<TR>
						<TD width="10%">零件编号</TD>
						<TD width="40%"><input onkeypress="type_change(this);" id="Textbox_PartNo" onkeyup="type_change(this);"
								type="text" size="10" name="Textbox_PartNo" runat="server">
							<asp:label id="Label_HintPartNoName" runat="server"></asp:label><input id="Text_HiddenPartNo" type="hidden" name="Text_HiddenPartNo">
						</TD>
						<TD>材质</TD>
						<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
					</TR>
					<TR>
						<TD colSpan="4">模架购入日期:<asp:label id="Label_Skelection" Runat="server"></asp:label>&nbsp;&nbsp; 
							模仁图出图日期:<asp:label id="Label_MainParts" Runat="server"></asp:label>&nbsp;&nbsp; 
							零件图出图日期:<asp:label id="Label_ToolDraw" Runat="server"></asp:label>
						</TD>
					</TR>
					<tr>
						<td>零件名称</td>
						<td><asp:textbox id="txt_partName" runat="server"></asp:textbox></td>
						<td>零件大类</td>
						<td><asp:dropdownlist id="dpl_parttype1" runat="server" AutoPostBack="True"></asp:dropdownlist>零件小类
							<asp:dropdownlist id="dpl_parttype2" runat="server"></asp:dropdownlist></td>
					</tr>
					<TR>
						<TD>工序设定</TD>
						<TD colSpan="3">
							<table id="tableSetting" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<tr>
									<td vAlign="top"><font color="red">选择所需工序</font>
										<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 250px; BORDER-BOTTOM-STYLE: ridge"><asp:checkboxlist id="CheckBoxList_Process" runat="server" AutoPostBack="True"></asp:checkboxlist></div>
									</td>
									<td vAlign="top"><asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" Width="100%">
											<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
											<Columns>
												<asp:ButtonColumn Text="选择" ButtonType="PushButton" CommandName="Select"></asp:ButtonColumn>
												<asp:TemplateColumn HeaderText="加工顺序">
													<ItemTemplate>
														<asp:Label runat="server" ID="Label_OrderNo" Text='<%# DataBinder.Eval(Container, "DataItem.ListOrder") %>'>
														</asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn Visible="False" HeaderText="工序编号">
													<ItemTemplate>
														<asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessID") %>'>
														</asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="工序名称">
													<ItemTemplate>
														<asp:Label runat="server" ID="Label_ProcessName" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'>
														</asp:Label>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="天">
													<ItemTemplate>
														<asp:DropDownList Runat="server" ID="Dropdownlist_Day"></asp:DropDownList>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="小时">
													<ItemTemplate>
														<asp:DropDownList Runat="server" ID="DropDownList_Hour"></asp:DropDownList>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="分钟">
													<ItemTemplate>
														<asp:DropDownList Runat="server" ID="Dropdownlist_Minute"></asp:DropDownList>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="是否合算">
													<ItemTemplate>
														<asp:checkBox Runat="server" ID="chk_total"></asp:checkBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="上移" ButtonType="PushButton" HeaderText="功能" CommandName="Upper"></asp:ButtonColumn>
												<asp:ButtonColumn Text="下移" ButtonType="PushButton" CommandName="Lower"></asp:ButtonColumn>
												<asp:ButtonColumn Text="删除" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
										</asp:datagrid></td>
								</tr>
							</table>
						</TD>
					</TR>
					<TR>
						<TD>零件图面</TD>
						<TD><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox><INPUT onclick="javascript:selectImage();" type="button" value="上传"></TD>
						<TD>注释</TD>
						<TD><TEXTAREA id="Text_Comments" name="Text_Comments" rows="2" cols="50" runat="server"></TEXTAREA></TD>
					</TR>
					<TR>
						<TD>数量</TD>
						<TD><asp:textbox id="TextBox_PartCount" runat="server"></asp:textbox><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_PartCount"
								ErrorMessage="请输入数字类型" ValidationExpression="[0-9.]{1,}"></asp:regularexpressionvalidator></TD>
						<TD>等级设定</TD>
						<TD><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
					</TR>
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
						<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="Textbox_PartNo" ErrorMessage="请输入零件编号"></asp:requiredfieldvalidator></TD>
				</TR>
			</TABLE></TD></TR>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR></TBODY></TABLE>
		</form>
		<script language="javascript">
			document.Form1.Text_HiddenPartNo.value=document.Form1.Textbox_PartNo.value;
		</script>
	</body>
</HTML>
