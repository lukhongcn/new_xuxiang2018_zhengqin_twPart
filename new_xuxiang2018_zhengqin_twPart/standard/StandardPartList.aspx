<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="c1webgrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid" %>
<%@ Page language="c#" Codebehind="StandardPartList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.standard.StandardPartList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><asp:Label ID="lab_title" runat="server"/></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx">生產管理</a>
<img src="images/arrow.png" />
<a href="#"><asp:Label ID="lab_href_title" runat="server"/></a><asp:Label ID="lab_isProductType" runat="server" Visible="false"/>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" OnClick="lnkbutton_add_Click" ToolTip="新增/add">新增/add</asp:LinkButton>
</li>
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
</li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎 '); ">刪除/delete</asp:LinkButton>
</li>
</ul>
</div>

<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box"><table cellSpacing="2" width="100%" border="0">
<tr>
<td><asp:label id="lab_typeName" runat="server" Text="typeName">類型名稱</asp:label><asp:dropdownlist id="dpl_standardtype" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
</tr>
</table>
</div>
<div class="Textbox">
<table width="100%" align="center" border="0">
								<tr>
									<td>
										<asp:datagrid id="dg_StandProcess" runat="server" AutoGenerateColumns="False" 
										CellSpacing="1"	CellPadding="0" AllowPaging="True" BorderWidth=0 CssClass=Grid 
                                            onitemcreated="dg_StandProcess_ItemCreated">
											<AlternatingItemStyle BackColor=#F8F7FF></AlternatingItemStyle>
											<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
											<ItemStyle BackColor=#ffffff  BorderColor="#E3E3E4" BorderStyle=Dotted HorizontalAlign="Center"></ItemStyle>
											<Columns>
                                            <asp:TemplateColumn ItemStyle-Width="10px">
                                                <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="chk_datagrid" />
                                                </ItemTemplate>
                                                </asp:TemplateColumn>
												<asp:BoundColumn HeaderText="工序類型編號" DataField="StandardProcessType" Visible="false"></asp:BoundColumn>
												<asp:BoundColumn HeaderText="工序名" DataField="StandardProcessName"></asp:BoundColumn>
                                                <asp:BoundColumn HeaderText="工序編號" DataField="StandardProcessPartNo"></asp:BoundColumn>
												<asp:TemplateColumn>
													<HeaderTemplate>
														<asp:Label id="dg_header_productId" runat="server" text='工序列表'></asp:Label>
													</HeaderTemplate>
													<ItemTemplate>
														<asp:Label id="dg_lab_StandardProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessList") %>' />
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
											<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
											<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
											<PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
										</asp:datagrid>
									</td>
								</tr>
							</table>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage" border="1"><tr style="VERTICAL-ALIGN: middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
</TD>
</tr>
</table>
</div>
</div>
</div>
</div>
</form>
</body>
</html>

