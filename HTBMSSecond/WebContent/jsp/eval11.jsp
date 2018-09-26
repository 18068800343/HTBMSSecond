<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.alibaba.fastjson.JSON" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>华通桥涵管理系统</title>

    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/font-awesome.min.css">

    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/smartadmin-skins.min.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/font.css">
    <!-- SmartAdmin RTL Support  -->
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/smartadmin-rtl.min.css">

    <!-- We recommend you use "your_style.css" to override SmartAdmin
                 specific styles this will also ensure you retrain your customization with each SmartAdmin update.
            <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->

    <!-- FAVICONS -->
    <link rel="shortcut icon" href="../img/favicon/favicon.ico"
          type="image/x-icon">
    <link rel="icon" href="../img/favicon/favicon.ico" type="image/x-icon">


    <!-- Specifying a Webpage Icon for Web Clip
                 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon"
          href="../img/splash/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76"
          href="../img/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120"
          href="../img/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152"
          href="../img/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image"
          href="../img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image"
          href="../img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="../img/splash/iphone.png"
          media="screen and (max-device-width: 320px)">
    <style>
        .treess:hover {
            background-color: #ccc;
            cursor: pointer;
        }

        #evaRes th, td {
            text-align: center;
        }

        .loading {
            width: 220px;
            height: 56px;
            position: fixed;
            top: 50%;
            left: 50%;
            line-height: 56px;
            color: #fff;
            padding-left: 60px;
            font-size: 15px;
            background: #000 url(../img/loader.gif) no-repeat 10px 50%;
            z-index: 9999;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            border-radius: 20px;
            filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
        }

        .cover {
            position: fixed;
            top: 0px;
            right: 0px;
            bottom: 0px;
            filter: alpha(opacity=60);
            background-color: #E2E2E2;
            z-index: 8888;
            left: 0px;
            display: none;
            opacity: 0.6;
            -moz-opacity: 0.5;
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
			<span class="ribbon-button-alignment"> <span id="refresh"
                                                         class="btn btn-ribbon" data-action="resetWidgets"
                                                         data-title="refresh" rel="tooltip" data-placement="bottom"
                                                         data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
                                                         data-html="true"> <i class="fa fa-refresh"></i>
			</span>
			</span>
        <ol class="breadcrumb">
            <li>检查评定</li>
            <li>评定</li>
            <li>11评定</li>
        </ol>
        <!-- end breadcrumb -->
    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">
        <section id="widget-grid">
            <div class="row">

                <%@include file="currentStruct.jsp" %>

                <!-- SINGLE GRID -->
                <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
								<span class="widget-icon"> <i class="fa fa-table"></i>
								</span>
                            <h2>11评定</h2>

                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox">
                                <!-- This area used as dropdown edit box -->

                            </div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding" id="widget-body">
                                <div class="widget-body-toolbar bg-color-white">


                                    <div class="row">

                                        <div class="col-sm-12 col-md-12">
                                            <div class="pull-left col-xs-3">
                                                <input class="form-control" id="searchData" value=""
                                                       placeholder="搜索" type="text">
                                            </div>
                                            <a class="btn btn-primary disabled pull-right"
                                               onclick="overEval()"> 完成本桥评定 </a> <a
                                                class="btn btn-default pull-right"
                                                style="display: none; margin-right: 5px;"
                                                onclick="showScore()">清洁、小修</a> <a
                                                class="btn btn-default pull-right"
                                                style="display: none; margin-right: 5px;"
                                                onclick="evaRes();">结果统计</a>
                                        </div>

                                    </div>


                                </div>

                                <table id="evalGrid"
                                       class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>方向</th>
                                        <th>跨号</th>
                                        <th>分部结构</th>
                                        <th>部件类型</th>
                                        <th>构件类型</th>
                                        <th>构件名称</th>
                                        <th>病害</th>
                                        <th>评定分数</th>
                                        <th>评定</th>
                                    </tr>
                                    </thead>
                                    <tbody id="cttt">

                                    </tbody>
                                </table>
                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

                    </div>
                    <!-- end widget -->

                </article>
                <!-- END GRID -->


            </div>
        </section>
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<%@ include file="footer.jsp" %>


<div id="eva" hidden="hidden"></div>

<div id="defect" hidden="hidden"></div>

<div id="score" hidden="hidden">
    <div class="form-inline form-group">
        <label>清洁状况评分</label><i class="text-danger">*</i> <input
            id="score_clean" class="form-control" type="number">
    </div>
    <div class="form-inline form-group">
        <label>小修保养评分</label><i class="text-danger">*</i> <input
            id="score_fix" class="form-control" type="number">
    </div>
</div>

<div id="lookImg" class="row" hidden="hidden" style="min-width: 500px">
    <div class="col-xs-12">
        <h5></h5>
        <div id="lookImg_area" class="col-lg-12"
             style="padding: 10px 20px 10px 20px; text-align: center;"></div>
    </div>
</div>

<div id="evaRes" hidden="hidden">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th rowspan="2"
                style="text-align: center; vertical-align: middle !important;">桥型
            </th>
            <th rowspan="2"
                style="text-align: center; vertical-align: middle !important;">项目
            </th>
            <th rowspan="2"
                style="text-align: center; vertical-align: middle !important;">权重（%）
            </th>
            <th class="part" colspan="2"
                style="text-align: center; vertical-align: middle !important;">技术状况评分
            </th>
            <th class="whole" colspan="2"
                style="text-align: center; vertical-align: middle !important;">技术状况评分
            </th>
        </tr>
        <tr>
            <th class="part">上行</th>
            <th class="part">下行</th>
            <th class="whole">无</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

</div>
<div id="cover" class="cover">
    <div id="loading" class="loading">处理中......</div>
</div>
<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }'
        src="../js/plugin/pace/pace.min.js"></script>

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

