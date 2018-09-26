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
            <li>构件-部件</li>
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
                            <h2>构件-部件</h2>

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
                                        <div class="col-sm-12 col-md-12">
                                            <a href="dicBrgStruct.jsp" class="btn btn-default">11评定</a>
                                            <a href="dicBrgStruct04.jsp" class="btn btn-default">04评定</a>
                                            <a href="dicBrgStructCk.jsp" class="btn btn-default disabled">检查记录</a>
                                        </div>
                                    </div>
                                </div>


                                <ul id="myTab1" class="nav nav-tabs bordered">
                                    <li class="active">
                                        <a href="#s1" data-toggle="tab">桥梁检查记录</a>
                                    </li>
                                    <li>
                                        <a href="#s2" data-toggle="tab">通道检查记录</a>
                                    </li>
                                    <li>
                                        <a href="#s3" data-toggle="tab">涵洞检查记录</a>
                                    </li>
                                </ul>

                                <div id="myTabContent1" class="tab-content no-padding">
                                    <div class="tab-pane fade in active no-padding" id="s1">
                                        <table id="bstd" class="table table-bordered table-striped table-hover"
                                               style="width:100%">
                                            <thead>
                                            <tr>
                                                <th style="width: 20%">编号</th>
                                                <th style="width: 20%">构件类型</th>
                                                <th style="width: 20%">桥梁检查部件</th>
                                                <th style="width: 20%">分部结构</th>
                                                <th style="width: 20%"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%-- 				<%
                                                            for(int i=0;i<94;i++) {
                                                            %>
                                                            <tr>
                                                                <td><%=i+1 %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><a href="#" class="btn btn-warning btn-xs"><li class="fa fa-pencil"></li></a><a href="#" class="btn btn-warning btn-xs"><li class="fa fa-trash"></li></a></td>
                                                            </tr>
                                                            <%
                                                            }
                                                            %>	 --%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade no-padding" id="s2">
                                        <table id="pstd" class="table table-bordered table-striped table-hover"
                                               style="width:100%">
                                            <thead>
                                            <tr>
                                                <th style="width: 25%">编号</th>
                                                <th style="width: 25%">构件类型</th>
                                                <th style="width: 25%">通道检查部件</th>
                                                <th style="width: 25%"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%-- 				<%
                                                            for(int i=0;i<94;i++) {
                                                            %>
                                                            <tr>
                                                                <td><%=i+1 %></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td><a href="#" class="btn btn-warning btn-xs"><li class="fa fa-pencil"></li></a><a href="#" class="btn btn-warning btn-xs"><li class="fa fa-trash"></li></a></td>
                                                            </tr>
                                                            <%
                                                            }
                                                            %>	 --%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="tab-pane fade no-padding" id="s3">
                                        <table id="cstd" class="table table-bordered table-striped table-hover"
                                               style="width:100%">
                                            <thead>
                                            <tr>
                                                <th style="width: 25%">编号</th>
                                                <th style="width: 25%">构件类型</th>
                                                <th style="width: 25%">涵洞检查部件</th>
                                                <th style="width: 25%"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%-- 							<%
                                                                        for(int i=0;i<94;i++) {
                                                                        %>
                                                                        <tr>
                                                                            <td><%=i+1 %></td>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td></td>
                                                                            <td><a href="#" class="btn btn-warning btn-xs"><li class="fa fa-pencil"></li></a><a href="#" class="btn btn-warning btn-xs"><li class="fa fa-trash"></li></a></td>
                                                                        </tr>
                                                                        <%
                                                                        }
                                                                        %>	 --%>
                                            </tbody>
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
                <!-- WIDGET END -->

            </div>
        </section>
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<div id="dig1" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>构件编号</label>
                <input class="form-control" id="member_id" value="" placeholder=构件编号 type="text" readonly="readonly">
            </div>
            <div class="form-group">
                <label>构件名称</label>
                <input class="form-control" id="member_name" value="" placeholder="构件名称" type="text"
                       readonly="readonly">
            </div>
            <div class="form-group">
                <label>桥梁检查记录</label>
                <select class="form-control input-sm" id="component8" data-name="桥梁检查记录">
                    <option></option>
                </select>
            </div>
            <div class="form-group">
                <label>分部结构</label>
                <select class="form-control input-sm" id="distr_name">
                    <option></option>
                    <option>上部结构</option>
                    <option>桥面系</option>
                    <option>下部结构</option>
                </select>
            </div>
        </fieldset>
    </form>
</div>


<div id="dig2" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>构件编号</label>
                <input class="form-control" id="member_id2" value="" placeholder=构件编号 type="text" readonly="readonly">
            </div>
            <div class="form-group">
                <label>构件名称</label>
                <input class="form-control" id="member_name2" value="" placeholder="构件名称" type="text"
                       readonly="readonly">
            </div>
            <div class="form-group">
                <label>通道检查记录</label>
                <select class="form-control input-sm" id="component9" data-name="通道检查记录">
                    <option></option>
                </select>
            </div>
        </fieldset>
    </form>
</div>


