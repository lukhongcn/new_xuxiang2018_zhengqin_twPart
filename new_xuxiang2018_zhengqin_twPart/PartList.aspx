<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page language="c#" Codebehind="PartList.aspx.cs" MasterPageFile="~/DefaultSub.Master" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
<div id="Wrapper">
<div id="Header">
    <div class="headbox">
    <div class="linebox">
    <a href="defaultmain.aspx">�Ͳ��޲z</a>
    <img src="images/arrow.png" />
    <a href="#"><%=title %></a>
    </div>
    <div class="logout"><a href="login.aspx" TARGET="_parent">�n�X</a>
    </div>
    <div class="clearbox"></div>
    </div>
</div>
<div id="Menu">
    <div class="menubox">
    <div class="mod1"><ul>
    <li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="�s��/edit">�s��/edit</asp:LinkButton>
    </li>

    <li class="btn2"><asp:LinkButton ID="lnkbutton_edit_detail" runat="server"  ToolTip="���ӽs��/edit"  OnClick="lnkButton_edit_detail_Click">���ӽs��/edit</asp:LinkButton>
    </li>
    <li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server"  
            ToolTip="�s�W / add" onclick="lnkbutton_add_Click">�s�W/add</asp:LinkButton>
    </li>
    <li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="�R��/delete" OnClientClick="return   confirm( '�z�T�w�n�R����?'); ">�R��/delete</asp:LinkButton>
    </li>
    </ul>
    </div>
    <div class="mod2"><ul>
    <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="�j�M/search" OnClick="lnkbutton_search_Click">�j�M/search</asp:LinkButton>
    </li>


    <li class="btn9"><asp:LinkButton ID="lnkbutton_printSheet" runat="server" ToolTip="�C�L�s�{��/printer" OnClick="lnkbutton_print2_Click" >�C�L�s�{��/printer</asp:LinkButton>
    </li>

    </ul>
    </div>
    <div class="clearbox"></div>
    </div>
</div>



<div id="Container">
    <div id="Content">
     <div class="space1"></div>
     <div class="box" style="height:auto">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
            <asp:label id="lab_page" runat="server"  Visible="false">���</asp:label>
        <asp:textbox id="txt_mod" runat="server" AutoPostBack="True" Width="50px" Visible="false">10</asp:textbox>
        

        <asp:dropdownlist id="dpl_page" runat="server" AutoPostBack="True" Visible="false"></asp:dropdownlist>
        <asp:label id="lab_pagecount" Visible="False" Runat="server"></asp:label>
        <asp:label id="lab_pageIndex" Visible="False" Runat="server"></asp:label>
        <asp:label id="lab_search" Visible="False" Runat="server"></asp:label>

        <asp:label id="lab_old_search" Visible="False" Runat="server"></asp:label>
        <asp:label id="lab_type" Visible="False" Runat="server"></asp:label>
   

        <asp:label id="lab_defaultpagecount" Text="20" Visible="false" Runat="server"></asp:label> <!--�]�w�C����X��� -->


        <div class="container mt-3">
            <div class="row mb-3">
                <div class="col-lg-6  d-flex">
                     <asp:Label ID="Label1" runat="server" CssClass="me-10"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>
                     </asp:Label><asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True" CssClass="form-select custom-height-width  text-end border-primary me-1" ></asp:dropdownlist>
                     <asp:textbox id="txt_moduleid" runat="server" CssClass="form-control custom-height-width text-end border-primary"></asp:textbox>

                 </div>


                <div class="col-lg-6  d-flex">
                    <asp:Label ID="lab_productname" runat="server" CssClass="me-10"></asp:Label>
                    <asp:textbox id="txt_productname" Runat="server"  CssClass="form-control custom-height-width text-end border-primary"></asp:textbox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-lg-6  d-flex">
                    <asp:Label ID="lab_partno" runat="server" Text="���~�s�X" CssClass="me-10"></asp:Label>
                    <asp:textbox id="txt_partno" runat="server"  CssClass="form-control custom-height-width text-end border-primary"></asp:textbox>
                </div>

                 <div class="col-lg-6  d-flex">
                      <asp:Label ID="Label2" runat="server" CssClass="me-10"> ���~�s���]���]�t):</asp:Label>
                      <asp:textbox id="txt_expectedPartno" runat="server"  CssClass="form-control custom-height-width text-end border-primary"></asp:textbox>

                </div>
             </div>
          </div>




        </div>

    </div>
  
