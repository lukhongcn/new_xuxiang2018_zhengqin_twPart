<%@ Page Language="c#" CodeBehind="UserPrivilegeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserPrivilegeList" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <title><%=menuname %></title>
    <link href="css/amd.css" rel="stylesheet" type="text/css" />

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
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Menu">
                <div class="menubox">
                    <div class="mod1">
                        <ul>

                            <li class="btn2">
                                <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                            </li>
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
                                    <asp:Label ID="Label1" runat="server">輸入姓名或卡號</asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txt_namecard_like" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btn_search" runat="server" Text="搜索" Visible="false"></asp:Button>
                                    <asp:Label ID="lab_remenber" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="Textbox">
                        <asp:DataGrid ID="MainDataGrid" runat="server" PageSize="10" AutoGenerateColumns="False" Width="100%" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid">
                            <SelectedItemStyle HorizontalAlign="Left"></SelectedItemStyle>
                            <EditItemStyle HorizontalAlign="Left"></EditItemStyle>
                            <AlternatingItemStyle BackColor="#F8F7FF" HorizontalAlign="Left"></AlternatingItemStyle>
                            <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Left"></ItemStyle>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="UserName" HeaderText="員工編號"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Name" HeaderText="員工姓名"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Password" HeaderText="口令"></asp:BoundColumn>
                                <asp:BoundColumn DataField="RoleName" HeaderText="角色" Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Email" HeaderText="電子郵件"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="系統管理員">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_IsAdmin" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isadmin") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="功能" Visible="false">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink_Edit" runat="server" Text="編輯" NavigateUrl='<%# "UserPrivilegeAddEdit.aspx?func=edit&amp;userid="+DataBinder.Eval(Container, "DataItem.username") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
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
                                                    <asp:Label ID="Label2" runat="server">提示</asp:Label></b>
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

