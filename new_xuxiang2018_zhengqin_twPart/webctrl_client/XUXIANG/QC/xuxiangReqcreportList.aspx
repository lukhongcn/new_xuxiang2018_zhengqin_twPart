<%@ Page language="c#" Codebehind="xuxiangReqcreportList.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.xuxiangReqcreportList" %>
<%@ Register TagPrefix="uc1" TagName="header" Src="../controls/header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>
<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>
<%@ Register TagPrefix="uc1" TagName="ReqcreportHeader" Src="controls/xuxiangReqcreportHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>QC</title>
<meta content=http://schemas.microsoft.com/intellisense/ie5 name=vs_targetSchema><LINK href="../css/common.css" rel=stylesheet >
  </HEAD>
<body topMargin=0>
<form id=Form1 method=post runat="server">
<TABLE id=Table2 cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD colSpan=3><uc1:header id=Header runat="server"></uc1:header></TD></TR>
  <tr>
    <TD vAlign=top align=left width="20%"><uc1:leftmenu id=LeftMenu runat="server"></uc1:leftmenu></TD>
    <TD width="1%">&nbsp;</TD>
    <TD vAlign=top width="79%"><uc1:reqcreportheader id=ReqcreportHeader runat="server"></uc1:reqcreportheader><br 
      >
      <hr>

      <table cellSpacing=2 width="100%" border=0>
        <tr>
          <td>
            <div align=left><FONT face=新細明體 
            ></FONT></DIV></TD></TR></TABLE>
      <hr>

      <TABLE id=Table1 borderColor=#ccccff cellSpacing=1 borderColorDark=#cccccc 
      cellPadding=0 width="100%" align=center borderColorLight=#ccccff border=1 
       runat="server">
        <tr>
          <td vAlign=top>
            <table width="100%" align=center border=0>
              <TR>
                <TD colSpan=2><asp:label id=func runat="server" Visible="False" Text=""></asp:label><asp:label id=lab_Id Visible="False" text="" Runat="server"></asp:Label></TD></TR>
              <tr>
                <td colSpan=2><asp:datagrid id=dg_Reqcreport runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False">
																<HeaderTemplate>
																	<asp:Label ID="dg_header_id" Runat="server" text="序號"></asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	<asp:Label ID="dg_lab_id" Runat="server" text='<%#DataBinder.Eval(Container, "DataItem.Id")%>'>
																	</asp:Label>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn>
																<HeaderTemplate>
																	<asp:Label id="dg_header_Moduleid" runat="server" Text='<%# System.Configuration.ConfigurationSettings.AppSettings["ModuleIdShow"]%>'>
																	</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Moduleid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Moduleid")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="partnoId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_partnoId" runat="server">零件</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_partnoId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartnoId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="ProductMaterialInventoryId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_ProductMaterialInventoryId" runat="server">成品料號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_ProductMaterialInventoryId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.ProductMaterialInventoryId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Pictureno">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Pictureno" runat="server">圖號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Pictureno" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Pictureno")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="materialId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_materialId" runat="server">材質</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_materialId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.MaterialId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Ver">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Ver" runat="server">版次</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Ver" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Ver")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="" EditText="QC明細"></asp:EditCommandColumn>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<asp:HyperLink id=HyperLink_Edit runat="server" Text="編輯" NavigateUrl='<%# "xuxiangReqcreportView.aspx?func=edit&id="+DataBinder.Eval(Container, "DataItem.Id") %>'>
																	</asp:HyperLink>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:ButtonColumn Text="&lt;div onclick=&quot;javascript:return confirm('確認刪除嗎')&quot;&gt;刪除&lt;/div&gt;" 
 HeaderText="刪除" CommandName="Delete"></asp:ButtonColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid>
                  <hr style="COLOR: #ccccff">
<asp:datagrid id=dg_Reqcreportdetail runat="server" AllowPaging="True" CellPadding="2" CellSpacing="2" AutoGenerateColumns="False">
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#AAAADD"></HeaderStyle>
														<Columns>
															<asp:TemplateColumn Visible="False" HeaderText="QcreportId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_QcreportId" runat="server">QcreportId</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_QcreportId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.QcreportId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Processid">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Processid" runat="server">工段別</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Processid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Processid")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Machineid" Visible="False">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Machineid" runat="server">機台編號</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Machineid" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Machineid")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Producter">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Producter" runat="server">加工者</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Producter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Producter")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CheckNumber">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CheckNumber" runat="server">檢測數量</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CheckNumber" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckNumber")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Checker">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Checker" runat="server">檢測人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Checker" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Checker")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CheckDate">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CheckDate" runat="server">檢測日期</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CheckDate" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckDate","{0:d}")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="CheckMachineNo">
																<HeaderTemplate>
																	<asp:Label id="dg_header_CheckMachineNo" runat="server">測量儀器</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_CheckMachineNo" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.CheckMachineNo")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="StandardSize">
																<HeaderTemplate>
																	<asp:Label id="dg_header_StandardSize" runat="server">標值</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_StandardSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.StandardSize")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn Visible="False" HeaderText="Difference">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Difference" runat="server">公差</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Difference" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Difference")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="FactSize">
																<HeaderTemplate>
																	<asp:Label id="dg_header_FactSize" runat="server">實測</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_FactSize" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.FactSize")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Partcount">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Partcount" runat="server">零件件數</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Partcount" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Partcount")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="JudgeId">
																<HeaderTemplate>
																	<asp:Label id="dg_header_JudgeId" runat="server">質量情況判定</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_JudgeId" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.JudgeId")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="Judger">
																<HeaderTemplate>
																	<asp:Label id="dg_header_Judger" runat="server">判定人</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_Judger" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Judger")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
															<asp:TemplateColumn HeaderText="PartnoOuter">
																<HeaderTemplate>
																	<asp:Label id="dg_header_PartnoOuter" runat="server">備註</asp:Label>
																</HeaderTemplate>
																<ItemTemplate>
																	&nbsp;
																	<asp:Label id="dg_lab_PartnoOuter" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.PartnoOuter")%>'/>
																</ItemTemplate>
															</asp:TemplateColumn>
														</Columns>
														<PagerStyle Mode="NumericPages"></PagerStyle>
													</asp:datagrid><br 
              ></TD></TR></TABLE></TD></TR></TABLE><br 
      ><br>
      <table borderColor=#000660 borderColorDark=#000066 width="100%" 
      align=center borderColorLight=#000066 border=1>
        <TR vAlign=middle>
          <TD width="15%" height=28>
            <DIV align=center><B>
            <DIV align=center><B 
            >提示</B></DIV></B></DIV></TD>
          <TD class=msg width="85%">&nbsp;&nbsp; <asp:label id=Label_Message runat="server"></asp:label></TD></TR></TABLE></TD></TR>
  <TR>
    <TD colSpan=3><uc1:footer id="Footer" runat="server"></uc1:footer></TD></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
