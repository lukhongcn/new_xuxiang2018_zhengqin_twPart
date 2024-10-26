<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>

<%@ Page Language="c#" CodeBehind="ModelList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.ModelList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <title><%=menuname %></title>
    <link href="css/amd.css" rel="stylesheet" type="text/css" />
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
                        <%=menuname %>
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
                            <li class="btn1"><a href="ModelView.aspx" runat="server" title="新增 / add">新增/add</a>
                            </li>
                            <li class="btn2">
                                <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                            </li>
                            <li class="btn6">
                                <asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( deleteConfirm); ">刪除/delete</asp:LinkButton>
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
                        <table width="100%" border="0" cellspacing="2" class="asaxheader">
                            <tr>

                                <td><%=Utility.Translate.translateString("產品产品")%>:<asp:TextBox ID="txt_moldName" runat="Server" Text=""></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="Textbox">
                        <asp:Label ID="lab_Id" Visible="false" runat="server" />
                        <asp:Label ID="lab_customer" Visible="false" runat="server" />
                        <asp:DataGrid ID="dg_ModelList" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid" Width="100%" OnItemDataBound="dg_ModelList_ItemDataBound">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                            <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
                            <Columns>
                                <asp:TemplateColumn ItemStyle-Width="10px">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="dg_header_moldName">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_moldName" runat="server"><%=Utility.Translate.translateString("產品名稱")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_moldName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MoldName")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="dg_header_customerId">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_customerId" runat="server"><%=Utility.Translate.translateString("客戶")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_customerId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerName")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="dg_header_isVisible">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_isVisible" runat="server"><%=Utility.Translate.translateString("是否顯示")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_isVisible" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SIsVisible")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                              

                                <asp:TemplateColumn HeaderText="dg_header_comment">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_comment" runat="server"><%=Utility.Translate.translateString("備註")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>



                            </Columns>
                            <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                            <PagerStyle Mode="NumericPages" CssClass="tbPager"></PagerStyle>
                        </asp:DataGrid>
                        <div class="box">
                            <table width="100%" align="center" class="tbMessage">
                                <tr valign="middle">
                                    <td width="15%" height="28">
                                        <div align="center">
                                            <b>
                                                <div align="center">
                                                    <b><%=Utility.Translate.translateString("提示信息")%></b>
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

