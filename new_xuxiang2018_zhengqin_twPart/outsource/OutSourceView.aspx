<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page Language="c#" CodeBehind="OutSourceView.aspx.cs" AutoEventWireup="false" MasterPageFile="~/DefaultSub.Master"  Inherits="ModuleWorkFlow.admin.OutSourceView" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="#"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="../images/arrow.png" />
                        <a href="#"><%=menuname %></a>
                    </div>
                    <div class="logout">
                        <a href="../login.aspx" target="_parent"><%=Utility.Translate.translateString("登出")%></a>
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
                                   <li class="btn1">
                                       <asp:LinkButton ID="lnkbutton_add" runat="server"
                                           ToolTip="新增 / add" OnClick="lnkbutton_add_Click">新增/add</asp:LinkButton>
                                   </li>
                                   <li class="btn5">
                                       <asp:LinkButton ID="lnkbutton_view" runat="server"
                                           ToolTip="檢視 / view" OnClick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
                                   </li>
                                   <li class="btn3">
                                       <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                                   </li>
                               </ul>
                           </div>
                           <div class="mod2">
                               <ul>
                                   <li class="btn8">
                                       <asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton></li>
                                   <%--<li class="btn7"><asp:LinkButton ID="lnk_schedule" runat="server" ToolTip=" 審核/check" OnClick="lnk_check_Click">審核</asp:LinkButton></li>--%>
                               </ul>
                           </div>
                           <div class="clearbox"></div>
                       </div>
                   </div>
                    <div class="space1"></div>
                    <div class="Textbox">
                        <div class="container mt-3">
                                <div class="row mb-3">
                                    <div class="col-lg-7  d-flex"> 
                                        <asp:Label ID="lab_module" runat="server" Text="子批號"  CssClass="me-10"></asp:Label>
                                        <asp:DropDownList ID="ListBox_ModuleList" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-large  text-start border-primary me-1"
                                            OnSelectedIndexChanged="ListBox_ModuleList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:TextBox ID="txt_moduleId" runat="server" OnTextChanged="txt_moduleId_TextChanged" AutoPostBack="true"  CssClass="form-control custom-heighter-width text-start border-primary"></asp:TextBox>
                                        <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="GetCompleteListNeedOver" ServicePath="../selectModuleId.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_moduleId"></ajaxToolkit:AutoCompleteExtender>
                                    </div>
                                   <div class="col-lg-4  d-flex"> 
                                        <asp:Label ID="lab_partno" runat="server" Text="圖號" CssClass="me-10"></asp:Label>
                                        <asp:TextBox ID="txt_partno" runat="server"  CssClass="form-control custom-heighter-width text-start border-primary"></asp:TextBox>
                                    </div>
                                  
                                </div>
                                <div class="row mb-3">
                                    <div class="col-lg-4  d-flex"> 
                                        <asp:Label ID="lab_sendDate" runat="server" Text="出廠日期"  CssClass="me-10"></asp:Label>
                                        <asp:TextBox ID="txt_sendDate" runat="server" OnTextChanged="txt_sendDate_TextChanged"  CssClass="datetime-picker form-control custom-heighter-width text-start border-primary" AutoPostBack="true" />
                                    </div>

                                   <div class="col-lg-4  d-flex"> 
                                        <asp:Label ID="lab_applyDate" runat="server" Text="回廠日期" CssClass="me-10"></asp:Label>
                                  
                                        <asp:TextBox ID="txt_applyDate" runat="server" OnTextChanged="txt_applyDate_TextChanged" AutoPostBack="true"  CssClass="datetime-picker form-control custom-heighter-width text-start border-primary" />
                                       
                                        <asp:Label ID="lab_Id" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lab_moduleId" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lab_retrun_designid" runat="server" Text="" Visible="false"></asp:Label>
                                    </div>
                                   <div class="col-lg-4  d-flex"> 
                                      <asp:Label ID="lab_process" runat="server" Text="工序"  CssClass="me-10"></asp:Label>
                                      <asp:DropDownList ID="dpl_process" runat="server" AutoPostBack="true" CssClass="form-select custom-heighter-width  text-start border-primary me-1"
                                          OnSelectedIndexChanged="dpl_process_SelectedIndexChanged">
                                      </asp:DropDownList>
                                  </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-lg-4  d-flex"> 
                                        <asp:Label ID="lab_outsourceApplyNo" runat="server" Text="申請單編號" Visible="false"></asp:Label>
                                        <asp:TextBox ID="txt_outsourceApplyNo" runat="server" Visible="true"></asp:TextBox>
                                        <asp:Label ID="lab_applyid" runat="server" Visible="false"></asp:Label>
                                    </div>
                                    <div class="col-lg-4  d-flex"> 
                                        <asp:Label ID="lab_comment" runat="server" Text=""  CssClass="me-10">備註</asp:Label>
                                        <asp:TextBox ID="txt_comment" runat="server"  CssClass="form-control custom-heighter-large text-start border-primary"></asp:TextBox>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <div class="box">


                        <asp:DataGrid ID="dg_OutSourceDetail" runat="server" CssClass="table table-striped table-bordered table-hover table-sm"  style="table-layout:fixed" 
                            AutoGenerateColumns="False"
                            OnPageIndexChanged="dg_OutSourceDetail_PageIndexChanged" OnItemDataBound="dg_OutSourceDetail_ItemDataBound" OnItemCommand="dg_OutSourceDetail_ItemCommand">
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" ></HeaderStyle>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                            <Columns>
                                <asp:TemplateColumn HeaderStyle-Width ="20px">
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="checkall" runat="server" AutoPostBack="false" onclick="javascript:SelectAll(this);"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="CheckBox_Select" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="子批" HeaderStyle-Width="100px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>' Style="white-space:normal; word-wrap:break-word; display:block;"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="圖號" HeaderStyle-Width="100px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="工序" HeaderStyle-Width="40px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessName")%>'  Style="white-space:normal; word-wrap:break-word; display:block;"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="序號" HeaderStyle-Width="40px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processOrder" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessOrder")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="出厂日期" HeaderStyle-Width="120px">

                                    <ItemTemplate>
                                        <asp:TextBox ID="dg_lab_sendDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SendDate","{0:yyyy-MM-dd HH:mm}")%>' CssClass="datetime-picker" Width="120"/>
                                      
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="回厂日期" HeaderStyle-Width="120px">

                                    <ItemTemplate>
                                        <asp:TextBox ID="dg_lab_requireDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireDate","{0:yyyy-MM-dd HH:mm}")%>' CssClass="datetime-picker" Width="120"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="備註" HeaderStyle-Width="80px">

                                    <ItemTemplate>
                                        <asp:TextBox ID="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'  Width="80"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="processId" Visible="false">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_processId" runat="server">工序</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="partNo" Visible="false">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_partNo" runat="server">partNo</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="outsourceid" Visible="false">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_outsourceid" runat="server">outsourceid</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_outsourceid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="供應商" HeaderStyle-Width="60px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_SupplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplyId")%>' Visible="false" />
                                        <asp:DropDownList ID="dg_drp_SupplyId" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="外包方式" HeaderStyle-Width="85px">

                                    <ItemTemplate>
                                        <asp:DropDownList ID="dg_drp_PartComment" runat="server" />
                                        <asp:Label ID="dg_lab_PartComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartComment")%>' Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="序號" HeaderStyle-Width="40px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_serno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SerNo")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="upload" Visible="false">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_upload" runat="server"></asp:Label>

                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        <asp:Button ID="bt_upload" runat="server" Text="Upload" CommandName="Upload" />
                                        <asp:Panel ID="dg_panel" Visible="false" runat="server">
                                            <asp:Label ID="lab_path" runat="server" Visible="false"></asp:Label>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:FileUpload ID="fu" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btn_upload" runat="server" Text="上傳" OnClick="btn_upload_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lab_file_1" runat="server"></asp:Label>
                                                        <asp:Button ID="btn_delete_1" runat="server" Text="删除" OnClick="btn_delete_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lab_file_2" runat="server"></asp:Label>
                                                        <asp:Button ID="btn_delete_2" runat="server" Text="删除" OnClick="btn_delete_Click" />
                                                    </td>
                                                </tr>
                                            </table>

                                            <br />

                                            <br />

                                            <br />


                                        </asp:Panel>

                                    </ItemTemplate>
                                </asp:TemplateColumn>

                            </Columns>
                            <PagerStyle Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid>


                    </div>
                    <div class="box">
                        <table width="100%" align="center" class="tbMessage" border="1">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="Label1" runat="server">提示信息</asp:Label></b>
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
