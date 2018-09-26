<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>华通桥涵管理系统</title>

    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/font-awesome.min.css">

    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-skins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/font.css">
    <!-- SmartAdmin RTL Support  -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-rtl.min.css">

    <!-- We recommend you use "your_style.css" to override SmartAdmin
         specific styles this will also ensure you retrain your customization with each SmartAdmin update.
    <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->

    <!-- FAVICONS -->
    <link rel="shortcut icon" href="../img/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">


    <!-- Specifying a Webpage Icon for Web Clip
         Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="../img/splash/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="../img/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="../img/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="../img/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="../img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="../img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

    <style>
        .t1 td {
            background-color: rgb(246, 246, 246);
        }

        .t2 td {
            background-color: #FFFFFF;
        }

        .t3 td {
            background-color: rgb(246, 246, 246);
        }

        .t4 td {
            background-color: #FFFFFF;
        }

        .t5 td {
            background-color: rgb(246, 246, 246);
        }

        .t6 td {
            background-color: #FFFFFF;
        }

        .t7 td {
            background-color: rgb(246, 246, 246);
        }

        .t8 td {
            background-color: #FFFFFF;
        }

        .t9 td {
            background-color: #FFFFFF;
        }

        .t10 td {
            background-color: #FFFFFF;
        }

        td:HOVER {
            background-color: #ccc;
        }

        table {
            margin-right: 0.3%;
            border: 0px;
            table-layout: fixed;
        }

        td {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        th {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

    </style>


</head>
<body class="">
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<!-- #MAIN PANEL -->
<div id="main" role="main">

    <!-- RIBBON -->
    <div id="ribbon">

				<span class="ribbon-button-alignment"> 
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"
                          rel="tooltip" data-placement="bottom"
                          data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存" data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>基础数据</li>
            <li>结构</li>
            <li>部件类型</li>
        </ol>
        <!-- end breadcrumb -->

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">

        <section id="widget-grid no-padding">
            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <!-- Widget ID (each widget will need unique ID)-->
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"
                     data-widget-editbutton="false"
                     data-widget-togglebutton="false"
                     data-widget-deletebutton="false"
                     data-widget-fullscreenbutton="false"
                     data-widget-custombutton="false">

                    <header>
                        <span class="widget-icon"> <i class="fa fa-eye"></i> </span>
                        <h2>部件类型</h2>

                    </header>

                    <!-- widget div-->
                    <div>

                        <!-- widget content -->
                        <div class="widget-body">

                            <div class="widget-body-toolbar bg-color-white">
                                <div class="col-sm-6 col-md-6 text-align-left">

                                    <a href="dicComType.jsp" class="btn btn-default">11评定</a>
                                    <a href="dicComType2.jsp" class="btn btn-default">04评定</a>
                                    <a href="dicComType3.jsp" class="btn btn-default disabled">检查记录</a>

                                </div>
                                <div class="col-sm-6 col-md-6 text-align-right">
                                    <button class="btn btn-primary" onclick="newData()" disabled>
                                        增加
                                    </button>
                                    <button class="btn btn-primary" onclick="editData()" disabled>
                                        修改
                                    </button>
                                    <button class="btn btn-primary" onclick="delData()" disabled>
                                        删除
                                    </button>
                                </div>
                            </div>
                            <table class="table table-striped table-bordered table-hover pull-left" style="width: 16%"
                                   name="桥梁检查记录">
                                <thead>
                                <tr>
                                    <th colspan="2">桥梁检查记录</th>
                                </tr>
                                <tr>
                                    <th style="width: 4%">编号</th>
                                    <th style="width: 12%">名称</th>
                                </tr>
                                </thead>
                                <tbody class="t9">
                                </tbody>
                            </table>
                            <table class="table table-striped table-bordered table-hover pull-left" style="width: 16%;"
                                   name="通道检查记录">
                                <thead>
                                <tr>
                                    <th colspan="2">
                                        <div>通道检查记录</div>
                                    </th>
                                </tr>
                                <tr>
                                    <th style="width: 4%">编号</th>
                                    <th style="width: 12%">名称</th>
                                </tr>
                                </thead>
                                <tbody class="t7">
                                </tbody>
                            </table>
                            <table class="table table-striped table-bordered table-hover pull-left" style="width: 16%"
                                   name="涵洞检查记录">
                                <thead>
                                <tr>
                                    <th colspan="2">涵洞检查记录</th>
                                </tr>
                                <tr>
                                    <th style="width: 4%">编号</th>
                                    <th style="width: 12%">名称</th>
                                </tr>
                                </thead>
                                <tbody class="t8">
                                </tbody>
                            </table>
                        </div>
                        <!-- end widget content -->

                    </div>
                    <!-- end widget div -->

                </div>
                <!-- end widget -->

            </article>

            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-bottom: 30px"></article>
        </section>
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<div id="dig" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>部件类型编号</label>
                <input class="form-control" id="component_id" value="" placeholder="部件类型编号" type="text">
            </div>
            <div class="form-group">
                <label>部件类型名称</label>
                <input class="form-control" id="component_name" value="" placeholder="部件类型名称" type="text">
            </div>
            <div class="form-group" id="sp">
                <label>标准</label>
                <select class="form-control input-sm" id="specification">
                    <option>通道检查记录</option>
                    <option>涵洞检查记录</option>
                    <option>桥梁检查记录</option>
                </select>
            </div>
        </fieldset>
    </form>
</div>


<%@ include file="footer.jsp" %>

<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }' src="../js/plugin/pace/pace.min.js"></script>

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="../js/libs/jquery-2.1.1.min.js"></script>
<script src="../js/libs/jquery-ui-1.10.3.min.js"></script>

<!-- IMPORTANT: APP CONFIG -->
<script src="../js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script>

<!-- BOOTSTRAP JS -->
<script src="../js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="../js/notification/SmartNotification.min.js"></script>

<!-- JARVIS WIDGETS -->
<script src="../js/smartwidgets/jarvis.widget.min.js"></script>

<!-- EASY PIE CHARTS -->
<script src="../js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

<!-- SPARKLINES -->
<script src="../js/plugin/sparkline/jquery.sparkline.min.js"></script>

<!-- JQUERY VALIDATE -->
<script src="../js/plugin/jquery-validate/jquery.validate.min.js"></script>

<!-- JQUERY MASKED INPUT -->
<script src="../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

<!-- JQUERY SELECT2 INPUT -->
<script src="../js/plugin/select2/select2.min.js"></script>

<!-- JQUERY UI + Bootstrap Slider -->
<script src="../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

<!-- browser msie issue fix -->
<script src="../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

<!-- FastClick: For mobile devices -->
<script src="../js/plugin/fastclick/fastclick.min.js"></script>

<!--[if IE 8]>

<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

<![endif]-->

<!-- Demo purpose only -->

<!-- MAIN APP JS FILE -->
<script src="../js/app.min.js"></script>

<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin -->
<script src="../js/speech/voicecommand.min.js"></script>

<!-- SmartChat UI : plugin -->
<script src="../js/smart-chat-ui/smart.chat.ui.min.js"></script>
<script src="../js/smart-chat-ui/smart.chat.manager.min.js"></script>

<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<!-- PAGE RELATED PLUGIN(S) -->

<script type="text/javascript">
    $(document).ready(function () {
        pageSetUp();

        $('#dig').dialog({
            autoOpen: false,
            width: 400,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop'
        });
        $('#dig').prop('hidden', false);
        initData();
    });


    var dom = undefined;
    $('table').delegate('td', 'click', function (e) {
        if (dom != undefined) {
            dom.children('td').each(function () {
                $(this).css('background', '');
            });
        }
        dom = $(this).closest('tr');
        dom.children('td').each(function () {
            $(this).css('background', '#ccc');
            dd[$(this).attr('name')] = $(this).html();
        });
        dd.specification = $(this).parents('table').attr('name');
    });


    var dd = {
        component_id: undefined,
        component_name: undefined,
        specification: undefined
    }


    /* 	var nn={
     "t1":"2011评定梁式桥",
     "t2":"2011评定板、肋、箱形、双曲拱桥",
     "t3":"2011评定刚、桁架拱桥",
     "t4":"2011评定钢混组合拱桥",
     "t5":"2011评定悬索桥",
     "t6":"2011评定斜拉桥",
     "t7":"通道检查记录",
     "t8":"涵洞检查记录",
     "t9":"桥梁检查记录",
     "t10":"2004评定"
     } */

    var mm = {
        "2011评定梁式桥": "t1",
        "2011评定板、肋、箱形、双曲拱桥": "t2",
        "2011评定刚、桁架拱桥": "t3",
        "2011评定钢混组合拱桥": "t4",
        "2011评定悬索桥": "t5",
        "2011评定斜拉桥": "t6",
        "通道检查记录": "t7",
        "涵洞检查记录": "t8",
        "桥梁检查记录": "t9",
        "2004评定": "t10"
    }

    function delData() {
        if (dom == undefined) {
            errMessage("请先选择一个数据！")
            return;
        }
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../DicComTypeServlet',
                    dataType: 'json',
                    data: {
                        type: "deleteComType",
                        component_id: dd.component_id
                    },
                    error: function (msg) {
                        errMessage("请求DicComTypeServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    errMessage("删除失败");
                                    break;
                                case 2:
                                    errMessage("服务器错误");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                            //successMessage("删除成功");
                            dom.remove();
                            dom = undefined;
                        }
                    }
                });
            }
        });
    }


    function initData() {
        $.ajax({
            type: 'POST',
            url: '../DicComTypeServlet',
            dataType: 'json',
            data: {
                type: "initComType"
            },
            error: function (msg) {
                errMessage("请求DicComTypeServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("没有数据");
                            break;
                        case 2:
                            errMessage("服务器错误");
                            break;
                        case 3:
                            errMessage("名称重复");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        $("table[name=" + nn[data[i].specification] + "]").children('tbody').append(formate(data[i]));
                    }
                }
            }
        });
    }


    function editData() {
        if (dom == undefined) {
            errMessage("请先选择一个表格！")
            return;
        }
        $('#component_id').val(dd.component_id);
        $('#component_name').val(dd.component_name);
        $('#sp').prop('hidden', 'hidden');
        $('#component_id').prop('readonly', 'readonly');
        $('#dig').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            component_id: $('#component_id').val(),
                            component_name: $('#component_name').val(),
                            specification: dd.specification
                        }
                        if (info.component_id == "" || info.component_name == "") {
                            errMessage("不可为空");
                        } else {
                            $.ajax({
                                type: 'POST',
                                url: '../DicComTypeServlet',
                                dataType: 'json',
                                data: {
                                    type: "editComType",
                                    info: JSON.stringify(info)
                                },
                                error: function (msg) {
                                    errMessage("请求DicComTypeServlet失败");
                                },
                                success: function (json) {
                                    if (json.success == "fail") {
                                        switch (json.error) {
                                            case 1:
                                                errMessage("保存失败");
                                                break;
                                            case 2:
                                                errMessage("服务器错误");
                                                break;
                                            case 3:
                                                errMessage("名称重复");
                                                break;
                                            default:
                                                break;
                                        }
                                    } else {
                                        //successMessage("修改成功");
                                        dom.replaceWith(formate(info));
                                        $('#dig').dialog("close");
                                    }
                                }
                            });
                        }
                    }
                },
                {
                    html: "<i class='fa fa-times'></i>&nbsp; 取消",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]
        });
        $('#dig').dialog('open');
    }


    function newData() {
        $('#component_id').val("");
        $('#component_name').val("");
        $('#sp').prop('hidden', false);
        $('#component_id').prop('readonly', false);
        $('#dig').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            component_id: $('#component_id').val(),
                            component_name: $('#component_name').val(),
                            specification: $('#specification').val()
                        }
                        if (info.component_id == "" || info.component_name == "") {
                            errMessage("不可为空");
                        } else {
                            $.ajax({
                                type: 'POST',
                                url: '../DicComTypeServlet',
                                dataType: 'json',
                                data: {
                                    type: "newComType",
                                    info: JSON.stringify(info)
                                },
                                error: function (msg) {
                                    errMessage("请求DicComTypeServlet失败");
                                },
                                success: function (json) {
                                    if (json.success == "fail") {
                                        switch (json.error) {
                                            case 1:
                                                errMessage("保存失败");
                                                break;
                                            case 2:
                                                errMessage("服务器错误");
                                                break;
                                            case 3:
                                                errMessage("名称或编号重复");
                                                break;
                                            default:
                                                break;
                                        }
                                    } else {
                                        //successMessage("保存成功");
                                        $("table[name=" + info.specification + "]").children('tbody').append(formate(info));
                                        $('#dig').dialog("close");
                                    }
                                }
                            });
                        }
                    }
                },
                {
                    html: "<i class='fa fa-trash-o'></i>&nbsp; 重置",
                    "class": "btn btn-default",
                    click: function () {
                        $("#component_id").val("");
                        $("#component_name").val("");
                    }
                },
                {
                    html: "<i class='fa fa-times'></i>&nbsp; 取消",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]
        });
        $('#dig').dialog('open');


    }


    function formate(d) {
        return "<tr><td name='component_id'>" + d.component_id + "</td><td name='component_name'>" + d.component_name + "</td></tr>"
    }


    var nn = {
        "2011评定梁式桥": "2011评定梁式桥",
        "2011评定板拱桥,2011评定肋拱桥,2011评定箱形拱桥,2011评定双曲拱桥": "2011评定板、肋、箱形、双曲拱桥",
        "2011评定刚架拱桥,2011评定桁架拱桥": "2011评定刚、桁架拱桥",
        "2011评定钢混组合拱桥": "2011评定钢混组合拱桥",
        "2011评定悬索桥": "2011评定悬索桥",
        "2011评定斜拉桥": "2011评定斜拉桥",
        "通道检查记录": "通道检查记录",
        "涵洞检查记录": "涵洞检查记录",
        "桥梁检查记录": "桥梁检查记录",
        "2004评定": "2004评定"
    }


    function errMessage(info) {
        $.smallBox({
            title: "处理信息",
            content: "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 3000
        });
    }

    function successMessage(info) {
        $.smallBox({
            title: "处理信息",
            content: "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
            color: "#659265",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 3000
        });
    }


    function releaseAdmin() {//管理员
        $('.widget-body-toolbar button').prop('disabled', false);
    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
        $('.widget-body-toolbar button').prop('disabled', false);
		}
	
	}
</script>


</body>
</html>