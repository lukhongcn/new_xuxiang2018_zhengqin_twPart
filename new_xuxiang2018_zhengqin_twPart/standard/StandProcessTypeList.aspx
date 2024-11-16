<%@ Page language="c#" Codebehind="StandProcessTypeList.aspx.cs" MasterPageFile="~/DefaultSub.Master" AutoEventWireup="false" Inherits="ModuleWorkFlow.StandProcessTypeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    
    <div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
<a href="../defaultmain.aspx">生產管理 </a>
<img src="images/arrow.png" />
<a href="#"><%=menuname %> </a>
</div>
<div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a>
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
                <li class="btn1"><a href="StandProcessTypeView.aspx" title="新增 / add">新增/add</a>
                </li>
                <li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
                </li>
                <li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '是否確認刪除 '); ">刪除/delete</asp:LinkButton>
                </li>
                </ul>
            </div>

            <div class="clearbox"></div>
        </div>
    </div>
    <div class="container mt-3 border border-primary"> 
        <div class="container mt-3">
             <div class="row mb-3">
                 <div class="col-lg-4  d-flex align-items-start">
                    <asp:panel id=pan_treeview runat="server"></asp:panel>
                 </div>
                 <div class="col-lg-8  d-flex text-start">
                     <asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" 
                              CssClass="table table-striped table-bordered table-hover table-sm" Width="80%" 
                             onpageindexchanged="MainDataGrid_PageIndexChanged">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
                    <Columns>
                    <asp:TemplateColumn>
                    <ItemTemplate>
                    <asp:CheckBox runat="server" ID="chk_datagrid" />
                    </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn DataField="Id" ReadOnly="True" HeaderText="" Visible="false"></asp:BoundColumn>
                    <asp:TemplateColumn HeaderText="類型名稱">
                    <ItemTemplate><asp:Label id="Label1" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.TypeName&quot;) %&gt;"></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateColumn>
                    </Columns>
                    <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                    <PagerStyle Mode="NumericPages" CssClass="table-primary" ></PagerStyle>
                    </asp:datagrid>
                 </div>
             </div>
        </div>
    </div>
<div class="container mt-3 border border-warning">
<TABLE id="Table3" width="100%" align="center" class="tbMessage"><TR vAlign="middle">
<TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
</DIV>
</B>
</DIV>
</TD>
<TD class="msg" width="85%">
&nbsp;&nbsp;<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label>
</TD>
</TR>
</TABLE>
</div>
</div>
</div>
</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="JSHolder" runat="server">
</asp:Content>

