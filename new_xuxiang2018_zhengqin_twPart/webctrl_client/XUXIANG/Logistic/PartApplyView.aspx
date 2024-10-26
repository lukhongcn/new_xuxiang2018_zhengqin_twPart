<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/logisticheader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="PartApplyView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.PartApplyView" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>零料單</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form method="post" runat="server">
			<TABLE height="721" cellSpacing="0" cellPadding="0" width="641" border="0" ms_2d_layout="TRUE">
				<TR vAlign="top">
					<TD height="706"></TD>
					<TD>
						<TABLE id="Table2" height="705" cellSpacing="0" cellPadding="0" width="639" border="0">
							<TBODY>
								<TR>
									<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
								</TR>
								<tr>
									<TD vAlign="top" align="left" width="20%"></TD>
									<TD width="1%">&nbsp;</TD>
									<TD vAlign="top" width="79%">
										<table cellSpacing="2" width="100%" border="0">
											<tr>
												<td>
													<div align="left">零料單</div>
												</td>
											</tr>
										</table>
										<hr>
										<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
											width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
											<tr>
												<td>
													<table width="100%" align="center">
														<TR>
															<TD>領用人</TD>
															<td><asp:textbox id="txt_applier" runat="server" ReadOnly="True"></asp:textbox></td>
															<TD>模具編號</TD>
															<td><asp:textbox id="txt_moduleid" runat="server" ReadOnly="True"></asp:textbox></td>
															<TD>BOM編號</TD>
															<td><asp:textbox id="txt_bomid" runat="server" ReadOnly="True"></asp:textbox></td>
															<TD>零件編號</TD>
															<td><asp:textbox id="txt_partno" runat="server" ReadOnly="True"></asp:textbox></td>
															<TD>零件類型</TD>
															<td><asp:textbox id="txt_parttype" runat="server" ReadOnly="True"></asp:textbox></td>
														</TR>
														<TR>
															<TD>申請規格規格</TD>
															<td><asp:textbox id="txt_applyspecification" runat="server" ReadOnly="True"></asp:textbox></td>
															<TD>申請規格重量</TD>
															<td><asp:textbox id="txt_applyweight" runat="server" ReadOnly="True"></asp:textbox></td>
															<TD>領用重量*</TD>
															<TD><asp:textbox id="txt_putweight" runat="server" ReadOnly="True"></asp:textbox></TD>
															<TD>領用數量*</TD>
															<td><asp:textbox id="txt_putterquantity" runat="server" ReadOnly="True"></asp:textbox></td>
															<TD>發料者</TD>
															<td><asp:textbox id="txt_putter" runat="server" ReadOnly="True"></asp:textbox></td>
														</TR>
														<tr>
															<TD><asp:label id="lab_scanned" runat="server">請刷入員工編號</asp:label></TD>
															<td colSpan="3"><asp:textbox id="txt_scan" runat="server"></asp:textbox></td>
														</tr>
													</table>
													<table cellSpacing="2" width="100%" border="0">
														<TR>
															<TD><asp:button id="BTaddmetal" runat="server" Text="保存"></asp:button><asp:button id="btn_reset" runat="server" Text="取消"></asp:button></TD>
														</TR>
													</table>
												</td>
											</tr>
										</TABLE>
										<br>
										<asp:datagrid id="dg_checkedmerchindise" runat="server" PageSize="5" AllowPaging="True" AutoGenerateColumns="False">
											<Columns>
												<asp:BoundColumn DataField="BomPartType" ReadOnly="True" HeaderText="零件類別"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseBomId" ReadOnly="True" HeaderText="編碼"></asp:BoundColumn>
												<asp:BoundColumn DataField="PartNo" ReadOnly="True" HeaderText="零件編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseName" ReadOnly="True" HeaderText="名稱"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseSpecification" ReadOnly="True" HeaderText="規格"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseQuantity" ReadOnly="True" HeaderText="數量"></asp:BoundColumn>
												<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確定刪除嗎？')&quot;&gt;刪除&lt;/div&gt;"
													HeaderText="動作" CommandName="Delete"></asp:ButtonColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid>
										<hr color="#ccccff">
										<asp:button id="btn_add" runat="server" Text="添加"></asp:button><asp:datagrid id="dg_merchindise" runat="server" PageSize="7" AllowPaging="True" AutoGenerateColumns="False">
											<Columns>
												<asp:TemplateColumn>
													<ItemTemplate>
														<asp:CheckBox id="Chk_buy" runat="server"></asp:CheckBox>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="BomPartType" ReadOnly="True" HeaderText="零件類別"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseBomId" ReadOnly="True" HeaderText="編碼"></asp:BoundColumn>
												<asp:BoundColumn DataField="PartNo" ReadOnly="True" HeaderText="零件編號"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseName" ReadOnly="True" HeaderText="名稱"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseSpecification" ReadOnly="True" HeaderText="規格"></asp:BoundColumn>
												<asp:BoundColumn DataField="MerchindiseQuantity" ReadOnly="True" HeaderText="數量"></asp:BoundColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid><br>
										<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
											border="1">
											<TR vAlign="middle">
												<TD width="15%" height="28">
													<DIV align="center"><B>提示
															<DIV align="center"><B></B></DIV>
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
							</TBODY></TABLE>
					</TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
