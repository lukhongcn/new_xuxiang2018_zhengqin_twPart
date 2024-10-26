<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>

<%@ Page Language="c#" CodeBehind="CustomerDesignList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.CustomerDesignList" %>

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
                        <a href="../defaultmain.aspx"><%=Utility.Translate.translateString("生產管理")%></a>
                        <img alt="" src="images/arrow.png" />
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
                            <li class="btn2">
                                <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                            </li>
                            <li class="btn5">
                                <asp:LinkButton ID="lnkbutton_view" runat="server" OnClick="lnkbutton_view_Click" ToolTip="檢視/view">檢視/view</asp:LinkButton>
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

                                <td><%=Utility.Translate.translateString("客戶名稱")%>:<asp:TextBox ID="txt_customer" runat="Server" Text=""></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="Textbox">
                        <asp:Label ID="lab_Id" Visible="false" runat="server" />
                        <asp:Label ID="lab_customer" Visible="false" runat="server" />
                        <asp:DataGrid ID="dg_CustomerDesign" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid" Width="100%">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                            <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="Id">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_Id" runat="server" Visible="False"></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_Id" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="CustomerId">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_CustomerId" runat="server"><%=Utility.Translate.translateString("編號")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_CustomerId" runat="server" Text='<%#Utility.tools.Truncate(DataBinder.Eval(Container, "DataItem.CustomerNumber").ToString(),5)%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="CustomerName">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_CustomerName" runat="server"><%=Utility.Translate.translateString("客戶名稱")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_CustomerName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerName").ToString()%>' />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="ForMan">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_ForMan" runat="server"><%=Utility.Translate.translateString("負責人")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_ForMan" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ForMan")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Contacter">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_Contacter" runat="server"><%#Utility.Translate.translateString("聯繫人")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_Contacter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Contacter")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="Gender">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_Gender" runat="server"><%#Utility.Translate.translateString("性別")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_Gender" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Gender")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="CompanyTel">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_CompanyTel" runat="server"><%# Utility.Translate.translateString("公司電話")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_CompanyTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyTel")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="CompanyFax">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_CompanyFax" runat="server"><%# Utility.Translate.translateString("公司傳真")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_CompanyFax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyFax")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Email">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_Email" runat="server">e-mail</asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_Email" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Email")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="Ip">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_Ip" runat="server"><%# Utility.Translate.translateString("IP地址")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_Ip" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ip")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="FactoryTel">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_FactoryTel" runat="server"><%# Utility.Translate.translateString("廠商電話")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_FactoryTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryTel")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="FactoryFax">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_FactoryFax" runat="server"><%# Utility.Translate.translateString("廠商傳真")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_FactoryFax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactoryFax")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="CompanyAddress">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_CompanyAddress" runat="server"><%# Utility.Translate.translateString("公司地址")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_CompanyAddress" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CompanyAddress")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn Visible="False" HeaderText="Remark">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_Remark" runat="server"><%=Utility.Translate.translateString("備註")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_Remark" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Remark")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="CustomerLogin">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_CustomerLogin" runat="server"><%# Utility.Translate.translateString("登錄名")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_CustomerLogin" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerLogin")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="CustomerPassword">
                                    <HeaderTemplate>
                                        <asp:Label ID="dg_header_CustomerPassword" runat="server"><%# Utility.Translate.translateString("密碼")%></asp:Label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="dg_lab_CustomerPassword" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CustomerPassword")%>' />
                                    </ItemTemplate>

                                </asp:TemplateColumn>
                            </Columns>
                            <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                            <PagerStyle Mode="NumericPages" CssClass="tbPager"></PagerStyle>
                        </asp:DataGrid>
                    </div>
                    <asp:DataGrid ID="dg_Contacter" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid" Visible="False">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                        <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
                        <Columns>
                            <asp:TemplateColumn HeaderText="contactName">
                                <HeaderTemplate>
                                    <asp:Label ID="dg_header_contactName" runat="server"> <%=Utility.Translate.translateString("姓名")%></asp:Label>

                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dg_lab_contactName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactName")%>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="dg_txt_contactName" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactName") %>' />
                                </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="contactPosition">
                                <HeaderTemplate>
                                    <asp:Label ID="dg_header_contactPosition" runat="server" Text='<%#Utility.Translate.translateString("職務")%>' />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dg_lab_contactPosition" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactPosition")%>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="dg_txt_contactPosition" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactPosition") %>' />
                                </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="contactMobileCell">
                                <HeaderTemplate>
                                    <asp:Label ID="dg_header_contactMobileCell" runat="server" Text='<%#Utility.Translate.translateString("手機")%>' />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dg_lab_contactMobileCell" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactMobileCell")%>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="dg_txt_contactMobileCell" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactMobileCell") %>' />
                                </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="contactFax">
                                <HeaderTemplate>
                                    <asp:Label ID="dg_header_contactFax" runat="server" Text='<%#Utility.Translate.translateString("傳真")%>' />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dg_lab_contactFax" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactFax")%>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="dg_txt_contactFax" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactFax") %>' />
                                </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="contactTel">
                                <HeaderTemplate>
                                    <asp:Label ID="dg_header_contactTel" runat="server" Text='<%#Utility.Translate.translateString("電話")%>' />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dg_lab_contactTel" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactTel")%>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="dg_txt_contactTel" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactTel") %>' />
                                </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="contactEmail">
                                <HeaderTemplate>
                                    <asp:Label ID="dg_header_contactEmail" runat="server" Text="Email" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dg_lab_contactEmail" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactEmail")%>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="dg_txt_contactEmail" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactEmail") %>' />
                                </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="contactComment">
                                <HeaderTemplate>
                                    <asp:Label ID="dg_header_contactComment" runat="server" />
                                    <%=Utility.Translate.translateString("備註")%>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="dg_lab_contactComment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ContactComment")%>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="dg_txt_contactComment" Width="40" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.contactComment") %>' />
                                </EditItemTemplate>
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

