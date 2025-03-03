﻿<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Page language="c#" Codebehind="BomDetailListCopy.aspx.cs" MasterPageFile="~/DefaultSub.Master"  AutoEventWireup="false" Inherits="ModuleWorkFlow.BomDetailListCopy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">
        <div id="Header">
            <div class="headbox">
            <div class="linebox">
            <a href="defaultmain.aspx">生產管理</a>
            <img src="images/arrow.png" />
            <a href="#"><%=menuname %></a>
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
                            <li class="btn1"><asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkbutton_addinput_Click" ToolTip="BOM匯入/BOM匯入">BOM匯入</asp:LinkButton>
                            </li>
                            <li class="btn2"><asp:LinkButton ID="LinkButton2" runat="server" OnClick="lnkbutton_editinput_Click" ToolTip="BOM匯入編輯/BOM匯入編輯">編輯/edit</asp:LinkButton>
                            </li>

                            <li class="btn2"><asp:LinkButton ID="lnkbutton_edit_detail" runat="server" 
                                    ToolTip="明細編輯/edit" onclick="lnkbutton_edit_detail_Click">明細編輯/edit</asp:LinkButton>
                            </li>
                            <li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎?'); ">刪除/delete</asp:LinkButton>
                            </li>

                            <li class="btn6"><asp:LinkButton ID="lnkbutton_delete_detail" runat="server"  
                                    ToolTip="明細刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎?'); " 
                                    onclick="lnkbutton_delete_detail_Click">刪除/delete</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <div class="mod2">
                        <ul>
                            <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                            </li>
                            <li class="btn9"><asp:LinkButton ID="lnkbutton_print" runat="server" ToolTip="列印/printer" OnClick="lnkbutton_print_Click" Visible="false">列印/printer</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
            <div class="clearbox"></div>
            </div>
        </div>
    <div class="container mt-3 border border-primary">
        <asp:label id="lab_User"  Runat="server" Visible="false"></asp:label>
        <div class="container mt-3">
            <div class="row mb-3">
                <div class="col-lg-6  d-flex">
				    <asp:label id="lab_moduleId" text="廠批" Runat="server" CssClass="me-10"></asp:label>
				    <asp:dropdownlist id="dpl_moduleId" Runat="server" AutoPostBack="True" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
												
                    <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="GetBOMListUnOver" ServicePath="selectModuleId.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_moduleId" ></ajaxToolkit:AutoCompleteExtender>
                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
				    <asp:button id="btn_search" Text="模具編號查詢" Runat="server" Visible="false"></asp:button>
					<asp:textbox id="txt_moduleId" Runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                </div>

                <div class="col-lg-2  d-flex">
                    <asp:DropDownList ID="dpl_Customer" runat="server" Width="150" AutoPostBack="true" OnSelectedIndexChanged="dpl_Costumer_OnSelectedIndexChanged" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>
                </div>
                <div class="col-lg-4  d-flex">
                     <asp:Label ID="Label1" runat="server" CssClass="me-10"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleShow"]%></asp:Label>
                    <asp:DropDownList ID="dpl_customerModuleId" runat="server" Width="150" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:DropDownList>         
                </div>           
            </div>

		 <div class="row mb-3">
            <div class="col-lg-4  d-flex">                                                                               
                <asp:Label ID="lab_productname" runat="server"  CssClass="me-10"></asp:Label>
                <asp:textbox id="txt_productname" Runat="server"  CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
            </div>
            <div class="col-lg-2  d-flex">        
                <asp:label id="Label2" text="審核狀態" Runat="server" CssClass="me-10"></asp:label> <asp:dropdownlist id="dpl_NeedMerchindised" runat="server" Visible="false"></asp:dropdownlist>
            </div>
            <div class="col-lg-4  d-flex"> 
                <asp:label id="Label5" text="圖號" Runat="server" CssClass="me-10"></asp:Label><asp:textbox id="Text_PartNo" Runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
            </div>
            
            </div>
            <div class="row mb-3">
                <div class="col-lg-6  d-flex">        
                      <asp:label id="Label3" text="創建從" Runat="server" CssClass="me-10"></asp:Label><asp:TextBox id="txt_from" runat="server" CssClass="date-picker form-control custom-heighter-width text-start border-primary me-1"></asp:TextBox>
     
                      <asp:label id="Label4" text="到" Runat="server" CssClass="me-10"></asp:Label><asp:TextBox id="txt_to" runat="server" CssClass="date-picker form-control custom-heighter-width text-start border-primary"></asp:TextBox>
     
                      <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>
                  </div>
                <div class="col-lg-5  d-flex">        
                    <asp:Label ID="lab_delete_moduleId" Text="需刪除廠批" runat="server"   CssClass="me-10"></asp:Label>
                    <asp:textbox id="txt_delete_moduleId" Runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                </div>      
                
                <div class="col-lg-3  d-flex">  
                    <asp:Label ID="lab_model" runat="server" Text="加工類型:"></asp:Label>
                    <asp:DropDownList ID="dpl_model" runat="server"></asp:DropDownList>
                </div>
              
            </div>
                               
                                
                                
		</div>
    </div>
    <div class="container mt-3 border border-primary">
        <asp:datagrid id="dg_BomDetail" runat="server" AutoGenerateColumns="False"  AllowPaging="True"  CssClass="table table-striped table-bordered table-hover table-sm" onitemdatabound="dg_BomDetail_ItemDataBound">
        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
        <Columns>
            <asp:TemplateColumn>
            <ItemTemplate>
            <asp:CheckBox runat="server" ID="chk_datagrid" />
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn Visible="False"><ItemTemplate>
            <asp:Label id="dg_bomDesignNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="moduleId">
            <HeaderTemplate><asp:Label id="dg_haeder_moduleId" runat="server" text='<%#System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_moduleId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ModuleId")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="PartNo">
            <HeaderTemplate><asp:Label id="dg_haeder_PartNo" runat="server" text="圖號"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_PartNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="PartName" HeaderStyle-Width="200px">
            <HeaderTemplate><asp:Label id="dg_haeder_PartName" runat="server" text="圖名"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_PartName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartName")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Spec" >
            <HeaderTemplate><asp:Label id="dg_haeder_Spec" runat="server" text="尺寸"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_Spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec","{0:d}")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="MaterialName" >
            <HeaderTemplate><asp:Label id="dg_haeder_MaterialName" runat="server" text="材質"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_MaterialName" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialName")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="RequireCount">
            <HeaderTemplate><asp:Label id="dg_haeder_RequireCount" runat="server" text="單件數量"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_RequireCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequireCount")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="ProductCount">
              <HeaderTemplate><asp:Label id="dg_haeder_ProductCount" runat="server" text="製造數量"></asp:Label>
              </HeaderTemplate>
              <ItemTemplate>
              <asp:Label id="dg_lab_ProductCount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductCount")%>'/>
              </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="InterfaceProcess"  >
                <HeaderTemplate><asp:Label id="dg_haeder_InterfaceProcess" runat="server" text="表面處理"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                <asp:Label id="dg_lab_InterfaceProcess" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InterfaceProcess")%>'/>
                </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="weight"  Visible="false">
            <HeaderTemplate><asp:Label id="dg_haeder_Weight" runat="server" text="重量"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_Weight" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Weight")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="requiredDate" Visible="false">
            <HeaderTemplate><asp:Label id="dg_haeder_RequiredDate" runat="server" text="需求日期"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_RequiredDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RequiredDate","{0:yy-MM-dd}")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="refSupplyId" Visible="false">
            <HeaderTemplate><asp:Label id="dg_haeder_RefSuppply" runat="server" text="參考供應商"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_RefSuppply" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.RefSupplyId")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="supplyId" Visible="false">
            <HeaderTemplate><asp:Label id="dg_haeder_Suppply" runat="server" text="指定供應商"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_Suppply" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SupplyId")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Request" Visible="false">
            <HeaderTemplate><asp:Label id="dg_haeder_Request" runat="server"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_Request" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Request")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Comment"  Visible="false">
            <HeaderTemplate><asp:Label id="dg_haeder_Comment" runat="server" text="備註"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_Comment" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="CreatedDate" >
            <HeaderTemplate><asp:Label id="dg_haeder_CreatedDate" runat="server" text="創建日期"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_CreatedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CreatedDate","{0:yy-MM-dd}")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="ChangedDate"  Visible="false">
            <HeaderTemplate><asp:Label id="dg_haeder_ChangedDate" runat="server" text="最後修改日期"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_ChangedDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ChangedDate","{0:yy-MM-dd}")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="BomApplySheetNo">
            <HeaderTemplate><asp:Label id="dg_haeder_BomApplySheetNo" runat="server" text="審購單號"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_BomApplySheetNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomApplySheetNo")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="BomApplyStatus">
            <HeaderTemplate><asp:Label id="dg_haeder_BomApplyStatus" runat="server" text="狀態"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
            <asp:Label id="dg_lab_BomApplyStatus" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.BomApplyStatus")%>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="OrderStatus" Visible="false">
                 <HeaderTemplate><asp:Label id="dg_haeder_OrderStatus" runat="server" text="狀態"></asp:Label>
                 </HeaderTemplate>
                 <ItemTemplate>
                 <asp:Label id="dg_lab_OrderStatus" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OrderStatusId")%>'/>
                 </ItemTemplate>
            </asp:TemplateColumn>
             <asp:ButtonColumn Text="審核"  ButtonType="PushButton" CommandName="Check" HeaderStyle-Width="40px" ></asp:ButtonColumn>
        </Columns>
        <AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
        <PagerStyle Mode="NumericPages" CssClass="table-primary"></PagerStyle>
    </asp:datagrid>
    </div>

    <div class="container mt-3 border border-warning"><table width="100%" align="center" class="tbMessage" border="0"><TR vAlign="middle">
    <TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示信息</B>
    </DIV>
    </B>
    </DIV>
    </TD>
    <TD class="msg" width="85%">
    &nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
        <asp:Label ID="lab_bomstyle" runat="server" Visible="false"></asp:Label>
    </TD>
    </TR>
    </table>
    </div>
    </div>
    </div>
    </div>
</asp:Content>
