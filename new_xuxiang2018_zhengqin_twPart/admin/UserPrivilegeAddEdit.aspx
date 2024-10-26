<%@ Page Language="c#" CodeBehind="UserPrivilegeAddEdit.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserPrivilegeAddEdit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <title>><%=menuname %></title>
    <link href="css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="#"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img src="images/arrow.png" />
                        <a href="#">><%=menuname %></a>
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
                            <li class="btn5"><a href="UserPrivilegeList.aspx" title="檢視 / view">檢視/view</a>
                            </li>
                            <li class="btn3">
                                <asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
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
                    <div class="space1"></div>
                    <div class="Textbox">
                        <table id="Table1" width="100%" align="center" class="tbone" border="1">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <b>
                                            <asp:Label ID="Label1" runat="server">請填入以下信息</asp:Label></b>
                                        <asp:Label ID="Label_HiddenUserId" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                                        <asp:Label ID="Label_HiddenFuncMode" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label ID="Label2" runat="server">員工編號:</asp:Label>
                                        <asp:TextBox ID="Textbox_UserId" name="Textbox_UserId" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Textbox_UserId" ErrorMessage="請輸入員工編號"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label3" runat="server">口令:</asp:Label>
                                        <asp:TextBox ID="Textbox_Password" name="Textbox_Password" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="Requiredfieldvalidator3" runat="server" ControlToValidate="Textbox_Password" ErrorMessage="請輸入口令"></asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="DropDownList_Role" runat="server" Visible="False"></asp:DropDownList>

                                        <asp:Label ID="Label4" runat="server">模塊:</asp:Label>
                                        <asp:DropDownList ID="drp_menu" runat="server" OnSelectedIndexChanged="drp_menu_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:Label ID="Label5" runat="server">子模塊:</asp:Label>
                                        <asp:DropDownList ID="drp_subMenu" runat="server"></asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="20%" valign="top">
                                        <asp:Label ID="Label6" runat="server">權限設定</asp:Label></td>
                                    <td width="80%">
                                        <asp:DataGrid ID="DataGridPrivate" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid">
                                            <SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
                                            <EditItemStyle HorizontalAlign="Center"></EditItemStyle>
                                            <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                                            <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Center"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                                            <Columns>
                                                <asp:BoundColumn DataField="menuid" HeaderText="功能項"></asp:BoundColumn>
                                                <asp:BoundColumn DataField="menuname" HeaderText="功能項描述"></asp:BoundColumn>
                                                <asp:BoundColumn DataField="url" HeaderText="url" Visible="False"></asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="瀏覽">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="Checkbox_PQuery"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="添加">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="CheckBox_PAdd"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="編輯">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="Checkbox_PEdit"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="刪除">
                                                    <ItemTemplate>
                                                        <asp:CheckBox runat="server" ID="Checkbox_PDel"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <asp:Label ID="Label7" runat="server">現場工序</asp:Label><br>
                                        <asp:Label ID="Label8" runat="server">權限設定</asp:Label></td>
                                    <td width="80%">
                                        <div style="overflow-y: scroll; width: 100%; border-top-style: ridge; border-right-style: ridge; border-left-style: ridge; height: 200px; border-bottom-style: ridge">
                                            <asp:DataGrid ID="MainDataGrid" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid">
                                                <SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
                                                <EditItemStyle HorizontalAlign="Center"></EditItemStyle>
                                                <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                                                <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted" HorizontalAlign="Center"></ItemStyle>
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="選擇">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="CheckBox_Select" Checked="False"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="processid" HeaderText="工序" Visible="False"></asp:BoundColumn>
                                                    <asp:BoundColumn DataField="processname" HeaderText="工序"></asp:BoundColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </div>
                                        <asp:CheckBox ID="CheckBox_SelectAll" runat="server" Text="全部選中" Checked="False" AutoPostBack="True"></asp:CheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="20%">
                                        <asp:Label ID="Label9" runat="server">系統管理員</asp:Label></td>
                                    <td width="80%">
                                        <asp:RadioButtonList ID="RadioButtonList_IsAdmin" runat="server"></asp:RadioButtonList>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="box">
                        <table id="Table3" width="100%" align="center" class="tbMessage" border="1">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="Label10" runat="server">提示</asp:Label></b>
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

