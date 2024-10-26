<%@ Page language="c#" Codebehind="OutSourcing.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.LeftTree" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="controls/footer.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>LeftTree</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link rel="StyleSheet" href="js/tree.css" type="text/css">
		<script type="text/javascript" src="js/tree.js"></script>
		<script type="text/javascript">
	<%=tree%>
		</script>
	</HEAD>
	<body topMargin="0">
		
		<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" border="0">
			<TBODY>
				<TR>
					<TD colSpan="2"><uc1:header id="Header" runat="server"></uc1:header></TD>
				</TR>
				<TR>
					<TD vAlign="top" align="left" width="20%">
					<A href="default.aspx">ªð¦^­º­¶</A>
					<br>
					<br>
					</td>
				</tr>
				<tr>
				<td vAlign="top">
				
				<form id="Form1" method="post" runat="server">
				<asp:dropdownlist id="drp_customerlist" Runat="server" AutoPostBack="True"></asp:dropdownlist>
				</td>
				<td>
				<iframe name="framemain" src="OutSourcingModule.aspx" width="100%" height="500px" scrolling="yes" 
				frameborder="0"></iframe>
				</td>
				</form>
				</tr>
				<tr>
				<td>
				<div class="tree">
				<script type="text/javascript">
				<!--
				createTree(Tree,1);  // start the tree at node nr. 1
				//-->
			</script>
			</div>
			</td>
			</tr>
			<TR>
			<TD colSpan="2"><uc1:footer id="Footer" runat="server"></uc1:footer></TD>
			</TR>
			</tbody>
			</table>
				
			
		
		
	</body>
</HTML>
