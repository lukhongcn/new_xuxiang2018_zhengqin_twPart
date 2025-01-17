<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Page language="c#" Codebehind="PartBarcodeScan.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartBarcodeScan" MasterPageFile="~/DefaultSub.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <div id="Header">
            <div class="headbox">
                <div class="linebox">
                <a href="defaultmain.aspx">生產管理</a>
                <img src="images/arrow.png" />
                <a href="#"><%=menuname%></a>
                </div>
                <div class="logout"><a href="login.aspx" TARGET="_parent">登出</a>
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
                                <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="保存/save" OnClick="lnkbutton_save_Click">保存/save</asp:LinkButton>
                            </li>
                           
                        </ul>
                    </div>
                    <div class="mod2">
                        <ul>
                             <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
        <div class="container mt-3 border border-primary">
            <div class="container mt-3">
                <asp:label id="lab_seach_moduleid" runat="server" visible="false"></asp:label>
                <asp:label id="lab_type" Visible="False" Runat="server"></asp:label>
                <div class="container mt-3">
                    <div class="row mb-3">
                        <div class="col-lg-7  d-flex">
                           <asp:Label ID="Label1" runat="server" CssClass="me-10">子批</asp:Label>
                            <asp:dropdownlist id="Dropdownlist_ModuleId" runat="server" AutoPostBack="True" CssClass="form-selectcustom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
                            <asp:textbox id="txt_moduleid" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                        </div>
                        <div class="col-lg-5  d-flex">
                            <asp:Label ID="Label2" runat="server" CssClass="me-10">箱號</asp:Label>
                            <asp:textbox id="txt_partnoid" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-3 border border-primary">
            <asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False"  AllowPaging="True"  CssClass="table table-striped table-bordered table-hover table-sm"  AllowCustomPaging="true" style="table-layout:fixed;width: 100%;" >
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" ></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
            <Columns>

                  <asp:TemplateColumn HeaderStyle-Width ="170px" >
                    <HeaderTemplate>
                     <asp:Label id="lab_header_QRCode"  runat="server" >箱子條號</asp:Label>
                 </HeaderTemplate>
                 <ItemTemplate>
                 <asp:TextBox id="txt_QRCode" runat="server" onkeydown="handleEnterKey(event, this)" Text='<%# DataBinder.Eval(Container, "DataItem.QRCode") %>' CssClass="form-control custom-height-width text-start border-primary" />
                 </ItemTemplate>
                </asp:TemplateColumn>
                  <asp:TemplateColumn  HeaderText="ModuleId" HeaderStyle-Width="100px">
                      <HeaderTemplate>
                          <asp:Label id="lab_header_ModuleId" runat="server" >子批號</asp:Label>
                      </HeaderTemplate>
                      <ItemTemplate>
                      <asp:Label id="lab_ModuleId" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>' />
                      </ItemTemplate>
                  </asp:TemplateColumn>
                  <asp:TemplateColumn  HeaderText="PartNo_Id" HeaderStyle-Width="100px">
                      <HeaderTemplate><asp:Label id="Label_10" runat="server">箱號</asp:Label>
                      </HeaderTemplate>
                      <ItemTemplate>
                      <asp:Label id="lab_PartNo_Idtemp" runat="server" Text='<%# new Utility.FileOperate().getJT(Convert.ToString(Eval("ModuleId")),Convert.ToString(Eval("PartNo_Id"))) %>'/>
                      </ItemTemplate>
                  </asp:TemplateColumn>

                  <asp:BoundColumn DataField="Priority" HeaderText="等級" Visible="false"></asp:BoundColumn>
                  <asp:TemplateColumn HeaderText="工序" HeaderStyle-Width="550px"><ItemTemplate>
                      <asp:Label runat="server" ID="Label_ProcessName" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessName") %>' ></asp:Label>
                       <asp:Label runat="server" ID="dg_lnk_ProcessName" Text='' Visible="false"></asp:Label>
                  </ItemTemplate>
                  </asp:TemplateColumn>
               
                

                  <asp:TemplateColumn  HeaderText="PartNo_Id" Visible="false">
                      <HeaderTemplate><asp:Label id="Label_101" runat="server" >零件編號</asp:Label>
                      </HeaderTemplate>
                      <ItemTemplate>
                      <asp:Label id="lab_PartNo_Id" runat="server"  Text='<%# DataBinder.Eval(Container, "DataItem.PartNo_Id") %>' />
                      </ItemTemplate>
                  </asp:TemplateColumn>

                 
                  <asp:TemplateColumn  HeaderText="ProcessNo" Visible="false">

                      <ItemTemplate>
                      <asp:Label id="lab_ProcessNo" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.ProcessNo") %>'/>
                      </ItemTemplate>
                  </asp:TemplateColumn>
            </Columns>
            <PagerStyle Mode="NumericPages" CssClass="table-primary"></PagerStyle>
            </asp:datagrid>
       
        <table style="BORDER-COLLAPSE: collapse" cellSpacing="0" width="100%"  >
            <tr>
            <td align="right">
                當前第:
                <asp:Label id ="lab_nowpage" runat ="server"></asp:Label>
                頁
                共:
            <asp:Label id="lab_totalpagte" runat ="server"  ></asp:Label>
                頁
            <%--<asp:linkbutton id="btnFirst" runat="server" CommandArgument="fist" >首頁</asp:linkbutton>--%>&nbsp;&nbsp;
            <asp:linkbutton id="btnPrev" runat="server" Width="36px" CommandArgument="prev" OnClick ="btnPrev_Click">上一頁</asp:linkbutton>&nbsp;&nbsp;
            <asp:linkbutton id="btnNext" runat="server" CommandArgument="next" OnClick ="btnNext_Click">下一頁</asp:linkbutton>&nbsp;&nbsp;
            <%--<asp:linkbutton id="btnLast" runat="server" CommandArgument="last">末頁</asp:linkbutton>&nbsp;&nbsp;--%>
            <asp:label id="lblCurrentIndex" runat="server"></asp:label>/<asp:label id="lblPageCount" runat="server"></asp:label>&nbsp;&nbsp; 
            跳轉到<asp:TextBox id="txtGoPage" runat="server" Width="30px" ></asp:TextBox>
            <asp:Button id="btnGo" runat="server" Text="GO" CssClass="button" Width="29px" OnClick="btnGo_Click"></asp:Button></td>
            </tr>
        </table>
         </div>
        <div class="container mt-3 border border-primary"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
        <TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
        </DIV>
        </B>
        </DIV>
        </TD>
        <TD class="msg" width="85%">
        &nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
        </TD>
        </TR>
        </table>
        </div>
        </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="JSHolder" runat="server">
    <script type="text/javascript">
        function handleEnterKey(event, currentElement) {
        if (event.keyCode === 13) { // 13 is the key code for Enter
            event.preventDefault(); // Prevent default behavior (e.g., form submission)

            // Find the next input element
            var inputs = document.querySelectorAll('input[type="text"]');
            var index = Array.prototype.indexOf.call(inputs, currentElement);
            if (index >= 0 && index < inputs.length - 1) {
                inputs[index + 1].focus(); // Focus the next input
            }
        }
    }
    </script>
</asp:Content>