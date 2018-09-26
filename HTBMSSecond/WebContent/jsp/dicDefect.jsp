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
            <li>病害</li>
            <li>病害字典</li>
        </ol>
        <!-- end breadcrumb -->

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">
        <section id="widget-grid"><!-- widget grid -->
            <!-- row -->
            <div class="row">

                <!-- SINGLE GRID -->
                <article id="tree_view" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"
                         data-widget-editbutton="false"
                         data-widget-togglebutton="false"
                         data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-road"></i> </span>
                            <h2>病害字典 </h2>

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


                                    <div class="row">

                                        <div class="col-sm-12 col-md-12 ">
                                            <div class="pull-left col-xs-3"><input class="form-control" id="searchData"
                                                                                   value="" placeholder="搜索"
                                                                                   type="text"></div>
                                            <button class="btn btn-primary pull-right" onclick="addDefect_f()" disabled>
                                                增加
                                            </button>

                                        </div>

                                    </div>
                                </div>
                                <table id="dt_basic" class="table table-striped table-bordered table-hover"
                                       style="width: 100%">
                                    <thead>
                                    <tr>
                                        <th class="col-xs-2"></th>
                                        <th class="col-xs-3">编号</th>
                                        <th class="col-xs-3">名称</th>
                                        <th class="col-xs-4">操作</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>

                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

                    </div>
                    <!-- end widget -->

                </article><!-- END GRID -->
            </div><!-- end row -->
        </section><!-- end widget grid -->
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<div id="defectDia_f" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>编号</label>
                <input class="form-control" id="defect_f_id" value="" placeholder="编号" type="text">
            </div>

            <div class="form-group">
                <label>分类</label>
                <input class="form-control" id="defect_f_name" value="" placeholder="名称" type="text">
            </div>
        </fieldset>
    </form>
</div>

