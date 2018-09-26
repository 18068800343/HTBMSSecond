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
            <li>关联</li>
            <li>部件-病害</li>
        </ol>
        <!-- end breadcrumb -->

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">
        <section id="widget-grid">
            <div class="row">


                <article class="col-sm-8 col-md-8 col-lg-8">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"
                         data-widget-editbutton="false"
                         data-widget-togglebutton="false"
                         data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-eye"></i> </span>
                            <h2>部件-病害</h2>

                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget content -->
                            <div class="widget-body">

                                <div class="widget-body-toolbar bg-color-white">

                                    <form class="form-inline" role="form">

                                        <div class="row">

                                            <div class="col-sm-12 col-md-10">

                                                <div class="form-group">
                                                    <label class="sr-only">执行标准</label>
                                                    <select class="form-control input-sm" id="sss"
                                                            onchange="initComponentItems()">
                                                        <option>桥梁检查记录</option>
                                                        <option>通道检查记录</option>
                                                        <option>涵洞检查记录</option>
                                                    </select>
                                                </div>

                                            </div>

                                            <div class="col-sm-12 col-md-2 text-align-right">

                                                <a onclick='editMbrDefectDef()' class="btn btn-warning btn-xs disabled">
                                                    修改
                                                </a>

                                            </div>

                                        </div>

                                    </form>

                                </div>

                                <div class="row">

                                    <!-- 部件列表 -->
                                    <div class="col-lg-4 col-md-12" style="height:400px; overflow-y: auto;"
                                         id="componentItems">

                                    </div>
                                    <!-- 关联表格 -->
                                    <div class="col-lg-8 col-md-12 pull-right" style="height:450px; overflow-y: auto;">
                                        <table id="dt_basic" class="table table-striped table-bordered table-hover"
                                               width="100%">
                                            <thead>
                                            <tr>
                                                <th class="col-sm-3 col-md-3"> 病害编号</th>
                                                <th class="col-sm-3 col-md-3"> 病害名称</th>
                                                <th class="col-sm-3 col-md-3"> 顺序</th>
                                            </tr>
                                            </thead>
                                        </table>
                                    </div>

                                </div>


                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

                    </div>
                    <!-- end widget -->

                </article>

            </div>
        </section>
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<div id="decom">
    <div class='row'>
        <div class="col-lg-6 col-md-12">
            <h6>病害字典</h6>
            <div class="dd" id="defectNestable" style="height:400px; overflow-y: auto;">
            </div>
        </div>
        <div class="col-lg-6 col-md-12">
            <h6>部件病害关联</h6>
            <div class="dd" id="componentDefectNestable" style="height:400px; overflow-y: auto;">
                <div class="dd-empty"></div>
            </div>
        </div>
    </div>
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

<script src="../js/plugin/jquery-nestable/jquery.nestable.min.js"></script>

<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<!-- PAGE RELATED PLUGIN(S) -->

