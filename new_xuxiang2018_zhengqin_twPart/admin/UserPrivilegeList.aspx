<%@ Page Language="c#" CodeBehind="UserPrivilegeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.UserPrivilegeList" MasterPageFile="~/DefaultSub.Master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="../defaultmain.aspx"><%=Utility.Translate.translateString("�Ͳ��޲z")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=menuname %></a>
                    </div>
                    <div class="logout">
                        <a href="../login.aspx" target="_parent"><%=Utility.Translate.translateString("�n�X")%></a>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
           
            <div id="Container">
                <div id="Content">
                     <div id="Menu">
                         <div class="menubox">
                             <div class="mod1">
                                 <ul>

                                     <li class="btn2">
                                         <asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="�s��/edit">�s��/edit</asp:LinkButton>
                                     </li>
                                     <li class="btn8">
                                         <asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="�j�M/search" OnClick="lnkbutton_search_Click">�j�M/search</asp:LinkButton>
                                     </li>
                                 </ul>
                             </div>

                             <div class="clearbox"></div>
                         </div>
                     </div>
                    <div class="container mt-3 border border-primary">
                        <div class="container mt-3">
                               <asp:Button ID="btn_search" runat="server" Text="�j��" Visible="false"></asp:Button>
                               <asp:Label ID="lab_remenber" runat="server" Visible="False"></asp:Label>
                             <div class="row mb-3">
                                 <div class="col-lg-12  d-flex">
                                    <asp:Label ID="Label1" runat="server" CssClass="me-10">��J�m�W�Υd��</asp:Label>
                                    <asp:TextBox ID="txt_namecard_like" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:TextBox>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    <div class="container mt-3 border border-primary">
                        <asp:DataGrid ID="MainDataGrid" runat="server" PageSize="10" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-sm" AllowPaging="True" style="table-layout:fixed;width: 100%;">
                           <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" ></HeaderStyle>
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
                            <Columns>
                                <asp:TemplateColumn>
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="UserName" HeaderText="���u�s��"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Name" HeaderText="���u�m�W"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Password" HeaderText="�f�O"></asp:BoundColumn>
                                <asp:BoundColumn DataField="RoleName" HeaderText="����" Visible="False"></asp:BoundColumn>
                                <asp:BoundColumn DataField="Email" HeaderText="�q�l�l��"></asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="�t�κ޲z��">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_IsAdmin" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.isadmin") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="�\��" Visible="false">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink_Edit" runat="server" Text="�s��" NavigateUrl='<%# "UserPrivilegeAddEdit.aspx?func=edit&amp;userid="+DataBinder.Eval(Container, "DataItem.username") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                            <PagerStyle Mode="NumericPages" CssClass="table-primary"></PagerStyle>
                        </asp:DataGrid>
                    </div>
                    <div class="container mt-3 border border-primary">
                        <table width="100%" align="center" class="tbMessage">
                            <tr valign="middle">
                                <td width="10%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>
                                                    <asp:Label ID="Label2" runat="server">����</asp:Label></b>
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
</asp:Content>

