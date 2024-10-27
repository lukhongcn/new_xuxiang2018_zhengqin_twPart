<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page Language="c#" CodeBehind="PartModifyEditall.aspx.cs" MasterPageFile="~/DefaultSub.Master"AutoEventWireup="True" Inherits="ModuleWorkFlow.PartModifyEditall" MaintainScrollPositionOnPostback="True" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <div id="Wrapper">
            <div id="Header">
                
                    <div class="linebox">
                        <a href="#"><%=Utility.Translate.translateString("�Ͳ��޲z")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=str_MenuName%></a>
                    </div>
                    <div class="logout">
                        <a href="login.aspx"><%=Utility.Translate.translateString("�n�X")%></a>
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
                                         <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="�x�s/save" OnClick="lnkbutton_save_Click">�x�s/save</asp:LinkButton>
                                     </li>
                                     <li class="btn5">
                                         <asp:LinkButton ID="lnkbutton_view" runat="server" ToolTip="�˵�"
                                             OnClick="lnkbutton_view_Click"></asp:LinkButton></li>
                                     <li class="btn2">
                                         <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" Visible="false" ToolTip="�s��/edit">�s��/edit</asp:LinkButton>
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
                                    <asp:Label ID="Label3" runat="server"  CssClass="me-10">�ϦW</asp:Label>�G
                               
                                    <asp:Label ID="Label_partName" runat="server"></asp:Label>
                                </div>
                              


                               
                            </div>
                            <div class="row mb-3">
                                <div class="col-lg-4  d-flex">
                                    <asp:Label ID="Label9" runat="server"  CssClass="me-10">���A</asp:Label>
                                    <asp:DropDownList ID="dpl_status" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                </div>
                                <div class="col-lg-4  d-flex">
                                    <asp:Label ID="Label4" runat="server"  CssClass="me-10">����</asp:Label>:
                                    <asp:DropDownList ID="ListBox_Priority" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                </div>
                                <div class="col-lg-4  d-flex">
                                    <asp:Label ID="Label5" runat="server"  CssClass="me-10">����</asp:Label>:
                                     <asp:DropDownList ID="dpl_difficuleLevel" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row mb-3">
                              <div class="col-lg-1  d-flex">
                                <asp:Label ID="Label6" runat="server" CssClass="me-10">�s��s��</asp:Label>
                              </div>
                              <div class="col-lg-11  d-flex">
                                    
                               

                                    <select id="list_partnos" runat="server"  multiple="true" class="form-control select2  text-start border-primary me-1"></select>
                                </div>
                               
                            </div>


                            <div class="row mb-3">

                                 <div class="col-lg-6  d-flex">
                                    <asp:Label ID="lab_dueDate" runat="server" Text="�ݨD����G" CssClass="me-10"/>
                               
                                    <asp:TextBox ID="txt_dueDate" runat="server" CssClass="datetime-picker form-control custom-height-width text-start border-primary"></asp:TextBox>
                                 </div>
                               


                                   <div class="col-lg-6  d-flex">
                                       <asp:Label ID="Label22" runat="server" Text="�Ƶ�:" CssClass="me-10"></asp:Label>
                                  

                                       <asp:TextBox ID="txt_comment" runat="server" CssClass="form-control custom-height-width text-start border-primary"></asp:TextBox>
                                   </div>

                               





                             </div>
                          
                            
                            <div class="row mb-3">
                               <div class="col-lg-12  d-flex">
                                     <div class="container mt-3">
                                        <div class="row g-0 mb-3">
                                            <div class="col-lg-3  d-flex">
                                                <div class="overflow-auto border border-primary" style="height: 360px; width:220px;">
                                                    <div class="mt-3 ml-10 "> <!-- Bootstrap class for margin-top -->
                                                        
                                                            <asp:CheckBoxList ID="CheckBoxList_Process" runat="server" AutoPostBack="True" RepeatDirection="Vertical"  repeatcolumns="1" Width="200px"  RepeatLayout="Table" ></asp:CheckBoxList>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-9  d-flex">
                                                <asp:ScriptManager ID="script" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
                                                <asp:DataGrid ID="MainDataGrid" runat="server" CssClass="table table-striped table-bordered table-hover table-sm" style="height: 40px; overflow-y: auto;"  AutoGenerateColumns="False" OnItemDataBound="MainDataGrid_ItemDataBound">
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary"  Wrap="true"></HeaderStyle>
                                                    <Columns>
                                                        <asp:ButtonColumn Text="���" ButtonType="PushButton"  CommandName="Select" ></asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="�[�u����">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label_OrderNo" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.processorder") %>'></asp:Label>
                                                                <asp:Label ID="Label_processno" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.processno") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>

                                                        <asp:TemplateColumn Visible="false">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lab_cbxrelation" runat="server" Text='<%# Utility.Translate.translateString("���a�Ŀ�") %>'></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbx_relation" Text="" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>



                                                        <asp:TemplateColumn Visible="false" HeaderText="�u�ǽs��">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_ProcessID" Text='<%# DataBinder.Eval(Container,"DataItem.ProcessID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn Visible="false" HeaderText="�w�q�u�ǽs��">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_CustomerProcessID" Text='<%# DataBinder.Eval(Container,"DataItem.CustomerProcessID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="�u�ǦW��">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="Label_CustomerProcessName" Text='<%# DataBinder.Eval(Container,"DataItem.CustomerProcessName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="��">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="Dropdownlist_Day" CssClass="border-primary"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="�p��">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="DropDownList_Hour" CssClass="border-primary"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="����">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="Dropdownlist_Minute" CssClass="border-primary"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="�}�l���" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_startDate" runat="server" Width="80"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender ID="cal_startDate" runat="server" TargetControlID="txt_startDate"></ajaxToolkit:CalendarExtender>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="��"  Visible="false">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="dpl_startHour"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="�������"  Visible="false">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_endDate" runat="server" Width="80"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender ID="cal_endDate" runat="server" TargetControlID="txt_endDate"></ajaxToolkit:CalendarExtender>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="��" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:DropDownList runat="server" ID="dpl_endHour"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="���" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbl_isunnormal" Text="" runat="server"></asp:CheckBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="�`�N�ƶ�">
                                                            <ItemTemplate>
                                                                <asp:TextBox ID="txt_processComment" runat="server" CssClass="form-control custom-htight border-primary"></asp:TextBox>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="���x" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="dpl_processMachineid" runat="server"></asp:DropDownList>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:ButtonColumn Text="�W��" ButtonType="PushButton" HeaderText="" CommandName="Upper"></asp:ButtonColumn>
                                                        <asp:ButtonColumn Text="�U��" ButtonType="PushButton" CommandName="Lower"></asp:ButtonColumn>
                                                        <asp:ButtonColumn Text="�R��" ButtonType="PushButton" CommandName="Delete"></asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="processno" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_processno" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.processno") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn Visible="false" HeaderText="�u�ǽs��">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="dg_lab_StatusID" Text='<%# DataBinder.Eval(Container, "DataItem.StatusID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn Visible="false" HeaderText="�u������">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="dg_lab_pricetype" Text='<%# DataBinder.Eval(Container, "DataItem.pricetype") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>

                                                    </Columns>
                                                </asp:DataGrid>
                                            </div>
                                        </div>
                                    </div>
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
                                                    <asp:Label ID="Label8" runat="server">����</asp:Label></b>
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

      
    </script>
</asp:Content>
