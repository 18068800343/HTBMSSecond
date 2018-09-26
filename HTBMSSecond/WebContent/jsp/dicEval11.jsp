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

        .tree-second:hover {
            background-color: #ccc;
            cursor: pointer;
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

                <!-- NEW WIDGET START -->
                <article class="col-sm-12 col-md-12 col-lg-12">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"
                         data-widget-editbutton="false"
                         data-widget-togglebutton="false"
                         data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-eye"></i> </span>
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
                            <div class="widget-body no-padding">

                                <div class="widget-body-toolbar bg-color-white">

                                    <div class="row col-sm-12 col-md-12">
                                        <div class="pull-left col-xs-3"><input class="form-control" id="searchData"
                                                                               value="" placeholder="搜索" type="text">
                                        </div>
                                        <a class="btn btn-primary pull-right disabled" onclick='addIndexSet()'>增加</a>
                                    </div>

                                </div>

                                <table id="dt_basic"
                                       class="display projects-table table table-striped table-bordered table-hover"
                                       cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>编号</th>
                                        <th>指标集</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                </table>

                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

                    </div>
                    <!-- end widget -->

                </article>
                <!-- WIDGET END -->

            </div>
        </section>
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->
<div id="indexMain" class='opera' hidden='hidden'>
    <form>
        <fieldset>
            <div class="form-group">
                <label>编号</label>
                <input class="form-control" id="indexset_id" value="" placeholder="编号" type="text">
            </div>
            <div class="form-group">
                <label>指标集</label>
                <input class="form-control" id="indexset_name" value="" placeholder="指标集" type="text">
            </div>
        </fieldset>
    </form>
</div>

<div id="index" class='opera' hidden='hidden'>
    <form>
        <fieldset>
            <div class="form-group">
                <label>编码（唯一）</label>
                <input class="form-control" id="index_id" value="" placeholder="编码（唯一）" type="text">
            </div>
            <div class="form-group">
                <label>编号</label>
                <input class="form-control" id="index_no" value="" placeholder="编号" type="text">
            </div>
            <div class="form-group">
                <label>指标</label>
                <input class="form-control" id="index_name" value="" placeholder="指标" type="text">
            </div>
            <div class="form-group">
                <label>标度范围（标度：标度标准，中间以逗号分隔）</label>
                <input class="form-control" id="index_scale" value="" placeholder="标度" type="text">
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

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
<script src="../js/myTool.js"></script>

<script type="text/javascript">
    var dom = undefined;
    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();
        initTable();
    });

    $('#indexMain').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    $('#index').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });


    $('#dt_basic').delegate('.edit2', 'click', function () {
        dom = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(dom);
        var qq = this;
        var data = table.row(dom).data();
        var index_id = $(qq).closest('tr').children('td').eq(0).html();
        var info = undefined;
        var i;
        for (var i = 0; i < data.indexs.length; i++) {
            if (data.indexs[i].index_id == index_id) {
                info = data.indexs[i];
                break;
            }
        }
        $("#index_id").val(info.index_id);
        $("#index_no").val(info.index_no);
        $("#index_name").val(info.index_name);
        $("#index_scale").val(info.index_scale);
        var old_id = info.index_id;
        $('#index').dialog({
            title: "修改指标",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        info.indexset_id = data.indexset_id;
                        info.index_id = $("#index_id").val();
                        info.index_no = $("#index_no").val();
                        info.index_name = $("#index_name").val();
                        info.index_scale = $("#index_scale").val();
                        if (info.index_id == '' || info.index_name == '' || info.index_scale == '' || info.index_no == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicEval11Servlet',
                            dataType: 'json',
                            data: {
                                type: "editIndex",
                                info: JSON.stringify(info),
                                old_id: old_id
                            },
                            error: function (msg) {
                                errMessage("请求DicEval11Servlet失败");
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
                                    data.indexs[i] = info;
                                    table.row(dom).data(data).draw(false);
                                    row.child(format(data)).show();
                                    $('#index').dialog("close");
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
                }
            ]
        });
        $('#index').dialog('open');
    });


    $('#dt_basic').delegate('.del2', 'click', function () {
        dom = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(dom);
        var qq = this;
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var data = table.row(dom).data();
                var index_id = $(qq).closest('tr').children('td').eq(0).html();
                $.ajax({
                    type: 'POST',
                    url: '../DicEval11Servlet',
                    dataType: 'json',
                    data: {
                        type: "delIndex",
                        index_id: index_id
                    },
                    error: function (msg) {
                        errMessage("请求DicEval11Servlet失败");
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
                            for (var i = 0; i < data.indexs.length; i++) {
                                if (data.indexs[i].index_id == index_id) {
                                    data.indexs.splice(i, 1);
                                    break;
                                }
                            }
                            table.row(dom).data(data).draw(false);
                            row.child(format(data)).show();
                        }
                    }
                });
            }
        });
    });


    $('#dt_basic').delegate('.add', 'click', function () {
        dom = $(this).closest('tr');
        var data = table.row(dom).data();
        row = table.row(dom);
        $("#index_id").val("");
        $("#index_no").val("");
        $("#index_name").val("");
        $("#index_scale").val("");
        $('#index').dialog({
            title: "增加指标",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            index_id: $("#index_id").val(),
                            index_no: $("#index_no").val(),
                            index_name: $("#index_name").val(),
                            index_scale: $("#index_scale").val(),
                            indexset_id: data.indexset_id
                        }
                        if (info.index_id == '' || info.index_name == '' || info.index_scale == '' || info.index_no == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicEval11Servlet',
                            dataType: 'json',
                            data: {
                                type: "addIndex",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicEval11Servlet失败");
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
                                            errMessage("编号或者名称重复");
                                            break;
                                        default:
                                            break;
                                    }
                                } else {
                                    //successMessage("保存成功");
                                    data.indexs.push(info);
                                    table.row(dom).data(data).draw(false);
                                    row.child(format(data)).show();
                                    $('#index').dialog("close");
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
                }
            ]
        });
        $('#index').dialog('open');
    });


    $('#dt_basic').delegate('.edit', 'click', function () {
        dom = $(this).closest('tr');
        var data = table.row(dom).data();
        row = table.row(dom);

        $('#indexset_id').val(data.indexset_id);
        $('#indexset_name').val(data.indexset_name);
        var old_id = data.indexset_id;
        var old_name = data.indexset_name;
        $('#indexMain').dialog({
            title: "修改指标集",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            indexset_id: $('#indexset_id').val(),
                            indexset_name: $('#indexset_name').val()
                        }
                        if (info.indexset_id == '' || info.indexset_name == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        if (info.indexset_id == old_id && info.indexset_name == old_name) {
                            $('#indexMain').dialog("close");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicEval11Servlet',
                            dataType: 'json',
                            data: {
                                type: "editIndexSet",
                                info: JSON.stringify(info),
                                old_id: old_id,
                                old_name: old_name
                            },
                            error: function (msg) {
                                errMessage("请求DicEval11Servlet失败");
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
                                    data.indexset_id = info.indexset_id;
                                    data.indexset_name = info.indexset_name;
                                    table.row(dom).data(data).draw(false);
                                    $('#indexMain').dialog("close");
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
                }
            ]
        });
        $('#indexMain').dialog('open');
    });


    $('#dt_basic').delegate('.del', 'click', function () {
        dom = $(this).closest('tr');
        var data = table.row(dom).data();
        row = table.row(dom);
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../DicEval11Servlet',
                    dataType: 'json',
                    data: {
                        type: "delIndexSet",
                        indexset_id: data.indexset_id
                    },
                    error: function (msg) {
                        errMessage("请求DicEval11Servlet失败");
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
                            table.row(dom).remove().draw(false);
                        }
                    }
                });
            }
        });
    });

    function addIndexSet() {
        $('#indexset_id').val('');
        $('#indexset_name').val('');
        $('#indexMain').dialog({
            title: "添加指标集",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            indexset_id: $('#indexset_id').val(),
                            indexset_name: $('#indexset_name').val()
                        }
                        if (info.indexset_id == '' || info.indexset_name == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicEval11Servlet',
                            dataType: 'json',
                            data: {
                                type: "addIndexSet",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicEval11Servlet失败");
                            },
                            success: function (json) {
                                if (json.success == "fail") {
                                    switch (json.error) {
                                        case 1:
                                            //successMessage("保存失败");
                                            break;
                                        case 2:
                                            errMessage("服务器错误");
                                            break;
                                        case 3:
                                            errMessage("编号或者名称重复");
                                            break;
                                        default:
                                            break;
                                    }
                                } else {
                                    //successMessage("保存成功");
                                    info.indexs = [];
                                    table.row.add(info).draw(false);
                                    $('#indexMain').dialog("close");
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
                }
            ]
        });
        $('#indexMain').dialog('open');
    }


    //初始化表格数据
    function initTable() {
        myTool.mask.show('读取中...');
        $.ajax({
            type: 'POST',
            url: '../DicEval11Servlet',
            dataType: 'json',
            data: {
                type: "initTable"
            },
            error: function (msg) {
                errMessage("请求DicEval11Servlet失败");
                myTool.mask.hide();
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("没有数据！");
                            break;
                        case 2:
                            errMessage("服务器错误！");
                            break;
                        case 3:
                            errMessage("");
                            break;
                        default:
                            break;
                    }
                    $('#dt_basic').dataTable().fnClearTable();
                } else {
                    $('#dt_basic').dataTable().fnClearTable();
                    var indexsSet = json.obj;
                    table.rows.add(indexsSet).draw(false);
                }
                myTool.mask.hide();
            }
        });
    }


    var editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='edit btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
    var table = $('#dt_basic').DataTable({
        "deferRender": true,
        "processing": true,
        "sDom": "t" +
        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "bDestroy": true,
        "iDisplayLength": 10,
        "autoWidth": false,
        "bScrollCollapse": true,
        "sScrollY": 400,
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        },
        "columns": [
            {
                "class": 'details-control',
                "orderable": false,
                "data": null,
                "defaultContent": ''
            },
            {"data": "indexset_id"},
            {"data": "indexset_name"},
            {"data": null},
        ],
        "columnDefs": [
            {
                "targets": 3,
                "searchable": false,
                "render": function (data, type, full) {
                    return editDel;
                }
            }],
        "order": [[1, 'asc']],
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
    var tr = undefined;
    var row = undefined;
    $('#dt_basic tbody').on('click', 'td.details-control', function () {
        tr = $(this).closest('tr');
        row = table.row(tr);
        dom = $(this).parents('tr');

        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    });

    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
    });


    var editDel2 = "<button class='edit2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-trash'></i></button>"
    function format(d) {
        var html = "";
        if (d != undefined) {
            for (var i = 0; i < d.indexs.length; i++) {
                html = html + "<tr><td>" + d.indexs[i].index_id + "</td><td>" + d.indexs[i].index_no + "</td><td>" + d.indexs[i].index_name + "</td><td>" + d.indexs[i].index_scale + "</td><td style='width: 70px'>" + editDel2 + "</td></tr>";
            }
        }

        return '<div style="margin:10px"><table class="table table-striped table-bordered table-hover table-condensed text-align-center">' +
            "<thead><tr><th>编码</th><th> 编号</th><th> 指标</th><th>标度</th><th>操作</th></tr></thead><tbody>" +
            html +
            '</tbody></table></div>';
    }


    /************************提示信息******************************************************************************/
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
        editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' ><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='edit btn btn-warning btn-xs' ><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' ><span class='glyphicon glyphicon-trash'></span></button></div>";
        editDel2 = "<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>"
        $('.widget-body-toolbar').find('a').removeClass('disabled');
    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
        editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' ><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='edit btn btn-warning btn-xs' ><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' ><span class='glyphicon glyphicon-trash'></span></button></div>";
        editDel2 = "<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>"
        $('.widget-body-toolbar').find('a').removeClass('disabled');
		}
	
	}
</script>

</body>
</html>