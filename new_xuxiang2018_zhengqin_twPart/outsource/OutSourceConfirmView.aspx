<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<%@ Page Language="c#" CodeBehind="OutSourceConfirmView.aspx.cs" MasterPageFile="~/DefaultSub.Master" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceConfirmView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="defaultmain.aspx"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=title %></a>
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
                                     <li class="btn5">
                                         <asp:LinkButton ID="lnkbutton_view" runat="server"
                                             ToolTip="檢視 / view" OnClick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
                                     </li>

                                 </ul>
                             </div>
                             <div class="mod2">
                                 <ul>
                                     <li class="btn8">
                                         <asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                                     </li>
                                     <li class="btn3">
                                         <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                                     </li>

                                 </ul>
                             </div>
                             <div class="clearbox"></div>
                         </div>
                     </div>
                    <div class="box">
                        <asp:Label ID="lab_processid" runat="server" Visible="false"></asp:Label>
                         <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
                            <div class="container mt-3">
                                <div class="row mb-3">
                                    <div class="col-lg-7  d-flex"> 
                                        <asp:Label ID="Label3" runat="server" CssClass="me-10"><%= Utility.Translate.translateString(System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"])%></asp:Label>
                                        <asp:DropDownList ID="Dropdownlist_ModuleId" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-large  text-start border-primary me-1"></asp:DropDownList>
                                        <asp:TextBox ID="txt_moduleid" runat="server" CssClass="form-control custom-heighter-width text-start border-primary"></asp:TextBox>

                                    </div>


                                     <div class="col-lg-5  d-flex"> 
                                        <asp:Label ID="lab_partno" runat="server" Text="圖號"  CssClass="me-10"></asp:Label>
                                        <asp:TextBox ID="txt_partno" runat="server" CssClass="form-control custom-heighter-width text-start border-primary"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                      <div class="col-lg-4  d-flex"> 
                                         <asp:Label ID="lab_outsourceApplyNo" runat="server" Text="申請單編號" CssClass="me-10"></asp:Label>

                                         <asp:TextBox ID="txt_outsourceApplyNo" runat="server" CssClass="form-control custom-heighter-width text-start border-primary"></asp:TextBox>
                                     </div>
                                    <div class="col-lg-4  d-flex"> 
                                        <asp:Label ID="lab_sendDate" runat="server" Text="答覆交期" CssClass="me-10"></asp:Label>
                                        <asp:TextBox ID="txt_confirmDate" runat="server" OnTextChanged="txt_confirmDate_TextChanged" AutoPostBack="true" CssClass="datetime-picker form-control custom-heighter-width text-start border-primary"  />
                                    </div>
                                    <div class="col-lg-4  d-flex"> 
                                        <asp:Label ID="Label1" runat="server" Text="供應商" CssClass="me-10">
                                        </asp:Label><asp:DropDownList ID="drp_SupplyId" runat="server" OnSelectedIndexChanged="drp_SupplyId_SelectedIndexChanged" CssClass="form-select custom-heighter-width  text-start border-primary" AutoPostBack="true" />
                                    </div>

                                </div>
                        </div>
                    </div>

                      <div class="Textbox">

                        <asp:DataGrid ID="dg_OutSourceDetail" runat="server" CellPadding="2"  CssClass="table table-striped table-bordered table-hover table-sm" 
                           AutoGenerateColumns="False" style="table-layout:fixed" >
                             <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" ></HeaderStyle>
                             <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
                            <Columns>
                                <asp:TemplateColumn HeaderStyle-Width ="10px" >
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="checkall" runat="server" AutoPostBack="false" onclick="javascript:SelectAll(this);"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="CheckBox_Select" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="子批" HeaderStyle-Width="30px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>' Style="white-space:normal; word-wrap:break-word; display:block;"/>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="圖號" HeaderStyle-Width="30px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="工序" HeaderStyle-Width="20px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessName")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="序號" HeaderStyle-Width="10px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processOrder" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessOrder")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="回厂日期" HeaderStyle-Width="30px" Visible="false">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_requireDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireDate","{0:yyyy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="答覆交期" HeaderStyle-Width="30px">

                                    <ItemTemplate>
                                        <asp:TextBox ID="dg_lab_confirmDate" runat="server" CssClass="datetime-picker" Width="100px" Text='<%#DataBinder.Eval(Container, "DataItem.ConfirmDate","{0:yyyy-M-d HH:mm}")%>' />
                                      
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                               <asp:TemplateColumn HeaderText="可外发数量" HeaderStyle-Width="20px">
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_LeastCount" runat="server" Width="40"  />
                                    </ItemTemplate>
                               </asp:TemplateColumn>
                               <asp:TemplateColumn HeaderText="答覆數量" HeaderStyle-Width="20px">
                                  <ItemTemplate>
                                      <asp:TextBox ID="dg_txt_confirmCount" runat="server" Width="40" Text='<%#DataBinder.Eval(Container, "DataItem.ConfirmCount")%>' />
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
                                <asp:TemplateColumn HeaderText="供應商" HeaderStyle-Width="30px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_SupplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplyId")%>' Visible="false" />
                                        <asp:DropDownList ID="dg_drp_SupplyId" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="序號" HeaderStyle-Width="20px">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_serno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SerNo")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                 <asp:TemplateColumn HeaderText="外包方式" HeaderStyle-Width="30px">

                                     <ItemTemplate>
                                         <asp:DropDownList ID="dg_drp_PartComment" runat="server" />
                                         <asp:Label ID="dg_lab_PartComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartComment")%>' Visible="false" />
                                     </ItemTemplate>
                                 </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="processno" Visible="false">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_Processno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processno")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>


                            </Columns>
                            <PagerStyle Mode="NumericPages"></PagerStyle>
                        </asp:DataGrid>
                    </div>

                    <div class="box">
                        <table width="100%" align="center" class="tbMessage">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="Label2" runat="server">提示</asp:Label></b>
                                            </div>
                                </td>
                                <td class="msg" width="45%">
                                    <asp:Label ID="Label_Message" runat="server"></asp:Label>
                                </td>
                                <td class="msg" width="40%" align="left">
                                    <asp:Label ID="lab_color" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>

