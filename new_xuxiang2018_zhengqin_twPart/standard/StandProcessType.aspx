<%@ Page language="c#" Codebehind="StandProcessType.aspx.cs" AutoEventWireup="false" MasterPageFile="~/DefaultSub.Master"  Inherits="ModuleWorkFlow.standard.StandProcessType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <div id="Header"><div class="headbox">
        <div class="linebox">
        <a href="../defaultmain.aspx">生產管理</a>
        <img src="../images/arrow.png" />
        <a href="#"><%=menuname %></a>
        </div>
        <div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a>
        </div>
        <div id='pop-div' style="width: 1000;display:none; border:solid 1px #6e8bde;margin:0 auto;" class="pop-box">  
            <div class="pop-box-h4"><asp:Label ID="lab_pop_title" runat="server"/></div>  
            <div class="pop-box-body" >
            <table width="100%" align=center class=tbone border="0">
	        <tr>
		        <td><asp:label id="lab_typeName" runat="server" Text="類別名稱"></asp:label><asp:textbox id="txt_typeName" runat="server"></asp:textbox></td>
	        </tr>
										
        </table>
            <asp:Label ID="lab_id" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="func" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lab_isProductType" runat="server" Visible="false"></asp:Label>

             </div>  
            <div class='buttonPanel' style="text-align: right" mce_style="text-align: right">  
                <span><span><span class="ok"><asp:button id="btn_add" runat="server" Text="保存"></asp:button></span></span></span>
            </div>  
        </div>
        <div class="clearbox"></div>
        </div>
        </div>
       
        <div id="Container">
            <div id="Content">
                 <div id="Menu">
                     <div class="menubox">
                         <div class="mod1"><ul>
                         <li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" 
                                 ToolTip="新增 / add" onclick="lnkbutton_add_Click">新增/add</asp:LinkButton>
                         </li>
                         <li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                         </li>
                         <li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎 '); ">刪除/delete</asp:LinkButton>
                         </li>
                         </ul>
                         </div>

                         <div class="clearbox"></div>
                     </div>
                 </div>

                <div class="container mt-3 border border-primary">
                    <asp:datagrid id="dg_StandProcessType" runat="server" AutoGenerateColumns="False"  AllowPaging="True" CssClass="table table-striped table-bordered table-hover table-sm">
                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
                         <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                        <Columns>
                        <asp:TemplateColumn ItemStyle-Width="10px">
                        <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chk_datagrid" />
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Id" Visible="false">
                        <HeaderTemplate><asp:Label id="dg_header_Id" runat="server">編號</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate><asp:Label id="dg_lab_Id" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Id&quot;)%&gt;"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="typeName">
                        <HeaderTemplate><asp:Label id="dg_header_typeName" runat="server">類型名稱</asp:Label>
                        </HeaderTemplate>
                        <ItemTemplate><asp:Label id="dg_lab_typeName" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.TypeName&quot;)%&gt;" />
                        </ItemTemplate>
                        <EditItemTemplate><asp:textbox id="dg_txt_typeName" Width="40" runat="server" Text=" &lt;%# DataBinder.Eval(Container, &quot;DataItem.typeName&quot;)%&gt; " />
                        </EditItemTemplate>
                        </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle Mode="NumericPages" CssClass="table-primary" ></PagerStyle>
                    </asp:datagrid>
                </div>
                <div class="container mt-3 border border-warning">
                    <table width="100%" align="center" class="tbMessage" border="0"><tr>
                        <TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
                        </DIV>
                        </B>
                        </DIV>
                        </TD>
                        <TD class="msg" width="85%">
                        &nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
                        </TD>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="JSHolder" runat="server">
   <script language="Javascript" src="../js/showDiv.js"></script>
</asp:Content>


