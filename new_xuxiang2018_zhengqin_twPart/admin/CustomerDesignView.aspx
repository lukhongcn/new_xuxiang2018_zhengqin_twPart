<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Page Language="c#" CodeBehind="CustomerDesignView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.CustomerDesignView" %>

<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
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
                        <a href="#"><%=Utility.Translate.translateString("生產管理")%></a>
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
                            <li class="btn1"><a href="CustomerDesignView.aspx" runat="server" title="新增 / add">新增/add</a>
                            </li>
                            <li class="btn3">
                                <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                            </li>
                            <li class="btn5"><a href="CustomerDesignList.aspx" title="檢視 / view">檢視/view</a>
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
                        <table width="100%" align="center" class="tbmain">
                            <asp:Label ID="lab_Id" runat="server" Text="" Visible="False"></asp:Label>
                            <tr>
                                <td width="10%">
                                    <asp:Label ID="lab_CustomerId" runat="server" Text="客戶編號"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerId" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_CustomerName" runat="server" Text="客戶名稱"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_ForMan" runat="server" Text="負責人">本公司負責人</asp:Label>
                                </td>
                                <td>
                                    <div class="ajaxposition">
                                        <asp:TextBox ID="txt_ForMan" runat="server"></asp:TextBox>
                                        <ajaxToolkit:AutoCompleteExtender ID="Auto_forman" runat="server" ServiceMethod="GetCompleteList" ServicePath="../selectUser.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_ForMan"></ajaxToolkit:AutoCompleteExtender>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label ID="lab_CompanyAddress" runat="server" Text="公司地址">工廠地址</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CompanyAddress" runat="server" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_Contacter" runat="server" Text="聯繫人">客戶聯絡人</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Contacter" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_Gender" runat="server" Text="性別"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dpl_Gender" runat="server">
                                        <asp:ListItem Value="先生">先生</asp:ListItem>
                                        <asp:ListItem Value="小姐">小姐</asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_CompanyTel" runat="server" Text="公司電話"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CompanyTel" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_Ip" runat="server" Text="網絡地址"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Ip" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_CompanyFax" runat="server" Text="公司傳真"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CompanyFax" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_Email" runat="server" Text="e-mail"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_customerLogin" runat="server" Text="登錄名"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_customerLogin" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_customerPassword" runat="server" Text="密碼"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_customerPassword" runat="server"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <asp:Label ID="lab_Remark" runat="server" Text="備註"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Remark" runat="server" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <table width="100%" align="center" class="tbclient">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lab_contactName" runat="server" Text="聯絡人姓名">新增客戶聯絡人姓名</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactName" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lab_contactPosition" runat="server" Text="職務"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactPosition" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lab_contactMobileCell" runat="server" Text="手機"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactMobileCell" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lab_contactFax" runat="server" Text="傳真"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactFax" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lab_contactTel" runat="server" Text="電話"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactTel" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lab_contactEmail" runat="server" Text="E-Mail"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactEmail" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lab_contactComment" runat="server" Text="備註 "></asp:Label>
                                            </td>
                                            <td colspan="5">
                                                <asp:TextBox ID="txt_contactComment" runat="server" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:Button ID="Btn_addContacter" runat="server" Text="增加其它聯繫人"></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:DataGrid ID="dg_Contacter" runat="server" AllowPaging="True" CellSpacing="1" CellPadding="0" BorderWidth="0" CssClass="Grid" AutoGenerateColumns="False">
                                                    <ItemStyle BorderStyle="Dotted" BorderColor="#E3E3E4" BackColor="White"></ItemStyle>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="dg_header" VerticalAlign="Middle"></HeaderStyle>
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="Name" HeaderStyle-Width="100px">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactName" Text='<%# Utility.Translate.translateString("員工姓名")%>' runat="server" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactName" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactName&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Position" HeaderStyle-Width="100px">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactPosition" runat="server" Text='<%# Utility.Translate.translateString("職務")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactPosition" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactPosition&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="MobileCell" HeaderStyle-Width="100px">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactMobileCell" runat="server" Text='<%# Utility.Translate.translateString("手機")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactMobileCell" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactMobileCell&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Fax">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactFax" runat="server" Text='<%# Utility.Translate.translateString("傳真")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactFax" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactFax&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Tel">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactTel" runat="server" Text='<%# Utility.Translate.translateString("電話")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactTel" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactTel&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Email">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactEmail" runat="server" Text="Email" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactEmail" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactEmail&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Comment">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactComment" runat="server" Text='<%# Utility.Translate.translateString("備註")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactComment" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactComment&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <PagerStyle CssClass="tbPager" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
                                                <asp:Label ID="Label1" runat="server" Text="" Visible="False"></asp:Label>
                                                <asp:Button ID="Button1" runat="server" Text="增加" Visible="false" />
                                                <hr style="color: #ccccff">
                                                <br>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label>
                                    <asp:Button ID="btn_add_edit" runat="server" Text="保存" Visible="false"></asp:Button>
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
                                            <div align="cente">
                                                <b><asp:Label id="lab_note" runat="server" Text="提示信息"></asp:Label></b>
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

