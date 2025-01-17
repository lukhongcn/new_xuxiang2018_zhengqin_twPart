<%@ Page language="c#" Codebehind="GroupGetStation.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.GroupGetStation" %>
<%@ Register TagPrefix="uc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>批量刷條碼</title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="jquery-ui-timepicker.css?v=0.2.2" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.ui.core.js"></script>
<script type="text/javascript" src="js/jquery.ui.timepicker.js?v=0.2.2"></script>
 <script language="javascript" type="text/javascript">
     function getFocus() {
         $("#txt_partCount").focus()

     }

 </script>
</head>
<body  onload="getFocus()"><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="defaultmain.aspx">生產管理</a>
<img src="images/arrow.png" />
<a href="#">現場報工</a>
</div>
<div class="logout"><a href="login.aspx" TARGET="_parent">登出</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1">
<ul>
<li class="btn3"><uc:OneClickButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</uc:OneClickButton></li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="清空/cancel">清空/cancel</asp:LinkButton>
</li>
</ul>
</div>
<div class="mod2">
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box"><table width="100%" align=center class=tbone border="0">
								<tr>
									<td><asp:label id="Label1" runat="server" text="條碼刷入"></asp:label></td>
									<td vAlign="top" colSpan="5">&nbsp; <asp:TextBox ID="txt_partCount" runat="server" AutoPostBack="true" OnTextChanged="txt_partCount_TextChanged"></asp:TextBox>
										<asp:label id="lab_hiddenActionId" runat="server" Visible="False"></asp:label><asp:label id="lab_repeate" runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenModuleId" runat="server" Visible="False"></asp:label><asp:label id="lab_hiddenPartNo" runat="server" Visible="False"></asp:label>
                                         <asp:label id="lab_doingProductNumber" runat="server" Visible="False"></asp:label>
										<asp:Label id="lab_partno" runat="server" Visible="False"></asp:Label></td>
                                        <asp:Label id="lab_moduleId" runat="server" Visible="False"></asp:Label></td>
									<td colSpan="3"><asp:label id="lab_hiddennumvalue" runat="server" Visible="False"></asp:label><asp:button id="btn_submit" runat="server" Text="提 交" Visible="False"></asp:button><asp:label id="lab_hiddenprocess" runat="server" Visible="False"></asp:label><asp:button id="Button1" runat="server" Text="清空" Visible="False"></asp:button><asp:label id="lab_hidden_machine" runat="server"></asp:label><asp:label id="lab_parnohidden" runat="server" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td><asp:dropdownlist id="drp_processlist" Runat="server" AutoPostBack="True"></asp:dropdownlist></td>
									<td><asp:label id="lab_user" runat="server" Text="操作者"></asp:label></td>
									<td><asp:label id="lab_user_value" runat="server" Visible="False" ForeColor="Red"></asp:label>
										<asp:Label id="lab_username" runat="server" ForeColor="Red"></asp:Label></td>
									<td><asp:label id="lab_action" runat="server" Text="操作"></asp:label></td>
									<td><asp:label id="lab_actionvalue" runat="server" ForeColor="Red"></asp:label></td>
									<td><asp:label id="lab_machine" runat="server" Text="機台編號"></asp:label></td>
                                       <asp:label id="lab_machine_ipaddress" runat="server" ForeColor="Red" Visible="false"></asp:label>
									<td><asp:label id="lab_machine_value" runat="server" ForeColor="Red"></asp:label>
                                        <asp:Label ID="lab_hiddenWorkHours" runat="server" Visible="false"></asp:Label>
                                         <asp:Label id="lab_combineStamp" Text="0" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                    <asp:CheckBox ID="chk_passed" runat="server" Text="是否通過" Visible="false" Checked="true" />
                                    </td> 
                                    <td> <asp:CheckBox ID="chk_combine" runat="server" Text="合併加工" OnCheckedChanged="chk_combine_CheckedChanged" AutoPostBack="true"  /></td>
                                   
								</tr>
							</table>
</div>
<div class="Textbox">
<table width="100%" border="0">
<tr>

<td valign="top" align="right">
<asp:datagrid id="MainDatagrid" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid" Width="90%">
<SelectedItemStyle HorizontalAlign="Left"></SelectedItemStyle>
<EditItemStyle HorizontalAlign="Left"></EditItemStyle>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<Columns>

<asp:BoundColumn HeaderText="序號"></asp:BoundColumn>



