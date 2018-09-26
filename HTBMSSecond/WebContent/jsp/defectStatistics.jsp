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
    <link rel="stylesheet" type="text/css" media="screen" href="../css/font.css">
    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-skins.min.css">

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

    <style type="text/css">
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

				<span class="ribbon-button-alignment"> 
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"
                          data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
                          data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>养护决策</li>
            <li>统计分析</li>
            <li>病害统计</li>
        </ol>
        <!-- end breadcrumb -->

    </div>
    <!-- END RIBBON -->

    <!--

    检索统计范围可以是一个结构也可以是多个结构，也可以是一个项目，一条路线等，也可以是一个结构的多次检查。

    病害检索
    (1)按病害名称进行字段检索，有“次类型”时按照次类型，没有时按照“类型”；
    (5)能够筛选某一部件或者分部结构的病害；
    (10)筛选统计出某一桥型的某类病害情况；

    (4)能够筛选长、宽、面积、体积等在一定范围内的病害；

    病害统计
    (7)能够分析某个病害历次检查的发展情况；

    (2)能够统计各种病害类型的数量；
    (3)若病害缺损状况描述中有长、面积、体积等数据，能够统计总长度、总面积、总体积；

    评定等级统计
    (6)能够根据评定等级筛选桥梁；
    (8)能够筛选某个结构历次检查的评定等级；
    (9)能够统计某个项目、某条路线评定情况，例如一类桥梁数量、详细等等；

    (11)多种筛选及统计能够叠加。

    -->

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
                            <span class="widget-icon"> <i class="fa fa-comment"></i> </span>
                            <h2>病害统计</h2>
                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget content -->
                            <div class="widget-body no-padding">
                                <div class="col-xs-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="panel-title">
                                                条件录入
                                                <div id="tabBtn"
                                                     style="position: absolute;top: 5px;right: 170px;height: 32px;"></div>
                                                <button class="fa fa-search"
                                                        style="position: absolute;top: 5px;right: 103px;height: 32px;"
                                                        onclick="search()">检索
                                                </button>
                                                <button class="fa fa-angle-up"
                                                        style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;"
                                                        data-toggle="collapse" data-parent="#accordion"
                                                        data-target="#collapseOne"></button>
                                                <button class="fa fa-angle-down"
                                                        style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;display: none"
                                                        data-toggle="collapse" data-parent="#accordion"
                                                        data-target="#collapseOne"></button>
                                            </div>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body" style="width: 100%;">
                                           		<div class="form-group col-xs-12 col-sm-6 col-lg-4">
													<label>检查类型</label> 
													<select style="width:100%" class="form-control input-sm select2"  id=chk_type >
														<option value="%">--全部--</option>
														<option value="regular">定期检查</option>
														<option value="special">特殊检查</option>
														<option value="often">经常检查</option>
														<option value="daily">日常检查</option>
													</select>
												</div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>项目</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="project">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>路线</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="line">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>管养单位</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="manage">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>所属路段</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="section">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>所属分区</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="zone">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>结构分类</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="struct_mode">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>结构</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="struct">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>方向</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="direction">
                                                        <option value="%">全部</option>
                                                        <option>上行</option>
                                                        <option>下行</option>
                                                        <option>无</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>跨号</label>
                                                    <input style="width:100%;height: 32px;"
                                                           class="form-control input-sm" placeholder="不输默认所有" id="span">
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>结构类型</label>
                                                    <select style="width:100%" class="form-control input-sm select2"
                                                            id="struct_type">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>分部结构</label>
                                                    <select class="form-control input-sm select2" id="dis">
                                                        <option value="%">--全部--</option>
                                                        <option>上部结构</option>
                                                        <option>桥面系</option>
                                                        <option>下部结构</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>部件类型</label>
                                                    <select class="form-control input-sm select2" id="com">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>构件类型</label>
                                                    <select class="form-control input-sm select2" id="mem">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>构件型号</label>
                                                    <select class="form-control input-sm select2" id="memType">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>病害分类类型</label>
                                                    <select class="form-control input-sm select2" id="defect_f">
                                                    </select>
                                                </div>
                                                <div class="form-group col-xs-12 col-sm-6 col-lg-4">
                                                    <label>次级病害类型</label>
                                                    <select class="form-control input-sm select2" id="defect">
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12">
                                    <table id="dt_basic" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                            <th class="hasinput">
                                                <input type="text" class="form-control" placeholder="检索"/>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th style="width: 100px;">项目</th>
                                            <th style="width: 80px;">路线</th>
                                            <th style="width: 80px;">段区</th>
                                            <th style="width: 80px;">结构分类</th>
                                            <th style="width: 80px;">结构</th>
                                            <th style="width: 80px;">桩号</th>
                                            <th style="width: 30px;">方向</th>
                                            <th style="width: 30px;">跨号</th>
                                            <th style="width: 100px;">结构类型</th>
                                            <th style="width: 80px;">分部结构</th>
                                            <th style="width: 80px;">部件类型</th>
                                            <th style="width: 80px;">构件类型</th>
                                            <th style="width: 80px;">构件</th>
                                            <th style="width: 80px;">构件型号</th>
                                            <th style="width: 80px;">病害分类</th>
                                            <th style="width: 80px;">次级病害</th>
                                            <th style="width: 120px;">缺损位置</th>
                                            <th style="width: 120px;">缺损状况</th>
                                            <th style="width: 50px;">是否重点</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
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


