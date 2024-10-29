<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>


<%@ Page Language="c#" CodeBehind="ProjectList.aspx.cs" MasterPageFile="~/DefaultSub.Master" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProjectList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="defaultmain.aspx"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=menuname %></a>
                    </div>
                    <div class="logout">
                        <a href="login.aspx" target="_parent"><%=Utility.Translate.translateString("登出")%></a>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
         
            <div id="Container">
                <div id="Content">
                       <div id="Menu">
                           <div class="menubox">
                               <div class="mod1">
                                   <ul>
                                       <li class="btn1"><a href="ProjectAdd.aspx" title="新增 / add" runat="server">新增/add</a>
                                       </li>
                   
                                       <li class="btn6">
                                           <asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm(deleteConfirm); ">刪除/delete</asp:LinkButton>
                                       </li>
                                       <li class="btn2">
                                           <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit" Visible="false">編輯/edit</asp:LinkButton>
                                       </li>
                                       <li class="btn5">
                                           <asp:LinkButton ID="lnkbutton_view" runat="server" OnClick="lnkbutton_view_Click" ToolTip="檢視/view" Visible="false">檢視/view</asp:LinkButton>
                                       </li>
                                   </ul>
                               </div>
                               <div class="mod2">
                                   <ul>
                                       <li class="btn8">
                                           <asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                                       </li>
                  
                                       <li class="btn11">
                                           <asp:LinkButton ID="lnkbutton_mail" runat="server" ToolTip="&#21457;mail/mail" OnClick="lnkbutton_mail_Click" Visible="false">發mail/mail</asp:LinkButton>
                                       </li>
                                   </ul>
                               </div>
                               <div class="clearbox"></div>
                           </div>
                     </div>
                    <div class="box">
                         <div class="container mt-3">
                             <div class="row mb-3">
                           
                                    <div class="col-lg-12  d-flex">
                                   
                                        <asp:Label ID="Label_ModuleId" runat="server"  CssClass="me-10"> <%= Utility.Translate.translateString(System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]) %></asp:Label>
                                       <asp:TextBox ID="TextBox_key" runat="server" CssClass="form-control custom-full-width text-start border-primary"></asp:TextBox>
                                        <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="GetCompleteListNeedOver" ServicePath="selectModuleId.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="TextBox_key"></ajaxToolkit:AutoCompleteExtender>
                                    
                                       </div>

                            </div>
                        </div>
                    </div>
                    <div class="Textbox">
                        <asp:DataGrid ID="MainDataGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-striped table-bordered table-hover table-sm" PageSize="10">
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary"  Wrap="true"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>

                                    <HeaderTemplate>
                                        <asp:CheckBox ID="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="DisProjectid" HeaderText="模具變更編號" Visible="False"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="moduleid" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_moduleid" runat="server" Text='<%# Utility.Translate.translateString(System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"])%>'></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="返修單子批" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="dg_lab_modifyid" Text='<%# DataBinder.Eval(Container, "DataItem.ModifyId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="製造截止日" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="dg_lab_ProductEndDate" Text='<%# DataBinder.Eval(Container, "DataItem.ProductEndDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="Try0" HeaderText="實際交貨日" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
                              
                                <asp:TemplateColumn HeaderText="創建日期" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="dg_lab_createdate" Text='<%# DataBinder.Eval(Container, "DataItem.createdate","{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle Mode="NumericPages" CssClass="table-primary"></PagerStyle>
                        </asp:DataGrid>
                    </div>
                    <div class="box">
                        <table id="Table3" width="100%" align="center" class="tbMessage" border="1">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="Label8" runat="server">提示</asp:Label></b>
                                            </div>
                                        </b>
                                    </div>
                                </td>
                                <td class="msg" width="85%">&nbsp;&nbsp;<asp:Label ID="Label_Message" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

