<%@ Page language="c#" Codebehind="StandardPartlViewExcel.aspx.cs" AutoEventWireup="false"  MasterPageFile="~/DefaultSub.Master" Inherits="ModuleWorkFlow.admin.StandardPartlViewExcel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHolder" runat="server">
	<div id="Wrapper">
	<div id="Header"><div class="headbox">
	<div class="linebox">
	<a href="#">生產管理</a>
	<img src="../images/arrow.png" />
	<a href="#"><%=titlemenuname%></a>
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
					<asp:label id="lab_standprocesstype" runat="server" Visible="False"></asp:label>
						<div class="container mt-3">
								<div class="row mb-3">
									 <div class="col-lg-6  d-flex">標準工藝內容</div>
									
								</div>
								<div class="row mb-3">
								 <div class="col-lg-12  d-flex">
								<asp:textbox id="txt_content" runat="server" TextMode="MultiLine" Height="200px" Width="980px" CssClass="border-primary"></asp:textbox>
							   </div>
						</div>
				<asp:datagrid id="dg_error" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-sm" >
					<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="table-primary" Wrap="true"></HeaderStyle>
					<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="true" />
					<Columns>
						<asp:BoundColumn DataField="Line" HeaderText="行數"></asp:BoundColumn>
						<asp:BoundColumn DataField="errormesg" HeaderText="錯誤原因"></asp:BoundColumn>
					</Columns>
				</asp:datagrid>
			</div>
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
</asp:Content>

