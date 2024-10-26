<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderDesignView.ascx.cs" Inherits="ModuleWorkFlow.order.controls.OrderDesignView" %>


<table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
        <td class="mainTitle" align="center">模具基本信息</td>
    </tr>
    <tr>
        <td valign="top">
            <asp:Table ID="Table3" runat="server" Width="100%">
            </asp:Table>
            <br>
        </td>

    </tr>
    <tr>
        <td colspan="3">
            <asp:DataGrid ID="MainDataGrid" runat="server" Width="100%" AutoGenerateColumns="False" CellSpacing="1"
                CellPadding="0" BorderWidth="0" CssClass="Grid">
                <SelectedItemStyle HorizontalAlign="Center"></SelectedItemStyle>
                <EditItemStyle HorizontalAlign="Center"></EditItemStyle>
                <ItemStyle HorizontalAlign="Center" BorderStyle="Dotted" BorderColor="#E3E3E4" BackColor="White"></ItemStyle>
                <HeaderStyle HorizontalAlign="Center" CssClass="dg_header" VerticalAlign="Middle"></HeaderStyle>
                <Columns>
                    <asp:BoundColumn DataField="ModuleId" HeaderText="模具編號">
                        <ItemStyle Width="80px"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PartNo" HeaderText="零件編號">
                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PartName" HeaderText="零件名稱">
                        <ItemStyle Width="60px"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="DueDate" HeaderText="需求日期" DataFormatString="{0:yyyy-MM-dd H:mm}">
                        <ItemStyle Width="60px"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="" HeaderText="完成率(%)">
                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PartStatusId" HeaderText="零件狀態">
                        <ItemStyle Width="50px"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="PartNo_Id" HeaderText="小編號">
                        <ItemStyle Width="60px"></ItemStyle>
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="CReturn" HeaderText="工序">
                        <ItemStyle HorizontalAlign="Left" BackColor="White"></ItemStyle>

                    </asp:BoundColumn>
                    <%--     <asp:TemplateColumn HeaderText="CReturn" ItemStyle-BackColor="White" ItemStyle-HorizontalAlign="Left">
                                            <HeaderTemplate>工序</HeaderTemplate>
                                            <ItemTemplate >
                                               <asp:LinkButton runat="server" OnClientClick="return ShowBlock();" 
                                                       Text='<%#DataBinder.Eval(Container, "DataItem.CReturn")%>'
                                                  >
                                               </asp:LinkButton>
                                                  <asp:LinkButton runat="server" 
                                                       Text='<%#DataBinder.Eval(Container, "DataItem.CReturn")%>'
                                                  >
                                               </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>--%>
                </Columns>
            </asp:DataGrid></td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td colspan="2">顏色對照表</td>
                </tr>
                <tr>
                    <asp:Label ID="lab_color" runat="server"></asp:Label>
                </tr>

            </table>
        </td>
    </tr>
</table>



<div id="divNewBlock" style="border: solid 2px; padding: 2px; width: 800px; z-index: 1001; position: absolute; display: none; background-color: white; position: center; left: 10%">
    <div style="padding: 3px 15px 3px 15px; text-align: left; vertical-align: middle;">
        <div style="margin-right: 100px; margin-left: 750px">
            <asp:Button ID="BttCancel" runat="server" Text="关闭" OnClientClick="return HideBlock();" />
        </div>
        <div>
            <label>零件編號:</label>
            <label id="lab_rel_moduleid"></label>
            <label>工序</label>
            <label id="lab_rel_processid"></label>
            (
                   <label id="lab_rel_processorder"></label>
            )
        </div>
        <div id="relation">
            <%--  <table id="relation"   >
                         
                    </table>--%>
        </div>


    </div>

</div>




<script type="text/javascript" src="js.jquery.js"></script>
<script type="text/javascript" language="javascript">

    function HideBlock() {
        document.getElementById("divNewBlock").style.display = "none";
        return false;
    }


    function ShowBlock(processno, PartNo_Id, ProcessId, ProcessOrder) {

        var set = SetBlock();

        $('#relation').html("");

        $.ajax({
            type: "post",
            url: "OrderDesignList.aspx/getRelationDatabyProcessNo",
            contentType: "application/json; charset=utf-8",
            async: false,
            dataType: "json",
            data: "{'processno':'" + processno + "'}",
            success: function (data) {
                num = data.d;
                //num = data;

                $('#relation').append(num);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        });
        document.getElementById("divNewBlock").style.display = "";
        document.getElementById("lab_rel_moduleid").innerHTML = PartNo_Id;
        document.getElementById("lab_rel_processid").innerHTML = ProcessId;
        document.getElementById("lab_rel_processorder").innerHTML = ProcessOrder;

        return false;
    }

    function ShowDiscardBlock(moduleId, partnoId) {

        var set = SetBlock();

        $('#relation').html("");

        $.ajax({
            type: "post",
            url: "OrderDesignList.aspx/getDiscardInfo",
            contentType: "application/json; charset=utf-8",
            async: false,
            dataType: "json",
            data: "{'moduleidpartno':'" + moduleId + "|" + partnoId + "'}",
            success: function (data) {
                num = data.d;
                //num = data;

                $('#relation').append(num);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        });
        document.getElementById("divNewBlock").style.display = "";
        document.getElementById("lab_rel_moduleid").innerHTML = partnoId;
        document.getElementById("lab_rel_processid").innerHTML = "";
        document.getElementById("lab_rel_processorder").innerHTML = "";

        return false;
    }


    function SetBlock() {
        var top = document.body.scrollTop;
        var left = document.body.scrollLeft;
        var height = document.body.clientHeight;
        var width = document.body.clientWidth;

        var e = event || window.event;
        var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft;
        var scrollY = document.documentElement.scrollTop || document.body.scrollTop;
        var x = e.pageX || e.clientX + scrollX;
        var y = e.pageY || e.clientY + scrollY;

        document.getElementById("divNewBlock").style.top = y - 15;


        if (top == 0 && left == 0 && height == 0 && width == 0) {
            top = document.documentElement.scrollTop;
            left = document.documentElement.scrollTop;
            height = document.documentElement.clientHeight;
            width = document.documentElement.clientWidth;
        }
        return { top: top, left: left, height: height, width: width };
    }


    function Operate() {
        return false;
    }




</script>