<div class="box" style="height:auto">
    �`�ơG<asp:label id="lab_count" runat="server" ></asp:label>
<asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True" BorderWidth="0px" CssClass="table table-striped table-bordered table-hover table-sm" AllowCustomPaging="True" style="table-layout:fixed"  >


    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
   
<Columns >
    
<asp:TemplateColumn  HeaderStyle-Wrap="false"  HeaderText="Select" HeaderStyle-Width ="40px"  HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left">
<HeaderTemplate > <input type="checkbox" id="selectAll" />
</HeaderTemplate>
<ItemTemplate>
<asp:CheckBox runat="server" ID="chk_datagrid" />
</ItemTemplate>

<HeaderStyle Wrap="False"></HeaderStyle>
</asp:TemplateColumn>  
    
    <asp:TemplateColumn   HeaderText="Id" HeaderStyle-Width="10%">
        <HeaderTemplate>
            <asp:Label ID="Id" runat="server" Text='�Ǹ�' />
        </HeaderTemplate> 
        <ItemTemplate  >
            <asp:CheckBox ID="dg_chk_combine" runat="server" />
            <asp:Label runat="server" ID="dg_lab_Id" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>'></asp:Label>
            <asp:Label runat="server" ID="dg_lnk_Id" Text='' Visible="false"></asp:Label>
        </ItemTemplate>
    </asp:TemplateColumn>
    <asp:TemplateColumn HeaderText="ModuleId" HeaderStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" ItemStyle-Wrap="true">
        <HeaderTemplate >
            <asp:Label ID="dg_header_moduleid" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'  />
        </HeaderTemplate>
        <ItemTemplate  >
            <asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>' >
            </asp:Label>
        </ItemTemplate>
    </asp:TemplateColumn>
<asp:TemplateColumn HeaderText="PartNo" HeaderStyle-Width="120px"  HeaderStyle-HorizontalAlign="Center" >
	<HeaderTemplate>
		<%--<asp:label id="dg_header_moduleid" runat="server" Text='�s��s��'/>--%>
        �s��s��
	</HeaderTemplate>
	<ItemTemplate>
		<asp:Label runat="server" ID="dg_lab_PartNo" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>' Width="120px" >
		</asp:Label>
	</ItemTemplate>
</asp:TemplateColumn>
 
<asp:BoundColumn DataField="MaterialName" HeaderText="����"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ></asp:BoundColumn>
<asp:TemplateColumn HeaderText="PartCount"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
    <HeaderTemplate>
        <%--<asp:Label id="dg_header_PartCount" runat="server" text="�ƶq"></asp:Label>--%>
        �ƶq
</HeaderTemplate>
    <ItemTemplate>
        <asp:Label id="dg_lab_PartCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>'/>
</ItemTemplate>
</asp:TemplateColumn>

<asp:TemplateColumn HeaderText="PartName"  HeaderStyle-Width="60px" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" >

    <HeaderTemplate>
        <%--<asp:Label id="dg_header_PartName" runat="server" text="�s��W��" ></asp:Label>--%>
        ���~�W��
</HeaderTemplate>
    <ItemTemplate >
        <asp:Label id="dg_lab_PartName" runat="server"   Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'/>
</ItemTemplate>
</asp:TemplateColumn>
<%--<asp:BoundColumn DataField="PartCount" HeaderText="�ƶq"></asp:BoundColumn>
<asp:BoundColumn DataField="PartName" HeaderText="�W��" ItemStyle-Width="10px" ItemStyle-Wrap="true"></asp:BoundColumn>--%>
<asp:TemplateColumn HeaderText="�Ϥ�" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ><ItemTemplate>
<asp:Label ID="picture" Text="" runat="server" Width="80px" Height="80px"></asp:Label>
<asp:Label id="dg_img_Picture" Text='<%# DataBinder.Eval(Container, "DataItem.PartPicture")%>' runat="server" Visible="False"></asp:Label>
</ItemTemplate>
</asp:TemplateColumn>

<asp:TemplateColumn HeaderText="ProcessNeedMinutes"  HeaderStyle-Width="180px" >
        <HeaderTemplate><asp:Label id="dg_header_ProcessNeedMinutes" runat="server" text="�u�����u"></asp:Label>
</HeaderTemplate>
<ItemTemplate><asp:Label id="dg_lab_ProcessNeedMinutes" runat="server"   />
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

<asp:BoundColumn DataField="PriorityName" HeaderText="����" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ></asp:BoundColumn>
<asp:BoundColumn DataField="PartStatusDesc" HeaderText="���A"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"></asp:BoundColumn>
<asp:TemplateColumn HeaderText="SendDate"  Visible="false">
      <HeaderTemplate><asp:Label id="dg_header_SendDate" runat="server" text="�e����" ></asp:Label></HeaderTemplate>
    <ItemTemplate>
        <asp:Label id="dg_lab_sendDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SendDate", "{0:MM-dd H:mm}") %>'/>
    </ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="DueDate" Visible="false" >
     <HeaderTemplate><asp:Label id="dg_header_dueDate" runat="server" text="�ݨD���"></asp:Label></HeaderTemplate>
    <ItemTemplate><asp:Label id="dg_lab_dueDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.DueDate", "{0:MM-dd H:mm}") %>'/>
</ItemTemplate>
</asp:TemplateColumn>
<asp:TemplateColumn HeaderText="�Ҩ�W��" Visible="false"><ItemTemplate><asp:Label id="dg_lab_productname" runat="server" Text=''/>
</ItemTemplate>
</asp:TemplateColumn>

    <asp:TemplateColumn HeaderText="CurrentSelfDate" HeaderStyle-Width="50px"  >
    <HeaderTemplate>
        <%--<asp:Label id="dg_header_selfDate" runat="server" text="�w�p�ɶ�" ></asp:Label>--%>
 �w�p�ɶ�
    </HeaderTemplate>
       
	<ItemTemplate>
        <br />
		<asp:Label runat="server" ID="dg_lab_currentselfDate" Text='<%# DataBinder.Eval(Container, "DataItem.CurrentSelfDate") %>'>
		</asp:Label>
	</ItemTemplate>

<HeaderStyle Wrap="True" ></HeaderStyle>
</asp:TemplateColumn>

    <asp:TemplateColumn HeaderText="CurrentFactDate" HeaderStyle-Width="50px"  >
    <HeaderTemplate>
        <%--<asp:Label id="dg_header_factDate" runat="server" text="��ڮɶ�" ></asp:Label>--%>
        ��ڮɶ�
    </HeaderTemplate>
	<ItemTemplate>
		<asp:Label runat="server" ID="dg_lab_currentfactDate" Text='<%# DataBinder.Eval(Container, "DataItem.CurrentFactDate") %>'>
		</asp:Label>
	</ItemTemplate>

<HeaderStyle Wrap="True" ></HeaderStyle>
</asp:TemplateColumn>
    <asp:BoundColumn DataField="QRCode" HeaderText=""  HeaderStyle-Width="55px" ItemStyle-Wrap="true"  ></asp:BoundColumn>




<%--<asp:TemplateColumn HeaderText="ProcessMachineid" >
    <HeaderTemplate><asp:Label id="dg_header_ProcessMachineid" runat="server" text="�����H���]���x�^"></asp:Label>
</HeaderTemplate>
<ItemTemplate><asp:Label id="dg_lab_processMachineid" runat="server" Text=''/>
</ItemTemplate>
</asp:TemplateColumn>--%>

    <asp:TemplateColumn HeaderText="currentstatusid" HeaderStyle-Width="50px" HeaderStyle-Wrap="true" Visible="false">
	<ItemTemplate>
		<asp:Label runat="server" ID="dg_currentstatusid" Text='<%# DataBinder.Eval(Container, "DataItem.CurrentStatusid") %>'>
		</asp:Label>
	</ItemTemplate>

<HeaderStyle Wrap="True" Width="50px"></HeaderStyle>
</asp:TemplateColumn>



     <asp:TemplateColumn HeaderText="dlprocesscard"  HeaderStyle-Wrap="true" Visible="false">
	<ItemTemplate>
		<asp:Label runat="server" ID="dg_dlprocesscard" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessCard") %>'>
		</asp:Label>
	</ItemTemplate>

<HeaderStyle Wrap="True" Width="50px"></HeaderStyle>
</asp:TemplateColumn>


    <asp:TemplateColumn HeaderText="DesignProcess"  HeaderStyle-Wrap="true" Visible="false" >
	<ItemTemplate>
		<asp:Label runat="server" ID="dg_lab_DesignProcess" Text='<%# DataBinder.Eval(Container, "DataItem.DesignProcess") %>'>
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
    ��e��:
    <asp:Label id ="lab_nowpage" runat ="server"></asp:Label>
    ��
    �@:
<asp:Label id="lab_totalpagte" runat ="server"  ></asp:Label>
    ��
<%--<asp:linkbutton id="btnFirst" runat="server" CommandArgument="fist" >����</asp:linkbutton>--%>&nbsp;&nbsp;
<asp:linkbutton id="btnPrev" runat="server" Width="36px" CommandArgument="prev" OnClick ="btnPrev_Click">�W�@��</asp:linkbutton>&nbsp;&nbsp;
<asp:linkbutton id="btnNext" runat="server" CommandArgument="next" OnClick ="btnNext_Click">�U�@��</asp:linkbutton>&nbsp;&nbsp;
<%--<asp:linkbutton id="btnLast" runat="server" CommandArgument="last">����</asp:linkbutton>&nbsp;&nbsp;--%>
<asp:label id="lblCurrentIndex" runat="server"></asp:label>/<asp:label id="lblPageCount" runat="server"></asp:label>&nbsp;&nbsp; 
�����<asp:TextBox id="txtGoPage" runat="server" Width="30px" ></asp:TextBox>
<asp:Button id="btnGo" runat="server" Text="GO" CssClass="button" Width="29px" OnClick="btnGo_Click"></asp:Button></td>
</tr>
</table>

</div>

    


<div class="box" style="height:auto">
<table width="100%" align="center" class="tbMessage"  ><TR vAlign="middle" >
<TD width="15%" height="28"><%--<DIV align="center"><B>--%><DIV align="center"><B>����</B>
</DIV>
</TD>
<TD class="msg" width="45%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
</TD>
<TD class="msg" width="40%" align="left">
<asp:label id="lab_color" runat="server"></asp:label>
</TD>
</TR>
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