<asp:TemplateColumn HeaderText="選擇">
<HeaderTemplate><asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged" Checked="true" ></asp:CheckBox>
</HeaderTemplate>
<ItemTemplate><asp:CheckBox id="CheckBox_Select" runat="server" Checked="true" OnCheckedChanged="CheckBox_Select_CheckedChanged"></asp:CheckBox>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn>
<HeaderTemplate><asp:Label id="dg_header_moduleid" runat="server" Text="模具編號" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_moduleid" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Moduleid&quot;) %&gt;" ForeColor="red"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:BoundColumn DataField="PartNo_Id" HeaderText="零件號"></asp:BoundColumn>
<asp:BoundColumn DataField="ProcessOrder" HeaderText="工序編號" Visible="false"></asp:BoundColumn>
<asp:TemplateColumn>
<HeaderTemplate><asp:Label id="Label2" runat="server" Text="開始日期" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_StartCount" Runat="server" Text="&lt;%# Utility.tools.MinvalueDateTime(DataBinder.Eval(Container, &quot;DataItem.FactStartDate&quot;)) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="False">
<HeaderTemplate><asp:Label id="Label3" runat="server" Text="" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_processno" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessNo&quot;) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn>
<HeaderTemplate><asp:Label id="Label4" runat="server" Text="暫停時間" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_HoldOnCount" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.HoldOnHours&quot;) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn>
<HeaderTemplate><asp:Label id="lab_next" runat="server" Text="下一工站" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_NextStation" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.NextProcess&quot;) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="false">
<HeaderTemplate><asp:Label id="Label6" runat="server" Text="完成日期" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_FactFinishedCount" Runat="server" Text="&lt;%# Utility.tools.MinvalueDateTime(DataBinder.Eval(Container, &quot;DataItem.FactEndDate&quot;)) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="false">
<HeaderTemplate><asp:Label id="dg_header_statusid" runat="server" Text="狀態" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_statusid" Runat="server" Text="&lt;%# ModuleWorkFlow.lib.Methods.TranslateStatusName(DataBinder.Eval(Container, &quot;DataItem.StatusId&quot;).ToString()) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<%--<asp:TemplateColumn>
<HeaderTemplate><asp:Label id="dg_header_combineTime" runat="server" Text="合併時間" Visible="true" />
</HeaderTemplate>
<ItemTemplate><asp:Label ID="dg_lab_combineTime" Runat="server" ></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>--%>
<%--<asp:TemplateColumn  Visible="false">
<HeaderTemplate ><asp:Label id="dg_header_combineTimeStamp" runat="server" Text="combineTimeStame" Visible="false" />
</HeaderTemplate>
<ItemTemplate><asp:Label ID="dg_lab_combineTimeStame" Runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CombineTimeStamp") %>'></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>--%>





<asp:TemplateColumn Visible="false">
<HeaderTemplate><asp:Label id="dg_header_qcprocesslist" runat="server" Text="qcprocesslist" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_qcprocesslist" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessList&quot;) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="false">
<HeaderTemplate><asp:Label id="dg_header_qccustomerprocesslist" runat="server" Text="qccustomerprocesslist" />
</HeaderTemplate>
<ItemTemplate><asp:label ID="dg_lab_qccustomerprocesslist" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.CustomerProcessList&quot;) %&gt;"></asp:label>
</ItemTemplate>
</asp:TemplateColumn>

<asp:TemplateColumn Visible="false">
<HeaderTemplate><asp:Label id="dg_header_Ineligibility" runat="server" Text="Ineligibility" />
</HeaderTemplate>
<ItemTemplate><asp:TextBox ID="dg_lab_Ineligibility" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Ineligibility&quot;) %&gt;"></asp:TextBox>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="false">
<HeaderTemplate><asp:Label id="dg_header_Eligibility" runat="server" Text="合格數量" />
</HeaderTemplate>
<ItemTemplate><asp:TextBox ID="dg_lab_Eligibility" Runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Eligibility&quot;) %&gt;"></asp:TextBox>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="暫停描述"><ItemTemplate>
<asp:TextBox Width="100" Height="120" ID="txt_hold_comment" Runat="server"></asp:TextBox>
</ItemTemplate>
</asp:TemplateColumn>
</Columns>
</asp:datagrid>


</td>
</tr>
</table>

</div>

<div class="box"><table width="100%" align="center" class="tbMessage" border="1"><TR vAlign="middle">
<TD width="15%" style="height: 13px"><DIV align="center"><B><DIV align="center"><B>提示</B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%" style="height: 13px">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
</TD>
</TR>
</table>
</div>
</div>
</div>
</div>
</form>
</body>
</html>

