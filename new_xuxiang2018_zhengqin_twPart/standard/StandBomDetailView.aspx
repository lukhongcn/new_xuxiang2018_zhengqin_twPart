<%@ Page language="c#" Codebehind="StandBomDetailView.aspx.cs" MasterPageFile="~/DefaultSub.Master" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.StandBomDetailView" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
	<div id="Wrapper">
		<div id="Header">
			<div class="headbox">
				<div class="linebox">
				<a href="../defaultmain.aspx">系統設定</a>
				<img src="images/arrow.png" />
				<a href="#"><%=menuname %></a>
				</div>
				<div class="logout"><a href="../login.aspx" TARGET="_parent">祅</a>
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
							<li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" 
									ToolTip="新增 / add" onclick="lnkbutton_add_Click">新增/add</asp:LinkButton>
							</li>
							<li class="btn3"><asp:LinkButton ID="lnkbutton_edit" runat="server" ToolTip="保存/save" OnClick="lnkbutton_save_Click">保存/save</asp:LinkButton>
							</li>
							<li class="btn5"><a href="StandBomDetailList.aspx" title="保存 / view">浪跌/view</a>
							</li>
							</ul>
						</div>
						<div class="mod2"></div>
						<div class="clearbox"></div>
					</div>
				</div>
				<div class="space1"></div>
				<div class="container mt-3 border border-primary">
					<asp:label id="lab_uglySpec" text="砏を" Runat="server" Visible="false"></asp:label>
					<asp:textbox id="txt_uglySpec" Runat="server" Visible="false"></asp:textbox>
					<asp:label id="lab_spec" runat="server" Text="砏龟" Visible="false"></asp:label>
					<asp:textbox id="txt_spec" runat="server" Visible="false"></asp:textbox>
					<asp:label id="lab_Id" runat="server" Text="" Visible="False"/>
					<asp:label id="func" runat="server" Text="" Visible="False"/>
					<div class="container mt-3">
						<div class="row mb-3">
							 <div class="col-lg-6  d-flex">
								<asp:label id="lab_partNo" runat="server" Text="標準圖號"  CssClass="me-10"></asp:label>
								<asp:textbox id="txt_partno" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
							 </div>
							<div class="col-lg-6  d-flex">
								<asp:label id="lab_partName" runat="server" Text="標準圖名"  CssClass="me-10"></asp:label>
								<asp:textbox id="txt_name" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
							</div>
						</div>
											
						<div class="row mb-3">
							<div class="col-lg-6  d-flex">
								<asp:label id="lab_materialId" runat="server" Text="材料"  CssClass="me-10"></asp:label>
								<asp:dropdownlist id="Dropdownlist_Material" runat="server"></asp:dropdownlist>
							</div>
							<div class="col-lg-6  d-flex">
								<asp:label id="lab_requireCount" runat="server" Text="單件數量"  CssClass="me-10"></asp:label>
								<asp:textbox id="txt_requireCount" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-lg-7  d-flex">
								<asp:label id="lab_standprocesstype" runat="server" Text="產品類型"  CssClass="me-10"></asp:label>
								<asp:dropdownlist id="dpl_parentStandardtype" runat="server" AutoPostBack="true"
									onselectedindexchanged="dpl_parentStandardtype_SelectedIndexChanged" CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
								<asp:dropdownlist id="dpl_standardtype" runat="server" CssClass="form-select custom-heighter-large  text-start border-primary me-1"></asp:dropdownlist>
							</div>
							<div class="col-lg-5  d-flex">
								<asp:label id="lab_parentPartNo" runat="server" Text="父階"  CssClass="me-10"></asp:label>
								<asp:textbox id="txt_parentPartNo" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-lg-6  d-flex">
								<asp:label id="lab_comment" runat="server" Text="備註"  CssClass="me-10"></asp:label>
								<asp:textbox id="txt_comment" runat="server" CssClass="form-control custom-large-width text-start border-primary"></asp:textbox>
							</div>
							<div class="col-lg-6  d-flex">
								<asp:label id="Label1" runat="server" Text="是否直接採購"  CssClass="me-10"></asp:label>
								<asp:checkbox id="chk_isMerchindise" runat="server" CssClass=""></asp:checkbox>
							</div>
						</div>
					</div>
				</div>
				<div class="container mt-3 border border-warning"><TABLE width="100%" align="center" class="tbMessage" border="0"><TR vAlign="middle">
				<TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
				</DIV>
				</B>
				</DIV>
				</TD>
				<TD class="msg" width="85%">
				&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
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
