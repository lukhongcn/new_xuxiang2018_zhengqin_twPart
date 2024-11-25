<%//@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%//@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="BomDetailListCopy.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.BomDetailListCopy" %>
<%//@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%//@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%//@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>AMD</title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="defaultmain.aspx">生產管理</a>
<img src="images/arrow.png" />
<a href="#">BOM設定</a>
</div>
<div class="logout"><a href="login.aspx" TARGET="_parent">登出</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkbutton_addinput_Click" ToolTip="BOM匯入/BOM匯入">BOM匯入</asp:LinkButton>
</li>
<li class="btn2"><asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnkbutton_editinput_Click" ToolTip="BOM匯入編輯/BOM匯入編輯">編輯/edit</asp:LinkButton>
</li>

<li class="btn2"><asp:LinkButton ID="lnkbutton_edit_detail" runat="server" 
        ToolTip="明細編輯/edit" onclick="lnkbutton_edit_detail_Click">明細編輯/edit</asp:LinkButton>
</li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎?'); ">刪除/delete</asp:LinkButton>
</li>

<li class="btn6"><asp:LinkButton ID="lnkbutton_delete_detail" runat="server"  
        ToolTip="明細刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎?'); " 
        onclick="lnkbutton_delete_detail_Click">刪除/delete</asp:LinkButton>
</li>
</ul>
</div>
<div class="mod2"><ul>
<li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
</li>
<li class="btn9"><asp:LinkButton ID="lnkbutton_print" runat="server" ToolTip="列印/printer" OnClick="lnkbutton_print_Click" Visible="false">列印/printer</asp:LinkButton>
</li>
</ul>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box">
<asp:label id="lab_User"  Runat="server" Visible="false"></asp:label>
<table width="100%" align="center" class="tbone" border="0">
                                <tr>
                                <td>
												<asp:label id="lab_moduleId" text="模具編號" Runat="server"></asp:label>
												<asp:dropdownlist id="dpl_moduleId" Runat="server" AutoPostBack="True"></asp:dropdownlist>
												
                                                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="GetBOMListUnOver" ServicePath="selectModuleId.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_moduleId" ></ajaxToolkit:AutoCompleteExtender>
                                                <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
												<asp:button id="btn_search" Text="模具編號查詢" Runat="server" Visible="false"></asp:button>
									             <asp:textbox id="txt_moduleId" Runat="server"></asp:textbox></td>

                                    <td>
                                <asp:Label ID="lab_Customer" runat="server" text="客戶"></asp:Label>
                                <asp:DropDownList ID="dpl_Customer" runat="server" Width="150" AutoPostBack="true" OnSelectedIndexChanged="dpl_Costumer_OnSelectedIndexChanged"></asp:DropDownList>
                                        </td>
                                    <td>
                                <%= System.Configuration.ConfigurationSettings.AppSettings["ModuleShow"]%>
                                <asp:DropDownList ID="dpl_customerModuleId" runat="server" Width="150" ></asp:DropDownList>
                                
</td>


                                  

                                 
                                 
                                   
                                </tr>

								<tr>
									     


<td>                                                                                  
<asp:Label ID="lab_productname" runat="server" ></asp:Label>
<asp:textbox id="txt_productname" Runat="server" Width="100px"></asp:textbox>
</td>
                                <td>
備料狀態 <asp:dropdownlist id="dpl_NeedMerchindised" runat="server"></asp:dropdownlist>
</td>
<td>
                                 <div>
                                <asp:Label ID="lab_delete_moduleId" Text="需刪除模具編號" runat="server"></asp:Label>
                                <asp:textbox id="txt_delete_moduleId" Runat="server"></asp:textbox>
                                </div>
                                </td>


                                


                                 
								</tr>
                                <tr>
                                      
                                               
                               
                               
                                <td>創建時間範圍從:<asp:TextBox id="txt_from" runat="server" Width= "70"></asp:TextBox>
<ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_from"></ajaxToolkit:CalendarExtender>
到:<asp:TextBox id="txt_to" runat="server" Width= "70"></asp:TextBox>
<ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txt_to"></ajaxToolkit:CalendarExtender>
<asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
</td>	             

<td><asp:Label ID="lab_model" runat="server" Text="加工類型:"></asp:Label>
                                <asp:DropDownList ID="dpl_model" runat="server"></asp:DropDownList></td>

                                <td>零件編號:<asp:textbox id="Text_PartNo" Runat="server" Width="100px"></asp:textbox></td>
                                </tr>
                               
                                
                                
							</table>
</div>
<div class="Textbox"><asp:datagrid id="dg_BomDetail" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid" onitemdatabound="dg_BomDetail_ItemDataBound">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<Columns>
<asp:TemplateColumn>
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn Visible="False"><ItemTemplate>
<asp:Label id="dg_bomDesignNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="moduleId">
<HeaderTemplate><asp:Label id="dg_haeder_moduleId" runat="server" text='<%#System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="PartNo">
<HeaderTemplate><asp:Label id="dg_haeder_PartNo" runat="server" text="零件編號"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_PartNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="PartName">
<HeaderTemplate><asp:Label id="dg_haeder_PartName" runat="server" text="零件名称"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_PartName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="Spec">
<HeaderTemplate><asp:Label id="dg_haeder_Spec" runat="server" text="尺寸"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_Spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec","{0:d}")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="MaterialName">
<HeaderTemplate><asp:Label id="dg_haeder_MaterialName" runat="server" text="材質"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_MaterialName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="RequireCount">
<HeaderTemplate><asp:Label id="dg_haeder_RequireCount" runat="server" text="數量"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_RequireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="weight"  Visible="false">
<HeaderTemplate><asp:Label id="dg_haeder_Weight" runat="server" text="重量"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_Weight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Weight")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="requiredDate" Visible="false">
<HeaderTemplate><asp:Label id="dg_haeder_RequiredDate" runat="server" text="需求日期"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_RequiredDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequiredDate","{0:yy-MM-dd}")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="refSupplyId" Visible="false">
<HeaderTemplate><asp:Label id="dg_haeder_RefSuppply" runat="server" text="參考供應商"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_RefSuppply" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RefSupplyId")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="supplyId" Visible="false">
<HeaderTemplate><asp:Label id="dg_haeder_Suppply" runat="server" text="指定供應商"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_Suppply" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplyId")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="Request" Visible="false">
<HeaderTemplate><asp:Label id="dg_haeder_Request" runat="server"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_Request" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Request")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="Comment">
<HeaderTemplate><asp:Label id="dg_haeder_Comment" runat="server" text="備註"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_Comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
    <asp:TemplateColumn HeaderText="CreatedDate" >
<HeaderTemplate><asp:Label id="dg_haeder_CreatedDate" runat="server" text="創建日期"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_CreatedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreatedDate","{0:yy-MM-dd}")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="ChangedDate" >
<HeaderTemplate><asp:Label id="dg_haeder_ChangedDate" runat="server" text="最後修改日期"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_ChangedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ChangedDate","{0:yy-MM-dd}")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="BomApplySheetNo">
<HeaderTemplate><asp:Label id="dg_haeder_BomApplySheetNo" runat="server" text="審購單號"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_BomApplySheetNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomApplySheetNo")%>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="BomApplyStatus">
<HeaderTemplate><asp:Label id="dg_haeder_BomApplyStatus" runat="server" text="狀態"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_BomApplyStatus" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomApplyStatus")%>'/>
</ItemTemplate>
</asp:TemplateColumn>

</Columns>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<PagerStyle Mode="NumericPages" CssClass="tbPager"></PagerStyle>
</asp:datagrid>
</div>

<div class="box"><table width="100%" align="center" class="tbMessage" border="1"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示信息</B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
    <asp:Label ID="lab_bomstyle" runat="server" Visible="false"></asp:Label>
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

