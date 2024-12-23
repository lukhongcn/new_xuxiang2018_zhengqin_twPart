<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"  %>
<%@ Page language="c#" Codebehind="ParRelation.aspx.cs" AutoEventWireup="false"  MasterPageFile="~/DefaultSub.Master" Inherits="ModuleWorkFlow.ParRelation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
    <div id="Wrapper">

    <div id="Header"><div class="headbox">
<div class="linebox">
<a href="defaultmain.aspx">生產管理</a>
<img src="images/arrow.png" />
<a href="#"><%=title %></a>
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
                             <li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" ToolTip="檢視" 
                                 onclick="lnkbutton_view_Click" ></asp:LinkButton>
                         </li>
                         <li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                         </li>

                             <li class="btn5"><asp:LinkButton ID="LinkButton1" runat="server" ToolTip="返回工序編輯" 
                                 onclick="LinkButton1_Click" ></asp:LinkButton>
                         </li>
                         </ul>
                         </div>
                         <div class="mod2"><ul>

                         <li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
                         </li>


                         </ul>
                         </div>
                         <div class="clearbox"></div>
                         </div>
            </div>
            <div class="container mt-3 border border-primary">
                 <asp:Label ID="lab_pageIndex" runat="server" Visible="false"></asp:Label>
                 <asp:Label ID="lab_PartdetailProcessnos" runat="server" Visible="false"></asp:Label>
                 <asp:Label ID="lab_Processno" runat="server" Visible="false"></asp:Label>
                    <div class="container mt-3">
                     <div class="row mb-3">
                        <div class="col-lg-4  d-flex">
                            <asp:Label ID="Label1" runat="server"  CssClass="me-10"><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></asp:Label><asp:Label ID="lab_moduleid" runat="server"  CssClass="me-10"></asp:Label>
                        </div>
                        <div class="col-lg-4  d-flex">
                            <asp:Label ID="Label2" runat="server"  CssClass="me-10">關聯圖號</asp:Label><asp:Label ID="lab_relPartno" runat="server"  CssClass="me-10"></asp:Label>
                        </div>
                        <div class="col-lg-4  d-flex">
                            <asp:Label ID="Label3" runat="server"  CssClass="me-10">關聯工藝</asp:Label><asp:Label ID="lab_relProcess" runat="server"  CssClass="me-10"></asp:Label>
                   
                        </div>
                    </div>

                   <div class="row mb-3">
                    <div class="col-lg-6  d-flex">
                        <asp:Label ID="lab_partno" runat="server" Text="圖號"  CssClass="me-10"></asp:Label>
                        <asp:textbox id="txt_partno" runat="server"  CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                    </div>

                     <div class="col-lg-6  d-flex">
                       <asp:Label ID="Label4" runat="server"  CssClass="me-10">圖號（不包含)</asp:Label><asp:textbox id="txt_expectedPartno" runat="server"  CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
                    </div>

                    </div>
           
                    </div>



            </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                <div class="container mt-3 border border-primary">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                <ContentTemplate>

                <asp:datagrid id="MainDataGrid" runat="server" AutoGenerateColumns="False"  AllowPaging="True" BorderWidth="0" CssClass="table table-striped table-bordered table-hover table-sm mt-3" PageSize="10" AllowCustomPaging="false" Width="800px">
                    	<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
                    <Columns>

                        <asp:TemplateColumn>
                            <HeaderTemplate> <input type="checkbox" id="selectAll" />
                        </HeaderTemplate>
                        <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chk_datagrid" OnCheckedChanged="MainDataGrid_CheckedChanged" AutoPostBack="true" />
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="Id">
	                        <HeaderTemplate>
		                        <asp:label id="Id" runat="server" Text='序號'/>
	                        </HeaderTemplate>
	                        <ItemTemplate>
		                        <asp:Label runat="server" ID="dg_lab_Id" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>'></asp:Label>
	                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="ModuleId">
	                        <HeaderTemplate>
		                        <asp:label id="dg_header_moduleid" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/>
	                        </HeaderTemplate>
	                        <ItemTemplate>
		                        <asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
		                        </asp:Label>
	                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="PartNo">
	                        <HeaderTemplate>
		                        <asp:label id="dg_header_moduleid" runat="server" Text='圖號'/>
	                        </HeaderTemplate>
	                        <ItemTemplate>
		                        <asp:Label runat="server" ID="dg_lab_PartNo" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>'>
		                        </asp:Label>
	                        </ItemTemplate>
                        </asp:TemplateColumn>
                         <asp:TemplateColumn HeaderText="材質" >
                            <ItemTemplate>
                                <asp:Label id="dg_lab_MaterialName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MaterialName") %>'/>
                        </ItemTemplate>
                        </asp:TemplateColumn>

                        <asp:TemplateColumn HeaderText="數量" >
                            <ItemTemplate>
                                <asp:Label id="dg_lab_PartCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>'/>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn HeaderText="名稱" >
                            <ItemTemplate>
                                <asp:Label id="dg_lab_PartName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'/>
                        </ItemTemplate>
                        </asp:TemplateColumn>

                        <asp:TemplateColumn HeaderText="圖片" Visible="false" ><ItemTemplate>
                        <asp:Label ID="picture" Text="" runat="server" Width="50px" Height="50px"></asp:Label>
                        <asp:Label id="dg_img_Picture" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.PartPicture&quot;) %&gt;" runat="server" Visible="False"></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateColumn>
                        <%--<asp:BoundColumn DataField="Process" HeaderText="工序" Visible="false" ></asp:BoundColumn>
                        <asp:BoundColumn DataField="DesignProcess" HeaderText="Design" Visible="false"></asp:BoundColumn>--%>

                        <asp:TemplateColumn HeaderText="預估工時" Visible="false"><ItemTemplate><asp:Label id="dg_lab_ProcessNeedMinutes" runat="server" />
                        </ItemTemplate>
                        </asp:TemplateColumn>

                    </Columns>
                    <PagerStyle Mode="NumericPages" CssClass="table-primary"></PagerStyle>
                </asp:datagrid>
                </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="container mt-3 border border-primary">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="True">
                        <ContentTemplate>
                <asp:datagrid id="dg_RelationGrid" runat="server" AutoGenerateColumns="False"  AllowPaging="false"  CssClass="table table-striped table-bordered table-hover table-sm mt-3" PageSize="10" AllowCustomPaging="True" Width="800px">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
            <Columns>

            <asp:TemplateColumn>
                <HeaderTemplate> <input type="checkbox" id="selectAll" />
            </HeaderTemplate>
            <ItemTemplate>
            <asp:CheckBox runat="server" ID="chk_datagrid" OnCheckedChanged="dg_RelationGrid_CheckedChanged" AutoPostBack="true"/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="Id" Visible="false">
	            <HeaderTemplate>
		            <asp:label id="Id" runat="server" Text='序號'/>
	            </HeaderTemplate>
	            <ItemTemplate>
                   <asp:Label runat="server" ID="dg_lab_Id" Text='<%# DataBinder.Eval(Container, "DataItem.Id") %>'></asp:Label>
	            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="ModuleId">
	            <HeaderTemplate>
		            <asp:label id="dg_header_moduleid" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'/>
	            </HeaderTemplate>
	            <ItemTemplate>
		            <asp:Label runat="server" ID="dg_lab_moduleid" Text='<%# DataBinder.Eval(Container, "DataItem.ModuleId") %>'>
		            </asp:Label>
	            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="PartNo">
	            <HeaderTemplate>
		            <asp:label id="dg_header_moduleid" runat="server" Text='零件編號'/>
	            </HeaderTemplate>
	            <ItemTemplate>
		            <asp:Label runat="server" ID="dg_lab_PartNo" Text='<%# DataBinder.Eval(Container, "DataItem.PartNo") %>'>
		            </asp:Label>
	            </ItemTemplate>
            </asp:TemplateColumn>
 
            <asp:TemplateColumn HeaderText="材質" >
                <ItemTemplate>
                    <asp:Label id="dg_lab_MaterialName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.MaterialName") %>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="數量" >
                <ItemTemplate>
                    <asp:Label id="dg_lab_PartCount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartCount") %>'/>
            </ItemTemplate>
            </asp:TemplateColumn>
            <asp:TemplateColumn HeaderText="名稱" >
                <ItemTemplate>
                    <asp:Label id="dg_lab_PartName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.PartName") %>'/>
            </ItemTemplate>
            </asp:TemplateColumn>

            <asp:TemplateColumn HeaderText="圖片" ><ItemTemplate>
            <asp:Label ID="picture" Text="" runat="server" Width="50px" Height="50px"></asp:Label>
            <asp:Label id="dg_img_Picture" Text="&lt;%# DataBinder.Eval(Container, &quot;DataItem.PartPicture&quot;) %&gt;" runat="server" Visible="False"></asp:Label>
            </ItemTemplate>
            </asp:TemplateColumn>
            <%--<asp:BoundColumn DataField="Process" HeaderText="工序" Visible="false" ></asp:BoundColumn>
            <asp:BoundColumn DataField="DesignProcess" HeaderText="Design" Visible="false"></asp:BoundColumn>--%>

            <asp:TemplateColumn HeaderText="預估工時" Visible="false"><ItemTemplate><asp:Label id="dg_lab_ProcessNeedMinutes" runat="server" />
            </ItemTemplate>
            </asp:TemplateColumn>

            </Columns>
            <PagerStyle Mode="NumericPages" CssClass="table-primary"></PagerStyle>
            </asp:datagrid>

                                  </ContentTemplate>
                    </asp:UpdatePanel>
            </div>

            <div class="container mt-3 border border-warning"><table width="100%" align="center" class="tbMessage"><TR vAlign="middle">
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



    <script>
        $('#selectAll').click(function (e) {
            var table = $(e.target).closest('table');
            $('td input:checkbox', table).prop('checked', this.checked);
        });

    </script>

</asp:Content>
