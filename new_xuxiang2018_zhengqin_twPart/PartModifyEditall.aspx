<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page Language="c#" CodeBehind="PartModifyEditall.aspx.cs" MasterPageFile="~/DefaultSub.Master"AutoEventWireup="True" Inherits="ModuleWorkFlow.PartModifyEditall" MaintainScrollPositionOnPostback="True" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <div id="Wrapper">
            <div id="Header">
                
                    <div class="linebox">
                        <a href="#"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=str_MenuName%></a>
                    </div>
                    <div class="logout">
                        <a href="login.aspx"><%=Utility.Translate.translateString("登出")%></a>
                    </div>
                    <div class="clearbox"></div>
                </div>
            
           
          
            <div id="Container">
                
                <div id="Content">
                     <div  id="Menu">
                         <div class="menubox">
                             <div class="mod1">
                                 <ul>
                                     <li class="btn3">
                                         <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                                     </li>
                                     <li class="btn5">
                                         <asp:LinkButton ID="lnkbutton_view" runat="server" ToolTip="檢視"
                                             OnClick="lnkbutton_view_Click"></asp:LinkButton></li>
                                     <li class="btn2">
                                         <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" Visible="false" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                                     </li>
                                 </ul>
                             </div>
                             <div class="mod2"></div>
                             <div class="clearbox"></div>
                         </div>
                     </div>
                    <div class="space1"></div>
                    <div class="Textbox">
                         <asp:Label ID="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                         <asp:Label ID="lab_type" Visible="False" runat="server"></asp:Label>
                                  
                         <asp:Label ID="Label_HiddenFuncMode" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                         <asp:Label ID="Label_HiddenPartNo" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                         <asp:Label ID="lab_pageIndex" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                         <asp:Label ID="Label1" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                         <asp:Label ID="Label_CustomerId" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                         <asp:Label ID="lab_specCount" Visible="False" runat="server"></asp:Label>
                         <asp:Label ID="viewurl" runat="server" Visible="false"></asp:Label>
                         <div class="container mt-3">
                           

                            <div class="row mb-3">


                                 <div class="col-lg-4  d-flex">
                                    <%= Utility.Translate.translateString(System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"])%>:<asp:Label ID="Label2" runat="server"  CssClass="me-10"></asp:Label>
                                
                                    <asp:Label ID="Label_ModuleId" runat="server"></asp:Label>
                                </div>

                                <div class="col-lg-8  d-flex">
                                    <asp:Label ID="Label3" runat="server"  CssClass="me-10">圖名</asp:Label>：
                               
                                    <asp:Label ID="Label_partName" runat="server"></asp:Label>
                                </div>
                              


                               
                            </div>
                            <div class="row mb-3">
                                <div class="col-lg-4  d-flex">
                                    <asp:Label ID="Label9" runat="server"  CssClass="me-10">狀態</asp:Label>
                                    <asp:DropDownList ID="dpl_status" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                </div>
                                <div class="col-lg-4  d-flex">
                                    <asp:Label ID="Label4" runat="server"  CssClass="me-10">等級</asp:Label>
                                    <asp:DropDownList ID="ListBox_Priority" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                </div>
                                <div class="col-lg-4  d-flex">
                                    <asp:Label ID="Label5" runat="server"  CssClass="me-10">難度</asp:Label>
                                     <asp:DropDownList ID="dpl_difficuleLevel" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row mb-3">
                              <div class="col-lg-1  d-flex">
                                <asp:Label ID="Label6" runat="server" CssClass="me-10">圖號</asp:Label>
                              </div>
                              <div class="col-lg-11  d-flex">
                                    
                               

                                    <select id="list_partnos" runat="server"  multiple="true" class="form-control select2  text-start border-primary me-1"></select>
                                </div>
                               
                            </div>


                            <div class="row mb-3">

                                 <div class="col-lg-6  d-flex">
                                    <asp:Label ID="lab_dueDate" runat="server" Text="需求日期" CssClass="me-10"/>
                               
                                    <asp:TextBox ID="txt_dueDate" runat="server" CssClass="datetime-picker form-control custom-height-width text-start border-primary"></asp:TextBox>
                                 </div>
                               


                                   <div class="col-lg-6  d-flex">
                                       <asp:Label ID="Label22" runat="server" Text="備註" CssClass="me-10"></asp:Label>
                                  

                                       <asp:TextBox ID="txt_comment" runat="server" CssClass="form-control custom-height-width text-start border-primary"></asp:TextBox>
                                   </div>

     

                             </div>
                            <div class="row mb-3">
                                 <div class="col-lg-6  d-flex">
                                     <asp:Label ID="lab_processtype" runat="server" Text="標準工藝類型" CssClass="me-10"></asp:Label>
                                     <asp:DropDownList ID="dpl_processtype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dpl_processtype_SelectedIndexChanged" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                 </div>
                                 <div class="col-lg-6  d-flex">
                                     <asp:Label ID="lab_standprocess" runat="server" Text="標準工藝" CssClass="me-10"></asp:Label>
                                     <asp:DropDownList ID="dpl_standprocess" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dpl_standprocess_SelectedIndexChanged" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                 </div>
                            </div>
                            
                            <div class="row mb-3">
                               <div class="col-lg-12  d-flex">
                                   <asp:ScriptManager ID="script" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                     <div class="container mt-3">
                                        <div class="row g-0 mb-3">
                                             <div class="col-lg-4  d-flex">
                                                   <asp:Label ID="Label7" runat = "server" Text = "工藝類型"  CssClass="me-10"/>
                                                   <asp:DropDownList ID="dpl_processGroup" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1" OnSelectedIndexChanged="dpl_processGroup_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                             </div>
                                        </div>
                                        <div class="row g-0 mb-3">
                                            
                                            <div class="col-lg-3  d-flex">
                                                <div class="overflow-auto border border-primary" style="height: 400px; width:250px;" onscroll="saveScrollPosition()">
                                                    <div class="mt-3 ml-10 "> <!-- Bootstrap class for margin-top -->
                                                        
                                                            <asp:CheckBoxList ID="CheckBoxList_Process" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CheckBoxList_Process_SelectedIndexChanged" RepeatDirection="Vertical"  repeatcolumns="1" Width="200px"  RepeatLayout="Table" ></asp:CheckBoxList>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-9  d-flex">
                                                
                                                <asp:DataGrid ID="MainDataGrid" runat="server" CssClass="table table-striped table-bordered table-hover table-sm" style="height: 40px; overflow-y: auto;"  AutoGenerateColumns="False" AutoPostBack="True"  OnItemDataBound="MainDataGrid_ItemDataBound" OnItemCommand="MainDataGrid_ItemCommand" >
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary"  Wrap="true"></HeaderStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="選擇" ButtonType="PushButton"  CommandName="Select" ></asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label_OrderNo" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.processorder") %>'></asp:Label>
                                                                <asp:Label ID="Label_processno" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.processno") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>

                                                        <asp:TemplateColumn Visible="false">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lab_cbxrelation" runat="server" Text='<%# Utility.Translate.translateString("掛靠勾選") %>'></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbx_relation" Text="" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>



                                                        <asp:TemplateColumn Visible="false" HeaderText="工序編號">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container,"DataItem.ProcessID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn Visible="false" HeaderText="定義工序編號">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_CustomerProcessID" Text='<%# DataBinder.Eval(Container,"DataItem.CustomerProcessID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="工序" HeaderStyle-Width="100px">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_CustomerProcessName" Text='<%# DataBinder.Eval(Container,"DataItem.CustomerProcessName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="天"  HeaderStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="Dropdownlist_Day" CssClass="border-primary"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="小時"  HeaderStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="DropDownList_Hour" CssClass="border-primary"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="分鐘"  HeaderStyle-Width="50px">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="Dropdownlist_Minute" CssClass="border-primary"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="開始日期" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_startDate" runat="server" Width="80"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender ID="cal_startDate" runat="server" TargetControlID="txt_startDate"></ajaxToolkit:CalendarExtender>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="時"  Visible="false">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="dpl_startHour"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="結束日期"  Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_endDate" runat="server" Width="80"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender ID="cal_endDate" runat="server" TargetControlID="txt_endDate"></ajaxToolkit:CalendarExtender>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="時" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="dpl_endHour"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="返修" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbl_isunnormal" Text="" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="注意事項" HeaderStyle-Width="200px">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_processComment" runat="server" CssClass="form-control custom-htight border-primary"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="機台" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="dpl_processMachineid" runat="server"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                         <asp:TemplateColumn HeaderText="外發廠商">
                                                             <ItemTemplate>
                                                                 <asp:DropDownList ID="dpl_Supply" runat="server"></asp:DropDownList>
                                                             </ItemTemplate>
                                                         </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="抽檢率(%)" >
                                                            <ItemTemplate>
                                                                 <asp:TextBox Runat="server" ID="dg_txt_qcPercent" Width="40" Text='<%# DataBinder.Eval(Container, "DataItem.QCPercent") %>' />
                                                             </ItemTemplate>
                                                           </asp:TemplateColumn>
                                                        <asp:ButtonColumn Text="上移" ButtonType="PushButton" HeaderText="" CommandName="Upper" HeaderStyle-Width="40px"></asp:ButtonColumn>
                                                        <asp:ButtonColumn Text="下移" ButtonType="PushButton" CommandName="Lower" HeaderStyle-Width="40px"></asp:ButtonColumn>
                                                        <asp:ButtonColumn Text="刪除" ButtonType="PushButton" CommandName="Delete" HeaderStyle-Width="40px"></asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="processno" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_processno" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.processno") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn Visible="false" HeaderText="工序編號">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="dg_lab_StatusID" Text='<%# DataBinder.Eval(Container, "DataItem.StatusID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn Visible="false" HeaderText="工序類型">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="dg_lab_pricetype" Text='<%# DataBinder.Eval(Container, "DataItem.pricetype") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>

                                                    </Columns>
                                                </asp:DataGrid>
                                            </div>
                                           
                                        </div>
                                    </div>
                                  </ContentTemplate>
                                  <Triggers>
                                         <asp:AsyncPostBackTrigger ControlID="MainDataGrid" EventName="ItemCommand" />
                                         <asp:AsyncPostBackTrigger ControlID="CheckBoxList_Process" EventName="SelectedIndexChanged" />
                                       <asp:AsyncPostBackTrigger ControlID="dpl_processGroup" EventName="SelectedIndexChanged" />
                                  </Triggers>
                                  </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <table class="tbMessage" width="100%" align="center">
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
                                <td class="msg" width="85%">&nbsp;&nbsp;<asp:Label ID="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:Label>
                                    <asp:Label ID="Label_DeleteProcessNo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_HiddenSelectRow" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_DisableMaxOrder" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_HiddenPriority" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="lab_processinfo" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="lab_partcount" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="lab_partno_id" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="lab_zuli" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="lab_productdate" runat="server" Visible="false"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>
  <asp:Content ID="Content2" ContentPlaceHolderID="JSHolder" runat="server">
   
    <!-- Select2 -->
    <script src="plugins/select2/select2.full.min.js"></script>
    <link rel="stylesheet" href="plugins/select2/select2.min.css">
    <script>
        $(document).ready(function () {

            $('.relationButton').click(function () {
                var $this = $(this);
                var row = $this.parents('tr');
                alert("clicked " + row.index());
            });
        });

        $(function () {
            //Initialize Select2 Elements
            $(".select2").select2();


        });

        // 保存滚动位置
        function saveScrollPosition() {
            sessionStorage.setItem('scrollPosition', document.querySelector('.overflow-auto').scrollTop);
        }

        // 恢复滚动位置
        function restoreScrollPosition() {
            var scrollPos = sessionStorage.getItem('scrollPosition');
            if (scrollPos) {
                document.querySelector('.overflow-auto').scrollTop = scrollPos;
            }
        }

        // 页面加载后恢复滚动位置
        Sys.Application.add_load(function () {
            restoreScrollPosition();
        });
    </script>
</asp:Content>

