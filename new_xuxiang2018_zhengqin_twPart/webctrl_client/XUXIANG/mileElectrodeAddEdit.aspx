<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="uc1" TagName="mileElectrodeHeader" Src="controls/mileElectrodeHeader.ascx" %>
<%@ Page language="c#" Codebehind="mileElectrodeAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.mileElectrodeAddEdit"%>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>電極設定</title>
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
						<TD vAlign="top" width="79%"><uc1:mileelectrodeheader id="mileElectrodeHeader" runat="server"></uc1:mileelectrodeheader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td colSpan="6"><asp:label id="Label_HiddenModuleId" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenFuncMode" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenPartNo" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenSelectRow" runat="server" ForeColor="Red" Visible="False"></asp:label></td>
									</tr>
									<TR>
										<TD><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></TD>
										<TD><asp:dropdownlist id="ListBox_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox_ModuleList"
												ErrorMessage="請選擇有效的編號"></asp:requiredfieldvalidator></TD>
										<td>電極名稱</td>
										<td><asp:textbox id="txt_partName" runat="server" Width="152px"></asp:textbox></td>
										<TD>相關零件</TD>
										<TD><asp:textbox id="txt_RelationPart" runat="server"></asp:textbox><asp:button id="but_part" Runat="server" Text="選擇零件"></asp:button></TD>
									</TR>
									<TR>
										<TD>電極編號</TD>
										<TD><input id="Textbox_PartNo" type="text" size="10" name="Textbox_PartNo" runat="server">
											<asp:label id="Label_HintPartNoName" runat="server"></asp:label><input id="Text_HiddenPartNo" type="hidden" name="Text_HiddenPartNo">
										</TD>
										<TD>材質</TD>
										<TD><asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist></TD>
										<TD>相關工序</TD>
										<TD><asp:textbox id="txt_RelationProcessno" runat="server"></asp:textbox>
											<asp:TextBox ID="txt_Processno" Runat="server" Visible="False"></asp:TextBox><asp:textbox id="txt_relationpartno" runat="server" Visible="true"></asp:textbox></TD>
									</TR>
									<tr>
										<td>電極類別</td>
										<td colSpan="5"><asp:button id="Button1" runat="server" Text="類別查詢"></asp:button><asp:textbox id="txt_parttypeid" runat="server" ReadOnly="True">()</asp:textbox><asp:textbox id="txt_name" runat="server" ReadOnly="True">[]</asp:textbox></td>
									</tr>
									<TR>
										<TD colSpan="6"><asp:label id="Label_Skelection" Visible="False" Runat="server"></asp:label>&nbsp;&nbsp;
											<asp:label id="Label_MainParts" Visible="False" Runat="server"></asp:label>&nbsp;&nbsp;
											<asp:label id="Label_ToolDraw" Visible="False" Runat="server"></asp:label></TD>
									</TR>
									<TR>
										<TD>工序設定</TD>
										<TD colSpan="5">
											<table id="tableSetting" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<td vAlign="top"><font color="red">選擇所需工序</font>
														<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 250px; BORDER-BOTTOM-STYLE: ridge"><asp:checkboxlist id="CheckBoxList_Process" runat="server" AutoPostBack="True"></asp:checkboxlist></div>
													</td>
													<td vAlign="top"><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
															<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:ButtonColumn Text="選擇" ButtonType="PushButton" CommandName="Select"></asp:ButtonColumn>
																<asp:TemplateColumn HeaderText="加工順序">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_OrderNo" Text='<%# DataBinder.Eval(Container, "DataItem.ListOrder") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn Visible="False" HeaderText="工序編號">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessID") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="工序名稱">
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
																<asp:TemplateColumn HeaderText="小時">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="DropDownList_Hour"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="分鐘">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="Dropdownlist_Minute"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="計劃開始時間">
																	<ItemTemplate>
																		<cc1:DatePicker id="txt_startDate" imgDirectory="images/" runat="server" DateType="yyyy-mm-dd"></cc1:DatePicker>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="計劃完成時間">
																	<ItemTemplate>
																		<cc1:DatePicker id="txt_endDate" imgDirectory="images/" runat="server" DateType="yyyy-mm-dd"></cc1:DatePicker>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:ButtonColumn Text="上移" ButtonType="PushButton" HeaderText="功能" CommandName="Upper"></asp:ButtonColumn>
																<asp:ButtonColumn Text="下移" ButtonType="PushButton" CommandName="Lower"></asp:ButtonColumn>
																<asp:ButtonColumn Text="刪除" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
															</Columns>
														</asp:datagrid></td>
												</tr>
											</table>
										</TD>
									</TR>
									<TR>
										<TD>減寸(粗)</TD>
										<TD colSpan="2"><asp:textbox id="TextBox_jiancun1" runat="server"></asp:textbox></TD>
										<TD>數量(粗)</TD>
										<TD colSpan="2"><asp:textbox id="TextBox_count1" runat="server"></asp:textbox><asp:regularexpressionvalidator id="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_count1"
												ErrorMessage="請輸入數字類型" ValidationExpression="[0-9]{1,}"></asp:regularexpressionvalidator></TD>
									</TR>
									<TR>
										<TD>減寸(精)</TD>
										<TD colSpan="2"><asp:textbox id="TextBox_jiancun2" runat="server"></asp:textbox></TD>
										<TD>數量(精)</TD>
										<TD colSpan="2"><asp:textbox id="TextBox_count2" runat="server"></asp:textbox><asp:regularexpressionvalidator id="Regularexpressionvalidator2" runat="server" ControlToValidate="TextBox_count2"
												ErrorMessage="請輸入數字類型" ValidationExpression="[0-9]{1,}"></asp:regularexpressionvalidator></TD>
									</TR>
									<TR>
										<TD>注意點</TD>
										<TD colSpan="2"><asp:textbox id="TextBox_Comments" runat="server"></asp:textbox></TD>
										<TD>等級設定</TD>
										<TD colSpan="2"><asp:dropdownlist id="ListBox_Priority" runat="server"></asp:dropdownlist></TD>
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
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label><asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" ControlToValidate="Textbox_PartNo" ErrorMessage="請輸入電極編號"></asp:requiredfieldvalidator></TD>
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
		<script language="javascript">
			document.Form1.Text_HiddenPartNo.value=document.Form1.Textbox_PartNo.value;
		</script>
	</body>
</HTML>
