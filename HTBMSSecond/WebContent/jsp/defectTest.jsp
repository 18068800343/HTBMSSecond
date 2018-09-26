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
    <link rel="stylesheet" href="../js/cropper/cropper.min.css"/>
    <style type="text/css">
        .sort {
            list-style-type: none;
            padding: 0 0 0 20px;
            /* 	 padding-top: 10px; */
        }

        .sort li {
            width: 100px;;
            height: 30px;
            margin: 3px 0 3px 3px;
            /* 	 	margin-top: 5px; */
        }

        /* timeline */
        .timeline {
            position: relative;
            margin: 0 0 30px 0;
            padding: 0;
            list-style: none;
        }

        .timeline:before {
            content: '';
            position: absolute;
            top: 0;
            bottom: 0;
            width: 4px;
            background: #ddd;
            left: 31px;
            margin: 0;
            border-radius: 2px;
        }

        .timeline > li {
            position: relative;
            margin-right: 10px;
            margin-bottom: 15px;
        }

        .timeline > li:before, .timeline > li:after {
            content: " ";
            display: table;
        }

        .timeline > li:after {
            clear: both;
        }

        .timeline > li > .timeline-item {
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
            border-radius: 3px;
            margin-top: 0;
            background: #fff;
            color: #444;
            margin-left: 60px;
            margin-right: 15px;
            padding: 0;
            position: relative;
        }

        .timeline > li > .timeline-item > .time {
            color: #999;
            float: right;
            padding: 10px;
            font-size: 12px;
        }

        .timeline > li > .timeline-item > .timeline-header {
            margin: 0;
            color: #555;
            border-bottom: 1px solid #f4f4f4;
            padding: 10px;
            font-size: 16px;
            line-height: 1.1;
        }

        .timeline > li > .timeline-item > .timeline-header > a {
            font-weight: 600;
        }

        .timeline > li > .timeline-item > .timeline-body, .timeline > li > .timeline-item > .timeline-footer {
            padding: 10px;
        }

        .timeline > li > .fa, .timeline > li > .glyphicon, .timeline > li > .ion {
            width: 30px;
            height: 30px;
            font-size: 15px;
            line-height: 30px;
            position: absolute;
            color: #666;
            background: #d2d6de;
            border-radius: 50%;
            text-align: center;
            left: 18px;
            top: 0;
        }

        .timeline > .time-label > span {
            font-weight: 600;
            padding: 5px;
            display: inline-block;
            background-color: #fff;
            border-radius: 4px;
        }

        .timeline-inverse > li > .timeline-item {
            background: #f0f0f0;
            border: 1px solid #ddd;
            -webkit-box-shadow: none;
            box-shadow: none;
        }

        .timeline-inverse > li > .timeline-item > .timeline-header {
            border-bottom-color: #ddd;
        }

        nav > .pager {
            position: inherit;
        }

        .tcenter {
            text-align: center;
            cursor: pointer;
        }

        .well {
            padding: 10px;
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

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>病害录入</li>
        </ol>
        <!-- end breadcrumb -->

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">
        <section id="widget-grid">
            <!-- widget grid -->
            <!-- row -->
            <div class="row">

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
                            <h2>病害</h2>

                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox">
                                <!-- This area used as dropdown edit box -->

                            </div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding">

                                <ul class="timeline">
                                    <li><i id="step1-state" class="fa fa-info bg-aqua"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i></span>
                                            <h3 class="timeline-header no-border">
                                                <a>步骤一：</a> 选择部件类型
                                            </h3>
                                            <div class="timeline-body" id="step1"
                                                 style="display: block;">
                                                <div style="width: 100%; padding: 0 0 20px 0">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2"
                                                               style="line-height: 32px">部件类型</label>
                                                        <div class="col-md-10">
                                                            <select class="form-control" id="prj"
                                                                    style="width: 100%">

                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <nav aria-label="...">
                                                    <ul class="pager">
                                                        <li class="next"><a id="step1-next" href="#">下一步</a></li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </li>
                                    <li><i id="step2-state" class="fa fa-info bg-aqua"></i>
                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i></span>

                                            <h3 class="timeline-header">
                                                <a href="#">步骤二：</a>选择病害
                                            </h3>

                                            <div class="timeline-body" id="step2" style="display: none;">

                                                <div class="well col-xs-12" style="margin-bottom: 10px;">

                                                    <div class="form-group">
                                                        <label>已选常见病害</label> <input
                                                            class="form-control tagsinput" id="defect_attr" value=""
                                                            data-role="tagsinput">
                                                    </div>
                                                    <div class="form-group col-xs-4"
                                                         style="padding-left: 0px; padding-right: 0px;">
                                                        <label style="padding-bottom: 5px;">病害分类类型</label> <select
                                                            class="form-control input-sm select2" id="defect_f">
                                                    </select>
                                                    </div>
                                                    <div class="form-group col-xs-8 ">
                                                        <label style="margin-left: 30px;">次级病害类型</label>
                                                        <div class="col-xs-12 form-inline" id="defect"></div>
                                                        <div class="col-xs-12 form-inline" id="defect"></div>
                                                    </div>

                                                </div>
                                                <div class="well col-xs-12 " style="margin-bottom: 10px;">
                                                    <div class="form-group">
                                                        <label>自定义病害</label> <input
                                                            class="form-control tagsinput" id="user_defect_attr"
                                                            value="" data-role="tagsinput">
                                                    </div>
                                                </div>

                                                <nav aria-label="...">
                                                    <ul class="pager">
                                                        <li class="previous"><a id="step2-previous" href="#">上一步</a>
                                                        </li>
                                                        <li class="next"><a id="step2-next" href="#">下一步</a></li>
                                                    </ul>
                                                </nav>
                                            </div>

                                        </div>
                                    </li>
                                    <li><i id="step3-state" class="fa fa-info"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i></span>
                                            <h3 class="timeline-header no-border">
                                                <a href="#">步骤三：</a>选择构件并上传图片
                                            </h3>
                                            <div class="timeline-body" id="step3" style="display: none;">
                                                <!--  <div id="reportArea" class="col-xs-12" style="padding: 0;">

                                                    </div> -->

                                                <div class="well col-xs-12">
                                                    <label style="font-size: 16px; font-weight: bold;">竖向裂缝：
                                                        <button class="btn btn-default btn-sm" onclick="newMem()">增加构件
                                                        </button>
                                                    </label>
                                                    <div class="col-md-12 ">
                                                        <div clss="form-control">
                                                            <label style="font-size: 16px;">0#台伸缩缝
                                                                <button class="btn btn-default btn-xs">增加图片</button>
                                                            </label>
                                                            <div class="thumbnail col-xs-12 pull-left"
                                                                 style="padding: 1px 10px; text-align: left;">
                                                                <img style="height: 70px; margin-right: 10px;" alt=""
                                                                     src="../ImageDownLoadServer?path=tmp%5C0075d1815e924795b388146ed92baaca.png&amp;0.010180586125751345"
                                                                     class="pull-left"> <img
                                                                    style="height: 70px; margin-right: 10px;" alt=""
                                                                    src="../ImageDownLoadServer?path=tmp%5C2eee376267db42a587c6e58e8562012c.png&0.8464764016643573"
                                                                    class="pull-left">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="well col-xs-12">
                                                    <label style="font-size: 16px; font-weight: bold;">破损：
                                                        <button class="btn btn-default btn-sm" onclick="newMem()">增加构件
                                                        </button>
                                                    </label>
                                                    <div class="col-md-12 ">
                                                        <div clss="form-control">
                                                            <label style="font-size: 16px;">0#台伸缩缝
                                                                <button class="btn btn-default btn-xs">增加图片</button>
                                                            </label>
                                                            <div class="thumbnail col-xs-12 pull-left"
                                                                 style="padding: 1px 10px; text-align: left;">
                                                                <img style="height: 70px; margin-right: 10px;" alt=""
                                                                     src="../ImageDownLoadServer?path=tmp%5C0075d1815e924795b388146ed92baaca.png&amp;0.010180586125751345"
                                                                     class="pull-left"> <img
                                                                    style="height: 70px; margin-right: 10px;" alt=""
                                                                    src="../ImageDownLoadServer?path=tmp%5C2eee376267db42a587c6e58e8562012c.png&0.8464764016643573"
                                                                    class="pull-left">
                                                            </div>
                                                        </div>
                                                        <div clss="form-control">
                                                            <label style="font-size: 16px;">0#台伸缩缝
                                                                <button class="btn btn-default btn-xs">增加图片</button>
                                                            </label>
                                                            <div class="thumbnail col-xs-12 pull-left"
                                                                 style="padding: 1px 10px; text-align: left;">
                                                                <img style="height: 70px; margin-right: 10px;" alt=""
                                                                     src="../ImageDownLoadServer?path=tmp%5C0075d1815e924795b388146ed92baaca.png&amp;0.010180586125751345"
                                                                     class="pull-left"> <img
                                                                    style="height: 70px; margin-right: 10px;" alt=""
                                                                    src="../ImageDownLoadServer?path=tmp%5C2eee376267db42a587c6e58e8562012c.png&0.8464764016643573"
                                                                    class="pull-left">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <nav aria-label="..." class="clearfix" style="clear: both;">
                                                <ul class="pager">
                                                    <li class="previous"><a id="step3-previous" href="#">上一步</a></li>
                                                    <li class="next"><a id="step-finish" href="#">完成</a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </li>
                                    <li><i class="fa fa-info"></i></li>
                                </ul>


                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->


                    </div>
                    <!-- end widget -->

                </article>
                <!-- END GRID -->


            </div>
            <!-- end row -->
        </section>
        <!-- end widget grid -->
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<div id="rgw" hidden="hidden"></div>
<div id="cover" class="cover">
    <div id="loading" class="loading">生成报告</div>
</div>
<%@ include file="footer.jsp" %>


<div id="addMemDialog" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group" style="display: none">
                <label>分部结构</label> <select class="form-control input-sm select2"
                                            id="dis" onchange="disChange()">
                <option>桥面系</option>
            </select>
            </div>
            <div class="form-group" style="display: none">
                <label>部件类型</label>
                <div id="com">
                    <select class="form-control input-sm select2"
                            onchange="comChange()" id="comSelect">
                        <option>---部件类型---</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label>构件类型</label>
                <div id="memType">
                    <select class="form-control input-sm select2"
                            onchange="memTypeChange()">
                        <option value="0">---构件类型---</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label>构件</label>
                <div id="mem">
                    <select class="form-control input-sm select2" id="memSelect">

                    </select>
                </div>
            </div>
            <div class="form-group" id="remark_div" style="display: none">
                <label>备注</label>
                <input class="form-control" id="remark_input" type="text">
            </div>
            <div class="form-group" id="defect_loc_def_div">
                <label>缺损位置</label>
                <div id="defect_loc_def" class="well" style="height: auto"></div>
            </div>
            <div class="form-group" id="defect_def_div">
                <label>缺损状况</label>
                <div id="defect_def" class="well" style="height: auto"></div>
            </div>
        </fieldset>
    </form>
    <form id="f2" method="post" enctype="multipart/form-data"
          action="../ImageUpLoadServer" class="col-xs-12">
        <div class="form-group">
            <label>病害照片（点击下方修改或上传图片）</label> <a class="btn btn-default btn-xs"
                                                onclick="$('#imgFile').click();">增加图片</a> <input type="file"
                                                                                                 id="imgFile"
                                                                                                 name="imgFile"
                                                                                                 style="display: none"
                                                                                                 onchange="imgUpLoad()"
                                                                                                 accept="image/*">
            <div id="photo_area" class="thumbnail col-lg-12"
                 style="padding: 10px 20px 10px 20px; text-align: center;"></div>
        </div>
    </form>
</div>


<div id="cropper" hidden="hidden" style="min-width: 600px">
    <img id="cropperImg" alt="" src=""
         style="width: auto; max-width: 100%;">
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
<script src="check/select2Fix.js"></script>

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

<!-- Flot Chart Plugin: Flot Engine, Flot Resizer, Flot Tooltip -->
<script src="../js/plugin/flot/jquery.flot.cust.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.resize.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.time.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.tooltip.min.js"></script>

<!-- Vector Maps Plugin: Vectormap engine, Vectormap language -->
<script src="../js/plugin/vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../js/plugin/vectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- Full Calendar -->
<script src="../js/plugin/moment/moment.min.js"></script>
<script src="../js/plugin/fullcalendar/jquery.fullcalendar.min.js"></script>


<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
<script src="../js/plugin/bootstrap-tags/bootstrap-tagsinput.min.js"></script>
<script src="../js/plugin/jquery-form/jquery-form.min.js"></script>

<script src="../js/myTool.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="check/bootstrap3-typeahead.min.js"></script>
<script src="../js/cropper/cropper.min.js"></script>

<script type="text/javascript">
    var info = JSON.parse($.cookie('info'));
    var span = JSON.parse($.cookie('span'));

    $(document).ready(function () {

        pageSetUp();
        stepInit();

        initComBox();
        initComBox1();
        initPrj();
        buildDefReference();

    });
    $('#addMemDialog').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: '选择构件'
    });

    /************************************************ 选择构件 ************************************************/
    //初始化构件选框信息
    function initComBox() {

        $.ajax({
            type: 'POST',
            url: '../CurrentControlServlet',
            dataType: 'json',
            async: false,
            data: {
                type: "initComBox",
                bridge_id: info.id,
                direction: span.direction,
                span_no: span.span_no
            },
            error: function (msg) {
                errMessage("请求CheckSpanServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("无数据！");
                            break;
                        case 2:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        memList[data[i].r_id] = data[i];
                        //添加结构和部件关系
                        if (checkRe(dis[data[i].distr_name],
                                data[i].component8)) {
                            dis[data[i].distr_name]
                                .push(data[i].component8);
                            com[data[i].component8] = [];
                        }
                        //添加部件和构件类型关系
                        if (checkRe(com[data[i].component8],
                                data[i].member_type)) {
                            com[data[i].component8]
                                .push(data[i].member_type);
                            memType[data[i].member_type] = [];
                        }
                        //添加构件类型和构件关系
                        if (checkRe(memType[data[i].member_type],
                                data[i].member_no)) {
                            memType[data[i].member_type].push(data[i]);
                        }
                        disChange();
                    }
                    autoOpen = $.cookie('autoOpen');
                    if (autoOpen == 'true') {
                        newMem();
                        autoOpen = 'false';
                        $.cookie('autoOpen', "false");
                    }
                }
            }
        });
    }

    function disChange() {
        var d = $('#dis').val();
        if (d == '0') {
            d = [];
            for (var dd in dis) {
                if (dd == '0') {
                    continue;
                }
                d = d.concat(dis[dd]);
            }
            buildCom(d);
        } else {
            buildCom(dis[d]);
        }
        comChange();
    }
    function comChange() {

        var d = $('#com select').val();

        if (d == '0') {
            $('#memType').empty();
            $('#memType')
                .append(
                    "<select class='form-control input-sm select2'   onchange='memTypeChange()'  style='width: 100%'><option value='0'>---构件类型---</option></select>");
            $('#memType select').select2();
        } else {
            buildMemType(com[d]);

        }
        memTypeChange();
    }

    function memTypeChange() {
        var d = $('#memType select').val();
        if (d == '0') {
            $('#mem').empty();
            $('#mem')
                .append(
                    "<select class='form-control input-sm select2'  style='width: 100%'><option value='0'>---构件---</option></select>");
            $('#mem select').select2();
        } else {
            buildMem(memType[d]);
        }
    }

    function buildCom(data) {
        $('#com').empty();
        $('#com')
            .append(
                "<select class='form-control input-sm select2'   onchange='comChange()' id='comSelect' style='width: 100%'></select>");
        var xx = $('#com select');
        for (var i = 0; i < data.length; i++) {
            xx.append("<option >" + data[i] + "</option>");
        }
        xx.select2();
    }

    function buildMemType(data) {
        $('#memType').empty();
        $('#memType')
            .append(
                "<select class='form-control input-sm select2'   onchange='memTypeChange()'  style='width: 100%'></select>");
        var xx = $('#memType select');
        for (var i = 0; i < data.length; i++) {
            xx.append("<option>" + data[i] + "</option>");
        }
        xx.select2();
    }

    function buildMem(data) {
        $('#mem').empty();
        $('#mem')
            .append(
                "<select class='form-control input-sm select2' id='memSelect' style='width: 100%'></select>");
        var xx = $('#mem select');
        for (var i = 0; i < data.length; i++) {
            xx.append("<option value='" + data[i].r_id + "'>"
                + data[i].member_no + "</option>");
        }
        xx.select2();
    }

    var memList = {};
    var dis = {
        "上部结构": [],
        "桥面系": [],
        "下部结构": []
    }
    var com = {};
    var memType = {};
    function checkRe(d, b) {
        for (var i = 0; i < d.length; i++) {
            if (d[i] == b) {
                return false;
            }
        }
        return true;
    }

    var defect = {
        defectData: {},
        init: function () {
            $('#defect_f').on('change', function () {
                defect.buildDefect();
            });
            $.ajax({
                    type: 'POST',
                    url: '../CurrentControlServlet',
                    dataType: 'json',
                    data: {
                        type: "initTable",
                        component_name: prj
                    },
                    error: function (msg) {
                        errMessage("请求CurrentControlServlet失败");
                    },
                    success: function (json) {

                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    break;
                                case 2:
                                    errMessage("服务器错误");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                            var data = json.obj;

                            data.sort(function (a, b) {
                                return a.defect_f_id - b.defect_f_id;
                            });
                            defect.defectData = {};
                            for (var i = 0; i < data.length; i++) {
                                defect.defectData[data[i].defect_f_name] = data[i].defects;
                            }
                            defect.buildDefect_f();
                        }
                    }
                });
        },
        buildDefect_f: function () {
            var d = $('#defect_f');
            d.empty();
            for (var s in defect.defectData) {
                d.append('<option>' + s + '</option>');
            }
            d.trigger('change');
        },
        buildDefect: function () {
            var checkedTabs = $("#defect_attr").tagsinput('items');
            var tabDefectIds = new Array();
            for (var i in checkedTabs) {
                tabDefectIds.push(checkedTabs[i].id);
            }

            var d = $('#defect');
            var f = $('#defect_f').val();
            d.empty();
            if (f != '%') {
                var defects = defect.defectData[f];
                for (var i = 0; i < defects.length; i++) {
                    d.append('<label class="checkbox">'
                        + '<input type="checkbox" class="checkbox style-0" onclick="checkClick(this);" data-defect='
                        + defects[i].defect_name + ' data-id='
                        + defects[i].defect_id
                        + ' data-name="6" >' + '<span>'
                        + defects[i].defect_name + '</span>'
                        + '</label>');
                    var inTabInput = $.inArray(defects[i].defect_id, tabDefectIds);
                    if (inTabInput >= 0) {
                        $('[data-id = ' + defects[i].defect_id + ']:checkbox').attr("checked", true);
                    }

                }
            }
            d.trigger('change');
        }
    }

    var nowDefect;
    var nowType;
    var nowUserDefectName;
    function newMem(item) {
        $("#photo_area").empty();

        var type = $(item).attr("data-type");

        if (type == "check") {
            var defect = JSON.parse($(item).attr("data-defect"));
            $("#defect_loc_def_div").show();
            $("#defect_def_div").show();
            $("#remark_div").show();
            $("#remark_input").val("");
            nowType = "check";
            $.ajax({
                type: 'POST',
                url: '../CurrentControlServlet',
                dataType: 'json',
                async: false,
                data: {
                    type: "getDefectSById",
                    defect_s_id: defect.id
                },
                error: function (msg) {
                    errMessage("请求CurrentControlServlet失败");
                },
                success: function (json) {
                    if (json.success == "fail") {
                        switch (json.error) {
                            case 1:
                                errMessage("无数据！");
                                break;
                            default:
                                break;
                        }
                    } else {
                        var data = json.obj;
                        nowDefect = data;
                        buildDefectDef(data);
                    }
                }
            });

        } else if (type == "user") {
            var defect = $(item).attr("data-defect");
            nowType = "user";

            nowUserDefectName = defect;

            $("#defect_loc_def_div").hide();
            $("#defect_def_div").hide();
            $("#remark_div").show();
            $("#remark_input").val("");

        }

        $('#addMemDialog')
            .dialog(
                {
                    title: "选择构件",
                    buttons: [
                        {
                            html: "<i class='fa fa-plus'></i>&nbsp; 选定",
                            "class": "btn btn-default",
                            click: function () {

                                var nowMem = $("#memSelect").val();
                                var member = $('#mem select option').html();
                                var mbr_type = $('#memType select option').html();
                                var imgList = new Array();
                                $(".photo").each(
                                    function () {
                                        var imgObj = new Object();
                                        imgObj.photo_path = $(this).find('.photo_path').val();
                                        imgObj.photo_name = $(this).find('.photo_name').html();
                                        imgObj.photo_date = new Date();
                                        imgList.push(imgObj);
                                 });

                                var type = nowType;
                                if (type == "check") {

                                    var defect = nowDefect;
                                    var outDivId = "outDivId" + nowDefect.defect_id + nowMem;
                                    if ($('#' + outDivId + '').length > 0) {
                                        errMessage("此构件已存在！");
                                        return false;
                                    }

                                    var info = {
                                        defect_location_desc: "",
                                        defect_location_desc_val: "",
                                        defect_count: "",
                                        defect_count_val: "",

                                    }


                                    var flag = true;
                                    var d1 = [];
                                    var d2 = [];
                                    $('#defect_loc_def').find('input,select').each(function () {
                                       var e = $(this).val();
                                            d1.push(e);
                                        });
                                    $('#defect_def').find('input,select').each(function () {
                                            var e = $(this).val();
                                            d2.push(e);
                                        });
                                    if (flag == false) {
                                        errMessage("请确认数据完整！");
                                        return;
                                    }

                                    info.defect_location_desc_val = JSON
                                        .stringify(d1);
                                    info.defect_count_val = JSON
                                        .stringify(d2);

                                    var temAndVal = rebuildTemplet(
                                        defect.defect_loc_def,
                                        d1);
                                    defect.defect_loc_def = temAndVal.defect_loc_def;
                                    d1 = temAndVal.d1;

                                    var temAndVal_count = rebuildTemplet(
                                        defect.defect_def, d2);
                                    defect.defect_def = temAndVal_count.defect_loc_def;
                                    d2 = temAndVal_count.d1;

                                    info.defect_location_desc = defect.defect_loc_def
                                        .format(d1);
                                    info.defect_count = defect.defect_def
                                        .format(d2);
                                    /*     if (info.defect_attr != '') {
                                     info.defect_count = info.defect_count
                                     + "，"
                                     + info.defect_attr;
                                     } */

                                    //console.info(info, imgList);
                                    //var outDivId = "outDivId" + nowDefect.defect_id + nowMem;

                                    var picDivId = "picDiv" + nowDefect.defect_id + nowMem;
                                    var defDivId = "defDivId" + nowDefect.defect_id + nowMem;
                                    var defect_loc_defId = "defect_loc_defId" + nowDefect.defect_id + nowMem;//缺损位置spanID
                                    var defect_defId = "defect_def" + nowDefect.defect_id + nowMem;//缺损状况spanID
                                    var remark_val = $("#remark_input").val();
                                    var remark_id = "remark_id" + nowDefect.defect_id + nowMem;
                                    var dom = $('<div class="col-md-12" data-name="memDiv" data-memType=' + mbr_type + ' id=' + outDivId + '>'
                                        + '<div clss="form-control">'
                                        + '<label style="font-size: 16px;"><span style="padding-left: 10px; padding-right: 20px;" class="mem_name" data-id=' + nowMem + '></span>'
                                        + '<button class="deleteBut btn btn-default btn-xs" onclick="deleteMem(this);" data-type="check" data-mem=' + nowMem + ' data-defectId=' + nowDefect.defect_id + ' data-defectName=' + nowDefect.defect_name + '>删除</button>'
                                        + '</label>'
                                        + '<div class=" " style="padding: 1px 10px; text-align: left;" id="' + defDivId + '">'
                                        + '<li>缺损位置：<span class="defect_location_desc" data-val=' + info.defect_location_desc_val + ' id=' + defect_loc_defId + '>' + info.defect_location_desc + '</span></li>'
                                        + '<li>缺损状况：<span class="defect_count" data-val=' + info.defect_count_val + ' id=' + defect_defId + '>' + info.defect_count + '</span></li>'
                                        + '<li>备注：<span class="memo">'
                                        + remark_val
                                        + '</span></li>'
                                        + '</div>'
                                        + '<div class="thumbnail col-xs-12 pull-left " style="padding: 1px 10px; text-align: left;" id="' + picDivId + '">'

                                        + '</div></div></div>');
                                    dom.find('.mem_name').html(member);


                                    var divId = "defectDiv" + nowDefect.defect_id;
                                    //$('#' + divId + '').empty();
                                    $('#' + divId + '').append(dom);
                                    //$('.addMemBut').hide();
                                    $('#' + picDivId + '').empty();
                                    for (var i = 0; i < imgList.length; i++) {
                                        var picDom = $('<div class=" col-xs-3 pull-left photo1 " style="padding: 1px 10px; text-align: left;" >'
                                            + '<img class="load" src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">'
                                            + '<img style="height: 70px; margin-right: 10px;" alt="" img_name=' + imgList[i].photo_name + ' img_path=' + imgList[i].photo_path + ' src="" class="img" onload="imgLoadSuccess2(this)" ></div>');
                                        picDom.find('.img').prop('src', encodeURI('../ImageDownLoadServer?path='
                                            + imgList[i].photo_path + '&' + Math.random()));


                                        $('#' + picDivId + '').append(picDom);

                                    }
                                    //var butId = 'but' + nowDefect.defect_id;
                                    //$('#' + butId + '').prop('disabled', true);
                                    $(this).dialog("close");
                                } else if (type == "user") {
                                    var outDivId = "outDivId" + nowUserDefectName + nowMem;

                                    if ($('#' + outDivId + '').length > 0) {
                                        errMessage("此构件已存在！");
                                        return false;
                                    }
                                    var divId = "defectDiv" + nowUserDefectName;
                                    var remark_val = $("#remark_input").val();
                                    var remark_id = "remark_id" + nowUserDefectName + nowMem;
                                    var picDivId = "picDiv" + nowUserDefectName + nowMem;
                                    var dom = $('<div class="col-md-12" data-name="memDiv" data-memType=' + mbr_type + ' id=' + outDivId + '>'
                                        + '<div clss="form-control">'
                                        + '<label style="font-size: 16px;"><span style="padding-left: 10px; padding-right: 20px;" class="mem_name" data-id=' + nowMem + '></span>'
                                        + '<button class="deleteBut btn btn-default btn-xs" onclick="deleteMem(this);"data-type="user" data-mem='
                                        + nowMem
                                        + ' data-defectName=' + nowUserDefectName + '>删除</button>'
                                        + '</label>'
                                        + '<div class=" " style="padding: 1px 10px; text-align: left;" >'
                                        + '<li>备注：<span class="memo">'
                                        + remark_val
                                        + '</span></li>'
                                        + '</div>'
                                        + '<div class="thumbnail col-xs-12 pull-left " style="padding: 1px 10px; text-align: left;" id="' + picDivId + '">'

                                        + '</div></div></div>');
                                    dom.find('.mem_name').html(member);

                                    $('#' + divId + '').empty();
                                    $('#' + divId + '').append(dom);
                                    $('#' + picDivId + '').empty();

                                    for (var i = 0; i < imgList.length; i++) {
                                        var picDom = $('<div class=" col-xs-3 pull-left photo1 " style="padding: 1px 10px; text-align: left;" >'
                                            + '<img class="load" src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">'
                                            + '<img style="height: 70px; margin-right: 10px;" alt="" src="" img_name=' + imgList[i].photo_name + ' img_path=' + imgList[i].photo_path + ' class="img" onload="imgLoadSuccess2(this)" ></div>');
                                        picDom.find('.img').prop('src', encodeURI('../ImageDownLoadServer?path='
                                            + imgList[i].photo_path + '&' + Math.random()));

                                        $('#' + picDivId + '').append(picDom);

                                    }

                                    $(this).dialog("close");
                                }

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
        $('#addMemDialog').dialog('open');
    }

    //报告组成设置
    $('#reportArea')
        .delegate(
            'input[type="checkbox"]',
            'change',
            function () {
                var flag = $(this).prop('checked');
                var d = $(this).attr('data-name');
                var name = $(this).next('span').html();
                var $sort = $(this).closest('.well').find('.sort');
                if (flag) {
                    $sort
                        .append('<li class="btn btn-default" data-name="' + d + '">'
                            + name + '</li>');
                } else {
                    $sort.find('[data-name="' + d + '"]').remove();
                }
            });

    $('#build input[type="checkbox"]').on(
        'change',
        function () {
            var flag = $(this).prop('checked');
            var d = $(this).attr('data-name');
            var name = $(this).next('span').html();
            if (flag) {
                $('#sort').append(
                    '<li class="btn btn-default" data-name="' + d + '">'
                    + name + '</li>');
            } else {
                $('#sort').find('[data-name="' + d + '"]').remove();
            }
        });

    function addTableRow() {
        table.row.add(tableData).draw(false);
    }

    function formatBuild(d) {
        d = d.replace('1', '桥梁封面');
        d = d.replace('4', '检查记录');
        d = d.replace('5', '桥梁卡片');
        d = d.replace('2', '04规范');
        d = d.replace('3', '11规范');
        return d;
    }

    function buildPrjComboBox(d) {
        $('#prj').empty();
        for (var i = 0; i < d.length; i++) {
            $('#prj').append(
                "<option value='" + d[i].prj_id + "' data-chk='" + d[i].chk_type + "'>"
                + d[i].prj_desc + "</option>");
        }
        $('#prj').select2();
    }

    function getBuild($sort) {
        var s = "";
        var b = false;
        $sort.find('li').each(function () {
            if (b == false) {
                s = s + $(this).attr('data-name');
            } else {
                s = s + "+" + $(this).attr('data-name');
            }
            b = true;
        });
        return s;
    }

    function getSp() {
        /* 	var s = "";
         $("#sp").find('input:checked').each(function(){
         s=$(this).attr("data-name");
         }); */
        return '2011';
    }

    $('#rgw').prop('hidden', false);

    function newReport() {
        $('#rgw').dialog('open');
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

    function stepInit() {
        $('#step1-next').on('click', function () {
            $('#step1').slideUp('normal', 'swing');
            $('#step2').slideDown('normal', 'swing', function () {
                //                     	initStructTable();
            });
            $('#step1-state').removeClass('fa-info').addClass('fa-check');

        });

        $('#step2-previous').on('click', function () {
            $('#step1').slideDown('normal', 'swing');
            $('#step2').slideUp('normal', 'swing');
            $('#step2-state').removeClass('fa-check').addClass('fa-info');
        });

        $('#step2-next').on('click', function () {
            if (checkedTab.length == 0 && usersTab.length == 0) {
                errMessage("请选择或填写病害!");
                return false;
            }
            $('#step2').slideUp('normal', 'swing');
            $('#step3').slideDown('normal', 'swing', function () {
                //                     	buildReportArea();
            });
            $('#step2-state').removeClass('fa-info').addClass('fa-check');
        });

        $('#step3-previous').on('click', function () {
            $('#step2').slideDown('normal', 'swing');
            $('#step3').slideUp('normal', 'swing');
            $('#step3-state').removeClass('fa-check').addClass('fa-info');
        });

        $('#step-finish').on('click', function () {
            // 	            	addReports();
            var info1 = new Array();
            $("[data-name='memDiv']").each(function () {
                var chk_type = info.chk_type;
                var prj_id = info.prj_id;
                var mbr_type = $(this).attr("data-memType");
                var mbr_no = $(this).find(".mem_name").attr("data-id");
                var defect_name = $(this).find(".deleteBut").attr("data-defectName");
                var defect_id = $(this).find(".deleteBut").attr("data-defectid");
                var defect_type = $(this).find(".deleteBut").attr("data-type");
                var defect_location_desc = $(this).find(".defect_location_desc").html();
                var defect_count = $(this).find(".defect_count").html();
                var defect_location_desc_val = $(this).find(".defect_location_desc").attr("data-val");
                var defect_count_val = $(this).find(".defect_count").attr("data-val");
                var chk_defect_memo = $(this).find(".memo").html();
                var photoList = new Array();
                $(this).find(".img").each(function () {
                    var photo_name = $(this).attr("img_name");
                    var photo_path = $(this).attr("img_path");
                    var photo = new Object();
                    photo.photo_name = photo_name;
                    photo.photo_path = photo_path;
                    photoList.push(photo);

                });
                var info2 = {
                    span_chk_id: span.span_chk_id,
                    bridge_id: info.id,
                    direction: span.direction,
                    span_no: span.span_no,
                    mbr_type: mbr_type,
                    mbr_no: mbr_no,
                    defect_type: defect_type,
                    defect_name: defect_name,
                    defect_id: defect_id,
                    defect_location_desc: defect_location_desc,
                    defect_count: defect_count,
                    defect_location_desc_val: defect_location_desc_val,
                    defect_count_val: defect_count_val,
                    chk_defect_memo: chk_defect_memo,
                    photoList: photoList,
                    chk_type: chk_type,
                    prj_id: prj_id
                }

                info1.push(info2);
            });
            console.info(info1);
            $.ajax({
                type: 'POST',
                url: '../CurrentControlServlet ',
                dataType: 'json',
                async: false,
                data: {
                    type: "newDefect",
                    info: JSON.stringify(info1)
                },
                error: function (msg) {
                    errMessage("请求CurrentControlServlet 失败");
                },
                success: function (json) {
                    if (info1.length > 0) {
                        successMessage("添加成功");
                    } else {
                        successMessage("未选择任何构件");
                    }
                    window.location.href = "checkSpan3.jsp";
                }
            });

        });
    }

    /* tableData.report_build = build;
     tableData.report_sp = sp;
     tableData.report_file_name = name;
     tableData.prj_id = prj_id;
     tableData.prj_name = $("#prj option[value='"+prj_id+"']").html();
     tableData.struct_id = info.id;
     tableData.struct_mode = info.mode;
     ParaMsg = "2,"+prj_id+","+info.id+","+sp+","+build; */

    function buildReportArea() {
        var data = structTable.data();
        var structs = [];
        for (var i = 0; i < data.length; i++) {
            if (data[i].state) {
                structs.push(data[i]);
            }
        }
        if (structs.length == 0) {
            errMessage('未选择任何结构物！');
            return;
        }
        console.log(structs);
        $('#reportArea').empty();
        for (var i = 0; i < structs.length; i++) {
            var struct = structs[i];
            if (struct.stub_no == undefined) {
                struct.stub_no = "";
            }
            var name = struct.struct_name + "（" + struct.stub_no + "）";
            console.log(name);
            var dom = $('<div class="well col-xs-12" style="" data-id="' + struct.struct_id + '" data-name="' + name + '" data-mode="' + struct.struct_mode + '">'
                + '<div class="form-group col-xs-12"  style="padding: 0">'
                + '<label style="font-size: 18px;font-weight: bold;">'
                + struct.struct_no
                + '-'
                + struct.struct_name
                + '：</label>'
                + '<div class="col-md-12 form-inline">'
                + '<label class="control-label">报告组成</label>'
                + '<label class="checkbox">'
                + '<input type="checkbox" class="checkbox style-0"  data-name="1" checked="checked" data-value="封面">'
                + '<span>桥梁封面</span>'
                + '</label>'
                + '<label class="checkbox">'
                + '<input type="checkbox" class="checkbox style-0" data-name="5" checked="checked" data-value="检查记录">'
                + '<span>桥梁卡片</span>'
                + '</label>'
                + '<label class="checkbox">'
                + '<input type="checkbox" class="checkbox style-0" data-name="2" checked="checked" data-value="部件评定结果报告">'
                + '<span>04规范</span>'
                + '</label>'
                + '<label class="checkbox">'
                + '<input type="checkbox" class="checkbox style-0" data-name="3" checked="checked" data-value="总体评定结果报告">'
                + '<span>11规范</span>'
                + '</label>'
                + '<label class="checkbox">'
                + '<input type="checkbox" class="checkbox style-0"  data-name="6" checked="checked" data-value="封面">'
                + '<span>桥梁概述</span>'
                + '</label>'
                + '<label class="checkbox">'
                + '<input type="checkbox" class="checkbox style-0" data-name="4" checked="checked" data-value="检查记录">'
                + '<span>检查记录</span>'
                + '</label>'
                + '</div>'
                + '</div>'
                + '<div class="form-group col-xs-12 sp"  style="padding: 0;">'
                + '<div class="col-md-12" >'
                + '<label class="control-label">报告排序</label>'
                + '<ul  class="sort" style="height: auto;width: auto;display: inline-block;">'
                + '<li class="btn btn-default" data-name="1">桥梁封面</li>'
                + '<li class="btn btn-default" data-name="5">桥梁卡片</li>'
                + '<li class="btn btn-default" data-name="2">04规范</li>'
                + '<li class ="btn btn-default" data-name="3">11规范</li>'
                + '<li class="btn btn-default" data-name="6">桥梁概述</li>'
                + '<li class="btn btn-default" data-name="4">检查记录</li>'
                + '</ul>' + '</div>' + '</div>' +
                // 						'<div class="form-group col-xs-12"  style="padding: 0;margin-bottom: 0;">'+
                // 							'<div class="col-md-12" >'+
                // 								'<label class="control-label">选择跨</label>'+
                // 								'<div class="form-inline">'+
                // 									'<label>上行：</label>'+
                // 									'<input type="text" class="form-control" style="width: 700px;">'+
                // 								'</div>'+
                // 								'<div class="form-inline">'+
                // 									'<label>下行：</label>'+
                // 									'<input type="text" class="form-control" style="width: 700px;">'+
                // 								'</div>'+
                // 							'</div>'+
                '</div>	' + '</div>');

            $('#reportArea').append(dom);
            if (struct.struct_mode != 'bridge') {
                dom.find('input[data-name="2"]').click().prop('disabled',
                    'disabled');
                dom.find('input[data-name="3"]').click().prop('disabled',
                    'disabled');
                dom.find('input[data-name="6"]').click().prop('disabled',
                    'disabled');
            }
        }

    }

    function showMask() {
        $("#cover").show();
    }
    function hidMask() {
        $("#cover").css('display', 'none');
    }

    $("#defect_attr").tagsinput({

        itemValue: "id",
        itemText: 'text',

    });
    function checkClick(check) {

        var defect_s_name = $(check).attr('data-defect');
        var defect_s_id = $(check).attr('data-id');

        var tagInput = $("#defect_attr");

        if ($(check).prop('checked')) {
            tagInput.tagsinput('add', {
                id: defect_s_id,
                text: defect_s_name
            });

        } else {
            tagInput.tagsinput('remove', {
                id: defect_s_id,
                text: defect_s_name
            });
        }

    }
    var checkedTab = new Array();//第二步复选框选择的病害类型
    var usersTab = new Array();//第二步用户自定义的病害类型
    var prj;//第一步选择的部件类型
    var com8_2;//去重后的部件数组
    var nowDefect;
    $('#defect_attr').on('itemRemoved', function (event) {
        //tabsinput删除事件
        // event.item: contains the item

        var defect_f_nameArr = getAllDefect_f_name();

        var removeCheck = $("input[data-id='" + event.item.id + "']");
        removeCheck.prop("checked", false);//删除tab时checkbox取消勾选
      
    });

    $('#defect_f').on('change', function () {
        var checkArr = new Array();
        $("input:checkbox").each(function (index, element) {
            checkArr.push($(this).attr('data-defect'));
        });

    });

    $("#step1-next").click(function () {
        //第一步 “下一步”点击事件

        prj = $("#prj").val();//将选择的部件类型赋值给全局变量
        var d = $('#com select')
        d.val(prj).trigger("change");
        defect.init();
        checkedTab.length = 0;
        usersTab.length = 0
        $('#defect_attr').tagsinput('removeAll');
        $('#user_defect_attr').tagsinput('removeAll');

    });
    $("#step2-next")
        .click(
            function () {
                //第二步 “下一步”点击事件
                $("#step3").empty();

                checkedTab = $("#defect_attr").tagsinput('items');
                usersTab = $("#user_defect_attr").tagsinput('items');


                for (var i in checkedTab) {
                    var divId = "defectDiv" + checkedTab[i].id;
                    var butId = 'but' + checkedTab[i].id;
                   
                    var defectDom = $('<div class="well col-xs-12"  >'
                        + '<label style="font-size: 16px; font-weight: bold;"><span style="padding-left: 10px; padding-right: 20px;"class="defect_name">竖向裂缝：</span>'
                        + '<button class="btn btn-default btn-xs" onclick="newMem(this)" data-type="check" data-defect='
                        + JSON.stringify(checkedTab[i])
                        + ' id="'
                        + butId
                        + '" class="addMemBut btn-xs">增加构件</button>'
                        + '</label><div id=' + divId + '></div></div>');
                    defectDom.find('.defect_name').html(
                        checkedTab[i].text);
                    $("#step3").append(defectDom);
                }
                for (var i in usersTab) {
                    var divId = "defectDiv" + usersTab[i];
                    var butId = 'but' + usersTab[i];

                    var defectDom = $('<div class="well col-xs-12" class="">'
                        + '<label style="font-size: 16px; font-weight: bold;"><span style="padding-left: 10px; padding-right: 20px;" class="defect_name">病害名称</span>'
                        + '<button class="btn btn-default btn-xs" onclick="newMem(this)" data-type="user" id="'
                        + butId
                        + '" data-defect='
                        + usersTab[i]
                        + '>增加构件</button>'
                        + '</label><div id=' + divId + '></div>'
                        + '<div class="col-md-12 ">');
                    defectDom.find('.defect_name').html(usersTab[i]);

                    $("#step3").append(defectDom);
                }
            });

    function initPrj() {

        var prg = $("#prj");
        prg.empty();

        $.ajax({
            type: 'POST',
            url: '../CurrentControlServlet',
            dataType: 'json',
            async: false,
            data: {
                type: "initComBox",
                bridge_id: info.id,
                direction: span.direction,
                span_no: span.span_no
            },
            error: function (msg) {
                errMessage("请求CurrentControlServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("无数据！");
                            break;
                        case 2:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    var com8 = new Array();
                    for (var i = 0; i < data.length; i++) {
                        com8.push(data[i].component8);
                    }
                    com8_2 = uniq(com8);
                    for (var i = 0; i < com8_2.length; i++) {
                        prg.append("<option >" + com8_2[i] + "</option>");
                    }
                }
            }
        });

    }

    function getAllDefect_f_name() {
        var defectNameArr = new Array();
        for (var i in defect.defectData) {
            var arr = defect.defectData[i];
            for (var j in arr) {
                defectNameArr.push(arr[j].defect_name);
            }
        }

        return defectNameArr;
    }

    //初始化构件选框信息
    function initComBox1() {

    }
    function uniq(array) {
        //数组去重
        var temp = []; //一个新的临时数组
        for (var i = 0; i < array.length; i++) {
            if (temp.indexOf(array[i]) == -1) {
                temp.push(array[i]);
            }
        }
        return temp;
    }

    function deleteMem(item) {
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该构件吗？",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var type = $(item).attr('data-type');
                var mem = $(item).attr('data-mem');
                var defectItem;
                if (type == "check") {
                    defectItem = $(item).attr('data-defectId');
                } else if (type == "user") {
                    defectItem = $(item).attr('data-defectName');
                }
                var outDivId = "outDivId" + defectItem + mem;
                var divId = "defectDiv" + defectItem;
                $('#' + outDivId + '').remove();
            } else {
                return false;
            }

        });

        //$('#' + divId + '').empty();
        //var butId = 'but' + defectItem;
        //$('#' + butId + '').prop('disabled', false);
    }
    /* ------------------------------------缺损位置，缺损状况（Begin）------------------------------------------- */
    var defReference;
    //生成参照；
    function buildDefReference() {
        defReference = $("<select class='input-xs'></select>");

        $.ajax({
            type: 'POST',
            url: '../CheckSpanServlet',
            dataType: 'json',
            data: {
                type: "span_no_last",
                span_no: span.span_no,
                direction: span.direction
            },
            error: function (msg) {
                errMessage("请求CheckSpanServlet失败");
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
                        default:
                            break;
                    }
                } else {
                    if (json.obj == true) {
                        if (span.span_no == '1') {
                            defReference.append("<option>0#台</option>");
                        } else {
                            defReference.append("<option>" + (span.span_no - 1)
                                + "#墩</option>");
                        }
                        defReference.append("<option>" + span.span_no
                            + "#台</option>");
                    } else {
                        if (span.span_no == '1') {
                            defReference.append("<option>0#台</option>");
                        } else {
                            defReference.append("<option>" + (span.span_no - 1)
                                + "#墩</option>");
                        }
                        defReference.append("<option>" + span.span_no
                            + "#墩</option>");
                    }
                }
                $
                    .ajax({
                        type: 'POST',
                        url: '../DefReferenceServlet',
                        dataType: 'json',
                        data: {
                            type: "initReference"
                        },
                        error: function (msg) {
                            errMessage("请求DefReferenceServlet失败");
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
                                    default:
                                        break;
                                }
                            } else {
                                var data = json.obj;
                                for (var i = 0; i < data.length; i++) {
                                    defReference.append("<option>"
                                        + data[i].reference_name
                                        + "</option>");
                                }
                            }
                        }
                    });
            }
        });
    }

    //var defect = {};//存储病害名称
    var defect_f = {};//存储病害分类
    var defect_f_list = [];
    var defect_variable = {}; //存储变量节点

    function buildDefectDef(defect_s) {

        var member = $('#mem select option').html();
        
        var data = defect_s;
        var d1 = data.defect_loc_def;
        var d2 = data.defect_def;
        var patt1 = new RegExp("\{[^\{\}]*\}", "g");
        var patt2 = new RegExp("\{[^\{\}]*\}", "i");
        var dd1 = d1.match(patt1);
        var dd2 = d2.match(patt1);
        for (var a in dd1) {
            dd1[a] = dd1[a].replace(/\{|\}/g, '')
        }
        for (var a in dd2) {
            dd2[a] = dd2[a].replace(/\{|\}/g, '')
        }
        d1 = d1.replace(/距/g, '<br>距');
        d1 = d1.replace(/\^2/g, '<sup>2</sup>');
        d1 = d1.replace(/\^3/g, '<sup>3</sup>');
        d1 = d1.replace(/\[|\]/g, '');

        d2 = d2.replace(/\^2/g, '<sup>2</sup>');
        d2 = d2.replace(/\^3/g, '<sup>3</sup>');
        if (dd1 != null) {
            for (var i = 0; i < dd1.length; i++) {
                if (dd1[i] == "参照") {
                    d1 = d1.replace(patt2, defReference.prop('outerHTML'));
                } else {
                    d1 = d1
                        .replace(
                            patt2,
                            "<input type='text' style='width:100px;margin: 0px 5px;' placeholder='" + dd1[i] + "' data-name='" + dd1[i] + "' value=''></input>");
                }
            }
        }
        if (dd2 != null) {
            for (var i = 0; i < dd2.length; i++) {
                d2 = d2
                    .replace(
                        patt2,
                        "<input type='text' style='width:100px;margin: 0px 5px;' placeholder='" + dd2[i] + "' data-name='" + dd2[i] + "' value=''></input>");
            }
        }
        $('#defect_loc_def').empty();
        $('#defect_def').empty();
        $('#defect_loc_def').append(d1);
        $('#defect_def').append(d2);

        var template = JSON.parse(data.defect_template);
        defect_variable = {};
        function setInput(d) {
            var s = $(d).attr('data-name');
            if (s == "构件") {
                $(d).val(member);
                $(d).prop('disabled', 'disabled');
                return;
            }
            if (s == "病害") {
                $(d).val(data.defect_name);
                return;
            }
            var t = getT(template, s);
            if (s != "" && t != undefined) {
                defect_variable[s] = $(d)//存储变量节点;
                if (t.calculate != "") {
                    $(d).prop('placeholder',
                        $(d).prop('placeholder') + "=" + t.calculate);
                    $(d).focus(
                        function () {
                            var z = t.calculate;
                            var variables = getVariable(z);
                            for (var y in variables) {
                                var x = variables[y];
                                if (defect_variable[x].val() == ""
                                    && x != t.variable) {
                                    errMessage("请完善数据！");
                                    $(d).val("");
                                    return;
                                }
                                if (defect_variable[x].val() < 0) {
                                    errMessage("数据中不能出现负数！");
                                    $(d).val("");
                                    return;
                                }
                                if (isNaN(defect_variable[x].val())) {
                                    errMessage("不合法数据！");
                                    $(d).val("");
                                    return;
                                }
                                z = z.replace(new RegExp(x, "g"),
                                    defect_variable[x].val());
                            }
                            var res = getResult(z);
                            if (res == null) {
                                errMessage("不合法数据！");
                                $(d).val("");
                                return;
                            }
                            $(d).val(formatRes(res));
                        });
                }
                if (t.describe != "") {
                    $(d).prop('placeholder',
                        $(d).prop('placeholder') + "(" + t.describe + ")");
                }
                if (t.describe.indexOf('宽度') >= 0) {
                    if (data.defect_name.indexOf('裂缝') >= 0) {
                        $(d).typeahead(
                            {
                                source: ['0.10', '0.08', '0.12', '0.06',
                                    '0.04', '0.15', '0.14', '0.20'],
                                showHintOnFocus: 'all',
                                matcher: function (g) {
                                    return true;
                                },
                                highlighter: function (g) {
                                    return g;
                                }
                            });
                    }
                }
                if (t.save == "1") {
                    $(d).prop('placeholder', $(d).prop('placeholder') + "(存储)");
                }
            }
        }

        $('#defect_loc_def').children('input').each(function () {
            setInput(this);
        });
        $('#defect_def').children('input').each(function () {
            setInput(this);
        });
        $('#defect_attr').empty();
        var attr = data.defect_attr.split(",");
        for (var i = 0; i < attr.length; i++) {
            $('#defect_attr')
                .append(
                    "<label class='checkbox-inline'><input type='checkbox' class='checkbox style-0' ><span>"
                    + attr[i] + "</span></label>");
        }

    }

    function getT(template, s) {
        for (var i = 0; i < template.length; i++) {
            if (template[i].variable == s) {
                return template[i];
            }
        }
        return undefined;
    }

    function formatRes(d) {
        d = d + "";
        var patt = new RegExp('\\.', 'g');
        if (d.match(patt) == null) {
            return d;
        }
        return Number(d).toFixed(1);
    }

    function getVariable(d) {
        var patt = new RegExp("[\\+\\-\\*\\/\\^\(\)]", "g");
        var va = d.split(patt);
        for (var i = 0; i < va.length; i++) {
            if (va[i] == "" || isNaN(va[i]) == false) {
                va.splice(i, 1);
                i--;
            }
        }
        return va;
    }

    function getResult(d) {
        var patt = new RegExp("[\\+\\-\\*\\/\\^\(\)]", "g");
        var va = d.split(patt);
        var flag = true;
        for (var i = 0; i < va.length; i++) {
            if (isNaN(va[i])) {
                return null;
            }
            if (va[i] == "") {
                va.splice(i, 1);
                i--;
            }
        }

        var valueStack = new MyStack();
        var operStack = new MyStack();

        function Count(e) {
            var exp = e;
            var index = 0;// 扫描指针
            var spliceNum = "";// 用来拼接多位数的变量
            while (true) {
                // 取出字符
                var cha = exp.substr(index, 1);
                // 判断cha
                if (operStack.isOper(cha)) {
                    // 是运算符,判断运算符栈是否为空
                    if (operStack.isEmpty()) {
                        // 放入运算符栈
                        operStack.push(cha);
                    } else {
                        if (cha == "(") {
                            operStack.push(cha);
                        } else if (cha == ")") {
                            while (operStack.getTop() != "("
                            && !operStack.isEmpty()
                            && operStack.PRI(cha) <= operStack
                                .PRI(operStack.getTop())) {
                                // 从数值栈出栈两个数值
                                var num1 = valueStack.pop();
                                var num2 = valueStack.pop();
                                // 再从运算符栈出栈一个运算符
                                var oper = operStack.pop();
                                // 调用计算函数
                                var res = operStack.result(num1, num2, oper);
                                // 把结果放入数值栈
                                valueStack.push(res);
                            }
                            operStack.pop();
                        } else {
                            while (!operStack.isEmpty()
                            && operStack.PRI(cha) <= operStack
                                .PRI(operStack.getTop())) {
                                // 从数值栈出栈两个数值
                                var num1 = valueStack.pop();
                                var num2 = valueStack.pop();
                                // 再从运算符栈出栈一个运算符
                                var oper = operStack.pop();
                                // 调用计算函数
                                var res = operStack.result(num1, num2, oper);
                                // 把结果放入数值栈
                                valueStack.push(res);
                            }
                            operStack.push(cha);
                        }
                    }
                } else {
                    // 是数值，放入数值栈
                    spliceNum = spliceNum + cha;
                    // 先判断是否到了字符串的最后，如果到了，就直接放入数值栈
                    if (index == exp.length - 1) {
                        valueStack.push(spliceNum);
                    } else {
                        // 判断cha字符的下一个字符是数字还是运算符
                        if (operStack.isOper(exp.substr(Number(index) + 1, 1))) {
                            // 如果是运算符，直接入栈
                            valueStack.push(spliceNum);
                            spliceNum = "";
                        } else {
                            // 如果是数字，则不做处理,继续循环拼接全部数字
                        }
                    }
                }
                // 让扫描指针指向下一个字符
                index++;
                // 判断是否扫描完毕,扫描完毕，break.
                if (index == exp.length) {
                    break;
                }

            }
            // 如果运算符栈不为空就一直计算
            while (!operStack.isEmpty()) {
                // 从数值栈出栈两个数值
                var num1 = valueStack.pop();
                var num2 = valueStack.pop();
                // 再从运算符栈出栈一个运算符
                var oper = operStack.pop();
                // 调用计算函数
                var res = operStack.result(num1, num2, oper);
                // 把结果放入数值栈
                valueStack.push(res);
            }
            // 在退出循环后，数值栈中留下的数值，就是最终结果
            return valueStack.getTop();
        }

        return Count(d);
    }

    function MyStack() {
        this.stackTop = -1;// 栈的指针
        this.stackSize = 50;// 栈的容量
        this.stack = new Array();
        // 入栈操作
        this.push = function (val) {
            if (this.stackTop == this.stackSize - 1) {
                alert("栈已经满了");
            }
            this.stackTop++;
            this.stack[this.stackTop] = val;
        }
        // 出栈操作
        this.pop = function () {
            if (this.stackTop == -1) {
                alert("栈内没有数据");
            }
            var stackTopVal = this.stack[this.stackTop];
            this.stackTop--;
            return stackTopVal;
        }
        // 显示栈内的数据
        this.show = function () {
            if (this.stackTop == -1) {
                alert("栈内没有数据");
            }
            for (var i = this.stackTop; i > -1; i--) {
                alert(this.stack[i]);
            }
        }
        // 判断当前字符是数值还是运算符
        this.isOper = function (cha) {
            if (cha == "+" || cha == "-" || cha == "*" || cha == "/"
                || cha == "(" || cha == ")" || cha == "^") {
                return true;
            } else {
                return false;
            }
        }
        // 判断栈是否为空
        this.isEmpty = function () {
            if (this.stackTop == -1) {
                return true;
            } else {
                return false;
            }
        }
        // 获取运算符的优先级
        this.PRI = function (cha) {
            if (cha == "*" || cha == "/") {
                return 2;
            } else if (cha == "+" || cha == "-") {
                return 1;
            } else if (cha == "^") {
                return 3;
            } else if (cha == "(") {
                return 0;
            } else if (cha == ")") {
                return 0;
            }
        }
        // 获取栈顶的字符
        this.getTop = function () {
            return this.stack[this.stackTop];
        }
        // 计算函数
        this.result = function (num1, num2, oper) {
            var res = 0;
            switch (oper) {
                case '+':
                    res = Number(num2) + Number(num1);// 数据必须先要转换
                    break;
                case '-':
                    res = Number(num2) - Number(num1);
                    break;
                case '*':
                    res = Number(num2) * Number(num1);
                    break;
                case '/':
                    res = Number(num2) / Number(num1);
                    break;
                case '^':
                    res = Math.pow(num2, num1);
                    break;
            }
            return res;
        }
    }
    
    
    function rebuildTemplet(defect_loc_def, d1) {
        var patt = new RegExp("\{[^\{\}]*\}", "g");
        var ar = defect_loc_def.match(patt);
        var all = getAll(defect_loc_def);

        if (all.length > 0) {
            for (var i = 0; i < d1.length; i++) {
                if (d1[i] == '') {
                    var index = defect_loc_def.indexOf(ar[i]);
                    var left = getLeft(index, all);
                    if (left != null) {
                        var right = getRight(left, all);
                        var pla = defect_loc_def.substring(left.loc_index,
                            right.right.loc_index + 1);

                        defect_loc_def = defect_loc_def.replace(pla, '');
                        d1.splice(i, right.count);
                        all = getAll(defect_loc_def);
                        ar = defect_loc_def.match(patt);
                        i = 0;
                    }
                }
            }
        }

        var s = {
            defect_loc_def: defect_loc_def.replace(/\[|\]/g, ''),
            d1: d1
        }
        return s;
    }

    function getLeft(index, all) {
        for (var i = (all.length - 1); i >= 0; i--) {
            if (all[i].loc_index < index && all[i].val == '[') {
                return all[i];
            }
        }
        return null;
    }

    function getAll(d) {
        var pa = new RegExp('\\[|\\]', 'g');
        var s;
        var i = 0;
        var all = [];
        while ((s = pa.exec(d)) != null) {
            var struct = {
                arr_index: undefined,
                loc_index: undefined,
                val: undefined
            }
            struct.arr_index = i;
            struct.loc_index = pa.lastIndex - 1;
            struct.val = s[0];
            all.push(struct);
            i++;
        }
        return all;
    }

    String.prototype.format = function () {
        if (arguments.length == 0)
            return this;
        var d = arguments[0];
        for (var s = this, i = 0; i < d.length; i++) {
            s = s.replace(new RegExp("\{[^\{\}]*\}", "i"), d[i]);
        }
        return s;
    };

    function getRight(left, all) {
        var count = 0;
        var stack = [];
        stack.push(left);
        var right = left;
        while (stack.length > 0) {
            right = all[right.arr_index + 1];
            if (right.val == stack[stack.length - 1].val) {
                stack.push(right);
            } else {
                stack.pop();
                count++;
            }
        }
        var re = {
            count: count,
            right: right
        }
        return re;
    }
    /* ------------------------------------缺损位置，缺损状况（END）------------------------------------------- */

    /* ------------------------------------图片（Begin）------------------------------------------- */

    function removeImg(d) {
        //TODO:删除图片
        //当前添加直接删除节点，之前存在则修改data-del="1"，并隐藏节点
        var top = $('#addMemDialog').scrollTop();

        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该图片吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var $photo = $(d).closest('.photo');
                if ($photo.attr('data-new') == '1') {
                    $photo.remove();
                } else {
                    $photo.hide();
                    $photo.attr('data-del', '1');
                }
                if (nowType == 'check') {
                    reSetPhotoName(nowDefect.defect_name);
                } else if (nowType == 'user') {
                    reSetPhotoName(nowUserDefectName);
                }

            }
            $('#addMemDialog').scrollTop(top);
        });
    }

    function reSetPhotoName(data) {

        var name = data;
        var mem = $('#mem select option').html();
        var $photo = $('.photo:visible');
        if ($photo.length == 1) {
            $photo.find('.photo_name').html(mem + name);
        } else {
            var i = 1;
            $('.photo:visible').each(function () {
                $(this).find('.photo_name').html(mem + name + '-' + i);
                i++;
            });
        }
    }

    $('#cropper')
        .dialog(
            {
                autoOpen: false,
                width: 'auto',
                height: '500',
                resizable: false,
                modal: true,
                show: 'drop',
                hide: 'drop',
                title: '裁剪照片',
                buttons: [
                    {
                        html: "裁剪",
                        "class": "btn btn-default",
                        click: function () {
                            var imageData = $('#cropperImg')
                                .cropper('getImageData');
                            var hw = {};
                            console.log(imageData.naturalWidth);
                            if (imageData.naturalWidth > 2000) {
                                hw = {
                                    width: 1600,
                                    height: 1200
                                }
                            }
                            $('#cropperImg')
                                .cropper('getCroppedCanvas', hw)
                                .toBlob(
                                    function (blob) {
                                        var formData = new FormData();

                                        formData.append('croppedImage', blob);

                                        $
                                            .ajax(
                                                '../ImageUpLoadServer',
                                                {
                                                    method: "POST",
                                                    data: formData,
                                                    processData: false,
                                                    contentType: false,
                                                    dataType: 'json',
                                                    success: function (json) {
                                                        //TODO: 生成图片节点
                                                        //data-new="1"代表新节点。data-del="0"代表是否删除
                                                        var dom = $('<div data-new="1" data-del="0"  class="photo thumbnail col-lg-12" >'
                                                            + '<div class="load" style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50% ;">'
                                                            + '<img src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">'
                                                            + '</div>'
                                                            + '<img style="height: 200px" alt="" src=""  class="img" onload="imgLoadSuccess(this)" >'
                                                            + '<label class="photo_name"></label><a class="btn btn-default btn-xs" onclick="removeImg(this);">删除图片</a>'
                                                            + '<input type="text" class="photo_path" style="display: none;">'
                                                            + '</div>');
                                                        preImg = json.obj;
                                                        dom
                                                            .find(
                                                                '.img')
                                                            .prop(
                                                                'src',
                                                                encodeURI('../ImageDownLoadServer?path='
                                                                    + preImg
                                                                    + '&'
                                                                    + Math
                                                                        .random()));
                                                        dom
                                                            .find(
                                                                '.photo_path')
                                                            .val(
                                                                preImg);

                                                        $(
                                                            '#cropperImg')
                                                            .cropper(
                                                                'destroy');
                                                        $(
                                                            '#cropper')
                                                            .dialog(
                                                                'close');
                                                        $(
                                                            '#photo_area')
                                                            .append(
                                                                dom);

                                                        if (nowType == 'check') {
                                                            reSetPhotoName(nowDefect.defect_name);
                                                        } else if (nowType == 'user') {
                                                            reSetPhotoName(nowUserDefectName);
                                                        }
                                                    },
                                                    error: function (josn) {
                                                        $(
                                                            '#cropperImg')
                                                            .cropper(
                                                                'destroy');
                                                        $(
                                                            '#cropper')
                                                            .dialog(
                                                                'close');
                                                    }
                                                });
                                    });
                        }
                    }, {
                        html: "取消",
                        "class": "btn btn-default",
                        click: function () {
                            $('#cropperImg').cropper('destroy');
                            $('#cropper').dialog('close');

                        }
                    }]
            });

    //图片
    var preImg = "*";
    function imgUpLoad() {
        var imgName = $('#imgFile').val();
        if (imgName == "") {
            return;
        }
        var suff = suffix(imgName.toUpperCase());
        if (!(suff == ".JPG" || suff == ".PNG" || suff == ".BMP" || suff == ".JPEG")) {
            errMessage("请选择正确格式的图片文件！");
            return;
        }
        // 			$('#load').prop('hidden',false);
        // 			$('#img').on('mousedown',function(){
        // 				return false;
        // 			});
        $('#defectDialog').next('div').find('button').eq(0).prop('disabled',
            true);
        $('#defectDialog').next('div').find('button').eq(1).prop('disabled',
            true);

        var url;
        if (navigator.userAgent.indexOf("MSIE") >= 1) { // IE
            url = document.getElementById('imgFile').value;
        } else if (navigator.userAgent.indexOf("Firefox") > 0) { // Firefox
            url = window.URL
                .createObjectURL(document.getElementById('imgFile').files
                    .item(0));
        } else if (navigator.userAgent.indexOf("Chrome") > 0) { // Chrome
            url = window.URL
                .createObjectURL(document.getElementById('imgFile').files
                    .item(0));
        }
        document.getElementById('cropperImg').src = url;
        // 			$('#cropperImg').prop('src',encodeURI('../ImageDownLoadServer?path='+json.obj+'&'+Math.random()));
        $('#cropper').dialog('open');

        $('#cropperImg').cropper({
            aspectRatio: 8 / 6,
            viewMode: 1,
            dragMode: "move",
        });

    }

    function imgLoadSuccess(d) {
        // 			$('#load').prop('hidden','hidden');
        // 			$('#img').off('mousedown');
        $('#defectDialog').next('div').find('button').eq(0).prop('disabled',
            false);
        $('#defectDialog').next('div').find('button').eq(1).prop('disabled',
            false);
        $(d).closest('.photo').find('.load').hide();
        $('#imgFile').val('');
    }

    function suffix(file_name) {
        // 		    var result =/\.[^\.]+/.exec(file_name);
        return file_name.substring(file_name.lastIndexOf('.'));
    }

    function imgLoadSuccess2(d) {

        $(d).closest('.photo1').find('.load').hide();

    }


    /* ------------------------------------图片（ End ）------------------------------------------- */


    function releaseAdmin() {//管理员

    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户

    }
</script>
</body>
</html>