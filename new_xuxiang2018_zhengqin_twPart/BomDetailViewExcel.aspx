<%@ Page language="c#" Codebehind="BomDetailViewExcel.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.BomDetailViewExcel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
	<div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="#">生產管理</a>
<img src="images/arrow.png" />
<a href="#">BOM設定</a>
</div>
<div class="logout"><a href="login.aspx">登出</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" OnClick="lnkbutton_addinput_Click" ToolTip="新增/add">新增</asp:LinkButton>
</li>
<li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
</li>
<li class="btn5"><asp:LinkButton id="lnkbutton_view" runat="server" 
        ToolTip="檢視/vies" onclick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
</li>
</ul>
</div>
<div class="mod2"></div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="space1"></div>
<div class="Textbox">
<asp:label id="lab_User" runat="server" Visible="False"></asp:label>
<table width="700" border="0" align="center" cellpadding="5" cellspacing="0">
<tr>	
													<td><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>
                                                         <asp:Label ID="lab_bomstyle" runat="server" Visible="false"></asp:Label>
													</td>
    		
										            <td><asp:TextBox id="txt_moduleId" AutoPostBack="True" Runat="server" Width="320"></asp:TextBox></td>
                                                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" ServiceMethod="GetNewBOMList" ServicePath="selectModuleId.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_moduleId" ></ajaxToolkit:AutoCompleteExtender>
										            <td style="HEIGHT: 32px"><asp:label id="lab_Id" runat="server" Visible="False"></asp:label><asp:label id="lab_designNo" runat="server" Visible="False"></asp:label></td>
            										
									</tr>
									<tr>
										<td style="HEIGHT: 32px"><asp:label id="lab_creater" runat="server" Text="創建人"></asp:label></td>
										<td style="HEIGHT: 32px"><asp:label ID="txt_creater" runat="server" Text="admin"></asp:label>
										<%--<ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="GetCompleteList" ServicePath="selectUser.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_creater"></ajaxToolkit:AutoCompleteExtender>--%>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager></td>
										<td>創建日期</td>
										<td><asp:label id="lab_createDate" runat="server" Text=""></asp:label>
                                        </td>
									</tr>
									<tr>
										<td vAlign="top">BOM明細</td>
										<td colSpan="3"><asp:textbox id="txt_content" runat="server" TextMode="MultiLine" Height="200px" Width="688px"></asp:textbox></td>
									</tr>
									<tr>
										<td style="HEIGHT: 37px" colSpan="4">
											<hr>
										</td>
									</tr>
									<TR>
										<TD colSpan="4"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:label id="lab_menu" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存" Visible="false"></asp:button></TD>
									</TR>
									<tr>
										<td colSpan="4"></td>
									</tr>
</table>
<asp:datagrid id="dg_error" runat="server" AutoGenerateColumns="False" 
                                    CellSpacing="1"	CellPadding="0"  BorderWidth=0 CssClass="Grid">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                                    <ItemStyle BackColor="#ffffff"  BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
								<Columns>
									<asp:BoundColumn DataField="ErrorLine" HeaderText="行數"></asp:BoundColumn>
									<asp:BoundColumn DataField="ErrorMessage" HeaderText="錯誤原因"></asp:BoundColumn>
								</Columns>
							</asp:datagrid>
</div>
<div class="box"><table width="100%" align="center" class="tbMessage" border="1"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
</TD>
</TR>
</table>
</div>
</div>
</div>
</div>
</asp:Content>
