<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page language="c#" Codebehind="PartList.aspx.cs"  AutoEventWireup="false" Inherits="ModuleWorkFlow.PartList" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title><%=title %></title>
<link href="css/amd.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/jquery.treetable.css" />
<link rel="stylesheet" href="css/jquery.treetable.theme.default.css" />
<link rel="stylesheet" href="plugins/bootstrap.5.2.3/css/bootstrap.min.css">
<link rel="stylesheet" href="plugins/jQuery-datetimepicker.2.4.5/jquery.datetimepicker.css" type="text/css" />
<script language="javascript" src="js/lib.js"></script>
<script type="text/javascript" src="plugins/JQuery.3.4.1/jquery-3.4.1.min.js"></script>
  
<script type="text/javascript" src="plugins/jQuery-datetimepicker.2.4.5/jquery.datetimepicker.js"></script>
<script type="text/Javascript" src="js/jquery.treetable.js"></script>
   
 <style>
    /* Custom styles for the date picker input */
    /*.date-picker {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 200px;
        font-size: 16px;
    }*/
     .custom-height-width {
        height: 30px; /* Set your desired height */
        padding: 6px 12px; /* Adjust padding as necessary */
        font-size: 14px; /* Adjust font size if needed */
        width: 160px;
    }

      .custom-large-width {
            height: 30px; /* Set your desired height */
            padding: 6px 12px; /* Adjust padding as necessary */
            font-size: 14px; /* Adjust font size if needed */
            width: 230px;
        }

       .custom-htight {
           height: 20px; /* Set your desired height */
          
       }

     .custom-number-width {
        height: 30px; /* Set your desired height */
        padding: 6px 12px; /* Adjust padding as necessary */
        font-size: 14px; /* Adjust font size if needed */
        width: 60px;
    }

      .custom-heighter-width {
            height: 30px; /* Set your desired height */
            padding: 6px 12px; /* Adjust padding as necessary */
            font-size: 14px; /* Adjust font size if needed */
            width: 160px;
        }

     .me-10 {
        margin-right: 10px; /* Set your desired right margin */
      }

       .ml-10 {
             margin-left: 10px; /* Set your desired right margin */
         }

     table.treetable tbody tr td {
         position: relative;
         padding-left: 0px;
         word-break: break-all;
         word-wrap: break-word
     }

    table.treetable tbody tr td span.indenter {
         position: relative;
         left: 5px;
         word-break: break-all;
         word-wrap: break-word
     }


</style>
</head>
<form id="Form1" method="post" runat="server">
<div id="Wrapper">
<div id="Header">
    <div class="headbox">
    <div class="linebox">
    <a href="defaultmain.aspx">生產管理</a>
    <img src="images/arrow.png" />
    <a href="#"><%=title %></a>
    </div>
    <div class="logout"><a href="login.aspx" TARGET="_parent">登出</a>
    </div>
    <div class="clearbox"></div>
    </div>
</div>