<div id="cover" class="cover">
    <div id="loading" class="loading">处理中...
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

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
<script src="../js/plugin/datatables/dataTables.buttons.min.js"></script>
<script src="../js/plugin/datatables/buttons.html5.min.js"></script>
<script src="../js/plugin/datatables/buttons.flash.min.js"></script>
<script src="../js/plugin/datatables/jszip.min.js"></script>

<script src="../js/echarts.min.js"></script>

<script type="text/javascript">
var role = '<%=session.getAttribute("userRole")%>';
    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();


        line.init();
        //initCheckType()
        project.init();
        manage.init();
        struct.init();
        structBaseDef.init()
        defect.init();
    });


    //面板事件
    $('#collapseOne').on('show.bs.collapse', function () {
        $('.fa-angle-up').show();
        $('.fa-angle-down').hide();
    });
    $('#collapseOne').on('hide.bs.collapse', function () {
        $('.fa-angle-up').hide();
        $('.fa-angle-down').show();
    });


    /* 			{"data": "project"},
     { "data": "line" },
     { "data": "section" },
     { "data": "struct_mode" },
     { "data": "struct" },
     { "data": "direction" },
     { "data": "span" },
     { "data": "struct_type" },
     { "data": "distr_name" },
     { "data": "component_name" },
     { "data": "member_name" },
     { "data": "member_no" },
     { "data": "memType" },
     { "data": "defect_name_f" },
     { "data": "defect_name" },
     { "data": "defect_location_desc" },
     { "data": "defect_count" },
     { "data": "important" } */


    function search() {
        var info = {
            project: $('#project').val(),
            line: $('#line').val(),
            section: $('#section').val(),
            manage: $('#manage').val(),
            zone: $('#zone').val(),
            struct_mode: $('#struct_mode').val(),
            struct: $('#struct').val(),
            direction: $('#direction').val(),
            span: getSpan(),
            struct_type: $('#struct_type').val(),
            distr_name: $('#dis').val(),
            component_name: $('#com').val(),
            member_name: $('#mem').val(),
            memType: $('#memType').val(),
            defect_name_f: $('#defect_f').val(),
            defect_name: $('#defect').val()
        }
        console.log(info)
        showMask();
        $.ajax({
            type: 'POST',
            url: '../StatisticsServlet',
            dataType: 'json',
            data: {
                type: "searchDefect",
                info: JSON.stringify(info)
            },
            error: function (msg) {
                errMessage("请求StatisticsServlet失败");
                hidMask();
            },
            success: function (json) {
                $('#dt_basic').dataTable().fnClearTable();
                table.rows.add(json.obj).draw(false);
                hidMask();
            }
        });
    }

    function getSpan() {
        var d = $('#span').val();
        if (d == '') {
            d = '%';
        }
        return d;
    }

    //项目
    var project = {
        data: [],
        init: function () {
            $.ajax({
                type: 'POST',
                url: '../StatisticsServlet',
                dataType: 'json',
                data: {
                    type: "initProject"
                },
                error: function (msg) {
                    errMessage("请求StatisticsServlet失败");
                },
                success: function (json) {
                    project.data = json.obj;
                    project.build();
                    $('#chk_type').on('change', function(){
						project.build();
					});
                }
            });
        },
        build: function () {
        	var chk_type = $('#chk_type').val();
            var d = $('#project');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < project.data.length; i++) {
            	if(chk_type=='%' || chk_type==project.data[i].chk_type){
            		d.append('<option value="' + project.data[i].prj_id + '">' + project.data[i].prj_desc + '</option>');
            	}
            }
            d.trigger('change');
        },
        getId: function () {
            return $('#project').val();
        },
        getName: function () {
            var d = project.getId();
            for (var i = 0; i < project.data.length; i++) {
                if (d == project.data[i].prj_no) {
                    return project.data[i].prj_desc;
                }
            }
            return '全部';
        }
    }


    //路线
    var line = {
        data: [],
        init: function () {
            $.ajax({
                type: 'POST',
                url: '../LineMgrServlet',
                dataType: 'json',
                data: {
                    type: "initTable"
                },
                error: function (msg) {
                    errMessage("请求LineMgrServlet失败");
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
                        line.data = json.obj;
                        line.buileLine();
                    }
                }
            });
        },
        buileLine: function () {
            var d = $('#line');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < line.data.length; i++) {
                d.append("<option value='" + line.data[i].highway_id + "'>" + line.data[i].highway_name + "</option>");
            }
            d.trigger('change');
        }
    }


    var manage = {
        manageData: undefined,
        sectionData: undefined,
        zoneData: undefined,
        init: function () {
            this.initManage();
            this.initSection();
            this.initZone();
            $('#manage').on('change', function () {
                manage.buildSection();
                manage.buildZone();
            });
        },
        initManage: function () {
            $.ajax({
                type: 'POST',
                url: '../StructMgrServlet',
                dataType: 'json',
                data: {
                    type: "initOrg"
                },
                error: function (msg) {
                    errMessage("请求ManageOrgMgrServlet失败");
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
                        manage.manageData = json.obj;
                        manage.buildManage();
                    }
                }
            });
        },
        buildManage: function () {
            var d = $('#manage');
            d.empty();
            if(role=='admin'||role=='guest'){
				d.append('<option value="%">--全部--</option>');
			}
            for (var i = 0; i < manage.manageData.length; i++) {
                d.append("<option value='"+manage.manageData[i].org_id+"'>"+manage.manageData[i].org_name_short+"</option>");
            }
            d.trigger('change');
        },
        initSection: function () {
            $.ajax({
                type: 'POST',
                url: '../StructMgrServlet',
                dataType: 'json',
                data: {
                    type: "initSection"
                },
                error: function (msg) {
                    errMessage("请求ManageSectionMgrServlet失败");
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
                        manage.sectionData = json.obj;
                        manage.buildSection();
                    }
                }
            });
        },
        buildSection: function () {
            var mg = $('#manage').val();
            if (manage.sectionData == undefined || mg == null) {
                setTimeout(function () {
                    manage.buildSection();
                }, 1500);
                return;
            }
            var d = $('#section');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            if(mg!='%'){
	            for (var i = 0; i < manage.sectionData.length; i++) {
	                if (mg == '%' || mg == manage.sectionData[i].org_id) {
	                    d.append("<option value='" + manage.sectionData[i].section_id + "'>" + manage.sectionData[i].section_name + "</option>");
	                }
	            }
            }else{
            	d.append('<option value="%">--请选择管养单位--</option>');
            }
            d.trigger('change');
        },
        initZone: function () {
            $.ajax({
                type: 'POST',
                url: '../StructMgrServlet',
                dataType: 'json',
                data: {
                    type: "initZone"
                },
                error: function (msg) {
                    errMessage("请求ManageZoneMgrServlet失败");
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
                        manage.zoneData = json.obj;
                        manage.buildZone();
                    }
                }
            });
        },
        buildZone: function () {
            var mg = $('#manage').val();
            if (manage.zoneData == undefined || mg == null) {
                setTimeout(function () {
                    manage.buildZone();
                }, 1500);
                return;
            }
            var d = $('#zone');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            if(mg!='%'){
	            for (var i = 0; i < manage.zoneData.length; i++) {
	                if (mg == '%' || mg == manage.zoneData[i].org_id) {
	                    d.append("<option value='" + manage.zoneData[i].zone_id + "'>" + manage.zoneData[i].zone_name + "</option>");
	                }
	            }
            }else{
            	d.append('<option value="%">--请选择管养单位--</option>');
            }
            d.trigger('change');
        }

    }


    //结构物类型和结构物
    var struct = {
        data: undefined,
        init: function () {
            $('#struct_mode').on('change', function () {
                struct.buildStruct();
                structBaseDef.buildStructType();
                structBaseDef.buildComponent();
                if ($(this).val() != 'bridge') {
                    $('#dis').val('%').trigger('change');
                    $('#dis').prop('disabled', 'disabled');
                } else {
                    $('#dis').prop('disabled', false);
                }
            });
            $.ajax({
                type: 'POST',
                url: '../StatisticsServlet',
                dataType: 'json',
                data: {
                    type: "initStruct"
                },
                error: function (msg) {
                    errMessage("请求CheckBridgeServlet失败");
                },
                success: function (json) {
                    struct.data = json.obj;
                    struct.buildStructMode();
                }
            });
        },
        getStructModeId: function () {
            return $('#struct_mode').val();
        },
        getStructId: function () {
            return $('#struct').val();
        },
        buildStructMode: function () {
            var d = $('#struct_mode');
            d.empty();
            if (struct.data['bridge'] != undefined) {
                d.append("<option value='bridge'>桥梁</option>");
            }
            if (struct.data['pass'] != undefined) {
                d.append("<option value='pass'>通道</option>");
            }
            if (struct.data['culvert'] != undefined) {
                d.append("<option value='culvert'>涵洞</option>");
            }
            d.trigger('change');
        },
        buildStruct: function () {
            var sid = struct.getStructModeId();
            if (struct.data == undefined) {
                setTimeout(function () {
                    struct.buildStruct();
                }, 1500);
                return;
            }
            var structs = struct.data[sid];
            var d = $('#struct');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < structs.length; i++) {
                d.append("<option value='" + structs[i].id + "'>" + structs[i].name + "</option>");
            }
            d.trigger('change');
        }
    }


    var structBaseDef = {
        structTypeData: undefined,
        componentData: undefined,
        memberData: undefined,
        memTypeData: undefined,
        init: function () {
            structBaseDef.initStructType();
            structBaseDef.initComponent();
            structBaseDef.initMember();
            structBaseDef.initMemType();
            $('#mem').on('change', function () {
                structBaseDef.buildMemType();
            });
        },
        initStructType: function () {
            $.ajax({
                type: 'POST',
                url: '../StatisticsServlet',
                dataType: 'json',
                data: {
                    type: "initStructType"
                },
                error: function (msg) {
                    errMessage("请求StatisticsServlet失败");
                },
                success: function (json) {
                    structBaseDef.structTypeData = json.obj;
                    structBaseDef.buildStructType();
                }
            });
        },
        initComponent: function () {
            $.ajax({
                type: 'POST',
                url: '../StatisticsServlet',
                dataType: 'json',
                data: {
                    type: "initComponent"
                },
                error: function (msg) {
                    errMessage("请求StatisticsServlet失败");
                },
                success: function (json) {
                    structBaseDef.componentData = json.obj;
                    structBaseDef.buildComponent();
                }
            });
        },
        initMember: function () {
            $.ajax({
                type: 'POST',
                url: '../DicMemTypeServlet',
                dataType: 'json',
                data: {
                    type: "initMemType"
                },
                error: function (msg) {
                    errMessage("请求DicMemTypeServlet失败");
                },
                success: function (json) {
                    structBaseDef.memberData = json.obj;
                    structBaseDef.buildMember();
                }
            });
        },
        initMemType: function () {
            $.ajax({
                type: 'POST',
                url: '../DicMemMemberTypeServlet',
                dataType: 'json',
                data: {
                    type: "initTable"
                },
                error: function (msg) {
                    errMessage("请求DicMemMemberTypeServlet失败");
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
                        structBaseDef.memTypeData = {};
                        for (var i = 0; i < data.length; i++) {
                            if (structBaseDef.memTypeData[data[i].member_name] != undefined) {
                                structBaseDef.memTypeData[data[i].member_name].push(data[i].member_type_name);
                            } else {
                                structBaseDef.memTypeData[data[i].member_name] = [];
                                structBaseDef.memTypeData[data[i].member_name].push(data[i].member_type_name);
                            }
                        }
                    }
                }
            });
        },
        getDis: function () {
            return $('#dis').val();
        },
        getCom: function () {
            return $('#com').val();
        },
        getMem: function () {
            return $('#mem').val();
        },
        getStructType: function () {
            return $('#struct_type').val();
        },
        buildStructType: function () {
            var mid = struct.getStructModeId();
            if (structBaseDef.structTypeData == undefined) {
                setTimeout(function () {
                    structBaseDef.buildStructType();
                }, 1500);
                return;
            }
            var types = structBaseDef.structTypeData[mid];
            if (types == undefined) {
                setTimeout(function () {
                    structBaseDef.buildStructType();
                }, 1500);
                return;
            }
            var d = $('#struct_type');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < types.length; i++) {
                d.append("<option value='" + types[i].id + "'>" + types[i].name + "</option>");
            }
            d.trigger('change');
        },
        buildComponent: function () {
            var mid = struct.getStructModeId();
            if (structBaseDef.componentData == undefined || mid == null) {
                setTimeout(function () {
                    structBaseDef.buildComponent();
                }, 1500);
                return;
            }
            var types = structBaseDef.componentData[mid];
            var d = $('#com');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < types.length; i++) {
                d.append("<option>" + types[i] + "</option>");
            }
            d.trigger('change');
        },
        buildMember: function () {
            var d = $('#mem');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < structBaseDef.memberData.length; i++) {
                d.append("<option>" + structBaseDef.memberData[i].member_name + "</option>");
            }
            d.trigger('change');
        },
        buildMemType: function () {
            var mem = $('#mem').val();
            if (structBaseDef.memTypeData == undefined) {
                setTimeout(function () {
                    structBaseDef.buildMemType();
                }, 1500);
                return;
            }
            var d = $('#memType');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            var dd = structBaseDef.memTypeData[mem];
            if (dd != undefined) {
                for (var i = 0; i < dd.length; i++) {
                    d.append("<option>" + dd[i] + "</option>");
                }
            } else {
                d.append("<option>无</option>");
            }
            d.trigger('change');
        }
    }


    var defect = {
        defectData: {},
        init: function () {
            $('#defect_f').on('change', function () {
                defect.buildDefect();
            });
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
            d.append('<option value="%">全部</option>');
            for (var s in defect.defectData) {
                d.append('<option>' + s + '</option>');
            }
            d.trigger('change');
        },
        buildDefect: function () {
            var d = $('#defect');
            var f = $('#defect_f').val();
            d.empty();
            d.append('<option value="%">全部</option>');
            if (f != '%') {
                var defects = defect.defectData[f];
                for (var i = 0; i < defects.length; i++) {
                    d.append('<option>' + defects[i].defect_name + '</option>');
                }
            }
            d.trigger('change');
        }
    }

    /************************************************************结构*********************************************************************/
    $.fn.dataTable.Buttons.swfPath = '../js/plugin/datatables/swf/flashExport.swf';
    var table = $('#dt_basic').DataTable({
        "deferRender": true,
        "processing": true,
        "sDom": "t" +
        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "columns": [
            {"data": "project"},
            {"data": "line"},
            {"data": "section"},
            {"data": "struct_mode"},
            {"data": "struct"},
            {"data": "bridge_pile_no"},
            {"data": "direction"},
            {"data": "span"},
            {"data": "struct_type"},
            {"data": "distr_name"},
            {"data": "component_name"},
            {"data": "member_name"},
            {"data": "member_no"},
            {"data": "memType"},
            {"data": "defect_name_f"},
            {"data": "defect_name"},
            {"data": "defect_location_desc"},
            {"data": "defect_count"},
            {"data": "important"}
        ],
        "columnDefs": [
            {
                "targets": 8,
                "searchable": true,
                "render": function (data, type, full) {
                    if (full.struct_mode != '桥梁') {
                        return '无';
                    }
                    if (data == undefined || data == "" || data == null) {
                        return "无关系";
                    }
                    return data;
                }
            }, {
                "targets": 12,
                "searchable": true,
                "render": function (data, type, full) {
                    if (full.struct_mode != '桥梁') {
                        return "无";
                    }
                    return data;
                }
            }, {
                "targets": 18,
                "searchable": true,
                "render": function (data, type, full) {
                    if (data.indexOf('重点') >= 0) {
                        return '是';
                    } else {
                        return '否';
                    }
                }
            }],
        "bDestroy": true,
        "iDisplayLength": 10,
        "autoWidth": true,
        "bScrollCollapse": true,
        "sScrollY": 400,
        "sScrollX": true,
        "oLanguage": { //国际化配置
            "sProcessing": "正在获取数据，请稍后...",
            "sLengthMenu": "显示 _MENU_ 条",
            "sZeroRecords": "没有您要搜索的内容",
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
        },
        "order": [[1, 'asc']],
        "buttons": [
            {
                extend: "csv",
                text: "导出csv",
                bom: true,
                filename: '病害搜索结果',
                fieldSeparator: ',',
                exportOptions: {
                    format: {
                        header: function (data) {
                            return data;
                        },
                        header: function (data) {
                            return data;
                        }
                    }
                }
            }
        ]
    });

    table.buttons().container().appendTo($('#tabBtn'));
    $('.buttons-csv').addClass('btn btn-default');
    table.buttons.exportData({
        format: {
            header: function (data, columnIdx) {
                return columnIdx + ': ' + data;
            },
            body: function (data, columnIdx, rowIdx, code) {
                return columnIdx + ': ' + data;
            }
        }
    });


    $(".hasinput input").on('change', function () {
        if (table.column($(this).parent().index() + ':visible').dataSrc() == 'span' && this.value != '') {
            table
                .column($(this).parent().index() + ':visible')
                .search('^' + this.value + '$', true)
                .draw(false);
        } else {
            table
                .column($(this).parent().index() + ':visible')
                .search(this.value)
                .draw(false);
        }
    });

    /* function initCheckType(){
		var chk_type = $("#chk_type")
		chk_type.empty();
		chk_type.append('<option value="%">--全部--</option>');
		if(role=="admin"||role=="guest"){
			chk_type.append('<option value="regular">定期检查</option>');
			chk_type.append('<option value="special">特殊检查</option>');
			chk_type.append('<option value="often">经常检查</option>');
			chk_type.append('<option value="daily">日常检查</option>');
		}else{
			chk_type.append('<option value="often">经常检查</option>');
			chk_type.append('<option value="daily">日常检查</option>');
		}
		chk_type.trigger('change');
	} */
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