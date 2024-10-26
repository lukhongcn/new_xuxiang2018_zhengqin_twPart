<%@ Page language="c#" Codebehind="ModuleDetailView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModuleDetailView" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>®a£´¡¼ÀéÂÎ</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<TABLE height="653" cellSpacing="0" cellPadding="0" width="738" border="0" ms_2d_layout="TRUE">
			<TR vAlign="top">
				<TD width="738" height="653">
					<form method="post" runat="server" ID="Form1">
						<TABLE height="721" cellSpacing="0" cellPadding="0" width="641" border="0" ms_2d_layout="TRUE">
							<TR vAlign="top">
								<TD width="1" height="15"></TD>
								<TD width="640"></TD>
							</TR>
							<TR vAlign="top">
								<TD height="706"></TD>
								<TD>
									<TABLE id="Table2" height="705" cellSpacing="0" cellPadding="0" width="639" border="0">
										<TBODY>
											<TR>
												<TD colSpan="3"><FONT face="¡¼Àé¡¼¯y"></FONT></TD>
											</TR>
											<tr>
												<TD vAlign="top" align="left" width="20%"></TD>
												<TD width="1%">&nbsp;</TD>
												<TD vAlign="top" width="79%">
													<table cellSpacing="2" width="100%" border="0">
														<tr>
															<td>
																<div align="left">®a£´¡¼ÀéÂÎ</div>
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
																		<TD>®a¸¡</TD>
																		<td><asp:textbox id="txt_moduleid" runat="server"></asp:textbox></td>
																		<TD>Ïü¬ÁÂÎ¡¼</TD>
																		<td><asp:textbox id="txt_producte" runat="server"></asp:textbox></td>
																		<TD>¡¼­p</TD>
																		<td><asp:textbox id="txt_holdcount" runat="server"></asp:textbox></td>
																		<TD>£KÏÑÂÎ¡¼¡¼íÚ(cm3)</TD>
																		<td><asp:textbox id="txt_holdarea" runat="server"></asp:textbox></td>
																		<TD>£KÏÑÂÎ¡¼¡¼Ïü(g)</TD>
																		<td><asp:textbox id="txt_holdweight" runat="server"></asp:textbox></td>
																		
																	</TR>
																	<TR>
																		<TD>¡¼ò³¡¼Ïü(g)</TD>
																		<td><asp:textbox id="txt_leftweight" runat="server"></asp:textbox></td>																		
																		<TD>£KÏÑò¼¡¼Ïü(g)</TD>
																		<td><asp:textbox id="txt_totalweight" runat="server"></asp:textbox></td>																		
																		<TD>³Zõåµj­p</TD>
																		<td><asp:textbox id="txt_machintton" runat="server"></asp:textbox></td>
																		<td>®a¯a¡¼¡¼</td>
																		<TD><asp:textbox id="txt_modulesize" runat="server"></asp:textbox></TD>
																		<TD>Öv¡¼£VÂË·ÎÖË</TD>
																		<td><asp:textbox id="txt_isHotChannel" runat="server"></asp:textbox></td>																		
																	</TR>
																	<TR>
																	    <TD>Öv¡¼¡¼ÂË¹ní~</TD>
																		<td><asp:textbox id="txt_isHotProcess" runat="server"></asp:textbox></td>
																		<TD>®a¡¼µe¡¼</TD>
																		<td><asp:textbox id="txt_materialid" runat="server"></asp:textbox></td>
																		<TD>¬g®a¢WÂW</TD>
																		<td><asp:textbox id="txt_period" runat="server"></asp:textbox></td>
																		<TD>®a£´Ãö¡ëK</TD>
																		<TD><asp:textbox id="txt_life" runat="server"></asp:textbox></TD>
																		<TD>µá¹K­pÏü</TD>
																		<td><asp:textbox id="txt_slidcount" runat="server"></asp:textbox></td>																		
																	</TR>
																	<TR>
																	    <TD>¹úãf­pÏü</TD>
																		<td><asp:textbox id="txt_slotcount" runat="server"></asp:textbox></td>
																		<TD>®a£´Úñ¸¡</TD>
																		<td><asp:textbox id="txt_id" runat="server"></asp:textbox></td>																		
																	<tr>
																	<tr>
																		<TD><asp:label id="lab_scanned" runat="server">¥s¡¼¡¼¡¼¡¼Úñ¸¡</asp:label></TD>
																		<td colSpan="3"><asp:textbox id="txt_scan" runat="server"></asp:textbox></td>
																	</tr>
																</table>
																<table cellSpacing="2" width="100%" border="0">
																	<TR>
																		<TD><asp:button id="BTaddmetal" runat="server" Text="÷ç¡¼"></asp:button><asp:button id="btn_reset" runat="server" Text="¡¼¡¼"></asp:button></TD>
																	</TR>
																</table>
															</td>
														</tr>
													</TABLE>
													<br>
													<asp:datagrid id="dg_moduledetail" runat="server" AutoGenerateColumns="False" AllowPaging="True"
														PageSize="5">
														<Columns>
															<asp:BoundColumn DataField="Moduleid" ReadOnly="True" HeaderText="®a¸¡"></asp:BoundColumn>
															<asp:BoundColumn DataField="Producter" ReadOnly="True" HeaderText="Ïü¬ÁÂÎ¡¼"></asp:BoundColumn>
															<asp:BoundColumn DataField="Holdcount" ReadOnly="True" HeaderText="¡¼­p"></asp:BoundColumn>
															<asp:BoundColumn DataField="Holdarea" ReadOnly="True" HeaderText="£KÏÑÂÎ¡¼¡¼íÚ"></asp:BoundColumn>
															<asp:BoundColumn DataField="Holdweight" ReadOnly="True" HeaderText="£KÏÑÂÎ¡¼¡¼Ïü"></asp:BoundColumn>
															<asp:BoundColumn DataField="Leftweight" ReadOnly="True" HeaderText="¡¼ò³¡¼Ïü"></asp:BoundColumn>
															<asp:BoundColumn DataField="Totalweight" ReadOnly="True" HeaderText="£KÏÑò¼¡¼Ïü"></asp:BoundColumn>
															<asp:BoundColumn DataField="Machintton" ReadOnly="True" HeaderText="³Zõåµj­p"></asp:BoundColumn>
															<asp:BoundColumn DataField="Modulesize" ReadOnly="True" HeaderText="®a¯a¡¼¡¼"></asp:BoundColumn>
															<asp:BoundColumn DataField="IsHotChannel" ReadOnly="True" HeaderText="Öv¡¼£VÂË·ÎÖË"></asp:BoundColumn>
															<asp:BoundColumn DataField="IsHotProcess" ReadOnly="True" HeaderText="Öv¡¼¡¼ÂË¹ní~"></asp:BoundColumn>
															<asp:BoundColumn DataField="Materialid" ReadOnly="True" HeaderText="®a¡¼µe­É"></asp:BoundColumn>
															<asp:BoundColumn DataField="Period" ReadOnly="True" HeaderText="¬g®a¢WÂW"></asp:BoundColumn>
															<asp:BoundColumn DataField="Life" ReadOnly="True" HeaderText="®a£´Ãö¡ë"></asp:BoundColumn>
															<asp:BoundColumn DataField="Slidcount" ReadOnly="True" HeaderText="µá¹K­pÏü"></asp:BoundColumn>
															<asp:BoundColumn DataField="Slotcount" ReadOnly="True" HeaderText="¹úãf­pÏü"></asp:BoundColumn>
															<asp:BoundColumn DataField="Id" ReadOnly="True" HeaderText="®a£´Úñ¸¡"></asp:BoundColumn>
															<asp:EditCommandColumn UpdateText="¡¼¡¼" HeaderText="¯¹¡¼" CancelText="¡¼¡¼" EditText="Úñ¯ã"></asp:EditCommandColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('¡¼¡~¡¼®J¬Þ¡¼')&quot;&gt;¡¼®J&lt;/div&gt;"
																HeaderText="¯¹¡¼" CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
													<hr color="#ccccff">
													<br>
													<table borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
														border="1">
														<TR vAlign="middle">
															<TD width="15%" height="28">
																<DIV align="center"><B>Å÷¡¼
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
												<TD colSpan="3"><FONT face="¡¼Àé¡¼¯y"></FONT></TD>
											</TR>
										</TBODY></TABLE>
								</TD>
							</TR>
						</TABLE>
					</form>
				</TD>
			</TR>
		</TABLE>
	</body>
</HTML>
