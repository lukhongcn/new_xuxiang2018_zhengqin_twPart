<%@ Page Language="c#" CodeBehind="BomDetailView.aspx.cs" AutoEventWireup="false" MasterPageFile="~/DefaultSub.Master"  Inherits="ModuleWorkFlow.admin.BomDetailView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="#"><%=Utility.Translate.translateString("�Ͳ��޲z")%></a>
                        <img src="images/arrow.png" />
                        <a href="#"><%=menuname %></a>
                    </div>
                    <div class="logout">
                        <a href="login.aspx" target="_parent"><%=Utility.Translate.translateString("�n�X")%></a>
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
                                     <li class="btn3">
                                         <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="�x�s/save" OnClick="lnkbutton_save_Click">�x�s/save</asp:LinkButton>
                                     </li>
                                     <li class="btn5">
                                         <asp:LinkButton ID="lnkbutton_view" runat="server"
                                             ToolTip="�˵�/vies" OnClick="lnkbutton_view_Click">�˵�/view</asp:LinkButton>
                                     </li>
                                 </ul>
                             </div>
                             <div class="mod2"></div>
                             <div class="clearbox"></div>
                         </div>
                     </div>
                    <div class="space1"></div>
                    <div class="Textbox">
                        <asp:Label ID="lab_Id" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_User" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_materialId" runat="server" Text="����" Visible="false"></asp:Label>
                        <asp:DropDownList ID="Dropdownlist_Material" runat="server" Visible="false"></asp:DropDownList>
                        <asp:Label ID="lab_spec" runat="server" Text="�W��]��^" Visible="false"></asp:Label>
                        <asp:TextBox ID="txt_spec" runat="server" Visible="false"></asp:TextBox>
                        <asp:Label ID="func" runat="server" Text="" Visible="False"></asp:Label>
                        <asp:Button ID="btn_add_edit" runat="server" Text="�O�s" Visible="false"></asp:Button>
                        <asp:Label ID="lab_comment" runat="server" Text="�Ƶ�" Visible="false"></asp:Label>
                        <asp:TextBox ID="txt_comment" runat="server" Width="430" Visible="false"></asp:TextBox>
                        <asp:Label ID="lab_price" runat="server" Text="����" Visible="false"></asp:Label>
                        <asp:TextBox ID="txt_price" runat="server" Visible="false"></asp:TextBox>
                        <asp:Label ID="lab_ExcelPdf" runat="server" Text="����" Visible="false"></asp:Label>
                        <asp:TextBox ID="TextBox_ExcelPdf" Width="300px" runat="server" Visible="false"></asp:TextBox>
                        <div class="container mt-3">
                               <div class="row mb-3">
                                    <div class="col-lg-6  d-flex">
                                        <asp:Label ID="lab_moduleidshow" runat="server" CssClass="me-10"><%= Utility.Translate.translateString(System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"])%></asp:Label>
                                    
                                        <asp:Label ID="lab_moduleid" runat="server" CssClass="me-10"></asp:Label>
                                    </div>
                                    <div class="col-lg-6  d-flex">
                                         <asp:Label ID="lab_partNo" runat="server" Text="�ϸ�" CssClass="me-10"></asp:Label>

                                         <asp:TextBox ID="txt_partno" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:TextBox>
                                     </div>
                                </div>
                                <div class="row mb-3">
                                   
                                    <div class="col-lg-6  d-flex">
                                        <asp:Label ID="lab_partName" runat="server" Text="�ϦW" CssClass="me-10"></asp:Label>
                                   
                                        <asp:TextBox ID="txt_name" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:TextBox>
                                    </div>
                                     <div class="col-lg-6  d-flex">
                                         <asp:Label ID="Label1" runat="server" Text="���ϸ�" CssClass="me-10"></asp:Label>

                                         <asp:TextBox ID="txt_partentPartNo" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:TextBox>
                                     </div>
                                </div>
                                 <div class="row mb-3">

                                    
                                     <div class="col-lg-6  d-flex">
                                        <asp:Label ID="lab_IsMerchindise" Text="�O�_���" runat="server" CssClass="me-10"></asp:Label>
                                    
                                        <asp:DropDownList ID="dpl_isMerchindise" runat="server" AutoPostBack="true" CssClass="form-select custom-heighter-width  text-start border-primary me-1">
                                            <asp:ListItem Value="0">�_</asp:ListItem>
                                            <asp:ListItem Value="1">�O</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                      <div class="col-lg-6  d-flex">
                                        <asp:Label ID="lab_requireCount" runat="server" Text="���ƶq" CssClass="me-10"></asp:Label>

                                        <asp:TextBox ID="txt_requireCount" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:TextBox>
                                    </div>
                                </div>

                                
                        </div>
                    </div>
                    <div class="container mt-3 border border-warning">
                        <table width="100%" align="center" class="tbMessage" border="0">
                            <tr valign="middle">
                                <td width="10%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>����</b>
                                            </div>
                                        </b>
                                    </div>
                                </td>
                                <td class="msg" width="85%">&nbsp;&nbsp;<asp:Label ID="Label_Message" runat="server"></asp:Label>
                                     <asp:Label ID="lab_bomstyle" runat="server" Visible="false"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

