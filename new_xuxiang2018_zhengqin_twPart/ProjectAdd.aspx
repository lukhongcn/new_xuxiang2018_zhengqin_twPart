<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>


<%@ Page Language="c#" CodeBehind="ProjectAdd.aspx.cs"  MasterPageFile="~/DefaultSub.Master" AutoEventWireup="false" Inherits="ModuleWorkFlow.ProjectAdd" %>


<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="#"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=menuname %></a>
                    </div>
                    <div class="logout">
                        <a href="login.aspx" target="_parent"><%=Utility.Translate.translateString("登出")%></a>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Menu">
                <div class="menubox">
                    <div class="mod1">
                        <ul>
                            <li class="btn1">
                                <asp:LinkButton ID="lnkbutton_add" runat="server" OnClick="lnkbutton_add_Click" ToolTip="新增 / add">新增/add</asp:LinkButton>
                            </li>

                            <li>
                                <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click" CssClass="btn3e">儲存/save</asp:LinkButton>
                            </li>
                            <li class="btn5"><a href="ProjectList.aspx" title="檢視 / view" runat="server">檢視/view</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mod2"></div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Container">
                <div id="Content">
                    <div class="space1"></div>
                   <div class="box" style="height:auto">
                        <div class="container mt-3">
                            <div class="row mb-3">
                                <div class="col-lg-6  d-flex">
                                 <asp:Label ID="Label2" runat="server" CssClass="me-10 " >
                                    <%= Utility.Translate.translateString(System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]) %>
                                 </asp:Label>
         
                                 <asp:TextBox ID="txt_moduleid" runat="server" AutoPostBack="true" CssClass="form-control custom-height-width text-start border-primary"  OnTextChanged="txt_moduleid_TextChanged"></asp:TextBox>
                                 <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" ServiceMethod="GetCompleteListNeedOver" ServicePath="selectModuleId.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="20" TargetControlID="txt_moduleid"></ajaxToolkit:AutoCompleteExtender>
                                </div>
                                <div class="col-lg-6 d-flex">
                                    <asp:Label ID="Label3" runat="server" CssClass="me-10">返修廠批</asp:Label>
       
                                    <asp:TextBox ID="Textbox_XIUMOBIANHAO" runat="server" ReadOnly="True" CssClass="form-control custom-large-width text-start border-primary"  ></asp:TextBox>
                                    <asp:Label ID="lab_moduleid" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                                </div>
                                 
                            </div>

                            <div class="row mb-3">
                                <div class="col-lg-4 d-flex">
                                    <asp:Label ID="Label5" runat="server"  CssClass="me-10">客户交期</asp:Label>
                                    <asp:TextBox ID="txt_trydate0time" runat="server" CssClass="date-picker form-control custom-height-width text-start border-primary" />
                                </div>
                                <div class="col-lg-4 d-flex ">
                                    <asp:Label ID="Label6" runat="server"  CssClass="me-10">製造截止日</asp:Label>
                                    <asp:TextBox ID="txt_productEndDate" runat="server" CssClass="datetime-picker form-control custom-height-width text-start border-primary" />
                                </div>
                                <div class="col-lg-4 d-flex ">
                                  <asp:Label ID="Label7" runat="server"  CssClass="me-10">產品數量</asp:Label>
                                  <asp:TextBox ID="txt_productCount" runat="server" CssClass="form-control custom-height-width text-start border-primary" />
                                </div>
                            </div>
                    </div>
                    <!-- end bootstrap -->
                        
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                       
                                       
                                        <br>
                                      
                                       
                                  
                    </div>
                    <div class="box" style="height:auto">
                       
                        <asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="20" OnPageIndexChanged="MainDataGrid_PageIndexChanged" CssClass="table table-striped table-bordered table-hover table-sm" AllowCustomPaging="false" OnItemDataBound="MainDataGrid_ItemDataBound" style="table-layout:fixed"  >


                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
   
                        <Columns >
    
                        <asp:TemplateColumn  HeaderStyle-Wrap="false"  HeaderText="Select" HeaderStyle-Width ="10px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                        <HeaderTemplate > <input type="checkbox" id="selectAll" />
                        </HeaderTemplate>
                        <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                        </ItemTemplate>

                        <HeaderStyle Wrap="False"></HeaderStyle>
                        </asp:TemplateColumn>  
    
                           
                          
                        <asp:TemplateColumn HeaderText="PartNo" HeaderStyle-Width="30px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
	                        <HeaderTemplate>
		                        <%--<asp:label id="dg_header_moduleid" runat="server" Text='零件編號'/>--%>
                                產品編號
	                        </HeaderTemplate>
	                        <ItemTemplate>
		                        <asp:Label runat="server" ID="dg_lab_PartNo" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>'  >
		                        </asp:Label>
	                        </ItemTemplate>
                        </asp:TemplateColumn>
 
                        <asp:BoundColumn DataField="MaterialName" HeaderText="材質"  HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="20px"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="PartCount"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle">
                            <HeaderTemplate>
                                <%--<asp:Label id="dg_header_PartCount" runat="server" text="數量"></asp:Label>--%>
                                數量
                        </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label id="dg_lab_PartCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>'/>
                        </ItemTemplate>
                        </asp:TemplateColumn>

                        <asp:TemplateColumn HeaderText="PartName"  HeaderStyle-Width="30px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle"  >

                            <HeaderTemplate>
                                <%--<asp:Label id="dg_header_PartName" runat="server" text="零件名稱" ></asp:Label>--%>
                                產品名稱
                        </HeaderTemplate>
                            <ItemTemplate >
                                <asp:Label id="dg_lab_PartName" runat="server"   Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'/>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                      
                       
                      

                       
                        <asp:BoundColumn DataField="PartStatusDesc" HeaderText="狀態"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle" HeaderStyle-Width="20px"></asp:BoundColumn>
                      
                            <asp:TemplateColumn HeaderText="currentstatusid" HeaderStyle-Width="50px" HeaderStyle-Wrap="true" Visible="false">
	                        <ItemTemplate>
		                        <asp:Label runat="server" ID="dg_currentstatusid" Text='<%# DataBinder.Eval(Container, "DataItem.CurrentStatusid") %>'>
		                        </asp:Label>
	                        </ItemTemplate>

                        <HeaderStyle Wrap="True" Width="50px"></HeaderStyle>
                        </asp:TemplateColumn>



                        <asp:TemplateColumn HeaderText="ProductNumber"  HeaderStyle-Wrap="true"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="20px">
                            <HeaderTemplate>
                                   <asp:Label runat="server" ID="dg_lab_productNumber" Text='數量'>
                                    </asp:Label>
                            </HeaderTemplate>
	                        <ItemTemplate>
		                        <asp:TextBox runat="server" ID="dg_txt_ProductNumber" CssClass="form-control custom-number-width text-start border-primary" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>'>
		                        </asp:TextBox>
	                        </ItemTemplate>
                      
                        </asp:TemplateColumn>
                         <asp:TemplateColumn HeaderText="DueDate"  HeaderStyle-Wrap="true"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                <HeaderTemplate>
                                       <asp:Label runat="server" ID="dg_lab_dueDate" Text='需求日期'>
                                        </asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox runat="server" ID="dg_txt_dueDate" CssClass="datetime-picker form-control custom-height-width text-start border-primary" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>'>
                                    </asp:TextBox>
                                </ItemTemplate>
                            <HeaderStyle Wrap="True" Width="50px"></HeaderStyle>
                        </asp:TemplateColumn>

                        </Columns>


                        <PagerStyle   CssClass="table-primary" NextPageText="" PrevPageText="" >
                        </PagerStyle>
 
      
                        </asp:datagrid>

               

                        </div>
                    <div class="box">
                        <table id="Table3" width="100%" align="center" class="tbMessage" border="1">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="Label20" runat="server">提示</asp:Label></b>
                                            </div>
                                        </b>
                                    </div>
                                </td>
                                <td class="msg" width="85%">&nbsp;&nbsp;
                                    <asp:Label ID="Label_Message" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </asp:Content>
  <asp:Content ID="Content2" ContentPlaceHolderID="JSHolder" runat="server">

    <script >
        $("#MainDataGrid").treetable({ expandable: true });

        // Highlight selected row
        $("#MainDataGrid tbody").on("mousedown", "tr", function () {
            $(".selected").not(this).removeClass("selected");
            $(this).toggleClass("selected");

        });

        $('#selectAll').click(function (e) {
            var table = $(e.target).closest('table');
            $('td input:checkbox', table).prop('checked', this.checked);
        });

        $('.linkbutton').mouseover(function () {
            jQuery('#myModal').modal({
                show: true
            });
        });

        $('[data-load-remote]').on('click', function (e) {
            e.preventDefault();
            var $this = $(this);
            var remote = $this.data('load-remote');
            if (remote) {
                $($this.data('remote-target')).load(remote);
            }
        });

        //$("#myModal").on("show.bs.modal", function (e) {
        //    var link = $(e.relatedTarget);
        //    $(this).find(".modal-body").load(link.attr("href"));
        //});
        //$("#MainDataGrid tbody").on("dblclick", "tr", function () {
        //    var row = $(this).closest("tr");
        //    var processNo = $("span.processNo", row).text();
        //    alert("processNo=" + processNo);
        //    //$("#dialog").dialog();
        //});

        //$('#MainDataGrid td a.processno').each(function () {
        //    var $link = $(this);
        //    var $dialog = $('<div></div>')
        //		.load($link.attr('href') + ' #content')
        //		.dialog({
        //		    autoOpen: false,
        //		    title: $link.attr('title'),
        //		    width: 1000
        //		});

        //    $link.click(function() {
        //        $dialog.dialog('open');

        //        return false;
        //    });

        //    //$dialog.parent().appendTo(jQuery("form:first"));
        //    $dialog.parent().appendTo($("#mileParRelation"));

        //});
        // Drag & Drop Example Code
        /*$("#MainDataGrid .node, #MainDataGrid .parentnode").draggable({
            helper: "clone",
            opacity: .75,
            refreshPositions: true, // Performance?
            revert: "invalid",
            revertDuration: 300,
            scroll: true
        });

        $("#MainDataGrid .parentnode").each(function () {
            $(this).parents("#MainDataGrid tr").droppable({
                accept: ".node, .parentnode",
                drop: function (e, ui) {
                    var droppedEl = ui.draggable.parents("tr");
                    $("#MainDataGrid").treetable("move", droppedEl.data("ttId"), $(this).data("ttId"));
                    $("#fromnodeId").val(droppedEl.data("ttId"))
                    $("#tonodeId").val($(this).data("ttId"))
                },
                hoverClass: "accept",
                over: function (e, ui) {
                    var droppedEl = ui.draggable.parents("tr");
                    if (this != droppedEl[0] && !$(this).is(".expanded")) {
                        $("#MainDataGrid").treetable("expandNode", $(this).data("ttId"));
                    }
                }
            });
        });*/

    </script>
</asp:Content>
