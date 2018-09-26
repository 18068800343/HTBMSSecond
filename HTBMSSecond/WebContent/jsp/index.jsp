<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
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
	<style type="text/css">
		.color{
			color:red;
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
            <li>首页</li>
        </ol>
        <!-- end breadcrumb -->

        <!-- You can also add more buttons to the
            ribbon for further usability

            Example below:

            <span class="ribbon-button-alignment pull-right">
            <span id="search" class="btn btn-ribbon hidden-xs" data-title="search"><i class="fa-grid"></i> Change Grid</span>
            <span id="add" class="btn btn-ribbon hidden-xs" data-title="add"><i class="fa-plus"></i> Add</span>
            <span id="search" class="btn btn-ribbon" data-title="search"><i class="fa-search"></i> <span class="hidden-mobile">Search</span></span>
            </span> -->

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">

        <section id="widget-grid">

            <!-- row -->
            <div class="row">
                <!-- SINGLE GRID -->
                <article class="col-xs-12 col-sm-12 col-md-7 col-lg-6"
                         style="height: 100%">

                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-2"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
								<span class="widget-icon"> <i class="fa fa-map-marker"></i>
								</span>
                            <h2>结构地图</h2>
                        </header>
                        <!-- widget div-->

                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding">
                                <div class="panel panel-default" style="margin-bottom:10px">
                                    <div class="panel-heading">
                                        <div class="panel-title">
                                            高级检索
                                            <div id="tabBtn"
                                                 style="position: absolute;top: 5px;right: 170px;height: 32px;"></div>
                                            <button class="fa fa-search"
                                                    style="position: absolute;top: 5px;right: 103px;height: 32px;"
                                                    onclick="queryBrg()">检索
                                            </button>
                                            <button class="fa fa-angle-up"
                                                    style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;display: none;"
                                                    data-toggle="collapse" data-parent="#accordion"
                                                    data-target="#collapseOne"></button>
                                            <button class="fa fa-angle-down"
                                                    style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;"
                                                    data-toggle="collapse" data-parent="#accordion"
                                                    data-target="#collapseOne"></button>
                                        </div>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse out">
                                        <div class="panel-body" style="width: 100%;">
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>评定标准</label>
												<select style="width:100%" class="form-control input-sm select2"  id=chk_type >
													<option value="%">--全部--</option>
													<option value="2004">04评定</option>
													<option value="2011">11评定</option>
												</select>
                                            </div> 
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>项目</label>
                                                <select style="width:100%" class="form-control input-sm select2"
                                                        id="project">
                                                </select>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>路线</label>
                                                <select style="width:100%" class="form-control input-sm select2"
                                                        id="line">
                                                </select>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>管养单位</label>
                                                <select style="width:100%" class="form-control input-sm select2"
                                                        id="manage">
                                                </select>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>所属路段</label>
                                                <select style="width:100%" class="form-control input-sm select2"
                                                        id="section">
                                                </select>
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>所属分区</label>
                                                <select style="width:100%" class="form-control input-sm select2"
                                                        id="zone">
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!-- <div id="vector-map" class="vector-map"></div>
                                    <div id="heat-fill">
                                        <span class="fill-a">0</span>
                                        <span class="fill-b">5,000</span>
                                    </div> -->

                                <div class="col-xs-12" id="map"
                                     style="max-height: 1500px; min-height: 580px; padding-top: 0px; padding-left: 2px; height: auto;">
                                    <!-- PAGE CONTENT BEGINS -->
                                    <!-- PAGE CONTENT ENDS -->
                                </div>
                                <!-- /.col -->

                            </div>
                            <!-- end widget content -->
                        </div>
                        <!-- end widget div -->
                    </div>
                    <!-- end widget -->

                </article>
                <!-- GRID END -->

                <article class="col-xs-12 col-sm-6 col-md-5 col-lg-6">
                    <!-- SINGLE GRID -->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
								<span class="widget-icon"> <i class="fa fa-comment"></i>
								</span>
                            <h2>系统动态</h2>

                        </header>
                        <!-- widget div-->

                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding">

                                <div class="table-responsive"
                                     style="height: 280px; overflow-y: auto;">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th width="50px">序号</th>
                                            <th>内容</th>
                                            <th width="100px">日期</th>
                                        </tr>
                                        </thead>
                                        <tbody id="log">

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
                <!-- END GRID -->

                <article class="col-xs-12 col-sm-6 col-md-5 col-lg-6">
                    <!-- SINGLE GRID -->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
								<span class="widget-icon"> <i
                                        class="glyphicon glyphicon-stats"></i>
								</span>
                            <h2>实时监测</h2>

                            <ul id="myTab1" class="nav nav-tabs pull-right in"
                                style="background-color: rgb(181, 182, 188)">
                                <li class="active"><a href="#s1" data-toggle="tab" id='tab2'>动态称重</a></li>
                                <li><a href="#s2" data-toggle="tab">健康监测</a></li>
                            </ul>
                        </header>
                        <!-- widget div-->

                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding">
                                <div id="myTabContent1"
                                     class="tab-content bg-color-white no-padding" style="overflow-x: auto; overflow-y: auto; height:100%; width:100%;">
                                    <div class="tab-pane fade in active" id="s1">
                                        <div id="w-chart" style="height: 280px"
                                             class="chart-large txt-color-blue">
                                             <table style="color:black"  width="100%" class="table table-striped table-bordered table-hover">
                                             	<thead>
                                             		<tr>
                                             			<th>桥梁名称</th>
                                             			<th>接入时差</th>
                                             			<th>运行状态</th>
                                             		</tr>
                                             	</thead>
                                             	<tfoot id="tfoot1"></tfoot>
                                             </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade in" id="s2">

                                        <div id="h-chart" style="height: 280px"
                                             class="chart-large txt-color-blue">
                                             <table style="color:black"  width="100%" class="table table-striped table-bordered table-hover">
                                             	<thead>
                                             		<tr>
                                             			<th>桥梁名称</th>
                                             			<th>接入时差</th>
                                             			<th>运行状态</th>
                                             		</tr>
                                             	</thead>
                                             	<tfoot id="tfoot"></tfoot>
                                             </table>
                                        </div>
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
            <!-- end row -->

            <div class="row">
                <!-- row -->

            </div>
            <!-- end row -->

        </section>
        <!-- end widget grid -->

    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<%@ include file="footer.jsp" %>

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

<!-- Flot Chart Plugin: Flot Engine, Flot Resizer, Flot Tooltip -->

<script src="../js/plugin/flot/jquery.flot.cust.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.resize.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.fillbetween.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.orderBar.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.pie.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.time.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.tooltip.min.js"></script>


<script src="../js/plugin/moment/moment.min.js"></script>
<script src="../js/plugin/chartjs/chart.min.js"></script>

<script src="../js/plugin/morris/raphael.min.js"></script>
<script src="../js/plugin/morris/morris.min.js"></script>
<script src="../js/echarts.min.js"></script>
<script type="text/javascript"
        src="http://api.map.baidu.com/api?v=2.0&ak=BmTwezCvWyGaH3KNYkc5P6uq"></script>

<script type="text/javascript">
    //路线
    var role = '<%=session.getAttribute("userRole")%>';
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
    //项目
    var project = {
        data: [],
        init: function () {
            $.ajax({
                type: 'POST',
                url: '../StatisticsServlet',
                dataType: 'json',
                data: {
                	norm:$("#chk_type").val(),
                    type:"initProject"
                },
                error: function (msg) {
                    errMessage("请求StatisticsServlet失败");
                },
                success: function (json) {
                    project.data = json.obj;
                    project.build();
                }
            });
        },
        build: function () {
        	var chk_type = $('#chk_type').val();
            var d = $('#project');
            d.empty();
            d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < project.data.length; i++) {
            	if(project.data[i].chk_type!='often'&&project.data[i].chk_type!='daily'){
            		if(chk_type=='%' || chk_type==project.data[i].chk_type){
                		d.append('<option value="' + project.data[i].prj_id + '">' + project.data[i].prj_desc + '</option>');

            		}
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

    $('#chk_type').on('change', function(){
    	 $.ajax({
             type: 'POST',
             url: '../StatisticsServlet',
             dataType: 'json',
             data: {
             	norm:$("#chk_type").val(),
                type:"getProject"
             },
             error: function (msg) {
                 errMessage("请求StatisticsServlet失败");
             },
             success: function (json) {
                 var d = $('#project').empty();
                 d.append('<option value="%">--全部--</option>');
                 for (var i = 0; i < json.obj.length; i++) {
                 	if(json.obj[i].chk_type!='often'&&json.obj[i].chk_type!='daily'){
                     		d.append('<option value="' + json.obj[i].prj_id + '">' + json.obj[i].prj_desc + '</option>');
                 	}                     
                 }
                 d.trigger('change');
             }
         });
	});
    
    
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
            if(role=='admin'||role=='guest'||role=='superAdmin'){
				d.append('<option value="%">--全部--</option>');
			}
            for (var i = 0; i < manage.manageData.length; i++) {
                d.append("<option value='" + manage.manageData[i].org_id + "'>" + manage.manageData[i].org_name_short + "</option>");
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
            for (var i = 0; i < manage.sectionData.length; i++) {
                if (mg == '%' || mg == manage.sectionData[i].org_id) {
                    d.append("<option value='" + manage.sectionData[i].section_id + "'>" + manage.sectionData[i].section_name + "</option>");
                }
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
            for (var i = 0; i < manage.zoneData.length; i++) {
                if (mg == '%' || mg == manage.zoneData[i].org_id) {
                    d.append("<option value='" + manage.zoneData[i].zone_id + "'>" + manage.zoneData[i].zone_name + "</option>");
                }
            }
            d.trigger('change');
        }

    }


    var map;//地图
    var markers = Array();
    var infos = Array();
    var blen, plen, clen;
    function initMap() {
        map = new BMap.Map("map");
        map.centerAndZoom("江苏", 7);
        map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    }
    function queryBrg() {
        if ($(".fa-angle-down").is(":hidden")) {
            $('.fa-angle-up').click();
        }
        map.clearOverlays();
        map.centerAndZoom("江苏", 7);
        initIndexBrg();
    }
    function remove_overlay() {
        map.clearOverlays();
    }
    function addMarker(point, bridge_id, bridge_name) {
        var marker = new BMap.Marker(point);
        var content = "";
        var level = "";
        for (var i in bridgeEval) {
            if (bridgeEval[i].bridge_id == bridge_id) {
                var prj_name = bridgeEval[i].prj_name;
                var ER_STD = bridgeEval[i].eR_STD;
                var ER_LEVEL = bridgeEval[i].eR_LEVEL;
                var ER_GRADE = bridgeEval[i].eR_GRADE;
                var ER_DATE = bridgeEval[i].eR_DATE;
                if (ER_STD == undefined) {
                    ER_STD = "未知";
                }
                if (ER_LEVEL == undefined) {
                    ER_LEVEL = "未知";
                }
                if (ER_GRADE == undefined) {
                    ER_GRADE = "未知";
                }
                if (level == "" || level == "未知") {
                    level = ER_LEVEL;
                }
                content += "<tr><td>" + prj_name + "</td><td>" + ER_STD + "</td><td>" + ER_LEVEL + "</td><td>" + ER_GRADE + "</td><td>" + ER_DATE + "</td></tr>";
            }
        }
        var sContent =
            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + bridge_name + "</h4>" +
            "<table border='1'><tr><td>项目名称</td><td>评定标准</td><td>评定等级</td><td>评定分数</td><td>评定日期</td></tr>" + content + "</table>";
        if (content == "") {
            sContent =
                "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + bridge_name + "</h4>" +
                "<p>当前桥梁无数据</p>"
                myIcon = new BMap.Icon("../img/huise.png", new BMap.Size(30, 30));
           	    marker = new BMap.Marker(point, {icon: myIcon});
        } else {
            if (level == "1类") {
                myIcon = new BMap.Icon("../img/looking-green.png", new BMap.Size(30, 30));
                marker = new BMap.Marker(point, {icon: myIcon});
            } else if (level == "2类") {
                myIcon = new BMap.Icon("../img/looking-org.png", new BMap.Size(30, 30));
                marker = new BMap.Marker(point, {icon: myIcon});
            }else if(level == "3类"){
            	myIcon = new BMap.Icon("../img/red.png", new BMap.Size(30, 30));
                marker = new BMap.Marker(point, {icon: myIcon});
            }
            
            	
//		 			 marker= new BMap.Marker(new BMap.Point(point.lng,point.lat), {
//		 				  // 指定Marker的icon属性为Symbol
//		 				  icon: new BMap.Symbol(BMap_Symbol_SHAPE_POINT, {
//		 				    scale: 2,//图标缩放大小
//		 				    fillColor: "orange",//填充颜色
//		 				    fillOpacity: 0.8//填充透明度
//		 				  })
//		 				});
            //marker.setAnimation(BMAP_ANIMATION_BOUNCE);
        }
        var infoWindow = new BMap.InfoWindow(sContent);
        map.addOverlay(marker);
        if (content != "") {
            //marker.setAnimation(BMAP_ANIMATION_BOUNCE);
        }
        marker.addEventListener("click", function () {
            this.openInfoWindow(infoWindow);
        });
    }

    var dataALL = {};
    var bridgeEval = [];
    function initIndexBrg() {
        var prj_id = $("#project").val();
        var highway_id = $("#line").val();
        var manage_id = $("#manage").val();
        var section_id = $("#section").val();
        var zone_id = $("#zone").val();
        $.ajax({
            type: 'post',
            url: '../StructMgrServlet',
            data: {
                type: "initIndexBrg",
                prj_id: prj_id,
                highway_id: highway_id,
                manage_id: manage_id,
                section_id: section_id,
                zone_id: zone_id,
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                var obj = data.obj;
                dataALL = obj;
                for (var i in obj) {
                    var point = new BMap.Point(obj[i].longitude, obj[i].latitude);
                    addMarker(point, obj[i].bridge_id, obj[i].bridge_name);
                }

            },
            error: function () {
            }
        });
    }
    function getBridgeEval() {
        $.ajax({
            type: 'post',
            url: '../StructMgrServlet',
            data: {
                type: "getBridgeEval",
            },
            cache: false,
            dataType: 'json',
            success: function (data) {
                var obj = data.obj;
                bridgeEval = obj;
                console.log(bridgeEval)
            },
            error: function () {
            }
        });
    }

    function getHealth(){
		$.ajax({
			type: 'POST',
			url: '../WeightHealthServlet',
			dataType: 'json',
			data: {
				type:"initHealthTree"
			},
			error : function(msg) {
				errMessage("请求WeightHealthServlet失败");
		    },
			success : function(json) {   
				console.log(json.obj);
			    $('#tfoot').append(buildHealth(json.obj));
			}
		});
	}

	//健康监测
	function buildHealth(data){
		var tfoot = $("#tfoot");
		console.log(data.length);
			for(var i=0;i<data.length;i++){
				tfoot.append(buildHealth(data[i].children));
				if(!(data[i].bgco==undefined||data[i].bgco=="")){	
							tfoot.append("<tr>"+"<td>"+data[i].name+"</td>"+
									  "<td>"+formatEndTime(data[i].bgco)+"</td>"+
									  "<td>"+getState(data[i].bgco)+"</td>"+"</tr>")		
				}
			}	
		return tfoot;
	}
	
	
	function getWeight(){
		$.ajax({
			type: 'POST',
			url: '../WeightHealthServlet',
			dataType: 'json',
			data: {
				type:"initWeightTree"
			},
			error : function(msg) {
				errMessage("请求WeightHealthServlet失败");
		    },
			success : function(json) {   
				console.log(json.obj);
			    $('#tfoot1').append(buildWeight(json.obj));
			}
		});
	}

	//动态称重
	function buildWeight(data){
		var tfoot = $("#tfoot1");
		for(var i=0;i<data.length;i++){
				tfoot.append(buildWeight(data[i].children));
				if(!(data[i].bgco==undefined||data[i].bgco=="")){	
							tfoot.append("<tr>"+"<td>"+data[i].name+"</td>"+
									  "<td>"+formatEndTime(data[i].bgco)+"</td>"+
									  "<td>"+getState(data[i].bgco)+"</td>"+"</tr>")		
				}
			}
		return tfoot;
	}
	
	
	function formatEndTime(end_time){
		if(end_time=='0'){
			return '没有数据接入';
		}
		var nowtime=new Date().getTime();
		var endtime=new Date(end_time).getTime();
		var i=parseInt((nowtime-endtime)/60000);
		if(i<=60){
			return i+'分钟前接入';
		}else{
			i=parseInt(i/60);
			if(i<=24){
				return i+'小时前接入';
			}else{
				i=parseInt(i/24);
				return i+'天前接入';
			}
		}
	}
	
	function getState(end_time){
		if(end_time=='0'){
			return "<font style='color:red'>异常</font>";
		}
		var nowtime=new Date().getTime();
		var endtime=new Date(end_time).getTime();
		var i=parseInt((nowtime-endtime)/60000);
		if(i<=60){
			return "<font style='color:green'>正常</font>";
		}else{	
			return "<font style='color:red'>异常</font>";
		}
	}
	
    var weight;//动态称重数组
    var health;//健康监测数组
    var myChartW;//动态称重图表
    var myChartH;//健康监测图表
    $(document).ready(function () {
  //      getStatisFilesData();//获取统计文件数据
  //      $('#tab2').on('shown.bs.tab', function (e) {
            //tab2点击事件 @author 马潇霄
   //         myChartH.resize();//重新定义健康监测图表大小
  //      });
  //      initEchars();//初始化Echars图表
  		
		getHealth();
		getWeight();
        pageSetUp();
        line.init();
        project.init();
        manage.init();
        initMap();
        getBridgeEval();
        $.ajax({
            type: 'post',
            url: '../GetLogServlet',
            data: {},
            cache: false,
            dataType: 'json',
            success: function (data) {
                var html = '';
                var len = (data.log.length <= 10) ? data.log.length
                    : 10;
                for (var i = 0; i < len; i++) {
                    html = html
                        + '<tr><td>'
                        + (i + 1)
                        + '</td><td>'
                        + data.log[i].log_content
                        + '</td><td>'
                        + data.log[i].log_time
                        + '</td><tr>';
                }
                for (var i = len; i < 10; i++) {
                    html = html
                        + '<tr><td>'
                        + (i + 1)
                        + '</td><td></td><td></td><tr>';
                }
                $('#log').html(html);
            },
            error: function () {
            }
        });
        setTimeout(' queryBrg()',1500);

    });


    function query() {
        var c = $('#struct').val();
        for (var i = 0; i < markers.length; i++) {
            if (markers[i]) {
                markers[i].closeInfoWindow();
            }
        }
        var infoWindow = new BMap.InfoWindow("<h5>" + infos[c] + "</h5>");
        markers[c].openInfoWindow(infoWindow);
        map.centerAndZoom(markers[c].getPosition(), 9);
    }


    function getStatisFilesData() {
        //获取统计文件数据  @author 马潇霄
        $.ajax({
            type: 'get',
            url: '../IndexServlet',
            data: {},
            async: false,
            cache: false,
            dataType: 'json',
            success: function (data) {
                weight = data.obj.health;
                health = data.obj.weight;
            },
            error: function () {
            }
        });
    }


    $('#collapseOne').on('show.bs.collapse', function () {
        $('.fa-angle-up').show();
        $('.fa-angle-down').hide();
    });
    $('#collapseOne').on('hide.bs.collapse', function () {
        $('.fa-angle-up').hide();
        $('.fa-angle-down').show();
    });

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