<div id="defectDia" hidden="hidden" class="row">
    <form class="col-xs-4">
        <fieldset>
            <div class="form-group">
                <label>编号</label>
                <input class="form-control" id="defect_id" value="" placeholder="编号" type="text">
            </div>

            <div class="form-group">
                <label>名称</label>
                <input class="form-control" id="defect_name" value="" placeholder="名称" type="text">
            </div>
            <div class="form-group">
                <label>属性</label>
                <input class="form-control tagsinput" id="defect_attr" value="" data-role="tagsinput">
            </div>
        </fieldset>
    </form>
    <form class="col-xs-8">
        <fieldset>
            <div class="form-group col-xs-12 well" id="template" style="padding: 5px 10px;">
                <label class=" col-xs-3" style="padding: 0 10px 0 0;">
                    <select class="form-control">
                    </select>
                </label>
                <label class=" col-xs-3" style="padding: 0 10px 0 0;">
                    <select class="form-control">
                        <option>数字</option>
                        <option>字符串</option>
                        <option>时间</option>
                    </select>
                </label>
                <label class=" col-xs-6" style="padding: 0 0 0 0;">
                    <input type="text" class="form-control" placeholder="变量定义">
                </label>
                <label class=" col-xs-6" style="padding: 0 10px 0 0;">
                    <input type="text" class="form-control" placeholder="计算公式">
                </label>
                <label class=" col-xs-2">
                    <input type="checkbox" class="checkbox style-0">
                    <span>存储</span>
                </label>
                <label class="col-xs-4" hidden="hidden" id="ad">
                    <a class="btn btn-default" onclick="adOperation()">增加变量</a>
                </label>
                <label class="col-xs-4" hidden="hidden" id="ed">
                    <a class="btn btn-default" onclick="edOperation()">修改变量</a>
                    <a class="btn btn-default" onclick="setTemplate()">取消</a>
                </label>
            </div>
            <div class="form-group" style="width: 100%;clear: both;">
                <label>变量定义</label>
                <div style="overflow:auto;max-height: 170px;">
                    <table class="table table-striped table-bordered table-hover " id="defect_template">
                        <thead>
                        <tr>
                            <th>变量</th>
                            <th>类型</th>
                            <th>定义</th>
                            <th>计算</th>
                            <th>存储</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
            <div class="form-group">
                <label>缺损位置</label>
                <input class="form-control" id="defect_loc_def" value="" placeholder="位置描述定义" type="text">
            </div>
            <div class="form-group">
                <label>缺损状况</label>
                <input class="form-control" id="defect_def" value="" placeholder="定量描述定义" type="text">
            </div>
            <div class="form-group" id="countBuild">
                <label>统计类型（用于报告概述的统计）</label><i class="fa fa-question-circle"
                                                 title="选择需要统计的类型，选择统计变量或定义计算公式（需从缺损状况中使用的变量中选择，如f*g）,统计单位可为 cm、mm、m^2、个、处等"></i>
                <div class="form-group col-xs-12 well" style="padding: 5px 5px;">
                    <label class="col-xs-12">当前可用变量<strong id="canUse" style="font-size: 14px;"></strong></label>
                    <label class=" col-xs-3" style="padding: 0 10px 0 0;">
                        <select class="form-control">
                            <option>累计值</option>
                            <option>最大值</option>
                            <option>最小值</option>
                            <option>条件</option>
                        </select>
                    </label>
                    <label class=" col-xs-3" style="padding: 0 10px 0 0;">
                        <select class="form-control">
                        </select>
                    </label>
                    <label class=" col-xs-6" style="padding: 0 10px 0 0;">
                        <input type="text" class="form-control" placeholder="要统计变量或计算公式">
                    </label>
                    <label class=" col-xs-3" style="padding: 0 0 0 0;">
                        <select class="form-control">
                            <option>小于</option>
                            <option>大于等于</option>
                            <option>大于</option>
                            <option>小于等于</option>
                        </select>
                    </label>
                    <label class=" col-xs-3" style="padding: 0 10px 0 0;">
                        <input type="text" class="form-control" placeholder="条件值（仅选择条件可用）">
                    </label>
                    <label class="col-xs-4" id="ad2" style="display: none;">
                        <a class="btn btn-default" onclick="addCount()">增加</a>
                    </label>
                    <label class="col-xs-4" id="ed2" style="display: none;">
                        <a class="btn btn-default" onclick="editCount()">修改</a>
                        <a class="btn btn-default" onclick="setCount()">取消</a>
                    </label>
                    <div class="form-group col-xs-12" style="clear: both;padding: 0;">
                        <div style="overflow:auto;max-height: 170px;">
                            <table class="table table-striped table-bordered table-hover " id="countTable">
                                <thead>
                                <tr>
                                    <th>统计类型</th>
                                    <th>统计定义</th>
                                    <th>变量或公式</th>
                                    <th>运算符</th>
                                    <th>条件值</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="form-group" style="clear: both;">
                        <label>概述描述</label><i class="fa fa-question-circle"
                                              title="描述定义，示例 {A}条竖向裂缝，其中{A:C}条缝宽<0.15mm，总长{B:C}m；{A:D}条缝宽≥0.15mm，总长{B:D}m。  其中{A:C}代表A在条件C下的统计结果"></i>
                        <input class="form-control" id="defect_summary" value="" placeholder="概述描述定义" type="text">
                    </div>
                </div>
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

<script src="../js/plugin/bootstrap-tags/bootstrap-tagsinput.min.js"></script>
<!-- PAGE RELATED PLUGIN(S) -->
<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>


