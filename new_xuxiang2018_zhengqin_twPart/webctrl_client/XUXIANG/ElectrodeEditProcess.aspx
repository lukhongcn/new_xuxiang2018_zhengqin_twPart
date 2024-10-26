<%@ Page language="c#" Codebehind="ElectrodeEditProcess.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ElectrodeEditProcess" smartNavigation="True"%>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="ElectrodeHeader" Src="controls/ElectrodeHeader.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�q���]�w</title>
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
						<TD vAlign="top" width="79%"><uc1:ElectrodeHeader id="PartHeader" runat="server"></uc1:ElectrodeHeader><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<TR>
										<TD width="10%">�Ҩ�s��</TD>
										<TD width="20%"><asp:label id="Label_ModuleId" runat="server"></asp:label></TD>
										<TD width="10%">�s��s��</TD>
										<TD width="30%"><asp:label id="Label_PartNo" runat="server"></asp:label></TD>
									</TR>
									<tr>
									     <TD width="10%">�����s��</TD>
										<TD width="40%"><asp:label id="lab_relationpart" runat="server"></asp:label></TD>
										<TD width="10%">�����u��</TD>
										<TD width="40%"><asp:label id="lab_relationpartprocessno" runat="server"></asp:label></TD>
									</tr>
									<TR>
										<TD colSpan="6">�Ҭ[�ʤJ���:<asp:label id="Label_Skelection" Runat="server"></asp:label>&nbsp;&nbsp; 
											�Ҥ��ϥX�Ϥ��:<asp:label id="Label_MainParts" Runat="server"></asp:label>&nbsp;&nbsp; 
											�s��ϥX�Ϥ��:<asp:label id="Label_ToolDraw" Runat="server"></asp:label>
											<asp:checkbox id="CheckBox_ProcessUpdate" runat="server"></asp:checkbox><asp:label id="Label1" runat="server">��s�Ҧ��s��u��</asp:label></TD>
									</TR>
									<TR>
										<TD>�u�ǳ]�w</TD>
										<TD colSpan="5">
											<table id="tableSetting" cellSpacing="0" cellPadding="0" width="100%" border="1">
												<tr>
													<td vAlign="top"><font color="red">��ܩһݤu��</font>
														<div style="OVERFLOW-Y: scroll; WIDTH: 100%; BORDER-TOP-STYLE: ridge; BORDER-RIGHT-STYLE: ridge; BORDER-LEFT-STYLE: ridge; HEIGHT: 250px; BORDER-BOTTOM-STYLE: ridge"><asp:checkboxlist id="CheckBoxList_Process" runat="server" AutoPostBack="True"></asp:checkboxlist></div>
													</td>
													<td vAlign="top"><asp:datagrid id="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False">
															<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
															<Columns>
																<asp:ButtonColumn Text="���" ButtonType="PushButton" CommandName="Select"></asp:ButtonColumn>
																<asp:TemplateColumn HeaderText="�[�u����">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_OrderNo" Text='<%# DataBinder.Eval(Container, "DataItem.ListOrder") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn Visible="False" HeaderText="�u�ǽs��">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessID") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="�u�ǦW��">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label_ProcessName" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>'>
																		</asp:Label>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="��">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="Dropdownlist_Day"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="�p��">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="DropDownList_Hour"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:TemplateColumn HeaderText="����">
																	<ItemTemplate>
																		<asp:DropDownList Runat="server" ID="Dropdownlist_Minute"></asp:DropDownList>
																	</ItemTemplate>
																</asp:TemplateColumn>
																<asp:ButtonColumn Text="�W��" ButtonType="PushButton" HeaderText="�\��" CommandName="Upper"></asp:ButtonColumn>
																<asp:ButtonColumn Text="�U��" ButtonType="PushButton" CommandName="Lower"></asp:ButtonColumn>
																<asp:ButtonColumn Text="�R��" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
															</Columns>
														</asp:datagrid></td>
												</tr>
											</table>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="Add"></asp:button>&nbsp;&nbsp;&nbsp;&nbsp;<input onclick="window.history.back();" type="button" value="����" name="back"><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>����</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label><asp:label id="Label_HiddenSelectRow" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenPartCount" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_DisableMaxOrder" runat="server" ForeColor="Red" Visible="False"></asp:label><asp:label id="Label_HiddenPriority" runat="server" ForeColor="Red" Visible="False"></asp:label></TD>
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
