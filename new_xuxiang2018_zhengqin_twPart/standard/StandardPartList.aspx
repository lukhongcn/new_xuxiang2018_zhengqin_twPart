<%@ Page language="c#" Codebehind="StandardPartList.aspx.cs"  MasterPageFile="~/DefaultSub.Master" AutoEventWireup="false" Inherits="ModuleWorkFlow.standard.StandardPartList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
	<div id="Wrapper">
	<div id="Header">
		<div class="headbox">
		<div class="linebox">
		<a href="../defaultmain.aspx">生產管理</a>
		<img src="../images/arrow.png" />
		<a href="#"><%=titlemenuname%></a>
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
						<li class="btn1"><asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkbutton_addxls" ToolTip="新增/add">新增/add</asp:LinkButton></li>
						<li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" OnClick="lnkbutton_add_Click" ToolTip="新增/add">新增/add</asp:LinkButton>
						</li>
						<li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
						</li>
						<li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎 '); ">刪除/delete</asp:LinkButton>
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
					<div class="row mb-3">
						 <div class="col-lg-6  d-flex">
							 <asp:label id="lab_typeName" runat="server" Text="typeName"  CssClass="me-10">工藝類型</asp:label>
							 <asp:dropdownlist id="dpl_standardtype" runat="server" AutoPostBack="True"  CssClass="form-select custom-heighter-width  text-start border-primary me-1"></asp:dropdownlist>
					     </div>
						<div class="col-lg-6  d-flex">
							<asp:label id="Label1" runat="server" Text="typeName"  CssClass="me-10">工藝名稱</asp:label>
							<asp:textbox id="txt_processname" runat="server" CssClass="form-control custom-height-width text-start border-primary"></asp:textbox>
						</div>
					</div>
				</div>
			</div>
			<div class="container mt-3 border border-primary">
				<div class="container mt-3">
					<div class="row mb-3">
						<div class="col-lg-12  d-flex">
							<asp:datagrid id="dg_StandProcess" runat="server" AutoGenerateColumns="False" 
							 AllowPaging="True"   CssClass="table table-striped table-bordered table-hover table-sm"  AllowCustomPaging="true" style="table-layout:fixed;width: 100%;"
								onitemcreated="dg_StandProcess_ItemCreated">
								<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
							    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
								<Columns>
									<asp:TemplateColumn HeaderStyle-Width ="60px">
										<ItemTemplate>
										<asp:CheckBox runat="server" ID="chk_datagrid" />
										</ItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn HeaderText="工序類型編號" DataField="StandardProcessType" Visible="false"></asp:BoundColumn>
									<asp:BoundColumn HeaderText="工序類型" DataField="TypeName" HeaderStyle-Width ="100px"></asp:BoundColumn>
									<asp:BoundColumn HeaderText="工序名" DataField="StandardProcessName" HeaderStyle-Width ="100px"></asp:BoundColumn>
													
									<asp:TemplateColumn HeaderStyle-Width ="700px">
										<HeaderTemplate>
											<asp:Label id="dg_header_productId" runat="server" text='工序列表'></asp:Label>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:Label id="dg_lab_StandardProcessName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProcessList") %>' />
										</ItemTemplate>
									</asp:TemplateColumn>
								</Columns>
								<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
								<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
								<PagerStyle Mode="NumericPages" CssClass="table-primary" ></PagerStyle>
							</asp:datagrid>
						</div>
					</div>
				</div>
			</div>
			<div class="container mt-3 border border-warning"><table width="100%" align="center" class="tbMessage" border="0"><tr style="VERTICAL-ALIGN: middle">
			<TD width="10%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
			</DIV>
			</B>
			</DIV>
			</TD>
			<TD class="msg" width="85%">
			&nbsp;&nbsp;<asp:label id="Label_Message" runat="server"></asp:label>
			</TD>
			</tr>
			</table>
			</div>
			</div>
		</div>
	</div>
</asp:Content>