<script type="text/javascript">
    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();
    });


    /*******************************************************开始病害关联*******************************************************/

    $(function () {
        $('#defectNestable').nestable({
            maxDepth: 1,
            group: 2,
            dragClass: 'dd-dragel'
        });
        $('#componentDefectNestable').nestable({
            maxDepth: 1,
            group: 2,
            dragClass: 'dd-dragel'
        });

        $('#decom').dialog({
            autoOpen: false,
            width: 800,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '关联部件和病害'
        });

        initComponentItems();
        initDefectOption();

    });


    var table = $('#dt_basic').DataTable({
        "sDom": "t" +
        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "bDestroy": true,
        "iDisplayLength": 10,
        "autoWidth": true,
        "bScrollCollapse": true,
        "sScrollY": 400,
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        },
        "columns": [
            {"data": "defect_f_id"},
            {"data": "defect_f_name"},
            {"data": "ratio"}
        ],
        "order": [[2, 'asc']],
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


    var componentItem = undefined;
    $('#componentItems').delegate('li', 'click', function () {
        /* alert($(this).attr('value')); */
        if (componentItem != undefined) {
            $(componentItem).css('background', '');
        }
        $(this).css('background', '#ccc');
        componentItem = this;
        buildDefectOption();
    });


    function editMbrDefectDef() {
        if (componentItem == undefined) {
            errMessage("请选部件");
            return;
        }
        $('#decom').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        saveMbrDefectDef();
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
        $('#decom').dialog("open");
    }

    //保存部件和病害的关系
    function saveMbrDefectDef() {
        var info = [];
        var i = 1;
        $('#componentDefectNestable').find('li').each(function () {
            var ss = {
                defect_f_id: $(this).attr('data-id'),
                ratio: i
            }
            info.push(ss);
            i++;
        });
        $.ajax({
            type: 'POST',
            url: '../DicCommonDefectServlet',
            dataType: 'json',
            data: {
                type: "saveMbrDefectDef",
                component_id: $(componentItem).attr('value'),
                info: JSON.stringify(info)
            },
            error: function (msg) {
                errMessage("请求DicCommonDefectServlet失败");
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
                        default:
                            break;
                    }
                } else {
                    //successMessage("保存成功");
                    $('#decom').dialog("close");
                    initMbrDefectDef();
                }
            }
        });
    }


    /*初始化初始化部件和病害关系*/
    function initMbrDefectDef() {
        $.ajax({
            type: 'POST',
            url: '../DicCommonDefectServlet',
            dataType: 'json',
            data: {
                type: "initMbrDefectDef",
                component_id: $(componentItem).attr('value')
            },
            error: function (msg) {
                errMessage("请求DicCommonDefectServlet失败");
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
                    $('#componentDefectNestable').empty();
                    $('#componentDefectNestable').append("<div class='dd-empty'></div>");
                    $('#dt_basic').dataTable().fnClearTable();
                } else {
                    $('#dt_basic').dataTable().fnClearTable();
                    $('#componentDefectNestable').empty();
                    var ol = $('<ol></ol>');
                    ol.addClass('dd-list');
                    var data = json.obj;
                    $('#dt_basic').DataTable().rows.add(data).draw(false);
                    for (var i = 0; i < data.length; i++) {

                        var li = $('<li></li>');
                        li.addClass('dd-item');
                        li.attr('data-id', data[i].defect_f_id);
                        var div = $('<div></div>');
                        div.css('background', '#f0ad4e');
                        div.addClass('dd-handle');
                        div.html(data[i].defect_f_name);
                        li.append(div);
                        ol.append(li);
                        $('#defectNestable').find("li[data-id=" + data[i].defect_f_id + "]").remove();
                    }
                    if ($('#defectNestable').find('li').length == 0) {
                        $('#defectNestable').append("<div class='dd-empty'></div>");
                    }
                    $('#componentDefectNestable').append(ol);
                }
            }
        });
    }

    var mm = {
        "2011评定梁式桥": "2011评定梁式桥",
        "2011评定板、肋、箱形、双曲拱桥": "2011评定板拱桥,2011评定肋拱桥,2011评定箱形拱桥,2011评定双曲拱桥",
        "2011评定刚、桁架拱桥": "2011评定刚架拱桥,2011评定桁架拱桥",
        "2011评定钢混组合拱桥": "2011评定钢混组合拱桥",
        "2011评定悬索桥": "2011评定悬索桥",
        "2011评定斜拉桥": "2011评定斜拉桥",
        "通道检查记录": "通道检查记录",
        "涵洞检查记录": "涵洞检查记录",
        "桥梁检查记录": "桥梁检查记录",
        "2004评定": "2004评定"
    }

    //初始化部件列表组
    function initComponentItems() {
        $.ajax({
            type: 'POST',
            url: '../DicCommonDefectServlet',
            dataType: 'json',
            data: {
                type: "initComponentItems",
                specification: mm[$('#sss').val()]
            },
            error: function (msg) {
                errMessage("请求DicCommonDefectServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("没有数据");
                            $('#componentItems').empty();
                            break;
                        case 2:
                            errMessage("服务器错误");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    $('#componentItems').empty();
                    var ul = $("<ul class='list-group'></ul>");
                    for (var i = 0; i < data.length; i++) {
                        var li = $("<li class='list-group-item'></li>");
                        li.html(data[i].component_name);
                        li.attr('value', data[i].component_id);
                        ul.append(li);
                    }
                    $('#componentItems').append(ul);
                    componentItem = undefined;
                }
            }
        });

    }


    var defectOption = [];
    function buildDefectOption() {
        $('#defectNestable').empty();
        var ol = $('<ol></ol>');
        ol.addClass('dd-list');
        for (var i = 0; i < defectOption.length; i++) {
            var li = $('<li></li>');
            li.addClass('dd-item');
            li.attr('data-id', defectOption[i].defect_f_id);
            var div = $('<div></div>');
            div.css('background', '#f0ad4e');
            div.addClass('dd-handle');
            div.html(defectOption[i].defect_f_name);
            li.append(div);
            ol.append(li);
        }
        $('#defectNestable').append(ol);
        initMbrDefectDef();
    }
    //初始化病害字典
    function initDefectOption() {
        $.ajax({
            type: 'POST',
            url: '../DicCommonDefectServlet',
            dataType: 'json',
            data: {
                type: "initDefectOption"
            },
            error: function (msg) {
                errMessage("请求DicCommonDefectServlet失败");
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
                    defectOption = json.obj;
                }
            }
        });
    }


    /*******************************************************结束病害关联*******************************************************/







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
        $('.widget-body-toolbar a').removeClass('disabled');
    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
        $('.widget-body-toolbar a').removeClass('disabled');
		}
	
	}


</script>

</body>
</html>