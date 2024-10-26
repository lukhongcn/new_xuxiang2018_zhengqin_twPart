<%@ Register TagPrefix="uc1" TagName="CreateScheduleHeader" Src="controls/CreateScheduleHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="controls/LeftMenu.ascx" %>
<%@ Page language="c#" Codebehind="CreateSchedule.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.CreateSchedule" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>創建排程</title>
		<Forum:Style id="Style" runat="server" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link rel="stylesheet" type="text/css" href="js/jsgantt.css">
		<script language="javascript" src="js/jsgantt.js"></script>
		<script language="javascript">
		<%=xml%>
		</script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<TR>
						<TD colSpan="3"><uc1:header id="Header" runat="server"></uc1:header></TD>
					</TR>
					<TR>
						<TD vAlign="top" align="left" width="20%"><uc1:leftmenu id="LeftMenu" runat="server"></uc1:leftmenu></TD>
						<TD width="1%">&nbsp;</TD>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" border="0">
								<TBODY>
									<tr>
										<td><FONT color="red">(重新排程，請單擊下面按鈕！)</FONT>
										</td>
									</tr>
									<tr>
										<td>
											<P>&nbsp;</P>
											<P><FONT face="新細明體">&nbsp;&nbsp; </FONT>
												<asp:button id="Button_Submit" Runat="server" Text="摸擬排程"></asp:button><asp:button id="btn_gant" runat="server" Text="摸擬排程瀏覽"></asp:button>
												<asp:DropDownList id="dpl_customer" runat="server" AutoPostBack="True"></asp:DropDownList>
												<asp:DropDownList id="dpl_moduleid" runat="server" AutoPostBack="True"></asp:DropDownList>
												<asp:TextBox id="txt_module" runat="server"></asp:TextBox>
											<P></P>
											<P><FONT face="新細明體"><FONT face="宋體"></FONT><asp:panel id="Panel1" runat="server"></asp:panel></FONT></P>
										</td>
									</tr>
								</TBODY>
							</TABLE>
							<div style="POSITION:relative" class="gantt" id="GanttChartDIV"></div>
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
										<asp:label id="Label_Message" runat="server"></asp:label></TD>
								</TR>
							</TABLE>
						</TD>
					</TR>
					<TR>
						<TD colSpan="3"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
					</TR>
				</TBODY>
			</TABLE>
			<%=closeWind%>
		</form>
	</body>
</HTML>
