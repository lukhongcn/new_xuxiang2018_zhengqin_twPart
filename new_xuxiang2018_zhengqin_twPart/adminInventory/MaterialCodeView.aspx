<%@ Page language="c#" Codebehind="MaterialCodeView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.adminInventory.MaterialCodeView" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" ><html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
<meta http-equiv="Content-Type" content="text/html; charset=big5" />
<title>AMD</title>
<link href="../css/amd.css" rel="stylesheet" type="text/css" />
</head>
<body><form id="Form1" method="post" runat="server"><div id="Wrapper">
<div id="Header"><div class="headbox">
<div class="linebox">
						<a href="../defaultmain.aspx">生產管理</a><img src="../images/arrow.png" />
						<a href="#">零件編碼設定</a>
					</div>
					<div class="logout"><a href="../login.aspx" TARGET="_parent">登出</a></div>
					<div class="clearbox"></div>
				</div></div>
				<div id="Menu"><div class="menubox">
					<div class="mod1"><ul>
						<li class="btn1"><a href="MaterialCodeView.aspx" title="新增">新增/add</a>
						</li>
						<li class="btn3"><asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_edit_Click">儲存/save</asp:LinkButton>
						</li>
						<li class="btn5"><asp:LinkButton ID="lnkbutton_view" runat="server" ToolTip="檢視/view" OnClick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
						</li>
						</ul>
					</div>
					<div class="mod2"></div>
					<div class="clearbox"></div>
				</div></div>
				<div id="Container"><div id="Content">
				<div class="space1"></div>
					<div class="Textbox">
							
						<table width="100%" align="center" border="0">
									
								<tr>
                                <td><asp:Label ID="lab_Id" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="lab_productCodeTypeId" runat="server"  Text="零件類別"></asp:Label></td>
									<td><asp:dropdownlist id="dpl_productCodeTypeId" Runat="server" AutoPostBack="True"></asp:dropdownlist>
                                    </td>
									
								</tr>
								<tr><td><asp:Label ID="lab_materialCodeNumbername" runat="server"  Text="零件編碼" Visible="False"></asp:Label></td>
									<td><asp:Label ID="lab_materialCodeNumber" runat="server" Visible="False"></asp:Label></td>
									
								</tr>
								<tr>
									<td><asp:Label ID="lab_name" runat="server"  Text="名稱"></asp:Label></td>
									<td><asp:textbox id="txt_name" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:Label ID="lab_abbr" runat="server"  Text="縮寫"></asp:Label></td>
									<td><asp:textbox id="txt_abbr" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:Label ID="lab_length" runat="server"  Text="长"></asp:Label></td>
									<td><asp:textbox id="txt_length" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:Label ID="lab_width" runat="server"  Text="宽/直径"></asp:Label></td>
									<td><asp:textbox id="txt_width" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:Label ID="lab_height" runat="server"  Text="高"></asp:Label></td>
									<td><asp:textbox id="txt_height" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:Label ID="lab_spec" runat="server"  Text="规格"></asp:Label></td>
									<td><asp:textbox id="txt_spec" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:Label ID="lab_mark" runat="server"  Text="品牌"></asp:Label></td>
									<td><asp:textbox id="txt_mark" runat="server"></asp:textbox></td>
								</tr>
								<tr>
									<td><asp:Label ID="Lab_isNoImport" runat="server"  Text="國產"></asp:Label></td>
									<td>
                                        <asp:checkbox ID="check_isNoImport" runat="server" ></asp:checkbox>
                                    </td>
								</tr>
								<tr>
									<td><asp:Label ID="lab_material" runat="server"  Text="材質"></asp:Label></td>
									<td><asp:textbox id="txt_material" runat="server"></asp:textbox></td>
								</tr>
							<TR>
								<TD colSpan="2"><asp:Label ID="func" runat="server"  Text="" Visible="False"></asp:Label>
                                <TD colSpan="2"><asp:Label ID="name_add" runat="server"  Text="" Visible="False"></asp:Label>
                                <TD colSpan="2"><asp:Label ID="materialCodeNumber_add" runat="server"  Text="" Visible="False"></asp:Label>
                                <TD colSpan="2"><asp:Label ID="pageIndex_add" runat="server"  Text="" Visible="False"></asp:Label>
							</TR>
						</table>
					</div>
					<div class="box">
						<TABLE id="Table3" width="100%" align="center" class="tbMessage"><TR vAlign="middle">
							<TD width="15%" height="28"><DIV align="center"><B><DIV align="center"><B>提示</B>
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
		</form>
	</body>
</HTML>
