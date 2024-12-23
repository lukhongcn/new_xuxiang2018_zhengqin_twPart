<%@ Page language="c#" Codebehind="StandardPartAddEdit.aspx.cs" AutoEventWireup="false"  MasterPageFile="~/DefaultSub.Master" Inherits="ModuleWorkFlow.StandardPartAddEdit" smartNavigation="True" MaintainScrollPositionOnPostback="true" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <div id="Header"><div class="headbox">
        <div class="linebox">
        <a href="#">生產管理</a>
        <img src="../images/arrow.png" />
        <a href="#"><%=title %></a>
        </div>
        <div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a></div>
        <div class="clearbox"></div>
        </div>
        </div>
       
        <div id="Container">
            <div id="Content">
                 <div id="Menu">
                     <div class="menubox">
                         <div class="mod1">
                             <ul>
                             <li class="btn1"><asp:LinkButton ID="LinkButton1" runat="server" ToolTip="新增/add" OnClick="lnkbutton_add_Click">新增/add</asp:LinkButton>
                             </li>
                             <li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                             </li>
                             <li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" ToolTip="檢視/view" OnClick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
                             </li>
                             </ul>
                         </div>
                         <div class="mod2"></div>
                         <div class="clearbox"></div>
                     </div>
                 </div>
                <div class="space1"></div>
                <div class="container mt-3 border border-primary">
                   
                <asp:label id="Label_HiddenFuncMode" runat="server" Visible="False"></asp:label>
                <asp:label id="Label_HiddenSelectRow" runat="server" Visible="False"></asp:label>
                <BR>
                <div class="container mt-3">
                     <div class="row mb-3">
                         <div class="col-lg-6  d-flex">
                            <asp:Label ID="Label1" runat = "server" Text = "標準工藝類型"  CssClass="me-10"/>
                            <asp:dropdownlist id="dpl_standardtype" runat="server" AutoPostBack="True"  CssClass="form-select custom-heighter-width  text-start border-primary me-1"/>
                       
                        </div>
                        <div class="col-lg-6  d-flex">
                            <asp:Label ID="Label2" runat = "server" Text = "標準工藝名稱"  CssClass="me-10"/>
                            <asp:textbox id="txt_name" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>&nbsp;&nbsp;&nbsp;
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-lg-12  d-flex">
                        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                             <ContentTemplate>
                            <div class="container mt-3">
                                <div class="row g-0 mb-3">
                                     <div class="col-lg-4  d-flex">
                                           <asp:Label ID="Label3" runat = "server" Text = "工藝類型"  CssClass="me-10"/>
                                           <asp:DropDownList ID="dpl_processGroup" runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1" OnSelectedIndexChanged="dpl_processGroup_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                     </div>
                                </div>
                                <div class="row g-0 mb-3">
                                    <div class="col-lg-3  d-flex">
                                        <div class="overflow-auto border border-primary" style="height: 400px; width:250px;" onscroll="saveScrollPosition()" >
                                            
                                            <asp:checkboxlist id="CheckBoxList_Process" runat="server" AutoPostBack="True" RepeatDirection="Vertical"  repeatcolumns="1" Width="200px"  RepeatLayout="Table"   ></asp:checkboxlist>
                                           
                                        </div>
                                    </div>
                                   <div class="col-lg-9  d-flex">
                                    <asp:datagrid id="MainDataGrid" runat="server" 
                                            AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-sm" style="height: 40px; overflow-y: auto;"
                                            onitemcreated="MainDataGrid_ItemCreated" >
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary"  Wrap="true"></HeaderStyle>
                                    <Columns>
                                        <asp:ButtonColumn Text="選擇" ButtonType="PushButton" CommandName="Select" HeaderStyle-Width="40px"></asp:ButtonColumn>
                                        <asp:TemplateColumn HeaderText="加工順序" HeaderStyle-Width="40px"><ItemTemplate><asp:Label runat="server" ID="Label_OrderNo" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ListOrder&quot;) %&gt;"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn Visible="False" HeaderText="工序編號"><ItemTemplate><asp:Label runat="server" ID="Label_ProcessID" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessID&quot;) %&gt;"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="工序名稱"><ItemTemplate><asp:Label runat="server" ID="Label_ProcessName" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessName&quot;) %&gt;"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                  
                                        <asp:TemplateColumn HeaderText="分鐘" ><ItemTemplate><asp:TextBox Runat="server" ID="dg_txt_minute" Width="40" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessNeedMinutes&quot;) %&gt;"></asp:TextBox>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="抽檢率(%)" ><ItemTemplate>
                                             <asp:TextBox Runat="server" ID="dg_txt_qcPercent" Width="40" 
                     Text='<%# string.Format("{0:P0}", Eval("QCPercent")) %>' />
                                             </ItemTemplate>
                                        </asp:TemplateColumn>
                                         <asp:TemplateColumn HeaderText="注意事項"  HeaderStyle-Width="200px">
                                             <ItemTemplate>
                                                 <asp:TextBox ID="txt_processComment" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.processComment&quot;) %&gt;"></asp:TextBox>
                                             </ItemTemplate>
                                         </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="外發廠商">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="dpl_Supply" runat="server"></asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="id" Visible="false"><ItemTemplate><asp:Label runat="server" ID="lab_id" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Id&quot;) %&gt;"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="ProcessNo" Visible="false"><ItemTemplate><asp:Label runat="server" ID="lab_ProcessNo" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessNo&quot;) %&gt;"></asp:Label>
                                        </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:ButtonColumn Text="上移" ButtonType="PushButton" HeaderText="" CommandName="Upper" HeaderStyle-Width="40px"></asp:ButtonColumn>
                                        <asp:ButtonColumn Text="下移" ButtonType="PushButton" CommandName="Lower" HeaderStyle-Width="40px"></asp:ButtonColumn>
                                        <asp:ButtonColumn Text="刪除" ButtonType="PushButton" CommandName="Delete" HeaderStyle-Width="40px"></asp:ButtonColumn>
                                     
                                        
                                       
                                    </Columns>
                                    </asp:datagrid>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </ContentTemplate>
                             <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="MainDataGrid" EventName="ItemCommand" />
                                    <asp:AsyncPostBackTrigger ControlID="CheckBoxList_Process" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="dpl_processGroup" EventName="SelectedIndexChanged" />
                             </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="container mt-3 border border-warning">
                <TABLE id="Table3" width="100%" align="center" class="tbMessage" border="0"><TR vAlign="middle">
                    <TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
                    </DIV>
                    </B>
                    </DIV>
                    </TD>
                    <TD class="msg" width="85%">
                    &nbsp;&nbsp;<asp:label id="Label_Message" runat="server" Font-Bold="True" ForeColor="RED"></asp:label>
                    <asp:label id="lab_zuli" runat="server" Visible="false"></asp:label>
                    </TD>
                    </TR>
                </TABLE>
            </div>
        </div>
    </div>
 </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="JSHolder" runat="server">
        
   
        <script type="text/javascript">
            // 保存滚动位置
            function saveScrollPosition() {
                sessionStorage.setItem('scrollPosition', document.querySelector('.overflow-auto').scrollTop);
            }

            // 恢复滚动位置
            function restoreScrollPosition() {
        var scrollPos = sessionStorage.getItem('scrollPosition');
            if (scrollPos) {
                document.querySelector('.overflow-auto').scrollTop = scrollPos;
        }
    }

            // 页面加载后恢复滚动位置
            Sys.Application.add_load(function() {
                restoreScrollPosition();
    });
        </script>

   
</asp:Content>