<!-- PAGE RELATED PLUGIN(S) -->

<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
<script src="../js/myTool.js"></script>
<script type="text/javascript">
    var info =
    <%=JSON.toJSONString(oc)%>
    var er_no;
    var audit_state;
    /***********************************表格的初始化*********************************************************************************/
    $(document).ready(function () {
        pageSetUp();

        if (info == null) {
            errMessage("当前没有设置结构物");
        } else if (info.mode != 'bridge') {
            errMessage("该类结构物不参与评定");
        } else if (info.chk_id == undefined) {
            errMessage("您好，该结构物下没有正在进行中的项目！");
        } else {
            initTable();
        }

    });

    /***********************************new********************************************************************************/

    var table = $('#evalGrid')
        .DataTable(
            {
                "deferRender": true,
                "processing": true,
                "sDom": "t"
                + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                "ajax": null,
                "bDestroy": true,
                "iDisplayLength": 10,
                "oLanguage": {
                    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
                },
                "columns": [
                    {
                        "data": "direction"
                    },
                    {
                        "data": "span_no"
                    },
                    {
                        "data": "distr_name"
                    },
                    {
                        "data": "component_name"
                    },
                    {
                        "data": "member_type"
                    },
                    {
                        "data": "member_no"
                    },
                    {
                        "data": null,
                        "defaultContent": "<a style='cursor: pointer;' onclick='lookDefect(this)'>查看</a>"
                    },
                    {
                        "data": "state"
                    },
                    {
                        "orderable": false,
                        "data": null,
                        "defaultContent": "<button class='eva btn btn-warning btn-xs'><i class='glyphicon glyphicon-book'></i></button>"
                    },],
                "columnDefs": [{
                    "targets": 7,
                    "searchable": false,
                    "render": function (data, type, full) {
                        if (full.audit_state == "2") {
                        	return "<span class='label label-success state'>"+Number(full.calcu_value).toFixed(2)+"</span>";
                        }
                        if (data == "0") {
                            return "<span class='label label-danger state'>未评定</span>";
                        } else {
                        	return "<span class='label label-success state'>"+Number(full.calcu_value).toFixed(2)+"</span>";
                        }
                    }
                }],
                "order": [[0, 'asc']],
                "oLanguage": { //国际化配置
                    "sProcessing": "正在获取数据，请稍后...",
                    "sLengthMenu": "显示 _MENU_ 条",
                    "sZeroRecords": "查询不到相关数据",
                    "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
                    "sInfoEmpty": "记录数为0",
                    "sInfoFiltered": "(全部记录数 _MAX_ 条)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "第一页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
                        "sLast": "最后一页"
                    }
                }
            });

    function showScore() {
        getScore();

        var buttons = [{
            html: "确定",
            "class": "btn btn-default",
            click: function () {
                $(this).dialog("close");
            }
        }];
        if (audit_state != 2) {
            buttons.unshift({
                html: "保存",
                "class": "btn btn-default",
                click: function () {
                    setScore();
                }
            });
        }
        $('#score').dialog({
            buttons: buttons
        });
        $('#score').dialog('open');
    }
    function setScore() {
        var score_clean = $('#score_clean').val();
        var score_fix = $('#score_fix').val();
        /*
        if (score_clean == "" || score_fix == "") {
            errMessage("必填项请填满");
            return;
        }*/
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "setScore",
                score_clean: score_clean,
                score_fix: score_fix
            },
            error: function (msg) {
                errMessage("请求Eval11Servlet失败");
            },
            success: function (json) {
                console.log(json);
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("出错");
                            break;
                        case 2:
                            errMessage("服务器错误！");
                            break;
                        case 3:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    successMessage("保存成功");
                    $('#score').dialog('close');
                }
            }
        });
    }

    function getScore() {
        showMask();
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "getScore"
            },
            error: function (msg) {
                errMessage("请求Eval11Servlet失败");
            },
            success: function (json) {
                hidMask();
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("出错");
                            break;
                        case 2:
                            errMessage("服务器错误！");
                            break;
                        case 3:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    hidMask();
                    console.log(json);
                    $('#score_clean').val(json.obj.score_clean);
                    $('#score_fix').val(json.obj.score_fix);
                }
            }
        });
    }

    function lookDefect(d) {
        tr = $(d).closest('tr');
        var data = table.row(tr).data();
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "lookDefect",
                mbr_chk_id: data.mbr_chk_id
            },
            error: function (msg) {
                errMessage("请求Eval11Servlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("该构件下未添加病害");
                            break;
                        case 2:
                            errMessage("服务器错误！");
                            break;
                        case 3:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                	console.log(json.obj);
                    $('#defect').empty();
                    $('#defect').append(format(json.obj));
                    $('#defect').dialog('open');
                }
            }
        });
    }

    /* function lookImg(d) {
     var path = $(d).attr('data-src');
     if (path == "" || path == undefined) {
     errMessage("暂无图片");
     return;
     }
     $('#lookImg img').prop('src',
     encodeURI("../ImageDownLoadServer?path=" + path + ""));
     $('#lookImg h5').html($(d).attr('data-memo'));
     $('#lookImg').dialog('open');
     } */
    function lookImg(d) {

        var serial = $(d).attr('data-serial');
        var photos = new Array();
        $.ajax({
            type: 'POST',
            url: '../CheckSpanServlet',
            dataType: 'json',
            async: false,
            data: {
                type: "lookImgBySerial",
                serial: serial
            },
            error: function (msg) {
                errMessage("请求CheckSpanServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    errMessage("出错！");
                } else {
                    photos = json.obj;
                    console.log(photos);
                }
            }
        });

        /* if(path==""||path==undefined){
         errMessage("暂无图片");
         return;
         } */
        $('#lookImg_area').empty();
        for (var i = 0; i < photos.length; i++) {
            var dom = $('<div class="photo thumbnail col-lg-12" >'
                + '<div style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50% ;">'
                + '<img class="load" src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">'
                + '</div>'
                + '<img style="height: 200px" alt="" src="" class="img" onload="$(this).closest(\'.photo\').find(\'.load\').hide();" >'
                + '<label class="photo_name"></label>&nbsp&nbsp<a class="download btn btn-default btn-xs" href="" >下载图片</a>'
                + '<input type="text" class="photo_path" style="display: none;">'
                + '<input type="text" class="photo_id" style="display: none;">'
                + '</div>');
            dom.find('.img').prop(
                'src',
                encodeURI('../ImageDownLoadServer?path='
                    + photos[i].photo_path + '&' + Math.random()));
            dom.find('.download').prop(
                'href',
                encodeURI('../ImageDownLoadServer?path='
                    + photos[i].photo_path + '&' + Math.random()));

            dom.find('.photo_path').val(photos[i].photo_path);
            dom.find('.photo_name').html(photos[i].photo_name);
            dom.find('.photo_id').val(photos[i].photo_id);
            $('#lookImg_area').append(dom);

        }

        $('#lookImg').dialog('open');
    }

    function formatRepair(d) {
        if (d == "0") {
            return "<button class='rep label label-danger'>未修复</button>";
        } else {
            return "<button class='rep label label-success'>已修复</button>";
        }
    }

    function formatDevelop(d) {
    	if (d == "0") {
            return "<button class='label label-success' " + control + ">未发展</button>";
        } else if (d == "1") {
            return "<button class='label label-danger' " + control + ">已发展</button>";
        } else {
            return "<button class='label label-info' " + control + ">新增</button>";
        }
    }

    function format(d) {
        var html = "";
        if (d != undefined) {
            for (var i = 0; i < d.length; i++) {
                var defect_location_desc = d[i].defect_location_desc;
                defect_location_desc = defect_location_desc.replace(/\^2/g,
                    '<sup>2</sup>');
                defect_location_desc = defect_location_desc.replace(/\^3/g,
                    '<sup>3</sup>');
                var defect_count = d[i].defect_count;
                defect_count = defect_count.replace(/\^2/g, '<sup>2</sup>');
                defect_count = defect_count.replace(/\^3/g, '<sup>3</sup>');

                var photo = "<a style='cursor:pointer'  data-memo='"
                    + d[i].defect_photo_memo + "' data-serial='"
                    + d[i].defect_serial
                    + "' onclick='lookImg(this)'>查看</a>";
				var serial = d[i].defect_serial;
                var photos = new Array();
                $.ajax({
                    type: 'POST',
                    url: '../CheckSpanDailyServlet',
                    dataType: 'json',
                    async: false,
                    data: {
                        type: "lookImgBySerial",
                        serial: serial
                    },
                    error: function (msg) {
                        errMessage("请求CheckSpanDailyServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            errMessage("出错！");
                        } else {
                            photos = json.obj;
                        }
                    }
                });
                console.info(photos.length);
                if (photos.length == 0) {
                    photo = "<a style='color: red;' data-src=''>无图</a>"
                }
                html = html + "<tr><td hidden='hidden'>"
                    + d[i].defect_serial + "</td><td>"
                    + d[i].defect_name + "</td><td>"
                    + defect_location_desc + "</td><td>" + defect_count
                    + "</td><td>" + d[i].defect_attr + "</td><td>"
                    + photo + "</td><td>"
                    + formatRepair(d[i].repair_state) + "</td><td>"
                    + formatDevelop(d[i].develop_state) + "</td><td>"
                    + d[i].chk_defect_memo + "</td></tr>";
            }
        }

        return '<div style="margin:10px"><table class="table table-striped table-bordered table-hover table-condensed text-align-center">'
            + "<thead><tr><th> 病害名称</th><th> 缺损位置</th><th>缺损状况</th><th>附加信息</th><th style='width: 50px;'>照片</th><th style='width: 50px;'>修复状态</th><th style='width: 50px;'>发展状态</th><th> 病害备注</th></tr></thead><tbody>"
            + html + '</tbody></table></div>';
    }

    function overEval() {
        var data = table.data();
        for (var i = 0; i < data.length; i++) {
            if (data[i].state == "0") {
                errMessage("请先完成所有记录的评定");
                return;
            }
        }
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "overEval"
            },
            error: function (msg) {
                errMessage("请求Eval11Servlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("失败");
                            break;
                        case 2:
                            errMessage("服务器错误！");
                            break;
                        case 3:
                            errMessage("出错！");
                            break;
                        case 4:
                            errMessage("请完成清洁、小修评分部分");
                            break;
                        default:
                            break;
                    }
                } else {
                    successMessage('评定完成');
                    forceEval();
                }
            }
        });

    }

    function initTable() {
        myTool.mask.show('读取中...');
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "initTable"
            },
            error: function (msg) {
                errMessage("请求Eval11Servlet失败");
                $('#evalGrid').dataTable().fnClearTable();
                myTool.mask.hide();
            },
            success: function (json) {
            	console.log(json);
                $('#evalGrid').dataTable().fnClearTable();
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("没有需要评定的构件");
                            break;
                        case 2:
                            errMessage("服务器错误！");
                            break;
                        case 3:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    $('.widget-body-toolbar a').eq(1).show();
                    var data = json.obj.ll;
                    er_no = json.obj.er_no;
                    audit_state = json.obj.audit_state;
                    table.rows.add(data).draw(false);
                    if (audit_state == "2") {
                        control = false;
                        $('.widget-body-toolbar a').eq(0).addClass(
                            'disabled');
                        $('.widget-body-toolbar a').eq(1).show();
                        $('.widget-body-toolbar a').eq(2).show();
                        $('#score input').prop('disabled', 'disabled');
                    }
                    if (audit_state == "1") {
                        $('.widget-body-toolbar a').eq(0).removeClass(
                            'btn-primary').addClass('btn-success');
                        $('.widget-body-toolbar a').eq(1).show();
                        $('.widget-body-toolbar a').eq(2).show();
                    }
                }
                myTool.mask.hide();
            }
        });
    }

    //获取指标进行评分
    var tableData;
    var tr;
    $('#evalGrid').delegate('.eva', 'click', function () {
        tr = $(this).closest('tr');
        var data = table.row(tr).data();
        tableData = data;
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "getIndex",
                data: JSON.stringify(data)
            },
            error: function (msg) {
                errMessage("请求Eval11Servlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("对应指标集下没有指标");
                            break;
                        case 2:
                            errMessage("缺少匹配指标集");
                            break;
                        case 3:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    buildIndex(json.obj);
                }
            }
        });
    });

    function buildIndex(d) {
    	console.log(d);
        $('#eva').empty();
        var html = "";
        for (var i = 0; i < d.length; i++) {
            var s2 = "";
            var s1 = d[i].index_scale.split(",");
            for (var sss = 0; sss < s1.length; sss++) {
                var ss1 = s1[sss].split(":");
                ss1[0] = ss1[0].replace(/ /g, "");
                if (ss1[0] == d[i].value) {
                    s2 = s2
                        + "<a class='btn btn-warning btn-sm value title' data-id='" + i + "," + sss + "' data-title='" + ss1[ss1.length - 1] + "'>"
                        + ss1[0] + "</a>&nbsp";
                } else {
                    s2 = s2
                        + "<a class='btn btn-default btn-xs value title' data-id='" + i + "," + sss + "' data-title='" + ss1[ss1.length - 1] + "'>"
                        + ss1[0] + "</a>&nbsp";
                }
            }
            html = html
                + "<tr><td>"
                + d[i].index_name
                + "</td><td class='index text-align-left' data-index-id='" + d[i].index_id + "' data-index-name='" + d[i].index_name + "' data-index-scale='" + d[i].index_scale + "' data-indexset-id='" + d[i].indexset_id + "' data-value='" + d[i].value + "'>"
                + s2 + "</td></tr>";
        }

        $('#eva').append('<div class="row" style="margin:5px"><table class="table table-striped table-bordered table-hover table-condensed text-align-center">'
            + '<thead><tr><th width="65%" class="text-align-center"> 指标</th><th class="text-align-center"> 标度</th></tr></thead><tbody>'
            + html + '</tbody></table></div>');
        if (control) {
            $('#eva').dialog({
                title: "评定",
                buttons: [{
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var ll = getValue();
                        $.ajax({
                            type: 'POST',
                            url: '../Eval11Servlet',
                            dataType: 'json',
                            data: {
                                type: "saveIndex",
                                data: JSON
                                    .stringify(tableData),
                                list: JSON
                                    .stringify(ll)
                            },
                            error: function (msg) {
                                errMessage("请求Eval11Servlet失败");
                            },
                            success: function (json) {
                                if (json.success == "fail") {
                                    switch (json.error) {
                                        case 1:
                                            errMessage("出错");
                                            break;
                                        case 2:
                                            errMessage("保存失败");
                                            break;
                                        case 3:
                                            errMessage("出错！");
                                            break;
                                        default:
                                            break;
                                    }
                                } else {
                                    tableData.state = 1;
                                    table
                                        .row(
                                            tr)
                                        .data(
                                            tableData)
                                        .draw(
                                            false);
                                    $(
                                        '#eva')
                                        .dialog(
                                            'close');
                                }
                            }
                        });
                    }
                },
                    {
                        html: "<i class='fa fa-times'></i>&nbsp; 取消",
                        "class": "btn btn-default",
                        click: function () {
                            $(this).dialog("close");
                        }
                    }]
            });
        } else {
            $('#eva').dialog({
                title: "评定",
                buttons: [{
                    html: "<i class='fa fa-times'></i>&nbsp; 确定",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                    }
                }]
            });
        }

        $('#eva').dialog('open');
        setTooltip();
        if (control) {
            valueClick();
        }

    }

    function setTooltip() {
        $(".title").each(
            function () {
                $(this).tooltip(
                    {
                        position: 'right',
                        content: '<span style="color:#fff">'
                        + $(this).attr("data-title")
                        + '</span>',
                        onShow: function () {
                            $(this).tooltip('tip').css({
                                backgroundColor: '#666',
                                borderColor: '#666'
                            });
                        }
                    });
            });
    }

    function valueClick() {
        $(".value").on(
            "click",
            function () {
                $(this).parent().find("a").prop("class",
                    "btn btn-default btn-xs ");
                $(this).prop("class", "btn btn-warning btn-sm ");
                $(this).closest('td')
                    .attr('data-value', $(this).html());
            });
    }

    function getValue() {
        var ll = [];
        $('.index').each(function () {
            var s = {
                index_id: $(this).attr('data-index-id'),
                index_name: $(this).attr('data-index-name'),
                index_scale: $(this).attr('data-index-scale'),
                indexset_id: $(this).attr('data-indexset-id'),
                value: $(this).attr('data-value')
            }
            ll.push(s);
        });
        return ll;
    }

    $('#eva').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: "评定"
    });
    $('#eva').prop('hidden', false);

    $('#defect').dialog({
        autoOpen: false,
        width: 900,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: "病害"
    });

    $('#score').dialog({
        autoOpen: false,
        width: 350,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: "清洁、小修"
    });

    /* $('#lookImg').dialog({
     autoOpen: false,
     width : 'auto',
     height : 500,
     resizable : false,
     modal : true,
     show :'drop',
     hide: 'drop',
     title:'查看照片'
     }); */

    $('#lookImg').dialog({
        autoOpen: false,
        width: 'auto',
        height: 500,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: '查看照片',
        buttons: [{
            html: "确定",
            "class": "btn btn-default",
            click: function () {
                $('#lookImg').dialog('close');
            }
        }]
    });
    //$('#lookImg').prop('hidden',false);

    $('#evaRes').dialog({
        autoOpen: false,
        width: 700,
        maxHeight: 700,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    function evaRes() {
        $('#evaRes').dialog({
            title: "评定结果",
            buttons: [{
                html: "确定",
                "class": "btn btn-default",
                click: function () {
                    $(this).dialog("close");
                }
            }]
        });
        $('#evaRes').dialog('open');
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "evaRes"
            },
            error: function (msg) {
            },
            success: function (json) {
                var res = json.obj;
                $('#evaRes tbody').empty();
                var flag = true;
                var wval = '';
                var sval = '';
                var xval = '';
                for (var s in res) {
                    var d = $('<tr><td rowspan="3"  style="text-align: center;vertical-align: middle !important;">ddd<td>桥面系（BDCI）</td><td>20</td><td class="part"></td><td class="part"></td><td class="whole"></td></tr>'
                        + '<tr><td>桥梁上部结构（SPCI）</td><td>40</td><td class="part"></td><td class="part"></td><td class="whole"></td></tr>'
                        + '<tr><td>桥梁下部结构（SBCI）</td><td>40</td><td class="part"></td><td class="part"></td><td class="whole"></td></tr>');
                    d.eq(0).find('td').eq(0).html(s);
                    var part = res[s];
                    if (part['无'] != undefined) {
                        flag = false;
                        d.eq(0).find('td').eq(5).html(Number(part['无'].eva_bridge_part_value3).toFixed(1));
                        d.eq(1).find('td').eq(4).html(Number(part['无'].eva_bridge_part_value1).toFixed(1));
                        d.eq(2).find('td').eq(4).html(Number(part['无'].eva_bridge_part_value2).toFixed(1));
                        if (wval == '') {
                            wval = 100;
                        }
                        if (wval > Number(part['无'].eva_bridge_part_value).toFixed(1)) {
                            wval = Number(part['无'].eva_bridge_part_value).toFixed(1);
                        }
                    } else {
                        if (part['上行'] != undefined) {
                            d.eq(0).find('td').eq(3).html(Number(part['上行'].eva_bridge_part_value3).toFixed(1));
                            d.eq(1).find('td').eq(2).html(Number(part['上行'].eva_bridge_part_value1).toFixed(1));
                            d.eq(2).find('td').eq(2).html(Number(part['上行'].eva_bridge_part_value2).toFixed(1));
                            if (sval == '') {
                                sval = 100;
                            }
                            if (sval > Number(part['上行'].eva_bridge_part_value).toFixed(1)) {
                                sval = Number(part['上行'].eva_bridge_part_value).toFixed(1);
                            }
                        }
                        if (part['下行'] != undefined) {
                            d.eq(0).find('td').eq(4).html(Number(part['下行'].eva_bridge_part_value3).toFixed(1));
                            d.eq(1).find('td').eq(3).html(Number(part['下行'].eva_bridge_part_value1).toFixed(1));
                            d.eq(2).find('td').eq(3).html(Number(part['下行'].eva_bridge_part_value2).toFixed(1));
                            if (xval == '') {
                                xval = 100;
                            }
                            if (xval > Number(part['下行'].eva_bridge_part_value).toFixed(1)) {
                                xval = Number(part['下行'].eva_bridge_part_value).toFixed(1);
                            }
                        }
                    }
                    $('#evaRes tbody').append(d);
                }
                if (flag) {
                    var foot = $('<tr><td colspan="3">上、下行桥梁总体技术状况评分（Dr）</td><td class="part"></td><td class="part"></td><td class="whole"></td></tr>'
                        + '<tr><td colspan="3">全桥总体技术状况评分（Dr）</td><td colspan="2" class="part"></td><td class="whole"></td></tr>');
                    foot.eq(0).find('td').eq(1).html(sval);
                    foot.eq(0).find('td').eq(2).html(xval);
                    foot.eq(1).find('td').eq(1).html(
                        Math.min(sval, xval));
                    $('#evaRes tbody').append(foot);
                    $('.part').show();
                    $('.whole').hide();
                } else {
                    var foot = $('<tr><td colspan="3">无方向桥梁总体技术状况评分（Dr）</td><td class="part"></td><td class="part"></td><td class="whole"></td></tr>'
                        + '<tr><td colspan="3">全桥总体技术状况评分（Dr）</td><td colspan="2" class="part"></td><td colspan="1" class="whole"></td></tr>');
                    foot.eq(0).find('td').eq(3).html(wval);
                    foot.eq(1).find('td').eq(2).html(wval);
                    $('#evaRes tbody').append(foot);
                    $('.whole').show();
                    $('.part').hide();
                }
            }
        });
    }

    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
    });

    function buildPDF() {

        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "buildPDF"
            },
            error: function (msg) {
            },
            success: function (json) {
            }
        });

    }

    function forceEval() {
        showMask();
        $.ajax({
            type: 'POST',
            url: '../Eval11Servlet',
            dataType: 'json',
            data: {
                type: "forceEval"
            },
            error: function (msg) {
            },
            success: function (json) {
                hidMask();
                if (json.obj == false) {
                    errMessage('打分失败');
                } else {
                    // 						buildPDF();
                    window.location.reload();
                }
            }
        });

    }

    /******************************提示信息*******************************************************************/
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

    function showMask() {
        $("#cover").show();
    }
    function hidMask() {
        $("#cover").css('display', 'none');
    }

    var control = false;
    function releaseAdmin() {//管理员

    }
    function releaseManage() {//项目负责人
        releaseMember();
    }
    function releaseMember() {//项目参与人
        $('.widget-body-toolbar a').eq(0).removeClass('disabled');
        control = true;
    }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
          releaseMember();
		}
	
	}
</script>

</body>
</html>