<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Page language="c#" Codebehind="StandBomDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.StandBomDetailList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx">系統設定</a>
<img src="images/arrow.png" />
<a href="#">產品類別標準件設定</a>
</div>
<div class="logout"><a href="login.aspx" TARGET="_parent">登出</a>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Menu"><div class="menubox">
<div class="mod1"><ul>
<li class="btn1"><a href="StandBomDetailView.aspx" title="新增 / add">新增/add</a>
</li>
<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
</li>
<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎?'); ">刪除/delete</asp:LinkButton>
</li>
</ul>
</div>
<div class="mod2"><ul>
<li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
</li>
</ul>
</div>
<div class="clearbox"></div>
</div>
</div>
<div id="Container"><div id="Content">
<div class="box"><table width="100%" align="center" class="tbone" border="0">
								<tr>
									<td>
										<div align="left">
												<asp:label id="lab_standprocesstype" text="產品類別" Runat="server"></asp:label>
                                                <asp:dropdownlist id="dpl_parentstandprocesstype" Runat="server" 
                                                    AutoPostBack="True" 
                                                    onselectedindexchanged="dpl_parentstandprocesstype_SelectedIndexChanged"></asp:dropdownlist>
												<asp:dropdownlist id="dpl_standprocesstype" Runat="server" AutoPostBack="True" OnSelectedIndexChanged="dpl_standprocesstype_SelectedIndexChanged"></asp:dropdownlist>
												</div>
									</td>
								</tr>
							</table>
</div>
<div class="Textbox">

<asp:datagrid id="Datagrid_bomdetail" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-sm" AllowCustomPaging="True" style="table-layout:fixed">
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
<Columns>
<asp:TemplateColumn>
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="partNo">
<HeaderTemplate><asp:Label id="Label2" runat="server" text="零件編號"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="Label3" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.PartNo&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_partNo" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.PartNo&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="partName">
<HeaderTemplate><asp:Label id="Label4" runat="server" text="零件名稱"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="Label5" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.PartName&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_partName" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.partName&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="spec">
<HeaderTemplate><asp:Label id="dg_header_spec" runat="server" text="規格(實際)"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_spec" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Spec&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_spec" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.Spec&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="uglyspec">
<HeaderTemplate><asp:Label id="dg_header_uglyspec" runat="server" text="規格(毛料)"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_uglyspec" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.UglySpec&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_uglyspec" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.UglySpec&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="materialId">
<HeaderTemplate><asp:Label id="dg_header_materialId" runat="server" text="材質"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="dg_lab_materialId" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.MaterialName&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:DropDownList id="dg_txt_materialId" Width="40" runat="server"></asp:DropDownList>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="requireCount">
<HeaderTemplate><asp:Label id="Label10" runat="server" text="數量"></asp:Label>
</HeaderTemplate>
<ItemTemplate>
<asp:Label id="Label11" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.RequireCount&quot;)%&gt;"/>
</ItemTemplate>
<EditItemTemplate><asp:textbox id="dg_txt_requireCount" Width="40" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.RequireCount&quot;) %&gt;"/>
</EditItemTemplate>
</asp:TemplateColumn>
<asp:BoundColumn DataField="Comment" HeaderText="備註"></asp:BoundColumn>
</Columns>
<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
<PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
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
</TD>
</TR>
</table>
</div>
</div>
</div>
</div>
</form>
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
</body>
</html>