<div id="Container">
    <div id="Content">
        <div id="Menu">
            <div class="menubox">
            <div class="mod1"><ul>
            <li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
            </li>

            <li class="btn2"><asp:LinkButton ID="lnkbutton_edit_detail" runat="server"  ToolTip="明細編輯/edit"  OnClick="lnkButton_edit_detail_Click" Visible="false">明細編輯/edit</asp:LinkButton>
            </li>
            <li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server"  
                    ToolTip="新增 / add" onclick="lnkbutton_add_Click">新增/add</asp:LinkButton>
            </li>
            <li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎?'); ">刪除/delete</asp:LinkButton>
            </li>
            </ul>
            </div>
             
            <div class="mod2"><ul>
            <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
            </li>


            <li class="btn9"><asp:LinkButton ID="lnkbutton_printSheet" runat="server" ToolTip="列印/printer" OnClick="lnkbutton_print2_Click" Visible="false" >列印/printer</asp:LinkButton>
            </li>

            </ul>
            </div>
            <div class="clearbox"></div>
            </div>
        </div>
         <div class="space1"></div>
         <div class="box" style="height:auto">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
                <asp:label id="lab_page" runat="server"  Visible="false">︽计</asp:label>
            <asp:textbox id="txt_mod" runat="server" AutoPostBack="True" Width="50px" Visible="false">10</asp:textbox>
        

            <asp:dropdownlist id="dpl_page" runat="server" AutoPostBack="True" Visible="false"></asp:dropdownlist>
            <asp:label id="lab_pagecount" Visible="False" Runat="server"></asp:label>
            <asp:label id="lab_pageIndex" Visible="False" Runat="server"></asp:label>
            <asp:label id="lab_search" Visible="False" Runat="server"></asp:label>

            <asp:label id="lab_old_search" Visible="False" Runat="server"></asp:label>
            <asp:label id="lab_type" Visible="False" Runat="server"></asp:label>
   

            <asp:label id="lab_defaultpagecount" Text="20" Visible="false" Runat="server"></asp:label> <!--砞﹚–块︽计 -->


            <div class="container mt-3">
                <div class="row mb-3">
                    <div class="col-lg-12  d-flex">
                         <asp:Label ID="Label1" runat="server" CssClass="me-10"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>
                         </asp:Label><asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True" CssClass="form-select custom-large-width  text-start border-primary me-1" ></asp:dropdownlist>
                         <asp:textbox id="txt_moduleid" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>

                     </div>


                   
                </div>
                <div class="row mb-3">
                    <div class="col-lg-6  d-flex">
                        <asp:Label ID="lab_partno" runat="server" Text="圖號/版次" CssClass="me-10"></asp:Label>
                        <asp:textbox id="txt_partno" runat="server"  CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                    </div>

                     <div class="col-lg-6  d-flex">
                          <asp:Label ID="Label2" runat="server" CssClass="me-10"> 圖號/版次(不包含):</asp:Label>
                          <asp:textbox id="txt_expectedPartno" runat="server"  CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>

                    </div>
                 </div>
              </div>




       </div>

    
  
        <div class="box" style="height:auto">
            總數:<asp:label id="lab_count" runat="server" ></asp:label>
            <asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True" CssClass="table table-striped table-bordered table-hover table-sm" AllowCustomPaging="True" style="table-layout:fixed"  >


                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
   
            <Columns >
    
            <asp:TemplateColumn  HeaderStyle-Wrap="false"  HeaderText="Select" HeaderStyle-Width ="30px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate > <input type="checkbox" id="selectAll" />
            </HeaderTemplate>
            <ItemTemplate>
            <asp:CheckBox runat="server" ID="chk_datagrid" />
            </ItemTemplate>

            <HeaderStyle Wrap="False"></HeaderStyle>
            </asp:TemplateColumn>  
    
                <asp:TemplateColumn HeaderText="Id" HeaderStyle-Width ="30px" ItemStyle-Width="30px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                        <asp:Label ID="Id" runat="server" Text="序號" />
                    </HeaderTemplate> 
                    <ItemTemplate  >
                        <asp:CheckBox ID="dg_chk_combine" runat="server" />
                        <asp:Label runat="server" ID="dg_lab_Id" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>'></asp:Label>
                        <asp:Label runat="server" ID="dg_lnk_Id" Text='' Visible="false"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="ModuleId" HeaderStyle-Width="50px"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <HeaderTemplate >
                        <asp:Label ID="dg_header_moduleid" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'  />
                    </HeaderTemplate>
                    <ItemTemplate  >
                        <asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'  Style="white-space:normal; word-wrap:break-word; display:block;">
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="PartNo" HeaderStyle-Width="50px"  HeaderStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
	            <HeaderTemplate>
		
                    圖號/版次
	            </HeaderTemplate>
	            <ItemTemplate>
		            <asp:Label runat="server" ID="dg_lab_PartNo" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>' Style="white-space:normal; word-wrap:break-word; display:block;">
		            </asp:Label>
	            </ItemTemplate>
            </asp:TemplateColumn>
 
            <asp:BoundColumn DataField="MaterialName" HeaderText="材質"  HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="20px" ></asp:BoundColumn>
            <asp:TemplateColumn HeaderText="PartCount"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="20px" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle" >
                <HeaderTemplate>
       
                    箱數
            </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label id="dg_lab_PartCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="EachBatchCount"  HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle" >
                <HeaderTemplate>
       
                    數量
            </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label id="dg_lab_EachBatchCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.EachBatchCount") %>'/>
            </ItemTemplate>
            </asp:TemplateColumn>

            <asp:TemplateColumn HeaderText="PartName"  HeaderStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Middle"  >

                <HeaderTemplate>
        
                    圖名
            </HeaderTemplate>
                <ItemTemplate >
                    <asp:Label id="dg_lab_PartName" runat="server"   Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'/>
            </ItemTemplate>
            </asp:TemplateColumn>


            <asp:TemplateColumn HeaderText="PartdetailProcessno" Visible="false">
	            <ItemTemplate>
		            <asp:Label runat="server" ID="dg_lab_PartdetailProcessno" Text='<%# DataBinder.Eval(Container, "DataItem.PartdetailProcessno") %>'>
		            </asp:Label>
	            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="DataTTid" Visible="false">
	            <ItemTemplate>
		            <asp:Label runat="server" ID="dg_lab_DataTTid" Text='<%# DataBinder.Eval(Container, "DataItem.DataTTid") %>'>
		            </asp:Label>
	            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="ParentDataTTid" Visible="false">
	            <ItemTemplate>
		            <asp:Label runat="server" ID="dg_lab_ParentDataTTid" Text='<%# DataBinder.Eval(Container, "DataItem.ParentDataTTid") %>'>
		            </asp:Label>
	            </ItemTemplate>
            </asp:TemplateColumn>

            <asp:BoundColumn DataField="PriorityName" HeaderText="等級" HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="20px" ></asp:BoundColumn>
            <asp:BoundColumn DataField="PartStatusDesc" HeaderText="狀態"  HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="20px"></asp:BoundColumn>
            <asp:TemplateColumn HeaderText="SendDate"  Visible="false">
                  <HeaderTemplate><asp:Label id="dg_header_SendDate" runat="server" text="送件日期" ></asp:Label></HeaderTemplate>
                <ItemTemplate>
                    <asp:Label id="dg_lab_sendDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SendDate", "{0:MM-dd H:mm}") %>'/>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="DueDate"  HeaderStyle-Width="35px" ItemStyle-Width="35px" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                 <HeaderTemplate><asp:Label id="dg_header_dueDate" runat="server" text="需求日期"></asp:Label></HeaderTemplate>
                <ItemTemplate><asp:Label id="dg_lab_dueDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DueDate", "{0:MM-dd H:mm}") %>' Style="white-space:normal; word-wrap:break-word; display:block;"/>
            </ItemTemplate>
            </asp:TemplateColumn>




                <asp:TemplateColumn HeaderText="currentstatusid" HeaderStyle-Width="50px" HeaderStyle-Wrap="true" Visible="false">
	            <ItemTemplate>
		            <asp:Label runat="server" ID="dg_currentstatusid" Text='<%# DataBinder.Eval(Container, "DataItem.CurrentStatusid") %>'>
		            </asp:Label>
	            </ItemTemplate>

            <HeaderStyle Wrap="True" Width="50px"></HeaderStyle>
            </asp:TemplateColumn>


            </Columns>


            <PagerStyle   CssClass="table-primary" NextPageText="" PrevPageText="" >
            </PagerStyle>
 
      
            </asp:datagrid>

            <table style="BORDER-COLLAPSE: collapse" cellSpacing="0" width="100%"  >
            <tr>
            <td align="right">
                當前第:
                <asp:Label id ="lab_nowpage" runat ="server"></asp:Label>
                頁
                共:
            <asp:Label id="lab_totalpagte" runat ="server"  ></asp:Label>
                頁
            <%--<asp:linkbutton id="btnFirst" runat="server" CommandArgument="fist" ></asp:linkbutton>--%>&nbsp;&nbsp;
            <asp:linkbutton id="btnPrev" runat="server" Width="36px" CommandArgument="prev" OnClick ="btnPrev_Click">上一頁</asp:linkbutton>&nbsp;&nbsp;
            <asp:linkbutton id="btnNext" runat="server" CommandArgument="next" OnClick ="btnNext_Click">下一頁</asp:linkbutton>&nbsp;&nbsp;
            <%--<asp:linkbutton id="btnLast" runat="server" CommandArgument="last">ソ</asp:linkbutton>&nbsp;&nbsp;--%>
            <asp:label id="lblCurrentIndex" runat="server"></asp:label>/<asp:label id="lblPageCount" runat="server"></asp:label>&nbsp;&nbsp; 
            跳轉到<asp:TextBox id="txtGoPage" runat="server" Width="30px" ></asp:TextBox>
            <asp:Button id="btnGo" runat="server" Text="GO" CssClass="button" Width="29px" OnClick="btnGo_Click"></asp:Button></td>
            </tr>
            </table>

        </div>

    


        <div class="box" style="height:auto">
            <table width="100%" align="center" class="tbMessage"  ><TR vAlign="middle" >
            <TD width="15%" height="28"><%--<DIV align="center"><B>--%><DIV align="center"><B>提示</B>
            </DIV>
            </TD>
            <TD class="msg" width="45%">
            &nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
            </TD>
            <TD class="msg" width="40%" align="left">
            <asp:label id="lab_color" runat="server" visible="false"></asp:label>
            </TD>
            </TR>
            </table>
        </div>
    </div>
</div>

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
</form>
</body>
</html>