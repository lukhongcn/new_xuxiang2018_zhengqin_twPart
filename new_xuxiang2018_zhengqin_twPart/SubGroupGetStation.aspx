<%@ Page Language="c#" CodeBehind="SubGroupGetStation.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.SubGroupGetStation" MasterPageFile="~/DefaultSub.Master" %>

<%@ Register TagPrefix="uc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <div id="Header">
            <div class="headbox">
                <div class="linebox">
                    <a href="defaultmain.aspx">生產管理</a>
                    <img src="images/arrow.png" />
                    <a href="#"><%=menuname%></a>
                </div>
                <div class="logout">
                    <a href="login.aspx" target="_parent">登出</a>
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
                                    <uc:OneClickButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</uc:OneClickButton></li>
                                <li class="btn6">
                                    <asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="清空/cancel">清空/cancel</asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                        <div class="mod2">
                        </div>
                        <div class="clearbox"></div>
                    </div>
                </div>
                <div class="container mt-3 border border-primary">
                    <div class="container mt-3">
                        <asp:Label ID="lab_hiddenActionId" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_repeate" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_hiddenModuleId" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_hiddenPartNo" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_doingProductNumber" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_partno" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_moduleId" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="lab_hiddennumvalue" runat="server" Visible="False"></asp:Label>
                        <asp:Button ID="btn_submit" runat="server" Text="提 交" Visible="False"></asp:Button>
                        <asp:Label ID="lab_hiddenprocess" runat="server" Visible="False"></asp:Label>
                        <asp:Button ID="Button1" runat="server" Text="清空" Visible="False"></asp:Button>
                        <asp:Label ID="lab_user_value" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_machine_ipaddress" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                        <asp:Label ID="lab_hiddenWorkHours" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lab_combineStamp" Text="0" runat="server" Visible="False"></asp:Label>

                        <div class="row mb-3">
                            <div class="col-lg-9  d-flex">
                                <asp:Label ID="Label1" runat="server" Text="條碼刷入" CssClass="me-10"></asp:Label>
                                <asp:TextBox ID="txt_partCount" runat="server" AutoPostBack="true" OnTextChanged="txt_partCount_TextChanged" CssClass="form-control custom-height-width text-start border-primary"></asp:TextBox>
                            </div>

                            <div class="col-lg-3  d-flex">
                                <asp:Label ID="lab_hidden_machine" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-3  d-flex">
                                <asp:DropDownList ID="drp_processlist" runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                            </div>
                            <div class="col-lg-3  d-flex">
                                <asp:Label ID="lab_user" runat="server" Text="操作者" CssClass="me-10"></asp:Label>
                                <asp:Label ID="lab_username" runat="server" ForeColor="Red" CssClass="me-10"></asp:Label>
                            </div>
                            <div class="col-lg-3  d-flex">
                                <asp:Label ID="lab_action" runat="server" Text="操作" CssClass="me-10"></asp:Label>
                                <asp:Label ID="lab_actionvalue" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                            <div class="col-lg-3  d-flex">
                                <asp:Label ID="lab_machine" runat="server" Text="機台編號" CssClass="me-10"></asp:Label>
                                <asp:Label ID="lab_machine_value" runat="server" ForeColor="Red"></asp:Label>
                            </div>

                        </div>
                        <div class="row mb-3">
                            <div class="col-lg-6  d-flex">
                                <asp:CheckBox ID="chk_combine" runat="server" Text="合併加工" />
                            </div>
                            <div class="col-lg-6  d-flex">
                                <asp:Label ID="Label10" runat="server" CssClass="me-10">合併條碼</asp:Label>
                                <asp:TextBox ID="txt_combine_qrCode" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:TextBox>
                            </div>
                        </div>
                          <div class="row mb-3">
                             <div class="col-lg-6    d-flex">
                                 <asp:Label ID="lab_Ineligibility_qrCode" runat="server" CssClass="me-10" Visible="false">NG合併條碼</asp:Label>
                                 <asp:TextBox ID="txt_Ineligibility_qrCode" runat="server" CssClass="form-control custom-large-width text-start border-primary" Visible="false"></asp:TextBox>
                             </div>
                        </div>
                    </div>
                </div>
                <div class="container mt-3 border border-primary">
                    <div class="container mt-3">
                        <div class="row mb-3">

                            <div class="col-lg-12  d-flex flex-column">
                                <asp:Repeater ID="rptDynamicGrids" runat="server" OnItemDataBound="rptDynamicGrids_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="w-100 mb-3">
                                            <asp:Panel ID="pnlGridTitle" runat="server" CssClass="mb-2">
                                                <asp:Label ID="lab_gridTitle" runat="server" ForeColor="Red"></asp:Label>
                                            </asp:Panel>
                                            <asp:DataGrid ID="dgDynamic" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-sm" Style="table-layout: fixed; width: 100%;">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text" />
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="選擇" HeaderStyle-Width="40px" >
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="checkall" runat="server" AutoPostBack="true" OnCheckedChanged="chkall_onchanged" Checked="true"></asp:CheckBox>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox_Select" runat="server" Checked="true"></asp:CheckBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>


                                        <asp:TemplateColumn HeaderStyle-Width="100px">
                                            <HeaderTemplate>
                                                <asp:Label ID="dg_header_moduleid" runat="server" Text="廠批號" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_moduleid" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Moduleid&quot;) %&gt;" ForeColor="red"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="PartNo_Id" HeaderStyle-Width="110px">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label_10" runat="server">子批</asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_partnoId" runat="server" Text='<%# new Utility.FileOperate().getJT(Convert.ToString(Eval("ModuleId")),Convert.ToString(Eval("PartNo_Id"))) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderStyle-Width="110px">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label_CustomerProcessName" runat="server">工序名稱</asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_customerProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CustomerProcessName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="ProcessOrder" HeaderText="工序編號" Visible="false"></asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText=""  HeaderStyle-Width="70px">
                                            <HeaderTemplate>
                                                <asp:Label runat="server" ID="dg_header_Count" Text="接單數量"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txt_productNumber" runat="server" CssClass="form-control custom-number-width text-start border-primary"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="可用數量" Visible="true">
                                            <ItemTemplate>
                                                <asp:Label ID="lab_productNumber" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="QRCode" HeaderStyle-Width="170px">
                                            <HeaderTemplate>
                                                <asp:Label runat="server" ID="dg_header_QRCode" Text="分箱條碼"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="dg_txt_QRCode" runat="server" CssClass="form-control custom-height-width text-start border-primary"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn Visible="False">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label3" runat="server" Text="" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_processno" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessNo&quot;) %&gt;"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderStyle-Width="110px">
                                            <HeaderTemplate>
                                                <asp:Label ID="lab_next" runat="server" Text="下一工站" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_NextStation" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.NextProcess&quot;) %&gt;"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn Visible="false">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label6" runat="server" Text="完成日期" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_FactFinishedCount" runat="server" Text="&lt;%# Utility.tools.MinvalueDateTime(DataBinder.Eval(Container, &quot;DataItem.FactEndDate&quot;)) %&gt;"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn Visible="false">
                                            <HeaderTemplate>
                                                <asp:Label ID="dg_header_statusid" runat="server" Text="狀態" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                 <asp:Label ID="dg_lab_statuscode" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StatusId") %>'></asp:Label>
                                                <asp:Label ID="dg_lab_statusid" runat="server" Text="&lt;%# Utility.Methods.TranslateStatusName(DataBinder.Eval(Container, &quot;DataItem.StatusId&quot;).ToString()) %&gt;"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>






                                        <asp:TemplateColumn Visible="false">
                                            <HeaderTemplate>
                                                <asp:Label ID="dg_header_qcprocesslist" runat="server" Text="qcprocesslist" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_qcprocesslist" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.ProcessList&quot;) %&gt;"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn Visible="false">
                                            <HeaderTemplate>
                                                <asp:Label ID="dg_header_qccustomerprocesslist" runat="server" Text="qccustomerprocesslist" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="dg_lab_qccustomerprocesslist" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.CustomerProcessList&quot;) %&gt;"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn Visible="false">
                                            <HeaderTemplate>
                                                <asp:Label ID="dg_header_Ineligibility" runat="server" Text="Ineligibility" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="dg_lab_Ineligibility" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Ineligibility&quot;) %&gt;"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn Visible="false" HeaderStyle-Width="70px">
                                            <HeaderTemplate>
                                                <asp:Label ID="dg_header_Eligibility" runat="server" Text="合格數量" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="dg_lab_Eligibility" runat="server" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.Eligibility&quot;) %&gt;" CssClass="form-control custom-number-width text-start border-primary"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn Visible="false" HeaderStyle-Width="160px">
                                            <HeaderTemplate>
                                                <asp:Label ID="dg_header_IneligibilityQR" runat="server" Text="不合格條碼" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:TextBox ID="dg_txt_IneligibilityQR" runat="server" CssClass="form-control custom-height-width text-start border-primary"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="暫停描述">
                                            <ItemTemplate>
                                                <asp:TextBox Width="100" Height="120" ID="txt_hold_comment" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                    </Columns>
                                </asp:DataGrid>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>

                </div>

                <div class="container mt-3 border border-warning">
                    <table width="100%" align="center" class="tbMessage" border="0">
                        <tr valign="middle">
                            <td width="15%" style="height: 13px">
                                <div align="center">
                                    <b>
                                        <div align="center">
                                            <b>提示</b>
                                        </div>
                                    </b>
                                </div>
                            </td>
                            <td class="msg" width="85%" style="height: 13px">&nbsp;&nbsp;<asp:Label ID="Label_Message" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


