<%@ Page language="c#" Codebehind="MaterialCodeList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.adminInventory.MaterialCodeList" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="../css/amd.css" rel="stylesheet" type="text/css" />
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server"><div id="Wrapper">
		<div id="Header"><div class="headbox">
			<div class="linebox">
				<a href="../defaultmain.aspx">生產管理</a>
				<img src="../images/arrow.png" />
				<a href="#">零件編碼設定</a>
			</div>
			<div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a></div>
			<div class="clearbox"></div>
		</div></div>
		<div id="Menu"><div class="menubox">
			<div class="mod1"><ul>
             <li class="btn1"><asp:LinkButton ID="lnkbutton_add" runat="server" OnClick="lnkbutton_add_Click" ToolTip="新增/add">新增/add</asp:LinkButton>
             </li>
             <li class="btn2"><asp:LinkButton ID="lnkbutton_edit" runat="server" OnClick="lnkbutton_edit_Click" ToolTip="編輯/edit">編輯/edit</asp:LinkButton>
             </li>
             <li class="btn6"><asp:LinkButton ID="lnkbutton_delete" runat="server" OnClick="lnkbutton_delete_Click" ToolTip="刪除/delete" OnClientClick="return   confirm( '您確定要刪除嗎 '); ">刪除/delete</asp:LinkButton>
             </li>

				<li class="btn8"><asp:LinkButton ID="lnkbutton_search" runat="server" ToolTip="搜尋/search" OnClick="lnkbutton_search_Click">搜尋/search</asp:LinkButton>
				</li>
			</ul></div>
		<div class="mod2"></div>
		<div class="clearbox"></div>
		</div></div>
		<div id="Container"><div id="Content">
			<div class="box">
				<table id="Table_Header2" width="100%" align="center" class="tbone">
					<tr>
						<td>零件名稱:<asp:textbox id="txt_name" runat="server"></asp:textbox></td>
                        <td>零件編碼:<asp:textbox id="txt_lab_materialCodeNumber" runat="server"></asp:textbox></td>
					</tr>
				</table>
			</div>
			<div class="Textbox">		
				<asp:datagrid id="dg_MaterialCodeList" runat="server" AutoGenerateColumns="False" CellSpacing="1" CellPadding="0" AllowPaging="True" BorderWidth="0" CssClass="Grid" AllowCustomPaging="True">
					<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" CssClass="dg_header"></HeaderStyle>
                    <ItemStyle BackColor="#ffffff" BorderColor="#E3E3E4" BorderStyle="Dotted"></ItemStyle>
					<Columns>
						<asp:TemplateColumn>
                         <ItemTemplate>
                          <asp:CheckBox runat="server" ID="chk_datagrid" />
                         </ItemTemplate>
                        </asp:TemplateColumn>
						
						
						<asp:TemplateColumn HeaderText="productCodeTypeId">
							<HeaderTemplate>
								<asp:Label id="dg_header_productCodeTypeId" runat="server" Text="零件類別"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_productCodeTypeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductCodeTypename")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="materialCodeNumber">
							<HeaderTemplate>
								<asp:Label id="dg_header_materialCodeNumber" runat="server" Text="零件編碼"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_materialCodeNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialCodeNumber")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="name">
							<HeaderTemplate>
								<asp:Label id="dg_header_name" runat="server" Text="名稱"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_name" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="abbr">
							<HeaderTemplate>
								<asp:Label id="dg_header_abbr" runat="server" Text="縮寫"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_abbr" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Abbr")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="length">
							<HeaderTemplate>
								<asp:Label id="dg_header_length" runat="server" Text="长"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_length" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Length")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="width">
							<HeaderTemplate>
								<asp:Label id="dg_header_width" runat="server" Text="宽/直径"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_width" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Width")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="height">
							<HeaderTemplate>
								<asp:Label id="dg_header_height" runat="server" Text="高"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_height" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Height")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="spec">
							<HeaderTemplate>
								<asp:Label id="dg_header_spec" runat="server" Text="规格"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_spec" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Spec")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="mark">
							<HeaderTemplate>
								<asp:Label id="dg_header_mark" runat="server" Text="品牌"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_mark" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Mark")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="isImport">
							<HeaderTemplate>
								<asp:Label id="dg_header_isImport" runat="server" Text="國產"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_isImport" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ImportStatus")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
						
						<asp:TemplateColumn HeaderText="material">
							<HeaderTemplate>
								<asp:Label id="dg_header_material" runat="server" Text="材質"></asp:Label>
							
							</HeaderTemplate>
								<ItemTemplate>
									<asp:Label id="dg_lab_material" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Material")%>'/>
								</ItemTemplate>
							
						</asp:TemplateColumn>
					</Columns>
					<AlternatingItemStyle BackColor="#F8F7FF"></AlternatingItemStyle>
                    <PagerStyle Mode="NumericPages" CssClass="tbPager" ></PagerStyle>
				</asp:datagrid>
			</div>					
			<div class="box"><table class="tbMessage" width="100%" align="center"><TR vAlign="middle">
				<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示信息</B>
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
		</form>
	</body>
</HTML>
