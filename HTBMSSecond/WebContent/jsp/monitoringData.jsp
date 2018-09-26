<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8;IE=edge,chrome=1">
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
		<link rel="apple-touch-startup-image" href="../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
		<link rel="stylesheet" href="../js/plugin/daterangepicker/daterangepicker.css">
		<style>
		
		.tree-second:hover{
		background-color: #ccc;
		cursor: pointer;
		}
		
		#fileName{
		background-color:#ccc;
		color:black;
		}
		
		.shb1{
		bottom: -27px;
		}
		
		a {
		  cursor:pointer;
		}
		
		.table th, .table td { 
		text-align: center;
		vertical-align: middle!important;
			}
		#reservation{margin-left:12px;border:1;padding:5px;}
		
		#reservationEnd{margin-left:12px;border:1;padding:5px;}
		
		.spa{margin-left:12px;border:0;padding:0;}
		
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
			filter: alpha(opacity = 60);
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
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存" data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

				<!-- breadcrumb -->
				<ol class="breadcrumb">
					<li>实时监测</li><li>分析预警</li>
				</ol>
				<!-- end breadcrumb -->

			</div>
			<!-- END RIBBON -->
			
			<!-- #MAIN CONTENT -->
			<div id="content">
				<section id="widget-grid"><!-- widget grid -->
			        <!-- row -->			
			        <div class="row">
			            
			            
			            <article class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
									<h2>监测数据类型</h2>				
								</header>
				
								
								<div>
								<!-- widget div
								<div class="widget-body-toolbar bg-color-white">
								<div class="pull-right">
								<a class="btn btn-primary" style="margin-bottom: 10px" onclick="addSystem()">增加</a>
								</div>
								</div>
								-->
								
									<!-- widget content -->
									<div class="widget-body">
										<div style="height: 500px"> 
										<div>
										<label>结构物</label>
										<select id="scanStruct" style="width: 100%" class="select2">
										</select>
										</div>
										<div style="margin-top: 50px">
										<!--  
										<div>
										<label>一级选项</label>
										<select id="item_first" class="select2">
										<option value="0">--请选择--</option>
										<option value="动态称重">动态称重</option>
										<option value="健康监测">健康监测</option>
										<option value="GPS">GPS</option>
										</select>
										</div>
										-->
										<div style="margin-top: 50px">
										<label>监测分类</label><br>
										<select style="width: 100%" id="item_first" class="select2">
										</select>
										</div>
										<div style="margin-top: 50px">
										<label>监测类型</label><br>
										<select style="width: 100%" id="item_second" class="select2">
										</select>
										</div>
										<div style="margin-top: 50px">
										<label>查看模式</label><br>
										<div id="view_type" class="btn-group " data-toggle="buttons" >
										<label data_dir="年"  class="btn btn-info" onclick="view_type('年')">
											<input type="radio" name="options" value="year">年
										</label>
										<label data_dir="月" class="btn btn-info" onclick="view_type('月')" >
											<input type="radio" name="options" value="month">月
										</label>
										<label data_dir="日" class="btn btn-info"  onclick="view_type('日')">
										<input type="radio" name="options" value="day">日
										</label>
										<label data_dir="小时" class="btn btn-info active" id='hour' title='最近半小时数据' onclick="view_type('小时')">
										<input type="radio"  name="options" checked="checked" value="hour" >小时
										</label>
										</div>
										<div class="input-group"  id="time_picker_next">
											<input type="text" id="time_picker" class="form-control" readonly="readonly">
											<span class="input-group-btn">
												<button id="queryData" onclick="selectData()" class="btn btn-default" type="button">
													查询
												</button>
											</span>
										</div><!-- /input-group -->
										</div>
										
										<div style="margin-top: 20px">
												<label>当天小时数据</label><br>
												<select id="dayHours" class="select2" style="width:200px">
												</select>
										</div>
										
										<div style="margin-top: 80px">
										<a onclick="changePage()" ><font style="color: blue;">前往数据下载页面   >></font> </a>
										<br>
										</div>
										
										</div>
				
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
			
			            </article><!-- END GRID -->
			            <!-- SINGLE GRID -->
			            
			            <article id="monitoring_data" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>监测数据 </h2>
								</header>
				
								<!-- widget div-->
								<div>
				
									<!-- widget edit box -->
									<div class="jarviswidget-editbox">
										<!-- This area used as dropdown edit box -->
				
									</div>
									<!-- end widget edit box -->
								<div class="widget-body-toolbar bg-color-white">
									<div class="pull-left" id="selectTime">
									</div>
									<div class="pull-right">
									<button class="btn btn-primary" id="projectImage" style="margin-bottom: 10px;"  onclick="imagView()">查看工程图</button>
									</div>
								</div>
									<!-- widget content -->
									<div class="widget-body" style="margin-top: 10px;">
									
									<div style="height: 500px" id="dataTable">
									</div>
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
		
		<div id="addSystem" hidden="hidden">
			<div>
				<fieldset>
					<div class="row">
						<div class="col-sm-12 col-md-12">
						<label>桥梁名称</label> 
							<select style="width:100%" class="input-sm select2 " id="structname">
						    </select>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
		
		<div id="cover" class="cover">		
			<div id="loading" class="loading">搜索中...
			</div> 	
		</div>
		
		<div id="imgView" hidden="hidden">
			<div>
				<img id="imag_aa" alt="工程图" style="width: 800px;height: 640px" src="">
			</div>
		</div>
		
		<div id="lineChart" hidden="hidden">
		  <div id="myChart" style="width: 1000px;height:500px;"></div>
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
		<script src="../js/plugin/jquery-form/jquery-form.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="../js/plugin/select2/select2.min.js"></script>
		<script src="check/select2Fix.js"></script>
		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="../js/plugin/fastclick/fastclick.min.js"></script>
        <script src="../js/echarts.js"></script>
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
		<script src="../js/multiDownload.js"></script>
		<script src="../js/ZeroClipboard.js"></script>
		<script src="http://pstatic.xunlei.com/js/webThunderDetect.js"></script>
		<script src="http://pstatic.xunlei.com/js/base64.js"></script>
		<script src="../js/plugin/daterangepicker/moment.min.js"></script>
        <script src="../js/plugin/daterangepicker/daterangepicker.js"></script>
        <!--layDate日期控件-->
        <script src="../js/laydate/laydate.js"></script>
		<script src="../js/jquery.cookie.js"></script>
		<script type="text/javascript">
		var check_type="";
		var info ;
		var count=0;
		var t1;
        //复制内容到剪贴板成功后的操作  
		$(document).ready(function() {
			// DO NOT REMOVE : GLOBAL FUNCTIONS!
			pageSetUp();
			initBridge();
	//		getInfo();
			getScan_struct();
			t1 = window.setInterval('initAjax()',500); 
//			setTimeout('selectData()',1500);
		});
		
        function initAjax(){
        	if(count>=1){
        		selectData();
        		window.clearInterval(t1);
        	}	
        }
        
        function changePage() {
        	var brg_id = $("#scanStruct").val();
			var brg_name = $("#scanStruct").select2('data')[0].text;
			 $.cookie("brg_id", brg_id);
			 $.cookie("brg_name", brg_name);
			location.href="SourceDownload.jsp";
		}
        
        function showMask(){
        	$("#cover").show();		
       	}
   	    function hidMask(){
       		$("#cover").css('display','none');
       	}
        
        function getScan_struct() {
        	 $.ajax({
					type : 'POST',
					url : '../BrgMonitorServlet',
					dataType : 'json',
					data : {
						type : "getInitBrgAndTime"
					},
					error : function(msg) {
						errMessage("请求BrgMonitorServlet失败");
					},
					success : function(json) {
						
							var data = json.obj;
							$("#scanStruct").empty();
							for (var i = 0; i < data.list2.length; i++) {
								$("#scanStruct").append("<option value='"+data.list2[i].bridge_id+"'>"+data.list2[i].bridge_name+"<option>");
							}
							$("#scanStruct").select2();
							/*设置默认桥*/
							<% 
								if(role.equals("admin")||role.equals("guest")||role.equals("superAdmin")){
							%>
							$("#scanStruct").select2().val(data.list1[0]).trigger("change");
							<% 
								}else{
							%>
							$("#scanStruct").select2().trigger("change");
							<%
								}
							%>
						}
					
        	 });		
		}
		
        $("#dayHours").on("change",function(){
        	var dayHours=$("#dayHours").val();
        	if(dayHours!="全部"){
				   $("#time_picker").val(dayHours);  	
        	}
        	selectData();
        });
        
        function initDayHours(){
        	$("#dayHours").html('');
        	$.ajax({
        		type:'POST',
        		url:'../BrgMonitorServlet',
        		dataType:'json',
        		data:{
        			type:"dayHours",
        			brgId:$("#scanStruct").val(),
        			item_second:$("#item_second").val()
        		},
        		error:function(msg){
        			errMessage("请求BrgMonitorServlet失败");
        		},
        		success:function(json){
        			$("#dayHours").append("<option value='全部'>全部<option>");	
        			for(var i=0;i<json.obj.length;i++){
	        			$("#dayHours").append("<option value='"+json.obj[i]+"'>"+json.obj[i]+"<option>")
        			}
        			$("#dayHours").select2();
        		}
        	});
        }
        
        
        function getInfo() {
        	$.ajax({
				type : 'POST',
				url : '../WeightHealthServlet',
				dataType : 'json',
				data : {
					type : "getInfo"
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
				},
				success : function(json) {
					if (json.success=="success") {
						info = json.obj;
						initItem_first();
					}
				}
			});
		}
        
        $('#lineChart').dialog({
        	autoOpen: false,
			width : 1070,
			height:600,
			resizable : false,
			modal : true
		});
        
        function selectData(){
        	if($('#time_picker').val()==''){
        		errMessage('请选择时间');
        		return;
        	}
        	var item_second=$('#item_second').val();
        	if(item_second==''||item_second==null){
        		errMessage('监测类型为空');
        		return;
        	}
        	$("#dataTable").html('');
        	if(item_second=='车辆荷载'){
	        	queryData();
        	}else if(item_second=='混凝土应变'){
        		strainc();
        	}else if(item_second=='钢应变'){
        		strains();
        	}else if(item_second=='动位移'){
        		dynadisp();
        	}else if(item_second=='温度'){
        		temp();
        	}else if(item_second=='索力'){
        		cableforce();
        	}else if(item_second=='静位移'){
        		staticdisp();
        	}
        }
        var projectImage;
        var big_id;
        var item_second;
        var mode;
		function strainc(){
			showMask();
			var tableName = "brg_monitor_strainc";
			$("#selectTime").html('');
			$("#projectImage").prop('disabled',true);
			$("#dataTable").css('height','auto');
			$("#dataTable").empty();
			$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
					+" <li class='active'></li>"
					+"</ul></div>"
					+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
                       +" </div>");
			var straincDom=$("#myTabOne1").html('');
			$.ajax({
				type: 'POST',
				url: '../BrgMonitorServlet',
				dataType: 'json',
				data:{
					type:"getStrainc",
					bridge_id:$('#scanStruct').val(),
					item_first:$('#item_first').val(),
					item_second:$('#item_second').val(),
					time:$('#time_picker').val(),
					mode:$('input:radio:checked').val()
				},
				success : function(json){
					if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					var straincs=json.obj[0]; 
					$("#selectTime").append("<span>"+straincs[0].time+"</span>");
					var chanelNums=json.obj[1];
					var pointsNos=json.obj[2];
					if(chanelNums==""||chanelNums==null||chanelNums==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					if(straincs==""||straincs==null||straincs==undefined||straincs.length==0){
						errMessage("该时间段无数据");
						hidMask();
						return;
					}
					hidMask();
					projectImage=json.obj[3].projectImage;
					 if(projectImage!=null&&projectImage!=""&&projectImage!=undefined){
						 $("#projectImage").prop('disabled',false);
					} 
					$("#imag_aa").prop('src','../ImageServlet?localPath='+encodeURIComponent(encodeURIComponent(projectImage)));
					if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
						straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
								"<tr align='center'>"+
									"<td>"+"通道号"+"</td>"+
									"<td>"+"测点号"+"</td>"+
									"<td>"+"最大值"+"</td>"+
									"<td>"+"0.95分位点值"+"</td>"+
									"<td>"+"最小值"+"</td>"+
									"<td>"+"0.05分位点值"+"</td>"+
									"<td>"+"平均值"+"</td>"+
									"<td>"+"方差值"+"</td>"+
									"<td>"+"状态"+"</td>"+
								"</tr>"+
						"</tfoot>");
					}else{
						straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
								"<tr align='center'>"+
									"<td>"+"通道号"+"</td>"+
									"<td>"+"最大值"+"</td>"+
									"<td>"+"0.95分位点值"+"</td>"+
									"<td>"+"最小值"+"</td>"+
									"<td>"+"0.05分位点值"+"</td>"+
									"<td>"+"平均值"+"</td>"+
									"<td>"+"方差值"+"</td>"+
									"<td>"+"状态"+"</td>"+
								"</tr>"+
						"</tfoot>");
					}
                    
				 	for(var i=0;i<chanelNums.length;i++){
				 		var mark={};
				 		mark.max="";
				 		mark.tantile_95="";
				 		mark.min="";
				 		mark.tantile_5="";
				 		mark.avg="";
				 		mark.variance="";
				 		mark.type="";
				 		mark.sort=i+1;
				 		if(straincs[i]!=null&&straincs[i]!=""){
				 			mark=straincs[i];
				 		}
				 		if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
				 			$("#strainc").append("<tr>"+
									"<td >"+chanelNums[i]+"</td>"+
									"<td>"+pointsNos[i]+"</td>"+
									"<td data-type='brg_monitor_strainc,max,"+mark.sort+"'><a>"+mark.max+"</a></td>"+
									"<td data-type='brg_monitor_strainc,tantile_95,"+mark.sort+"'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
									"<td data-type='brg_monitor_strainc,min,"+mark.sort+"'><a data-id='min'>"+mark.min+"</a></td>"+
									"<td data-type='brg_monitor_strainc,tantile_5,"+mark.sort+"'><a data-id='tantile_5'>"+mark.tantile_5+"</a></td>"+
									"<td data-type='brg_monitor_strainc,avg,"+mark.sort+"'><a data-id='avg'>"+mark.avg+"</a></td>"+
									"<td data-type='brg_monitor_strainc,variance,"+mark.sort+"'><a data-id='variance'>"+mark.variance+"</a></td>"+
									"<td data-type='brg_monitor_strainc,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
								"</tr>");
						}else{
							$("#strainc").append("<tr>"+
									"<td >"+chanelNums[i]+"</td>"+
									"<td data-type='brg_monitor_strainc,max,"+mark.sort+"'><a>"+mark.max+"</a></td>"+
									"<td data-type='brg_monitor_strainc,tantile_95,"+mark.sort+"'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
									"<td data-type='brg_monitor_strainc,min,"+mark.sort+"'><a data-id='min'>"+mark.min+"</a></td>"+
									"<td data-type='brg_monitor_strainc,tantile_5,"+mark.sort+"'><a data-id='tantile_5'>"+mark.tantile_5+"</a></td>"+
									"<td data-type='brg_monitor_strainc,avg,"+mark.sort+"'><a data-id='avg'>"+mark.avg+"</a></td>"+
									"<td data-type='brg_monitor_strainc,variance,"+mark.sort+"'><a data-id='variance'>"+mark.variance+"</a></td>"+
									"<td data-type='brg_monitor_strainc,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
								"</tr>");
						}
						
					}
				 	addClickEvenMonitor();
				}
			});
		}
		function strains(){
			showMask();
			$("#selectTime").html('');
			var tableName = "brg_monitor_strains";
			$("#projectImage").prop('disabled',true);
			$("#dataTable").empty();
			$("#dataTable").css('height','auto');
			$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
					+" <li class='active'></li>"
					+"</ul></div>"
					+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
                       +" </div>");
			var straincDom=$("#myTabOne1").html('');
			$.ajax({
				type: 'POST',
				url: '../BrgMonitorServlet',
				dataType: 'json',
				data:{
					type:"getStrains",
					bridge_id:$('#scanStruct').val(),
					item_first:$('#item_first').val(),
					item_second:$('#item_second').val(),
					time:$('#time_picker').val(),
					mode:$('input:radio:checked').val()
				},
				success : function(json){
					
					if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					var strainss=json.obj[0];
					var chanelNums=json.obj[1];
					var pointsNos=json.obj[2];
					$("#selectTime").append("<span>"+strainss[0].time+"</span>");
					if(chanelNums==""||chanelNums==null||chanelNums==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					if(strainss==""||strainss==null||strainss==undefined||strainss.length==0){
						errMessage("该时间段无数据");
						hidMask();
						return;
					}
					hidMask();
					projectImage=json.obj[3].projectImage;
				    if(projectImage!=null&&projectImage!=""&&projectImage!=undefined){
						 $("#projectImage").prop('disabled',false);
					} 
					$("#imag_aa").prop('src','../ImageServlet?localPath='+encodeURIComponent(encodeURIComponent(projectImage)));
					 if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
						 straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
									"<tr align='center'>"+
										"<td>"+"通道号"+"</td>"+
										"<td>"+"测点号"+"</td>"+
										"<td>"+"最大值"+"</td>"+
										"<td>"+"0.95分位点值"+"</td>"+
										"<td>"+"最小值"+"</td>"+
										"<td>"+"0.05分位点值"+"</td>"+
										"<td>"+"平均值"+"</td>"+
										"<td>"+"方差值"+"</td>"+
										"<td>"+"状态"+"</td>"+
									"</tr>"+
							"</tfoot>");
						}else{
							 straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
										"<tr align='center'>"+
											"<td>"+"通道号"+"</td>"+
											"<td>"+"最大值"+"</td>"+
											"<td>"+"0.95分位点值"+"</td>"+
											"<td>"+"最小值"+"</td>"+
											"<td>"+"0.05分位点值"+"</td>"+
											"<td>"+"平均值"+"</td>"+
											"<td>"+"方差值"+"</td>"+
											"<td>"+"状态"+"</td>"+
										"</tr>"+
								"</tfoot>");
						}
					
				 	for(var i=0;i<chanelNums.length;i++){
				 		var mark={};
				 		mark.max="";
				 		mark.tantile_95="";
				 		mark.min="";
				 		mark.tantile_5="";
				 		mark.avg="";
				 		mark.variance="";
				 		mark.type="";
				 		mark.sort=i+1;
				 		if(strainss[i]!=null&&strainss[i]!=""){
				 			mark=strainss[i];
				 		}
				 	     if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
				 	    	$("#strainc").append("<tr>"+
									"<td>"+chanelNums[i]+"</td>"+
									"<td>"+pointsNos[i]+"</td>"+
									"<td data-type='brg_monitor_strains,max,"+mark.sort+"'><a data-id='max'>"+mark.max+"</a></td>"+
									"<td data-type='brg_monitor_strains,tantile_95,"+mark.sort+"'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
									"<td data-type='brg_monitor_strains,min,"+mark.sort+"'><a data-id='min'>"+mark.min+"</a></td>"+
									"<td data-type='brg_monitor_strains,tantile_5,"+mark.sort+"'><a data-id='tantile_5'>"+mark.tantile_5+"</a></td>"+
									"<td data-type='brg_monitor_strains,avg,"+mark.sort+"'><a data-id='avg'>"+mark.avg+"</a></td>"+
									"<td data-type='brg_monitor_strains,variance,"+mark.sort+"'><a data-id='variance'>"+mark.variance+"</a></td>"+
									"<td data-type='brg_monitor_strains,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
								"</tr>");
							}else{
								$("#strainc").append("<tr>"+
										"<td>"+chanelNums[i]+"</td>"+
										"<td data-type='brg_monitor_strains,max,"+mark.sort+"'><a data-id='max'>"+mark.max+"</a></td>"+
										"<td data-type='brg_monitor_strains,tantile_95,"+mark.sort+"'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
										"<td data-type='brg_monitor_strains,min,"+mark.sort+"'><a data-id='min'>"+mark.min+"</a></td>"+
										"<td data-type='brg_monitor_strains,tantile_5,"+mark.sort+"'><a data-id='tantile_5'>"+mark.tantile_5+"</a></td>"+
										"<td data-type='brg_monitor_strains,avg,"+mark.sort+"'><a data-id='avg'>"+mark.avg+"</a></td>"+
										"<td data-type='brg_monitor_strains,variance,"+mark.sort+"'><a data-id='variance'>"+mark.variance+"</a></td>"+
										"<td data-type='brg_monitor_strains,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
									"</tr>");
							}
						
					}
				 	addClickEvenMonitor();
				}
			});
		}	
		function dynadisp(){
			showMask();
			$("#selectTime").html('');
			var tableName = "brg_monitor_dynadisp";
			$("#projectImage").prop('disabled',true);
			$("#dataTable").css('height','auto');
			$("#dataTable").empty();
			$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
					+" <li class='active'></li>"
					+"</ul></div>"
					+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
                       +" </div>");
			var straincDom=$("#myTabOne1").html('');
			$.ajax({
				type: 'POST',
				url: '../BrgMonitorServlet',
				dataType: 'json',
				data:{
					type:"getDynadisp",
					bridge_id:$('#scanStruct').val(),
					item_first:$('#item_first').val(),
					item_second:$('#item_second').val(),
					time:$('#time_picker').val(),
					mode:$('input:radio:checked').val()
				},
				success : function(json){
					
					var dynadisps=json.obj[0];
					var chanelNums=json.obj[1];
					var pointsNos=json.obj[2];
					$("#selectTime").append("<span>"+dynadisps[0].time+"</span>");
					if(chanelNums==""||chanelNums==null||chanelNums==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					if(json.obj[0]==""||json.obj[0]==null||json.obj[0]==undefined||json.obj[0].length==0){
						errMessage("该时间段无数据");
						hidMask();
						return;
					}
					hidMask();
					if(undefined!=json.obj[3]&&null!=json.obj[3]){
						projectImage=json.obj[3].projectImage;
					}
					if(projectImage!=null&&projectImage!=""&&projectImage!=undefined){
						 $("#projectImage").prop('disabled',false);
					} 
					$("#imag_aa").prop('src','../ImageServlet?localPath='+encodeURIComponent(encodeURIComponent(projectImage)));
					  if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
						  straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
									"<tr align='center'>"+
										"<td>"+"通道号"+"</td>"+
										"<td>"+"测点号"+"</td>"+
										"<td>"+"最大值"+"</td>"+
										"<td>"+"0.95分位点值"+"</td>"+
										"<td>"+"平均值"+"</td>"+
										"<td>"+"方差值"+"</td>"+
										"<td>"+"状态"+"</td>"+
									"</tr>"+
							"</tfoot>");
						}else{
							straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
									"<tr align='center'>"+
										"<td>"+"通道号"+"</td>"+
										"<td>"+"最大值"+"</td>"+
										"<td>"+"0.95分位点值"+"</td>"+
										"<td>"+"平均值"+"</td>"+
										"<td>"+"方差值"+"</td>"+
										"<td>"+"状态"+"</td>"+
									"</tr>"+
							"</tfoot>");
						}
					
				 	for(var i=0;i<chanelNums.length;i++){
				 		if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
							errMessage("该传感器无数据");
							hidMask();
							return;
						}
				 		var mark={};
				 		mark.max="";
				 		mark.tantile_95="";
				 		mark.min="";
				 		mark.tantile_5="";
				 		mark.avg="";
				 		mark.variance="";
				 		mark.type="";
				 		mark.sort=i+1;
				 		if(dynadisps[i]!=null&&dynadisps[i]!=""){
				 			mark=dynadisps[i];
				 		}
                        if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
                        	$("#strainc").append("<tr>"+
    								"<td>"+chanelNums[i]+"</td>"+
    								"<td>"+pointsNos[i]+"</td>"+
    								"<td data-type='brg_monitor_dynadisp,max,"+mark.sort+"'><a data-id='max'>"+mark.max+"</a></td>"+
    								"<td data-type='brg_monitor_dynadisp,tantile_95,"+mark.sort+"'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
    								"<td data-type='brg_monitor_dynadisp,avg,"+mark.sort+"'><a data-id='avg'>"+mark.avg+"</a></td>"+
    								"<td data-type='brg_monitor_dynadisp,variance,"+mark.sort+"'><a data-id='variance'>"+mark.variance+"</a></td>"+
    								"<td data-type='brg_monitor_dynadisp,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
    							"</tr>");
						}else{
							$("#strainc").append("<tr>"+
									"<td>"+chanelNums[i]+"</td>"+
									"<td data-type='brg_monitor_dynadisp,max,"+mark.sort+"'><a data-id='max'>"+mark.max+"</a></td>"+
									"<td data-type='brg_monitor_dynadisp,tantile_95,"+mark.sort+"'><a data-id='tantile_95'>"+mark.tantile_95+"</a></td>"+
									"<td data-type='brg_monitor_dynadisp,avg,"+mark.sort+"'><a data-id='avg'>"+mark.avg+"</a></td>"+
									"<td data-type='brg_monitor_dynadisp,variance,"+mark.sort+"'><a data-id='variance'>"+mark.variance+"</a></td>"+
									"<td data-type='brg_monitor_dynadisp,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
								"</tr>");
						}
						
					}
				 	addClickEvenMonitor();
				}
			});
		}	
		function temp(){
			showMask();
			$("#selectTime").html('');
			var tableName = "brg_monitor_temp";
			$("#projectImage").prop('disabled',true);
			$("#dataTable").css('height','auto');
			$("#dataTable").empty();
			$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
					+" <li class='active'></li>"
					+"</ul></div>"
					+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
                       +" </div>");
			var straincDom=$("#myTabOne1").html('');
			$.ajax({
				type: 'POST',
				url: '../BrgMonitorServlet',
				dataType: 'json',
				data:{
					type:"getTemp",
					bridge_id:$('#scanStruct').val(),
					item_first:$('#item_first').val(),
					item_second:$('#item_second').val(),
					time:$('#time_picker').val(),
					mode:$('input:radio:checked').val()
				},
				success : function(json){
					if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					if(json.obj[0]==""||json.obj[0]==null||json.obj[0]==undefined||json.obj[0].length==0){
						errMessage("该时间无数据");
						hidMask();
						return;
					}
					var temp=json.obj[0];
					var chanelNums=json.obj[1];
					var pointsNos=json.obj[2];
					$("#selectTime").append("<span>"+temp[0].time+"</span>");
					if(chanelNums==""||chanelNums==null||chanelNums==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					projectImage=json.obj[3].projectImage;
					if(projectImage!=null&&projectImage!=""&&projectImage!=undefined){
						 $("#projectImage").prop('disabled',false);
					} 
					hidMask();
					$("#imag_aa").prop('src','../ImageServlet?localPath='+encodeURIComponent(encodeURIComponent(projectImage)));
					if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
						straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
								"<tr align='center'>"+
									"<td>"+"通道号"+"</td>"+
									"<td>"+"测点号"+"</td>"+
									"<td>"+"平均值"+"</td>"+
									"<td>"+"状态"+"</td>"+
								"</tr>"+
						"</tfoot>");
					}else{
						straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
								"<tr align='center'>"+
									"<td>"+"通道号"+"</td>"+
									"<td>"+"平均值"+"</td>"+
									"<td>"+"状态"+"</td>"+
								"</tr>"+
						"</tfoot>");
					}
					
				 	for(var i=0;i<chanelNums.length;i++){
				 		var mark={};
				 		mark.max="";
				 		mark.tantile_95="";
				 		mark.min="";
				 		mark.tantile_5="";
				 		mark.avg="";
				 		mark.variance="";
				 		mark.type="";
				 		mark.sort=i+1;
				 		if(temp[i]!=null&&temp[i]!=""){
				 			mark=temp[i];
				 		}
				 		 if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
				 			$("#strainc").append("<tr>"+
									"<td>"+chanelNums[i]+"</td>"+
									"<td>"+pointsNos[i]+"</td>"+
									"<td data-type='brg_monitor_temp,avg,"+mark.sort+"'><a data-id='avg' >"+mark.avg+"</a></td>"+
									"<td data-type='brg_monitor_temp,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
								"</tr>");
							}else{
								$("#strainc").append("<tr>"+
										"<td>"+chanelNums[i]+"</td>"+
										"<td data-type='brg_monitor_temp,avg,"+mark.sort+"'><a data-id='avg' >"+mark.avg+"</a></td>"+
										"<td data-type='brg_monitor_temp,type,"+mark.sort+"'><a data-id='type'>"+mark.type+"</a></td>"+
									"</tr>");
							}
						
					}
				 	addClickEvenMonitor();
				}
			});
		}
		function cableforce(){
			showMask();
			$("#selectTime").html('');
			var tableName = "brg_monitor_cableforce";
			$("#projectImage").prop('disabled',true);
			$("#dataTable").css('height','auto');
			$("#dataTable").empty();
			$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
					+" <li class='active'></li>"
					+"</ul></div>"
					+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
                       +" </div>");
			var straincDom=$("#myTabOne1").html('');
			$.ajax({
				type: 'POST',
				url: '../BrgMonitorServlet',
				dataType: 'json',
				data:{
					type:"getCableforce",
					bridge_id:$('#scanStruct').val(),
					item_first:$('#item_first').val(),
					item_second:$('#item_second').val(),
					time:$('#time_picker').val(),
					mode:$('input:radio:checked').val()
				},
				success : function(json){
					if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					if(json.obj[0]==""||json.obj[0]==null||json.obj[0]==undefined||json.obj[0].length==0){
						errMessage("该时间无数据");
						hidMask();
						return;
					}
					hidMask();
					var cableforces=json.obj[0];
					var chanelNums=json.obj[1];
					var pointsNos=json.obj[2];
					$("#selectTime").append("<span>"+cableforces[0].time+"</span>");
					projectImage=json.obj[3].projectImage;
					if(projectImage!=null&&projectImage!=""&&projectImage!=undefined){
						 $("#projectImage").prop('disabled',false);
					} 
					$("#imag_aa").prop('src','../ImageServlet?localPath='+encodeURIComponent(encodeURIComponent(projectImage)));
					 if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
						 straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
									"<tr align='center'>"+
										"<td>"+"通道号"+"</td>"+
										"<td>"+"测点号"+"</td>"+
										"<td>"+"平均值"+"</td>"+
										"<td>"+"状态"+"</td>"+
									"</tr>"+
							"</tfoot>");
						}else{
							straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
									"<tr align='center'>"+
										"<td>"+"通道号"+"</td>"+
										"<td>"+"平均值"+"</td>"+
										"<td>"+"状态"+"</td>"+
									"</tr>"+
							"</tfoot>");
						}
					
				 	for(var i=0;i<chanelNums.length;i++){
				 		var mark={};
				 		mark.max="";
				 		mark.tantile_95="";
				 		mark.min="";
				 		mark.tantile_5="";
				 		mark.avg="";
				 		mark.variance="";
				 		mark.type="";
				 		mark.sort=i+1;
				 		if(cableforces[i]!=null&&cableforces[i]!=""){
				 			mark=cableforces[i];
				 		}
                        if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
                        	$("#strainc").append("<tr>"+
    								"<td>"+chanelNums[i]+"</td>"+
    								"<td>"+pointsNos[i]+"</td>"+
    								"<td data-type='brg_monitor_cableforce,avg,"+mark.sort+"'><a>"+mark.avg+"</a></td>"+
    								"<td data-type='brg_monitor_cableforce,type,"+mark.sort+"'><a>"+mark.type+"</a></td>"+
    							"</tr>");
						}else{
							$("#strainc").append("<tr>"+
									"<td>"+chanelNums[i]+"</td>"+
									"<td data-type='brg_monitor_cableforce,avg,"+mark.sort+"'><a>"+mark.avg+"</a></td>"+
									"<td data-type='brg_monitor_cableforce,type,"+mark.sort+"'><a>"+mark.type+"</a></td>"+
								"</tr>");
						}
						
					}
				 	addClickEvenMonitor();
				}
			});
		}	
		function staticdisp(){
			showMask();
			$("#selectTime").html('');
			var tableName = "brg_monitor_staticdisp";
			$("#projectImage").prop('disabled',true);
			$("#dataTable").css('height','auto');
			$("#dataTable").empty();
			$("#dataTable").append("<div><ul   class='nav nav-tabs pull-left'>"
					+" <li class='active'></li>"
					+"</ul></div>"
					+" <table id='myTabOne1' class='table table-bordered table-hover' border='2'   bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
                       +" </div>");
			var straincDom=$("#myTabOne1").html('');
			$.ajax({
				type: 'POST',
				url: '../BrgMonitorServlet',
				dataType: 'json',
				data:{
					type:"getStaticdisp",
					bridge_id:$('#scanStruct').val(),
					item_first:$('#item_first').val(),
					item_second:$('#item_second').val(),
					time:$('#time_picker').val(),
					mode:$('input:radio:checked').val()
				},
				success : function(json){
					if(json.obj[1]==""||json.obj[1]==null||json.obj[1]==undefined){
						errMessage("该传感器无数据");
						hidMask();
						return;
					}
					if(json.obj[0]==""||json.obj[0]==null||json.obj[0]==undefined||json.obj[0].length==0){
						errMessage("该时间无数据");
						hidMask();
						return;
					}
					hidMask();
					var staticdisps=json.obj[0];
					var chanelNums=json.obj[1];
					var pointsNos=json.obj[2];
					$("#selectTime").append("<span>"+staticdisps[0].time+"</span>");
					projectImage=json.obj[3].projectImage;
					if(projectImage!=null&&projectImage!=""&&projectImage!=undefined){
						 $("#projectImage").prop('disabled',false);
					} 
					$("#imag_aa").prop('src','../ImageServlet?localPath='+encodeURIComponent(encodeURIComponent(projectImage)));
					 if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
						 straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
									"<tr align='center'>"+
										"<td>"+"通道号"+"</td>"+
										"<td>"+"测点号"+"</td>"+
										"<td>"+"最大值"+"</td>"+
										"<td>"+"最小值"+"</td>"+
										"<td>"+"状态"+"</td>"+
									"</tr>"+
							"</tfoot>");
						}else{
							straincDom.append("<thead>"+"</thead>"+"<tfoot id='strainc'>"+
									"<tr align='center'>"+
										"<td>"+"通道号"+"</td>"+
										"<td>"+"最大值"+"</td>"+
										"<td>"+"最小值"+"</td>"+
										"<td>"+"状态"+"</td>"+
									"</tr>"+
							"</tfoot>");
						}
					
				 	for(var i=0;i<chanelNums.length;i++){
				 		var mark={};
				 		mark.max="";
				 		mark.tantile_95="";
				 		mark.min="";
				 		mark.tantile_5="";
				 		mark.avg="";
				 		mark.variance="";
				 		mark.type="";
				 		mark.sort=i+1;
				 		if(staticdisps[i]!=null&&staticdisps[i]!=""){
				 			mark=staticdisps[i];
				 		}
                        if(pointsNos!=null&&pointsNos!=''&&pointsNos!=undefined){
                        	$("#strainc").append("<tr>"+
    								"<td>"+chanelNums[i]+"</td>"+
    								"<td>"+pointsNos[i]+"</td>"+
    								"<td data-type='brg_monitor_staticdisp,max,"+mark.sort+"'><a>"+mark.max+"</a></td>"+
    								"<td data-type='brg_monitor_staticdisp,min,"+mark.sort+"'><a>"+mark.min+"</a></td>"+
    								"<td data-type='brg_monitor_staticdisp,type,"+mark.sort+"'><a>"+mark.type+"</a></td>"+
    							"</tr>");
						}else{
							$("#strainc").append("<tr>"+
									"<td>"+chanelNums[i]+"</td>"+
									"<td data-type='brg_monitor_staticdisp,max,"+mark.sort+"'><a>"+mark.max+"</a></td>"+
									"<td data-type='brg_monitor_staticdisp,min,"+mark.sort+"'><a>"+mark.min+"</a></td>"+
									"<td data-type='brg_monitor_staticdisp,type,"+mark.sort+"'><a>"+mark.type+"</a></td>"+
								"</tr>");
						}
						
					}
				 	addClickEvenMonitor();
				}
			});
		}	
		
		function queryData() {
			$("#dataTable").html('');
       		dmWeight();
       		$("#projectImage").prop('disabled',true);
        	brg_id=$('#scanStruct').val();
        	$("#selectTime").html('');
        	var item_first=$('#item_first').val();
        	item_second=$('#item_second').val();
        	var time=$('#time_picker').val();
        	mode=$('input:radio:checked').val();
        	var NumVehi=$("#myTabOne1").html('');
			var MaxGw=$("#myTabOne2").html('');
			var NumOvlo=$("#myTabOne3").html('');
			var RatioOvlo=$("#myTabOne4").html('');
			var ProbOvlo=$("#myTabOne5").html('');
			var LoadRadio=$("#myTabOne6").html('');
			$.ajax({
        		type:'post',
        		url:'../NumVehiServlet',
        		dataType : 'json',
        		data:{
        			type:'getWeight',	
        			brg_id:brg_id,
        			item_first:item_first,
        			item_second:item_second,
        			mode:mode,
        			time:time
        		},
        		error:function(msg){
        			errMessage("请求NumVehiServlet失败, 无桥梁信息");
        		},
        		success:function(json){
        		if(json.obj[0].monitor[0]!=null||json.obj[0].monitor[0]!=undefined){;
        			if(json.obj[0].monitor[0].projectImage!=null||json.obj[0].monitor[0].projectImage!=undefined){
	        			projectImage=json.obj[0].monitor[0].projectImage;
	        			$("#projectImage").prop('disabled',false);
	        			$("#imag_aa").prop('src','../ImageServlet?type=1&localPath='+encodeURIComponent(encodeURIComponent(projectImage)));
        			}
        		}
        		if(item_second=='车辆荷载'){
        			if(brg_id=='d5d060752ada4495896243aa3d9cfae2'||brg_id=='G15320682L0130'||"G15320921L0010"==brg_id){
        				if(json.obj[0].NumVehi8[0]==null||json.obj[0].NumVehi8[0]==undefined){
        					errMessage("没有数据");
        					NumVehi.append("<thead>"+"</thead>"+"<tfoot>"+
        							"<tr align='center'>"+
        								"<td>"+"方向"+"</td>"+
        								"<td>"+"车道编号"+"</td>"+
        								"<td>"+"车道名"+"</td>"+
        								"<td>"+"2轴车"+"</td>"+
        								"<td>"+"3轴车"+"</td>"+
        								"<td>"+"4轴车"+"</td>"+
        								"<td>"+"5轴车"+"</td>"+
        								"<td>"+"6轴车"+"</td>"+
        								"<td>"+"7轴车及以上"+"</td>"+
        								"<td>"+"合计"+"</td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='5'>"+"上行"+"</td>"+
        								"<td>"+"1"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane1'><a></a></td>"+
        							"</tr>" + 
        							"<tr align='center'>"+
    									"<td>"+"2"+"</td>"+
    									"<td>"+"车道3"+"</td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_1'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_2'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_3'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_4'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_5'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_6'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi_lane2'><a></a></td>"+
    								"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"3"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane3'><a></a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane4'><a></a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_half1'><a></a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='5'>"+"下行"+"</td>"+
        								"<td>"+"5"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane5'><a></a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"6"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane6'><a></a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
    									"<td>"+"7"+"</td>"+
    									"<td>"+"车道3"+"</td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_1'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_2'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_3'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_4'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_5'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_6'><a></a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi_lane7'><a></a></td>"+
    								"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"8"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane8'><a></a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_half2'><a></a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+""+"</td>"+
        								"<td colspan='2'>"+"合计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle1'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle2'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle3'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle4'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle5'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle6'><a></a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_all'><a></a></td>"+
        							"</tr>"+
        						"</tfoot>");
            				
            					MaxGw.append("<thead>"+
            						"</thead>"+
            						"<tfoot>"+
            							"<tr align='center'>"+
            								"<td>"+"方向"+"</td>"+
            								"<td>"+"车道编号"+"</td>"+
            								"<td>"+"车道名"+"</td>"+
            								"<td>"+"2轴车"+"</td>"+
            								"<td>"+"3轴车"+"</td>"+
            								"<td>"+"4轴车"+"</td>"+
            								"<td>"+"5轴车"+"</td>"+
            								"<td>"+"6轴车"+"</td>"+
            								"<td>"+"7轴车及以上"+"</td>"+
            								"<td>"+"合计"+"</td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td rowspan='5'>"+"上行"+"</td>"+
            								"<td>"+"1"+"</td>"+
            								"<td>"+"停车道"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane1'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"2"+"</td>"+
            								"<td>"+"车道3"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane2'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"3"+"</td>"+
            								"<td>"+"车道2"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane3'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_1'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_2'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_3'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_4'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_5'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_6'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw_lane4'><a></a></td>"+
        								"</tr>"+
            							"<tr align='center'>"+
            								"<td colspan='2'>"+"小计"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_half1'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td rowspan='5'>"+"下行"+"</td>"+
            								"<td>"+"5"+"</td>"+
            								"<td>"+"车道1"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane5'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"6"+"</td>"+
            								"<td>"+"车道2"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_1'></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_2'></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_3'></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_4'></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_5'></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_6'></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane6'></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"7"+"</td>"+
            								"<td>"+"车道3"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane7'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
        								"<td>"+"8"+"</td>"+
    	    								"<td>"+"停车道"+"</td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_1'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_2'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_3'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_4'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_5'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_6'><a></a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw_lane8'><a></a></td>"+
        								"</tr>"+
            							"<tr align='center'>"+
            								"<td colspan='2'>"+"小计"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_half2'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+""+"</td>"+
            								"<td colspan='2'>"+"合计"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle1'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle2'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle3'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle4'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle5'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle6'><a></a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_all'><a></a></td>"+
            							"</tr>"+
            						"</tfoot>")
            						
            						NumOvlo.append("<thead>"+
            								"</thead>"+
            								"<tfoot>"+
            									"<tr align='center'>"+
            										"<td>"+"方向"+"</td>"+
            										"<td>"+"车道编号"+"</td>"+
            										"<td>"+"车道名"+"</td>"+
            										"<td>"+"2轴车"+"</td>"+
            										"<td>"+"3轴车"+"</td>"+
            										"<td>"+"4轴车"+"</td>"+
            										"<td>"+"5轴车"+"</td>"+
            										"<td>"+"6轴车"+"</td>"+
            										"<td>"+"7轴车及以上"+"</td>"+
            										"<td>"+"合计"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"上行"+"</td>"+
            										"<td>"+"1"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane1'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"2"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane2'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_Ovlo3_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane3'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
        										"<td>"+"4"+"</td>"+
    	    										"<td>"+"车道1"+"</td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_1'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_2'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_3'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_4'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_5'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_6'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane4'><a></a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_half1'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"下行"+"</td>"+
            										"<td>"+"5"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane5'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane6'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"7"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane7'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
        										"<td>"+"8"+"</td>"+
        										"<td>"+"停车道"+"</td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_1'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_2'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_3'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_4'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_5'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_6'><a></a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane8'><a></a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_half2'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+""+"</td>"+
            										"<td colspan='2'>"+"合计"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle1'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle2'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle3'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle4'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle5'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle6'><a></a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_all'><a></a></td>"+
            									"</tr>"+
            								"</tfoot>")
            								
            								RatioOvlo.append("<thead>"+
            								"</thead>"+
            								"<tfoot>"+
            									"<tr align='center'>"+
            										"<td>"+"方向"+"</td>"+
            										"<td>"+"车道编号"+"</td>"+
            										"<td>"+"车道名"+"</td>"+
            										"<td>"+"2轴车"+"</td>"+
            										"<td>"+"3轴车"+"</td>"+
            										"<td>"+"4轴车"+"</td>"+
            										"<td>"+"5轴车"+"</td>"+
            										"<td>"+"6轴车"+"</td>"+
            										"<td>"+"7轴车及以上"+"</td>"+
            										"<td>"+"合计"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"上行"+"</td>"+
            										"<td>"+"1"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane1'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"2"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane2'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane3'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
        											"<td>"+"4"+"</td>"+
        											"<td>"+"车道1"+"</td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_1'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_2'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_3'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_4'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_5'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_6'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane4'><a></a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_half1'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"下行"+"</td>"+
            										"<td>"+"5"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_Ovlo5_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane5'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_Ovlo6_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane6'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"7"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane7'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
    	    										"<td>"+"8"+"</td>"+
    	    										"<td>"+"停车道"+"</td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_1'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_2'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_3'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_4'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_5'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_6'><a></a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane8'><a></a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_half2'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+""+"</td>"+
            										"<td colspan='2'>"+"合计"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle1'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle2'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle3'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle4'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle5'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle6'><a></a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_all'><a></a></td>"+
            									"</tr>"+
            								"</tfoot>")
            								
            								ProbOvlo.append("<thead>"+
            								"</thead>"+
            								"<tfoot>"+
            									"<tr align='center'>"+
            										"<td>"+"方向"+"</td>"+
            										"<td>"+"车道编号"+"</td>"+
            										"<td>"+"车道名"+"</td>"+
            										"<td>"+"2轴车"+"</td>"+
            										"<td>"+"3轴车"+"</td>"+
            										"<td>"+"4轴车"+"</td>"+
            										"<td>"+"5轴车"+"</td>"+
            										"<td>"+"6轴车"+"</td>"+
            										"<td>"+"7轴车及以上"+"</td>"+
            										"<td>"+"合计"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"上行"+"</td>"+
            										"<td>"+"1"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane1'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"2"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane2'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane3'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
    	    										"<td>"+"4"+"</td>"+
    	    										"<td>"+"车道3"+"</td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_1'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_2'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_3'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_4'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_5'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_6'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane4'><a></a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_half1'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"下行"+"</td>"+
            										"<td>"+"5"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane5'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane6'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"7"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane7'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
    	    										"<td>"+"8"+"</td>"+
    	    										"<td>"+"停车道"+"</td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_1'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_2'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_3'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_4'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_5'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_6'><a></a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane8'><a></a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_half2'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+""+"</td>"+
            										"<td colspan='2'>"+"合计"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle1'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle2'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle3'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle4'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle5'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle6'><a></a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_all'><a></a></td>"+
            									"</tr>"+
            								"</tfoot>");
            								
            								LoadRadio.append("<thead>"+
            										"</thead>"+
            										"<tfoot>"+
            											"<tr align='center'>"+
            												"<td rowspan='2'>"+"方向"+"</td>"+
            												"<td rowspan='2'>"+"车道编号"+"</td>"+
            												"<td rowspan='2'>"+"车道名"+"</td>"+
            												"<td colspan='3'>"+"实际荷载效应/设计荷载效应"+"</td>"+
            												"<td colspan='3'>"+"实际荷载效应/规范荷载效应"+"</td>"+
            												"<td rowspan='2'>"+"荷载状态"+"</td>"+
            												"<td rowspan='2'>"+"车道状态"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
    	    												"<td>"+"标准值"+"</td>"+
    	    												"<td>"+"最大值"+"</td>"+
    	    												"<td>"+"0.95分位值"+"</td>"+
    	    												"<td>"+"标准值"+"</td>"+
    	    												"<td>"+"最大值"+"</td>"+
    	    												"<td>"+"0.95分位值"+"</td>"+
        												"</tr>"+
            											"<tr align='center'>"+
            												"<td rowspan='4'>"+"上行"+"</td>"+
            												"<td>"+"1"+"</td>"+
            												"<td>"+"停车道"+"</td>"+
            												"<td data-type='brg_weight_load_radio,load_radio1' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio2' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio3' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio4' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio5' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio6' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio7' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio8' rowspan='4'><a></a></td>"+
            											"</tr>"+
            											"<tr align='center'>"+
        													"<td>"+"2"+"</td>"+
        													"<td>"+"车道3"+"</td>"+
        												"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"3"+"</td>"+
            												"<td>"+"车道2"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"4"+"</td>"+
            												"<td>"+"车道1"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td rowspan='4'>"+"下行"+"</td>"+
            												"<td>"+"5"+"</td>"+
            												"<td>"+"车道1"+"</td>"+
            												"<td data-type='brg_weight_load_radio,load_radio9' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio10' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio11' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio12' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio13' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio14' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio15' rowspan='4'><a></a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio16' rowspan='4'><a></a></td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"6"+"</td>"+
            												"<td>"+"车道2"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"7"+"</td>"+
            												"<td>"+"车道3"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
        													"<td>"+"8"+"</td>"+
        													"<td>"+"停车道"+"</td>"+
        												"</tr>"+
            										"</tfoot>");
        				}else{
        					
        					$("#selectTime").append("<span>"+json.obj[0].NumVehi8[0].brgStartime+"</span>");
        					
        					NumVehi.append("<thead>"+"</thead>"+"<tfoot>"+
        							"<tr align='center'>"+
        								"<td>"+"方向"+"</td>"+
        								"<td>"+"车道编号"+"</td>"+
        								"<td>"+"车道名"+"</td>"+
        								"<td>"+"2轴车"+"</td>"+
        								"<td>"+"3轴车"+"</td>"+
        								"<td>"+"4轴车"+"</td>"+
        								"<td>"+"5轴车"+"</td>"+
        								"<td>"+"6轴车"+"</td>"+
        								"<td>"+"7轴车及以上"+"</td>"+
        								"<td>"+"合计"+"</td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='5'>"+"上行"+"</td>"+
        								"<td>"+"1"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_1'><a>"+json.obj[0].NumVehi8[0].numVehi1_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_2'><a>"+json.obj[0].NumVehi8[0].numVehi1_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_3'><a>"+json.obj[0].NumVehi8[0].numVehi1_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_4'><a>"+json.obj[0].NumVehi8[0].numVehi1_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_5'><a>"+json.obj[0].NumVehi8[0].numVehi1_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi1_6'><a>"+json.obj[0].NumVehi8[0].numVehi1_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane1'><a>"+json.obj[0].NumVehi8[0].numVehiLane1+"</a></td>"+
        							"</tr>" + 
        							"<tr align='center'>"+
    									"<td>"+"2"+"</td>"+
    									"<td>"+"车道3"+"</td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_1'><a>"+json.obj[0].NumVehi8[0].numVehi2_1+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_2'><a>"+json.obj[0].NumVehi8[0].numVehi2_2+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_3'><a>"+json.obj[0].NumVehi8[0].numVehi2_3+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_4'><a>"+json.obj[0].NumVehi8[0].numVehi2_4+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_5'><a>"+json.obj[0].NumVehi8[0].numVehi2_5+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi2_6'><a>"+json.obj[0].NumVehi8[0].numVehi2_6+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi_lane2'><a>"+json.obj[0].NumVehi8[0].numVehiLane2+"</a></td>"+
    								"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"3"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_1'><a>"+json.obj[0].NumVehi8[0].numVehi3_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_2'><a>"+json.obj[0].NumVehi8[0].numVehi3_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_3'><a>"+json.obj[0].NumVehi8[0].numVehi3_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_4'><a>"+json.obj[0].NumVehi8[0].numVehi3_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_5'><a>"+json.obj[0].NumVehi8[0].numVehi3_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi3_6'><a>"+json.obj[0].NumVehi8[0].numVehi3_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane3'><a>"+json.obj[0].NumVehi8[0].numVehiLane3+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_1'><a>"+json.obj[0].NumVehi8[0].numVehi4_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_2'><a>"+json.obj[0].NumVehi8[0].numVehi4_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_3'><a>"+json.obj[0].NumVehi8[0].numVehi4_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_4'><a>"+json.obj[0].NumVehi8[0].numVehi4_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_5'><a>"+json.obj[0].NumVehi8[0].numVehi4_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi4_6'><a>"+json.obj[0].NumVehi8[0].numVehi4_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane4'><a>"+json.obj[0].NumVehi8[0].numVehiLane4+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_1'><a>"+json.obj[0].NumVehi8[0].numVehiHax1_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_2'><a>"+json.obj[0].NumVehi8[0].numVehiHax1_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_3'><a>"+json.obj[0].NumVehi8[0].numVehiHax1_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_4'><a>"+json.obj[0].NumVehi8[0].numVehiHax1_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_5'><a>"+json.obj[0].NumVehi8[0].numVehiHax1_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_6'><a>"+json.obj[0].NumVehi8[0].numVehiHax1_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_half1'><a>"+json.obj[0].NumVehi8[0].numVehiHalf1+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='5'>"+"下行"+"</td>"+
        								"<td>"+"5"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_1'><a>"+json.obj[0].NumVehi8[0].numVehi5_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_2'><a>"+json.obj[0].NumVehi8[0].numVehi5_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_3'><a>"+json.obj[0].NumVehi8[0].numVehi5_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_4'><a>"+json.obj[0].NumVehi8[0].numVehi5_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_5'><a>"+json.obj[0].NumVehi8[0].numVehi5_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi5_6'><a>"+json.obj[0].NumVehi8[0].numVehi5_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane5'><a>"+json.obj[0].NumVehi8[0].numVehiLane5+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"6"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a>"+json.obj[0].NumVehi8[0].numVehi6_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a>"+json.obj[0].NumVehi8[0].numVehi6_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a>"+json.obj[0].NumVehi8[0].numVehi6_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a>"+json.obj[0].NumVehi8[0].numVehi6_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a>"+json.obj[0].NumVehi8[0].numVehi6_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a>"+json.obj[0].NumVehi8[0].numVehi6_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane6'><a>"+json.obj[0].NumVehi8[0].numVehiLane6+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
    									"<td>"+"7"+"</td>"+
    									"<td>"+"车道3"+"</td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_1'><a>"+json.obj[0].NumVehi8[0].numVehi7_1+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_2'><a>"+json.obj[0].NumVehi8[0].numVehi7_2+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_3'><a>"+json.obj[0].NumVehi8[0].numVehi7_3+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_4'><a>"+json.obj[0].NumVehi8[0].numVehi7_4+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_5'><a>"+json.obj[0].NumVehi8[0].numVehi7_5+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi7_6'><a>"+json.obj[0].NumVehi8[0].numVehi7_6+"</a></td>"+
    									"<td data-type='brg_weight_num_vehi_8,num_vehi_lane7'><a>"+json.obj[0].NumVehi8[0].numVehiLane7+"</a></td>"+
    								"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"8"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_1'><a>"+json.obj[0].NumVehi8[0].numVehi8_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_2'><a>"+json.obj[0].NumVehi8[0].numVehi8_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_3'><a>"+json.obj[0].NumVehi8[0].numVehi8_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_4'><a>"+json.obj[0].NumVehi8[0].numVehi8_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_5'><a>"+json.obj[0].NumVehi8[0].numVehi8_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi8_6'><a>"+json.obj[0].NumVehi8[0].numVehi8_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane8'><a>"+json.obj[0].NumVehi8[0].numVehiLane8+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_1'><a>"+json.obj[0].NumVehi8[0].numVehiHax2_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_2'><a>"+json.obj[0].NumVehi8[0].numVehiHax2_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_3'><a>"+json.obj[0].NumVehi8[0].numVehiHax2_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_4'><a>"+json.obj[0].NumVehi8[0].numVehiHax2_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_5'><a>"+json.obj[0].NumVehi8[0].numVehiHax2_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_6'><a>"+json.obj[0].NumVehi8[0].numVehiHax2_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_half2'><a>"+json.obj[0].NumVehi8[0].numVehiHalf2+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+""+"</td>"+
        								"<td colspan='2'>"+"合计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle1'><a>"+json.obj[0].NumVehi8[0].numVehiAxle1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle2'><a>"+json.obj[0].NumVehi8[0].numVehiAxle2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle3'><a>"+json.obj[0].NumVehi8[0].numVehiAxle3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle4'><a>"+json.obj[0].NumVehi8[0].numVehiAxle4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle5'><a>"+json.obj[0].NumVehi8[0].numVehiAxle5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle6'><a>"+json.obj[0].NumVehi8[0].numVehiAxle6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi_8,num_vehi_all'><a>"+json.obj[0].NumVehi8[0].numVehiAll+"</a></td>"+
        							"</tr>"+
        						"</tfoot>");
            				
            					MaxGw.append("<thead>"+
            						"</thead>"+
            						"<tfoot>"+
            							"<tr align='center'>"+
            								"<td>"+"方向"+"</td>"+
            								"<td>"+"车道编号"+"</td>"+
            								"<td>"+"车道名"+"</td>"+
            								"<td>"+"2轴车"+"</td>"+
            								"<td>"+"3轴车"+"</td>"+
            								"<td>"+"4轴车"+"</td>"+
            								"<td>"+"5轴车"+"</td>"+
            								"<td>"+"6轴车"+"</td>"+
            								"<td>"+"7轴车及以上"+"</td>"+
            								"<td>"+"合计"+"</td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td rowspan='5'>"+"上行"+"</td>"+
            								"<td>"+"1"+"</td>"+
            								"<td>"+"停车道"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw1_1+"'><a>"+json.obj[0].MaxGw8[0].maxGw1_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw1_2+"'><a>"+json.obj[0].MaxGw8[0].maxGw1_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw1_3+"'><a>"+json.obj[0].MaxGw8[0].maxGw1_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw1_4+"'><a>"+json.obj[0].MaxGw8[0].maxGw1_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw1_5+"'><a>"+json.obj[0].MaxGw8[0].maxGw1_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw1_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw1_6+"'><a>"+json.obj[0].MaxGw8[0].maxGw1_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane1' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane1+"'><a>"+json.obj[0].MaxGw8[0].maxGwLane1+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"2"+"</td>"+
            								"<td>"+"车道3"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw2_1+"'><a>"+json.obj[0].MaxGw8[0].maxGw2_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw2_2+"'><a>"+json.obj[0].MaxGw8[0].maxGw2_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw2_3+"'><a>"+json.obj[0].MaxGw8[0].maxGw2_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw2_4+"'><a>"+json.obj[0].MaxGw8[0].maxGw2_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw2_5+"'><a>"+json.obj[0].MaxGw8[0].maxGw2_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw2_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw2_6+"'><a>"+json.obj[0].MaxGw8[0].maxGw2_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane2' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane2+"'><a>"+json.obj[0].MaxGw8[0].maxGwLane2+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"3"+"</td>"+
            								"<td>"+"车道2"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw3_1+"'><a>"+json.obj[0].MaxGw8[0].maxGw3_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw3_2+"'><a>"+json.obj[0].MaxGw8[0].maxGw3_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw3_3+"'><a>"+json.obj[0].MaxGw8[0].maxGw3_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw3_4+"'><a>"+json.obj[0].MaxGw8[0].maxGw3_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw3_5+"'><a>"+json.obj[0].MaxGw8[0].maxGw3_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw3_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw3_6+"'><a>"+json.obj[0].MaxGw8[0].maxGw3_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane3' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane3+"'><a>"+json.obj[0].MaxGw8[0].maxGwLane3+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw4_1+"'><a>"+json.obj[0].MaxGw8[0].maxGw4_1+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw4_2+"'><a>"+json.obj[0].MaxGw8[0].maxGw4_2+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw4_3+"'><a>"+json.obj[0].MaxGw8[0].maxGw4_3+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw4_4+"'><a>"+json.obj[0].MaxGw8[0].maxGw4_4+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw4_5+"'><a>"+json.obj[0].MaxGw8[0].maxGw4_5+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw4_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw4_6+"'><a>"+json.obj[0].MaxGw8[0].maxGw4_6+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw_lane4' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane4+"'><a>"+json.obj[0].MaxGw8[0].maxGwLane4+"</a></td>"+
        								"</tr>"+
            							"<tr align='center'>"+
            								"<td colspan='2'>"+"小计"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_1' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax1_1+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax1_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_2' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax1_2+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax1_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_3' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax1_3+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax1_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_4' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax1_4+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax1_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_5' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax1_5+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax1_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_6' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax1_6+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax1_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_half1' title='"+json.obj[0].MaxGwInfo8[0].maxGwHalf1+"'><a>"+json.obj[0].MaxGw8[0].maxGwHalf1+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td rowspan='5'>"+"下行"+"</td>"+
            								"<td>"+"5"+"</td>"+
            								"<td>"+"车道1"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw5_1+"'><a>"+json.obj[0].MaxGw8[0].maxGw5_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw5_2+"'><a>"+json.obj[0].MaxGw8[0].maxGw5_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw5_3+"'><a>"+json.obj[0].MaxGw8[0].maxGw5_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw5_4+"'><a>"+json.obj[0].MaxGw8[0].maxGw5_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw5_5+"'><a>"+json.obj[0].MaxGw8[0].maxGw5_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw5_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw5_6+"'><a>"+json.obj[0].MaxGw8[0].maxGw5_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane5' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane5+"'><a>"+json.obj[0].MaxGw8[0].maxGwLane5+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"6"+"</td>"+
            								"<td>"+"车道2"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw6_1+"'>"+json.obj[0].MaxGw8[0].maxGw6_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw6_2+"'>"+json.obj[0].MaxGw8[0].maxGw6_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw6_3+"'>"+json.obj[0].MaxGw8[0].maxGw6_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw6_4+"'>"+json.obj[0].MaxGw8[0].maxGw6_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw6_5+"'>"+json.obj[0].MaxGw8[0].maxGw6_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw6_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw6_6+"'>"+json.obj[0].MaxGw8[0].maxGw6_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane6' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane6+"'>"+json.obj[0].MaxGw8[0].maxGwLane6+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"7"+"</td>"+
            								"<td>"+"车道3"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw7_1+"'><a>"+json.obj[0].MaxGw8[0].maxGw7_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw7_2+"'><a>"+json.obj[0].MaxGw8[0].maxGw7_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw7_3+"'><a>"+json.obj[0].MaxGw8[0].maxGw7_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw7_4+"'><a>"+json.obj[0].MaxGw8[0].maxGw7_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw7_5+"'><a>"+json.obj[0].MaxGw8[0].maxGw7_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw7_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw7_6+"'><a>"+json.obj[0].MaxGw8[0].maxGw7_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_lane7' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane7+"'><a>"+json.obj[0].MaxGw8[0].maxGwLane7+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
        								"<td>"+"8"+"</td>"+
    	    								"<td>"+"停车道"+"</td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_1' title='"+json.obj[0].MaxGwInfo8[0].maxGw8_1+"'><a>"+json.obj[0].MaxGw8[0].maxGw8_1+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_2' title='"+json.obj[0].MaxGwInfo8[0].maxGw8_2+"'><a>"+json.obj[0].MaxGw8[0].maxGw8_2+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_3' title='"+json.obj[0].MaxGwInfo8[0].maxGw8_3+"'><a>"+json.obj[0].MaxGw8[0].maxGw8_3+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_4' title='"+json.obj[0].MaxGwInfo8[0].maxGw8_4+"'><a>"+json.obj[0].MaxGw8[0].maxGw8_4+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_5' title='"+json.obj[0].MaxGwInfo8[0].maxGw8_5+"'><a>"+json.obj[0].MaxGw8[0].maxGw8_5+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw8_6' title='"+json.obj[0].MaxGwInfo8[0].maxGw8_6+"'><a>"+json.obj[0].MaxGw8[0].maxGw8_6+"</a></td>"+
    	    								"<td data-type='brg_weight_max_gw_8,max_gw_lane8' title='"+json.obj[0].MaxGwInfo8[0].maxGwLane8+"'><a>"+json.obj[0].MaxGw8[0].maxGwLane8+"</a></td>"+
        								"</tr>"+
            							"<tr align='center'>"+
            								"<td colspan='2'>"+"小计"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_1' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax2_1+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax2_1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_2' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax2_2+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax2_2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_3' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax2_3+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax2_3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_4' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax2_4+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax2_4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_5' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax2_5+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax2_5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_6' title='"+json.obj[0].MaxGwInfo8[0].maxGwHax2_6+"'><a>"+json.obj[0].MaxGw8[0].maxGwHax2_6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_half2' title='"+json.obj[0].MaxGwInfo8[0].maxGwHalf2+"'><a>"+json.obj[0].MaxGw8[0].maxGwHalf2+"</a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+""+"</td>"+
            								"<td colspan='2'>"+"合计"+"</td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle1' title='"+json.obj[0].MaxGwInfo8[0].maxGwAxle1+"'><a>"+json.obj[0].MaxGw8[0].maxGwAxle1+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle2' title='"+json.obj[0].MaxGwInfo8[0].maxGwAxle2+"'><a>"+json.obj[0].MaxGw8[0].maxGwAxle2+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle3' title='"+json.obj[0].MaxGwInfo8[0].maxGwAxle3+"'><a>"+json.obj[0].MaxGw8[0].maxGwAxle3+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle4' title='"+json.obj[0].MaxGwInfo8[0].maxGwAxle4+"'><a>"+json.obj[0].MaxGw8[0].maxGwAxle4+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle5' title='"+json.obj[0].MaxGwInfo8[0].maxGwAxle5+"'><a>"+json.obj[0].MaxGw8[0].maxGwAxle5+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_axle6' title='"+json.obj[0].MaxGwInfo8[0].maxGwAxle6+"'><a>"+json.obj[0].MaxGw8[0].maxGwAxle6+"</a></td>"+
            								"<td data-type='brg_weight_max_gw_8,max_gw_all' title='"+json.obj[0].MaxGwInfo8[0].maxGwAll+"'><a>"+json.obj[0].MaxGw8[0].maxGwAll+"</a></td>"+
            							"</tr>"+
            						"</tfoot>")
            						
            						NumOvlo.append("<thead>"+
            								"</thead>"+
            								"<tfoot>"+
            									"<tr align='center'>"+
            										"<td>"+"方向"+"</td>"+
            										"<td>"+"车道编号"+"</td>"+
            										"<td>"+"车道名"+"</td>"+
            										"<td>"+"2轴车"+"</td>"+
            										"<td>"+"3轴车"+"</td>"+
            										"<td>"+"4轴车"+"</td>"+
            										"<td>"+"5轴车"+"</td>"+
            										"<td>"+"6轴车"+"</td>"+
            										"<td>"+"7轴车及以上"+"</td>"+
            										"<td>"+"合计"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"上行"+"</td>"+
            										"<td>"+"1"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo1_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo1_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo1_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo1_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo1_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo1_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane1'><a>"+json.obj[0].NumOvlo8[0].numOvloLane1+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"2"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo2_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo2_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo2_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo2_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo2_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo2_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane2'><a>"+json.obj[0].NumOvlo8[0].numOvloLane2+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo3_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo3_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo3_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo3_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_Ovlo3_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo3_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo3_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo3_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane3'><a>"+json.obj[0].NumOvlo8[0].numOvloLane3+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
        										"<td>"+"4"+"</td>"+
    	    										"<td>"+"车道1"+"</td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo4_1+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo4_2+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo4_3+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo4_4+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo4_5+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo4_6+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane4'><a>"+json.obj[0].NumOvlo8[0].numOvloLane4+"</a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_1'><a>"+json.obj[0].NumOvlo8[0].numOvloHax1_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_2'><a>"+json.obj[0].NumOvlo8[0].numOvloHax1_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_3'><a>"+json.obj[0].NumOvlo8[0].numOvloHax1_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_4'><a>"+json.obj[0].NumOvlo8[0].numOvloHax1_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_5'><a>"+json.obj[0].NumOvlo8[0].numOvloHax1_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_6'><a>"+json.obj[0].NumOvlo8[0].numOvloHax1_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_half1'><a>"+json.obj[0].NumOvlo8[0].numOvloHalf1+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"下行"+"</td>"+
            										"<td>"+"5"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo5_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo5_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo5_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo5_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo5_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo5_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane5'><a>"+json.obj[0].NumOvlo8[0].numOvloLane5+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo6_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo6_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo6_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo6_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo6_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo6_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane6'><a>"+json.obj[0].NumOvlo8[0].numOvloLane6+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"7"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo7_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo7_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo7_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo7_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo7_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo7_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo7_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane7'><a>"+json.obj[0].NumOvlo8[0].numOvloLane7+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
        										"<td>"+"8"+"</td>"+
        										"<td>"+"停车道"+"</td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_1'><a>"+json.obj[0].NumOvlo8[0].numOvlo8_1+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_2'><a>"+json.obj[0].NumOvlo8[0].numOvlo8_2+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_3'><a>"+json.obj[0].NumOvlo8[0].numOvlo8_3+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_4'><a>"+json.obj[0].NumOvlo8[0].numOvlo8_4+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_5'><a>"+json.obj[0].NumOvlo8[0].numOvlo8_5+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_6'><a>"+json.obj[0].NumOvlo8[0].numOvlo8_6+"</a></td>"+
    	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane8'><a>"+json.obj[0].NumOvlo8[0].numOvloLane8+"</a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_1'><a>"+json.obj[0].NumOvlo8[0].numOvloHax2_1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_2'><a>"+json.obj[0].NumOvlo8[0].numOvloHax2_2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_3'><a>"+json.obj[0].NumOvlo8[0].numOvloHax2_3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_4'><a>"+json.obj[0].NumOvlo8[0].numOvloHax2_4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_5'><a>"+json.obj[0].NumOvlo8[0].numOvloHax2_5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_6'><a>"+json.obj[0].NumOvlo8[0].numOvloHax2_6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_half2'><a>"+json.obj[0].NumOvlo8[0].numOvloHalf2+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+""+"</td>"+
            										"<td colspan='2'>"+"合计"+"</td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle1'><a>"+json.obj[0].NumOvlo8[0].numOvloAxle1+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle2'><a>"+json.obj[0].NumOvlo8[0].numOvloAxle2+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle3'><a>"+json.obj[0].NumOvlo8[0].numOvloAxle3+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle4'><a>"+json.obj[0].NumOvlo8[0].numOvloAxle4+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle5'><a>"+json.obj[0].NumOvlo8[0].numOvloAxle5+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle6'><a>"+json.obj[0].NumOvlo8[0].numOvloAxle6+"</a></td>"+
            										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_all'><a>"+json.obj[0].NumOvlo8[0].numOvloAll+"</a></td>"+
            									"</tr>"+
            								"</tfoot>")
            								
            								RatioOvlo.append("<thead>"+
            								"</thead>"+
            								"<tfoot>"+
            									"<tr align='center'>"+
            										"<td>"+"方向"+"</td>"+
            										"<td>"+"车道编号"+"</td>"+
            										"<td>"+"车道名"+"</td>"+
            										"<td>"+"2轴车"+"</td>"+
            										"<td>"+"3轴车"+"</td>"+
            										"<td>"+"4轴车"+"</td>"+
            										"<td>"+"5轴车"+"</td>"+
            										"<td>"+"6轴车"+"</td>"+
            										"<td>"+"7轴车及以上"+"</td>"+
            										"<td>"+"合计"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"上行"+"</td>"+
            										"<td>"+"1"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo1_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo1_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo1_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo1_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo1_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo1_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane1)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"2"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo2_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo2_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo2_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo2_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo2_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo2_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane2)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo3_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo3_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo3_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo3_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo3_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo3_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo3_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane3)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
        											"<td>"+"4"+"</td>"+
        											"<td>"+"车道1"+"</td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo4_1)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo4_2)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo4_3)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo4_4)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo4_5)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo4_6)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane4)+"</a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax1_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax1_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax1_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax1_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax1_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax1_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_half1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHalf1)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"下行"+"</td>"+
            										"<td>"+"5"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo5_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo5_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_Ovlo5_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo5_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo5_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo5_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo5_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane5)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo6_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo6_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo5_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo6_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo6_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_Ovlo6_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo6_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane6)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"7"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo7_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo7_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo7_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo7_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo7_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo7_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo7_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane7'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane7)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
    	    										"<td>"+"8"+"</td>"+
    	    										"<td>"+"停车道"+"</td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo8_1)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo8_2)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo8_3)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo8_4)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo8_5)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvlo8_6)+"</a></td>"+
    	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane8'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloLane8)+"</a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax2_1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax2_2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax2_3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax2_4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax2_5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHax2_6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_half2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloHalf2)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+""+"</td>"+
            										"<td colspan='2'>"+"合计"+"</td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle1'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloAxle1)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle2'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloAxle2)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle3'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloAxle3)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle4'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloAxle4)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle5'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloAxle5)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle6'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloAxle6)+"</a></td>"+
            										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_all'><a>"+convertPercent(json.obj[0].RatioOvlo8[0].ratioOvloAll)+"</a></td>"+
            									"</tr>"+
            								"</tfoot>");
            								
            								ProbOvlo.append("<thead>"+
            								"</thead>"+
            								"<tfoot>"+
            									"<tr align='center'>"+
            										"<td>"+"方向"+"</td>"+
            										"<td>"+"车道编号"+"</td>"+
            										"<td>"+"车道名"+"</td>"+
            										"<td>"+"2轴车"+"</td>"+
            										"<td>"+"3轴车"+"</td>"+
            										"<td>"+"4轴车"+"</td>"+
            										"<td>"+"5轴车"+"</td>"+
            										"<td>"+"6轴车"+"</td>"+
            										"<td>"+"7轴车及以上"+"</td>"+
            										"<td>"+"合计"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"上行"+"</td>"+
            										"<td>"+"1"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo1_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo1_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo1_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo1_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo1_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo1_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane1)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"2"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo2_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo2_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo2_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo2_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo2_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo2_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane2)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo3_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo3_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo3_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo3_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo3_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo3_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo3_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane3)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
    	    										"<td>"+"4"+"</td>"+
    	    										"<td>"+"车道3"+"</td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo4_1)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo4_2)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo4_3)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo4_4)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo4_5)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo4_6)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane4)+"</a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax1_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax1_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax1_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax1_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax1_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax1_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_half1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHalf1)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='5'>"+"下行"+"</td>"+
            										"<td>"+"5"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo5_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo5_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo5_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo5_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo5_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo5_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane5)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo6_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo6_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo6_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo6_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo6_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo6_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane6)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"7"+"</td>"+
            										"<td>"+"车道3"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo7_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo7_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo7_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo7_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo7_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo7_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo7_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane7'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane7)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
    	    										"<td>"+"8"+"</td>"+
    	    										"<td>"+"停车道"+"</td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo8_1)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo8_2)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo8_3)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo8_4)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo8_5)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvlo8_6)+"</a></td>"+
    	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane8'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloLane8)+"</a></td>"+
        										"</tr>"+
            									"<tr align='center'>"+
            										"<td colspan='2'>"+"小计"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax2_1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax2_2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax2_3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax2_4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax2_5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHax2_6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_half2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloHalf2)+"</a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+""+"</td>"+
            										"<td colspan='2'>"+"合计"+"</td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle1'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloAxle1)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle2'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloAxle2)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle3'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloAxle3)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle4'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloAxle4)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle5'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloAxle5)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle6'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloAxle6)+"</a></td>"+
            										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_all'><a>"+convertPercent(json.obj[0].ProbOvlo8[0].probOvloAll)+"</a></td>"+
            									"</tr>"+
            								"</tfoot>");
            								
            								LoadRadio.append("<thead>"+
            										"</thead>"+
            										"<tfoot>"+
            											"<tr align='center'>"+
            												"<td rowspan='2'>"+"方向"+"</td>"+
            												"<td rowspan='2'>"+"车道编号"+"</td>"+
            												"<td rowspan='2'>"+"车道名"+"</td>"+
            												"<td colspan='3'>"+"实际荷载效应/设计荷载效应"+"</td>"+
            												"<td colspan='3'>"+"实际荷载效应/规范荷载效应"+"</td>"+
            												"<td rowspan='2'>"+"荷载状态"+"</td>"+
            												"<td rowspan='2'>"+"车道状态"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
    	    												"<td>"+"标准值"+"</td>"+
    	    												"<td>"+"最大值"+"</td>"+
    	    												"<td>"+"0.95分位值"+"</td>"+
    	    												"<td>"+"标准值"+"</td>"+
    	    												"<td>"+"最大值"+"</td>"+
    	    												"<td>"+"0.95分位值"+"</td>"+
        												"</tr>"+
            											"<tr align='center'>"+
            												"<td rowspan='4'>"+"上行"+"</td>"+
            												"<td>"+"1"+"</td>"+
            												"<td>"+"停车道"+"</td>"+
            												"<td data-type='brg_weight_load_radio,load_radio1' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio1+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio2' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio2+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio3' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio3+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio4' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio4+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio5' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio5+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio6' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio6+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio7' rowspan='4'>"+json.obj[0].LoadRadio[0].load_radio7+"</td>"+
            												"<td data-type='brg_weight_load_radio,load_radio8' rowspan='4'>"+json.obj[0].LoadRadio[0].load_radio8+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
        													"<td>"+"2"+"</td>"+
        													"<td>"+"车道3"+"</td>"+
        												"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"3"+"</td>"+
            												"<td>"+"车道2"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"4"+"</td>"+
            												"<td>"+"车道1"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td rowspan='4'>"+"下行"+"</td>"+
            												"<td>"+"5"+"</td>"+
            												"<td>"+"车道1"+"</td>"+
            												"<td data-type='brg_weight_load_radio,load_radio9' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio9+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio10' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio10+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio11' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio11+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio12' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio12+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio13' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio13+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio14' rowspan='4'><a>"+json.obj[0].LoadRadio[0].load_radio14+"</a></td>"+
            												"<td data-type='brg_weight_load_radio,load_radio15' rowspan='4'>"+json.obj[0].LoadRadio[0].load_radio15+"</td>"+
            												"<td data-type='brg_weight_load_radio,load_radio16' rowspan='4'>"+json.obj[0].LoadRadio[0].load_radio16+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"6"+"</td>"+
            												"<td>"+"车道2"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
            												"<td>"+"7"+"</td>"+
            												"<td>"+"车道3"+"</td>"+
            											"</tr>"+
            											"<tr align='center'>"+
        													"<td>"+"8"+"</td>"+
        													"<td>"+"停车道"+"</td>"+
        												"</tr>"+
            										"</tfoot>");
        				}
        			}else{
        				if(json.obj[0].NumVehi[0]==null||json.obj[0].NumVehi[0]==undefined){
            					errMessage("没有数据");
            					NumVehi.append("<thead>"+"</thead>"+"<tfoot>"+
            							"<tr align='center'>"+
            								"<td>"+"方向"+"</td>"+
            								"<td>"+"车道编号"+"</td>"+
            								"<td>"+"车道名"+"</td>"+
            								"<td>"+"2轴车"+"</td>"+
            								"<td>"+"3轴车"+"</td>"+
            								"<td>"+"4轴车"+"</td>"+
            								"<td>"+"5轴车"+"</td>"+
            								"<td>"+"6轴车"+"</td>"+
            								"<td>"+"7轴车及以上"+"</td>"+
            								"<td>"+"合计"+"</td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td rowspan='4'>"+"上行"+"</td>"+
            								"<td>"+"1"+"</td>"+
            								"<td>"+"停车道"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi1_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi1_2'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi1_3'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi1_4'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi1_5'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi1_6'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane1'><a></a></td>"+
            							"</tr>" + 
            							"<tr align='center'>"+
        									"<td>"+"2"+"</td>"+
        									"<td>"+"车道2"+"</td>"+
        									"<td data-type='brg_weight_num_vehi_8,num_vehi2_1'><a></a></td>"+
        									"<td data-type='brg_weight_num_vehi_8,num_vehi2_2'><a></a></td>"+
        									"<td data-type='brg_weight_num_vehi_8,num_vehi2_3'><a></a></td>"+
        									"<td data-type='brg_weight_num_vehi_8,num_vehi2_4'><a></a></td>"+
        									"<td data-type='brg_weight_num_vehi_8,num_vehi2_5'><a></a></td>"+
        									"<td data-type='brg_weight_num_vehi_8,num_vehi2_6'><a></a></td>"+
        									"<td data-type='brg_weight_num_vehi_8,num_vehi_lane2'><a></a></td>"+
        								"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"3"+"</td>"+
            								"<td>"+"车道1"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi3_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi3_2'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi3_3'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi3_4'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi3_5'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi3_6'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane3'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td colspan='2'>"+"小计"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_2'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_3'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_4'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_5'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax1_6'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_half1'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td rowspan='4'>"+"下行"+"</td>"+
            								"<td>"+"4"+"</td>"+
            								"<td>"+"车道1"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi5_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi5_2'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi5_3'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi5_4'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi5_5'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi5_6'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane5'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"5"+"</td>"+
            								"<td>"+"车道2"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi6_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane6'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+"6"+"</td>"+
            								"<td>"+"停车道"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi8_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi8_2'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi8_3'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi8_4'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi8_5'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi8_6'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_lane8'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td colspan='2'>"+"小计"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_2'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_3'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_4'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_5'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_hax2_6'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_half2'><a></a></td>"+
            							"</tr>"+
            							"<tr align='center'>"+
            								"<td>"+""+"</td>"+
            								"<td colspan='2'>"+"合计"+"</td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle1'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle2'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle3'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle4'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle5'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_axle6'><a></a></td>"+
            								"<td data-type='brg_weight_num_vehi_8,num_vehi_all'><a></a></td>"+
            							"</tr>"+
            						"</tfoot>");
                				
                					MaxGw.append("<thead>"+
                						"</thead>"+
                						"<tfoot>"+
                							"<tr align='center'>"+
                								"<td>"+"方向"+"</td>"+
                								"<td>"+"车道编号"+"</td>"+
                								"<td>"+"车道名"+"</td>"+
                								"<td>"+"2轴车"+"</td>"+
                								"<td>"+"3轴车"+"</td>"+
                								"<td>"+"4轴车"+"</td>"+
                								"<td>"+"5轴车"+"</td>"+
                								"<td>"+"6轴车"+"</td>"+
                								"<td>"+"7轴车及以上"+"</td>"+
                								"<td>"+"合计"+"</td>"+
                							"</tr>"+
                							"<tr align='center'>"+
                								"<td rowspan='4'>"+"上行"+"</td>"+
                								"<td>"+"1"+"</td>"+
                								"<td>"+"停车道"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw1_1'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw1_2'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw1_3'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw1_4'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw1_5'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw1_6'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_lane1'><a></a></td>"+
                							"</tr>"+
                							"<tr align='center'>"+
                								"<td>"+"2"+"</td>"+
                								"<td>"+"车道2"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw2_1'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw2_2'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw2_3'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw2_4'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw2_5'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw2_6'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_lane2'><a></a></td>"+
                							"</tr>"+
                							"<tr align='center'>"+
                								"<td>"+"3"+"</td>"+
                								"<td>"+"车道1"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw3_1'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw3_2'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw3_3'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw3_4'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw3_5'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw3_6'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_lane3'><a></a></td>"+
                							"</tr>"+
                							"<tr align='center'>"+
                								"<td colspan='2'>"+"小计"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_1'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_2'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_3'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_4'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_5'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax1_6'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_half1'><a></a></td>"+
                							"</tr>"+
                							"<tr align='center'>"+
                								"<td rowspan='4'>"+"下行"+"</td>"+
                								"<td>"+"4"+"</td>"+
                								"<td>"+"车道1"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw5_1'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw5_2'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw5_3'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw5_4'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw5_5'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw5_6'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_lane5'><a></a></td>"+
                							"</tr>"+
                							"<tr align='center'>"+
                								"<td>"+"5"+"</td>"+
                								"<td>"+"车道2"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw6_1'></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw6_2'></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw6_3'></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw6_4'></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw6_5'></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw6_6'></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_lane6'></a></td>"+
                							"</tr>"+
                							"<tr align='center'>"+
            								"<td>"+"6"+"</td>"+
        	    								"<td>"+"停车道"+"</td>"+
        	    								"<td data-type='brg_weight_max_gw_8,max_gw8_1'><a></a></td>"+
        	    								"<td data-type='brg_weight_max_gw_8,max_gw8_2'><a></a></td>"+
        	    								"<td data-type='brg_weight_max_gw_8,max_gw8_3'><a></a></td>"+
        	    								"<td data-type='brg_weight_max_gw_8,max_gw8_4'><a></a></td>"+
        	    								"<td data-type='brg_weight_max_gw_8,max_gw8_5'><a></a></td>"+
        	    								"<td data-type='brg_weight_max_gw_8,max_gw8_6'><a></a></td>"+
        	    								"<td data-type='brg_weight_max_gw_8,max_gw_lane8'><a></a></td>"+
            								"</tr>"+
                							"<tr align='center'>"+
                								"<td colspan='2'>"+"小计"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_1'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_2'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_3'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_4'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_5'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_hax2_6'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_half2'><a></a></td>"+
                							"</tr>"+
                							"<tr align='center'>"+
                								"<td>"+""+"</td>"+
                								"<td colspan='2'>"+"合计"+"</td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_axle1'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_axle2'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_axle3'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_axle4'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_axle5'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_axle6'><a></a></td>"+
                								"<td data-type='brg_weight_max_gw_8,max_gw_all'><a></a></td>"+
                							"</tr>"+
                						"</tfoot>")
                						
                						NumOvlo.append("<thead>"+
                								"</thead>"+
                								"<tfoot>"+
                									"<tr align='center'>"+
                										"<td>"+"方向"+"</td>"+
                										"<td>"+"车道编号"+"</td>"+
                										"<td>"+"车道名"+"</td>"+
                										"<td>"+"2轴车"+"</td>"+
                										"<td>"+"3轴车"+"</td>"+
                										"<td>"+"4轴车"+"</td>"+
                										"<td>"+"5轴车"+"</td>"+
                										"<td>"+"6轴车"+"</td>"+
                										"<td>"+"7轴车及以上"+"</td>"+
                										"<td>"+"合计"+"</td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td rowspan='4'>"+"上行"+"</td>"+
                										"<td>"+"1"+"</td>"+
                										"<td>"+"停车道"+"</td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_1'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_2'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_3'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_4'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_5'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo1_6'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane1'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+"2"+"</td>"+
                										"<td>"+"车道2"+"</td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_1'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_2'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_3'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_4'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_5'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo2_6'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane2'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
        	    										"<td>"+"车道1"+"</td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_1'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_2'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_3'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_4'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_5'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo4_6'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane4'><a></a></td>"+
            										"</tr>"+
                									"<tr align='center'>"+
                										"<td colspan='2'>"+"小计"+"</td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_1'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_2'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_3'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_4'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_5'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax1_6'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_half1'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td rowspan='4'>"+"下行"+"</td>"+
                										"<td>"+"4"+"</td>"+
                										"<td>"+"车道1"+"</td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_1'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_2'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_3'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_4'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_5'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo5_6'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane5'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+"5"+"</td>"+
                										"<td>"+"车道2"+"</td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_1'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_2'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_3'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_4'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_5'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo6_6'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane6'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_1'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_2'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_3'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_4'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_5'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo8_6'><a></a></td>"+
        	    										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_lane8'><a></a></td>"+
            										"</tr>"+
                									"<tr align='center'>"+
                										"<td colspan='2'>"+"小计"+"</td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_1'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_2'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_3'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_4'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_5'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_hax2_6'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_half2'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+""+"</td>"+
                										"<td colspan='2'>"+"合计"+"</td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle1'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle2'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle3'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle4'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle5'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_axle6'><a></a></td>"+
                										"<td data-type='brg_weight_num_ovlo_8,num_ovlo_all'><a></a></td>"+
                									"</tr>"+
                								"</tfoot>")
                								
                								RatioOvlo.append("<thead>"+
                								"</thead>"+
                								"<tfoot>"+
                									"<tr align='center'>"+
                										"<td>"+"方向"+"</td>"+
                										"<td>"+"车道编号"+"</td>"+
                										"<td>"+"车道名"+"</td>"+
                										"<td>"+"2轴车"+"</td>"+
                										"<td>"+"3轴车"+"</td>"+
                										"<td>"+"4轴车"+"</td>"+
                										"<td>"+"5轴车"+"</td>"+
                										"<td>"+"6轴车"+"</td>"+
                										"<td>"+"7轴车及以上"+"</td>"+
                										"<td>"+"合计"+"</td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td rowspan='4'>"+"上行"+"</td>"+
                										"<td>"+"1"+"</td>"+
                										"<td>"+"停车道"+"</td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_1'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_2'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_3'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_4'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_5'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo1_6'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane1'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+"2"+"</td>"+
                										"<td>"+"车道2"+"</td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_1'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_2'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_3'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_4'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_5'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo2_6'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane2'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
            											"<td>"+"3"+"</td>"+
            											"<td>"+"车道1"+"</td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_1'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_2'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_3'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_4'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_5'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo4_6'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane4'><a></a></td>"+
            										"</tr>"+
                									"<tr align='center'>"+
                										"<td colspan='2'>"+"小计"+"</td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_1'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_2'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_3'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_4'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_5'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax1_6'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_half1'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td rowspan='4'>"+"下行"+"</td>"+
                										"<td>"+"4"+"</td>"+
                										"<td>"+"车道1"+"</td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_1'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_2'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_Ovlo5_3'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_4'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_5'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo5_6'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane5'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+"5"+"</td>"+
                										"<td>"+"车道2"+"</td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_1'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_2'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_3'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_4'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo6_5'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_Ovlo6_6'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane6'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
        	    										"<td>"+"6"+"</td>"+
        	    										"<td>"+"停车道"+"</td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_1'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_2'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_3'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_4'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_5'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo8_6'><a></a></td>"+
        	    										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_lane8'><a></a></td>"+
            										"</tr>"+
                									"<tr align='center'>"+
                										"<td colspan='2'>"+"小计"+"</td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_1'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_2'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_3'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_4'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_5'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_hax2_6'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_half2'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+""+"</td>"+
                										"<td colspan='2'>"+"合计"+"</td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle1'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle2'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle3'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle4'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle5'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_axle6'><a></a></td>"+
                										"<td data-type='brg_weight_ratio_ovlo_8,ratio_ovlo_all'><a></a></td>"+
                									"</tr>"+
                								"</tfoot>")
                								
                								ProbOvlo.append("<thead>"+
                								"</thead>"+
                								"<tfoot>"+
                									"<tr align='center'>"+
                										"<td>"+"方向"+"</td>"+
                										"<td>"+"车道编号"+"</td>"+
                										"<td>"+"车道名"+"</td>"+
                										"<td>"+"2轴车"+"</td>"+
                										"<td>"+"3轴车"+"</td>"+
                										"<td>"+"4轴车"+"</td>"+
                										"<td>"+"5轴车"+"</td>"+
                										"<td>"+"6轴车"+"</td>"+
                										"<td>"+"7轴车及以上"+"</td>"+
                										"<td>"+"合计"+"</td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td rowspan='4'>"+"上行"+"</td>"+
                										"<td>"+"1"+"</td>"+
                										"<td>"+"停车道"+"</td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_1'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_2'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_3'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_4'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_5'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo1_6'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane1'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+"2"+"</td>"+
                										"<td>"+"车道2"+"</td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_1'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_2'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_3'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_4'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_5'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo2_6'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane2'><a></a></td>"+
                									"</tr>"+
                									
                									"<tr align='center'>"+
        	    										"<td>"+"3"+"</td>"+
        	    										"<td>"+"车道1"+"</td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_1'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_2'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_3'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_4'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_5'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo4_6'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane4'><a></a></td>"+
            										"</tr>"+
                									"<tr align='center'>"+
                										"<td colspan='2'>"+"小计"+"</td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_1'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_2'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_3'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_4'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_5'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax1_6'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_half1'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td rowspan='4'>"+"下行"+"</td>"+
                										"<td>"+"4"+"</td>"+
                										"<td>"+"车道1"+"</td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_1'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_2'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_3'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_4'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_5'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo5_6'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane5'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+"5"+"</td>"+
                										"<td>"+"车道2"+"</td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_1'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_2'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_3'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_4'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_5'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo6_6'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane6'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
        	    										"<td>"+"6"+"</td>"+
        	    										"<td>"+"停车道"+"</td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_1'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_2'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_3'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_4'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_5'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo8_6'><a></a></td>"+
        	    										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_lane8'><a></a></td>"+
            										"</tr>"+
                									"<tr align='center'>"+
                										"<td colspan='2'>"+"小计"+"</td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_1'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_2'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_3'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_4'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_5'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_hax2_6'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_half2'><a></a></td>"+
                									"</tr>"+
                									"<tr align='center'>"+
                										"<td>"+""+"</td>"+
                										"<td colspan='2'>"+"合计"+"</td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle1'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle2'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle3'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle4'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle5'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_axle6'><a></a></td>"+
                										"<td data-type='brg_weight_prob_ovlo_8,prob_ovlo_all'><a></a></td>"+
                									"</tr>"+
                								"</tfoot>");
                								
                					LoadRadio.append("<thead>"+
            								"</thead>"+
            								"<tfoot>"+
            									"<tr align='center'>"+
            										"<td rowspan='2'>"+"方向"+"</td>"+
            										"<td rowspan='2'>"+"车道编号"+"</td>"+
            										"<td rowspan='2'>"+"车道名"+"</td>"+
            										"<td colspan='3'>"+"实际荷载效应/设计荷载效应"+"</td>"+
            										"<td colspan='3'>"+"实际荷载效应/规范荷载效应"+"</td>"+
            										"<td rowspan='2'>"+"荷载状态"+"</td>"+
            										"<td rowspan='2'>"+"车道状态"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"标准值"+"</td>"+
            										"<td>"+"最大值"+"</td>"+
            										"<td>"+"0.95分位值"+"</td>"+
            										"<td>"+"标准值"+"</td>"+
            										"<td>"+"最大值"+"</td>"+
            										"<td>"+"0.95分位值"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='3'>"+"上行"+"</td>"+
            										"<td>"+"1"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            										"<td data-type='brg_weight_load_radio,load_radio1' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio2' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio3' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio4' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio5' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio6' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio7' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio8' rowspan='3'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"2"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"3"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td rowspan='3'>"+"下行"+"</td>"+
            										"<td>"+"4"+"</td>"+
            										"<td>"+"车道1"+"</td>"+
            										"<td data-type='brg_weight_load_radio,load_radio9' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio10' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio11' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio12' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio13' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio14' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio15' rowspan='3'><a></a></td>"+
            										"<td data-type='brg_weight_load_radio,load_radio16' rowspan='3'><a></a></td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"5"+"</td>"+
            										"<td>"+"车道2"+"</td>"+
            									"</tr>"+
            									"<tr align='center'>"+
            										"<td>"+"6"+"</td>"+
            										"<td>"+"停车道"+"</td>"+
            									"</tr>"+
            								"</tfoot>");
        				}else{
        					
        					$("#selectTime").append("<span>"+json.obj[0].NumVehi[0].brgStartime+"</span>");
        					
        					NumVehi.append("<thead>"+"</thead>"+"<tfoot>"+
        							"<tr align='center'>"+
        								"<td>"+"方向"+"</td>"+
        								"<td>"+"车道编号"+"</td>"+
        								"<td>"+"车道名"+"</td>"+
        								"<td>"+"2轴车"+"</td>"+
        								"<td>"+"3轴车"+"</td>"+
        								"<td>"+"4轴车"+"</td>"+
        								"<td>"+"5轴车"+"</td>"+
        								"<td>"+"6轴车"+"</td>"+
        								"<td>"+"7轴车及以上"+"</td>"+
        								"<td>"+"合计"+"</td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"上行"+"</td>"+
        								"<td>"+"1"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi1_1'><a>"+json.obj[0].NumVehi[0].numVehi1_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi1_2'><a>"+json.obj[0].NumVehi[0].numVehi1_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi1_3'><a>"+json.obj[0].NumVehi[0].numVehi1_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi1_4'><a>"+json.obj[0].NumVehi[0].numVehi1_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi1_5'><a>"+json.obj[0].NumVehi[0].numVehi1_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi1_6'><a>"+json.obj[0].NumVehi[0].numVehi1_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_lane1'><a>"+json.obj[0].NumVehi[0].numVehiLane1+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"2"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi2_1'><a>"+json.obj[0].NumVehi[0].numVehi2_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi2_2'><a>"+json.obj[0].NumVehi[0].numVehi2_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi2_3'><a>"+json.obj[0].NumVehi[0].numVehi2_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi2_4'><a>"+json.obj[0].NumVehi[0].numVehi2_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi2_5'><a>"+json.obj[0].NumVehi[0].numVehi2_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi2_6'><a>"+json.obj[0].NumVehi[0].numVehi2_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_lane2'><a>"+json.obj[0].NumVehi[0].numVehiLane2+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"3"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi3_1'><a>"+json.obj[0].NumVehi[0].numVehi3_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi3_2'><a>"+json.obj[0].NumVehi[0].numVehi3_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi3_3'><a>"+json.obj[0].NumVehi[0].numVehi3_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi3_4'><a>"+json.obj[0].NumVehi[0].numVehi3_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi3_5'><a>"+json.obj[0].NumVehi[0].numVehi3_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi3_6'><a>"+json.obj[0].NumVehi[0].numVehi3_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_lane3'><a>"+json.obj[0].NumVehi[0].numVehiLane3+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax1_1'><a>"+json.obj[0].NumVehi[0].numVehiHax1_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax1_2'><a>"+json.obj[0].NumVehi[0].numVehiHax1_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax1_3'><a>"+json.obj[0].NumVehi[0].numVehiHax1_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax1_4'><a>"+json.obj[0].NumVehi[0].numVehiHax1_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax1_5'><a>"+json.obj[0].NumVehi[0].numVehiHax1_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax1_6'><a>"+json.obj[0].NumVehi[0].numVehiHax1_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_half1'><a>"+json.obj[0].NumVehi[0].numVehiHalf1+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"下行"+"</td>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi4_1'><a>"+json.obj[0].NumVehi[0].numVehi4_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi4_2'><a>"+json.obj[0].NumVehi[0].numVehi4_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi4_3'><a>"+json.obj[0].NumVehi[0].numVehi4_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi4_4'><a>"+json.obj[0].NumVehi[0].numVehi4_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi4_5'><a>"+json.obj[0].NumVehi[0].numVehi4_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi4_6'><a>"+json.obj[0].NumVehi[0].numVehi4_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_lane4'><a>"+json.obj[0].NumVehi[0].numVehiLane4+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"5"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi5_1'><a>"+json.obj[0].NumVehi[0].numVehi5_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi5_2'><a>"+json.obj[0].NumVehi[0].numVehi5_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi5_3'><a>"+json.obj[0].NumVehi[0].numVehi5_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi5_4'><a>"+json.obj[0].NumVehi[0].numVehi5_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi5_5'><a>"+json.obj[0].NumVehi[0].numVehi5_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi5_6'><a>"+json.obj[0].NumVehi[0].numVehi5_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_lane5'><a>"+json.obj[0].NumVehi[0].numVehiLane5+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"6"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi6_1'><a>"+json.obj[0].NumVehi[0].numVehi6_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi6_2'><a>"+json.obj[0].NumVehi[0].numVehi6_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi6_3'><a>"+json.obj[0].NumVehi[0].numVehi6_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi6_4'><a>"+json.obj[0].NumVehi[0].numVehi6_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi6_5'><a>"+json.obj[0].NumVehi[0].numVehi6_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi6_6'><a>"+json.obj[0].NumVehi[0].numVehi6_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_lane6'><a>"+json.obj[0].NumVehi[0].numVehiLane6+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax2_1'><a>"+json.obj[0].NumVehi[0].numVehiHax2_1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax2_2'><a>"+json.obj[0].NumVehi[0].numVehiHax2_2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax2_3'><a>"+json.obj[0].NumVehi[0].numVehiHax2_3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax2_4'><a>"+json.obj[0].NumVehi[0].numVehiHax2_4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax2_5'><a>"+json.obj[0].NumVehi[0].numVehiHax2_5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_hax2_6'><a>"+json.obj[0].NumVehi[0].numVehiHax2_6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_half2'><a>"+json.obj[0].NumVehi[0].numVehiHalf2+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+""+"</td>"+
        								"<td colspan='2'>"+"合计"+"</td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_axle1'><a>"+json.obj[0].NumVehi[0].numVehiAxle1+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_axle2'><a>"+json.obj[0].NumVehi[0].numVehiAxle2+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_axle3'><a>"+json.obj[0].NumVehi[0].numVehiAxle3+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_axle4'><a>"+json.obj[0].NumVehi[0].numVehiAxle4+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_axle5'><a>"+json.obj[0].NumVehi[0].numVehiAxle5+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_axle6'><a>"+json.obj[0].NumVehi[0].numVehiAxle6+"</a></td>"+
        								"<td data-type='brg_weight_num_vehi,num_vehi_all'><a>"+json.obj[0].NumVehi[0].numVehiAll+"</a></td>"+
        							"</tr>"+
        						"</tfoot>");
        						
        						MaxGw.append("<thead>"+
        						"</thead>"+
        						"<tfoot>"+
        							"<tr align='center'>"+
        								"<td>"+"方向"+"</td>"+
        								"<td>"+"车道编号"+"</td>"+
        								"<td>"+"车道名"+"</td>"+
        								"<td>"+"2轴车"+"</td>"+
        								"<td>"+"3轴车"+"</td>"+
        								"<td>"+"4轴车"+"</td>"+
        								"<td>"+"5轴车"+"</td>"+
        								"<td>"+"6轴车"+"</td>"+
        								"<td>"+"7轴车及以上"+"</td>"+
        								"<td>"+"合计"+"</td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"上行"+"</td>"+
        								"<td>"+"1"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_1+" ' data-type='brg_weight_max_gw,max_gw1_1'><a>"+json.obj[0].MaxGw[0].maxGw1_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_2+" ' data-type='brg_weight_max_gw,max_gw1_2'><a>"+json.obj[0].MaxGw[0].maxGw1_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_3+" ' data-type='brg_weight_max_gw,max_gw1_3'><a>"+json.obj[0].MaxGw[0].maxGw1_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_4+" ' data-type='brg_weight_max_gw,max_gw1_4'><a>"+json.obj[0].MaxGw[0].maxGw1_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_5+" ' data-type='brg_weight_max_gw,max_gw1_5'><a>"+json.obj[0].MaxGw[0].maxGw1_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_6+" ' data-type='brg_weight_max_gw,max_gw1_6'><a>"+json.obj[0].MaxGw[0].maxGw1_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane1+" ' data-type='brg_weight_max_gw,max_gw_lane1'><a>"+json.obj[0].MaxGw[0].maxGwLane1+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"2"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_1+" ' data-type='brg_weight_max_gw,max_gw2_1'><a>"+json.obj[0].MaxGw[0].maxGw2_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_2+" ' data-type='brg_weight_max_gw,max_gw2_2'><a>"+json.obj[0].MaxGw[0].maxGw2_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_3+" ' data-type='brg_weight_max_gw,max_gw2_3'><a>"+json.obj[0].MaxGw[0].maxGw2_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_4+" ' data-type='brg_weight_max_gw,max_gw2_4'><a>"+json.obj[0].MaxGw[0].maxGw2_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_5+" ' data-type='brg_weight_max_gw,max_gw2_5'><a>"+json.obj[0].MaxGw[0].maxGw2_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_6+" ' data-type='brg_weight_max_gw,max_gw2_6'><a>"+json.obj[0].MaxGw[0].maxGw2_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane2+" ' data-type='brg_weight_max_gw,max_gw_lane2'><a>"+json.obj[0].MaxGw[0].maxGwLane2+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"3"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_1+" ' data-type='brg_weight_max_gw,max_gw3_1'><a>"+json.obj[0].MaxGw[0].maxGw3_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_2+" ' data-type='brg_weight_max_gw,max_gw3_2'><a>"+json.obj[0].MaxGw[0].maxGw3_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_3+" ' data-type='brg_weight_max_gw,max_gw3_3'><a>"+json.obj[0].MaxGw[0].maxGw3_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_4+"'  data-type='brg_weight_max_gw,max_gw3_4'><a>"+json.obj[0].MaxGw[0].maxGw3_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_5+" ' data-type='brg_weight_max_gw,max_gw3_5'><a>"+json.obj[0].MaxGw[0].maxGw3_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_6+" ' data-type='brg_weight_max_gw,max_gw3_6'><a>"+json.obj[0].MaxGw[0].maxGw3_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane3+" ' data-type='brg_weight_max_gw,max_gw_lane3'><a>"+json.obj[0].MaxGw[0].maxGwLane3+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_1+"' data-type='brg_weight_max_gw,max_gw_hax1_1'><a>"+json.obj[0].MaxGw[0].maxGwHax1_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_2+"' data-type='brg_weight_max_gw,max_gw_hax1_2'><a>"+json.obj[0].MaxGw[0].maxGwHax1_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_3+"' data-type='brg_weight_max_gw,max_gw_hax1_3'><a>"+json.obj[0].MaxGw[0].maxGwHax1_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_4+"' data-type='brg_weight_max_gw,max_gw_hax1_4'><a>"+json.obj[0].MaxGw[0].maxGwHax1_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_5+"' data-type='brg_weight_max_gw,max_gw_hax1_5'><a>"+json.obj[0].MaxGw[0].maxGwHax1_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_6+"' data-type='brg_weight_max_gw,max_gw_hax1_6'><a>"+json.obj[0].MaxGw[0].maxGwHax1_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHalf1+"' data-type='brg_weight_max_gw,max_gw_half1'><a>"+json.obj[0].MaxGw[0].maxGwHalf1+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"下行"+"</td>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_1+"' data-type='brg_weight_max_gw,max_gw4_1'><a>"+json.obj[0].MaxGw[0].maxGw4_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_2+"' data-type='brg_weight_max_gw,max_gw4_2'><a>"+json.obj[0].MaxGw[0].maxGw4_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_3+"' data-type='brg_weight_max_gw,max_gw4_3'><a>"+json.obj[0].MaxGw[0].maxGw4_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_4+"' data-type='brg_weight_max_gw,max_gw4_4'><a>"+json.obj[0].MaxGw[0].maxGw4_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_5+"' data-type='brg_weight_max_gw,max_gw4_5'><a>"+json.obj[0].MaxGw[0].maxGw4_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_6+"' data-type='brg_weight_max_gw,max_gw4_6'><a>"+json.obj[0].MaxGw[0].maxGw4_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane4+"' data-type='brg_weight_max_gw,max_gw_lane4'><a>"+json.obj[0].MaxGw[0].maxGwLane4+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"5"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_1+"' data-type='brg_weight_max_gw,max_gw5_1'><a>"+json.obj[0].MaxGw[0].maxGw5_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_2+"' data-type='brg_weight_max_gw,max_gw5_2'><a>"+json.obj[0].MaxGw[0].maxGw5_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_3+"' data-type='brg_weight_max_gw,max_gw5_3'><a>"+json.obj[0].MaxGw[0].maxGw5_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_4+"' data-type='brg_weight_max_gw,max_gw5_4'><a>"+json.obj[0].MaxGw[0].maxGw5_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_5+"' data-type='brg_weight_max_gw,max_gw5_5'><a>"+json.obj[0].MaxGw[0].maxGw5_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_6+"' data-type='brg_weight_max_gw,max_gw5_6'><a>"+json.obj[0].MaxGw[0].maxGw5_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane5+"' data-type='brg_weight_max_gw,max_gw_lane5'><a>"+json.obj[0].MaxGw[0].maxGwLane5+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"6"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_1+"' data-type='brg_weight_max_gw,max_gw6_1'><a>"+json.obj[0].MaxGw[0].maxGw6_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_2+"' data-type='brg_weight_max_gw,max_gw6_2'><a>"+json.obj[0].MaxGw[0].maxGw6_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_3+"' data-type='brg_weight_max_gw,max_gw6_1'><a>"+json.obj[0].MaxGw[0].maxGw6_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_4+"' data-type='brg_weight_max_gw,max_gw6_1'><a>"+json.obj[0].MaxGw[0].maxGw6_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_5+"' data-type='brg_weight_max_gw,max_gw6_1'><a>"+json.obj[0].MaxGw[0].maxGw6_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_6+"' data-type='brg_weight_max_gw,max_gw6_1'><a>"+json.obj[0].MaxGw[0].maxGw6_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane6+"' data-type='brg_weight_max_gw,max_gw_lane6'><a>"+json.obj[0].MaxGw[0].maxGwLane6+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_1+"' data-type='brg_weight_max_gw,max_gw_hax2_1'><a>"+json.obj[0].MaxGw[0].maxGwHax2_1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_2+"' data-type='brg_weight_max_gw,max_gw_hax2_2'><a>"+json.obj[0].MaxGw[0].maxGwHax2_2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_3+"' data-type='brg_weight_max_gw,max_gw_hax2_3'><a>"+json.obj[0].MaxGw[0].maxGwHax2_3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_4+"' data-type='brg_weight_max_gw,max_gw_hax2_4'><a>"+json.obj[0].MaxGw[0].maxGwHax2_4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_5+"' data-type='brg_weight_max_gw,max_gw_hax2_5'><a>"+json.obj[0].MaxGw[0].maxGwHax2_5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_6+"' data-type='brg_weight_max_gw,max_gw_hax2_6'><a>"+json.obj[0].MaxGw[0].maxGwHax2_6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHalf2+"' data-type='brg_weight_max_gw,max_gw_half2'><a>"+json.obj[0].MaxGw[0].maxGwHalf2+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+""+"</td>"+
        								"<td colspan='2'>"+"合计"+"</td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle1+"' data-type='brg_weight_max_gw,max_gw_axle1'><a>"+json.obj[0].MaxGw[0].maxGwAxle1+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle2+"' data-type='brg_weight_max_gw,max_gw_axle2'><a>"+json.obj[0].MaxGw[0].maxGwAxle2+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle3+"' data-type='brg_weight_max_gw,max_gw_axle3'><a>"+json.obj[0].MaxGw[0].maxGwAxle3+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle4+"' data-type='brg_weight_max_gw,max_gw_axle4'><a>"+json.obj[0].MaxGw[0].maxGwAxle4+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle5+"' data-type='brg_weight_max_gw,max_gw_axle5'><a>"+json.obj[0].MaxGw[0].maxGwAxle5+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle6+"' data-type='brg_weight_max_gw,max_gw_axle6'><a>"+json.obj[0].MaxGw[0].maxGwAxle6+"</a></td>"+
        								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAll+"' data-type='brg_weight_max_gw,max_gw_all'><a>"+json.obj[0].MaxGw[0].maxGwAll+"</a></td>"+
        							"</tr>"+
        						"</tfoot>")
        						
        						NumOvlo.append("<thead>"+
        						"</thead>"+
        						"<tfoot>"+
        							"<tr align='center'>"+
        								"<td>"+"方向"+"</td>"+
        								"<td>"+"车道编号"+"</td>"+
        								"<td>"+"车道名"+"</td>"+
        								"<td>"+"2轴车"+"</td>"+
        								"<td>"+"3轴车"+"</td>"+
        								"<td>"+"4轴车"+"</td>"+
        								"<td>"+"5轴车"+"</td>"+
        								"<td>"+"6轴车"+"</td>"+
        								"<td>"+"7轴车及以上"+"</td>"+
        								"<td>"+"合计"+"</td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"上行"+"</td>"+
        								"<td>"+"1"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo1_1'><a>"+json.obj[0].NumOvlo[0].numOvlo1_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo1_2'><a>"+json.obj[0].NumOvlo[0].numOvlo1_2+" </a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo1_3'><a>"+json.obj[0].NumOvlo[0].numOvlo1_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo1_4'><a>"+json.obj[0].NumOvlo[0].numOvlo1_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo1_5'><a>"+json.obj[0].NumOvlo[0].numOvlo1_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo1_6'><a>"+json.obj[0].NumOvlo[0].numOvlo1_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_lane1'><a>"+json.obj[0].NumOvlo[0].numOvloLane1+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"2"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo2_1'><a>"+json.obj[0].NumOvlo[0].numOvlo2_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo2_2'><a>"+json.obj[0].NumOvlo[0].numOvlo2_2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo2_3'><a>"+json.obj[0].NumOvlo[0].numOvlo2_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo2_4'><a>"+json.obj[0].NumOvlo[0].numOvlo2_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo2_5'><a>"+json.obj[0].NumOvlo[0].numOvlo2_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo2_6'><a>"+json.obj[0].NumOvlo[0].numOvlo2_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_lane2'><a>"+json.obj[0].NumOvlo[0].numOvloLane2+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"3"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo3_1'><a>"+json.obj[0].NumOvlo[0].numOvlo3_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo3_2'><a>"+json.obj[0].NumOvlo[0].numOvlo3_2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo3_3'><a>"+json.obj[0].NumOvlo[0].numOvlo3_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo3_4'><a>"+json.obj[0].NumOvlo[0].numOvlo3_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo3_5'><a>"+json.obj[0].NumOvlo[0].numOvlo3_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo3_6'><a>"+json.obj[0].NumOvlo[0].numOvlo3_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_lane3'><a>"+json.obj[0].NumOvlo[0].numOvloLane3+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax1_1'><a>"+json.obj[0].NumOvlo[0].numOvloHax1_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax1_2'><a>"+json.obj[0].NumOvlo[0].numOvloHax1_2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax1_3'><a>"+json.obj[0].NumOvlo[0].numOvloHax1_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax1_4'><a>"+json.obj[0].NumOvlo[0].numOvloHax1_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax1_5'><a>"+json.obj[0].NumOvlo[0].numOvloHax1_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax1_6'><a>"+json.obj[0].NumOvlo[0].numOvloHax1_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_half1'><a>"+json.obj[0].NumOvlo[0].numOvloHalf1+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"下行"+"</td>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo4_1'><a>"+json.obj[0].NumOvlo[0].numOvlo4_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo4_2'><a>"+json.obj[0].NumOvlo[0].numOvlo4_2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo4_3'><a>"+json.obj[0].NumOvlo[0].numOvlo4_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo4_4'><a>"+json.obj[0].NumOvlo[0].numOvlo4_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo4_5'><a>"+json.obj[0].NumOvlo[0].numOvlo4_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo4_6'><a>"+json.obj[0].NumOvlo[0].numOvlo4_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_lane4'><a>"+json.obj[0].NumOvlo[0].numOvloLane4+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"5"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo5_1'><a>"+json.obj[0].NumOvlo[0].numOvlo5_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo5_2'><a>"+json.obj[0].NumOvlo[0].numOvlo5_2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo5_3'><a>"+json.obj[0].NumOvlo[0].numOvlo5_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo5_4'><a>"+json.obj[0].NumOvlo[0].numOvlo5_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo5_5'><a>"+json.obj[0].NumOvlo[0].numOvlo5_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo5_6'><a>"+json.obj[0].NumOvlo[0].numOvlo5_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_lane5'><a>"+json.obj[0].NumOvlo[0].numOvloLane5+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"6"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo6_1'><a>"+json.obj[0].NumOvlo[0].numOvlo6_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo6_2'><a>"+json.obj[0].NumOvlo[0].numOvlo6_2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo6_3'><a>"+json.obj[0].NumOvlo[0].numOvlo6_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo6_4'><a>"+json.obj[0].NumOvlo[0].numOvlo6_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo6_5'><a>"+json.obj[0].NumOvlo[0].numOvlo6_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo6_6'><a>"+json.obj[0].NumOvlo[0].numOvlo6_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_lane6'><a>"+json.obj[0].NumOvlo[0].numOvloLane6+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax2_1'><a>"+json.obj[0].NumOvlo[0].numOvloHax2_1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax2_2'><a>"+json.obj[0].NumOvlo[0].numOvloHax2_2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax2_3'><a>"+json.obj[0].NumOvlo[0].numOvloHax2_3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax2_4'><a>"+json.obj[0].NumOvlo[0].numOvloHax2_4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax2_5'><a>"+json.obj[0].NumOvlo[0].numOvloHax2_5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_hax2_6'><a>"+json.obj[0].NumOvlo[0].numOvloHax2_6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_half2'><a>"+json.obj[0].NumOvlo[0].numOvloHalf2+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+""+"</td>"+
        								"<td colspan='2'>"+"合计"+"</td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_axle1'><a>"+json.obj[0].NumOvlo[0].numOvloAxle1+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_axle2'><a>"+json.obj[0].NumOvlo[0].numOvloAxle2+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_axle3'><a>"+json.obj[0].NumOvlo[0].numOvloAxle3+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_axle4'><a>"+json.obj[0].NumOvlo[0].numOvloAxle4+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_axle5'><a>"+json.obj[0].NumOvlo[0].numOvloAxle5+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_axle6'><a>"+json.obj[0].NumOvlo[0].numOvloAxle6+"</a></td>"+
        								"<td data-type='brg_weight_num_ovlo,num_ovlo_all'><a>"+json.obj[0].NumOvlo[0].numOvloAll+"</a></td>"+
        							"</tr>"+
        						"</tfoot>")
        						
        						RatioOvlo.append("<thead>"+
        						"</thead>"+
        						"<tfoot>"+
        							"<tr align='center'>"+
        								"<td>"+"方向"+"</td>"+
        								"<td>"+"车道编号"+"</td>"+
        								"<td>"+"车道名"+"</td>"+
        								"<td>"+"2轴车"+"</td>"+
        								"<td>"+"3轴车"+"</td>"+
        								"<td>"+"4轴车"+"</td>"+
        								"<td>"+"5轴车"+"</td>"+
        								"<td>"+"6轴车"+"</td>"+
        								"<td>"+"7轴车及以上"+"</td>"+
        								"<td>"+"合计"+"</td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"上行"+"</td>"+
        								"<td>"+"1"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo1_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo1_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo1_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo1_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo1_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo1_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo1_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo1_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo1_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo1_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo1_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo1_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_lane1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloLane1)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"2"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo2_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo2_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo2_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo2_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo2_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo2_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo2_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo2_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo2_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo2_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo2_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo2_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_lane2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloLane2)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"3"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo3_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo3_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo3_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo3_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo3_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo3_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo3_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo3_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo3_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo3_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo3_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo3_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_lane3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloLane3)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax1_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax1_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax1_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax1_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax1_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax1_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax1_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax1_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax1_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax1_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax1_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax1_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_half1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHalf1)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"下行"+"</td>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo4_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo4_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo4_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo4_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo4_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo4_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo4_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo4_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo4_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo4_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo4_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo4_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_lane4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloLane4)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"5"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo5_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo5_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo5_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo5_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo5_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo5_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo5_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo5_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo5_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo5_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo5_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo5_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_lane5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloLane5)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"6"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo6_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo6_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo6_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo6_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo6_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo6_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo6_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo6_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo6_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo6_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo6_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvlo6_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_lane6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloLane6)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax2_1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax2_1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax2_2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax2_2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax2_3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax2_3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax2_4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax2_4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax2_5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax2_5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_hax2_6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHax2_6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_half2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloHalf2)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+""+"</td>"+
        								"<td colspan='2'>"+"合计"+"</td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_axle1'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloAxle1)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_axle2'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloAxle2)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_axle3'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloAxle3)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_axle4'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloAxle4)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_axle5'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloAxle5)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_axle6'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloAxle6)+"</a></td>"+
        								"<td data-type='brg_weight_ratio_ovlo,ratio_ovlo_all'><a>"+convertPercent(json.obj[0].RatioOvlo[0].ratioOvloAll)+"</a></td>"+
        							"</tr>"+
        						"</tfoot>")
        						
        						ProbOvlo.append("<thead>"+
        						"</thead>"+
        						"<tfoot>"+
        							"<tr align='center'>"+
        								"<td>"+"方向"+"</td>"+
        								"<td>"+"车道编号"+"</td>"+
        								"<td>"+"车道名"+"</td>"+
        								"<td>"+"2轴车"+"</td>"+
        								"<td>"+"3轴车"+"</td>"+
        								"<td>"+"4轴车"+"</td>"+
        								"<td>"+"5轴车"+"</td>"+
        								"<td>"+"6轴车"+"</td>"+
        								"<td>"+"7轴车及以上"+"</td>"+
        								"<td>"+"合计"+"</td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"上行"+"</td>"+
        								"<td>"+"1"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo1_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo1_1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo1_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo1_2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo1_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo1_3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo1_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo1_4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo1_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo1_5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo1_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo1_6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_lane1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloLane1)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"2"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo2_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo2_1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo2_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo2_2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo2_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo2_3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo2_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo2_4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo2_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo2_5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo2_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo2_6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_lane2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloLane2)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"3"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo3_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo3_1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo3_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo3_2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo3_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo3_3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo3_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo3_4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo3_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo3_5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo3_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo3_6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_lane3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloLane3)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_hax1_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax1_1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_hax1_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax1_2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_hax1_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax1_3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_hax1_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax1_4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_hax1_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax1_5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_hax1_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax1_6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_half1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHalf1)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td rowspan='4'>"+"下行"+"</td>"+
        								"<td>"+"4"+"</td>"+
        								"<td>"+"车道1"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo4_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo4_1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo4_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo4_2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo4_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo4_3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo4_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo4_4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo4_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo4_5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo4_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo4_6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_lane4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloLane4)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"5"+"</td>"+
        								"<td>"+"车道2"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo5_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo5_1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo5_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo5_2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo5_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo5_3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo5_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo5_4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo5_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo5_5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo5_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo5_6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_lane5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloLane5)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+"6"+"</td>"+
        								"<td>"+"停车道"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo6_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo6_1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo6_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo6_2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo6_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo6_3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo6_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo6_4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo6_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo6_5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo6_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvlo6_6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_lane6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloLane6)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td colspan='2'>"+"小计"+"</td>"+
        								"<td  data-type='brg_weight_prob_ovlo,prob_ovlo_hax2_1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax2_1)+"</a></td>"+
        								"<td  data-type='brg_weight_prob_ovlo,prob_ovlo_hax2_2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax2_2)+"</a></td>"+
        								"<td  data-type='brg_weight_prob_ovlo,prob_ovlo_hax2_3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax2_3)+"</a></td>"+
        								"<td  data-type='brg_weight_prob_ovlo,prob_ovlo_hax2_4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax2_4)+"</a></td>"+
        								"<td  data-type='brg_weight_prob_ovlo,prob_ovlo_hax2_5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax2_5)+"</a></td>"+
        								"<td  data-type='brg_weight_prob_ovlo,prob_ovlo_hax2_6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHax2_6)+"</a></td>"+
        								"<td  data-type='brg_weight_prob_ovlo,prob_ovlo_half2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloHalf2)+"</a></td>"+
        							"</tr>"+
        							"<tr align='center'>"+
        								"<td>"+""+"</td>"+
        								"<td colspan='2'>"+"合计"+"</td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_axle1'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloAxle1)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_axle2'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloAxle2)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_axle3'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloAxle3)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_axle4'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloAxle4)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_axle5'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloAxle5)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_axle6'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloAxle6)+"</a></td>"+
        								"<td data-type='brg_weight_prob_ovlo,prob_ovlo_all'><a>"+convertPercent(json.obj[0].ProbOvlo[0].probOvloAll)+"</a></td>"+
        							"</tr>"+
        						"</tfoot>");
        						LoadRadio.append("<thead>"+
        								"</thead>"+
        								"<tfoot>"+
        									"<tr align='center'>"+
        										"<td rowspan='2'>"+"方向"+"</td>"+
        										"<td rowspan='2'>"+"车道编号"+"</td>"+
        										"<td rowspan='2'>"+"车道名"+"</td>"+
        										"<td colspan='3'>"+"实际荷载效应/设计荷载效应"+"</td>"+
        										"<td colspan='3'>"+"实际荷载效应/规范荷载效应"+"</td>"+
        										"<td rowspan='2'>"+"荷载状态"+"</td>"+
        										"<td rowspan='2'>"+"车道状态"+"</td>"+
        									"</tr>"+
        									"<tr align='center'>"+
        										"<td>"+"标准值"+"</td>"+
        										"<td>"+"最大值"+"</td>"+
        										"<td>"+"0.95分位值"+"</td>"+
        										"<td>"+"标准值"+"</td>"+
        										"<td>"+"最大值"+"</td>"+
        										"<td>"+"0.95分位值"+"</td>"+
        									"</tr>"+
        									"<tr align='center'>"+
        										"<td rowspan='3'>"+"上行"+"</td>"+
        										"<td>"+"1"+"</td>"+
        										"<td>"+"停车道"+"</td>"+
        										"<td data-type='brg_weight_load_radio,load_radio1' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio1+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio2' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio2+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio3' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio3+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio4' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio4+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio5' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio5+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio6' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio6+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio7' rowspan='3'>"+json.obj[0].LoadRadio[0].load_radio7+"</td>"+
        										"<td data-type='brg_weight_load_radio,load_radio8' rowspan='3'>"+json.obj[0].LoadRadio[0].load_radio8+"</td>"+
        									"</tr>"+
        									"<tr align='center'>"+
        										"<td>"+"2"+"</td>"+
        										"<td>"+"车道2"+"</td>"+
        									"</tr>"+
        									"<tr align='center'>"+
        										"<td>"+"3"+"</td>"+
        										"<td>"+"车道1"+"</td>"+
        									"</tr>"+
        									"<tr align='center'>"+
        										"<td rowspan='3'>"+"下行"+"</td>"+
        										"<td>"+"4"+"</td>"+
        										"<td>"+"车道1"+"</td>"+
        										"<td data-type='brg_weight_load_radio,load_radio9' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio9+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio10' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio10+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio11' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio11+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio12' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio12+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio13' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio13+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio14' rowspan='3'><a>"+json.obj[0].LoadRadio[0].load_radio14+"</a></td>"+
        										"<td data-type='brg_weight_load_radio,load_radio15' rowspan='3'>"+json.obj[0].LoadRadio[0].load_radio15+"</td>"+
        										"<td data-type='brg_weight_load_radio,load_radio16' rowspan='3'>"+json.obj[0].LoadRadio[0].load_radio16+"</td>"+
        									"</tr>"+
        									"<tr align='center'>"+
        										"<td>"+"5"+"</td>"+
        										"<td>"+"车道2"+"</td>"+
        									"</tr>"+
        									"<tr align='center'>"+
        										"<td>"+"6"+"</td>"+
        										"<td>"+"停车道"+"</td>"+
        									"</tr>"+
        								"</tfoot>");
        				}
        				
        			}
        				addClickEven();//注册a标签点击事件
        			}
        		}
			});
        	
		};
        
		$("#scanStruct").change(function(){
			 $('#item_second').html('');
			 var scanStruct=$("#scanStruct").val();
			 $.ajax({
					type : 'POST',
					url : '../BrgMonitorServlet',
					dataType : 'json',
					data : {
						type : "getItem_first",
						brgId:scanStruct
					},
					error : function(msg) {
						errMessage("请求PrjMgrServlet失败");
					},
					success : function(json) {
							var data = json.obj;
							$('#item_first').empty();
							for (var i = 0; i < data.length; i++) {
								$('#item_first').append("<option value='"+data[i]+"'>"+data[i]+"</option>");
							}
							$('#item_first').select2().val(data[0]).trigger("change");
			//				getChangeItemSecond();
					}
				});
		});
		
		
		 function getChangeItemSecond(){
			 $('#item_second').html('');
				var d=$('#item_second');
				
				$.ajax({
					type : 'POST',
					url : '../BrgMonitorServlet',
					dataType : 'json',
					data : {
						type : "getitem_second",
						brg_id:$("#scanStruct").val(),
						item_first:$("#item_first").val()
					},
					error : function(msg) {
						errMessage("请求BrgMonitorServlet失败");
					},
					success:function(json){
						if(json.obj!=null||json.obj!=undefined){
							for(var i=0;i<json.obj.length;i++){
								d.append("<option value='"+json.obj[i]+"'>"+json.obj[i]+"<option>");
							}
						}else{
							d.append("");
						}
						$("#item_second").select2().trigger("change");
					}
				});
			};
		
		  $("#item_first").change(function(){
			var d=$('#item_second').html('');
			$.ajax({
				type : 'POST',
				url : '../BrgMonitorServlet',
				dataType : 'json',
				data : {
					type : "getitem_second",
					brg_id:$("#scanStruct").val(),
					item_first:$("#item_first").val()
				},
				error : function(msg) {
					errMessage("请求BrgMonitorServlet失败");
				},
				success:function(json){
					if(json.obj!=null||json.obj!=undefined){
						for(var i=0;i<json.obj.length;i++){
							d.append("<option value='"+json.obj[i]+"'>"+json.obj[i]+"<option>");
						}
					}else{
						d.append("");
					}
					$("#item_second").select2().trigger("change");
				}
			});
		});
        
		  $("#item_second").on("change",function(){
			  var data=$('input[name="options"]:checked').val();
			  if(data=='hour'){
				  getTimeOfHour();
			  }else if(data=='day'){
				  getTimeOfDay();
			  }else if(data=='month'){
				  getTimeOfMonth();
			  }
		  }); 
		  
		  
		 /* $("#item_second").on("change",function(){
			 var item_second=$('#item_second').val();
			 if(item_second==null){
				 $("#time_picker").val("");
				 return;
			 }else{
				 $.ajax({
					 type : 'POST',
						url : '../BrgMonitorServlet',
						dataType : 'json',
						data : {
							type : "initTime",
							brg_id:$("#scanStruct").val(),
							item_second:item_second
						},
						error : function(msg) {
							errMessage("请求BrgMonitorServlet失败");
						},
						success:function(json){
							$("#time_picker").val(json.obj);
						    $("#selectTime").html('');
						    if(json.obj!=undefined){
								$("#selectTime").append("<span>"+json.obj+"</span>");
						    }
						    initDayHours();
						}
				 });
			 }
		 }); */
		 
        
        function clearTime_picker() {
			$("#time_picker").remove();
			$("#time_picker_next").prepend("<input type='text' id='time_picker' class='form-control' readonly='readonly'>");
		}
        
        
        function getTime(str){
        	var myDate = new Date();
        	switch (str) {
			case "year":
				return myDate.getFullYear(); //获取完整的年份(4位,1970-????)
				break;
			case "month":
				return myDate.getFullYear()+"-"+(parseInt(myDate.getMonth())+1);
				break;
			case "day":
				return myDate.getFullYear()+"-"+(parseInt(myDate.getMonth())+1)+"-"+myDate.getDate();
				break;	
			case "hour":
				return myDate.getFullYear()+"-"+(parseInt(myDate.getMonth())+1)+"-"+myDate.getDate()+" "+myDate.getHours()+"-"+myDate.getMinutes();
				break;
			default:
				break;
			}
		}
        
        
        function view_type(str) {
        	check_type = str;
        	var time_pick;
        	clearTime_picker();
			switch (str) {
			case "年":
				var limit = getTime("year");
				time_pick = {
			        elem: '#time_picker',
			        type: 'year',
			        trigger: 'click',/*
			        done: function(value, date){
			        	if(date.year>limit){
			        		console.log(date);
			        		console.log(value);
			        		date.year=limit;
			        		value = limit;
			        		console.log(date);
			        		console.log(value);
			        	}
			        }*/
			    };
				getTimeOfYear();
				break;
			case "月":
				time_pick = {
			        elem: '#time_picker',
			        type: 'month',
			        trigger: 'click',
			    };
				getTimeOfMonth();
				break;
			case "日":
				time_pick = {
			        elem: '#time_picker',
			        format: 'yyyy-MM-dd',
			        trigger: 'click',
			    };
				getTimeOfDay();
				break;
			case "小时":
				time_pick = {
			        elem: '#time_picker',
			        type: 'datetime',
			        format: 'yyyy-MM-dd HH-mm-ss',
			        trigger: 'click',
			    };
				getTimeOfHour();
				break;
			default:
				break;
			}
			laydate.render(time_pick);
		}
        /*
        var time_pick = {
		        elem: '#time_picker',
		        type: 'year',
		        trigger: 'click',
		    };
	 	laydate.render(startTime);
        */
        /*
        function choiceType(item_first) {
        	var arr = exchange(item_first);
			$("#item_second").empty();
			$("#item_second").append("<option value='0'>--请选择--<option>");
			for (var i = 0; i < arr.length; i++) {
				$('#item_second').append("<option value='"+arr[i].item_second+"'>"+arr[i].item_second+"<option>");
			}
			$("#item_second").select2();
		}
        */
        function reloadImg() {
        	$("#img1").prop("src",encodeURI("../ImageDownLoadServer?path="+'nofile.jpg'+"+&a="+ Math.random()));
		}
        
        function getTimeOfHour(){
        	$.ajax({
        		type : 'POST',
				url : '../BrgMonitorServlet',
				dataType : 'json',
				data : {
					type : "initTime",
					brg_id:$("#scanStruct").val(),
					item_second:$("#item_second").val(),
					item_first:$("#item_first").val()
				},
				error : function(msg) {
					errMessage("请求BrgMonitorServlet失败");
				},
				success:function(json){
					var time_picker=$("#time_picker").val(json.obj);
					$("#selectTime").html('');
					$("#selectTime").append("<span>"+json.obj+"</span>");
					initDayHours();
					count++;
				}
        	});
        }
        
        function getTimeOfDay(){
        	$.ajax({
        		type : 'POST',
				url : '../BrgMonitorServlet',
				dataType : 'json',
				data : {
					type : "initTimeOfDay",
					brg_id:$("#scanStruct").val(),
					item_second:$("#item_second").val(),
					item_first:$("#item_first").val()
				},
				error : function(msg) {
					errMessage("请求BrgMonitorServlet失败");
				},
				success:function(json){
					if(json.obj!=null){
						var day=json.obj.split(" ")[0];
						var time_picker=$("#time_picker").val(day);
						$("#selectTime").html('');
						$("#selectTime").append("<span>"+day+"</span>");
						$("#dayHours").html('');
					}else{
						$("#time_picker").html('');
						$("#selectTime").html('');
						$("#dayHours").html('');
					}
					count++;
				}
        	});
        }
        
        function getTimeOfMonth(){
        	$.ajax({
        		type : 'POST',
				url : '../BrgMonitorServlet',
				dataType : 'json',
				data : {
					type : "initTimeOfMonth",
					brg_id:$("#scanStruct").val(),
					item_second:$("#item_second").val(),
					item_first:$("#item_first").val()
				},
				error : function(msg) {
					errMessage("请求BrgMonitorServlet失败");
				},
				success:function(json){
					if(json.obj!=null){
						var month=json.obj.substring(0,7);
						var time_picker=$("#time_picker").val(month);
						$("#selectTime").html('');
						$("#selectTime").append("<span>"+month+"</span>");
						$("#dayHours").html('');
					}else {
						$("#time_picker").html('');
						$("#selectTime").html('');
						$("#dayHours").html('');
					}
					count++;
				}
        	});
        }
        
        function getTimeOfYear(){
        	$.ajax({
        		type : 'POST',
				url : '../BrgMonitorServlet',
				dataType : 'json',
				data : {
					type : "initTimeOfYear",
					brg_id:$("#scanStruct").val(),
					item_second:$("#item_second").val(),
					item_first:$("#item_first").val()
				},
				error : function(msg) {
					errMessage("请求BrgMonitorServlet失败");
				},
				success:function(json){
					if(json.obj!=null){
						var year=json.obj.substring(0,4);
						var time_picker=$("#time_picker").val(year);
						$("#selectTime").html('');
						$("#selectTime").append("<span>"+year+"</span>");
						$("#dayHours").html('');
					}else {
						$("#time_picker").html('');
						$("#selectTime").html('');
						$("#dayHours").html('');
					}
					count++;
				}
        	});
        }
        
		function exchange(item) {
			var ss ;
			switch (item) {
			case "局部响应":
				ss = info.局部响应;
				break;	
			case "整体响应":
				ss = info.整体响应;
				break;	
			case "荷载与环境":
				ss = info.荷载与环境;
				break;
			default:
				break;
			}
			return ss;
		}
        
        
		function addSystem(){
			$("#addSystem").dialog("open");
			$('#addSystem').dialog({
				buttons : [ {
					html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					"class" : "btn btn-default",
					click : function() {
						$.ajax({
							type : 'POST',
							url : '../PrjMgrServlet',
							dataType : 'json',
							data : {
								type : "addStruct",
								chk_type : prjData.chk_type,
								prj_id : prjData.prj_id,
								prj_charge_man : prjData.prj_charge_man,
								structs : JSON.stringify(structs)
							},
							error : function(msg) {
								errMessage("请求PrjMgrServlet失败");
								myTool.mask.hide();
							},
							success : function(json) {
								myTool.mask.hide();
								if (json.success == "fail") {
									switch (json.error) {
									case 1:
										break;
									case 2:
										errMessage("服务器错误");
										break;
									case 4:
										errMessage("授权添加项目中的结构物已达上限，请联系技术人员");
										break;
									default:
										break;
									}
								} else {
									successMessage("成功！");
									location.reload();
								}
							}
						});
					}
				}, {
					html : "<i class='fa fa-times'></i>&nbsp; 取消",
					"class" : "btn btn-default",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});
			
		}
		
	    function convertPercent(obj){
	    	var str=Number(obj*100).toFixed(0);
	        str+="%";
	        return str;
	    }
		
		
		
	   function imagView(){
		   $('#imgView').dialog("open")
		
		} 
		
			
		$('#imgView').dialog({
			closeOnEscape:true,
			autoOpen: false,
			width : 850,
			resizable : false,
			modal : true,
			show :'drop',
			hide: 'drop',
			title:'查看工程图'
		});
			
			$('#addSystem').dialog({
				closeOnEscape:true,
				autoOpen: false,
				width : 500,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop',
				title:'增加监测对象'
			});
			
			
			function updatePhoneNo(){
				$.ajax({
					type: 'POST',
					url: '../BrgMonitorServlet',
					dataType: 'json',
					data: {
						type:"updatePhoneNo",
						brg_id:$('#scanStruct').val(),
						phone:$('#phoneNo').val()
					},
					error : function(msg) {
						errMessage("请求BrgMonitorServlet失败");
				    },
				    success:function(json){
				    	if(json.obj==1){
					    	successMessage("添加成功");
				    	}else{
				    		errMessage("添加失败");
				    	}
				    }
				});
			}
			
			
			function dmWeight() {
				$("#dataTable").append("<div id='title'><ul   class='nav nav-tabs pull-left'>"
						+" <li class='active'><a href='#s1' data-toggle='tab' id='tab1'>交通量</a></li>"
						+" <li><a href='#s2' data-toggle='tab' id='tab2'>最大车重(KG)</a></li>"
						+" <li><a href='#s3' data-toggle='tab' id='tab3'>超载车辆数</a></li>"
						+" <li ><a href='#s4' data-toggle='tab' id='tab4'>超载比例</a></li>"
						+" <li ><a href='#s5' data-toggle='tab' id='tab5'>平均超载率</a></li>"
						+" <li '><a href='#s6' data-toggle='tab' id='tab6'>荷载效应比</a></li>"
						+"</ul></div>"
						+"<div id='myTabContent1' class='tab-content bg-color-white no-padding' style='overflow-x: auto; overflow-y: auto; height:450px; width:1040px;'>"
						+" <div class='tab-pane fade in active' id='s1'>"
						+" <table id='myTabOne1' data-type='交通量' class='table table-bordered table-hover' border='2'  bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
						+" <div class='tab-pane fade in' id='s2'>"
						+" <table id='myTabOne2' data-type='最大车重' class='table table-bordered table-hover' border='2'  bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
	                       +"<div class='tab-pane fade in' id='s3'><table id='myTabOne3' data-type='超载车辆数'  class='table table-bordered table-hover' border='2'  bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
	                       +"  <div class='tab-pane fade in' id='s4'><table id='myTabOne4' data-type='超载比例' class='table table-bordered table-hover' border='2' bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
	                       +"<div class='tab-pane fade in' id='s5'><table id='myTabOne5' data-type='平均超载率'  class='table table-bordered table-hover' border='2' bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
	                       +"<div class='tab-pane fade in' id='s6'><table id='myTabOne6' data-type='荷载效应比'  class='table table-bordered table-hover' border='2' bordercolor='black' cellspacing='0' cellpadding='0'></table></div>"
	                       +" </div>")
			}
			
			
			var dialogName;
			function addClickEven() {
				$("#myTabContent1 a").click(function(){
					dialogName=$($(this).parent().parent().parent().parent()).attr("data-type");
					var dataName = $($(this).parent()).attr("data-type");
					var brg_id=$("#scanStruct").val();
						$.ajax({
							type: 'POST',
							url: '../BrgMonitorServlet',
							dataType: 'json',
							data: {
								type:"lineData",
								brg_id:brg_id,
								mode:mode,
								dataName:dataName,
								item_second:item_second
							},
							error : function(msg) {
								errMessage("请求BrgMonitorServlet失败");
						    },
						    success:function(json){
								makeLineChart(json.obj);
						    }
					});
				})
			}
			
			function addClickEvenMonitor() {
				$("#dataTable a").click(function(){
					dialogName=$("#item_second").val();
					var dataName = $($(this).parent()).attr("data-type");
					var brg_id=$("#scanStruct").val();
					showMask();
						$.ajax({
							type: 'POST',
							url: '../BrgMonitorServlet',
							dataType: 'json',
							data: {
								type:"lineMonitorData",
								brg_id:brg_id,
								item_first:$('#item_first').val(),
								item_second:$('#item_second').val(),
								mode:$('input:radio:checked').val(),
								dataName:dataName
							},
							error : function(msg) {
								errMessage("请求BrgMonitorServlet失败");
						    },
						    success:function(json){
								makeLineChart(json.obj);
								hidMask();
						    }
					});
				})
			}
			
			function makeLineChart(data){
				$('#lineChart').dialog({
					title:dialogName+"趋势图"
				});
				
				initMyChart(data);
				$('#lineChart').dialog( "open" );
				
				$('#addChekPeople').dialog({
					  buttons: [
					    {
						   	  html : "<i class='fa fa-times'></i>&nbsp; 取消",
							  "class" : "btn btn-default",
							  click: function() {
							     $( this ).dialog( "close" );
								}
							}
					  ]
					});	
			}
			
			function addBrgSystem(){
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"addBrgWeightSystem",
						bridge_id:$('#structname').val(),
					},
					error : function(msg) {
						errMessage("请求WeightHealthServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								errMessage("插入失败");
								break;
							case 2:
								errMessage("文件目录不可用");
								break;
							default:
								break;
							}
						 }else{
							 successMessage("插入成功")
							 $('#addSystem').dialog("close");
						 }
					}
				});
			}
			
			

			function initBridge(){
				$.ajax({
					type: 'POST',
					url: '../StructMgrServlet',
					dataType: 'json',
					data: {
						type:"initBridge",
						mode:"w"
					},
					error : function(msg) {
						errMessage("请求StructMgrServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								errMessage("没有数据");
								break;
							case 2:
								errMessage("服务器错误");
								break;
							default:
								break;
							}
						 }else{
							 var data=json.obj;
							 for(var i=0;i<data.length;i++){
								 $('#structname').append("<option value='"+data[i].bridge_no+"'>"+data[i].bridge_name+"<option>");
							 }
							 $('#structname').trigger('change');
						 }
					}
				});
			}
			function initMyChart(data){
			    var myChart = echarts.init(document.getElementById('myChart'));
		        var option = {
		            title: {
		                text: ''
		            },
		            toolbox: {
		                feature: {
		                    dataZoom: {
		                        yAxisIndex: 'none'
		                    },
		                    restore: {},
		                    saveAsImage: {},
		                    dataView:{}
		                }
		            },
		            tooltip: {},
		            xAxis: {
		            	type: 'category',
		                data: data.x,
                        name: "日期",	
                        boundaryGap: false
		            },
		            yAxis: {
		                type: 'value',
		                boundaryGap: [0, '100%']
		            },
		            dataZoom: [{
		                type: 'inside',
		                start: 0,
		                end: 100
		            }, {
		                start: 0,
		                end: 100,
		                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
		                handleSize: '80%',
		                handleStyle: {
		                    color: '#fff',
		                    shadowBlur: 3,
		                    shadowColor: 'rgba(0, 0, 0, 0.6)',
		                    shadowOffsetX: 2,
		                    shadowOffsetY: 2
		                }
		            }],
		            series: [{
		                name: '',
		                type: 'line',
		                data: data.y
		            }]
		        };
		        myChart.setOption(option);
			}
			
			
			function errMessage(info) {
				$.smallBox({
					title : "处理信息",
					content : "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
					color : "#C46A69",
					iconSmall : "fa fa-times fa-2x fadeInRight animated",
					timeout : 3000
				});
			}

			function successMessage(info) {
				$.smallBox({
					title : "处理信息",
					content : "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
					color : "#659265",
					iconSmall : "fa fa-times fa-2x fadeInRight animated",
					timeout : 3000
				});
			}
			
			function releaseAdmin(){//管理员
			}
			function releaseManage(){//项目负责人
				
			}
			function releaseMember(){//项目参与人
				
			}
			function releaseGuest(){//普通用户
			}
			function releaseGuest(e){//普通用户
				if(e=="superAdmin"){
				}
			
			}
		</script>
	</body>
</html>