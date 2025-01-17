<%@ Page language="c#" Codebehind="ProcessHelp.aspx.cs" AutoEventWireup="false"  MasterPageFile="~/DefaultSub.Master" Inherits="ModuleWorkFlow.ProcessHelp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <div id="Header">
            <div class="headbox">
                <div class="linebox">
                <a href="../defaultmain.aspx">生產管理</a>
                <img src="images/arrow.png" />
                <a href="#"><%=titlemenuname%></a>
                </div>
                <div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a>
                </div>
        <div id='pop-div' style="width: 1000;display:none; border:solid 1px #6e8bde;margin:0 auto;" class="pop-box">  
        <div class="pop-box-h4">工序設定</div>  
        <div class="pop-box-body" >

        <table id="TableCondition" width="100%" align="center" class="tbone" border="0">
        <tr>
        <td>
        工序編號（請輸入英文名，不能帶有中文）&nbsp;<asp:textbox id="txt_processid" runat="server"></asp:textbox>
        </td>
        <td>
        工序名稱（此名稱是您實際使用工序名稱）<asp:textbox id="txt_processname" runat="server"></asp:textbox>
        </td>
        </tr>
        <tr>

        <td>
        是否為機台加工工序&nbsp;<asp:dropdownlist id="ddl_needschedule" runat="server">
        <asp:ListItem Value="1">是</asp:ListItem>
        <asp:ListItem Value="0">否</asp:ListItem>
        </asp:dropdownlist>
        </td>
        </tr>
        <tr>
        <td><asp:label id="lab_priceType" runat="server">工序類型</asp:label>
        &nbsp;<asp:dropdownlist id="dpl_priceType" runat="server">
        <asp:ListItem Value="0">空</asp:ListItem>
        <asp:ListItem Value="IPQC">IPQC</asp:ListItem>
        <asp:ListItem Value="OPQ">OPQ</asp:ListItem>
        <asp:ListItem Value="OUTSOURCE">外包</asp:ListItem>
        <asp:ListItem Value="ZULI">組立</asp:ListItem>
        </asp:dropdownlist>
        </td>
        <td>
        工時分類&nbsp;<asp:dropdownlist id="dpl_processgroups" runat="server"></asp:dropdownlist>
        </td>
        </tr>
        <tr>

        <td>
        是否直接開始&nbsp;<asp:dropdownlist id="dpl_startdirectly" runat="server">
        <asp:ListItem Value="0">否</asp:ListItem>
        <asp:ListItem Value="1">是</asp:ListItem>
        </asp:dropdownlist>
        </td>
        <td>
        <asp:Label ID="lab_price" Runat="server">價格</asp:Label>
        &nbsp;<asp:TextBox ID="txt_price" Runat="server"></asp:TextBox>
        </td>
        </tr>
        </table>
        <asp:textbox id="txt_comment" runat="server" Visible="false"></asp:textbox>
        <asp:Label ID="lab_func" runat="server" Text="" Visible="false"></asp:Label>
        </div>  
        <div class='buttonPanel' style="text-align: right" mce_style="text-align: right">  
            <span><span><span class="ok"><asp:button id="btn_save" runat="server" Text="保存"></asp:button></span></span></span>
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




                         </ul>
                         </div>

                         <div class="clearbox"></div>
                     </div>
                 </div>
                <div class="container mt-3 border border-primary">
                    <asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True"  CssClass="table table-striped table-bordered table-hover table-sm" >
                       	<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                        <Columns>
                            <asp:TemplateColumn Visible="false"> 
                            <ItemTemplate>
                            <asp:CheckBox runat="server" ID="chk_datagrid" />
                            </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="工序編號" Visible="true"><ItemTemplate>
                            &nbsp;<asp:Label id="dg_lab_ProcessId" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessId&quot;) %&gt;"></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="工序名稱">
                            <ItemTemplate>
                            &nbsp;<asp:Label id="dg_lab_ProcessName" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessName&quot;) %&gt;"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate><asp:textbox id="dg_txt_ProcessName" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessName&quot;) %&gt;"></asp:textbox>
                            </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="註釋" Visible="false">
                            <ItemTemplate>
                            &nbsp;<asp:Label ID="dg_lab_comment" Runat="server" Text="&lt;%# DataBinder.Eval(Container,&quot;DataItem.Comment&quot;)%&gt;"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate><asp:TextBox ID="dg_txt_comment" Runat="server" Text="&lt;%# DataBinder.Eval(Container,&quot;DataItem.Comment&quot;)%&gt;"></asp:TextBox>
                            </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="是否為機台加工工序" Visible="false"><ItemTemplate>
                            &nbsp;<asp:Label id="lab_needschedule" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.CNeedSchedule&quot;) %&gt;"></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="工序類型" Visible="false">
                            <ItemTemplate>
                            &nbsp;<asp:Label id="dg_lab_pricetype" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.CPriceType&quot;) %&gt;"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate><asp:dropdownlist id="dg_dpl_pricetype" runat="server">
                            <asp:ListItem Value="0">空</asp:ListItem>
                            <asp:ListItem Value="OUTSOURCE">外包</asp:ListItem>
                            <asp:ListItem Value="ZULI">組立</asp:ListItem>
                            <asp:ListItem Value="NEEDDESIGN">需設計</asp:ListItem>
                            </asp:dropdownlist>
                            </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="工時分類" Visible="false">
                            <ItemTemplate>
                            &nbsp;<asp:Label id="lab_processgroups" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessGroupsId&quot;) %&gt;"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate><asp:DropDownList ID="dg_dpl_processgroups" Runat="server"></asp:DropDownList>
                            </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="價格" Visible="false">
                            <ItemTemplate>
                            &nbsp;<asp:Label id="dg_lab_price" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Price&quot;) %&gt;"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate><asp:textbox id="dg_txt_price" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Price&quot;) %&gt;"></asp:textbox>
                            </EditItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="是否直接開始" Visible="false">
                            <ItemTemplate>
                            &nbsp;<asp:Label id="lab_startdirectly" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.CStartDirectly&quot;) %&gt;"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate><asp:DropDownList ID="dg_dpl_startdirectly" Runat="server">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:DropDownList>
                            </EditItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle Mode="NumericPages" CssClass="table-primary" ></PagerStyle>
                    </asp:datagrid>
                </div>
                <div class="container mt-3 border border-warning"><TABLE id="Table3" width="100%" align="center" class="tbMessage" border="0"><TR vAlign="middle">
                <TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
                </DIV>
                </B>
                </DIV>
                </TD>
                <TD class="msg" width="85%">
                &nbsp;&nbsp;<asp:label id="lab_message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label>
                </TD>
                </TR>
                </TABLE>
                </div>
                </div>
        </div>
    </div>
</asp:Content>
