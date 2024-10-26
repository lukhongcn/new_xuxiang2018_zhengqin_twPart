<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="PartHeader" Src="controls/PartHeader.ascx" %>
<%@ Page language="c#" Codebehind="ModelTest.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.ModelTest" smartNavigation="True" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="OrderHeader" Src="controls/OrderHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>配件設定</title>
		<FORUM:STYLE id="Style" runat="server"></FORUM:STYLE>
		<script language="javascript" src="js/lib.js"></script>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%">
							<uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%"><BR>
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="1">
								<TBODY>
									<tr>
										<td>
											<asp:Label ID="Label1" runat="server" Text="模號："></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox1" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label2" runat="server" Text="Tn試模"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox2" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label3" runat="server" Text="塑料名稱"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox3" Width="100" runat="server"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td>
											<asp:Label ID="Label4" runat="server" Text="品名"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox4" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label5" runat="server" Text="成品重量"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox5" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label6" runat="server" Text="流道重量"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox6" Width="100" runat="server"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td>
											<asp:Label ID="Label7" runat="server" Text="客戶圖號"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox7" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label8" runat="server" Text="縮水率（%）"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox8" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label9" runat="server" Text="模具尺寸"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox9" Width="100" runat="server"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td>
											<asp:Label ID="Label10" runat="server" Text="試模地點"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox10" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label11" runat="server" Text="機器噸數"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox11" Width="100" runat="server"></asp:TextBox>
										</td>
										<td>
											<asp:Label ID="Label12" runat="server" Text="模具重量"></asp:Label>
										</td>
										<td>
											<asp:TextBox ID="TextBox12" Width="100" runat="server"></asp:TextBox>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<table border="1" width="100%">
												<tr>
													<td>射出條件表</td>
													<td align="center">1</td>
													<td align="center">2</td>
													<td align="center">3</td>
													<td align="center">4</td>
													<td align="center">5</td>
													<td align="center">6</td>
													<td align="center">7</td>
												</tr>
												<tr>
													<td>料管溫度(℃)</td>
													<td>
														<asp:TextBox ID="TextBox13" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox14" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox15" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox16" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox17" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox18" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox19" runat="server" Width="55"></asp:TextBox></td>
												</tr>
												<tr>
													<td>進料刻度(mm)</td>
													<td>
														<asp:TextBox ID="TextBox27" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox28" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox29" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox30" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox31" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox32" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox33" runat="server" Width="55"></asp:TextBox></td>
												</tr>
												<tr>
													<td>射出時間(Sec)</td>
													<td>
														<asp:TextBox ID="TextBox34" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox35" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox36" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox37" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox38" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox39" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox40" runat="server" Width="55"></asp:TextBox></td>
												</tr>
												<tr>
													<td>射出壓力(kg/cm2)</td>
													<td>
														<asp:TextBox ID="TextBox41" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox42" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox43" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox44" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox45" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox46" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox47" runat="server" Width="55"></asp:TextBox></td>
												</tr>
												<tr>
													<td>射出速度(mm/Sec)</td>
													<td>
														<asp:TextBox ID="TextBox48" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox49" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox50" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox51" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox52" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox53" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox54" runat="server" Width="55"></asp:TextBox></td>
												</tr>
												<tr>
													<td>熱澆道溫度(℃)</td>
													<td>
														<asp:TextBox ID="TextBox55" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox56" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox57" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox58" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox59" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox60" runat="server" Width="55"></asp:TextBox></td>
													<td>
														<asp:TextBox ID="TextBox61" runat="server" Width="55"></asp:TextBox></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="6">
											<table border="1" width="100%">
												<tr>
													<td>模具溫度(℃)</td>
													<td align="center">固定</td>
													<td align="center">
														<asp:TextBox id="TextBox97" runat="server" Width="55"></asp:TextBox></td>
													<td align="center">移動</td>
													<td align="center">
														<asp:TextBox id="TextBox98" runat="server" Width="55"></asp:TextBox></td>
													<td align="center">松退</td>
													<td align="center">
														<asp:TextBox id="TextBox99" runat="server" Width="55"></asp:TextBox>秒</td>
													<td align="center">
														<asp:TextBox id="TextBox100" runat="server" Width="55"></asp:TextBox>mm</td>
												</tr>
												<tr>
													<td>松退壓力</td>
													<td>
														<asp:TextBox ID="Textbox20" runat="server" Width="55"></asp:TextBox>%</td>
													<td>
														<asp:TextBox ID="Textbox21" runat="server" Width="55"></asp:TextBox>Cm/min</td>
													<td>松退速度</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox23" runat="server" Width="55"></asp:TextBox>%</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox24" runat="server" Width="55"></asp:TextBox>Cm/秒</td>
												</tr>
												<tr>
													<td>絞料轉速</td>
													<td>
														<asp:TextBox ID="Textbox22" runat="server" Width="55"></asp:TextBox>%</td>
													<td>
														<asp:TextBox ID="Textbox25" runat="server" Width="55"></asp:TextBox>Cm/min</td>
													<td>絞料壓力</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox26" runat="server" Width="55"></asp:TextBox>%</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox62" runat="server" Width="55"></asp:TextBox>Cm/秒</td>
												</tr>
												<tr>
													<td>冷卻時間</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox63" runat="server" Width="55"></asp:TextBox>秒</td>
													<td>鎖模壓力</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox65" runat="server" Width="55"></asp:TextBox>%</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox66" runat="server" Width="55"></asp:TextBox>kg/cm2</td>
												</tr>
												<tr>
													<td>頂出行程</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox64" runat="server" Width="55"></asp:TextBox>mm</td>
													<td>試模耗料</td>
													<td colspan="4">
														<asp:TextBox ID="Textbox67" runat="server" Width="55"></asp:TextBox>KG</td>
												</tr>
												<tr>
													<td>背壓</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox68" runat="server" Width="55"></asp:TextBox>kg/cm2</td>
													<td>模具中心偏移量</td>
													<td colspan="4">
														<asp:TextBox ID="Textbox69" runat="server" Width="55"></asp:TextBox>mm</td>
												</tr>
												<tr>
													<td>成型時間</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox70" runat="server" Width="55"></asp:TextBox>秒</td>
													<td>試模時間</td>
													<td colspan="2">
														開始<asp:TextBox ID="Textbox71" runat="server" Width="55"></asp:TextBox></td>
													<td colspan="2">結束<asp:TextBox ID="Textbox72" runat="server" Width="55"></asp:TextBox></td>
												</tr>
												<tr>
													<td>試模數量</td>
													<td colspan="2">
														<asp:TextBox ID="Textbox73" runat="server" Width="55"></asp:TextBox>秒</td>
													<td>提供用戶
														<asp:TextBox ID="Textbox74" runat="server" Width="55"></asp:TextBox></td>
													<td colspan="4">其它備註<asp:TextBox ID="Textbox75" runat="server" Width="55"></asp:TextBox></td>
												</tr>
											</table>
										</td>
									</tr>
								</TBODY>
							</TABLE>
							<asp:button id="Button_AddEdit" runat="server" Text="新增"></asp:button><br>
							<TABLE id="Table3" borderColor="#000660" borderColorDark="#000066" width="100%" align="center"
								borderColorLight="#000066" border="1">
								<TR vAlign="middle">
									<TD width="15%" height="28">
										<DIV align="center"><B>
												<DIV align="center"><B>提示</B></DIV>
											</B>
										</DIV>
									</TD>
									<TD class="msg" width="85%">&nbsp;&nbsp;
										<asp:label id="Label_Message" runat="server" ForeColor="RED" Font-Bold="True"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>
	</body>
</HTML>
