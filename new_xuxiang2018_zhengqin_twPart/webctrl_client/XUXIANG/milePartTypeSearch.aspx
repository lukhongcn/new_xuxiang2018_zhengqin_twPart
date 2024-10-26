<%@ Page language="c#" Codebehind="milePartTypeSearch.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.milePartTypeSearch" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>零件類別查詢</title>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../css/common.css" rel="stylesheet">
		<script language="javascript">
			function returnVal()
			{				
				window.opener.document.forms['Form1'].txt_parttypeid.value = '<% = parttypeid %>';
				window.opener.document.forms['Form1'].txt_name.value = '<% = name %>';
				window.opener.document.forms['Form1'].submit();
				window.close(); 
			}
		</script>
	</HEAD>
	<body topMargin="0">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
				<TBODY>
					<tr>
						<TD vAlign="top" width="79%">
							<TABLE id="Table1" borderColor="#ccccff" cellSpacing="1" borderColorDark="#cccccc" cellPadding="0"
								width="100%" align="center" borderColorLight="#ccccff" border="1" runat="server">
								<tr>
									<td vAlign="top" borderColorLight="#ccccff" borderColorDark="#cccccc"><asp:panel id="pan_treeview" runat="server"></asp:panel></td>
								</tr>
								<tr>
									<td>
										<hr style="COLOR: #ccccff">
										<asp:label id="Lab_message" runat="server" Width="136px" ForeColor="Red"></asp:label><br>
									</td>
								</tr>
							</TABLE>
						</TD>
					</tr>
				</TBODY>
			</TABLE>
			<%=closeWind%>
		</form>
		</TD></TR></TBODY></TABLE>
	</body>
</HTML>
