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

        var deleteConfirm = '<%=Utility.Translate.translateString("�z�T�w�n�R����")%>';
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="#"><%=Utility.Translate.translateString("�Ͳ��޲z")%></a>
                        <img src="images/arrow.png" />
                        <%=menuname %>
                    </div>
                    <div class="logout">
                        <a href="../login.aspx" target="_parent"><%=Utility.Translate.translateString("�n�X")%></a>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Menu">
                <div class="menubox">
                    <div class="mod1">
                        <ul>
                            <li class="btn1"><a href="CustomerDesignView.aspx" runat="server" title="�s�W / add">�s�W/add</a>
                            </li>
                            <li class="btn3">
                                <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="�x�s/save" OnClick="lnkbutton_save_Click">�x�s/save</asp:LinkButton>
                            </li>
                            <li class="btn5"><a href="CustomerDesignList.aspx" title="�˵� / view">�˵�/view</a>
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
                                    <asp:Label ID="lab_CustomerId" runat="server" Text="�Ȥ�s��"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerId" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_CustomerName" runat="server" Text="�Ȥ�W��"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CustomerName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_ForMan" runat="server" Text="�t�d�H">�����q�t�d�H</asp:Label>
                                </td>
                                <td>
                                    <div class="ajaxposition">
                                        <asp:TextBox ID="txt_ForMan" runat="server"></asp:TextBox>
                                        <ajaxToolkit:AutoCompleteExtender ID="Auto_forman" runat="server" ServiceMethod="GetCompleteList" ServicePath="../selectUser.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_ForMan"></ajaxToolkit:AutoCompleteExtender>
                                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label ID="lab_CompanyAddress" runat="server" Text="���q�a�}">�u�t�a�}</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CompanyAddress" runat="server" Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_Contacter" runat="server" Text="�pô�H">�Ȥ��p���H</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Contacter" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_Gender" runat="server" Text="�ʧO"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="dpl_Gender" runat="server">
                                        <asp:ListItem Value="����">����</asp:ListItem>
                                        <asp:ListItem Value="�p�j">�p�j</asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_CompanyTel" runat="server" Text="���q�q��"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_CompanyTel" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_Ip" runat="server" Text="�����a�}"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_Ip" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lab_CompanyFax" runat="server" Text="���q�ǯu"></asp:Label>
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
                                    <asp:Label ID="lab_customerLogin" runat="server" Text="�n���W"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_customerLogin" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lab_customerPassword" runat="server" Text="�K�X"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_customerPassword" runat="server"></asp:TextBox>
                                </td>
                            </tr>


                            <tr>
                                <td>
                                    <asp:Label ID="lab_Remark" runat="server" Text="�Ƶ�"></asp:Label>
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
                                                <asp:Label ID="lab_contactName" runat="server" Text="�p���H�m�W">�s�W�Ȥ��p���H�m�W</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactName" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lab_contactPosition" runat="server" Text="¾��"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactPosition" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lab_contactMobileCell" runat="server" Text="���"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactMobileCell" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lab_contactFax" runat="server" Text="�ǯu"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_contactFax" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lab_contactTel" runat="server" Text="�q��"></asp:Label>
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
                                                <asp:Label ID="lab_contactComment" runat="server" Text="�Ƶ� "></asp:Label>
                                            </td>
                                            <td colspan="5">
                                                <asp:TextBox ID="txt_contactComment" runat="server" Width="300px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:Button ID="Btn_addContacter" runat="server" Text="�W�[�䥦�pô�H"></asp:Button>
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
                                                                <asp:Label ID="dg_header_contactName" Text='<%# Utility.Translate.translateString("���u�m�W")%>' runat="server" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactName" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactName&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Position" HeaderStyle-Width="100px">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactPosition" runat="server" Text='<%# Utility.Translate.translateString("¾��")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactPosition" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactPosition&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="MobileCell" HeaderStyle-Width="100px">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactMobileCell" runat="server" Text='<%# Utility.Translate.translateString("���")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactMobileCell" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactMobileCell&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Fax">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactFax" runat="server" Text='<%# Utility.Translate.translateString("�ǯu")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactFax" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactFax&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Tel">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="dg_header_contactTel" runat="server" Text='<%# Utility.Translate.translateString("�q��")%>' />
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
                                                                <asp:Label ID="dg_header_contactComment" runat="server" Text='<%# Utility.Translate.translateString("�Ƶ�")%>' />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dg_lab_contactComment" runat="server" Text="&lt;%#DataBinder.Eval(Container, &quot;DataItem.ContactComment&quot;)%&gt;" />
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <PagerStyle CssClass="tbPager" Mode="NumericPages"></PagerStyle>
                                                </asp:DataGrid>
                                                <asp:Label ID="Label1" runat="server" Text="" Visible="False"></asp:Label>
                                                <asp:Button ID="Button1" runat="server" Text="�W�[" Visible="false" />
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
                                    <asp:Button ID="btn_add_edit" runat="server" Text="�O�s" Visible="false"></asp:Button>
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
                                                <b><asp:Label id="lab_note" runat="server" Text="���ܫH��"></asp:Label></b>
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

