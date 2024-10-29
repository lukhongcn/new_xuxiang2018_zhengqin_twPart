<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page Language="c#" CodeBehind="OutSourceConfirmView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceConfirmView" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <title><%=title %></title>
    <link href="../css/amd.css" rel="stylesheet" type="text/css" />
    <script language="Javascript" src="../js/lib.js"></script>
    <script type="text/Javascript" src="../js/lib.js"></script>
    <script type="text/Javascript" src="../js/showDiv.js"></script>
    <script type="text/Javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.timepicker.js?v=0.2.2"></script>

</head>
<body>
    <form id="Form1" method="post" runat="server">
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
            <div id="Container">
                <div id="Content">
                    <div class="box">
                        <asp:Label ID="lab_processid" runat="server" Visible="false"></asp:Label>
                        <table id="Table2" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <%= Utility.Translate.translateString(System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"])%><asp:DropDownList ID="Dropdownlist_ModuleId" runat="server" AutoPostBack="True" Width="100px"></asp:DropDownList>
                                        <asp:TextBox ID="txt_moduleid" runat="server" Width="100px"></asp:TextBox>

                                    </td>


                                    <td>
                                        <asp:Label ID="lab_partno" runat="server" Text="零件編號"></asp:Label>
                                        <asp:TextBox ID="txt_partno" runat="server" Width="50px"></asp:TextBox>
                                    </td>


                                    <td>
                                        <asp:Label ID="lab_outsourceApplyNo" runat="server" Text="申請單編號"></asp:Label>

                                        <asp:TextBox ID="txt_outsourceApplyNo" runat="server" Width="70px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                </tr>


                                <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>















                                <tr>

                                    <td>
                                        <asp:Label ID="lab_sendDate" runat="server" Text="答覆交期"></asp:Label>
                                        <asp:TextBox ID="txt_confirmDate" runat="server" OnTextChanged="txt_confirmDate_TextChanged" AutoPostBack="true" Width="70px" />
                                        <ajaxToolkit:CalendarExtender ID="cal_confirmDate" runat="server" TargetControlID="txt_confirmDate" Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                                    </td>




                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="供應商："></asp:Label><asp:DropDownList ID="drp_SupplyId" runat="server" OnSelectedIndexChanged="drp_SupplyId_SelectedIndexChanged" Width="70px" AutoPostBack="true" />
                                    </td>

                                </tr>

                            </tbody>
                        </table>



                    </div>
                    &nbsp;<div class="Textbox">

                        <asp:DataGrid ID="dg_OutSourceDetail" runat="server" CellPadding="2"
                            CellSpacing="2" AutoGenerateColumns="False">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="checkall" runat="server" AutoPostBack="false" onclick="javascript:SelectAll(this);"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="CheckBox_Select" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="模具編號">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="零件編號">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="工序">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessName")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="序號">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processOrder" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessOrder")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="回厂日期">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_requireDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireDate","{0:yy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="答覆交期">

                                    <ItemTemplate>
                                        <asp:TextBox ID="dg_lab_confirmDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ConfirmDate","{0:yy-M-d}")%>' />
                                        <ajaxToolkit:CalendarExtender ID="cal_dg_lab_confirmDate" runat="server" TargetControlID="dg_lab_confirmDate" Format="yy-M-d"></ajaxToolkit:CalendarExtender>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="答覆數量">
                                     <ItemTemplate>
                                         <asp:TextBox ID="dg_lab_confirmCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ConfirmDate","{0:yy-M-d}")%>' />
                                         <ajaxToolkit:CalendarExtender ID="cal_dg_lab_confirmCount" runat="server" TargetControlID="dg_lab_confirmDate" Format="yy-M-d"></ajaxToolkit:CalendarExtender>
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
                                <asp:TemplateColumn HeaderText="供應商">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_SupplyId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplyId")%>' Visible="false" />
                                        <asp:DropDownList ID="dg_drp_SupplyId" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="序號">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_serno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SerNo")%>' />
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
    </form>
</body>
</html>

