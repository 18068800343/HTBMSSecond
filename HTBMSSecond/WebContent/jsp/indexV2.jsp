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
             	                <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <!-- SINGLE GRID -->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-15"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
							<span class="widget-icon"> <i
                                        class="glyphicon glyphicon-comment"></i>
								</span>
                            <h2>分区路段</h2>
                        </header>
                        <!-- widget div-->

                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding" style="height: 30px">
                            <div  style="height:20px; margin-top: 5px">
                            	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-3">
								<label>路线名称</label>
								<select class="form-control" id="freeway">
								</select>
								</div>
								
								<div class="col-xs-2 col-sm-2 col-md-2 col-lg-3">
								<label>管养单位</label>
								<select class="form-control" id="custody">
								</select>
								</div>
								
								<div class="col-xs-2 col-sm-2 col-md-2 col-lg-3">
								<label>所属路段</label>
								<select class="form-control" id="section">
								</select>
								</div>
								
								<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
								<label>所属分区</label>
								<select class="form-control" id="zone">
								</select>
								</div>
								<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
								<button style="margin-top: 20px;margin-left: 20px" onclick="search()" class="btn btn-primary">确定</button>
								</div>
								</div>
                            </div>
                            <!-- end widget content -->
                        </div>
                        <!-- end widget div -->
                    </div>
                    <!-- end widget -->

                </article>
                
                <article class="col-xs-5 col-sm-5 col-md-5 col-lg-5"
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
                		<div style="margin-top: 5px">
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>评定标准</label>
												<select style="width:100%" class="form-control input-sm select2"  id="chk_type">
													<option value="%">--全部--</option>
													<option value="2004">04评定</option>
													<option value="2011">11评定</option>
												</select>
                                            </div> 
                                            <div class="form-group col-xs-12 col-sm-6 col-lg-6">
                                                <label>检查项目</label>
                                                <select style="width:100%" class="form-control input-sm select2"
                                                        id="project">
                                                </select>
                                            </div>
                                            </div>
                                <!-- <div id="vector-map" class="vector-map"></div>
                                    <div id="heat-fill">
                                        <span class="fill-a">0</span>
                                        <span class="fill-b">5,000</span>
                                    </div> -->

                                <div class="col-xs-12" id="map"
                                     style="max-height: 1500px; min-height: 785px; padding-top: 0px; padding-left: 2px; height: auto;">
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

                <article class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                    <!-- SINGLE GRID -->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                        <div class="col-xs-9 col-sm-9 col-md-9">
							<span class="widget-icon"> <i
                                        class="glyphicon glyphicon-stats"></i>
								</span>
                            <h2>基本信息</h2>
                        </div>
							<div class="col-xs-3 col-sm-3 col-md-3">
									<select class="form-control input-sm" id=brgType onchange="initBrgType()">
										<option value='brg1'>桥梁分类</option>
										<option value='brg2'>功能类型</option>
										<option value='brg3'>桥梁类型</option>	
									</select>
							</div>
                        </header>
                        <!-- widget div-->

                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding">
								<div class="col-xs-8 col-sm-8 col-md-6">
                                <div  id="base"  style="width:auto; height:240px;"></div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-6">
                                <div id="pie" style="width:auto; height:240px;"></div>
                            	</div>
                            <!-- end widget content -->
                        </div>
                        <!-- end widget div -->
                    </div>
                    <!-- end widget -->

                </article>
                <!-- END GRID -->

                <article class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
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
                            <h2>技术状况评定</h2>
                            <ul id="myTab1" class="nav nav-tabs pull-right in"
                                style="background-color: rgb(181, 182, 188)">
                                <li class='active'><a onclick="showNow()"  id='tab2'>现状</a></li>
                                <li><a onclick="showDevelop()" id='tab1'>发展</a></li>
                            </ul>
                        </header>
                        <!-- widget div-->

                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding">
                                    <div id="s1">
                                        <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div id="tech1" style="width: auto;height: 240px"></div>
                                        </div>
                                    </div>
                                    <div id="s2">
                                        <div class="col-xs-9 col-sm-9 col-md-9">
                                        	<div id="tech2" style="width: auto;height: 240px">
                                        	</div>
                                        </div>
                                        <div style="margin-top: 20px" class="col-xs-3 col-sm-3 col-md-3">
                                        	<label>评定标准</label>
                                        	<select class="form-control evaType" style="width:140px" onchange="initEvaType()">
                                        	<option value='2004'>2004标准</option>
                                        	<option value='2011'>2011标准</option>
                                        	</select>
                                        </div>
                                    </div>
                            </div>
                            <!-- end widget content -->
                        </div>
                        <!-- end widget div -->
                    </div>
                    <!-- end widget -->

                </article>
                 <article class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
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
                            <h2>病害</h2>
							<!-- 
                            <ul id="myTab1" class="nav nav-tabs pull-right in"
                                style="background-color: rgb(181, 182, 188)">
                                <li class="active"><a href="#s1" data-toggle="tab" id='tab2'>动态称重</a></li>
                                <li><a href="#s2" data-toggle="tab">健康监测</a></li>
                            </ul>
                             -->
                        </header>
                        <!-- widget div-->

                        <div>
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding" style="height: 245px; overflow-y: auto;">
                            	<div class="col-xs-8 col-sm-8 col-md-7">
                            		<div id="defect" style="width: auto;height: 240px"></div>
                            	</div>
                            	<div class="form-group col-xs-4 col-sm-4 col-md-4">
                            		<div style="margin-top: 2px">
                            		<label>桥型</label>
                            		<select class="form-control select2" id='bridgeType' onchange='initDisease()'>
                            		</select>	
                            		</div>
                            		<div style="margin-top: 2px">
                            		<label>构件类型</label>
                            		<select class="form-control select2" id='componentType' onchange='initDisease()'>
                            		</select>	
                            		</div>
                            		<div style="margin-top: 2px">
                            		<label>病害族</label>
                            		<select class="form-control select2" id='disease' onchange='initDisease()'>
                            		</select>	
                            		</div>
                            		<div style="margin-top: 2px">
                            		<label>病害类型</label>
                            		<select class="form-control select2" id='diseaseType' onchange='initDisease()'>
                            		</select>	
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
    var count=0;
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
    var tag = "s1";
    function showNow(){
    	$('#s1').show();
    	$('#s2').hide();
    	$('#tab2').css("background-color","white");
    	$('#tab1').css("background-color","#ccccc");
    	tag = "s1"
    }
    
    function showDevelop(){
    	
    	$('#s1').hide();
    	$('#s2').show();
    	$('#tab1').css("background-color","white");
    	$('#tab2').css("background-color","#ccccc");
    	tag = "s2"
    } 
    
    var allEva={};
    function initAllEVa(){
    	$.ajax({
            type: 'POST',
            url: '../Index2Servlet',
            dataType: 'json',
            data: {
            	norm:"%",
               	type:"getProject",
               	highway_id: $("#freeway").val(),
                manage_id: $("#custody").val(),
                section_id: $("#section").val(),
                zone_id: $("#zone").val()
            },
            error: function (msg) {
                errMessage("请求StatisticsServlet失败");
            },
            success: function (json) {       
                allEva=json.obj;
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
    }
    
    var eva2004={};
    function init2004EVa(){
    	$.ajax({
            type: 'POST',
            url: '../Index2Servlet',
            dataType: 'json',
            data: {
            	norm:"2004",
               	type:"getProject",
               	highway_id: $("#freeway").val(),
                manage_id: $("#custody").val(),
                section_id: $("#section").val(),
                zone_id: $("#zone").val()
            },
            error: function (msg) {
                errMessage("请求StatisticsServlet失败");
            },
            success: function (json) {
            	eva2004=json.obj;
            }
        });
    }
    
    
    var eva2011={};
    function init2011EVa(){
    	$.ajax({
            type: 'POST',
            url: '../Index2Servlet',
            dataType: 'json',
            data: {
            	norm:"2011",
               	type:"getProject",
               	highway_id: $("#freeway").val(),
                manage_id: $("#custody").val(),
                section_id: $("#section").val(),
                zone_id: $("#zone").val()
            },
            error: function (msg) {
                errMessage("请求StatisticsServlet失败");
            },
            success: function (json) {
            	eva2011=json.obj;
            }
        });
    }
    
    
    $('#chk_type').on('change', function(){
    	var norm=$("#chk_type").val();
    	var d = $('#project').html('');
    	if(norm=="%"){
    		d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < allEva.length; i++) {
            	if(allEva[i].chk_type!='often'&&allEva[i].chk_type!='daily'){
                		d.append('<option value="' + allEva[i].prj_id + '">' + allEva[i].prj_desc + '</option>');
            	}                     
            }
    	}
    	if(norm=="2004"){
    		d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < eva2004.length; i++) {
               	d.append('<option value="' + eva2004[i].prj_id + '">' + eva2004[i].prj_desc + '</option>');
            }
    	}
    	if(norm=="2011"){
    		d.append('<option value="%">--全部--</option>');
            for (var i = 0; i < eva2011.length; i++) {
               	d.append('<option value="' + eva2011[i].prj_id + '">' + eva2011[i].prj_desc + '</option>');
            }
    	}
    	d.trigger("change");
    });
    
    
    $('#project').on('change', function(){
    	queryBrg();
    });
    
    function initbridgeType(){
    	var d=$('#bridgeType').html('');
    	$.ajax({
			type: 'POST',
			url: '../StatisticsServlet',
			dataType: 'json',
			data: {
				type:"initStructType"
			},
			error : function(msg) {
				errMessage("请求StatisticsServlet失败");
		    },
			success : function(json) { 
            	d.append('<option value="%">--全部--</option>');
            	for(var i=0;i<json.obj.bridge.length;i++){
            		d.append('<option value="' + json.obj.bridge[i].name + '">' + json.obj.bridge[i].name + '</option>')
            	}
            	d.select2();
			}
		    
    	});
    }
    
    function initcomponentType(){
    	var d=$('#componentType').html('');
    	$.ajax({
			type: 'POST',
			url: '../DicMemTypeServlet',
			dataType: 'json',
			data: {
				type:"initMemType"
			},
			error : function(msg) {
				errMessage("请求DicMemTypeServlet失败");
		    },
			success : function(json) { 
				d.append('<option value="%">--全部--</option>');
				for(var i=0;i<json.obj.length;i++){
					d.append('<option value="' + json.obj[i].member_name + '">'+json.obj[i].member_name+'</option>');
				}
				d.select2();
			}
    	});
    }
    
    var defect={
    		defectData: {},
    		init:function(){
    			var d=$('#disease');
    			var e=$('#diseaseType').html('');
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
                    	d.html('');
                    	e.append('<option value="%">--全部--</option>')
                    	d.append('<option value="%">--全部--</option>');
                    	for(var i=0;i<json.obj.length;i++){
                    		defect.defectData[json.obj[i].defect_f_name] = json.obj[i].defects;
                    		d.append('<option value="' + json.obj[i].defect_f_name + '">'+json.obj[i].defect_f_name+'</option>');
                    	}
                    	d.select2();
                    	e.select2();
                    }
    			});
    		}
    }
    
	$('#disease').on("change",function(){
		changeDefactType();
	});
    
    function changeDefactType(){
    	var d=$('#disease').val();
    	var e=$('#diseaseType').html('');
    	var date=defect.defectData[d];
    	if(d=='%'){
    		e.append('<option value="%">--全部--</option>')
    	}else{
    		e.append('<option value="%">--全部--</option>')
    		for(var i=0;i<date.length;i++){
    			e.append('<option value="'+date[i].defect_name+'">'+date[i].defect_name+'</option>')
    		}
    		e.select2();
    	}
    	
    }
    /*********************************************************************************************/
    var myChart1 = echarts.init(document.getElementById('base'));
    var myChart2 = echarts.init(document.getElementById('pie'));
    var myChart3 = echarts.init(document.getElementById('defect'));
    var tech1 = echarts.init(document.getElementById('tech1'));
    var tech2 = echarts.init(document.getElementById('tech2'));
    
     function initEvaType(){
    	var evaType=$('.evaType').val();
    	$.ajax({
    		type: 'POST',
            url: '../Index2Servlet',
            dataType: 'json',
            data: {
                type: "initEvaType",
                highway_id: $("#freeway").val(),
                manage_id: $("#custody").val(),
                section_id: $("#section").val(),
                zone_id: $("#zone").val()
            },
            error: function (msg) {
                errMessage("请求Index2Servlet失败");
            },
            success:function(json){
            	if(evaType=='2004'){
            		var	option_tech2 = {
                		    color: ['#003366', '#006699', '#4cabce'],
                		    tooltip: {
                		        trigger: 'axis',
                		        axisPointer: {
                		            type: 'shadow'
                		        }
                		    },
                		    legend: {
                		        data: ['一类', '二类', '三类']
                		    },
                		    calculable: true,
                		    xAxis: [
                		        {
                		            type: 'category',
                		            axisTick: {show: false},
                		            data: ['2015', '2016', '2017']
                		        }
                		    ],
                		    yAxis: [
                		        {
                		            type: 'value'
                		        }
                		    ],
                		    series: [
                		        {
                		            name: '一类',
                		            type: 'bar',
                		            barGap: 0,
                		            data: [json.obj.evaType1[0], json.obj.evaType2[0], json.obj.evaType3[0]]
                		        },
                		        {
                		            name: '二类',
                		            type: 'bar',
                		            data: [json.obj.evaType1[1], json.obj.evaType2[1], json.obj.evaType3[1]]
                		        },
                		        {
                		            name: '三类',
                		            type: 'bar',
                		            data: [json.obj.evaType1[2], json.obj.evaType2[2], json.obj.evaType3[2]]
                		        }
                		    ]
                		};
            	}else{
            		var	option_tech2 = {
                		    color: ['#003366', '#006699', '#4cabce'],
                		    tooltip: {
                		        trigger: 'axis',
                		        axisPointer: {
                		            type: 'shadow'
                		        }
                		    },
                		    legend: {
                		        data: ['一类', '二类', '三类']
                		    },
                		    calculable: true,
                		    xAxis: [
                		        {
                		            type: 'category',
                		            axisTick: {show: false},
                		            data: ['2015', '2016', '2017']
                		        }
                		    ],
                		    yAxis: [
                		        {
                		            type: 'value'
                		        }
                		    ],
                		    series: [
                		        {
                		            name: '一类',
                		            type: 'bar',
                		            barGap: 0,
                		            data: [json.obj.evaType4[0], json.obj.evaType5[0], json.obj.evaType6[0]]
                		        },
                		        {
                		            name: '二类',
                		            type: 'bar',
                		            data: [json.obj.evaType4[1], json.obj.evaType5[1], json.obj.evaType6[1]]
                		        },
                		        {
                		            name: '三类',
                		            type: 'bar',
                		            data: [json.obj.evaType4[2], json.obj.evaType5[2], json.obj.evaType6[2]]
                		        }
                		    ]
                		};
            	}
            	
            	tech2.setOption(option_tech2);
            	if (tag=="s2") {
            		
				}else{
					$("#s2").hide();
				}
            	
            }
    	});
    } 
    
    
    function initBrgType(){
    	var brgType =$('#brgType').val();
    	$.ajax({
    		type: 'POST',
            url: '../Index2Servlet',
            dataType: 'json',
            data: {
                type: "getBrgDate",
                highway_id: $("#freeway").val(),
                manage_id: $("#custody").val(),
                section_id: $("#section").val(),
                zone_id: $("#zone").val()
            },
            error: function (msg) {
                errMessage("请求Index2Servlet失败");
            },
            success:function(json){
		    	if(brgType=='brg1'){
		    		var  option = {
		    		   	    title : {
		    		        text: '桥梁分类',
		    		    },
		    		    color: ['#91c7ae'],
		    		    tooltip : {
		    		        trigger: 'axis',
		    		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		    		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		    		        }
		    		    },
		    		    grid: {
		    		        left: '3%',
		    		        right: '4%',
		    		        bottom: '3%',
		    		        containLabel: true
		    		    },
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data : ['特大桥', '大桥', '中桥','小桥'],
		    		            axisTick: {
		    		                alignWithLabel: true
		    		            }
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		            type : 'value'
		    		        }
		    		    ],
		    		    series : [
		    		        {
		    		            name:'数量',
		    		            type:'bar',
		    		            barWidth: '60%',
		    		            data:[json.obj.brg1[0], json.obj.brg1[1], json.obj.brg1[2],json.obj.brg1[3]]
		    		        }
		    		    ]
		    		};
		    		
		    		var	option_pie = {
		    			    title : {
		    			        text: '',
		    			        subtext: '',
		    			        x:'center'
		    			    },
		    			    tooltip : {
		    			        trigger: 'item',
		    			        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    			    },
		    			    series : [
		    			        {
		    			            name: '桥梁分类',
		    			            type: 'pie',
		    			            radius : '60%',
		    			            center: ['50%', '50%'],
		    			            data:[
		    			                {value:json.obj.brg1[0], name:'特大桥'},
		    			                {value:json.obj.brg1[1], name:'大桥'},
		    			                {value:json.obj.brg1[2], name:'中桥'},
		    			                {value:json.obj.brg1[3], name:'小桥'}
		    			            ],
		    			            itemStyle: {
		    			                emphasis: {
		    			                    shadowBlur: 10,
		    			                    shadowOffsetX: 0,
		    			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		    			                }
		    			            }
		    			        }
		    			    ]
		    			};
		    	}else if(brgType=='brg2'){
		    		var  option = {
		    		   	    title : {
		    		        text: '功能类型',
		    		    },
		    		    color: ['#91c7ae'],
		    		    tooltip : {
		    		        trigger: 'axis',
		    		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		    		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		    		        }
		    		    },
		    		    grid: {
		    		        left: '3%',
		    		        right: '4%',
		    		        bottom: '3%',
		    		        containLabel: true
		    		    },
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data : ['主线桥', '匝道桥', '上跨桥'],
		    		            axisTick: {
		    		                alignWithLabel: true
		    		            }
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		            type : 'value'
		    		        }
		    		    ],
		    		    series : [
		    		        {
		    		            name:'数量',
		    		            type:'bar',
		    		            barWidth: '70%',
		    		            data:[json.obj.brg2[0], json.obj.brg2[1], json.obj.brg2[2]]
		    		        }
		    		    ]
		    		};
		    		
		    		var	option_pie = {
		    			    title : {
		    			        text: '',
		    			        subtext: '',
		    			        x:'center'
		    			    },
		    			    tooltip : {
		    			        trigger: 'item',
		    			        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    			    },
		    			    series : [
		    			        {
		    			            name: '功能类型',
		    			            type: 'pie',
		    			            radius : '60%',
		    			            center: ['50%', '50%'],
		    			            data:[
		    			                {value:json.obj.brg2[0], name:'主线桥'},
		    			                {value:json.obj.brg2[1], name:'匝道桥'},
		    			                {value:json.obj.brg2[2], name:'上跨桥'}
		    			            ],
		    			            itemStyle: {
		    			                emphasis: {
		    			                    shadowBlur: 10,
		    			                    shadowOffsetX: 0,
		    			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		    			                }
		    			            }
		    			        }
		    			    ]
		    			};
		    	}else{
		    		var  option = {
		    		   	    title : {
		    		        text: '桥梁类型',
		    		    },
		    		    color: ['#91c7ae'],
		    		    tooltip : {
		    		        trigger: 'axis',
		    		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		    		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		    		        }
		    		    },
		    		    grid: {
		    		        left: '3%',
		    		        right: '4%',
		    		        bottom: '3%',
		    		        containLabel: true
		    		    },
		    		    xAxis : [
		    		        {
		    		            type : 'category',
		    		            data : ['组合箱梁', '空心板', '连续箱梁','T梁'],
		    		            axisTick: {
		    		                alignWithLabel: true
		    		            }
		    		        }
		    		    ],
		    		    yAxis : [
		    		        {
		    		            type : 'value'
		    		        }
		    		    ],
		    		    series : [
		    		        {
		    		            name:'数量',
		    		            type:'bar',
		    		            barWidth: '60%',
		    		            data:[json.obj.brg3[0], json.obj.brg3[1], json.obj.brg3[2],json.obj.brg3[3]]
		    		        }
		    		    ]
		    		};
		    		
		    		var	option_pie = {
		    			    title : {
		    			        text: '',
		    			        subtext: '',
		    			        x:'center'
		    			    },
		    			    tooltip : {
		    			        trigger: 'item',
		    			        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    			    },
		    			    series : [
		    			        {
		    			            name: '桥梁类型',
		    			            type: 'pie',
		    			            radius : '60%',
		    			            center: ['50%', '50%'],
		    			            data:[
		    			                {value:json.obj.brg3[0], name:'组合箱梁'},
		    			                {value:json.obj.brg3[1], name:'空心板'},
		    			                {value:json.obj.brg3[2], name:'连续箱梁'},
		    			                {value:json.obj.brg3[3], name:'T梁'}
		    			            ],
		    			            itemStyle: {
		    			                emphasis: {
		    			                    shadowBlur: 10,
		    			                    shadowOffsetX: 0,
		    			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		    			                }
		    			            }
		    			        }
		    			    ]
		    			};
		    	}
		    	myChart1.setOption(option);
		    	myChart2.setOption(option_pie);
            }
    	})
    }
    
	
	
	function initEvaDate(){
		$.ajax({
    		type: 'POST',
            url: '../Index2Servlet',
            dataType: 'json',
            data: {
                type: "getEvaDate",
                highway_id: $("#freeway").val(),
                manage_id: $("#custody").val(),
                section_id: $("#section").val(),
                zone_id: $("#zone").val()
            },
            error: function (msg) {
                errMessage("请求Index2Servlet失败");
            },
            success:function(json){
            	var	option_tech1 = {
            		    color: ['#003366', '#006699', '#4cabce', '#e5323e'],
            		    tooltip: {
            		        trigger: 'axis',
            		        axisPointer: {
            		            type: 'shadow'
            		        }
            		    },
            		    legend: {
            		        data: ['一类', '二类', '三类']
            		    },
            		    calculable: true,
            		    xAxis: [
            		        {
            		            type: 'category',
            		            axisTick: {show: false},
            		            data: ['空心板', '组合箱梁', '连续箱梁', 'T梁']
            		        }
            		    ],
            		    yAxis: [
            		        {
            		            type: 'value'
            		        }
            		    ],
            		    series: [
            		        {
            		            name: '一类',
            		            type: 'bar',
            		            barGap: 0,
            		            data: [json.obj.eva1[0], json.obj.eva2[0], json.obj.eva3[0], json.obj.eva4[0]]
            		        },
            		        {
            		            name: '二类',
            		            type: 'bar',
            		            data: [json.obj.eva1[1], json.obj.eva2[1], json.obj.eva3[1], json.obj.eva4[1]]
            		        },
            		        {
            		            name: '三类',
            		            type: 'bar',
            		            data: [json.obj.eva1[2], json.obj.eva2[2], json.obj.eva3[2], json.obj.eva4[2]]
            		        }
            		    ]
            		};
            	
            	tech1.setOption(option_tech1);
            }
		});
	}
	
	
	function initDisease(){
		var a=$('#bridgeType').val();
		var b=$('#componentType').val();
		var c=$('#disease').val();
		var d=$('#diseaseType').val();
		$.ajax({
			type: 'POST',
			url: '../Index2Servlet',
			dataType: 'json',
			data: {
				bridgeType:a,
				componentType:b,
				disease:c,
				diseaseType:d,
				type:"initDisease",
				highway_id: $("#freeway").val(),
                manage_id: $("#custody").val(),
                section_id: $("#section").val(),
                zone_id: $("#zone").val()
			},
			error : function(msg) {
				errMessage("请求Index2Servlet失败");
		    },
			success : function(json) { 
				var	option_defect = {
						 title : {
					        text: '病害统计',
					    },
					    color: ['#3398DB'],
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    grid: {
					        left: '3%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
					    },
					    xAxis : [
					        {
					            type : 'category',
					            data : [json.obj.year[0], json.obj.year[1], json.obj.year[2]],
					            axisTick: {
					                alignWithLabel: true
					            }
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value'
					        }
					    ],
					    series : [
					        {
					            name:'病害数量',
					            type:'bar',
					            barWidth: '60%',
					            data:[json.obj.num[0],json.obj.num[1],json.obj.num[2]]
					        }
					    ]
					}; 
				myChart3.setOption(option_defect);
			}
		});
	};

   	$('#freeway').on('change',function(){
   		$('#custody').val("%").trigger('change');
   		$('#section').val("%").trigger('change');
   		$('#zone').val("%").trigger('change');
   	});
   	
   	
   	//路线名称
   	function initFreeway(){
   		var d= $('#freeway').html('');
	   	 $.ajax({
	         type: 'POST',
	         url: '../LineMgrServlet',
	         dataType: 'json',
	         data: {
	             type: "initTable"
	         },
	         success:function(json){
	        	 d.append('<option value="%">--全部--</option>');
	        	 for (var i = 0; i < json.obj.length; i++) {
	                 d.append("<option value='" + json.obj[i].highway_id + "'>" + json.obj[i].highway_name + "</option>");
	             }
	             d.select2();
	         }
	   	 });
	   	count++;
   	}
   	
   	function initAjax(){
   		if(count==4){
	   		initAllEVa();
	   		init2004EVa();
	   		init2011EVa();
	   		initBrgType();
	   		initEvaDate();
	   		initEvaType();
	   		initDisease();
	   		queryBrg();
	   		window.clearInterval(t1);
   		}
   	}
   	
    var custody = {
    		custodyData: undefined,
            sectionData: undefined,
            zoneData: undefined,
            init: function () {
                this.initCustody();   //管养单位
                this.initSection();   //所属路段
                this.initZone();      //所属分区
                $('#custody').on('change', function () {
                	custody.buildSection();
                	custody.buildZone();
                });
            },
            initCustody: function () {
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
                        	custody.custodyData = json.obj;
                        	custody.buildCustody();
                        }
                    }
                });
            },
            buildCustody: function () {
                var d = $('#custody');
                d.empty();
                if(role=='admin'||role=='guest'||role=='superAdmin'){
    				d.append('<option value="%">--全部--</option>');
    			}
                for (var i = 0; i < custody.custodyData.length; i++) {
                    d.append("<option value='" + custody.custodyData[i].org_id + "'>" + custody.custodyData[i].org_name_short + "</option>");
                }
                d.select2();
                count++;
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
                        errMessage("请求StructMgrServlet失败");
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
                        	custody.sectionData = json.obj;
                        	custody.buildSection();
                        }
                    }
                });
            },
            buildSection: function () {
                var mg = $('#custody').val();
                if (custody.sectionData == undefined || mg == null) {
                    setTimeout(function () {
                    	custody.buildSection();
                    }, 1500);
                    return;
                }
                var d = $('#section');
                d.empty();
                d.append('<option value="%">--全部--</option>');
                for (var i = 0; i < custody.sectionData.length; i++) {
                    if (mg == '%' || mg == custody.sectionData[i].org_id) {
                        d.append("<option value='" + custody.sectionData[i].section_id + "'>" + custody.sectionData[i].section_name + "</option>");
                    }
                }
                d.select2();
                count++;
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
                        errMessage("请求StructMgrServlet失败");
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
                        	custody.zoneData = json.obj;
                        	custody.buildZone();
                        }
                    }
                });
            },
            buildZone: function () {
                var mg = $('#custody').val();
                 if (custody.zoneData == undefined || mg == null) {
                    setTimeout(function () {
                    	custody.buildZone();
                    }, 1500);
                    return;
                } 
                var d = $('#zone');
                d.empty();
                d.append('<option value="%">--全部--</option>');
                for (var i = 0; i < custody.zoneData.length; i++) {
                    if (mg == '%' || mg == custody.zoneData[i].org_id) {
                        d.append("<option value='" +custody.zoneData[i].zone_id + "'>" + custody.zoneData[i].zone_name + "</option>");
                    }
                }
                d.select2();
                count++;
            }
    }
	
    /************************************************************************************************/
 
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
        var eva_type=$("#chk_type").val();
        var highway_id = $("#freeway").val();
        var manage_id = $("#custody").val();
        var section_id = $("#section").val();
        var zone_id = $("#zone").val();
        $.ajax({
            type: 'post',
            url: '../Index2Servlet',
            data: {
                type: "initIndexBrg",
                prj_id: prj_id,
                eva_type:eva_type,
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
            },
            error: function () {
            }
        });
    }

    function  search(){
    	$('#chk_type').val('%');
    	$('#project').val('%');
    	queryBrg();
        initBrgType();
        initEvaDate();
        initDisease();
        initAllEVa();
        init2004EVa();
        init2011EVa();
    }
    var t1 ;
    var myChartW;//动态称重图表
    var myChartH;//健康监测图表
    $(document).ready(function () {
    	initFreeway();//路线名称
    	custody.init();//管养单位+所属路段+所属分区
    	initbridgeType();//桥型
    	initcomponentType();//构件类型
    	defect.init();//病害
        initMap();//地图
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
   //     setTimeout(' queryBrg()',1000); //地图坐标信息
        t1 = window.setInterval('initAjax()',500); 
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