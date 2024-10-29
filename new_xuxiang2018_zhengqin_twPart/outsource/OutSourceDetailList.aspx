<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>

<%@ Page Language="c#" CodeBehind="OutSourceDetailList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceDetailList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <title><%=menuname %></title>
    <link href="../css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="../defaultmain.aspx"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=menuname %></a>
                    </div>
                    <div class="logout">
                        <a href="../login.aspx" target="_parent"><%=Utility.Translate.translateString("登出")%></a>
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
                            <li class="btn2">
                                <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                            </li>
                            <li class="btn2">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkbutton_confirmedit_Click" ToolTip="答復交期/confrim date edit">答復交期/confrim date edit</asp:LinkButton>
                            </li>


                        </ul>
                    </div>
                    <div class="mod2">
                        <ul>
                            <li class="btn8">
                                <asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                            </li>

                        </ul>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Container">
                <div id="Content">
                    <div class="box">
                        <table width="100%" align="center" class="tbone" border="0">
                            <tr>
                                <td>
                                    <div align="left">
                                        <asp:Label ID="lab_moduleId" Text="模具編號" runat="server"></asp:Label>
                                        <asp:DropDownList ID="dpl_moduleId" runat="server" AutoPostBack="True"></asp:DropDownList>
                                        <asp:TextBox ID="txt_moduleId" runat="server"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <div align="left">
                                        <asp:Label ID="Lab_applyNo" Text="申請單號" runat="server"></asp:Label>
                                        <asp:TextBox ID="txt_applyno" runat="server"></asp:TextBox>
                                    </div>
                                </td>
                                <td>
                                    <div align="left">
                                        <asp:Label ID="Label2" Text="申請狀態" runat="server"></asp:Label>
                                        <asp:DropDownList ID="dpl_status" runat="server" OnSelectedIndexChanged="dpl_status_SelectedIndexChanged">
                                            <asp:ListItem Selected="True" Value="">所有</asp:ListItem>
                                            <asp:ListItem Value="NORQURIEDDATE">需求日期未填</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div align="left">
                                        <asp:Label ID="lab_sendDate" Text="預計出廠" runat="server"></asp:Label>
                                        <asp:TextBox ID="txt_ssendDate" runat="server" Width="80"></asp:TextBox>-<asp:TextBox ID="txt_esendDate" runat="server" Width="80"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="cal_esendDate" runat="server" TargetControlID="txt_ssendDate" Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                                        <ajaxToolkit:CalendarExtender ID="cal_ssendDate" runat="server" TargetControlID="txt_esendDate" Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                                    </div>
                                </td>
                                <td>
                                    <div align="left">
                                        <asp:Label ID="Label1" Text="預計回廠" runat="server"></asp:Label>
                                        <asp:TextBox ID="txt_srequiredDate" runat="server" Width="80"></asp:TextBox>-<asp:TextBox ID="txt_erequiredDate" runat="server" Width="80"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="cal_srequiredDate" runat="server" TargetControlID="txt_srequiredDate" Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                                        <ajaxToolkit:CalendarExtender ID="cal_erequiredDate" runat="server" TargetControlID="txt_erequiredDate" Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                                    </div>
                                </td>
                                <td>
                                    <div align="left">
                                        <asp:Label ID="Label4" Text="答復交期" runat="server"></asp:Label>
                                        <asp:TextBox ID="txt_sconfirmDate" runat="server" Width="80"></asp:TextBox>-<asp:TextBox ID="txt_econfirmDate" runat="server" Width="80"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="cal_sconfirmDate" runat="server" TargetControlID="txt_sconfirmDate" Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                                        <ajaxToolkit:CalendarExtender ID="cal_econfirmDate" runat="server" TargetControlID="txt_econfirmDate" Format="yyyy-MM-dd"></ajaxToolkit:CalendarExtender>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <div align="left">
                                        <asp:Label ID="Label3" Text="外包類型" runat="server"></asp:Label>
                                        <asp:DropDownList ID="dpl_outsourceType" runat="server" OnSelectedIndexChanged="dpl_status_SelectedIndexChanged">
                                            <%--  <asp:ListItem Selected="True" Value="0">固定委外</asp:ListItem>--%>
                                            <asp:ListItem Value="1">單工序委外</asp:ListItem>
                                            <asp:ListItem Value="2">全委外</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="Textbox">
                        <asp:DataGrid ID="dg_OutSourceDetail" runat="server"
                            AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="false"
                            BorderWidth="0" CssClass="Grid"
                            OnPageIndexChanged="dg_OutSourceDetail_PageIndexChanged"
                            OnItemCreated="dg_OutSourceDetail_ItemCreated"
                            OnItemDataBound="dg_OutSourceDetail_ItemDataBound">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                            <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="checkall" runat="server" AutoPostBack="false" onclick="javascript:SelectAll(this);"></asp:CheckBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="CheckBox_Select" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="申請單號">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_OutsourceApplyNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceApplyNo")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="模具編號">
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="零件編號">

                                    <ItemTemplate>
                                        <%--<asp:Label id="dg_lab_partNoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo_Id")%>'/>--%>
                                        <asp:Label ID="dg_lab_partNoId" runat="server"
                                            Text='<%# new Utility.FileOperate().getJT(Convert.ToString(Eval("ModuleId")),Convert.ToString(Eval("PartNo_Id"))) %>' />


                                        <asp:Label ID="dg_lab_partNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>' Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="非標料號">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_erppartNo" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="工序">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessName")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="序號">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_processOrder" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessOrder")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="預計出廠">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_sendDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.sendDate","{0:yy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="實際出廠">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_factStartDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactStartDate","{0:yy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="預計回廠">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_requireDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireDate","{0:yy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="答復交期">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_confirmDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ConfirmDate","{0:yy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="實際回廠">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_factEndDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactEndDate","{0:yy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>


                                <asp:TemplateColumn HeaderText="備註">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="審核狀態">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_ApproveStatus" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApplyStatus")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="審核人">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_approver" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApproveName")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="審核日期">

                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_approveDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ApproveDate","{0:yy-M-d}")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                        </asp:DataGrid>
                    </div>
                    <div class="Textbox">
                    </div>
                    <div class="box">
                        <table width="100%" align="center" class="tbMessage" border="1">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="dg_header_processOrder" runat="server">提示信息</asp:Label></b>
                                            </div>
                                        </b>
                                    </div>
                                </td>
                                <td class="msg" width="85%">&nbsp;&nbsp;<asp:Label ID="Label_Message" runat="server"></asp:Label>
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

