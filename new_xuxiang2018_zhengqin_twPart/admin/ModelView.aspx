<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelView.aspx.cs" Inherits="ModuleWorkFlow.admin.ModelView" %>


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
                        <a href="#"><%=Utility.Translate.translateString("生產管理")%></a>
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
                            <li class="btn1"><a href="ModelView.aspx" runat="server" title="新增 / add">新增/add</a>
                            </li>
                            <li class="btn3">
                                <asp:LinkButton ID="lnkbutton_save" runat="server"
                                    ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                            </li>
                            <li class="btn5"><a href="ModelList.aspx" title="檢視 / view">檢視/view</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mod2"></div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Container">
                <div id="Content">
                    <div class="space1"></div>
                    <div class="Textbox">
                        <table id="Table1" bordercolor="#ccccff" cellspacing="1" bordercolordark="#cccccc" cellpadding="0"
                            width="100%" align="center" bordercolorlight="#ccccff" border="1" >
                            <tr>
                                <td valign="top">
                                    <table width="100%" align="center" border="0">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lab_moldName" runat="server" Text="產品名稱"></asp:Label></td>
                                            <td>
                                                <asp:TextBox ID="txt_moldName" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lab_customerId" runat="server" Text="客戶名稱"></asp:Label></td>
                                            <td>
                                                <asp:DropDownList ID="dpl_customerId" runat="server"></asp:DropDownList></td>
                                        </tr>
                                        <asp:Label ID="lab_Id" runat="server" Visible="False" Text=""></asp:Label>

                                      

                                        <tr>
                                            <td>
                                                <asp:Label ID="lab_comment" runat="server" Text="備註"></asp:Label></td>
                                            <td>
                                                <asp:TextBox ID="txt_comment" runat="server"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="是否顯示"></asp:Label></td>
                                            <td>
                                                <asp:CheckBox ID="chk_isVisible" runat="server" /></td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="box">
                        <table width="100%" align="center" class="tbMessage">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="Label3" runat="server" Text="提示"/></b>
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

