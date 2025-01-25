<%@ Page language="c#" Codebehind="OutSourceProcessOperatingDay.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutSourceProcessOperatingDay"  MasterPageFile="~/DefaultSub.Master"%>
<%@ Register TagPrefix="cc1" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <div id="Header"><div class="headbox">
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
                       <div class="mod1"><ul>
                       <li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton></li>
                       <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                       </li>

                       </ul>
                       </div>
                       <div class="clearbox"></div>
                    </div>
               </div>
              <div class="container mt-3 border border-primary">
                <div class="container mt-3">
                     <asp:button id="bnt_submission" runat="server" Text="選擇工序" visible="false"></asp:button>
                     <div class="row mb-3">
                              <div class="col-lg-6  d-flex">

                                <asp:dropdownlist id="Dropdownlist_Process" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
                                <asp:dropdownlist id="dpl_status" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-1">
                                <asp:ListItem Value="Ready">出廠</asp:ListItem>
                                <asp:ListItem Value="Implementation">回廠</asp:ListItem>
                                <asp:ListItem Value="Holdon">暫停</asp:ListItem>
   
                                </asp:dropdownlist>
                            </div>
                         <div class="col-lg-6  d-flex">
                              <asp:Label ID="Label4" runat="server" CssClass="me-10">箱子條碼</asp:Label>
                               <asp:textbox id="txt_qrcode" OnTextChanged="txt_qrcode_TextChanged" AutoPostBack="true" runat="server"  CssClass="form-control custom-height-width text-start border-primary"></asp:textbox>
                        </div>
                         </div>
                        <div class="row mb-3">
                        <div class="col-lg-4  d-flex">
                          <asp:Label ID="Label2" runat="server" CssClass="me-10">廠批</asp:Label>
                          <asp:textbox id="txt_searchmodelid" runat="server"  CssClass="form-control custom-height-width text-start border-primary"></asp:textbox>
                        </div>
                        <div class="col-lg-4  d-flex">
                          <asp:Label ID="Label3" runat="server" CssClass="me-10">圖號</asp:Label>
                          <asp:TextBox ID="txt_partno" runat="server"  CssClass="form-control custom-height-width text-start border-primary"></asp:TextBox>
                        </div>
                        <div class="col-lg-4  d-flex">
                          <asp:Label ID="Label5" runat="server" CssClass="me-10">人員</asp:Label>
                          <asp:TextBox ID="txt_userno" runat="server"  CssClass="form-control custom-height-width text-start border-primary"></asp:TextBox>
                       </div>
                    </div>

          
                    </div>
            </div>
             <div class="container mt-3 border border-primary">
            <asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False" AllowPaging="True"  CssClass="table table-striped table-bordered table-hover table-sm" style="table-layout:fixed;width: 100%;">
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" ></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
            <Columns>
                <asp:TemplateColumn HeaderText="選擇">
                <HeaderTemplate><asp:CheckBox id="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged"></asp:CheckBox>
                </HeaderTemplate>
                <ItemTemplate><asp:CheckBox id="CheckBox_Select" runat="server" Checked="False" OnCheckedChanged="CheckBox_Select_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="人員">
                <HeaderStyle Width="100px"></HeaderStyle>
                <ItemTemplate>
                <asp:TextBox id="dpl_txt_user" runat="server" Width="48px"></asp:TextBox>
                <asp:ImageButton id="dg_btn_user" runat="server" ImageUrl="images/search.GIF" Height="15" BorderStyle="None" ImageAlign="Bottom" OnClick="dg_btn_user_Click"></asp:ImageButton>
                <asp:dropdownlist id="dg_dpl_user" Visible="False" runat="server" AutoPostBack="True" onSelectedIndexChanged="dpl_userno_SelectedIndexChanged"></asp:dropdownlist>
                </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="日期" Visible="False">
                <HeaderStyle Width="100px"></HeaderStyle>
                <ItemTemplate><cc1:DatePicker id="dp_StartDate" runat="server" DateType="yyyy-mm-dd" imgDirectory="images/"></cc1:DatePicker>
                </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="時間">
                <HeaderStyle Width="60px"></HeaderStyle>
                <ItemTemplate><asp:dropdownlist id="dpl_StartTime" runat="server" AutoPostBack="True"></asp:dropdownlist>
                </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="ModuleId" HeaderText="廠批"></asp:BoundColumn>
                <%--<asp:BoundColumn DataField="PartNo_Id" HeaderText="箂ン絪腹ID" Visible="False"></asp:BoundColumn>--%>


                <asp:TemplateColumn  HeaderText="PartNo_Id">
                <HeaderTemplate><asp:Label id="Label_10" runat="server">子批</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                <asp:Label id="Label11" runat="server" Text='<%# new Utility.FileOperate().getJT(Convert.ToString(Eval("ModuleId")),Convert.ToString(Eval("PartNo_Id"))) %>'/>
                </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn  HeaderText="QRCode">
                    <HeaderTemplate><asp:Label id="Label_QRCode" runat="server">箱子條碼</asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                    <asp:Label id="lab_QRCode" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.QRCode") %>'/>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="拆箱">
                   
                    <ItemTemplate><asp:CheckBox id="unbound_Select" runat="server" Checked="true"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateColumn>
                 <asp:TemplateColumn HeaderText="數量">
                     <ItemTemplate><asp:TextBox id="txt_productNumber" runat="server" ></asp:TextBox>
                     </ItemTemplate>
                 </asp:TemplateColumn>
                 <asp:TemplateColumn HeaderText="可用數量" Visible="false">
                      <ItemTemplate><asp:Label id="lab_productNumber" runat="server"  ></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="產品"><ItemTemplate><asp:Label runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.PartName&quot;) %&gt;" ID="dg_lab_partno"></asp:Label>
                </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="processname" HeaderText="工序"></asp:BoundColumn>
                <asp:BoundColumn DataField="processorder" HeaderText="工序號"></asp:BoundColumn>
                <asp:TemplateColumn HeaderText="狀態"><ItemTemplate><asp:Label runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.StatusDesc&quot;) %&gt;" ID="Label1"></asp:Label>
                </ItemTemplate>
                </asp:TemplateColumn>
                 <asp:TemplateColumn HeaderText="答復交期" HeaderStyle-Width ="110px">
                          <ItemTemplate>
                              <%# 
                                  Eval("ConfirmDate") == DBNull.Value || (DateTime?)Eval("ConfirmDate") == DateTime.MinValue
                                  ? "" 
                                  : Eval("ConfirmDate", "{0:yyyy-MM-dd HH:mm}")
                              %>
                          </ItemTemplate>
                      </asp:TemplateColumn>
                <asp:BoundColumn DataField="StartDate" HeaderText="出廠日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false"></asp:BoundColumn>
                <asp:BoundColumn DataField="EndDate" HeaderText="需求日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false"></asp:BoundColumn>
                <asp:BoundColumn DataField="FactStartDate" HeaderText="實際開始日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"  Visible="false"></asp:BoundColumn>
                <asp:BoundColumn DataField="FactEndDate" HeaderText="實際結束日期" DataFormatString="{0:yyyy-MM-dd HH:mm}"  Visible="false"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="ProcessNeedMinutes" HeaderText="排程工時"></asp:BoundColumn>
               
                <asp:BoundColumn Visible="False" DataField="StatusColor" HeaderText="color"></asp:BoundColumn>
                <asp:BoundColumn Visible="False" DataField="Statusid" HeaderText="statusid"></asp:BoundColumn>
                <asp:TemplateColumn  HeaderText="" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessNo") %>' ID="dg_lab_ProcessNo"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:BoundColumn Visible="False" DataField="ProcessId" HeaderText="ProcessId"></asp:BoundColumn>
                <asp:TemplateColumn HeaderText="價格"><ItemTemplate>
                <asp:TextBox id="txt_UnitPriceNoTax"  runat="server"></asp:TextBox>
                </ItemTemplate>
                </asp:TemplateColumn>

                <asp:TemplateColumn HeaderText="暫停描述" Visible="false"><ItemTemplate>
                <asp:TextBox Width="100" Height="120" Visible="False" ID="txt_comment" Runat="server"></asp:TextBox>
                </ItemTemplate>
                </asp:TemplateColumn>



            </Columns>
            <PagerStyle Mode="NumericPages" CssClass="table-primary" ></PagerStyle>
        </asp:datagrid>
        </div>
          <div  class="container mt-3 border border-primary">
            <table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
        <TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
        </DIV>
        </B>
        </DIV>
        </TD>
        <TD class="msg" width="85%">
        &nbsp;&nbsp;<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label>
        </TD>
        </TR>
        </table>
        </div>
        </div>
    </div>
    </div>
</asp:Content>

