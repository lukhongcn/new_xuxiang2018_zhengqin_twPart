<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="uc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>

<%@ Page language="c#" Codebehind="AssembleProcessOperatingDay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProcessOperatingDay"  MasterPageFile="~/DefaultSub.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
        <div id="Header">
            <div class="headbox">
                <div class="linebox">
                    <a href="defaultmain.aspx">生產管理</a>
                    <img src="images/arrow.png" />
                    <a href="#"><%=menuname%></a>
                </div>
                <div class="logout">
                    <a href="login.aspx" TARGET="_parent">登出</a>
                </div>
                 <div class="clearbox"></div>
            </div>
        </div>
   
    <div id="Container">
        <div id="Content">
             <div id="Menu">
                 <div class="menubox">
                     <div class="mod1"><ul>
                     <li class="btn3"><uc:OneClickButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click"  ReplaceTitleTo="請等待保存....." >儲存/save</uc:OneClickButton></li>
                     <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                     </li>

                     </ul>
                     </div>
                     <div class="clearbox"></div>
                 </div>
             </div>
            <div class="container mt-3 border border-primary">
                 <div class="container mt-3">
                     <asp:label id="lab_type" Text="" runat="server" Visible="false"/>
                     <div class="row mb-3">
                       

                        <div class="col-lg-6  d-flex">
                            <asp:Label ID="Label2" runat="server" CssClass="me-10">客戶</asp:Label>
                  
                            <asp:dropdownlist id="dpl_customer" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-10"></asp:dropdownlist>
                            <asp:Label ID="Label1" runat="server" CssClass="me-10"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></asp:Label>
                            <asp:dropdownlist id="dpl_module" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-10"></asp:dropdownlist>
                        </div>
                        <div class="col-lg-6  d-flex">
                           <asp:Label ID="Label3" runat="server" CssClass="me-10">廠批</asp:Label>
                           <asp:textbox id="txt_searchmodelid" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                        </div>
                       
                    </div>
                    <div class="row mb-3">
                         <div class="col-lg-6  d-flex">
                            <asp:Label ID="Label4" runat="server" CssClass="me-10">圖號</asp:Label>
                            <asp:textbox id="txt_partno" runat="server"  CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                        </div>
                          <div class="col-lg-6  d-flex">
                             <asp:Label ID="Label5" runat="server" CssClass="me-10">工序</asp:Label>
                  
                             <asp:dropdownlist id="drp_processlist" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
                  
                            </div>
                    </div>
                     <div class="row mb-3">
                        
                            <div class="col-lg-3  d-flex">
                                <asp:Label ID="Label6" runat="server" CssClass="me-10">部門</asp:Label>
                                <asp:DropDownList ID="dpl_alldepartmentid" Runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-1" ></asp:DropDownList>
                            </div>

                            <div class="col-lg-3  d-flex">
                                <asp:Label ID="Label7" runat="server" CssClass="me-10">員工</asp:Label>
                                <asp:dropdownlist id="dpl_alluserno" AutoPostBack="True" Runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
                            </div>

                            <div class="col-lg-3  d-flex">
                                <asp:Label ID="Label8" runat="server" CssClass="me-10">動作</asp:Label>
                                <asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-1">
                                <asp:ListItem Value="Ready">開始</asp:ListItem>
                                <asp:ListItem Value="Implementation">結束</asp:ListItem>
                                <asp:ListItem Value="Holdon">暫停</asp:ListItem>
                                </asp:dropdownlist>
                            </div>



                 
                  
                     </div>
                </div>
            </div>
            <div  class="container mt-3 border border-primary">
                <asp:datagrid id="MainDataGrid" runat="server" PageSize="30" AutoGenerateColumns="False"  CssClass="table table-striped table-bordered table-hover table-sm"  style="table-layout:fixed;width: 100%;"  AllowPaging="True"  AllowCustomPaging="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" ></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
                    <Columns>
                        <asp:TemplateColumn HeaderText="選擇"  HeaderStyle-Width="20px">
                        <HeaderTemplate><asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
                        </HeaderTemplate>
                        <ItemTemplate><asp:CheckBox id="CheckBox_Select" runat="server" Checked="False" AutoPostBack="true"></asp:CheckBox>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="用戶">
                        <HeaderStyle Width="100px"></HeaderStyle>
                        <ItemTemplate>
                        <asp:TextBox id="dpl_txt_user" runat="server" Width="100px"></asp:TextBox>
                        <asp:ImageButton id="dg_btn_user" runat="server" ImageUrl="images/search.GIF" Height="15" BorderStyle="None" ImageAlign="Bottom" OnClick="dg_btn_user_Click"></asp:ImageButton>
                        <asp:Label ID="dg_lab_departmentshow" runat="server" Text="部門" Visible="False"></asp:Label>
                        <asp:dropdownlist id="dg_dpl_departmentid" Visible="False" runat="server" AutoPostBack="True" onSelectedIndexChanged="dpl_departmentid_SelectedIndexChanged"></asp:dropdownlist>
                        <asp:Label ID="dg_lab_usershow" runat="server" Text="用戶" Visible="false"></asp:Label>
                        <asp:dropdownlist id="dg_dpl_user" Visible="False" runat="server" AutoPostBack="True" onSelectedIndexChanged="dpl_userno_SelectedIndexChanged"></asp:dropdownlist>
                        <asp:Label ID="lab_checkdg" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="dg_lab_truedepartmentid" runat="server" Visible="false"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="ModuleId" HeaderStyle-Width="70px">
                        <HeaderTemplate><asp:Label id="dg_header_moduleid" runat="server" Text="&lt;%# System.Configuration.ConfigurationSettings.AppSettings[&quot;ModuleIdShow&quot;]%&gt;"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate><asp:Label runat="server" ID="dg_lab_moduleid" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ModuleId&quot;) %&gt;"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateColumn>


                        <asp:TemplateColumn  HeaderText="PartNo_Id" HeaderStyle-Width="130px">
                        <HeaderTemplate><asp:Label id="Label_10" runat="server">圖號</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate>
                        <asp:Label id="dg_lab_partnoId" runat="server" Text='<%# new Utility.FileOperate().getJT(Convert.ToString(Eval("ModuleId")),Convert.ToString(Eval("PartNo_Id"))) %>'/>
                        </ItemTemplate>
                        </asp:TemplateColumn>



                        <asp:TemplateColumn  HeaderText="產品名稱" HeaderStyle-Width="130px"><ItemTemplate><asp:Label runat="server" Text="" ID="dg_lab_partno"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="CustomerProcessName" HeaderText="工序"  HeaderStyle-Width="100px"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="狀態" Visible="false"><ItemTemplate><asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusId") %>' ID="dg_lab_statusid"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                       <asp:TemplateColumn  HeaderText="ProcessOrder" HeaderStyle-Width="50px">
                           <HeaderTemplate>
                               <asp:Label runat="server" ID="dg_header_ProcessOrder" Text="工序號"></asp:Label>
                           </HeaderTemplate>
                           <ItemTemplate>
                               <asp:Label id="dg_lab_ProcessOrder" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessOrder") %>'></asp:Label>
                           </ItemTemplate>
                        </asp:TemplateColumn>
                       
                        <asp:BoundColumn  DataField="EachBatchCount" HeaderText="總數"  Visible="false"></asp:BoundColumn>
                        <asp:TemplateColumn  HeaderText="Count" HeaderStyle-Width ="70px">
                            <HeaderTemplate><asp:Label runat="server" ID="dg_header_Count" Text="數量" ></asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate><asp:Label id="dg_lab_Count" runat="server" ></asp:Label>
                            </ItemTemplate>
                         </asp:TemplateColumn>
                        <asp:TemplateColumn  HeaderText="QRCode" HeaderStyle-Width ="170px">
                          <HeaderTemplate><asp:Label runat="server" ID="dg_header_QRCode" Text="箱子條碼" ></asp:Label>
                          </HeaderTemplate>
                          <ItemTemplate><asp:TextBox id="dg_txt_QRCode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.QRCode") %>' CssClass="form-control custom-height-width text-start border-primary" ></asp:TextBox>
                          </ItemTemplate>
                       </asp:TemplateColumn>
                       <asp:TemplateColumn HeaderText="開始" HeaderStyle-Width ="110px">
                            <ItemTemplate>
                                <%# 
                                    Eval("FactStartDate") == DBNull.Value || (DateTime?)Eval("FactStartDate") == DateTime.MinValue
                                    ? "" 
                                    : Eval("FactStartDate", "{0:yyyy-MM-dd HH:mm}")
                                %>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                   
                        <asp:BoundColumn DataField="FactEndDate" HeaderText="實際結束" DataFormatString="{0:yyyy-MM-dd HH:mm}" Visible="false"></asp:BoundColumn>

                    

                        <asp:TemplateColumn  HeaderText="" Visible="false">
                            <ItemTemplate><asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessNo") %>' ID="dg_lab_ProcessNo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                       


                        <asp:BoundColumn Visible="False" DataField="StatusColor" HeaderText="color"></asp:BoundColumn>
                        <asp:TemplateColumn Visible="False" HeaderText="Comment">
                        <HeaderTemplate><asp:Label runat="server" ID="dg_header_comment" Text="備註"></asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate><asp:TextBox id="txt_comment" runat="server" Text=""></asp:TextBox>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn Visible="False" DataField="SameProcessNo" HeaderText="SameProcessNo"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="暫停描述" Visible="false"><ItemTemplate>
                        <asp:TextBox Width="100" Height="120" ID="txt_hold_comment" Runat="server"></asp:TextBox>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn  HeaderText="readyCount" Visible="false" >
                             <ItemTemplate><asp:Label id="dg_lab_readyCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ReadyCount") %>' ></asp:Label>
                             </ItemTemplate>
                         </asp:TemplateColumn>
                         <asp:TemplateColumn  HeaderText="startCount" Visible="false" >
     
                              <ItemTemplate><asp:Label id="dg_lab_startCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StartCount") %>' ></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateColumn>
                          <asp:TemplateColumn  HeaderText="holdCount" Visible="false" >
     
                            <ItemTemplate><asp:Label id="dg_lab_holdCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.HoldCount") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn  HeaderText="FinishedCount" Visible="false" >
     
                            <ItemTemplate><asp:Label id="dg_lab_finishedCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.FinishedCount") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>

                    </Columns>
                    <PagerStyle Mode="NumericPages" CssClass="table-primary" ></PagerStyle>
                </asp:datagrid>
            </div>
            <div  class="container mt-3 border border-primary">
                <table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
            <TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
            </DIV>
            </B>
            </DIV>
            </TD>
            <TD class="msg" width="85%">
            &nbsp;&nbsp;<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label>
                <asp:label id="lab_menuid" runat="server" Visible="false"></asp:label>
            </TD>
            </TR>
            </table>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
