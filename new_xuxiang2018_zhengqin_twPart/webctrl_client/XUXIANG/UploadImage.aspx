<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Page language="c#" Codebehind="UploadImage.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.UploadImage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>�W�ǹϤ�</title>
		<Forum:Style id="Style" runat="server" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<script language="javascript">
			function returnVal()
			{
				window.opener.document.forms['Form1'].TextBox_Picture.value = '<% = returnVal %>';
				window.close();
			}
		</script>
	</HEAD>
	<body>
		<form id="Form1" method="post" runat="server" enctype="multipart/form-data">
			<CENTER>
				<asp:Label Runat="server" ID="MyTitle">�W�ǹϤ�</asp:Label>
				<P id="MyFile"><INPUT type="file" size="30" NAME="File"></P>
				<P>
					<asp:Button Runat="server" Text="�W��" ID="Upload"></asp:Button>
					<input onclick="this.form.reset()" type="button" value="���m">
				</P>
			</CENTER>
			<P align="center">
				<asp:Label id="strStatus" runat="server" Font-Bold="True" Font-Size="9pt" Width="50%" BorderStyle="None"
					BorderColor="White"></asp:Label>
			</P>
			<P align="center">
				<asp:LinkButton id="LinkButton_return" runat="server">[��^]</asp:LinkButton></P>
		</form>
	</body>
</HTML>
<%=closeWind%>
