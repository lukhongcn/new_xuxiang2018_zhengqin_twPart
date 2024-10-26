<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="defaultmain.aspx.cs" Inherits="ModuleWorkFlow.defaultmain" %>

<%@ Register TagPrefix="uc1" TagName="LeftMenu" Src="Menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="SummaryChart" Src="defaultMainConALT.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>AMD Dashboard</title>
    <!-- MDB icon -->
    <link rel="icon" href="MDB5/img/mdb-favicon.ico" type="image/x-icon" />
    <!-- Font Awesome -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <!-- Google Fonts Roboto -->
    <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="MDB5/csspro/mdb.min.css" />
    <link rel="stylesheet" href="MDB5/csspro/all.min.css" />
    <link rel="stylesheet" href="MDB5/csspro/all.css" />


    <style>
        body {
            background-color: hsl(218, 41%, 15%);
            background-image: radial-gradient( 650px circle at 0% 0%, hsl(218, 41%, 35%) 15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%, transparent 100% ), radial-gradient( 1250px circle at 100% 100%, hsl(218, 41%, 45%) 15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%, transparent 100% );
            height: 200vh;
            padding-left: 70px;
            overflow-x: hidden;
            color: #fff;
        }

        @media (max-width: 991.98px) {
            body {
                height: 100%;
            }
        }

        .bg-theme {
            background-color: hsl(218, 41%, 25%);
        }

        .bg-glass {
            background: hsla(0, 0%, 100%, 0.15);
            backdrop-filter: blur(30px);
        }

        .text-muted {
            color: hsl(0, 0%, 80%) !important;
        }

        .text-success {
            color: hsl(144, 100%, 40.9%) !important;
        }

        .text-danger {
            color: hsl(350, 94.3%, 68.4%) !important;
        }

        .border-bottom {
            border-bottom: 1px solid hsl(0, 0%, 50%) !important;
        }

        .badge {
            padding: 5px 10px;
        }


        .progress {
            position: relative;
            height: 31px;
            background: hsl(218, 41%, 15%);
            background: -moz-linear-gradient(left, hsl(350, 94.3%, 68.4%) 0%, #70ffac 100%);
            background: -webkit-gradient(linear, left top, right top, color-stop(0%, hsl(350, 94.3%, 68.4%)), color-stop(100%, #70ffac));
            background: -webkit-linear-gradient(left, hsl(350, 94.3%, 68.4%) 0%, #70ffac 100%);
            background: -o-linear-gradient(left, hsl(350, 94.3%, 68.4%) 0%, #70ffac 100%);
            background: -ms-linear-gradient(left, hsl(350, 94.3%, 68.4%) 0%, #70ffac 100%);
            background: linear-gradient(to right,hsl(350, 94.3%, 68.4%) 0%, #70ffac 100%);
            filter: progid: DXImageTransform.Microsoft.gradient(startColorstr=hsl(350, 94.3%, 68.4%), endColorstr=#70ffac, GradientType=1);
        }

        .amount {
            position: absolute;
            top: 0;
            right: 0;
            height: 100%;
            transition: all 0.8s;
            background: hsl(218, 41%, 15%);
            width: 0;
        }

        .progress:before {
            content: attr(data-amount)"% Complete";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 10;
            text-align: center;
            line-height: 31px;
            color: #fff !important;
        }


        html * {
            font-size: 0.5em !important;
        }

        .c-scroller {
            overflow: hidden;
            height: 47vh
        }


        .c-scroller-content,
        .c-scroller:hover,
        .c-scroller:focus {
            overflow: auto;
        }

        .header {
            position: sticky;
            background: hsla(0, 0%, 100%, 0.15);
            backdrop-filter: blur(30px);
            top: 0;
        }
    </style>
    <script type="text/javascript">
        //動態加載js文件,js加載時一直用最新的
        //document.write('<script src="~/build/app.js?v=' + (new Date()).getTime() + '"><\/script>');



        var url = " <%=Page.ResolveClientUrl("~/build/app.js") %>";
        document.write('<script src="' + url + '? v =' + (new Date()).getTime() + '"><\/script>');




    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="UpdateTimer" Interval="300000" runat="server" OnTick="UpdateTimer_Tick" />
        <!-- Sidenav-->
        <uc1:LeftMenu ID="LeftMenu" runat="server"></uc1:LeftMenu>
        <!-- Sidenav-->
        <!-- Mainnav-->


        <!-- Main content -->
        <div class="container pt-3">
            <!-- Section Summary-->
            <section class="mb-3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="UpdateTimer" EventName="Tick" />
                    </Triggers>
                    <ContentTemplate>


                        <asp:Panel ID="pal_summary" CssClass="row gx-xl-5" runat="server">
                        </asp:Panel>

                    </ContentTemplate>

                </asp:UpdatePanel>

                <ajaxToolkit:UpdatePanelAnimationExtender ID="upae" runat="server" TargetControlID="UpdatePanel1">
                    <Animations>
                    <OnUpdated>
                        <FadeIn Duration="5" Fps="10" />
                    </OnUpdated>
    
                    </Animations>
                </ajaxToolkit:UpdatePanelAnimationExtender>
            </section>
            <!-- Section Summary-->

            <!-- Section Table-->
            <section class="mb-3">
                <div class="row gx-lg-5">
                    <div class="col-lg-6 col-md-12 mb-4 mb-lg-0 ">

                        <div class="table-responsive bg-glass shadow-4-strong rounded-6 c-scroller">
                            <asp:GridView ID="MainDataGrid" runat="server" AutoGenerateColumns="False" CssClass="table table-borderless table-hover align-middle mb-0  text-white " OnPreRender="MainDataGrid_PreRender" AllowCustomPaging="false" BorderWidth="0">
                                <Columns>
                                    <asp:TemplateField>

                                        <HeaderTemplate>
                                            <asp:Label ID="dg_hd_customerId" runat="server" Text='客戶' Width="80px"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="d-flex align-items-center">
                                                <img src='<%# DataBinder.Eval(Container, "DataItem.CustomerImg") %>' alt="" style="width: 45px; height: 45px" class="rounded-circle">
                                                <div class="ms-3">
                                                    <p class="fw-bolde text-white mb-1">
                                                        <asp:Label ID="dg_lab_CustomerName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CustomerName") %>'></asp:Label>
                                                    </p>
                                                    <p class="text-muted mb-0">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.CustomerEmail") %>'></asp:Label>
                                                    </p>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>

                                        <HeaderTemplate>
                                            <asp:Label ID="dg_hd_moduleIdProgress" runat="server" Text='在製完成' Width="80px"></asp:Label>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <a href='ModuleScheduleALT.aspx?dpl_overStatus=2&dpl_customer=<%#DataBinder.Eval(Container, "DataItem.CustomerId") %>' class="hover-overlay">
                                                <div class="progress bg-theme rounded-4" data-amount='<%# Convert.ToDouble(DataBinder.Eval(Container, "DataItem.FinishedPercent")) * 100 %>' style="height: 25px;">
                                                    <div class="amount" role="progressbar" aria-valuenow='<%# Convert.ToDouble(DataBinder.Eval(Container, "DataItem.FinishedPercent")) * 100 %>' aria-valuemin="0" aria-valuemax="100" style="width: <%# 100-Convert.ToDouble(DataBinder.Eval(Container, "DataItem.FinishedPercent")) * 100 %>%">
                                                    </div>
                                                </div>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>


                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 mb-4 mb-lg-0">
                        <div class="bg-glass shadow-4-strong rounded-6 h-100">
                            <div id="myCostChart" onload="createPieChar('myCostChart');" style="width: 100%; height: 100%; display: block;" class="chartjs-render-monitor"></div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Section Table-->

            <!-- Section: Visualization -->
            <section class="mb-3">
                <div class="row gx-lg-5">
                    <div class="col-lg-6 col-md-12 mb-4 mb-lg-0">
                        <!-- Card -->
                        <div class="bg-glass shadow-4-strong rounded-6 h-100">
                            <!-- Card header -->
                            <div class="p-4 border-bottom">
                                <div class="row align-items-center">
                                    <div class="col-6 mb-4 mb-md-0">
                                        <p class="text-muted mb-2">稼動</p>
                                        <p class="mb-0">
                                            <span class="h5 me-2">
                                                <asp:Label ID="total_capacity" runat="server"></asp:Label></span>
                                            <small class="<%=textDangerSuccess %> text-sm"><i class="fas <%=arrow %> fa-sm me-1"></i>
                                                <asp:Label ID="lab_compare" runat="server"></asp:Label></small>
                                        </p>
                                    </div>

                                    <div class="col-6 mb-4 mb-md-0 text-end">
                                        <a class="btn btn-outline-white btn-rounded" href="ScheduleListALT.aspx" role="button">詳情</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card header -->
                            <!-- Card body -->
                            <div class="p-4">
                                <div id="myChartx" onload="createBar('myChartx');" style="width: 100%; height: 200px; display: block;" class="chartjs-render-monitor"></div>
                            </div>
                            <!-- Card body -->
                        </div>
                        <!-- Card -->
                    </div>
                    <div class="col-lg-6 col-md-12 mb-4 mb-lg-0">
                        <!-- Card -->
                        <div class="bg-glass shadow-4-strong rounded-6 h-100">
                            <!-- Card header -->
                            <div class="p-4 border-bottom">
                                <div class="row align-items-center">
                                    <div class="col-6 mb-4 mb-md-0">
                                        <p class="text-muted mb-2">負荷</p>

                                    </div>

                                    <div class="col-6 mb-4 mb-md-0 text-end">
                                        <a class="btn btn-outline-white btn-rounded" href="MachineStatusListFinishedALT.aspx" role="button">詳情</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card header -->
                            <!-- Card body -->
                            <div class="p-4">
                                <div id="myBurdenCharty" onload="createBar('myBurdenCharty');" style="width: 100%; height: 200px; display: block;" class="chartjs-render-monitor"></div>
                            </div>
                            <!-- Card body -->
                        </div>
                        <!-- Card -->
                    </div>
                </div>
            </section>
            <!-- Section: Visualization -->

        </div>
        <!-- Main content -->

        <!-- Mainnav-->
        <!-- MDB -->
        <script type="text/javascript" src="MDB5/jspro/mdb.min.js"></script>
        <script type="text/javascript" src="MDB5/jspro/all.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript"></script>
        <!-- echarts -->
        <script type="text/javascript" src="MDB5/js/echarts.js"></script>

        <!-- jquery -->
        <script type="text/javascript" src="MDB5/js/jquery.min.js"></script>

        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>


        <script type="text/javascript">



            var maxVal = 100;//圆环极大值

            var textStyle = {
                "fontSize": 16,
                "fontWeight": "bold",
                "fontFamily": '华文细黑'
            }

            var itemStyle = {
                "normal": {
                    "label": {
                        "show": false
                    },
                    "labelLine": {
                        "show": false
                    },
                    "color": 'rgba(0,0,0,0)',
                    "borderColor": 'rgba(0,0,0,0)',
                    "borderWidth": 0
                },
                "emphasis": {
                    "color": 'rgba(0,0,0,0)',
                    "borderColor": 'rgba(0,0,0,0)',
                    "borderWidth": 0
                }
            };



            // 基于准备好的dom，初始化echarts实例




            $(function () {
                $('div[onload]').trigger('onload');
            });

            function createChar(charId, processName) {
                var NCBarChart = echarts.init(document.getElementById(charId));

                NCBarChart.clear();
                NCBarChart.showLoading({
                    text: '加載中。。。',
                    color: '#28a745',
                    textColor: '#000',
                    /* maskColor: 'rgba(196,174,173, 0.2)',*/
                    zlevel: 0,
                });


                var corePiedate = 0;

                $.ajax({
                    type: "post",
                    async: true,
                    url: "defaultmain.aspx/getPieChartsByProcess",
                    contentType: "application/json; charset=utf-8",
                    data: "{processId:'" + charId + "'}",
                    dataType: "json",
                    success: function (result) {
                        if (result.d == "" || isNaN(result.d)) {
                            NCBarChart.hideLoading();
                        }
                        if (result) {
                            var corePiedate = 0;

                            if (!isNaN(result.d))
                                corePiedate = eval('(' + result.d + ')');
                            //$("#lab_requir_" + charId).text(dataObj[0].Count);
                            //$("#lab_effective_" + charId).text(dataObj[0].Name);


                            /* Count1 = dataObj[0].Nums1;*/

                            var option = {
                                backgroundColor: '',//背景颜色
                                "title": {
                                    "text": processName,
                                    x: 'center',
                                    y: '80%',
                                    "textStyle": {
                                        "fontSize": 10,
                                        "color": 'rgba(255,255,255,0.7)'
                                    }
                                },
                                "tooltip": {
                                    "trigger": 'item',
                                    "formatter": "{a} : {d}%"
                                },

                                "series": [{
                                    "name": '负载',
                                    "center": ["50%", "50%"],
                                    "radius": ["35%", "40%"],
                                    "clockWise": false,
                                    "hoverAnimation": false,
                                    "type": "pie",
                                    "data": [{
                                        "value": corePiedate,
                                        "label": {
                                            "normal": {
                                                "show": true,
                                                "formatter": '{d}%',
                                                "textStyle": textStyle,
                                                "position": "center"
                                            }
                                        },
                                        "labelLine": {
                                            "show": false
                                        },
                                        "itemStyle": {
                                            "normal": {
                                                "color": "#5886f0",
                                                "borderColor": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                    offset: 0,
                                                    color: '#00a2ff'
                                                }, {
                                                    offset: 1,
                                                    color: '#70ffac'
                                                }]),
                                                "borderWidth": 5
                                            },
                                            "emphasis": {
                                                "color": "#5886f0",
                                                "borderColor": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                    offset: 0,
                                                    color: '#85b6b2'
                                                }, {
                                                    offset: 1,
                                                    color: '#6d4f8d'
                                                }]),
                                                "borderWidth": 5
                                            }
                                        }
                                    }, {
                                        "value": maxVal - corePiedate,
                                        "itemStyle": itemStyle
                                    }]
                                }, {
                                    "name": '负载',
                                    "center": ["50%", "50%"],
                                    "radius": ["50%", "53%"],
                                    "clockWise": false,
                                    "hoverAnimation": false,
                                    "type": "pie",
                                    "data": [{
                                        "value": corePiedate,
                                        "label": {
                                            "normal": {
                                                "show": false,
                                                "formatter": '',
                                                "textStyle": textStyle,
                                                "position": "center"
                                            }
                                        },
                                        "labelLine": {
                                            "show": false
                                        },
                                        "itemStyle": {
                                            "normal": {
                                                "color": "#5886f0",
                                                "borderColor": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                    offset: 0,
                                                    color: '#00a2ff'
                                                }, {
                                                    offset: 1,
                                                    color: '#70ffac'
                                                }]),
                                                "borderWidth": 2
                                            },
                                            "emphasis": {
                                                "color": "#5886f0",
                                                "borderColor": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                    offset: 0,
                                                    color: '#85b6b2'
                                                }, {
                                                    offset: 1,
                                                    color: '#6d4f8d'
                                                }]),
                                                "borderWidth": 2
                                            }
                                        }
                                    }, {
                                        "value": maxVal - corePiedate,
                                        "itemStyle": itemStyle
                                    }]
                                }]


                            };
                            NCBarChart.hideLoading();
                            NCBarChart.setOption(option);
                            //NCBarChart.resize();


                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    }
                });
            }

            function createPieChar(charId) {
                var NCBarChart = echarts.init(document.getElementById(charId));
                const container = document.querySelector('#' + charId);
                NCBarChart.clear();
                NCBarChart.showLoading({
                    text: '加載中。。。',
                    color: '#28a745',
                    textColor: '#000',
                    maskColor: 'rgba(255, 255, 255, 0.2)',
                    zlevel: 0,
                });


                var corePiedate = [];
                var processName = '';
                $.ajax({
                    type: "post",
                    async: true,
                    url: "defaultmain.aspx/getPieCostChartsBy",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        if (result.d == "") {
                            processBarChart.hideLoading();
                        }
                        if (result) {
                            var dataObj = eval('(' + result.d + ')');

                            $.each(dataObj, function (index, obj) {
                                /* Names.push(obj.Name);*/
                                /*corePiedate[index] = { value: obj.num[0], name: obj.Name };*/
                                corePiedate[index] = { value: obj.Num[0], name: obj.Name };

                            });
                            processName = dataObj[0].Name;

                            var option = {
                                title: {

                                    floating: false,
                                    text: '詳情',
                                    textStyle: {
                                        color: '#fff', // 文字颜色
                                        fontSize: 12, // 文字大小
                                        fontWeight: '500' // 文字粗细
                                    },
                                    right: 20,
                                    top: 20,
                                    link: 'ModuleCostALT.aspx',
                                    backgroundColor: 'transparent', // 背景色透明
                                    borderColor: '#fff', // 边框颜色
                                    borderWidth: 2, // 边框宽度
                                    borderRadius: 30, // 边框圆角
                                    padding: [10, 20] // 内边距


                                },
                                tooltip: {
                                    trigger: 'item'
                                },

                                legend: {
                                    type: 'scroll',
                                    orient: 'vertical',
                                    left: 5,
                                    top: 20,
                                    bottom: 20,
                                    textStyle: {
                                        "fontSize": 16,
                                        "color": 'rgba(255,255,255,0.7)'
                                    },
                                },


                                series: [
                                    {
                                        name: '生產時間',
                                        type: 'pie',
                                        center: ['50%', '55%'],
                                        data: corePiedate,
                                        emphasis: {
                                            itemStyle: {
                                                shadowBlur: 10,
                                                shadowOffsetX: 0,
                                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                                            },
                                        }
                                    },

                                ]




                            };

                            if (charId === 'NCModifyProcessChart') {
                                option = {
                                    title: {

                                        subtext: '百分比(%)',
                                        left: 'center'
                                    },
                                    tooltip: {
                                        trigger: 'item'
                                    },

                                    legend: {
                                        type: 'scroll',
                                        orient: 'vertical',
                                        left: 5,
                                        top: 20,
                                        bottom: 20,
                                    },
                                    toolbox: {
                                        show: true,
                                        orient: 'vertical',
                                        left: 'right',
                                        top: 'center',
                                        feature: {
                                            mark: { show: true },
                                            dataView: { show: true, readOnly: false },
                                            /* magicType: { show: true, type: ['line', 'bar', 'stack', 'tiled'] },*/
                                            restore: { show: true },
                                            saveAsImage: { show: true }
                                        }
                                    },

                                    series: [
                                        {
                                            name: '生產時間',
                                            type: 'pie',
                                            center: ['50%', '55%'],
                                            data: corePiedate,
                                            emphasis: {
                                                itemStyle: {
                                                    shadowBlur: 10,
                                                    shadowOffsetX: 0,
                                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                                },
                                            }
                                        },

                                    ]




                                };
                            }
                            NCBarChart.hideLoading();
                            NCBarChart.setOption(option);
                            NCBarChart.resize();

                            if (charId === 'NCModifyChart' && processName != 'N/A') {
                                showModal('myModal', processName, "ContentPlaceBelow");
                            }

                            const chart = echarts.init(container);

                            new ResizeObserver(() => NCBarChart.resize()).observe(container);
                            NCBarChart.on('click', params => {


                                alert("do test " + params.componentType + "|" + params.seriesName + "|" + params.name + charId);
                                if (charId === 'NCModifyChart') {
                                    showModal('myModal', params.name, "ContentPlaceBelow");
                                }
                            })

                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    }
                });
            }



            function createBar(charId) {
                var NCBarChart = echarts.init(document.getElementById(charId), 'dark');
                var url = "";
                var seriesName = "";
                if (charId == 'myChartx') {
                    url = "defaultmain.aspx/getBarChartsByProcess";
                    seriesName = "稼動";
                } else {
                    url = "defaultmain.aspx/getBurdenBarChartsByProcess";
                    seriesName = "負荷";
                }

                NCBarChart.clear();
                NCBarChart.showLoading({
                    text: '加載中。。。',
                    color: '#28a745',
                    textColor: '#000',
                    /* maskColor: 'rgba(196,174,173, 0.2)',*/
                    zlevel: 0,
                });


                var Count0 = [];

                var Names = [];

                var labelOption = {
                    show: false,
                    //position: config.position,
                    //distance: config.distance,
                    //align: config.align,
                    //verticalAlign: config.verticalAlign,
                    //rotate: config.rotate,
                    //formatter: '{c}  {name|{a}}',

                    fontSize: 10,
                    rich: {
                        name: {
                            textBorderColor: '#fff',
                            fontWeight: 'bold'
                        }
                    }
                };

                $.ajax({
                    type: "post",
                    async: true,
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    data: "{machineId:'" + charId + "'}",
                    dataType: "json",
                    success: function (result) {
                        if (result.d == "") {
                            processBarChart.hideLoading();
                        }
                        if (result) {
                            var dataObj = eval('(' + result.d + ')');

                            $.each(dataObj, function (index, obj) {
                                Names.push(obj.Name);
                                Count0.push(obj.Num[0]);

                            });

                            var option = {
                                backgroundColor: '',//背景颜色
                                "title": {
                                    "text": '',
                                    x: 'center',
                                    y: '100%',
                                    "textStyle": {
                                        "fontSize": 16,
                                        "color": 'rgba(255,255,255,0.7)'
                                    }
                                },
                                "tooltip": {
                                    "trigger": 'item',
                                    "formatter": "{a} : {c}%"
                                },
                                grid: {
                                    left: '3%',
                                    right: '4%',
                                    bottom: '3%',
                                    containLabel: true
                                },
                                xAxis: [{
                                    type: 'category',
                                    data: Names,
                                    axisLabel: {
                                        inside: false,
                                        textStyle: {
                                            "fontSize": 16,
                                            "fontWeight": "bold",
                                            "fontFamily": '华文细黑'

                                        }
                                    },

                                    splitLine: {
                                        show: false
                                    },
                                    axisTick: {
                                        alignWithLabel: true
                                    },
                                    axisLabel: {
                                        rotate: 0
                                    }
                                }],
                                yAxis: [{
                                    type: 'value',
                                    splitLine: {
                                        show: false
                                    },
                                    splitArea: {
                                        show: false
                                    },
                                }],
                                series: [
                                    {
                                        name: seriesName,
                                        type: 'bar',
                                        stack: 'A',
                                        barGap: 0,

                                        color: '#5886f0',
                                        data: Count0,
                                        "itemStyle": {
                                            "normal": {
                                                barBorderRadius: [6, 6, 0, 0],
                                                /* "color": "#5886f0",*/
                                                "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                    offset: 0,
                                                    color: '#00a2ff'
                                                }, {
                                                    offset: 1,
                                                    color: '#70ffac'
                                                }]),

                                            },
                                            "emphasis": {
                                                /* "color": "#5886f0",*/
                                                barBorderRadius: [6, 6, 0, 0],
                                                "color": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                                    offset: 0,
                                                    color: '#85b6b2'
                                                }, {
                                                    offset: 1,
                                                    color: '#6d4f8d'
                                                }]),

                                            }
                                        }

                                    }
                                ]


                            };
                            NCBarChart.hideLoading();
                            NCBarChart.setOption(option);
                            //NCBarChart.resize();


                        }

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                    }
                });
            }


        </script>
        <!-- Sidenav -->
        <script>
            //$(document).ready(function () {
            //    var dataval = parseInt($('.progress').attr("data-amount"));
            //    if (dataval < 100) {
            //        $('.progress .amount').css("width", 100 - dataval + "%");
            //    }



            //});
            /* function click_handler1() { alert("slim-toggler"); }*/


            /* document.getElementById("slim-toggler").addEventListener("click", click_handler1);*/

            /*document.getElementById("slim-toggler").addEventListener("click", click_handler1);*/

            //Initialize it with JS to make it instantly visible
            /*const slimInstance = mdb.Sidenav.getInstance(document.getElementById('sidenav-4'));*/
            //mdb.Sidenav.
            //const slimInstance = new mdb.Sidenav(
            //    document.getElementById("sidenav-4")
            //);
            //slimInstance.show();

            document.getElementById("slim-toggler").addEventListener("click", () => {
                if ($('#sidebar').css('width') == '70px') {
                    $('#sidebar').css('width', '200px');
                    $('#sidebar span').css('display', 'unset');
                } else {
                    $('#sidebar').css('width', '70px');
                    $('#sidebar span').css('display', 'none');
                }

                /*slimInstance.toggleSlim();*/
            });
        </script>

    </form>
</body>
</html>
