<%@ Page language="c#" Codebehind="PartModifyList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartModifyList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>���~�c�u���վ�</title>
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

    .custom-warning-bold-border {
    border: 5px solid #ffc107; /* Bold warning color */
  }


</style>
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx">�Ͳ��޲z</a>
<img src="images/arrow.png" />
<a href="#">���~�c�u���վ�</a>
</div>
<div class="logout"><a href="login.aspx" TARGET="_parent">�n�X</a>
</div>
<div class="clearbox"></div>
</div>
</div>

<div id="Container">
    <div id="Content">
        <div id="Menu">
            <div class="menubox">
                <div class="mod1"><ul>

                <li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="�s��/edit">�s��/edit</asp:LinkButton>
                </li>
                <li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" OnClick="lnkbutton_view_Click" ToolTip="�˵�/view" Visible="false">�˵�/view</asp:LinkButton>
                </li>

                </ul>
                </div>
                <div class="mod2"><ul>
                <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="�j�M/search" OnClick="lnkbutton_search_Click">�j�M/search</asp:LinkButton>
                </li>
                <li class="btn9"><asp:LinkButton runat="server" ID ="lnkbutton_print" ToolTip="�C�L/print" OnClick="lnkbutton_print_Click" Visible="false">�C�L/print</asp:LinkButton></li>
                <li class="btn11"><asp:LinkButton runat="server" ID="lnkbutton_mail" ToolTip="�l��/mail" OnClick="lnkbutton_mail_Click" Visible="false">
                    �l��/mail</asp:LinkButton></li>

                </ul>
                </div>
                <div class="clearbox"></div>
            </div>
        </div>
        <div class="container mt-3 border border-primary">
            <asp:label id="lab_seach_moduleid" runat="server" visible="false"></asp:label>
            <asp:label id="lab_type" Visible="False" Runat="server"></asp:label>
            <div class="container mt-3">
                <div class="row mb-3">
                    <div class="col-lg-7  d-flex">
                       <asp:Label ID="Label1" runat="server" CssClass="me-10">�l��</asp:Label>
                        <asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True" CssClass="form-select custom-large-width  text-start border-primary me-1"></asp:dropdownlist>
                        <asp:textbox id="txt_moduleid" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                    </div>
                    <div class="col-lg-5  d-flex">
                        <asp:Label ID="Label2" runat="server" CssClass="me-10">�c��</asp:Label>
                        <asp:textbox id="txt_partnoid" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-3 border border-primary" >
            <div class="table-responsive">
                <asp:datagrid id="MainDataGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False"  CssClass="table table-striped table-bordered table-hover table-sm"  AllowCustomPaging="true" style="table-layout:fixed;width: 100%;">
            
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                    <Columns>
                        <asp:TemplateColumn HeaderStyle-Width ="60px">
                            <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk_datagrid" />
                            </ItemTemplate>
                        </asp:TemplateColumn>

                        <asp:TemplateColumn  HeaderText="ModuleId" HeaderStyle-Width="100px">
                            <HeaderTemplate>
                                <asp:Label id="lab_header_ModuleId" runat="server" >�l�帹</asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <asp:Label id="lab_ModuleId" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>' />
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn  HeaderText="PartNo_Id" HeaderStyle-Width="100px">
                            <HeaderTemplate><asp:Label id="Label_10" runat="server">�c��</asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <asp:Label id="lab_PartNo_Idtemp" runat="server" Text='<%# new Utility.FileOperate().getJT(Convert.ToString(Eval("ModuleId")),Convert.ToString(Eval("PartNo_Id"))) %>'/>
                            </ItemTemplate>
                        </asp:TemplateColumn>

                        <asp:BoundColumn DataField="Priority" HeaderText="����" Visible="false"></asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="�u��" HeaderStyle-Width="565px"><ItemTemplate>
                            <asp:Label runat="server" ID="Label_ProcessName" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>' ></asp:Label>
                             <asp:Label runat="server" ID="dg_lnk_ProcessName" Text='' Visible="false"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="priorityname" HeaderText="����" HeaderStyle-Width ="40px"></asp:BoundColumn>
                        <asp:ButtonColumn Text="�ԲӫH��" HeaderText="�\��" CommandName="Detail" Visible="false"></asp:ButtonColumn>
                        <asp:TemplateColumn visible="false"><ItemTemplate><asp:HyperLink id="HyperLink_EditProcess" runat="server" Text="�u�ǽվ�" NavigateUrl="&lt;%# &quot;PartModifyEdit.aspx?moduleid=&quot;+DataBinder.Eval(Container, &quot;DataItem.moduleid&quot;)+&quot;&amp;partno=&quot;+DataBinder.Eval(Container, &quot;DataItem.PartNo_Id&quot;)+&quot;&amp;priority=&quot;+DataBinder.Eval(Container, &quot;DataItem.Priority&quot;) %&gt;"></asp:HyperLink>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn Visible="false"><ItemTemplate><asp:HyperLink id="HyperLink_EditAddProcess" runat="server" Text="�u�Ƕ��ǽվ�" NavigateUrl="&lt;%# &quot;PartModifyProcessOrder.aspx?moduleid=&quot;+DataBinder.Eval(Container, &quot;DataItem.moduleid&quot;)+&quot;&amp;partnoid=&quot;+DataBinder.Eval(Container, &quot;DataItem.PartNo_Id&quot;) %&gt;"></asp:HyperLink>
                        </ItemTemplate>
                        </asp:TemplateColumn>

                        <asp:TemplateColumn  HeaderText="PartNo_Id" Visible="false">
                            <HeaderTemplate><asp:Label id="Label_101" runat="server" >�s��s��</asp:Label>
                            </HeaderTemplate>
                            <ItemTemplate>
                            <asp:Label id="lab_PartNo_Id" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.PartNo_Id") %>' />
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
                        <asp:TemplateColumn  HeaderText="ProcessNo" Visible="false">

                            <ItemTemplate>
                            <asp:Label id="lab_ProcessNo" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ProcessNo") %>'/>
                            </ItemTemplate>
                        </asp:TemplateColumn>

                    </Columns>
   
   
                    <PagerStyle   CssClass="table-primary" NextPageText="" PrevPageText="" >
                    </PagerStyle>
  

                  </asp:datagrid>
            </div>
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


<asp:datagrid id="DetailDatagrid" runat="server" Width="100%" AutoGenerateColumns="False" BorderWidth="0" CssClass="Grid" CellSpacing="1" CellPadding="0">
<SelectedItemStyle HorizontalAlign="Left"></SelectedItemStyle>
<EditItemStyle HorizontalAlign="Left"></EditItemStyle>
<AlternatingItemStyle HorizontalAlign="Left"></AlternatingItemStyle>
<ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
<Columns>
<asp:BoundColumn DataField="ProcessOrder" HeaderText="�u�Ƕ���"></asp:BoundColumn>
<asp:BoundColumn DataField="ProcessId" HeaderText="�u��"></asp:BoundColumn>
<asp:BoundColumn DataField="selfstartdate" HeaderText="�p���}�l���" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
<asp:BoundColumn DataField="selfenddate" HeaderText="�p���������" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundColumn>
<asp:BoundColumn DataField="ProcessNeedMinutes" HeaderText="�u��"></asp:BoundColumn>
</Columns>
</asp:datagrid>&nbsp;</div>
<div class="container mt-3 border border-warning"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>����</B>
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
<script>
    $(".table").treetable({ expandable: true });
</script>
</form>
</body>
</html>

