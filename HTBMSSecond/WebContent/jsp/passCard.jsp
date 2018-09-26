<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/font.css">
	<link rel="stylesheet" href="check/jquery.datetimepicker.css" />
<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/smartadmin-skins.min.css">

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

<link rel="stylesheet" href="../jstree/themes/default/style.min.css" />
<style>
.treess:hover {
	background-color: #ccc;
	cursor: pointer;
}
.no-close .ui-dialog-titlebar-close {
  		display: none;
		}
</style>
</head>
<body class="">
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>

	<!-- #MAIN PANEL -->
	<div id="main" role="main">

		<!-- RIBBON -->
		<div id="ribbon">

			<span class="ribbon-button-alignment"> <span id="refresh"
				class="btn btn-ribbon" data-action="resetWidgets"
				data-title="refresh" rel="tooltip" data-placement="bottom"
				data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
				data-html="true"> <i class="fa fa-refresh"></i> </span> </span>

			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>检查评定</li>
				<li>结构</li>
				<li>通道卡片</li>
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
					<%@include file="currentStruct.jsp"%>
					<!-- SINGLE GRID -->
					<article class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
						<!-- new widget -->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

							<header>
								<span class="widget-icon"> <i class="fa fa-road"></i> </span>
								<h2>通道卡片</h2>
							</header>

							<!-- widget div-->
							<div class="no-padding">
								<!-- widget edit box -->
								<div class="jarviswidget-editbox"></div>
								<!-- end widget edit box -->

								<div class="widget-body no-padding-bottom">
									<div class="widget-body-toolbar bg-color-white">
										<div class="row">
											<table id='table6' class="table table-bordered">
												<div class="col-sm-12 col-md-12 text-align-right">
													<!-- <button onclick="upload()" type="submit" class="btn btn-primary">
															上传
														</button> -->
													<button id="edit" onclick="editOperation()" type="submit"
														class="btn btn-primary">修改</button>
												</div>

											</table>
										</div>
									</div>
									<table id="dt_basic" class="table table-bordered table-striped">

									</table>
									<!-- end content -->
								</div>

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
		<!-- 		</div> -->
		<!-- END #MAIN PANEL -->
		<div id="opera" hidden="hidden">
			<form class="smart-form">
				<fieldset>
					<table class="table table-bordered table-striped">
					<tr>
					<th><label>路线名称</label></th>
					<td style="width:250px"><select class="form-control select2"
							style="width:100%"  id="edit_highway_name">
						</select></td>
					<th><label>通道名称</label></th>	
					<td style="width:250px"><input class="form-control" id="edit_pass_name"
							value="" placeholder="" type="text"></td>
					</tr>
					<tr>
					<th><label>中心桩号</label></th>
					<td><input class="form-control" id="edit_stub_no"
							value=""  placeholder="" type="text"></td>
					<th><label>通道编号</label></th>
					<td><input class="form-control" id="edit_pass_no"
							value="" placeholder="" type="text"></td>
					</tr>
					<tr>
					<th><label>斜交角度</label> </th>
					<td><input class="form-control" id="edit_skew_angle"
							value="" placeholder="" type="text"></td>
					<th><label>跨径组成</label> </th>
					<td><input class="form-control" id="edit_span_build"
							value="" placeholder="" type="text"></td>
					</tr>
					<tr>
					<th><label>建成年月</label> </th>
					<td><input class="form-control"
							id="edit_build_year" value="" placeholder="" type="text"></td>
					<th><label>通道类型</label></th>
					<td> <select class="form-control select2"
							style="width:100%" id="edit_pass_type">
						</select></td>
					</tr>
					<tr>
					<th><label>使用类型</label></th>
					<td><input class="form-control"
							id="edit_use_type" value="" placeholder="" type="text"></td>
					<th><label>经纬度坐标</label></th>
					<td><input class="form-control" id="edit_location" value="" placeholder="" type="text">
						</div></td>
					</tr>
					<tr>
					<th><label>管养单位</label><font style="color: red">*</font></th>
					<td><select class="form-control" id="maintain_org" style="width: 100%">
							</select></td>
					<th><label>所属路段</label><font style="color: red">*</font></th>
					<td><select class="form-control" id="edit_section" style="width: 100%"></select></td>
					</tr>
					<tr>
					<th><label>所属分区</label><font style="color: red">*</font></th>
					<td><select class="form-control" id="edit_zone" style="width: 100%"></td>
					<th></th>
					<td></td>
					</tr>
					</table>
					<!-- 
					<div class="form-group">
						<label>立面照</label> <input name="lmz" id="lmz" type="file">
						</div>
						<div class="form-group">
						<label>桥面正面照</label> <input  name="zmz" id="zmz" type="file">
						</div>
						 -->
				</fieldset>
			</form>
		</div>
		<div id="new_pass" hidden="hidden">
			<fieldset>
				<div class="form-group">
					<label>通道编号</label><font style="color: red">*</font>
					 <input class="form-control" id="new_pass_no" value="" placeholder="编号" type="text">
				</div>
				<div class="form-group">
					<label>通道名称</label>
					<input class="form-control" id="new_pass_name" value="" placeholder="名称" type="text">
				</div>
				<div class="form-group">
					<label>路线名称</label> <font style="color: red">*</font>
					<!-- <input class="form-control" id="new_highway_name" value=""
						placeholder="类型" type="text">
						 -->
					<select class="form-control " id="new_highway_name">
					<option></option>
					</select>
				</div>
				<div class="form-group">
					<label>中心桩号</label>
					<!-- <select class="form-control " id="new_pier_no"></select> -->
					<input class="form-control" id="new_stub_no" value="" placeholder="中心桩号" type="text">
				</div>
				<div class="form-group">
					<label>管养单位</label> <font style="color: red">*</font>
					<select class=" form-control " id="new_manage_org">
						<option></option>
					</select>
				</div>
				<div class="form-group">
					<label>所属路段</label><font style="color: red">*</font> <select class="form-control "
						id="new_section_id">
						<option></option>
					</select>
				</div>
				<div class="form-group">
					<label>所属分区</label><font style="color: red">*</font> <select class="form-control "
						id="new_zone_id">
						<option></option>
					</select>
				</div>
				<div class="form-inline">
					<div class="form-group">
						<label>经纬坐标</label><font style="color: red">*</font> <input style="width: 610px" class="form-control" id="new_location"
							value="" placeholder="正确格式：116.307629,40.058359" type="text">
					</div>
					<div class="form-group">
						<div id="point">
							<a class="btn btn-default" onclick="getBridgePoint()">定位通道</a>
						</div>
					</div>
				</div>
				<div style="width: 750px;height: 300px;margin-top: 10px" id="map"
					></div>
			</fieldset>
		</div>
		<div id="e_map">
			<div style="width: 750px;height: 300px;margin-top: 10px" id="edit_map"></div>
		</div>
		<%-- 	<%@ include file="footer.jsp" %> --%>

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
		<script src="../js/plugin/flot/jquery.flot.time.min.js"></script>
		<script src="../js/plugin/flot/jquery.flot.tooltip.min.js"></script>

		<!-- Vector Maps Plugin: Vectormap engine, Vectormap language -->
		<script src="../js/plugin/vectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script
			src="../js/plugin/vectormap/jquery-jvectormap-world-mill-en.js"></script>

		<!-- Full Calendar -->
		<script src="../js/plugin/moment/moment.min.js"></script>
		<script src="../js/plugin/fullcalendar/jquery.fullcalendar.min.js"></script>
		<script src="check/jquery.datetimepicker.full.min.js"></script>
		<script src="../jstree/jstree.min.js"></script>

		<script src="../js/plugin/superbox/superbox.min.js"></script>
		<script src="../js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=BmTwezCvWyGaH3KNYkc5P6uq"></script>
		<script type="text/javascript">
			var maintainOrg_id = '<%=(String)request.getSession().getAttribute("orgid")%>';
			var hhhhh;
			var hhhhs;
			var hhhbs;
			var hyid;
			var seid;
			var inf;
			
			var hw;
			var org;
			var zone;
			var section;
			
			/******************************************/
			/*地图*/
			var map = new BMap.Map("map");
				map.setMinZoom(5);
				map.centerAndZoom("江苏省",8);
				map.enableScrollWheelZoom(true);
				map.addEventListener("click",function(e){
					map.clearOverlays();
					$('#new_location').val(e.point.lng+","+e.point.lat);
					var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
					map.addOverlay(marker);
				});
			$("#edit_location").dblclick(function () {
			init_edit_map();
			$('#e_map').dialog({
				buttons : [{
						html : "<i class='fa fa-times'></i>&nbsp; 取消",
						"class" : "btn btn-default",
						click : function() {
							$(this).dialog("close");
										}
					} ]
					});
				$('#e_map').dialog({
					title : "拾取坐标"
				});
				$('#e_map').dialog("open");
			});	
			 function init_edit_map(){
			 var eidt_map = new BMap.Map("edit_map");
				eidt_map.setMinZoom(5);
				eidt_map.centerAndZoom("江苏省",8);
				eidt_map.enableScrollWheelZoom(true);
				eidt_map.enableAutoResize(true);
				eidt_map.addEventListener("click",function(e){
					eidt_map.clearOverlays();
					$('#edit_location').val(e.point.lng+","+e.point.lat);
					var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
					eidt_map.addOverlay(marker);
					$('#e_map').dialog("close");
				});		
		 }	
		 
		 	$('#e_map').dialog({
				autoOpen : false,
				minWidth : 800,
				resizable : true,
				modal : true,
				show : 'drop',
				hide : 'drop'
			});
			/******************************************/
			$(document).ready(
					function() {
						// DO NOT REMOVE : GLOBAL FUNCTIONS!
						pageSetUp();
						
						var str = location.href;
						var ss = location.search;
						var arr = str.split("#");
						if (arr[1] == "add=true") {
					init_line();
					init_maintain_org();
					new_pass();
				}else{
						initTable();
						init_Edit_line();
						init_pass_type();
						init_Edit_maintain_org();
						getSectiondata();
						/*initHW_name();
						initPass_type();
						*/
						$.datetimepicker.setLocale('ch');
						$('#edit_build_year').datetimepicker({
						format : "Y-m",
						timepicker : false,
						todayButton : true,
						validateOnBlur : false,
						onSelectDate : function() {
							var date = $('#edit_build_year').val();
							dates = date.split("-")
							var time = dates[0] + "-" + dates[1];
							$('#edit_build_year').val(time);
						},
					});
						
				}
					
						$('#jstree').jstree(
								{
									"core" : {
										"animation" : 0,
										"check_callback" : true,
										"variant" : "large"
									},
									"plugins" : [ "contextmenu", "dnd",
											"search", "state", "types",
											"wholerow" ]
								});
					});
		function getSectiondata(){
	 	$.ajax({
	 		type : 'POST',
			url : '../BrgCardServlet',
			dataType : 'json',
			data : {
				type : "getSectiondata",
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
				if(json.success=="success")
				{
					section = json.obj;
				}
				}
			});
	 	}
	 	
	 function getZonedata(){
	 	$.ajax({
	 		type : 'POST',
			url : '../BrgCardServlet',
			dataType : 'json',
			data : {
				type : "getZonedata",
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
					if(json.success=="success")
					{
						zone = json.obj;
					}
				}
			});
	 	}
	 	
	function init_Edit_maintain_org(){
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_maintain_org"
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
				if(json.success=="success")
				{
					var arr = json.obj;
					org = json.obj;
					for ( var i = 0; i < arr.length; i++) {
						$('#maintain_org').append(
							"<option value='"+arr[i].org_id+"'>"
							+ arr[i].org_name + "</option>");
					}
					$('#maintain_org').select2();
					if(maintainOrg_id != "null" && maintainOrg_id!=undefined){
		                    $('#maintain_org').val(maintainOrg_id).trigger("change");
		                    $('#maintain_org').attr("disabled","true");
                     		init_Edit_section_id(maintainOrg_id);
                        	init_Edit_zone_id(maintainOrg_id);
                   	}
						$('#edit_brg_type').select2();
						init_Edit_section_id($('#maintain_org').val());
						init_Edit_zone_id($('#maintain_org').val());
					$('#maintain_org').on("select2:select", function (e) {
						init_Edit_section_id($('#maintain_org').val());
						init_Edit_zone_id($('#maintain_org').val());
					});
				}
				else{
				errMessage("生成管养单位出错");
				}
			}
	 	});
	 }
	
		   function init_Edit_section_id(id,obj){
	   	$('#edit_section').select2();
	 	$('#edit_section').val(null).trigger("change");
	  	$('#edit_section').empty();
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_section_id",
				id:id
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
			if(json.success=="success")
				{
				var arr = json.obj;
				for ( var i = 0; i < arr.length; i++) {
						$('#edit_section').append(
							"<option value='"+arr[i].section_id+"'>"
							+ arr[i].section_name + "</option>");
							$('#edit_section').select2();
					}
					if(obj !=null)
					{
						$('#edit_section').val(obj).trigger("change");
					}
				}
				else{
					errMessage("生成所属路线出错");
				}
			}
	 	});
	 }
	
	function init_Edit_zone_id(id,zone_id){
	  	$('#edit_zone').select2();
	 	$('#edit_zone').val(null).trigger("change");
	 	$('#edit_zone').empty();
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_zone_id",
				id:id
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
				if(json.success=="success")
				{
				var arr = json.obj;
				zone = json.obj;
				for ( var i = 0; i < arr.length; i++) {
						$('#edit_zone').append(
							"<option value='"+arr[i].zone_id+"'>"
							+ arr[i].zone_name + "</option>");
							$('#edit_zone').select2();
					}
					getZonedata();
					if(zone_id !=null)
					{
						$('#edit_zone').val(zone_id).trigger("change");
					}
				}
				else{
					errMessage("生成所属分区出错");
				}
			}
	 	});
	 }
	
	function init_line(){
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_line"
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
				if(json.success=="success")
				{
				var arr = json.obj;
				for ( var i = 0; i < arr.length; i++) {
						$('#new_highway_name').append(
							"<option value='"+arr[i].highway_id+"'>"
							+ arr[i].highway_name + "</option>");
					}
					$('#new_highway_name').select2();
				}
				else{
					errMessage("生成路线出错");
				}
			}
	 	});
	 }		 
	 
	 function init_Edit_line(){
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_line"
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
				if(json.success=="success")
				{
				var arr = json.obj;
				hw=json.obj;
				for ( var i = 0; i < arr.length; i++) {
						$('#edit_highway_name').append(
							"<option value='"+arr[i].highway_id+"'>"
							+ arr[i].highway_name + "</option>");
					}
					$('#edit_highway_name').select2();
				}
				else{
					errMessage("生成路线出错");
				}
			}
	 	});
	 }		 
	 /**解析桥名，获得经纬度*/
	 function getBridgePoint(){
				if($('#new_brg_name').val()==""){
					return;
				}
				map.clearOverlays();
				var myGeo = new BMap.Geocoder();
				myGeo.getPoint($('#new_brg_name').val(), function(point){
					if(point){
					$('#new_location').val(point.lng+","+point.lat);
						var marker = new BMap.Marker(point);
						map.addOverlay(marker);
						map.centerAndZoom(point, 14);
					}else{
						errMessage("无法获取通道地址，请从地图上手动选取！");
					}
				}, "江苏省");
			}
		
		 function init_zone_id(id){
	 	$('#new_zone_id').val(null).trigger("change");
	 	$('#new_zone_id').empty();
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_zone_id",
				id:id
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
				if(json.success=="success")
				{
				var arr = json.obj;
				for ( var i = 0; i < arr.length; i++) {
						$('#new_zone_id').append(
							"<option value='"+arr[i].zone_id+"'>"
							+ arr[i].zone_name + "</option>");
							$('#new_zone_id').select2();
					}
				}
				else{
					errMessage("生成所属分区出错");
				}
			}
	 	});
	 }
		
		 function init_section_id(id){
	 	 $('#new_section_id').val(null).trigger("change");
	  	$('#new_section_id').empty();
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_section_id",
				id:id
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
			if(json.success=="success")
				{
				var arr = json.obj;
				for ( var i = 0; i < arr.length; i++) {
						$('#new_section_id').append(
							"<option value='"+arr[i].section_id+"'>"
							+ arr[i].section_name + "</option>");
							$('#new_section_id').select2();
					}
				}
				else{
					errMessage("生成所属路线出错");
				}
			}
	 	});
	 }
	 
	 function init_pass_type(){
	 	$.ajax({
					type : 'POST',
					url : '../PasMbrServlet',
					dataType : 'json',
					data : {
						choice:"loadpass_type"
					},
					error : function(msg) {
						errMessage("系统错误！");
					},
					success : function(json) {
					if(json.success=="success"){
					var arr = json.obj;
					for ( var i = 0; i < arr.length; i++) {
						$('#edit_pass_type').append(
							"<option value='"+arr[i].pass_type_name+"'>"
							+ arr[i].pass_type_name + "</option>");
							$('#edit_pass_type').select2();
							}
					}
					}
					});
	 }
	 
	 function init_maintain_org(){
	 	$.ajax({
	 		type : 'GET',
			url : '../NewBrgServlet',
			dataType : 'json',
			data : {
				type : "init_maintain_org"
			},
			error : function(msg) {
				errMessage("系统错误！");
			},
			success : function(json) {
				if(json.success=="success")
				{
					
					var arr = json.obj;
					for ( var i = 0; i < arr.length; i++) {
						$('#new_manage_org').append(
							"<option value='"+arr[i].org_id+"'>"
							+ arr[i].org_name + "</option>");
					}
					$('#new_manage_org').select2();
					if(maintainOrg_id != "null"&&maintainOrg_id!=undefined){
		                    $('#new_manage_org').val(maintainOrg_id).trigger("change");
		                    $('#new_manage_org').attr("disabled","true");
                     		init_section_id(maintainOrg_id);
                        	init_zone_id(maintainOrg_id);
                   	}
					$('#new_zone_id').select2();
					$('#new_section_id').select2();
					$('#new_manage_org').on("select2:select", function (e) {
						init_section_id($('#new_manage_org').val());
						init_zone_id($('#new_manage_org').val());
					});
				}
				else{
				errMessage("生成管养单位出错");
				}
			}
	 	});
	 }
	
	function getManage_id(name,type){
		var id = "";
		if(type=="hw"){
			for ( var i = 0; i < hw.length; i++) {
				if(name==hw[i].highway_name){
					id= hw[i].highway_id;
				}
			}
		}
		else if(type=="org"){
			for ( var i = 0; i < org.length; i++) {
				if(name==org[i].org_name){
					id = org[i].org_id;
				}
			}
		}
		else if(type=="zone"){
			for ( var i = 0; i < zone.length; i++) {
				if(name==zone[i].zone_name){
					id = zone[i].zone_id;
				}
			}
		}else if(type=="section"){
			for ( var i = 0; i < section.length; i++) {
				if(name==section[i].section_name){
					id = section[i].section_id;
				}
			}
		}
		return id;
	}
	
	function new_pass() {
	//var maintain_org = $("#new_maintain_org").select2("data");
	$('#new_pass').dialog({
	buttons : [{
			html : "<i class='fa fa-plus'></i>&nbsp; 保存",
			"class" : "btn btn-default",
			click : function() {
			if ($("#new_pass_no").val() == "") {
				errMessage("请输入通道编号!");
				return false;
				}
			if ($("#new_highway_name").val() == "") {
				errMessage("请选择路线名称!");
				return false;
				}
			if ($("#new_manage_org").val() == "") {
				errMessage("请选择管养单位!");
				return false;
				}
			if ($("#new_section_id").val() == "") {
				errMessage("请选择所属路段!");
				return false;
				}
			if ($("#new_zone_id").val() == "") {
				errMessage("请选择所属分区!");
				return false;
				}
			else{
				if ($("#new_zone_id").val() == null){
				errMessage("所属分区不能为空!");
				return false;
				}
			}	 	 	 	 	 	 	 
			if ($("#new_location").val() == "") {
			
			}else{
					var location = $("#new_location").val();
					if(location.indexOf(",")!=-1){
						var arr = location.split(",");
						if(arr.length!=2){
							errMessage("通道经纬度格式错误!");
							return false;
						}else{
							var patten =  /^-?(([1-9]\d?)|(1[1-7]\d)|180)(.\d{1,6})?$/;
							if(!patten.test(arr[0])||!patten.test(arr[1])){
								errMessage("通道经纬度格式错误!");
								return false;
							}
						}
					}else{
						errMessage("通道经纬度格式错误!");
						return false;
					}
			} 	
			$.ajax({
				type : 'POST',
				url : '../NewBrgServlet',
				dataType : 'json',
				data : {
					type : "new_pass",
					new_pass_no : $("#new_pass_no").val(),
					new_pass_name:$("#new_pass_name").val(),
					new_highway_name:$("#new_highway_name").val(),
					new_stub_no:$("#new_stub_no").val(),
					new_manage_org:$("#new_manage_org").val(),
					new_section_id:$("#new_section_id").val(),
					new_zone_id:$("#new_zone_id").val(),
					new_location:$("#new_location").val()
				},
				error : function(msg) {
					errMessage("请求NewBrgServlet失败");
								},
				success : function(json) {
						if(json.success=="success"){
							successMessage("添加通道成功");
							$('#new_pass').dialog("close");
							window.location.href="structMgr.jsp";
						}else{
							errMessage("新建通道失败");
							}
						}
					});
				}
			},
			{
				html : "<i class='fa fa-times'></i>&nbsp; 取消",
				"class" : "btn btn-default",
				click : function() {
					$(this).dialog("close");
					window.location.href="structMgr.jsp";
								}
			} ]
			});
		$('#new_pass').dialog({
			title : "新增通道"
		});
		$('#new_pass').dialog("open");
			}
	 
			function initHW_name() {
				var line_name = $("#line_name");
				$.ajax({
					type : 'POST',
					url : '../CulCardServlet',
					dataType : 'json',
					data : {
						type : "initHW_name",
					},
					error : function(msg) {
						errMessage("请求CulCardServlet失败");
					},
					success : function(json) {
						console.log(json.obj);
						var arr = json.obj;
						if (json.success == "success") {
							for ( var i = 0; i < arr.length; i++) {
								$option = $("<option></option>");
								$option.prop("value", arr[i].highway_name);
								$option.prop("text", arr[i].highway_name);
								line_name.append($option);
							}
							line_name.select2();
						} else {
							errMessage("路线名称没有数据");
						}
					}
				});
			}
			function initPass_type() {
				var pass_type = $("#pass_type");
				$.ajax({
					type : 'POST',
					url : '../CulCardServlet',
					dataType : 'json',
					data : {
						type : "initPass_type",
						inf : inf
					},
					error : function(msg) {
						errMessage("请求CulCardServlet失败");
					},
					success : function(json) {
						console.log(json.obj);
						var arr = json.obj;
						if (json.success == "success") {
							for ( var i = 0; i < arr.length; i++) {
								$option = $("<option></option>");
								$option.prop("value", arr[i].pass_type_name);
								$option.prop("text", arr[i].pass_type_name);
								pass_type.append($option);
							}
							pass_type.select2();
						} else {
							errMessage("路线名称没有数据");
						}
					}
				});
				
			}

			function initTable() {
				$.ajax({
							type : 'POST',
							url : '../CulCardServlet',
							dataType : 'json',
							data : {
								type : "initTablePass",
							},
							error : function(msg) {
								errMessage("请求CulCardServlet失败");
							},
							success : function(json) {
								$('#dt_basic').html("");
								var dt = $('#dt_basic');
								if (json.success == "fail") {
									errMessage("没有数据或服务器错误");
								} else if (json.success == "empty") {
									$("#edit").hide();
									errMessage("请选择结构物");
								} else {
									var data = json.obj;
									console.log(data);
									for ( var i = 0; i < data.length; i++) {
										hhhbs = data[i].pass_id;
										dt.append("<tr><th>路线名称</th><td>"
												+ data[i].highway_name
												+ "</td><th>通道名称</th><td>"
												+ data[i].pass_name
												+ "</td></tr>");
										dt.append("<tr><th>中心桩号</th><td>"
												+ data[i].stub_no
												+ "</td><th>通道编号</th><td>"
												+ data[i].pass_no
												+ "</td></tr>");
										dt.append("<tr><th>斜交角度</th><td>"
												+ data[i].skew_angle
												+ "</td><th>跨径组成</th><td>"
												+ data[i].span_build
												+ "</td></tr>");
										dt.append("<tr><th>建成年月</th><td>"
														+ data[i].construct_ym	
														+ "</td><th>通道类型</th><td>"+data[i].pass_type+"</td></tr>");
														
											
										if(data[i].longitude==""&&data[i].latitude==""){
											dt.append("<tr><th>使用类型</th><td>"
													+ data[i].use_type
													+ "</td><th>经纬度坐标</th><td>"
													+ "</td></tr>");
										}else{
											dt.append("<tr><th>使用类型</th><td>"
													+ data[i].use_type
													+ "</td><th>经纬度坐标</th><td>"
													+ data[i].longitude+","+data[i].latitude
													+ "</td></tr>");				
											}
												dt.append("<tr><th>管养单位</th><td>"
												+ data[i].manage_name
												+ "</td><th>所属路段</th><td>"
												+ data[i].section_name
												+ "</td></tr>");
												dt.append("<tr><th>所属分区</th><td>"
												+ data[i].zone_name
												+ "</td><th></th><td>"
												+ "</td></tr>");				
										/* $('#dt_basic').append("<tr><th>检验员</th><td colspan='2'>"
													+data[i].chk_person
													+"</td><th>记录员</th><td colspan='2'>"
													+data[i].record_person
													+"</td></tr>");
										 $('#dt_basic').append("<tr><th>复核员</th><td colspan='2'>"
													+data[i].review_person
													+"</td><th>负责人</th><td colspan='2'>"
													+data[i].response_person
													+"</td></tr>");*/
									}
								}
								initPhoto();
							}
						});
			}
			
			function initPhoto(){
				$.ajax({
					type: 'POST',
					url: '../CulCardServlet',
					dataType: 'json',
					data: {
						type:"initPassPhoto",
					},
					error : function(msg) {
						errMessage("请求CulCardServlet失败");
				    },
					success : function(json) {
						if(json.success=="success"){
							var data = json.obj;
							$('#dt_basic').append("<tr><th>正面照</th><td><img id='img1' src='"
												+ encodeURI("../ImageDownLoadServer?path="
												+ data.face_path)
												+ "' width='300px' height='300px'></td><th>立面照</th><td ><img id='img2' src='"
												+ encodeURI("../ImageDownLoadServer?path="
												+ data.facade_path)
												+ "' width='300px' height='300px'></td></tr>");
						}else{
							$('#dt_basic').append("<tr><th>正面照</th><td><img id='img1' src='"
												+ encodeURI("../ImageDownLoadServer?path="
												+ "nofile.jpg")
												+ "' width='300px' height='300px'></td><th>立面照</th><td><img id='img2' src='"
												+ encodeURI("../ImageDownLoadServer?path="
												+ "nofile.jpg")
												+ "' width='300px' height='300px'></td></tr>");
						}
											
					}
				});
			}


			$('#opera').dialog({
				autoOpen : false,
				width : 800,
				resizable : false,
				modal : true,
				show : 'drop',
				hide : 'drop'
			});

			$('#up').dialog({
				autoOpen : false,
				width : 600,
				resizable : false,
				modal : true,
				show : 'drop',
				hide : 'drop'
			});
			

			function editOperation() {
				$("#edit_highway_name").val(getManage_id($('#dt_basic tr:eq(0) td:eq(0)').text(), "hw")).trigger("change");
				$("#edit_pass_name").val($('#dt_basic tr:eq(0) td:eq(1)').text());
				$("#edit_stub_no").val($('#dt_basic tr:eq(1) td:eq(0)').text());
				$("#edit_pass_no").val($('#dt_basic tr:eq(1) td:eq(1)').text());
				$("#edit_skew_angle").val($('#dt_basic tr:eq(2) td:eq(0)').text());
				$("#edit_span_build").val($('#dt_basic tr:eq(2) td:eq(1)').text());
				$("#edit_build_year").val($('#dt_basic tr:eq(3) td:eq(0)').text());
				$("#edit_pass_type").val($('#dt_basic tr:eq(3) td:eq(1)').text()).trigger("change");
				$("#edit_use_type").val($('#dt_basic tr:eq(4) td:eq(0)').text());
				$("#edit_location").val($('#dt_basic tr:eq(4) td:eq(1)').text());
				
		var maintain_org = $('#dt_basic tr:eq(5) td:eq(0)').text();
		if(maintain_org==""){
			$('#maintain_org').val(null).trigger("change");
		}
		else{
			if(getManage_id(maintain_org, "org")==""){
				$('#maintain_org').val(null).trigger("change");
			}else{
				$('#maintain_org').val(getManage_id(maintain_org, "org")).trigger("change");
				var zone_name = $('#dt_basic tr:eq(6) td:eq(0)').text();
				if(zone_name==""){
					$('#edit_zone').val(null).trigger("change");
				}
				else{
					if(getManage_id(zone_name, "zone")==""){
						$('#edit_zone').val(null).trigger("change");
					}else{
						init_Edit_zone_id(getManage_id(maintain_org, "org"),getManage_id(zone_name, "zone"));
					}
				}
			}
			
		}
		var section_name = $('#dt_basic tr:eq(5) td:eq(1)').text();
		if(section_name==""){
			$('#edit_section').val(null).trigger("change");
		}
		else{
			if(getManage_id(section_name, "section")==""){
				$('#edit_section').val(null).trigger("change");
			}else{
				init_Edit_section_id(getManage_id(maintain_org, "org"),getManage_id(section_name, "section"));
			}
		}
				
				$("#zmz").val("");
				$("#lmz").val("");
				$('#opera').dialog(
					{buttons : [{html : "<i class='fa fa-plus'></i>&nbsp; 保存","class" : "btn btn-default",
					click : function() {
					if ($("#edit_location").val() == "") {
					}else{
					var location = $("#edit_location").val();
					if(location.indexOf(",")!=-1){
						var arr = location.split(",");
						if(arr.length !=2){
							errMessage("桥梁经纬度格式错误!");
							return false;
						}else{
							var patten =  /^-?(([1-9]\d?)|(1[1-7]\d)|180)(.\d{1,6})?$/;
							if(!patten.test(arr[0])||!patten.test(arr[1])){
								errMessage("桥梁经纬度格式错误!");
								return false;
							}
						}
					}else{
						errMessage("桥梁经纬度格式错误!");
						return false;
					}
					} 	
						$.ajax({
							type : 'POST',
							url : '../CulCardServlet',
							dataType : 'json',
							data : {
								type : "editPass",
								edit_highway_name:$("#edit_highway_name").val(),
								highway_name:$("#edit_highway_name").select2('data')[0].text,
								edit_pass_name:$("#edit_pass_name").val(),
								edit_stub_no:$("#edit_stub_no").val(),
								edit_pass_no:$("#edit_pass_no").val(),
								edit_skew_angle:$("#edit_skew_angle").val(),
								edit_span_build:$("#edit_span_build").val(),
								edit_build_year:$("#edit_build_year").val(),
								edit_pass_type:$("#edit_pass_type").val(),
								edit_use_type:$("#edit_use_type").val(),
								edit_location:$("#edit_location").val(),
								edit_org:$("#maintain_org").val(),
								org:$("#maintain_org").select2('data')[0].text,
								edit_zone:$("#edit_zone").val(),
								zone:$("#edit_zone").select2('data')[0].text,
								edit_section:$("#edit_section").val(),
								section:$("#edit_section").select2('data')[0].text
								},
							error : function(msg) {
								errMessage("请求CulCardServlet失败");
								},
							success : function(json) {
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
									$('#dt_basic tr:eq(0) td:eq(0)').text($('#edit_highway_name').select2('data')[0].text);
									$('#dt_basic tr:eq(0) td:eq(1)').text($('#edit_pass_name').val());
									$('#dt_basic tr:eq(1) td:eq(0)').text($('#edit_stub_no').val());
									$('#dt_basic tr:eq(1) td:eq(1)').text($('#edit_pass_no').val());
									$('#dt_basic tr:eq(2) td:eq(0)').text($('#edit_skew_angle').val());
									$('#dt_basic tr:eq(2) td:eq(1)').text($('#edit_span_build').val());
									$('#dt_basic tr:eq(3) td:eq(0)').text($('#edit_build_year').val());
									$('#dt_basic tr:eq(3) td:eq(1)').text($('#edit_pass_type').val());
									$('#dt_basic tr:eq(4) td:eq(0)').text($('#edit_use_type').val());
									$('#dt_basic tr:eq(4) td:eq(1)').text($('#edit_location').val());
									$('#dt_basic tr:eq(5) td:eq(0)').text($('#maintain_org').select2('data')[0].text);
									$('#dt_basic tr:eq(5) td:eq(1)').text($('#edit_section').select2('data')[0].text);
									$('#dt_basic tr:eq(6) td:eq(0)').text($('#edit_zone').select2('data')[0].text);
									
									changetips($('#edit_pass_name').val(),$('#edit_section').select2('data')[0].text,$('#edit_pass_no').val());
									//changelinename($('#edit_highway_name').select2("data")[0].text);
									//changezonename($('#edit_section').select2("data")[0].text);
									
									var zmz = $("#zmz").val();
									var lmz = $("#lmz").val();
									if(zmz!=""&&lmz==""){
										imageUpload_zmz();
									}
									if(lmz != ""&&zmz==""){
										imageUpload_lmz();
									}
									if(lmz != ""&&zmz!=""){
										imageUpload_all();
									}
									$('#opera').dialog("close");
								}
							}
						});
					}
				},
				{
					html : "<i class='fa fa-times'></i>&nbsp; 取消","class" : "btn btn-default",
					click : function() {$(this).dialog("close");
				}
			}]
		});
				$('#opera').dialog({
					title : "修改通道卡片"
				});
				$('#opera').dialog("open");
			}
			
			
		function changelinename(line_name) {
		var tips = $("#qq").html();
		var arrs = tips.split("&gt;");
		arrs[0] = "当前结构 : " + line_name;
		tips = "";
		for ( var i = 0; i < arrs.length; i++) {
			if (i == 0) {
				tips += arrs[i];
			} else {
				tips += "&gt;" + arrs[i];
			}
		}
		$("#qq").html(tips);
	}
	
	function changezonename(zone_name) {
		var tips = $("#qq").html();
		var arrs = tips.split("&gt;");
		arrs[1] =  zone_name;
		tips = "";
		for ( var i = 0; i < arrs.length; i++) {
			if (i == 0) {
				tips += arrs[i];
			} else {
				tips += " &gt; " + arrs[i];
			}
		}
		$("#qq").html(tips);
	}

	function changetips(bridge_name,line_name,bridge_no) {
		var tips = $("#qq").html();
		var cc = "<label";
		var arrs = tips.split(cc);
		var aa = "当前结构  : "+line_name+" &gt; "+bridge_no+"-"+bridge_name+" ";
		$("#qq").html(aa+cc+arrs[1]);
	}

			function errMessage(info) {
				$.smallBox({
					title : "处理信息",
					content : "<i class='fa fa-clock-o'></i> <i>" + info
							+ "</i>",
					color : "#C46A69",
					iconSmall : "fa fa-times fa-2x fadeInRight animated",
					timeout : 4000
				});
			}

			function successMessage(info) {
				$.smallBox({
					title : "处理信息",
					content : "<i class='fa fa-clock-o'></i> <i>" + info
							+ "</i>",
					color : "#659265",
					iconSmall : "fa fa-times fa-2x fadeInRight animated",
					timeout : 4000
				});
			}

			function upload() {
				$('#up').dialog({
					title : "上传图片"
				});
				$('#up').dialog("open");
			}

			function getUrlParam(key) {
				var search = decodeURIComponent(location.search);
				var reg = new RegExp(".*" + key + "\\=" + "([^&]*)(&?.*|)", "g");
				return search.replace(reg, "$1");
			}
			
		function imageUpload_lmz(){
		var britype="立面照";
		$.ajax({
		type : 'POST',
		url : '../CulCardServlet',
		dataType : 'json',
		data : {
			type : "selectp",
			britype : britype,
			},
		error : function(msg) {
			errMessage("BrgCardServlet链接失败！");
			},
		success : function(json) {
				$.ajaxFileUpload({
					url : '../CulCardServlet?type=img',
					secureuri : false,
					fileElementId : 'lmz',
					dataType : 'text',
					success : function(data,status) {
						$('#up').dialog("close");	
						$("#img1").prop("src",encodeURI("../ImageDownLoadServer?path="
							+ encodeURI(hhhbs)
							+ "\\card\\"+hhhbs+"_lmz.jpg"
							+ "&a="
							+ Math.random()));
							},
					error : function(data,status,e) {
						errMessage("上传失败！");
							}
						});
				}
		});
	}
	function imageUpload_zmz(){
	var britype="正面照";
	$.ajax({
		type : 'POST',
		url : '../CulCardServlet',
		dataType : 'json',
		data : {
			type : "selectp",
			britype : britype
			},
		error : function(msg) {
			errMessage("BrgCardServlet链接失败！");
			},
		success : function(json) {
				$.ajaxFileUpload({
					url : '../CulCardServlet?type=img',
					secureuri : false,
					fileElementId : 'zmz',
					dataType : 'text',
					success : function(data,status) {
						$('#up').dialog("close");
						$("#img2").prop("src",encodeURI("../ImageDownLoadServer?path="
							+ encodeURI(hhhbs)
							+ "\\card\\"+hhhbs+"_zmz.jpg"
							+ "&a="
							+ Math.random()));
							},
					error : function(data,status,e) {
						errMessage("上传失败！");
							}
						});
				}
		});
	}
	
	function imageUpload_all(){
	var britype="立面照";
	$.ajax({
		type : 'POST',
		url : '../CulCardServlet',
		dataType : 'json',
		data : {
			type : "selectp",
			britype : britype
			},
		error : function(msg) {
			errMessage("BrgCardServlet链接失败！");
			},
		success : function(json) {
				$.ajaxFileUpload({
					url : '../CulCardServlet?type=img',
					secureuri : false,
					fileElementId : 'lmz',
					dataType : 'text',
					success : function(data,status) {
						$('#up').dialog("close");
						$("#img1").prop("src",encodeURI("../ImageDownLoadServer?path="
							+ encodeURI(hhhbs)
							+ "\\card\\"+hhhbs+"_lmz.jpg"
							+ "&a="
							+ Math.random()));
							imageUpload_zmz();
							},
					error : function(data,status,e) {
						errMessage("上传失败！");
							}
						});
				}
		});
	}
			
	$('#new_pass').dialog({
		autoOpen : false,
		width : 800,
		height : 600,
		resizable : false,
		modal : true,
		dialogClass: "no-close",
		closeOnEscape: false,
		show : 'drop',
		hide : 'drop'
		});
		
	function releaseAdmin() {//管理员
        var buttons = $('.widget-body-toolbar :button');
        for (var i = 0; i < buttons.length; i++) {
            //$('.widget-body-toolbar :button').eq(i).removeAttr('disabled');
            buttons[i].disabled = false;
        }
    }
    function releaseOrgAdmin() {//管养公司管理员
        var buttons = $('.widget-body-toolbar :button');
        for (var i = 0; i < buttons.length; i++) {
            //$('.widget-body-toolbar :button').eq(i).removeAttr('disabled');
            buttons[i].disabled = false;
        }
        role = "org";
    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
        	releaseOrgAdmin();
		}
	
	}
		</script>

		<script type="text/javascript">
			/*
			$(document).ready(function(){
				$("#upload1").click(function(){
					var britype=$("#britype").val();
					$.ajax({
						type: 'POST',
			    		url: '../CulCardServlet',
			    		dataType: 'json',
			    		data: {
			    			type:"selectp",
			    			britype:britype,
			    			hhhbs:hhhbs
			    		},
			    		error : function(msg) {
			    			errMessage("CulCardServlet链接失败！");
			    	    },
			    		success : function(json) {
			    			$.ajaxFileUpload({
								url : '../CulCardServlet',
								secureuri : false,
								fileElementId : 'f1',
								dataType : 'text',
								success : function(data, status) {
									$('#up').dialog( "close" );
									successMessage("上传成功");
									$("#img1").prop("src","../ImageDownLoadServer?path=C:\\repository\\card\\tongdao\\"+hhhbs+"\\G2ltz.jpg"+"&a="+Math.random());
									 $("#img2").prop("src","../ImageDownLoadServer?path=C:\\repository\\card\\tongdao\\"+hhhbs+"\\G2zmz.JPG"+"&a="+Math.random());
								},
								error : function(data, status, e) {
									errMessage("上传失败！");
								}
							});
			    		}
					});
			    });
			})
			 */
		</script>
</body>
</html>