<div id="dig3" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>构件编号</label>
                <input class="form-control" id="member_id3" value="" placeholder=构件编号 type="text" readonly="readonly">
            </div>
            <div class="form-group">
                <label>构件名称</label>
                <input class="form-control" id="member_name3" value="" placeholder="构件名称" type="text"
                       readonly="readonly">
            </div>
            <div class="form-group">
                <label>涵洞检查记录</label>
                <select class="form-control input-sm" id="component10" data-name="涵洞检查记录">
                    <option></option>
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

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<script type="text/javascript">
    var responsiveHelper_datatable_col_reorder = undefined;
    var breakpointDefinition = {
        tablet: 1024,
        phone: 480
    };

    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();
        initTable();
        initOption();
    });


    var table1 = $('#bstd').DataTable({
        "deferRender": true,
        "processing": true,
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
        "t" +
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
            {"data": "member_id"},//构建id
            {"data": "member_name"},//构件名
            {"data": "component8", "defaultContent": ""},//桥梁检查记录
            {"data": "distr_name", "defaultContent": ""},//分部结构
            {"data": null, "orderable": false}
        ],
        "columnDefs": [{
            "targets": 4,
            "searchable": false,
            "render": function (data, type, full) {
                return editDel;
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

    var table2 = $('#pstd').DataTable({
        "deferRender": true,
        "processing": true,
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
        "t" +
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
            {"data": "member_id"},//构建id
            {"data": "member_name"},//构件名
            {"data": "component9", "defaultContent": ""},//通道检查记录
            {"data": null, "orderable": false}
        ],
        "columnDefs": [{
            "targets": 3,
            "searchable": false,
            "render": function (data, type, full) {
                return editDel;
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

    var table3 = $('#cstd').DataTable({
        "deferRender": true,
        "processing": true,
        "sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f><'col-sm-6 col-xs-12 hidden-xs'l>r>" +
        "t" +
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
            {"data": "member_id"},//构建id
            {"data": "member_name"},//构件名
            {"data": "component10", "defaultContent": ""},//涵洞检查记录
            {"data": null, "orderable": false}
        ],
        "columnDefs": [{
            "targets": 3,
            "searchable": false,
            "render": function (data, type, full) {
                return editDel;
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

    $('#dig1').dialog({
        title: "修改",
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });
    $('#dig1').prop('hidden', false);
    $('#dig2').dialog({
        title: "修改",
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });
    $('#dig2').prop('hidden', false);
    $('#dig3').dialog({
        title: "修改",
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });
    $('#dig3').prop('hidden', false);

    function initTable() {
        $.ajax({
            type: 'POST',
            url: '../DicBridgeStructServlet',
            dataType: 'json',
            data: {
                type: "initTable"
            },
            error: function (msg) {
                errMessage("请求DicBridgeStructServlet失败");
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
                    $('#bstd').dataTable().fnClearTable();
                    $('#pstd').dataTable().fnClearTable();
                    $('#cstd').dataTable().fnClearTable();
                } else {
                    $('#bstd').dataTable().fnClearTable();
                    $('#pstd').dataTable().fnClearTable();
                    $('#cstd').dataTable().fnClearTable();
                    var data = json.obj;
                    table1.rows.add(data).draw(false);
                    table2.rows.add(data).draw(false);
                    table3.rows.add(data).draw(false);
                }
            }
        });
    }


    function initOption() {
        $.ajax({
            type: 'POST',
            url: '../DicBridgeStructServlet',
            dataType: 'json',
            data: {
                type: "initOption"
            },
            error: function (msg) {
                errMessage("请求DicBridgeStructServlet失败");
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
                        $("select[data-name='" + nn[data[i].specification] + "']").append("<option>" + data[i].component_name + "</option>");
                    }
                }
            }
        });
    }


    $('#bstd').delegate('.edit', 'click', function () {
        var dom = $(this).parents('tr');
        var data = table1.row(dom).data();
        $('#member_id').val(data.member_id);
        $('#member_name').val(data.member_name);
        $('#component8').val(data.component8);
        $('#distr_name').val(data.distr_name);
        $('#dig1').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            member_id: $('#member_id').val(),
                            member_name: $('#member_name').val(),
                            component8: $('#component8').val(),
                            distr_name: $('#distr_name').val(),
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicBridgeStructServlet',
                            dataType: 'json',
                            data: {
                                type: "editDataCKB",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicBridgeStructServlet失败");
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
                                    //successMessage("保存成功");
                                    table1.row(dom).data(info);
                                    $('#dig1').dialog("close");
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
        $('#dig1').dialog('open');
    });


    $('#pstd').delegate('.edit', 'click', function () {
        var dom = $(this).parents('tr');
        var data = table2.row(dom).data();
        $('#member_id2').val(data.member_id);
        $('#member_name2').val(data.member_name);
        $('#component9').val(data.component9);
        $('#distr_name').val(data.distr_name);
        $('#dig2').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            member_id: $('#member_id2').val(),
                            member_name: $('#member_name2').val(),
                            component9: $('#component9').val()
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicBridgeStructServlet',
                            dataType: 'json',
                            data: {
                                type: "editDataCKP",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicBridgeStructServlet失败");
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
                                    //successMessage("保存成功");
                                    table2.row(dom).data(info);
                                    $('#dig2').dialog("close");
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
        $('#dig2').dialog('open');
    });


    $('#cstd').delegate('.edit', 'click', function () {
        var dom = $(this).parents('tr');
        var data = table3.row(dom).data();
        $('#member_id3').val(data.member_id);
        $('#member_name3').val(data.member_name);
        $('#component10').val(data.component10);
        $('#distr_name').val(data.distr_name);
        $('#dig3').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            member_id: $('#member_id3').val(),
                            member_name: $('#member_name3').val(),
                            component10: $('#component10').val()
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicBridgeStructServlet',
                            dataType: 'json',
                            data: {
                                type: "editDataCKC",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicBridgeStructServlet失败");
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
                                    //successMessage("保存成功");
                                    table3.row(dom).data(info);
                                    $('#dig3').dialog("close");
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
        $('#dig3').dialog('open');
    });


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

    var editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-pencil'></span></button></div>";
    function releaseAdmin() {//管理员
        editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></button></div>";
    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
        editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></button></div>";
		}
	
	}
</script>

</body>
</html>