<%@ Page language="c#" Codebehind="StandProcessTypeView.aspx.cs" MasterPageFile="~/DefaultSub.Master"  AutoEventWireup="false" Inherits="ModuleWorkFlow.StandProcessTypeView" %>
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
<div class="clearbox"></div>
</div>
</div>

<div id="Container">
    <div id="Content">
        <div id="Menu">
            <div class="menubox">
                <div class="mod1">
                    <ul>
                    <li class="btn1"><a href="#" title="新增 / add" onclick="popupDiv('pop-div')">新增/add</a>
                    </li>
                    <li class="btn5"><a href="StandProcessTypeList.aspx" title="編輯 / view">編輯/view</a>
                    </li>
                    <li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="刪除/save" OnClick="lnkbutton_save_Click">刪除/save</asp:LinkButton>
                    </li>
                    </ul>
                </div>

                <div class="clearbox"></div>
                </div>
        </div>
        <div class="container mt-3 border border-primary"> 
            <asp:label id=lab_standid Runat="server" Visible="False"></asp:label>
            <asp:label id=lab_parentid Runat="server" Visible="False"></asp:label>
            <div class="container mt-3">
                  <div class="row mb-3">
                   <div class="col-lg-6  d-flex">
                        <asp:label id=Label1 Runat="server" CssClass="me-10">類型名稱</asp:label>
                        <asp:textbox id=txt_standprocesstypename runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                    </div>
                    <div class="col-lg-6  d-flex">
                        <asp:label id=Label2 Runat="server" CssClass="me-10">父類名稱</asp:label>
                        <asp:dropdownlist id=ddl_parent runat="server" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
                    </div>

                 </div>
            </div>
        </div>
        <div class="container mt-3 border border-warning">
            <TABLE id="Table3" width="100%" align="center" class="tbMessage" border="0">
                <TR vAlign="middle">
            <TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
            </DIV>
            </B>
            </DIV>
            </TD>
            <TD class="msg" width="90%">
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

