<%@ Page Language="c#" CodeBehind="OrderDesignList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderDesignList" %>

<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="NewDesignView" Src="controls/orderDesignView.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">



<head>
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <%--<title><%=menuname %></title>--%>
    <link href="../css/amd.css" rel="stylesheet" type="text/css" />
    <link href="css/showDiv.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="sexybuttons.css" type="text/css" />
    <script language="Javascript" src="../js/lib.js"></script>
    <script language="Javascript" src="../js/showDiv.js"></script>
    <script language="Javascript" src="../js/jquery.js"></script>
    <script type="text/javascript">

        var deleteConfirm = '<%=Utility.Translate.translateString("您確定要刪除嗎")%>';
    </script>
</head>
<body>

    <form id="Form1" method="post" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="../defaultmain.aspx">生產管理</a>
                        <img src="images/arrow.png" />
                        <a href="#">訂單設定</a>
                    </div>
                    <div class="logout">
                        <a href="../login.aspx" target="_parent">登出</a>
                    </div>
                    <div id='pop-div' style="width: 1000; display: none; border: solid 1px #6e8bde; margin: 0 auto;" class="pop-box">
                        <div class="pop-box-h4">訂單詳細</div>
                        <div class='buttonPanel' style="text-align: right" mce_style="text-align: right">
                            <button type="reset" class="sexybutton" onclick="hideDiv('pop-div');"><span><span><span class="cancel">關閉</span></span></span></button>
                        </div>
                        <div class="pop-box-body">
                            <p>
                                <uc1:NewDesignView ID="OrderView" runat="server"></uc1:NewDesignView>
                            </p>
                        </div>
                        <div class='buttonPanel' style="text-align: right" mce_style="text-align: right">
                            <button type="reset" class="sexybutton" onclick="hideDiv('pop-div');"><span><span><span class="cancel">關閉</span></span></span></button>
                        </div>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Menu">
                <div class="menubox">
                    <div class="mod1">
                        <ul>

                            <li class="btn2">
                                <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit" Visible="false">編輯/edit</asp:LinkButton>
                            </li>



                            <li class="btn4">
                                <asp:LinkButton ID="lnkbutton_copy" runat="server" ToolTip="複製 / copy" OnClick="lnkbutton_copy_Click"  Visible="false">複製/copy</asp:LinkButton>
                            </li>
                            <li class="btn5">
                                <asp:LinkButton ID="lnkbutton_view" runat="server" OnClick="lnkbutton_view_Click" ToolTip="檢視/view" >檢視/view</asp:LinkButton>
                            </li>
                            <li class="btn1">
                                <asp:LinkButton ID="lnkbutton_add" runat="server" ToolTip="新增 / add" OnClick="lnkbutton_add_Click"  Visible="false">新增/add</asp:LinkButton>
                            </li>
                            <li class="btn6">
                                <asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete"  Visible="false" OnClientClick="return   confirm( '您确定&#21024;除&#21527;? '); ">刪除/delete</asp:LinkButton>
                            </li>
                            <li class="btn12">
                                <asp:LinkButton ID="lnkbutton_project" runat="server" OnClick="lnkbutton_project_Click" ToolTip="刪除/delete"  Visible="false">创建项目</asp:LinkButton>
                            </li>

                        </ul>
                    </div>
                    <div class="mod2">
                        <ul>
                            <li class="btn7">
                                <asp:LinkButton ID="lnk_schedule" runat="server" ToolTip=" / ok" OnClick="lnk_schedule_Click">同步</asp:LinkButton>
                            </li>
                            <li class="btn8">
                                <asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                            </li>
                            <li class="btn9">
                                <asp:LinkButton ID="lnkbutton_print" runat="server" ToolTip="列印/printer" OnClick="lnkbutton_print_Click"  Visible="false">列印/printer</asp:LinkButton>
                            </li>

                            <li class="btn11">
                                <asp:LinkButton ID="lnkbutton_mail" runat="server" ToolTip="&#21457;mail/mail" OnClick="lnkbutton_mail_Click"  Visible="false">&#21457;mail/mail</asp:LinkButton>
                            </li>
                            <li class="btn9">
                                <asp:LinkButton ID="lnkbutton_print_barcode" runat="server" ToolTip="列印條碼/printer" OnClick="btn_printOrderPrice_Click"  Visible="false">列印條碼/printer</asp:LinkButton>
                            </li>

                        </ul>
                    </div>

                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Container">
                <div id="Content">
                    <div class="box">
                        <table id="Table_Header2" width="100%" align="center" class="tbone" border="0">
                            <tr>

                                <td> <asp:Label ID="lab_moduleId" runat="server" Text="廠批/子批" /><asp:TextBox ID="TextBox_key" runat="server" Width="135px"></asp:TextBox></td>

                                <td><asp:Label ID="lab_customer" runat="server" Text="客戶" Visible="false" /><asp:DropDownList ID="dpl_customer" runat="server" AutoPostBack="True"
                                    Width="130px" Visible="false">
                                </asp:DropDownList>
                                    <asp:Button ID="Button_Search" runat="server" Text="查詢" Visible="false"></asp:Button>
                                    <asp:Label ID="lab_oldremenber" runat="server" Visible="False"></asp:Label>
                                     <asp:Label ID="lab_productname" runat="server"></asp:Label>
                                    <asp:TextBox ID="txt_productname" runat="server" Width="100px"></asp:TextBox>
                                </td>
                                <td>
                                    <%= System.Configuration.ConfigurationSettings.AppSettings["ModuleShow"]%><asp:DropDownList ID="dpl_customerModuleId" runat="server" AutoPostBack="true"
                                        OnSelectedIndexChanged="dpl_customerModuleId_SelectedIndexChanged" Visible="false">
                                    </asp:DropDownList>
                               
                                    <asp:Label ID="lab_module" runat="server" Text="廠批類型：" Visible="false" /><asp:DropDownList ID="dpl_productTypeId" runat="server" ></asp:DropDownList>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="dpl_ismodify" runat="server">
                                        <asp:ListItem Selected="true" Value="0">廠批</asp:ListItem>
                                        <asp:ListItem Value="1">子批</asp:ListItem>
                                    </asp:DropDownList>
                                </td>


                            </tr>
                            <tr>
                                <td>日期類型<asp:DropDownList ID="dpl_datetime" runat="server">
                                    <asp:ListItem Value="10">不選擇</asp:ListItem>
                                    <asp:ListItem Value="5">製造截止日期</asp:ListItem>
                                    <asp:ListItem Value="3">最後交貨日期(</asp:ListItem>
                                   
                                </asp:DropDownList>
                                </td>
                                <td>開始<wc:InputCalendar ID="txt_startdatetime" runat="server"></wc:InputCalendar>
                                </td>
                                <td>結束<wc:InputCalendar ID="txt_endstartdatetime" runat="server"></wc:InputCalendar>
                                </td>

                                <td>
                                    <asp:Label ID="lab_overStatus" runat="server" Text="結案狀態"></asp:Label>
                                    <asp:DropDownList ID="dpl_overStatus" runat="server" AutoPostBack="True">
                                        <asp:ListItem Value="1">全部</asp:ListItem>
                                        <asp:ListItem Value="2" Selected="True">未結案</asp:ListItem>
                                        <asp:ListItem Value="3">已結案</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="lab_projectDepartMent" runat="server" Visible="false"></asp:Label><asp:DropDownList ID="dpl_projectDepartMent" runat="server" Visible="false"></asp:DropDownList>
                                </td>




                            </tr>

                            <tr>

                                <td>
                                   
                                </td>

                                <td>
                                    <asp:Label ID="lab_model" runat="server" Text="加工類型:" Visible="false"></asp:Label>
                                    <asp:DropDownList ID="dpl_model" runat="server" Visible="false"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>

                                <td>
                                    <asp:Button ID="btn_referencePictureDate" runat="server" Text="查詢" Visible="false"></asp:Button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btn_printReferencePictureDate" runat="server" Text="查詢打印" Visible="false"></asp:Button>
                                </td>
                                <td>
                                    <asp:Button ID="btn_print" runat="server" Text="訂單狀況明細表打印" OnClick="btn_print_Click" Visible="false" />
                                </td>
                                <td>
                                    <asp:Button ID="btn_printOrderPrice" runat="server" Text="每月生產成本表打印" Visible="false" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lab_print" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lab_search" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="lab_searchsingle" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="Textbox">
                        <asp:Label ID="lab_sort" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lab_total" runat="server"></asp:Label>
                        <asp:Label ID="lab_LastScheduledTime" runat="server"></asp:Label>
                        <asp:DataGrid ID="MainDataGrid" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid" PageSize="10" AllowCustomPaging="True" AllowSorting="true" OnSortCommand="MainDataGrid_SortCommand" EnableViewState="true">
                            <SelectedItemStyle HorizontalAlign="Left" BackColor="Navy"></SelectedItemStyle>
                            <EditItemStyle HorizontalAlign="Left"></EditItemStyle>
                            <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                            <ItemStyle BackColor="White" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="圖片" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="picture" Text="" runat="server" Width="50px" Height="50px" Visible="True"></asp:Label>
                                        <asp:Label ID="dg_img_Picture" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.FinishPicture&quot;) %&gt;" runat="server" Visible="False"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False">
                                    <ItemTemplate>
                                        <a href="#" onclick='javascript:showModuleInfo("<%#DataBinder.Eval(Container, "DataItem.Id") %>")'>詳細信息</a>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink_CaseOver" runat="server" Text="結案" NavigateUrl="%# &quot;../CaseOverSetting.aspx?moduleid=&quot;+DataBinder.Eval(Container, &quot;DataItem.moduleid&quot;) %&gt;"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lab_Color" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Color&quot;) %&gt;" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lab_overReasonId" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.overreasonId&quot;) %&gt;"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="結案原因" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lab_overReason" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="計劃完成日期" Visible="false">

                                    <HeaderTemplate>
                                        <%--<asp:Label id="dg_header_PartName" runat="server" text="零件名稱" ></asp:Label>--%>
        計劃完成日期
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_ScheduledEndDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ScheduledEndDate","{0:yy-MM-dd}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="最後計算日期" Visible="false">

                                    <HeaderTemplate>
                                        最後計算日期
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_LastScheduledTime" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.LastScheduledTime","{0:yy-MM-dd}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                               

                            </Columns>
                            <PagerStyle Mode="NumericPages" CssClass="tbPager"></PagerStyle>
                        </asp:DataGrid>
                    </div>
                    <asp:DataGrid ID="DataGridDate" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid" FooterStyle-Font-Size="10pt" FooterStyle-Font-Bold="True" FooterStyle-ForeColor="White" FooterStyle-BackColor="Blue">
                        <SelectedItemStyle HorizontalAlign="Left"></SelectedItemStyle>
                        <EditItemStyle HorizontalAlign="Left"></EditItemStyle>
                        <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                        <ItemStyle BackColor="White" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                        <PagerStyle Mode="NumericPages" CssClass="tbPager"></PagerStyle>
                        <FooterStyle BackColor="Blue" Font-Bold="True" Font-Size="10pt" ForeColor="White" />
                    </asp:DataGrid>
                    <div class="box">
                        <table id="Table3" width="100%" align="center" class="tbMessage" border="1">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>提示</b>
                                            </div>
                                        </b>
                                    </div>
                                </td>
                                <td class="msg" width="85%">&nbsp;&nbsp;<asp:Label ID="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

