<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@page import="com.alibaba.fastjson.JSON"%>   
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
		<link rel="apple-touch-startup-image" href="../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
		<link rel="apple-touch-startup-image" href="../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
		<link rel="apple-touch-startup-image" href="../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
		<style type="text/css">
		
	
	 .sort { 
	 list-style-type: none;
	 padding: 0 0 0 20px;
/* 	 padding-top: 10px; */
	 }
	 .sort  li{ 
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
	.timeline > li:before,
	.timeline > li:after {
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
	.timeline > li > .timeline-item > .timeline-body,
	.timeline > li > .timeline-item > .timeline-footer {
	  padding: 10px;
	}
	.timeline > li > .fa,
	.timeline > li > .glyphicon,
	.timeline > li > .ion {
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
	
	nav>.pager{
		position: inherit;
	}
	
	
	.tcenter{
				text-align: center;
				cursor: pointer;
	}
	.well{
		padding: 10px;
	}
	
	#inputDiv{margin:12px;border:0;padding:0;}
	
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
					<li>系统管理</li><li>短信通知</li>
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
			            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="glyphicon glyphicon-earphone"></i> </span>
									<h2>号码绑定</h2>
				
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
								            <li>
								                <i id="step1-state" class="fa fa-info bg-aqua"></i>
								
								                <div class="timeline-item">
								                    <span class="time"><i class="fa fa-clock-o"></i></span>
								                    <h3 class="timeline-header no-border"><a>步骤一：</a> 选择桥梁</h3>
								                    <div class="timeline-body" id="step1" style="display: block;">
								                    	<div id="inputDiv" class="col-md-12" style="width: 100%">
								                    			<div class="col-md-12">
									                    			<label class="control-label" style="width:6%">结构物名称</label>
									                    			<select id="scanStruct" class="form" style="width:38%;height:31px">
									                    			
									                    			</select>
									                    		
									                    			<div class="col-md-6">
									                    				<label class="control-label" style="width:10%">通知类型</label>
										                    			<select id="monitorType" class="form" style="width:65%;height:31px">
										                    				<option>无数据</option>
										                    				<option>数据异常</option>
										                    				<option>黄色告警</option>
										                    				<option>红色告警</option>
										                    			</select>
									                    			</div>
								                    			</div>
								                    	</div>
								                    	
								                        <nav aria-label="...">
								                            <ul class="pager">
								                                <li class="next"><a style='color:black' id="step1-next" href="#">下一步</a></li>
								                            </ul>
								                        </nav>
								                    </div>
								                </div>
								            </li>
								            <li>
								                <i id="step2-state" class="fa fa-info bg-aqua"></i>
								                <div class="timeline-item">
								                    <span class="time"><i class="fa fa-clock-o"></i></span>
								
								                    <h3 class="timeline-header"><a href="#">步骤二：</a>修改号码<span class="widget-icon"> <i title="多个号码请用,号隔开" class="glyphicon glyphicon-question-sign"></i> </span></h3>
								
								                    <div class="timeline-body" id="step2" style="display: none;">
								                    	<div id="phoneNo">
								                    	
								                    	</div>	
								                    
								                        <nav aria-label="...">
								                            <ul class="pager">
								                                <li class="previous"><a style='color:black' id="step2-previous" href="#">上一步</a></li>
								                                <li class="next"><a style='color:black' onclick="stepOk()" href="#">确定</a></li>
								                            </ul>
								                        </nav>
								                    </div>
								
								                </div>
								            </li>
								        </ul>
										
										
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
		
		<div id="rgw" hidden="hidden">
			
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
		<script src="check/select2Fix.js"></script>
		
		<!-- JQUERY UI + Bootstrap Slider -->
		<script src="../js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

		<!-- browser msie issue fix -->
		<script src="../js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

		<!-- FastClick: For mobile devices -->
		<script src="../js/plugin/fastclick/fastclick.min.js"></script>


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
		
		<script src="../js/plugin/jquery-form/jquery-form.min.js"></script>
		
		<script src="../js/myTool.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				getScan_struct();
			});	
			
			var ss;
			var nn;
			$('#step1-next').on('click', function () {
				var monitorType=$("#monitorType").val();
				var scanStruct=$("#scanStruct").val();
				$("#phoneNo").html('');
				$.ajax({
					type : 'POST',
					url : '../BrgMonitorServlet',
					dataType : 'json',
					data : {
						type : "selectStaffNumber",
						monitorType:monitorType,
						brg_id:scanStruct,
						item_all:"健康监测"
					},
					error : function(msg) {
						errMessage("请求BrgMonitorServlet失败");
					},
					success : function(json) {
						console.log(json.obj.list1);
						var name;
						if(json.obj.list1.length==0){
							var pn="";
							name="";
						}else{
							var pn=json.obj.list1[0].phone;
							name=json.obj.list1[0].name;
						}
						if(monitorType=='无数据'){
							$("#phoneNo").append("<label class='control-label' style='width:6%'>"+"监测类型"+"</label>"+
									"<select id='item_all' onchange='changeItemAll()' class='form' style='width:25%;height:31px'>"+
										"<option value='动态称重'>"+"动态称重"+"</option>"+
										"<option selected='selected' value='健康监测'>"+"健康监测"+"</option>"+
										"<option value='GPS'>"+"GPS"+"</option>"+
            						"</select>"+
            						"<label class='control-label' style='margin-left:20px'>"+"号码"+"</label>"+
									"<input type='text' class='form' style='width:20%;height:31px;margin-left:25px' id='phone' value='"+IsNull(pn)+"'>"+
									"<label class='control-label' style='margin-left:20px'>"+"姓名"+"</label>"+
									"<input type='text' class='form' style='width:20%;height:31px;margin-left:25px' id='name' value='"+IsNull(name)+"'>");
							$('#step1').slideUp('normal', 'swing');
				            $('#step2').slideDown('normal', 'swing');
				            $('#step1-state').removeClass('fa-info').addClass('fa-check');
						}else{
							selectPhone(json.obj.list2[0]);
							console.log(ss);
							if(ss==undefined){
								ss="";
							}
							if(nn==undefined){
								nn="";
							}
								$("#phoneNo").append("<label class='control-label' style='width:6%'>"+"监测类型"+"</label>"+
										"<select id='item_second' onchange='changeItem()' class='form' style='width:25%;height:31px'>"+
	            						"</select>"+
	            						"<label class='control-label' style='margin-left:20px'>"+"号码"+"</label>"+
	            						"<input type='text' class='form' id='phone2' style='width:25%;height:31px;margin-left:20px' value='"+ss+"'>"+
	            						"<label class='control-label' style='margin-left:20px'>"+"姓名"+"</label>"+
										"<input type='text'  class='form' style='width:25%;height:31px;margin-left:20px' id='name2' value='"+nn+"'>");
							if(json.obj.list2.length==0){
								errMessage("该桥没有传感器");
								return;
							}
							for(var i=0;i<json.obj.list2.length;i++){
								$("#item_second").append("<option value='"+json.obj.list2[i]+"'>"+json.obj.list2[i]+"</option>");
							}
							$('#step1').slideUp('normal', 'swing');
				            $('#step2').slideDown('normal', 'swing');
				            $('#step1-state').removeClass('fa-info').addClass('fa-check');
							
						}
					}
				});
	            
	        });	
			$('#step2-previous').on('click', function () {
                $('#step1').slideDown('normal', 'swing');
                $('#step2').slideUp('normal', 'swing');
                $('#step2-state').removeClass('fa-check').addClass('fa-info');
            });
		
			function IsNull(obj){
				if(obj=='undefined'||obj==null||obj==""){
					return "";
				}else{
					return obj;
				}
			}
			
			function selectPhone(obj){
				var monitorType=$("#monitorType").val();
				var scanStruct=$("#scanStruct").val();
				if(obj=='undefined'||obj==null||obj==""){
					ss="";
					return;
				}else{
					$.ajax({
						type : 'POST',
						url : '../BrgMonitorServlet',
						dataType : 'json',
						async:false,
						data : {
							type : "selectPhone",
							monitorType:monitorType,
							brg_id:scanStruct,
							item_second:obj
						},
						error : function(msg) {
							errMessage("请求BrgMonitorServlet失败");
						},
						success : function(json) {
							ss=json.obj.phone;
							nn=json.obj.name;
						}
	        	 });	
				}
			}
			
			function changeItemAll(){
				var monitorType=$("#monitorType").val();
				var scanStruct=$("#scanStruct").val();
				var item_all=$("#item_all").val();
				$("#phone").html('');
				$.ajax({
					type : 'POST',
					url : '../BrgMonitorServlet',
					dataType : 'json',
					data : {
						type : "selectPhoneOfWu",
						monitorType:monitorType,
						brg_id:scanStruct,
						item_all:item_all
					},
					error : function(msg) {
						errMessage("请求BrgMonitorServlet失败");
					},
					success : function(json) {
						var ss=json.obj.phone;
						var nn=json.obj.name
						$("#phone").val(ss);
						$("#name").val(nn);
					}
        	 });
			}
			
			
			function changeItem(){
					var monitorType=$("#monitorType").val();
					var scanStruct=$("#scanStruct").val();
					var item_second=$("#item_second").val();
					$("#phone2").html('');
					$.ajax({
						type : 'POST',
						url : '../BrgMonitorServlet',
						dataType : 'json',
						data : {
							type : "selectPhone",
							monitorType:monitorType,
							brg_id:scanStruct,
							item_second:item_second
						},
						error : function(msg) {
							errMessage("请求BrgMonitorServlet失败");
						},
						success : function(json) {
							var ss=json.obj.phone;
							var nn=json.obj.name;
							console.log(ss);
							$("#phone2").val(ss);
							$("#name2").val(nn);
						}
	        	 });
			}
			
			function stepOk(){
				var monitorType=$("#monitorType").val();
				if(monitorType=='无数据'){
					var scanStruct=$("#scanStruct").val();
					var phone=$("#phone").val();
					var name =$("#name").val();
					if(phone==null||phone==''){
						errMessage("电话不可为空");
						return;
					}
					$.ajax({
						type : 'POST',
						url : '../BrgMonitorServlet',
						dataType : 'json',
						data : {
							type : "updatePhoneOfwu",
							monitorType:monitorType,
							brg_id:scanStruct,
							phone:phone,
							name:name,
							item_all:$("#item_all").val()
						},
						error : function(msg) {
							errMessage("请求BrgMonitorServlet失败");
						},
						success : function(json) {
							if(json.obj>=1){
								successMessage("修改成功");
							}else{
								errMessage("修改失败");
							}
							
						}
	        	 });
				}else{
					var scanStruct=$("#scanStruct").val(); 
					var phone2=$("#phone2").val();
					var name2 =$("#name2").val();
					var item_second=$("#item_second").val();
					if(item_second==null||item_second==''){
						errMessage("监测类型不能为空");
						return;
					}
					if(phone2==null||phone2==''){
						errMessage("电话不可为空");
						return;
					}
					$.ajax({
						type : 'POST',
						url : '../BrgMonitorServlet',
						dataType : 'json',
						data : {
							type : "updatePhoneOfAbnormal",
							monitorType:monitorType,
							brg_id:scanStruct,
							phone2:phone2,
							name2:name2,
							item_second:item_second
						},
						error : function(msg) {
							errMessage("请求BrgMonitorServlet失败");
						},
						success : function(json) {
							if(json.obj>=1){
								successMessage("修改成功");
							}else{
								errMessage("修改失败");
							}
							
						}
	        	 });
				}
				setTimeout("window.location.href='StaffNumber.jsp'",1500); 
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
			function getScan_struct() {
	        	 $.ajax({
						type : 'POST',
						url : '../WeightHealthServlet',
						dataType : 'json',
						data : {
							type : "getScan_struct"
						},
						error : function(msg) {
							errMessage("请求PrjMgrServlet失败");
						},
						success : function(json) {
							if(json.success=="success"){
								var data = json.obj;
								$("#scanStruct").empty();
								for (var i = 0; i < data.length; i++) {
									$("#scanStruct").append("<option value='"+data[i].bridge_id+"'>"+data[i].bridge_name+"<option>");
								}
								$("#scanStruct").select2();
								/*设置默认*/
								$("#scanStruct").select2().val("G15320682L0130").trigger("change");
							}
						}
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
		</script>
	</body>
</html>