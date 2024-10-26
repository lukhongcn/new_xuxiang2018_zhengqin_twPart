<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="OutsourceApplyAdd.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OutsourceApplyAdd" %>
<%@ Register TagPrefix="esshs" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/logisticheader.ascx" %>
<%@ Register TagPrefix="GridSelectCheckBox" Namespace="Utility" Assembly="Utility" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>¡¼¡¼¡¼¥s«ëí~</title>
		<LINK href="../css/common.css" rel="stylesheet">
	</HEAD>
	<body topMargin="0">
		<form id="Form1" name="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TR>
					<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="left" width="20%"></TD>
					<TD width="1%">&nbsp;</TD>
					<TD vAlign="top" width="79%">
						<TABLE cellSpacing="2" width="100%" border="0">
							<TR>
								<TD>
									<DIV align="left">¡¼¡¼¡¼¥s«ëí~</DIV>
								</TD>
							</TR>
						</TABLE>
						<HR>
						<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
							width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
							<TR>
								<TD>
									<TABLE width="100%" align="center" border="0">
										<TR>
											<TD rowSpan="5"><asp:radiobuttonlist id="rbl_outsourcetype" runat="server" AutoPostBack="True">
													<asp:ListItem Value="Module">¡¼®a£´</asp:ListItem>
													<asp:ListItem Value="Part">¡¼¿µ¡¼</asp:ListItem>
													<asp:ListItem Value="PartId">¡¼ÂÎ¡¼ã]¡¼</asp:ListItem>
												</asp:radiobuttonlist></TD>
										</TR>
										<TR>
											<TD>¡¼¡¼</TD>
											<TD><asp:dropdownlist id="dpl_CustomerList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
										</TR>
										<TR>
											<TD height="28">®a£´</TD>
											<TD height="28"><asp:dropdownlist id="dpl_ModuleList" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
										</TR>
										<TR>
											<TD height="17">ã]¡¼</TD>
											<TD height="17"><asp:dropdownlist id="dpl_partno" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
										</TR>
										<TR>
											<TD>ÂÎ¡¼ã]¡¼</TD>
											<TD><asp:dropdownlist id="dpl_partid" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
						<BR>
						<TABLE width="100%" align="center" border="0">
							<TBODY>
								<TR>
									<TD>¡¼¥s¡¼:
										<asp:label id="lab_applier" runat="server">Label</asp:label></TD>
									<TD>ð@ÁÊ¡¼¬õ¡¼ÂW:
										<esshs:inputcalendar id="ic_send" runat="server"></esshs:inputcalendar></TD>
									<TD>ã]¡¼­pÏü:
										<asp:textbox id="txt_partnum" runat="server"></asp:textbox></TD>
								</TR>
								<TR>
									<TD height="6">Ã¢Òà³õ¡¼:
										<asp:dropdownlist id="dpl_department" runat="server" AutoPostBack="True"></asp:dropdownlist></TD>
									<TD height="6">ð@ÁÊ¡¼¬õ¡¼ÂW:
										<esshs:inputcalendar id="ic_receive" runat="server"></esshs:inputcalendar></TD>
									<TD height="6">ºÙ¯R:
										<asp:textbox id="txt_comment" runat="server" Width="200px"></asp:textbox></TD>
								</TR>
								<TR>
									<TD colSpan="4"><asp:button id="btn_save" runat="server" Text="÷ç¡¼"></asp:button></TD>
								</TR>
				</TR>
			</TABLE>
			<asp:datagrid id="dg_sourceapply" runat="server" AutoGenerateColumns="False" AllowPaging="True">
				<SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
				<EditItemStyle HorizontalAlign="Center"></EditItemStyle>
				<AlternatingItemStyle HorizontalAlign="Center"></AlternatingItemStyle>
				<ItemStyle HorizontalAlign="Center"></ItemStyle>
				<HeaderStyle Wrap="False" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
				<Columns>
					<gridselectcheckbox:DGCheckBoxColumn></gridselectcheckbox:DGCheckBoxColumn>
					<asp:BoundColumn DataField="ModuleId" ReadOnly="True" HeaderText="®a£´ÚñÚò"></asp:BoundColumn>
					<asp:BoundColumn DataField="PartNo" ReadOnly="True" HeaderText="ã]¡¼"></asp:BoundColumn>
					<asp:BoundColumn DataField="PartNo_Id" ReadOnly="True" HeaderText="ÂÎ¡¼ã]¡¼"></asp:BoundColumn>
					<asp:BoundColumn DataField="ProcessName" ReadOnly="True" HeaderText="¡¼¡¼"></asp:BoundColumn>
					<asp:BoundColumn Visible="False" DataField="ProcessId" ReadOnly="True" HeaderText="processid"></asp:BoundColumn>
				</Columns>
				<PagerStyle Mode="NumericPages"></PagerStyle>
			</asp:datagrid>
			<HR color="#ccccff">
			<BR>
			<TABLE borderColor="#000660" borderColorDark="#000066" width="100%" align="center" borderColorLight="#000066"
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
			</TABLE>
			</TD></TR>
			<TR>
				<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</TBODY></TABLE></FONT>
			<P></P>
		</form>
	</body>
</HTML>
