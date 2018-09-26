<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		.loading{  
	    width:220px;  
	    height:56px;  
		position:fixed;
	    top:50%;  
	    left:50%;  
	    line-height:56px;  
	    color:#fff;  
	    padding-left:60px;  
	    font-size:15px;  
	    background: #000 url(../img/loader.gif) no-repeat 10px 50%;  
	    z-index:9999;  
	    -moz-border-radius:20px;  
	    -webkit-border-radius:20px;  
	    border-radius:20px;  
	    filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);
	      
	}  
	.cover {
	position:fixed; 
	top: 0px; 
	right:0px; 
	bottom:0px;
	filter: alpha(opacity=60);
	 background-color: #E2E2E2;
	z-index: 8888; left: 0px; 
	display:none;
	opacity:0.6; 
	-moz-opacity:0.5;
	}
	
		#evaTable th,td{
			text-align: center;
			vertical-align: middle !important;
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
					<li>检查评定</li><li>评定</li><li>04评定</li>
				</ol>
				<!-- end breadcrumb -->

			</div>
			<!-- END RIBBON -->
			
			<!-- #MAIN CONTENT -->
			<div id="content">
				<section id="widget-grid">
					<div class="row">
			            
			            <%@include file="currentStruct.jsp" %>
			            
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
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>04评定</h2>
				
								</header>
				
								<!-- widget div-->
								<div>
				
									<!-- widget content -->
									<div class="widget-body no-padding" id="widget-body">
									
										<div class="widget-body-toolbar bg-color-white">
						
				
												<div class="row">
				
													<div class="col-sm-12 col-md-12 ">
													<h4 id="eval_state" class="pull-left"></h4>
														<a class="btn btn-primary disabled pull-right" id="complete" onclick="completeAss()">
															完成本桥评定
														</a>
														<a class="btn btn-default pull-right" style="display: none;margin-right: 5px;" onclick="showScore()">清洁、小修</a>
													</div>
				
												</div>
				
				
										</div>
										<table  class="table table-striped table-bordered " id="evaTable">
											<thead>
												<tr>
													<th colspan="2">桥梁名称</th>
													<th colspan="6"><%if(oc!=null){ %><%=oc.getName() %><%} %></th>
												</tr>
												<tr>
													<th>部件</th>
													<th>部件名称</th>
													<th>缺损程度级标度</th>
													<th>缺损对结构使用功能的影响程度</th>
													<th>缺损发展变化状况的修正</th>
													<th>最终评定结果</th>
													<th>全桥结果技术状况评分</th>
													<th>桥梁评定分类</th>
												</tr>
											</thead>
											<tbody>
												<tr id="0701">
													<td>1</td>
													<td>翼墙、耳墙</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td  rowspan="17" id="score">/</td>
													<td  rowspan="17" id= "level">/</td>
												</tr>
												<tr id="0702">
													<td>2</td>
													<td>锥坡、护坡</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0703">
													<td>3</td>
													<td>桥台及基础</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0704">
													<td>4</td>
													<td>桥墩及基础</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0705">
													<td>5</td>
													<td>地基冲刷</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0706">
													<td>6</td>
													<td>支座</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0716">
													<td>7</td>
													<td>上部主要承重构件</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0717">
													<td>8</td>
													<td>上部一般承重构件</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0707">
													<td>9</td>
													<td>桥面铺装</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0708">
													<td>10</td>
													<td>桥头与路堤连接部</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0709">
													<td>11</td>
													<td>伸缩缝</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0710">
													<td>12</td>
													<td>人行道</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0711">
													<td>13</td>
													<td>栏杆、护栏</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0712">
													<td>14</td>
													<td>照明、标志</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0713">
													<td>15</td>
													<td>排水设施 </td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0714">
													<td>16</td>
													<td>调治构造物</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
												<tr id="0715">
													<td>17</td>
													<td>其他</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
													<td>/</td>
												</tr>
											</tbody>
										</table>
										
										
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
										
			            </article><!-- END GRID -->
			            
			            			
			        </div>
				</section>
			</div>
			<!-- END #MAIN CONTENT -->
		</div>
		<!-- END #MAIN PANEL -->
		
		<%@ include file="footer.jsp" %>
		
		
		<div id="evaRes" hidden="hidden">
		
