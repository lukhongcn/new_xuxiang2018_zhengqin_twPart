2<%@ Page language="c#" Codebehind="OutSourceProductView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.admin.OutSourceProductView" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.WebView" Assembly="WebView" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="OutSourceProductHeader" Src="control/OutSourceProductHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title></title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
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
						<TD vAlign="top" width="79%"><uc1:outsourceproductheader id="OutSourceProductHeader" runat="server"></uc1:outsourceproductheader><br>
							<hr>
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top">
										<table width="100%" align="center" border="0">
											<tr>
												<td><asp:label id="lab_createDate" runat="server" Text="�e�~���"></asp:label></td>
												<td><wc:inputcalendar id="txt_createDate" runat="server"></wc:inputcalendar><asp:label id="lab_Id" runat="server" Text="" Visible="False"></asp:label><asp:label id="lab_deloutsourceproject" runat="server" Visible="False"></asp:label></td>
												<td><asp:label id="lab_outSourceNo" runat="server" Text="�e�~�渹"></asp:label></td>
												<td><asp:textbox id="txt_outSourceNo" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_outSourceApply" runat="server" Text="�e�~�t��"></asp:label></td>
												<td><asp:dropdownlist id="dpl_outSourceApply" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_payMent" runat="server" Text="�I�ڱ���"></asp:label></td>
												<td><asp:dropdownlist id="dpl_payMent" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_taxRate" runat="server" Text="�|�v"></asp:label></td>
												<td><asp:dropdownlist id="dpl_taxRate" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_tax" runat="server" Text="�|�v��"></asp:label></td>
												<td><asp:textbox id="txt_tax" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_outSourcePrice" runat="server" Text="�e�~�O��"></asp:label></td>
												<td><asp:textbox id="txt_outSourcePrice" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_OutsourceCount" runat="server" Text="�`�ƶq"></asp:label></td>
												<td><asp:textbox id="txt_OutsourceCount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_receivedCount" runat="server" Text="�w��ƶq"></asp:label></td>
												<td><asp:textbox id="txt_receivedCount" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_unreceivedCount" runat="server" Text="����ƶq"></asp:label></td>
												<td><asp:textbox id="txt_unreceivedCount" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_price" runat="server" Text="�[�u���B"></asp:label></td>
												<td><asp:textbox id="txt_price" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_busingessTax" runat="server" Text="��~�|�B"></asp:label></td>
												<td><asp:textbox id="txt_busingessTax" runat="server"></asp:textbox></td>
											</tr>
											<tr>
												<td><asp:label id="lab_totalPrice" runat="server" Text="�[�u���B"></asp:label></td>
												<td><asp:textbox id="txt_totalPrice" runat="server"></asp:textbox></td>
												<td><asp:label id="lab_expectedDate" runat="server" Text="�w�w���"></asp:label></td>
												<td><wc:inputcalendar id="txt_expectedDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_creater" runat="server" Text="�g��H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_creater" runat="server"></asp:dropdownlist></td>
											</tr>
											<tr>
												<td><asp:label id="lab_departmentId" runat="server" Text="����"></asp:label></td>
												<td><asp:dropdownlist id="dpl_departmentId" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_checker" runat="server" Text="�f�֤H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_checker" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_checkDate" runat="server" Text="�f�֤��"></asp:label></td>
												<td><wc:inputcalendar id="txt_checkDate" runat="server"></wc:inputcalendar></td>
											</tr>
											<tr>
												<td><asp:label id="lab_approver" runat="server" Text="���H"></asp:label></td>
												<td><asp:dropdownlist id="dpl_approver" runat="server"></asp:dropdownlist></td>
												<td><asp:label id="lab_approveDate" runat="server" Text="�����"></asp:label></td>
												<td><wc:inputcalendar id="txt_approveDate" runat="server"></wc:inputcalendar></td>
												<td><asp:label id="lab_comment" runat="server" Text="�Ƶ�"></asp:label></td>
												<td><asp:textbox id="txt_comment" runat="server"></asp:textbox></td>
											</tr>
											<TR>
												<TD colSpan="2"><asp:label id="func" runat="server" Text="" Visible="False"></asp:label><asp:button id="btn_add_edit" runat="server" Text="�O�s"></asp:button></TD>
											</TR>
										</table>
									</td>
								</tr>
							</TABLE>
							<table width="100%" align="center" border="0">
								<asp:label id="Label1" runat="server" Text="" Visible="False"></asp:label>
								<TBODY>
									<tr>
										<td><asp:label id="lab_Outsourcedesign" runat="server" Text="�e�~�ӽг渹"></asp:label></td>
										<td><asp:dropdownlist id="dpl_Outsourcedesign" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
										<td><asp:label id="lab_outsourceApplyNo" runat="server" Text="�e�~�u�O�渹"></asp:label></td>
										<td><asp:dropdownlist id="dpl_outsourceApplyNo" runat="server" AutoPostBack="True"></asp:dropdownlist></td>
										<td><asp:label id="lab_outsourceProjectNo" runat="server" Text="�e�~�ӽнs��"></asp:label></td>
										<td><asp:textbox id="txt_outsourceProjectNo" runat="server"></asp:textbox></td>
									</tr>
									<tr>
										<td><asp:label id="lab_materialProductId" runat="server" Text="���ƽs��"></asp:label></td>
										<td><asp:textbox id="txt_materialProductId" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
										<td><asp:label id="lab_productOrderId" runat="server" Text="�u�O�渹"></asp:label></td>
										<td><asp:textbox id="txt_productOrderId" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
										<td><asp:label id="lab_processId" runat="server" Text="�[�u�u��"></asp:label></td>
										<td><ASP:DROPDOWNLIST id="dpl_processId" runat="server" Enabled="False"></ASP:DROPDOWNLIST></td>
									</tr>
						</TD>
					</tr>
					<tr>
						<td><asp:label id="lab_inventoryUnitId" runat="server" Text="���"></asp:label></td>
						<td><asp:dropdownlist id="dpl_inventoryUnitId" runat="server"></asp:dropdownlist></td>
						<td><asp:label id="lab_hardRequire" runat="server" Text="�w�׭n�D"></asp:label></td>
						<td><asp:textbox id="txt_hardRequire" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
						<td><asp:label id="lab_partNo" runat="server" Text="�ϸ�"></asp:label></td>
						<td><asp:textbox id="txt_partNo" runat="server" BackColor="Silver" ReadOnly="True"></asp:textbox></td>
						<td><asp:label id="lab_partNoId" runat="server" Text="partNoId" Visible="False">partNoId</asp:label></td>
						<td><asp:textbox id="txt_partNoId" runat="server" Visible="False"></asp:textbox></td>
					</tr>
					<tr>
						<td><asp:label id="lab_partId" runat="server" Text="partId" Visible="False">partId</asp:label></td>
						<td><asp:textbox id="txt_partId" runat="server" Visible="False"></asp:textbox></td>
						<td><asp:label id="lab_detailCount" runat="server" Text="�ƶq"></asp:label></td>
						<td><asp:textbox id="txt_detailCount" runat="server"></asp:textbox></td>
						<td><asp:label id="Label2" runat="server" Text="���"></asp:label></td>
						<td><asp:textbox id="Textbox1" runat="server"></asp:textbox></td>
					</tr>
					<tr>
						<td><asp:label id="lab_specialSpec" runat="server" Text="�S��n�D����"></asp:label></td>
						<td><asp:textbox id="txt_specialSpec" runat="server"></asp:textbox></td>
						<td><asp:label id="Label3" runat="server" Text="�Ƶ�"></asp:label></td>
						<td><asp:textbox id="Textbox2" runat="server"></asp:textbox></td>
					</tr>
					<TR>
						<TD colSpan="2"><asp:label id="func_detail" runat="server" Text="" Visible="False"></asp:label><asp:button id="Button1" runat="server" Text="���ӫO�s"></asp:button></TD>
					</TR>
				</TBODY>
			</TABLE>
			<table width="100%" align="center" border="0">
				<TR>
					<TD style="HEIGHT: 16px" colSpan="2"><asp:label id="Label5" runat="server" Text="" Visible="False"></asp:label></TD>
				</TR>
				<tr>
					<td colSpan="2"><FORUM:DGSELF id="dg_OutSourceProductDetail" runat="server" AutoGenerateColumns="False" CellSpacing="2"
							CellPadding="2" DESIGNTIMEDRAGDROP="640">
							<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
							<Columns>
								<asp:TemplateColumn HeaderText="outsourceApplyNo">
									<HeaderTemplate>
										<asp:Label id="dg_header_outsourceApplyNo" runat="server">�s��</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_outsourceApplyNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceApplyNo")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_outsourceApplyNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceApplyNo") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="outsourceProjectNo">
									<HeaderTemplate>
										<asp:Label id="dg_header_outsourceProjectNo" runat="server">�e�~�ӽг渹</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_outsourceProjectNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.OutsourceProjectNo")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_outsourceProjectNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.outsourceProjectNo") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="materialProductId">
									<HeaderTemplate>
										<asp:Label id="dg_header_materialProductId" runat="server">���ƽs��</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_materialProductId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialProductId")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_materialProductId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.materialProductId") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="productOrderId">
									<HeaderTemplate>
										<asp:Label id="dg_header_productOrderId" runat="server">�u�O�渹</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_productOrderId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductOrderId")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_productOrderId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.productOrderId") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="processId">
									<HeaderTemplate>
										<asp:Label id="dg_header_processId" runat="server">�u��</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_processId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProcessId")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_processId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.processId") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="hardRequire">
									<HeaderTemplate>
										<asp:Label id="dg_header_hardRequire" runat="server">�w�׭n�D</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_hardRequire runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.HardRequire")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_hardRequire runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.hardRequire") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn Visible="False" HeaderText="inventoryUnitId">
									<HeaderTemplate>
										<asp:Label id="dg_header_inventoryUnitId" runat="server"></asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_inventoryUnitId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.InventoryUnitId")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_inventoryUnitId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.inventoryUnitId") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="partNo">
									<HeaderTemplate>
										<asp:Label id="dg_header_partNo" runat="server">�ϸ�</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_partNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNo")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_partNo runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNo") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn Visible="False" HeaderText="partNoId">
									<HeaderTemplate>
										<asp:Label id="dg_header_partNoId" runat="server"></asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_partNoId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartNoId")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_partNoId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partNoId") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn Visible="False" HeaderText="partId">
									<HeaderTemplate>
										<asp:Label id="dg_header_partId" runat="server"></asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_partId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartId")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_partId runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.partId") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="detailCount">
									<HeaderTemplate>
										<asp:Label id="dg_header_detailCount" runat="server">�ƶq</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_detailCount runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.DetailCount")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_detailCount runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.detailCount") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="price">
									<HeaderTemplate>
										<asp:Label id="dg_header_price" runat="server">����</asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_price runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_price runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Price") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn Visible="False" HeaderText="specialSpec">
									<HeaderTemplate>
										<asp:Label id="dg_header_specialSpec" runat="server"></asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_specialSpec runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.SpecialSpec")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_specialSpec runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.specialSpec") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn Visible="False" HeaderText="comment">
									<HeaderTemplate>
										<asp:Label id="dg_header_comment" runat="server"></asp:Label>
									</HeaderTemplate>
									<ItemTemplate>
&nbsp; 
<asp:Label id=dg_lab_comment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Comment")%>'>
										</asp:Label>
</ItemTemplate>
									<EditItemTemplate>
										<asp:textbox id=dg_txt_comment runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.comment") %>' Width="40">
										</asp:textbox>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="��s" HeaderText="�ʧ@" EditText="�s��"></asp:EditCommandColumn>
								<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('�T�w�O�_�R��')&quot;&gt;�R��&lt;/div&gt;"
									HeaderText="�ʧ@" CommandName="Delete"></asp:ButtonColumn>
							</Columns>
							<PagerStyle Mode="NumericPages"></PagerStyle>
						</FORUM:DGSELF><br>
						<br>
						<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
							border="1">
							<TR vAlign="middle">
								<TD width="15%" height="28">
									<DIV align="center"><B>
											<DIV align="center"><B>���ܫH��</B></DIV>
										</B>
									</DIV>
								</TD>
								<TD class="msg" width="85%">&nbsp;&nbsp;
									<asp:label id="Label_Message" runat="server"></asp:label></TD>
							</TR>
						</table>
					</td>
				</tr>
				<TR>
					<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
				</TR>
			</table>
		</form>
		</TD></TR></TBODY></TABLE></TD<ASP:DROPDOWNLIST>
	</body>
</HTML>
