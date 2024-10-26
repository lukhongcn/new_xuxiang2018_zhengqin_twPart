<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>


<%@ Page Language="c#" CodeBehind="UnNormalReasonsView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.UnNormalReasonsView" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <title><%=menuname %></title>
    <link href="css/amd.css" rel="stylesheet" type="text/css" />
    <link href="css/showDiv.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/sexybuttons.css" type="text/css" />
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
                        <a href="../defaultmain.aspx"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=menuname %></a>
                    </div>
                    <div class="logout">
                        <a href="../login.aspx" target="_parent"><%=Utility.Translate.translateString("登出")%></a>
                    </div>
                    <div id='pop-div' style="width: 1000; display: none; border: solid 1px #6e8bde; margin: 0 auto;" class="pop-box">
                        <div class="pop-box-h4"><%=Utility.Translate.translateString("異常原因設定")%></div>
                        <div class="pop-box-body">
                            <table width="100%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="lab_unnormalReasons" runat="server" Text="返修原因"></asp:Label></td>
                                    <td>
                                        <asp:TextBox ID="txt_unnormalReasons" runat="server"></asp:TextBox></td>
                                </tr>
                            </table>
                            <asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label>
                            <asp:Label ID="lab_Id" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="lab_isReadOnly" runat="server" Text="isReadOnly" Visible="false"></asp:Label>
                            <asp:TextBox ID="txt_isReadOnly" runat="server" Visible="false"></asp:TextBox>
                        </div>
                        <div class='buttonPanel' style="text-align: right" mce_style="text-align: right">
                            <span><span><span class="ok">
                                <asp:Button ID="btn_add_edit" runat="server" Text="保存"></asp:Button></span></span></span>
                        </div>
                    </div>

                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Menu">
                <div class="menubox">
                    <div class="mod1">
                        <ul>
                            <li class="btn1">
                                <asp:LinkButton ID="lnkbutton_add" runat="server"
                                    ToolTip="新增 / add" OnClick="lnkbutton_add_Click">新增/add</asp:LinkButton>
                            </li>
                            <li class="btn2">
                                <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                            </li>
                            <li class="btn6">
                                <asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( deleteConfirm); ">刪除/delete</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Container">
                <div id="Content">
                    <div class="box">
                        <asp:DataGrid ID="dg_unNormalReasons" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                            <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
                            <Columns>
                                <asp:TemplateColumn ItemStyle-Width="10px">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="id" Visible="false">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_id" runat="server">編號</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        &nbsp;<asp:Label ID="dg_lab_id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="unnormalReasons">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_unnormalReasons" runat="server"><%=Utility.Translate.translateString("返修原因")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        &nbsp;<asp:Label ID="dg_lab_unnormalReasons" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.UnnormalReasons")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="dg_txt_unnormalReasons" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.unnormalReasons") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="isReadOnly" Visible="false">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_isReadOnly" runat="server">isReadOnly</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        &nbsp;<asp:Label ID="dg_lab_isReadOnly" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.IsReadOnly")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="dg_txt_isReadOnly" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.isReadOnly") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                            <PagerStyle Mode="NumericPages" CssClass="tbPager"></PagerStyle>
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
                                                    <asp:Label ID="dg_header_isReadOnly" runat="server">提示</asp:Label></b>
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

