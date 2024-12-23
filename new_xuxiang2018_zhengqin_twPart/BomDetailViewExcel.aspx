<%@ Page language="c#" Codebehind="BomDetailViewExcel.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.BomDetailViewExcel" MasterPageFile="~/DefaultSub.Master"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
	<div id="Wrapper">
		<div id="Header">
			<div class="headbox">
			<div class="linebox">
			<a href="#">生產管理</a>
			<img src="images/arrow.png" />
			<a href="#"><%=menuname %></a>
			</div>
			<div class="logout"><a href="login.aspx">登出</a>
			</div>
			<div class="clearbox"></div>
			</div>
		</div>
		
		<div id="Container">
			<div id="Content">
				<div id="Menu">
					<div class="menubox">
					<div class="mod1"><ul>
					<li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" OnClick="lnkbutton_addinput_Click" ToolTip="新增/add">新增</asp:LinkButton>
					</li>
					<li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
					</li>
					<li class="btn5"><asp:LinkButton id="lnkbutton_view" runat="server" 
							ToolTip="檢視/vies" onclick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
					</li>
					</ul>
					</div>
					<div class="mod2"></div>
					<div class="clearbox"></div>
					</div>
				</div>
				<div class="space1"></div>
				<div class="container mt-3 border border-primary">
					<asp:label id="func" runat="server" Text="" Visible="False"></asp:label>
					<asp:label id="lab_menu" runat="server" Text="" Visible="False"></asp:label>
					<asp:button id="btn_add_edit" runat="server" Text="保存" Visible="false"></asp:button>
					<asp:label id="lab_User" runat="server" Visible="False"></asp:label>
					<asp:Label ID="lab_bomstyle" runat="server" Visible="false"></asp:Label>
					<asp:label id="lab_Id" runat="server" Visible="False"></asp:label>
					<asp:label id="lab_designNo" runat="server" Visible="False"></asp:label>
					<div class="container mt-3">
					<div class="row mb-3">
							<div class="col-lg-6  d-flex">
								<asp:label id="Label1" runat="server" ><%= System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%></asp:label>
							</div>
    		
							<div class="col-lg-6  d-flex">
								<asp:TextBox id="txt_moduleId" AutoPostBack="True" Runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:TextBox>
								<ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" ServiceMethod="GetNewBOMList" ServicePath="selectModuleId.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_moduleId" ></ajaxToolkit:AutoCompleteExtender>
							</div>
            										
					</div>
					<div class="row mb-3">
						<div class="col-lg-6  d-flex">
							<asp:label id="lab_creater" runat="server" Text="創建人" CssClass="me-10"></asp:label>
							<asp:label ID="txt_creater" runat="server" Text=""></asp:label>
							<%--<ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" ServiceMethod="GetCompleteList" ServicePath="selectUser.asmx" Enabled="true" MinimumPrefixLength="1" CompletionSetCount="10" TargetControlID="txt_creater"></ajaxToolkit:AutoCompleteExtender>--%>
							<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
						</div>
						<div class="col-lg-6  d-flex">
							<asp:label id="Label2" runat="server" Text="創建日期" CssClass="me-10"></asp:label>
							<asp:label id="lab_createDate" runat="server" Text=""  CssClass="me-10"></asp:label>
						</div>
					</div>
					<div class="row mb-3">
						
						<div class="col-lg-12  d-flex">
							<asp:textbox id="txt_content" runat="server" TextMode="MultiLine" Height="400px" Width="900px" CssClass="form-control text-start border-primary"></asp:textbox>
					    </div>
					</div>
														
														
														
					</div>
					<asp:datagrid id="dg_error" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-sm">
						<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
						<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" CssClass="wrap-text"/>
						<Columns>
							<asp:BoundColumn DataField="ErrorLine" HeaderText="行數"></asp:BoundColumn>
							<asp:BoundColumn DataField="ErrorMessage" HeaderText="錯誤原因"></asp:BoundColumn>
						</Columns>
					</asp:datagrid>
				</div>
				<div class="container mt-3 border border-warning"><table width="100%" align="center" class="tbMessage" border="0"><TR vAlign="middle">
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