<script type="text/javascript">

    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();


        initTable();
    });

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
            {"data": "defect_f_id"},
            {"data": "defect_f_name"},
            {
                "orderable": false,
                "data": null
            },
            {"data": null, "visible": false}
        ],
        "order": [[1, 'asc']],
        "columnDefs": [{
            "targets": 3,
            "searchable": false,
            "render": function (data, type, full) {
                return editDel;
            }
        }],
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
    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
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


    function format(d) {
        var html = "";
        if (d != undefined) {
            for (var i = 0; i < d.defects.length; i++) {
                html = html + "<tr><td>" + d.defects[i].defect_id + "</td><td>" + d.defects[i].defect_name + "</td><td>" + d.defects[i].defect_loc_def + "</td><td>" + d.defects[i].defect_def + "</td><td>" + d.defects[i].defect_attr + "</td><td>" + editDel2 + "</td></tr>";
            }
        }
        return '<div style="margin:10px;"><table class="table table-striped table-bordered table-hover table-condensed text-align-center">' +
            "<thead><tr><th>编号</th><th>名称</th><th>缺损位置</th><th>缺损状况</th><th>附加信息</th><th> 操作</th></tr></thead><tbody>" +
            html +
            '</tbody></table></div>';
    }

    var tableData = {
        defect_f_id: undefined,
        defect_f_name: undefined,
        defects: []
    }
    var defect = {
        defect_id: undefined,
        defect_name: undefined,
        defect_loc_def: undefined,
        defect_def: undefined
    }
    var dom = undefined;

    /* 			$(function(){

     //绑定双击事件
     $('#dt_basic').delegate('tr','dblclick', function () {
     $(this).find("button[class*='edit']").click();
     } );
     }); */
    /*初始化表格*/
    function initTable() {
        $.ajax({
            type: 'POST',
            url: '../DicDefectServlet',
            dataType: 'json',
            data: {
                type: "initTable"
            },
            error: function (msg) {
                errMessage("请求DicDefectServlet失败");
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
                    $('#dt_basic').dataTable().fnClearTable();
                } else {
                    $('#dt_basic').dataTable().fnClearTable();
                    var data = json.obj;
                    table.rows.add(data).draw(false);
                }
            }
        });
    }


    $('#defectDia').dialog({
        autoOpen: false,
        width: 900,
        maxHeight: 650,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });
    $('#defectDia').prop('hidden', false);

    $('#defectDia_f').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });


    function buildAttr(de) {
        $('#defect_attr').tagsinput('removeAll');
        console.log(de);
        $('#defect_attr').tagsinput('add', de);
    }

    function getAttr() {
        var s = $('#defect_attr').val();
        return s;
    }


    //模板操作
    function getTemplate() {
        var template = {
            variable: undefined,
            describe: undefined,
            calculate: undefined,
            save: undefined,
            type: undefined
        }
        var save = $('#template input').eq(2).prop('checked');
        if (save == true) {
            template.save = 1;
        } else {
            template.save = 0;
        }
        template.calculate = $('#template input').eq(1).val();
        template.describe = $('#template input').eq(0).val();
        template.variable = $('#template select').eq(0).val();
        template.type = $('#template select').eq(1).val();
        return template;
    }
    function getDefTemplate() {
        var ts = [];
        $('#defect_template tbody').children('tr').each(function () {
            var template = {
                variable: undefined,
                describe: undefined,
                calculate: undefined,
                save: undefined,
                type: undefined
            }
            template.save = formateSave($(this).children('td').eq(4).html());
            template.calculate = $(this).children('td').eq(3).html();
            template.describe = $(this).children('td').eq(2).html();
            template.type = $(this).children('td').eq(1).html();
            template.variable = $(this).children('td').eq(0).html();
            ts.push(template);
        });
        return ts;
    }
    function setDefTemplate(d) {
        $('#defect_template tbody').empty();
        for (var i = 0; i < d.length; i++) {
            addDefTemplate(d[i]);
        }
    }
    function addDefTemplate(d) {
        $('#defect_template tbody').append("<tr><td>" + d.variable + "</td><td>" + d.type + "</td><td>" + d.describe + "</td><td>" + d.calculate + "</td><td>" + formateSave(d.save) + "</td><td><a class='edit btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></a>&nbsp;<a class='del btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></a></td></tr>");
    }
    function setTemplate(d) {
        var variable = $('#template select').eq(0);
        var type = $('#template select').eq(1);
        var describe = $('#template input').eq(0);
        var calculate = $('#template input').eq(1);
        var save = $('#template input').eq(2);

        if (d != undefined) {
            describe.val(d.describe);
            calculate.val(d.calculate);
            if (d.save == "是") {
                save.prop("checked", true);
            } else {
                save.prop("checked", false);
            }

            variable.empty();
            variable.append("<option>" + d.variable + "</option>");
            type.val(d.type);
            $('#ed').prop('hidden', false);
            $("#ad").prop('hidden', 'hidden');
        } else {
            variable.empty();
            for (var i = 97; i <= 122; i++) {
                variable.append("<option>" + String.fromCharCode(i) + "</option>");
            }
            describe.val("");
            calculate.val("");
            save.prop("checked", false);
            $("#ed").prop('hidden', 'hidden');
            $("#ad").prop('hidden', false);
        }
    }


    function adOperation() {
        var template = getTemplate();
        if (checkVariable(template.variable)) {
            errMessage("变量不可重复！");
            return;
        }
        addDefTemplate(template);
    }
    function edOperation() {
        var template = getTemplate();
        $('#defect_template tbody').children('tr').each(function () {
            if ($(this).children('td').eq(0).html() == template.variable) {
                $(this).children('td').eq(4).html(formateSave(template.save));
                $(this).children('td').eq(3).html(template.calculate);
                $(this).children('td').eq(2).html(template.describe);
                $(this).children('td').eq(1).html(template.type);
            }
            return;
        });
        setTemplate();
    }


    function formateSave(d) {
        if (d == "是") {
            return 1;
        }
        if (d == "否") {
            return 0;
        }
        if (d == "1") {
            return "是";
        }
        if (d == "0") {
            return "否";
        }
    }

    $('#defect_template').delegate('.edit', 'click', function () {
        var template = {
            variable: undefined,
            describe: undefined,
            calculate: undefined,
            save: undefined,
            type: undefined
        }
        template.save = $(this).closest('tr').children('td').eq(4).html();
        template.calculate = $(this).closest('tr').children('td').eq(3).html();
        template.describe = $(this).closest('tr').children('td').eq(2).html();
        template.type = $(this).closest('tr').children('td').eq(1).html();
        template.variable = $(this).closest('tr').children('td').eq(0).html();
        setTemplate(template);
    });

    $('#defect_template').delegate('.del', 'click', function () {
        var qq = this;
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $(qq).closest('tr').remove();
            }
        });
    });


    function checkVariable(d) {
        var flag = false;
        $('#defect_template tbody').children('tr').each(function () {
            if ($(this).children('td').eq(0).html() == d) {
                flag = true;
                return false;
            }
        });
        return flag;
    }


    function addDefect_f() {
        $('#defect_f_id').val('');
        $('#defect_f_name').val('');
        $('#defect_f_id').prop('readonly', false);
        $('#defectDia_f').dialog({
            title: "增加病害分类",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            defect_f_id: $('#defect_f_id').val(),
                            defect_f_name: $('#defect_f_name').val()
                        }
                        if (info.defect_f_id == '' || info.defect_f_name == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicDefectServlet',
                            dataType: 'json',
                            data: {
                                type: "addDefect_f",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicDefectServlet失败");
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
                                    info.defects = [];
                                    table.row.add(info).draw(false);
                                    $('#defectDia_f').dialog("close");
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
        $('#defectDia_f').dialog('open');
    }


    $('#dt_basic').delegate('.del', 'click', function () {
        dom = $(this).closest('tr');
        var data = table.row(dom).data();
        tr = $(this).closest('tr');
        row = table.row(tr);
        var info = {
            defect_f_id: data.defect_f_id,
            defect_f_name: data.defect_f_name
        }
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../DicDefectServlet',
                    dataType: 'json',
                    data: {
                        type: "delDefect_f",
                        info: JSON.stringify(info)
                    },
                    error: function (msg) {
                        errMessage("请求DicDefectServlet失败");
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

    $('#dt_basic').delegate('.edit', 'click', function () {
        dom = $(this).closest('tr');
        var data = table.row(dom).data();
        tr = $(this).closest('tr');
        row = table.row(tr);

        $('#defect_f_id').val(data.defect_f_id);
        $('#defect_f_name').val(data.defect_f_name);
        var old_id = data.defect_f_id;
        var old_name = data.defect_f_name;
        $('#defectDia_f').dialog({
            title: "修改病害分类",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            defect_f_id: $('#defect_f_id').val(),
                            defect_f_name: $('#defect_f_name').val()
                        }
                        if (info.defect_f_id == '' || info.defect_f_name == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        if (info.defect_f_id == old_id && info.defect_f_name == old_name) {
                            $('#defectDia_f').dialog("close");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicDefectServlet',
                            dataType: 'json',
                            data: {
                                type: "editDefect_f",
                                info: JSON.stringify(info),
                                old_id: old_id,
                                old_name: old_name
                            },
                            error: function (msg) {
                                errMessage("请求DicDefectServlet失败");
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
                                    data.defect_f_id = info.defect_f_id;
                                    data.defect_f_name = info.defect_f_name;
                                    table.row(dom).data(data).draw(false);
                                    $('#defectDia_f').dialog("close");
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
        $('#defectDia_f').dialog('open');
    });


    $('#dt_basic').delegate('.add', 'click', function () {
        dom = $(this).closest('tr');
        var data = table.row(dom).data();
        tr = $(this).closest('tr');
        row = table.row(tr);
        setTemplate();
        $("#defect_id").val("");
        $("#defect_name").val("");
        $("#defect_loc_def").val("");
        $("#defect_def").val("");
        $("#defect_id").prop('readonly', false);
        setTemplate();
        buildAttr("");
        setDefTemplate([]);
        setCanUseValuable();
        setCount();
        setCountTable('[]');
        $('#defectDia').dialog({
            title: "增加病害名称",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            defect_id: $("#defect_id").val(),
                            defect_name: $("#defect_name").val(),
                            defect_loc_def: $("#defect_loc_def").val(),
                            defect_def: $("#defect_def").val(),
                            defect_f_id: data.defect_f_id,
                            defect_attr: getAttr(),
                            defect_template: JSON.stringify(getDefTemplate()),
                            defect_statistics: JSON.stringify(getCountAll()),
                            defect_summary: $('#defect_summary').val()
                        }
                        if (info.defect_id == '' || info.defect_name == '' || info.defect_loc_def == '' || info.defect_def == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicDefectServlet',
                            dataType: 'json',
                            data: {
                                type: "addDefect",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicDefectServlet失败");
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
                                    data.defects.push(info);
                                    table.row(dom).data(data).draw(false);
                                    row.child(format(data)).show();
                                    $('#defectDia').dialog("close");
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
        $('#defectDia').dialog('open');
    });


    $('#dt_basic').delegate('.del2', 'click', function () {
        dom = $(this).closest('table').closest('tr').prev('tr');
        tr = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(tr);
        var qq = this;
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var data = table.row(dom).data();
                var defect_id = $(qq).closest('tr').children('td').eq(0).html();
                $.ajax({
                    type: 'POST',
                    url: '../DicDefectServlet',
                    dataType: 'json',
                    data: {
                        type: "delDefect",
                        defect_id: defect_id
                    },
                    error: function (msg) {
                        errMessage("请求DicDefectServlet失败");
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
                            for (var i = 0; i < data.defects.length; i++) {
                                if (data.defects[i].defect_id == defect_id) {
                                    data.defects.splice(i, 1);
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


    $('#dt_basic').delegate('.edit2', 'click', function () {
        dom = $(this).closest('table').closest('tr').prev('tr');
        tr = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(tr);
        var qq = this;
        var data = table.row(dom).data();
        var defect_id = $(qq).closest('tr').children('td').eq(0).html();
        var info = undefined;
        var i;
        for (var i = 0; i < data.defects.length; i++) {
            if (data.defects[i].defect_id == defect_id) {
                info = data.defects[i];
                break;
            }
        }
        $("#defect_id").val(info.defect_id);
        $("#defect_name").val(info.defect_name);
        $("#defect_loc_def").val(info.defect_loc_def);
        $("#defect_def").val(info.defect_def);
        $("#defect_summary").val(info.defect_summary);
        buildAttr(info.defect_attr);
        setDefTemplate(JSON.parse(info.defect_template));
        setCountTable(info.defect_statistics);
        setTemplate();
        setCanUseValuable();
        setCount();
        var old_id = info.defect_id;
        $('#defectDia').dialog({
            title: "修改病害名称",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        info.defect_f_id = data.defect_f_id;
                        info.defect_id = $("#defect_id").val();
                        info.defect_name = $("#defect_name").val();
                        info.defect_loc_def = $("#defect_loc_def").val();
                        info.defect_def = $("#defect_def").val();
                        info.defect_attr = getAttr();
                        info.defect_template = JSON.stringify(getDefTemplate());
                        info.defect_statistics = JSON.stringify(getCountAll());
                        info.defect_summary = $("#defect_summary").val();
                        if (info.defect_id == '' || info.defect_name == '' || info.defect_loc_def == '' || info.defect_def == '') {
                            errMessage("请确认数据完整性！");
                            return;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicDefectServlet',
                            dataType: 'json',
                            data: {
                                type: "editDefect",
                                info: JSON.stringify(info),
                                old_id: old_id
                            },
                            error: function (msg) {
                                errMessage("请求DicDefectServlet失败");
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
                                    data.defects[i] = info;
                                    table.row(dom).data(data).draw(false);
                                    row.child(format(data)).show();
                                    $('#defectDia').dialog("close");
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
        $('#defectDia').dialog('open');
    });


    function dialogDefectOperation(op) {
        $('#defectDia').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        editDefect();
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
        var dd = $(dom).find('td');
        var title;
        if (op == "edit") {
            title = "修改数据"
            $("#defect_id").val(dd.eq(0).html());
            $("#defect_name").val(dd.eq(1).html());
            $("#defect_loc_def").val(dd.eq(2).html());
            $("#defect_def").val(dd.eq(3).html());
            $("#defect_id").prop('readonly', 'readonly');
        }
        if (op == "del") {
            title = "修改数据"
            $("#defect_id").val(dd.eq(0).html());
            $("#defect_name").val(dd.eq(1).html());
            $("#defect_loc_def").val(dd.eq(2).html());
            $("#defect_def").val(dd.eq(3).html());
            $("#defect_id").prop('readonly', 'readonly');
            deleteDefect();
            return false;
        }

        if (op == "add") {
            title = "增加数据";
            $("#defect_id").val("");
            $("#defect_name").val("");
            $("#defect_loc_def").val("");
            $("#defect_def").val("");
            $("#defect_id").prop('readonly', false);
            $('#defectDia').dialog({
                buttons: [
                    {
                        html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                        "class": "btn btn-default",
                        click: function () {
                            newDefect();
                        }
                    },
                    {
                        html: "<i class='fa fa-trash-o'></i>&nbsp; 重置",
                        "class": "btn btn-default",
                        click: function () {
                            $("#defect_id").val("");
                            $("#defect_name").val("");
                            $("#defect_loc_def").val("");
                            $("#defect_def").val("");
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
        }

        $('#defectDia').dialog({
            title: title
        });
        $('#defectDia').dialog("open");
    }


    function editDefect() {
        var info = {
            defect_id: $("#defect_id").val(),
            defect_name: $("#defect_name").val(),
            defect_loc_def: $("#defect_loc_def").val(),
            defect_def: $("#defect_def").val(),
        }
        if (info.highway_name == "" || info.highway_level == "") {
            errMessage("不可为空");
        } else {
            $.ajax({
                type: 'POST',
                url: '../DicDefectServlet',
                dataType: 'json',
                data: {
                    type: "editDefect",
                    info: JSON.stringify(info)
                },
                error: function (msg) {
                    errMessage("请求DicDefectServlet失败");
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
                        $('#dt_basic').DataTable().row(dom).data([info.defect_id, info.defect_name, info.defect_loc_def, info.defect_def]);
                        $('#defectDia').dialog("close");
                    }
                }
            });
        }
    }


    function deleteDefect() {
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗?",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../DicDefectServlet',
                    dataType: 'json',
                    data: {
                        type: "deleteDefect",
                        defect_id: $('#defect_id').val()
                    },
                    error: function (msg) {
                        errMessage("请求DicDefectServlet失败");
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
                            $('#dt_basic').DataTable().row(dom).remove().draw(false);
                            ;
                        }
                    }
                });
            }
        });
    }


    function newDefect() {
        var info = {
            defect_id: $("#defect_id").val(),
            defect_name: $("#defect_name").val(),
            defect_loc_def: $("#defect_loc_def").val(),
            defect_def: $("#defect_def").val(),
        }
        if (info.highway_name == "" || info.highway_level == "") {
            errMessage("不可为空");
        } else {
            $.ajax({
                type: 'POST',
                url: '../DicDefectServlet',
                dataType: 'json',
                data: {
                    type: "newDefect",
                    info: JSON.stringify(info)
                },
                error: function (msg) {
                    errMessage("请求DicDefectServlet失败");
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
                        $('#dt_basic').DataTable().row.add([info.defect_id, info.defect_name, info.defect_loc_def, info.defect_def]).draw(false);
                        $('#defectDia').dialog("close");
                    }
                }
            });
        }
    }


    $('#defect_def').on('blur', function () {
        setCanUseValuable();
    });
    //设置统计可用变量
    function setCanUseValuable() {
        var def = $('#defect_def').val();
        var patt = new RegExp("\{[^\{\}]*\}", "g");
        var defList = def.match(patt);
        if (defList == null) {
            $('#canUse').html('无');
        } else {
            $('#canUse').html(defList.toString().replace(/\{|\}/g, ''));
        }
    }

    (function initA_Z() {
        var name = $('#countBuild select').eq(1);
        for (var i = 65; i <= 90; i++) {
            name.append("<option>" + String.fromCharCode(i) + "</option>");
        }
    })();

    //设置统计变量等信息
    function setCount(count) {
        var type = $('#countBuild select').eq(0);
        var name = $('#countBuild select').eq(1);
        var define = $('#countBuild input').eq(0);
        var symbol = $('#countBuild select').eq(2);
        var limit = $('#countBuild input').eq(1);

        if (count != undefined) {
            type.val(count.type);
            name.val(count.name);
            define.val(count.define);
            symbol.val(count.symbol);
            limit.val(count.limit);
            name.prop('disabled', 'disabled');
            $('#ad2').hide();
            $('#ed2').show();
        } else {
            define.val('');
            limit.val('');
            name.prop('disabled', false);
            $('#ad2').show();
            $('#ed2').hide();
        }
    }

    //向统计表格增加一条数据
    function addCountTable(d) {
        $('#countTable tbody').append("<tr><td>" + d.type + "</td><td>" + d.name + "</td><td>" + d.define + "</td><td>" + d.symbol + "</td><td>" + d.limit + "</td><td><a class='edit btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></a>&nbsp;<a class='del btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></a></td></tr>");
    }

    //统计表格数据
    function setCountTable(d) {
        $('#countTable tbody').empty();
        if (d == undefined || d == null || d == '') {
            return;
        } else {
            var counts = JSON.parse(d);
            for (var i = 0; i < counts.length; i++) {
                addCountTable(counts[i]);
            }
        }
    }

    //检查统计
    function checkCount(mode) {
        var type = $('#countBuild select').eq(0).val();
        var name = $('#countBuild select').eq(1).val();
        var define = $('#countBuild input').eq(0).val();
        var symbol = $('#countBuild select').eq(2).val();
        var limit = $('#countBuild input').eq(1).val();


        if (define == '') {
            errMessage('请输入变量或公式');
            return false;
        } else {
            var canUse = $('#canUse').html().split(',');
            var patt = new RegExp("[\\+\\-\\*\\/\\^\(\)]", "g");
            var use = define.split(patt);
            for (var i = 0; i < use.length; i++) {
                if (use[i] == "" || isNaN(use[i]) == false) {
                    use.splice(i, 1);
                    i--;
                }
            }
            for (var i = 0; i < use.length; i++) {
                var flag = false;
                for (j = 0; j < canUse.length; j++) {
                    if (use[i] == canUse[j]) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    errMessage('请输入可用变量');
                    return false;
                }
            }
        }
        if (type == '条件') {
            if (limit == '') {
                errMessage('请输入条件值');
                return false;
            }
        }
        if (mode == 'add') {
            var flag = false
            $('#countTable tbody').children('tr').each(function () {
                if ($(this).children('td').eq(1).html() == name) {
                    flag = true;
                    return false;
                }
            });
            if (flag == true) {
                errMessage("重复定义");
                return false;
            }
        }
        return true;
    }

    //增加一条统计信息
    function addCount() {
        if (checkCount('add')) {
            var type = $('#countBuild select').eq(0).val();
            var name = $('#countBuild select').eq(1).val();
            var define = $('#countBuild input').eq(0).val();
            var symbol = $('#countBuild select').eq(2).val();
            var limit = $('#countBuild input').eq(1).val();
            if (type != '条件') {
                symbol = '';
                limit = '';
            }
            var count = {
                type: type,
                name: name,
                define: define,
                symbol: symbol,
                limit: limit
            }
            addCountTable(count);
            setCount();
        }
    }

    function editCount() {
        if (checkCount('edit')) {
            var type = $('#countBuild select').eq(0).val();
            var name = $('#countBuild select').eq(1).val();
            var define = $('#countBuild input').eq(0).val();
            var symbol = $('#countBuild select').eq(2).val();
            var limit = $('#countBuild input').eq(1).val();
            if (type != '条件') {
                symbol = '';
                limit = '';
            }
            $('#countTable tbody').children('tr').each(function () {
                if ($(this).children('td').eq(1).html() == name) {
                    $(this).children('td').eq(0).html(type);
                    $(this).children('td').eq(1).html(name);
                    $(this).children('td').eq(2).html(define);
                    $(this).children('td').eq(3).html(symbol);
                    $(this).children('td').eq(4).html(limit);
                    return false;
                }
            });
            setCount();
        }
    }

    //修改统计
    $('#countTable').delegate('.edit', 'click', function () {
        var count = {
           
        };
        count.type = $(this).closest('tr').children('td').eq(0).html();
        count.name = $(this).closest('tr').children('td').eq(1).html();
        count.define = $(this).closest('tr').children('td').eq(2).html();
        count.symbol = $(this).closest('tr').children('td').eq(3).html();
        count.limit = $(this).closest('tr').children('td').eq(4).html();
        setCount(count);
    });
    //删除
    $('#countTable').delegate('.del', 'click', function () {
        var qq = this;
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $(qq).closest('tr').remove();
            }
        });
    });

    //获取表格中全部需统计信息
    function getCountAll() {
        var counts = [];
        $('#countTable tbody').children('tr').each(function () {
            var type = $(this).children('td').eq(0).html();
            var name = $(this).children('td').eq(1).html();
            var define = $(this).children('td').eq(2).html();
            var symbol = $(this).children('td').eq(3).html();
            var limit = $(this).children('td').eq(4).html();
            var local = [];
            var canUse = $('#canUse').html().split(',');
            var patt = new RegExp("[\\+\\-\\*\\/\\^\(\)]", "g");
            var use = define.split(patt);
            for (var i = 0; i < use.length; i++) {
                if (use[i] == "" || isNaN(use[i]) == false) {
                    use.splice(i, 1);
                    i--;
                }
            }
            for (var i = 0; i < use.length; i++) {
                var flag = false;
                for (j = 0; j < canUse.length; j++) {
                    if (use[i] == canUse[j]) {
                        local.push(j);
                        break;
                    }
                }
            }
            var count = {
                type: type,
                name: name,
                define: define,
                symbol: symbol,
                limit: limit,
                local: local
            }
            counts.push(count);
        });
        return counts;
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

    var editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp<button class='edit btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
    var editDel2 = "<button class='edit2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-trash'></i></button>"
    function releaseAdmin() {//管理员
        editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs'><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp<button class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
        editDel2 = "<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>"
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
    	  editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs'><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp<button class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
          editDel2 = "<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>"
          $('.widget-body-toolbar button').prop('disabled', false);
		}
	
	}
</script>


</body>
</html>