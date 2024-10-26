<%@ Page language="c#" Codebehind="ProductMaterialInventoryView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.ProductMaterialInventoryView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="ProductMaterialInventoryHeader" Src="controls/ProductMaterialInventoryHeader.ascx" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			function selectImage()
			{
				window.open("../UploadImage.aspx","UploadImage","WIDTH=400,HEIGHT=350,resizable=yes,scrollbars=yes");
			}
		</script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<tr>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><uc1:productmaterialinventoryheader id="ProductMaterialInventoryHeader" runat="server"></uc1:productmaterialinventoryheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<asp:label id="lab_Id" runat="server" Visible="False" Text=""></asp:label>
											<tr>
												<td><asp:label id="lab_productmaterialno" text="原物料編號" Runat="server"></asp:label></td>
												<td><asp:textbox id="txt_productmaterialno" Runat="server"></asp:textbox></td>
												<td><asp:label id="lab_name" runat="server" Text="名稱"></asp:label></td>
												<td><asp:textbox id="txt_name" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_specType" runat="server" Text="規格型號"></asp:label></td>
												<td><asp:textbox id="txt_specType" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_englishName" runat="server" Text="英文名稱"></asp:label></td>
												<td><asp:textbox id="txt_englishName" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_spec" runat="server" Text="規格"></asp:label></td>
												<td><asp:textbox id="txt_spec" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_moduleId" runat="server" Text="圖號"></asp:label></td>
												<td><asp:textbox id="txt_moduleId" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_ErpNo" runat="server" Text="ERP編號"></asp:label></td>
												<td><asp:textbox id="txt_ErpNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_productMaterialTypeId" runat="server" Text="料品類別"></asp:label></td>
												<td><asp:dropdownlist id="dpl_productMaterialTypeId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_materialId" runat="server" Text="材質"></asp:label></td>
												<td><asp:dropdownlist id="dpl_materialId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_inventoryUnitId" runat="server" Text="庫存單位"></asp:label></td>
												<td><asp:dropdownlist id="dpl_inventoryUnitId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_merchindiseUnitId" runat="server" Text="採購單位"></asp:label></td>
												<td><asp:dropdownlist id="dpl_merchindiseUnitId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_inventoryCount" runat="server" Text="庫存量"></asp:label></td>
												<td><asp:textbox id="txt_inventoryCount" runat="server" ReadOnly="True" BackColor="Silver"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_safeCount" runat="server" Text="安全存量"></asp:label></td>
												<td><asp:textbox id="txt_safeCount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_inventoryPrice" runat="server" Text="庫存額"></asp:label></td>
												<td><asp:textbox id="txt_inventoryPrice" runat="server" ReadOnly="True" BackColor="Silver"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_averagePrice" runat="server" Text="平均進價"></asp:label></td>
												<td><asp:textbox id="txt_price" runat="server" AutoPostBack="True"></asp:textbox></td>
												<td><asp:label id="lab_expectedDays" runat="server" Text="預交天數"></asp:label></td>
												<td><asp:textbox id="txt_expectedDays" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_lowestInputCount" runat="server" Text="最小採購數"></asp:label></td>
												<td><asp:textbox id="txt_lowestInputCount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_factoryUnitId" runat="server" Text="廠內單位"></asp:label></td>
												<td><asp:dropdownlist id="dpl_factoryUnitId" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_otherSpecitifaction" runat="server" Text="其他說明"></asp:label></td>
												<td><asp:textbox id="txt_otherSpecitifaction" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_picture" runat="server" Text="圖檔"></asp:label></td>
												<td><asp:textbox id="TextBox_Picture" runat="server"></asp:textbox><INPUT onclick="javascript:selectImage();" type="button" value="上傳"></td>
											</tr>
											<tr>
												<td><asp:label id="lab_comment" runat="server" Text="備註"></asp:label></td>
												<TD colspan="3"><asp:textbox id="txt_comment" runat="server" Width="523px"></asp:textbox></TD>
											</tr>
											<tr>
												<TD colSpan="2"><asp:label id="func" runat="server" Visible="False" Text=""></asp:label><asp:button id="btn_add_edit" runat="server" Text="保存"></asp:button></TD>
											</tr>
										</table>
									</td>
								</tr>
							</TABLE>
							<br>
							<br>
							<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
								border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示信息</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</table>
						</TD>
					</tr>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