<!-- 			<table  class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>总体状况评定等级</th>
						<th>--</th>
					</tr>
					<tr>
						<th>部件名称 </th>
						<th>评分</th>
					</tr>
				</thead>
				<tbody>
					<tr id="0701"><td>翼墙、耳墙</td><td></td></tr>
					<tr id="0702"><td>锥坡、护坡</td><td></td></tr>
					<tr id="0703"><td>桥台及基础</td><td></td></tr>
					<tr id="0704"><td>桥墩及基础</td><td></td></tr>
					<tr id="0705"><td>地基冲刷</td><td></td></tr>
					<tr id="0706"><td>支座</td><td></td></tr>
					<tr id="0707"><td>桥面铺装</td><td></td></tr>
					<tr id="0708"><td>桥头与路堤连接部</td><td></td></tr>
					<tr id="0709"><td>伸缩缝</td><td></td></tr>
					<tr id="0710"><td>人行道</td><td></td></tr>
					<tr id="0711"><td>栏杆、护栏</td><td></td></tr>
					<tr id="0712"><td>照明、标志</td><td></td></tr>
					<tr id="0713"><td>排水设施 </td><td></td></tr>
					<tr id="0714"><td>调治构造物</td><td></td></tr>
					<tr id="0716"><td>上部主要承重构件</td><td></td></tr>
					<tr id="0717"><td>上部一般承重构件</td><td></td></tr>
					<tr id="0715"><td>其他</td><td></td></tr>
				</tbody>
			</table> -->
		
		</div>
		
		<div id="score-dia" hidden="hidden">
			<div class="form-inline form-group">
				<label>清洁状况评分</label><i class="text-danger">*</i>
				<input id="score_clean" class="form-control" type="number">
			</div>
			<div class="form-inline form-group">
				<label>小修保养评分</label><i class="text-danger">*</i>
				<input id="score_fix" class="form-control" type="number">
			</div>
		</div>
		<!--================================================== -->
		<div id="cover" class="cover">		
			<div id="loading" class="loading">处理中......
			</div> 	
		</div>
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
		<script src="../js/plugin/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
		<script src="../js/myTool.js"></script>
		<script type="text/javascript">
		var table;
		var tableData;
		var isAudit = false;
		
		$(document).ready(function() {
				// DO NOT REMOVE : GLOBAL FUNCTIONS!
				pageSetUp();
				queryEval04();
			
		});
		
		
		$('#score-dia').dialog({
			autoOpen: false,
			width : 350,
			resizable : false,
			modal : true,
			show :'drop',
			hide: 'drop',
			title: "清洁、小修"
			});
		
		function showScore(){
			getScore();
			
			var buttons = [{
	        	html : "确定",
				  "class" : "btn btn-default",
				  click: function() {
				     $( this ).dialog( "close" );
					}
				}];
			if(!isAudit){
				buttons.unshift({
					html : "保存",
					  "class" : "btn btn-default",
					  click: function() {
						  saveScore();
						}
				});
			}
			$('#score-dia').dialog({
				buttons:buttons
			});
			$('#score-dia').dialog('open');
		}
		function saveScore(){
			var score_clean = $('#score_clean').val();
			var score_fix = $('#score_fix').val();
			/*
			if(score_clean=="" || score_fix==""){
				errMessage("必填项请填满");
				return;
			}*/
			$.ajax({
				type: 'POST',
				url: '../Eval04Servlet',
				dataType: 'json',
				data: {
					choice:"setScore",
					score_clean: score_clean,
					score_fix: score_fix
				},
				error : function(msg) {
					errMessage("请求Eval04Servlet失败");
			    },
				success : function(json) {
					console.log(json);
					 if(json.success=="fail"){
						 switch (json.error) {
						case 1:
							errMessage("出错");
							break;
						case 2:
							errMessage("服务器错误！");
							break;
						case 3:
							errMessage("出错！");
							break;
						default:
							break;
						}
					 }else{
						 successMessage("保存成功");
						 $('#score-dia').dialog('close');
					 }
				}
			});
		}
		
		function getScore(){
			showMask();
			$.ajax({
				type: 'POST',
				url: '../Eval04Servlet',
				dataType: 'json',
				data: {
					choice:"getScore"
				},
				error : function(msg) {
					errMessage("请求Eval04Servlet失败");
			    },
				success : function(json) {
					hidMask();
					 if(json.success=="fail"){
						 switch (json.error) {
						case 1:
							errMessage("出错");
							break;
						case 2:
							errMessage("服务器错误！");
							break;
						case 3:
							errMessage("出错！");
							break;
						default:
							break;
						}
					 }else{
						 hidMask();
						 console.log(json);
						 $('#score_clean').val(json.obj.score_clean);
						 $('#score_fix').val(json.obj.score_fix);
					 }
				}
			});
		}
		
			
		function evaRes(){
			$.ajax({
				type: 'POST',
				url: '../Eval04Servlet',
				dataType: 'json',
				data: {
					choice:"evaRes"
				},
				error : function(msg) {
			    },
				success : function(json) {
					console.log(json);
					$('#level').html( json.obj.split('/')[0]);
					$('#score').html(Number( json.obj.split('/')[1]).toFixed(1));
				}
			});
			
		}
		
			/*****************************查询04评定的数据**************************************************************************/
			
			
			function queryEval04(){
				myTool.mask.show('加载中...');
				$.ajax({
					type: 'POST',
					url: '../Eval04Servlet',
					dataType: 'json',
					data: {
						choice:1,
					},
					error : function(msg) {
						errMessage("请求Eval04Servlet失败");
						myTool.mask.hide();
				    },
					success : function(json) {
						myTool.mask.hide();
						 if(json.success=="fail"){
							 switch (json.error) {
							case -1:
								errMessage("请选择结构！");
								break;
							case -2:
								errMessage("出错！");
								break;
							default:
								errMessage("不存在项目或无需评定");
								break;
							}
							 $('.widget-body-toolbar a').eq(0).addClass('disabled');
						 }else{
							 $('.widget-body-toolbar a').eq(1).show();
							 var data = json.obj;
							 tableData = data;
							 $('#evalGrid').DataTable().rows.add(data).draw(false); 
							 for(var i=0;i<data.length;i++){
								 setValue(data[i]);
							 }
							 $('h4').append(data[0].state);
							 if(data[0].state.indexOf('success')>=0){
 								 evaRes();
							 }
							 if(data[0].state.indexOf('审核')>=0){
								 $('.widget-body-toolbar a').eq(0).addClass('disabled');
								 isAudit=true;
								 $('#score-dia input').prop('disabled', 'disabled');
							 }else if(data[0].state.indexOf('已评定')>=0){
								 $('.widget-body-toolbar a').eq(0).removeClass(
		                            'btn-primary').addClass('btn-success');
								 $('#complete').attr("disabled",true);
								 valueClick();
							 }else{
								 valueClick();
								
							 }
						 }
					}
				});
				
			}
			
			
			$("#evaTable tr").on('click',function(){
				$('#complete').attr("disabled",false);
				$("#complete").removeClass("btn-success").addClass("btn-primary");
			});
			
			function valueClick(){
				$('#evaTable').delegate('.value', 'click', function(){
					$(this).closest('td').find('.btn-warning').removeClass('btn-warning btn-sm').addClass('btn-default btn-xs');
					$(this).removeClass('btn-default btn-xs').addClass('btn-warning btn-sm');
					setScore($(this).closest('tr'));
				});
			}
			
			
			
			function setValue( d ){
				var td = $('#'+d.component_id).find('td');
				td.eq(2).empty().append('<a class="btn btn-default btn-xs value"  data-value="0">0</a>&nbsp;<a class="btn btn-default btn-xs value"  data-value="1">1</a>&nbsp;<a class="btn btn-default btn-xs value"  data-value="2">2</a>').find('a[data-value="'+d.iiv[0].value+'"]').removeClass('btn-default btn-xs').addClass('btn-warning btn-sm');
				td.eq(3).empty().append('<a class="btn btn-default btn-xs value"  data-value="0">0</a>&nbsp;<a class="btn btn-default btn-xs value"  data-value="1">1</a>&nbsp;<a class="btn btn-default btn-xs value"  data-value="2">2</a>').find('a[data-value="'+d.iiv[1].value+'"]').removeClass('btn-default btn-xs').addClass('btn-warning btn-sm');
				td.eq(4).empty().append('<a class="btn btn-default btn-xs value"  data-value="-1">-1</a>&nbsp;<a class="btn btn-default btn-xs value" data-value="0">0</a>&nbsp;<a class="btn btn-default btn-xs value"  data-value="1">1</a>').find('a[data-value="'+d.iiv[2].value+'"]').removeClass('btn-default btn-xs').addClass('btn-warning btn-sm');
				td.eq(5).empty().html(d.score);
			}
			
			function setScore( tr ){
				var td = tr.find('td');
				td.eq(5).html(Number(td.eq(2).find('.btn-warning').html())+Number(td.eq(3).find('.btn-warning').html())+Number(td.eq(4).find('.btn-warning').html()));
			}
			
					/***********************************完成评定按钮的点击事件*********************************************************************************/
					
					
					function completeAss(){
						showMask();
						for(var i=0;i<tableData.length;i++){
							var data = tableData[i];
							var td = $('#'+data.component_id).find('td');
							data.score = td.eq(5).html();
							data.iiv[0].value = td.eq(2).find('.btn-warning').html();
							data.iiv[1].value = td.eq(3).find('.btn-warning').html();
							data.iiv[2].value = td.eq(4).find('.btn-warning').html();
						}
						$.ajax({
							type: 'POST',
							url: '../Eval04Servlet',
							dataType: 'json',
							async:false,
							data: {
								choice:2,
								value:JSON.stringify(tableData)
							},
							error : function(msg) {
								hidMask();
								errMessage("请求Eval04Servlet失败");
						    },
							success : function(json) {   
								hidMask();
								 if(json.success=="fail"){
									 switch (json.error) {
									case -1:
										errMessage("请选择结构！");
										break;
									case -2:
										errMessage("出错！");
										break;
									case 4:
										errMessage("请完成清洁、小修评分部分");
										break;
									default:
										errMessage("评定失败！");
										break;
									}
								 }else{
									 successMessage("评定完成！");
									 $(".state").prop("class","label label-success state");
									 $(".state").html("已评定");
									 $('#complete').attr("disabled",true);
									 forceEval();
								 }
							}
						});
					}
					
					
					
			
			
			function buildPDF(){
				$.ajax({
					type: 'POST',
					url: '../Eval04Servlet',
					dataType: 'json',
					data: {
						choice:"buildPDF"
					},
					error : function(msg) {
				    },
					success : function(json) {   
					}
				});
			}
			
			function forceEval(){
				showMask();
				$.ajax({
					type: 'POST',
					url: '../Eval04Servlet',
					dataType: 'json',
					data: {
						choice:"forceEval"
					},
					error : function(msg) {
						hidMask();
				    },
					success : function(json) {   
						hidMask();
						if(json.obj==false){
							errMessage('打分失败');
						}else{
							buildPDF();
							window.location.reload();
						}
					}
				});
			}
			
			/*********************************提示信息*******************************************************************************************************/
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
			
			 function showMask(){
		        	$("#cover").show();		
		       	}
		   	function hidMask(){
		       		$("#cover").css('display','none');
		       	}
			
			function releaseAdmin(){//管理员
				
			}
			function releaseManage(){//项目负责人
				releaseMember();
			}
			function releaseMember(){//项目参与人
				$('.widget-body-toolbar a').eq(0).removeClass('disabled');
			}
			function releaseGuest(){//普通用户
			}
			function releaseGuest(e){//普通用户
				if(e=="superAdmin"){
    				releaseMember();
				}
			
			}
		</script>
		
	</body>
</html>