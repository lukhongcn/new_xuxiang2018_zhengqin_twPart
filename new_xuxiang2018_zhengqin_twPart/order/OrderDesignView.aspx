<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%--<%@ Register TagPrefix="wc" Namespace="WebControlLibrary" Assembly="WebControlLibrary" %>--%>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Page Language="c#" CodeBehind="OrderDesignView.aspx.cs" AutoEventWireup="false" Inherits="ModuleWorkFlow.OrderDesignView" %>

<%@ Register TagPrefix="Forum" Namespace="ModuleWorkFlow.controls" Assembly="ModuleWorkFlow" %>
<%@ Register TagPrefix="uc1" TagName="footer" Src="../controls/footer.ascx" %>
<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="../controls/LeftMenu.ascx" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>訂單設定</title>
    <link href="css/amd.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../js/ui-lightness/jquery-ui-1.8.13.custom.css" type="text/css" />
    <link rel="stylesheet" href="../js/jquery-ui-timepicker.css?v=0.2.2" type="text/css" />

    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.timepicker.js?v=0.2.2"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('.timepicker').timepicker({
                showPeriod: false,
                showLeadingZero: false
            });
            $(".txtProductname").change(function () {
                var isReadonly = $(".txtModuleId").attr('readonly');
                if (!isReadonly) {
                    displayVals();
                }
            });

            //        $(".dplCustomerId").change(function () {
            //            var isReadonly = $(".txtModuleId").attr('readonly');
            //            if (!isReadonly) {
            //                //                          $(".txtModuleId").val($(".dplCustomerId option:selected").text() + $(".dplmodelType option:selected").text() + $(".txtProductname").val());
            //                displayVals();
            //            }
            //        });

            $(".dplmodelType").change(function () {
                var isReadonly = $(".txtModuleId").attr('readonly');
                if (!isReadonly) {

                    displayVals();
            }
        });



                    function displayVals() {
                        //             $(".txtModuleId").val($(".dplCustomerId option:selected").text() + $(".dplmodelType option:selected").text() + $(".txtProductname").val());
                        //             alert($(".dplCustomerId").val() + "," + $(".dplmodelType").val());
                        $.ajax({
                            type: "POST",
                            url: "OrderDesignView.aspx/UpdateModuleId",
                            //Passing the record id and data to be updated which is in the variable record_id
                            data: "{'customerId': '" + $(".dplCustomerId").val() + "','modelTypeId': '" + $(".dplmodelType").val() + "'}",
                            contentType: "application/json; charset=big5",
                            dataType: "json",
                            //Giving message to user on successful updation
                            success: function (r) {


                                var update = r.d + $(".txtProductname").val();
                                //                     alert(update);

                                //                     alert($(".txtModuleId").val());
                                $(".txtModuleId").val(update);
                                //location.reload();
                            }
                        });
                    }

                    //         $(".dplmodelType").change(displayVals);
                    //         $(".txtProductname").change(displayVals);
                    //         $(".dplCustomerId").change(displayVals);
                });
    </script>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <div id="Wrapper">
            <div id="Header">
                <div class="headbox">
                    <div class="linebox">
                        <a href="#">生產管理</a>
                        <img src="images/arrow.png" />
                        <a href="#">訂單設定</a>
                    </div>
                    <div class="logout">
                        <a href="../login.aspx" target="_parent">登出</a>
                    </div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Menu">
                <div class="menubox">
                    <div class="mod1">
                        <ul>
                            <li class="btn1"><a href="OrderDesignView.aspx" title="新增 / add">新增/add</a>
                            </li>
                            <li class="btn3">
                                <asp:LinkButton ID="lnkbutton_save" runat="server" ToolTip="儲存/save" OnClick="lnkbutton_save_Click">儲存/save</asp:LinkButton>
                            </li>
                            <li class="btn5">
                                <asp:LinkButton ID="lnkbutton_view" runat="server"
                                    ToolTip="檢視 / view" OnClick="lnkbutton_view_Click">檢視/view</asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                    <div class="mod2"></div>
                    <div class="clearbox"></div>
                </div>
            </div>
            <div id="Container">
                <div id="Content">
                    <div class="space1"></div>
                    <div class="Textbox">
                        <asp:Label ID="func" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="Label_HiddenModuleId" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label_HiddenFuncMode" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_pageindex" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_customerid" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_producttype" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_modifyid" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_startdate" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_enddate" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_customermoduleid" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_overstatus" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_key" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                        <asp:Label ID="lab_datetype" runat="server" Visible="False" ForeColor="Red"></asp:Label>

                        <asp:Label ID="lab_picturename" runat="server" Visible="False"></asp:Label>
                        <asp:Table ID="Table4" runat="server" BorderColor="black" Width="100%"></asp:Table>


                    </div>
                    <div class="box">
                        <table id="Table3" width="100%" align="center" class="tbMessage" border="1">
                            <tr valign="middle">
                                <td width="15%" height="28">
                                    <div align="center">
                                        <b>
                                            <div align="center">
                                                <b>提示</b>
                                                <asp:Label ID="lab_oldstatusid" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </b>
                                    </div>
                                </td>
                                <td class="msg" width="85%">&nbsp;&nbsp;<asp:Label ID="Label_Message" runat="server"></asp:Label>
                                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True"></asp:ScriptManager>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

