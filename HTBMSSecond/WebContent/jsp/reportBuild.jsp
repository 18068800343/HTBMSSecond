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
					<li>检查评定</li><li>报告</li>
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
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>报告</h2>
				
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
								                    <h3 class="timeline-header no-border"><a>步骤一：</a> 选择项目</h3>
								                    <div class="timeline-body" id="step1" style="display: block;">
								                    	<div id="inputDiv" class="col-md-12" style="width: 100%">
								                    			<div class="col-md-12">
									                    			<label class="control-label" style="width:6%">管养单位</label>
									                    			<select id="orgType" class="form" style="width:38%;height:31px"></select>
									                    		
									                    			<div class="col-md-6">
									                    				<label class="control-label" style="width:18%">项目类型</label>
										                    			<select id="chioceType" class="form" style="width:65%;height:31px">
										                    				<option  value="all">全部</option>
										                    				<option  value="regular">定期检查</option>
										                    				<option  value="special">特殊检查</option>
										                    				<option  value="daily">日常检查</option>
										                    				<option  value="often">经常检查</option>
										                    			</select>
									                    			</div>
								                    			</div>
								                    	</div>
								                    	<div id="inputDiv" class="col-md-12" style="width: 100%">	
																<div class="col-md-12">
																	<label class="control-label" style="width:6%">项目</label>
																	<select class="form-control" id="prj" style="width:38%">
																	</select>
																	<div class="col-md-6 task">
											
																	</div>
																</div>
														</div>
														
														
								                        <nav aria-label="...">
								                            <ul class="pager">
								                                <li class="next"><a id="step1-next" href="#">下一步</a></li>
								                            </ul>
								                        </nav>
								                    </div>
								                </div>
								            </li>
								            <li>
								                <i id="step2-state" class="fa fa-info bg-aqua"></i>
								                <div class="timeline-item">
								                    <span class="time"><i class="fa fa-clock-o"></i></span>
								
								                    <h3 class="timeline-header"><a href="#">步骤二：</a>选择结构物</h3>
								
								                    <div class="timeline-body" id="step2" style="display: none;">
								                    		<table id="structTable" class="table table-striped table-bordered table-hover" style="width: 100%">
																<thead>
																	<tr>
																		<th style="width: 80px;">
																			<select class="input-sm form-control" style="width: 100%;" onchange="structTable.column( '10' ).search( this.value ).draw( false );"><option value="">全部</option><option value="true">已选</option><option value="false">未选</option></select>
																		</th>
																		<th style="width: 100px;"> 
																			<select class="input-sm form-control" style="width: 100%;" onchange="searchMode(this.value)"><option value="">全部</option><option>桥梁</option><option>通道</option><option>涵洞</option></select>
																		</th>
																		<th>
																			<input type="text" class="form-control hasinput" placeholder="检索" />
																		</th>
																		<th>
																			<input type="text" class="form-control hasinput" placeholder="检索" />
																		</th>
																		<th>
																			<input type="text" class="form-control hasinput" placeholder="检索" />
																		</th>
																		<th>
																			<button  class="btn btn-default" style="width: 100%;" onclick="orderStub()">排序</button>
																		</th>
																		<th>
																			<input type="text" class="form-control hasinput" placeholder="检索" />
																		</th>
																		<th>
																			<input type="text" class="form-control hasinput" placeholder="检索" />
																		</th>
																		<th>
																			<input type="text" class="form-control hasinput" placeholder="检索" />
																		</th>
																	</tr>	 
																	<tr>
																		<th>
																			<label class="checkbox-inline" style="width: 100%;height: 100%;">
																				  <input type="checkbox" class="checkbox style-0" id="autoChk">
																				  <span></span>
																			</label>
																		</th>
																		<th>结构编号</th>
																		<th>结构名称</th>
																		<th>结构分类</th>
																		<th>路线名称</th>
																		<th>中心桩号</th>
																		<th>管养单位</th>
																		<th>所属路段</th>
																		<th>所属分区</th>
																		<th>桩号转换</th>
																	</tr>
																</thead>
																<tbody>
																	
																</tbody>
															</table>
								                    
								                        <nav aria-label="...">
								                            <ul class="pager">
								                                <li class="previous"><a id="step2-previous" href="#">上一步</a></li>
								                                <li class="next"><a id="step2-next" href="#">下一步</a></li>
								                            </ul>
								                        </nav>
								                    </div>
								
								                </div>
								            </li>
								            <li>
										        <i id="step3-state" class="fa fa-info"></i>
										
										        <div class="timeline-item">
										            <span class="time"><i class="fa fa-clock-o"></i></span>
										            <h3 class="timeline-header no-border"><a href="#">步骤三：</a>设置报告<img title="分跨生成请参考     格式1:4     格式2:1-4     格式3:1-4;5-7;..." src="../img/xiaowenhao.png"></h3>
										            <div class="timeline-body" id="step3" style="display: none;">
											            <div id="reportArea" class="col-xs-12" style="padding: 0;">
															
								                    	</div>
										                 <nav aria-label="..." class="clearfix" style="clear: both;">
										                    <ul class="pager">
										                        <li class="previous"><a id="step3-previous" href="#">上一步</a></li>
										                        <li class="next"><a id="step-finish" href="#">完成</a></li>
										                    </ul>
										                </nav>
										            </div>
										           
										        </div>
										    </li>
								            <li>
								                <i class="fa fa-info"></i>
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
		<div id="cover" class="cover">		
			<div id="loading" class="loading">生成报告
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
		<script src="check/select2Fix.js"></script>
		
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
		<script src="../js/plugin/vectormap/jquery-jvectormap-world-mill-en.js"></script>
		
		<!-- Full Calendar -->
		<script src="../js/plugin/moment/moment.min.js"></script>
		<script src="../js/plugin/fullcalendar/jquery.fullcalendar.min.js"></script>
		
		
		<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
		<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
		
		<script src="../js/plugin/jquery-form/jquery-form.min.js"></script>
		
		<script src="../js/myTool.js"></script>
		
		<script type="text/javascript">
		var role = '<%=session.getAttribute("userRole")%>';
			$(document).ready(function() {
				pageSetUp();
				initPrj();
				stepInit();
				initOrg();
				initCount();
			});
			
			
			
			
			//报告组成设置
			$('#reportArea').delegate('input[type="checkbox"]', 'change', function(){
				var flag = $(this).prop('checked');
				var d = $(this).attr('data-name');
				var name = $(this).next('span').html();
				var $sort = $(this).closest('.well').find('.sort');
				if(flag){
					$sort.append('<li class="btn btn-default" data-name="'+d+'">'+name+'</li>');
				}else{
					$sort.find('[data-name="'+d+'"]').remove();
				}
			});
			
			$('#build input[type="checkbox"]').on('change', function(){
				var flag = $(this).prop('checked');
				var d = $(this).attr('data-name');
				var name = $(this).next('span').html();
				if(flag){
					$('#sort').append('<li class="btn btn-default" data-name="'+d+'">'+name+'</li>');
				}else{
					$('#sort').find('[data-name="'+d+'"]').remove();
				}
			});
			
			
			/* function addReport(){
				var build = getBuild();
				var sp = getSp();
				if(info.stub_no==undefined){
					info.stub_no = "";
				}
				var name = info.name+"（"+info.stub_no+"）";
				if(name==""){
					errMessage("请输入名称！");
					return;
				}
				var prj_id = $('#prj').val();
				tableData.report_build = build;
				tableData.report_sp = sp;
				tableData.report_file_name = name;
				tableData.prj_id = prj_id;
				tableData.prj_name = $("#prj option[value='"+prj_id+"']").html();
				tableData.struct_id = info.id;
				tableData.struct_mode = info.mode;
				tableData.report_date="2016-09-24 17:01:01";
				ParaMsg = "2,"+prj_id+","+info.id+","+sp+","+build;
				console.log(tableData);
				showMask();
				$.ajax({
					type: 'POST',
					url: '../ReportMgrServlet',
					dataType: 'json',
					data: {
						type:"addReport",
						tableData:JSON.stringify(tableData)
					},
					error : function(msg) {
						errMessage("请求ReportMgrServlet失败");
						hidMask();
				    },
					success : function(json) {   
						hidMask();
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								//successMessage("保存失败");
								break;
							case 2:
								errMessage("服务器出错");
								break;
							case 3:
								errMessage("报告生成失败");
								break;
							default:
								break;
							}
						 }else{
							 successMessage("添加成功！")
							 tableData = json.obj;
							 addTableRow();
							 $('#rgw').dialog('close');
						 }
					}
				});
				
			} */
			
			function addTableRow(){
				table.row.add(tableData).draw(false);
			}
			
		
			
			
			
			
			function formatBuild( d ){
				d=d.replace('1', '结构封面');
				d=d.replace('4', '检查记录');
				d=d.replace('5', '结构卡片');
				d=d.replace('6', '结构概述');
				d=d.replace('2', '04规范');
				d=d.replace('3', '11规范');
				return d;
			}
			
			$("#orgType").on('click',function(){
				var chioceType=$("#chioceType").val();
				var orgId=$("#orgType").val();
				var prj=$("#prj").html('');
				$.ajax({
					type: 'POST',
					url: '../StatisticsServlet',
					dataType: 'json',
					data: {
						type:"chioceProject",
						chioceType:chioceType,
						orgId:orgId
					},
					error : function(msg) {
						errMessage("请求ReportMgrServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								//successMessage("无数据");
								break;
							case 2:
								errMessage("服务器出错");
								break;
							case 3:
								//successMessage("！");
								break;
							default:
								break;
							}
						 }else{
								for(var i=0;i<json.obj.length;i++){
									prj.append("<option value='"+json.obj[i].prj_id+"' data-chk='"+json.obj[i].chk_type+"'>"+json.obj[i].prj_desc+"</option>");
								}	
								prj.select2();
						 }
					}
				});
			});
			
			$("#chioceType").on('click',function(){
				var chioceType=$("#chioceType").val();
				var orgId=$("#orgType").val();
				var prj=$("#prj").html('');
				$.ajax({
					type: 'POST',
					url: '../StatisticsServlet',
					dataType: 'json',
					data: {
						type:"chioceProject",
						chioceType:chioceType,
						orgId:orgId
					},
					error : function(msg) {
						errMessage("请求ReportMgrServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								//successMessage("无数据");
								break;
							case 2:
								errMessage("服务器出错");
								break;
							case 3:
								//successMessage("！");
								break;
							default:
								break;
							}
						 }else{
								for(var i=0;i<json.obj.length;i++){
									prj.append("<option value='"+json.obj[i].prj_id+"' data-chk='"+json.obj[i].chk_type+"'>"+json.obj[i].prj_desc+"</option>");
								}	
								prj.select2();
						 }
					}
				});
			});
			
			
			function initCount(){
				var task=$(".task").html('');
				$.ajax({
					type: 'POST',
					url: '../StatisticsServlet',
					dataType: 'json',
					data: {
						type:"reportCount"
					},
					error : function(msg) {
						errMessage("请求StatisticsServlet失败");
				    },
					success : function(json) {
						task.append("<label class='control-label' style='width:18%'>"+"任务编号"+"</label>"+
								"<input type='text' id='taskId' style='width:65%; ' value='"+json.obj+"' disabled='disabled' style='background:#ccc'>")
					}
				});
			}
			
			function initOrg(){
				var orgType=$("#orgType").html('');
					$.ajax({
						type: 'POST',
						url: '../StructMgrServlet',
						dataType: 'json',
						data: {
							type:"initOrg"
						},
						error : function(msg) {
							errMessage("请求ManageOrgMgrServlet失败");
					    },
						success : function(json) {
							if(role=='admin'||role=='guest'||role=='superAdmin'){
								orgType.append("<option value='all'>全部</option>");
							}
							for(var i=0;i<json.obj.length;i++){
								orgType.append("<option id='orgType' value='" + json.obj[i].org_id + "'>" + json.obj[i].org_name + "</option>");
							}
						}
				});
			}
			
			function initPrj(){
				$.ajax({
					type: 'POST',
					url: '../StatisticsServlet',
					dataType: 'json',
					data: {
						type:"initProject"
					},
					error : function(msg) {
						errMessage("请求ReportMgrServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								//successMessage("无数据");
								break;
							case 2:
								errMessage("服务器出错");
								break;
							case 3:
								//successMessage("！");
								break;
							default:
								break;
							}
						 }else{
							 buildPrjComboBox(json.obj);
						 }
					}
				});
			}
			
			function buildPrjComboBox( d ){
				$('#prj').empty();
				for(var i=0;i<d.length;i++){
					$('#prj').append("<option value='"+d[i].prj_id+"' data-chk='"+d[i].chk_type+"'>"+d[i].prj_desc+"</option>");
				}
				$('#prj').select2();
			}
			
			
			function getBuild( $well ){
				var r = "";
				var b = false;
				var s="";
				var x="";
				var w="";
				var aa=$('input:radio:checked').val();
				if(aa=='全部'){
							s='*';
							x='*';
							w='*';
				}else{
					$well.find("input:text").each(function(){
						if($(this).attr("data-span")=="上行"){
							s=$(this).val();
						}
						if($(this).attr("data-span")=="下行"){
							x=$(this).val();
						}
						if($(this).attr("data-span")=="无"){
							w=$(this).val();
						}
					});
				} 
				
				if(s. indexOf("；")>=0){
					s=s.replace(/；/g,";");
				}
				if(x. indexOf("；")>=0){
					x=x.replace(/；/g,";");
				}
				if(w. indexOf("；")>=0){
					w=w.replace(/；/g,";");
				}
				
				$well.find('.sort').find('li').each(function(){
					if(b==false){
						r=r+$(this).attr('data-name');
					}else{
						r=r+"+"+$(this).attr('data-name');
					}
					b = true;
				});
				
				var info = {
					arg: undefined,
					s_spans :undefined,
					x_spans :undefined,
					w_spans :undefined
				}
				info.arg = r;
				info.s_spans = s;
				info.x_spans = x;
				info.w_spans = w;
				info = JSON.stringify(info);
				console.log(info);
				return info;
			}
			
 			function getSp(){
			/* 	var s = "";
				$("#sp").find('input:checked').each(function(){
					s=$(this).attr("data-name");
				}); */
				return '2011';
			} 
			
			
			$('#rgw').dialog({
				autoOpen: false,
				width : 800,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop',
				title:"生成报告",
				buttons:[
					{
						html : "<i class='fa fa-plus'></i>&nbsp; 生成",
						"class" : "btn btn-default",
						click: function() {
							addReport();
						}
					},
			        {
			        	html : "<i class='fa fa-times'></i>&nbsp; 取消",
						"class" : "btn btn-default",
						click: function() {
							$( this ).dialog( "close" );
						}
					}
				]
			});
			$('#rgw').prop('hidden',false);
						
			function newReport() {
				$('#rgw').dialog('open');
			}
			
			
			
			function errMessage(info){
				$.smallBox({
	                title: "处理信息",
	                content: "<i class='fa fa-clock-o'></i> <i>"+info+"</i>",
	                color: "#C46A69",
	                iconSmall: "fa fa-times fa-2x fadeInRight animated",
	                timeout: 3000
	            });
			}
			
			function successMessage(info){
				$.smallBox({
	                title: "处理信息",
	                content: "<i class='fa fa-clock-o'></i> <i>"+info+"</i>",
	                color: "#659265",
	                iconSmall: "fa fa-times fa-2x fadeInRight animated",
	                timeout: 3000
	            });
			}
			
			
			
			function stepInit() {
	            $('#step1-next').on('click', function () {
                    $('#step1').slideUp('normal', 'swing');
                    $('#step2').slideDown('normal', 'swing', function(){
                    	initStructTable();
                    });
                    $('#step1-state').removeClass('fa-info').addClass('fa-check');
                   
	            });

	            $('#step2-previous').on('click', function () {
	                $('#step1').slideDown('normal', 'swing');
	                $('#step2').slideUp('normal', 'swing');
	                $('#step2-state').removeClass('fa-check').addClass('fa-info');
	            });

	            $('#step2-next').on('click', function () {
	            	
					var area=$('.checkbox-inline').find("input[type='checkbox']").is(':checked');
					if(area==false){
						errMessage('请选择结构物');
						return;
					}
	                $('#step2').slideUp('normal', 'swing');
	                $('#step3').slideDown('normal', 'swing', function(){
                    	buildReportArea();
                    });
	                $('#step2-state').removeClass('fa-info').addClass('fa-check');
	            });

	            $('#step3-previous').on('click', function () {
	                $('#step2').slideDown('normal', 'swing');
	                $('#step3').slideUp('normal', 'swing');
	                $('#step3-state').removeClass('fa-check').addClass('fa-info');
	            });

	            $('#step-finish').on('click', function () {
	            	var flag=true;
	            	if($('.range').parent().parent().find('input:radio:checked').val()=="跨选择"){
		            	$('.range').parent().find('input:text').each( function(){
							var spanStr = this.value;
							if(spanStr==''){
								errMessage('不能为空');
								flag=false;
								return flag;
							}
							if(spanStr. indexOf("；")>=0){
								spanStr=spanStr.replace(/；/g,";");
							}
							var spanvalue=$(this).attr('placeholder');
							var spanMax=Number($(this).attr('placeholder').split('-')[1]);
							var length=0;
							var length1=0;
								for(var i=0;i<spanStr.length;i++){
									if(spanStr.charAt(i)=='-'){
										length++;
									}
								}
								for(var j=0;j<spanStr.length;j++){
									if(spanStr.charAt(j)==';'){
										length1++;
									}
								}
								
								if(length==1){
									if(length-length1!=1){
										errMessage('跨输入格式有错');
										flag=false;
										return flag;
									}
									spanMin0 = Number(spanStr.split('-')[0]);
									spanMax0 = Number(spanStr.split('-')[1]);
									if(spanMin0<1 || spanMin0>spanMax0){
										errMessage('跨输入格式有错');
										flag=false;
										return flag;
									}
									if(spanMax0>spanMax){
										errMessage('跨输入格式有错');
										flag=false;
										return flag;
									}
								}else if(length==0){
									if(Number(spanStr)>spanMax){
										errMessage('跨输入格式有错');
										flag=false;
										return flag;
									}
								}else{
									if(length1!=length-1){
										errMessage('跨输入格式有错');
										flag=false;
										return flag;
									}
									for(var c=0;c<=length1;c++){
										var span1=spanStr.split(';')[c];
										var span1Min=span1.split('-')[0];
										var span1Max=span1.split('-')[1];
										if(span1Min<1 || span1Min>span1Max){
											errMessage('跨输入格式有错');
											flag=false;
											return flag;
										}
										if(span1Max>spanMax){
											errMessage('跨输入格式有错');
											flag=false;
											return flag;
										}
										if(c<length1){
											var span2=spanStr.split(';')[c+1];
											var span2Min=span2.split('-')[0];
											var span2Max=span2.split('-')[1];
											if(span1Max>span2Min){
												errMessage('跨输入格式有错');
												flag=false;
												return flag;
											}
										}
									}
								}
						});
	            	}
	            	if(flag){
	            		addReports();
	            	}
	            });
	        }
			
			/* tableData.report_build = build;
				tableData.report_sp = sp;
				tableData.report_file_name = name;
				tableData.prj_id = prj_id;
				tableData.prj_name = $("#prj option[value='"+prj_id+"']").html();
				tableData.struct_id = info.id;
				tableData.struct_mode = info.mode;
				ParaMsg = "2,"+prj_id+","+info.id+","+sp+","+build; */
			
			function tiaoZhuan(){
					location.href='reportMgrAll.jsp';
				}
				
			function addReports(now){
					
				if(now==undefined){
					now = 0;
				}
				var $area = $('#reportArea').find('.well');
				var sum = $area.length;
				if(sum==0){
					errMessage('请返回上一部选择结构物');
					return;
				}
				
				if(now>=sum){
								
					successMessage("添加任务成功,即将跳转至报告列表。。");
					myTool.mask.hide();
					
					
					setTimeout(function(){//两秒后跳转
					   location.href = "reportMgrAll.jsp";//PC网页式跳转
					  },3000)
					
					return;
				}
				var $well = $area.eq(now);
				now++;
				var reportInfo = {};

				var b=false;
				var kuaSpan;
				var report_file_name= $well.attr('data-name');
				if($well.find('input:radio:checked').val()=="全部"){
					report_file_name = report_file_name;
				}else{
					$well.find('input:text').each( function(){
				
					if(b==false){
						kuaSpan=$(this).attr("data-span")+":"+$(this).val();
						report_file_name=report_file_name+"("+kuaSpan+")";
						}else{
						kuaSpan=$(this).attr("data-span")+":"+$(this).val();
							report_file_name=report_file_name+"("+kuaSpan+")";
					}
					b = true;
					});
			}
				console.log(report_file_name);
				reportInfo.prj_id = $('#prj').val();
				reportInfo.prj_name = $("#prj option[value='"+reportInfo.prj_id+"']").html();
				reportInfo.chk_type = $("#prj option[value='"+reportInfo.prj_id+"']").attr('data-chk');
				reportInfo.struct_id = $well.attr('data-id');
				reportInfo.report_file_name = report_file_name;
				reportInfo.struct_mode = $well.attr('data-mode');
				reportInfo.report_sp = "报告";
				reportInfo.report_build = getBuild($well);
				console.log('添加生成任务第'+now+'个，共'+sum+'个，当前'+reportInfo.report_file_name);
				//测试
		//		addReports(now);
		//		return;
				 myTool.mask.show('添加生成任务第'+now+'个，共'+sum+'个，当前'+reportInfo.report_file_name); 
				 $.ajax({
					type: 'POST',
					url: '../ReportMgrServlet',
					dataType: 'json',
					aynsc: false,
					data: {
						type:"addReport",
						tableData : JSON.stringify(reportInfo),
						taskId:$("#taskId").val()
					},
					error : function(msg) {
						errMessage("请求ReportMgrServlet失败");
						/* hidMask(); */
				    },
					success : function(json) {   
						 hidMask(); 
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								successMessage("生成失败");
								break;
							case 2:
								errMessage("服务器出错");
								break;
							case 3:
								errMessage("报告生成失败");
								break;
							default:
								break;
							}
						 }else{
							 /* successMessage("添加任务成功"); */
						 }
						addReports(now);
					}
				}); 
			}
			
				
			function buildReportArea(){
				$('#reportArea').empty();
				var data = structTable.data();
				var structs = [];
				for(var i=0;i<data.length;i++){
					if(data[i].state){
						structs.push(data[i]);
					}
				}
				if(structs.length==0){
					errMessage('未选择任何结构物！');
					return;
				}
				console.log(structs);
				for(var i=0;i<structs.length;i++){
					buildStructArea(structs[i]);
				}
			}
			
			function buildStructArea(struct){
				if(struct.stub_no==undefined){
					struct.stub_no = "";
				}
				 $.ajax({
						type: 'POST',
						url: '../ReportMgrServlet',
						dataType: 'json',
						data: {
							type:"getDircetionSpan",
							struct : JSON.stringify(struct)
						},
						error : function(msg) {
							errMessage("请求ReportMgrServlet失败");
					    },
						success : function(json) {
							console.log(json.obj);
							var name = struct.struct_name+"（"+struct.stub_no+"）";
							var dom = $('<div class="well col-xs-12" style="" data-id="'+struct.struct_id+'" data-name="'+name+'" data-mode="'+struct.struct_mode+'">'+
		                    		'<div class="form-group col-xs-12"  style="padding: 0">'+
		                			'<label style="font-size: 18px;font-weight: bold;">'+struct.struct_no+'-'+struct.struct_name+'：</label>'+
									'<div class="col-md-12 form-inline">'+
									'<label class="control-label">报告组成</label>'+
										'<label class="checkbox">'+
											  '<input type="checkbox" class="checkbox style-0"  data-name="1" checked="checked" data-value="封面">'+
											  '<span>结构封面</span>'+
										'</label>'+
										'<label class="checkbox">'+
											  '<input type="checkbox" class="checkbox style-0" data-name="5" checked="checked" data-value="检查记录">'+
											  '<span>结构卡片</span>'+
										'</label>'+
										'<label class="checkbox">'+
											  '<input type="checkbox" class="checkbox style-0" data-name="2" checked="checked" data-value="部件评定结果报告">'+
											  '<span>04规范</span>'+
										'</label>'+
										'<label class="checkbox">'+
											  '<input type="checkbox" class="checkbox style-0" data-name="3" checked="checked" data-value="总体评定结果报告">'+
											  '<span>11规范</span>'+
										'</label>'+
										'<label class="checkbox">'+
											  '<input type="checkbox" class="checkbox style-0"  data-name="6" checked="checked" data-value="封面">'+
											  '<span>结构概述</span>'+
										'</label>'+
										'<label class="checkbox">'+
											  '<input type="checkbox" class="checkbox style-0" data-name="4" checked="checked" data-value="检查记录">'+
											  '<span>检查记录</span>'+
										'</label>'+
									'</div>'+
								'</div>'+
								'<div class="form-group col-xs-12 sp"  style="padding: 0;">'+
									'<div class="col-md-12" >'+
									'<label class="control-label">报告排序</label>'+
										'<ul  class="sort" style="height: auto;width: auto;display: inline-block;">'+
											'<li class="btn btn-default" data-name="1">结构封面</li>'+
											'<li class="btn btn-default" data-name="5">结构卡片</li>'+
											'<li class="btn btn-default" data-name="2">04规范</li>'+
											'<li class ="btn btn-default" data-name="3">11规范</li>'+
											'<li class="btn btn-default" data-name="6">结构概述</li>'+
											'<li class="btn btn-default" data-name="4">检查记录</li>'+
										'</ul>'+
									'</div>'+
								'</div>'+		
		 						'<div class="form-group col-xs-12"  style="padding: 0;margin-bottom: 0;">'+
		 							'<div class="direction col-md-12 form-group" >'+
			 							'<label class="radio radio-inline" style="margin-top: 0;">'+
										'<input type="radio" class="radiobox" id="allRadio" name="'+struct.struct_id+'" value="全部" checked="checked">'+
										'<span>全部</span>'+
										'</label>'+
										'<label class="radio radio-inline" style="margin-top: 0;">'+
										'<input type="radio" class="radiobox" id="kuaRadio" value="跨选择">'+
										'<span>跨选择</span>'+
										'</label>'+
		 							'</div>'+
		 							'<div class="span-range col-md-12 form-group" >'+
		 								'<div class="form-inline range">'+
		 								'</div>'+
	 								'</div>'+
								'</div>	'+
		                	'</div>');
							for(var dir in json.obj){
								dom.find(".range").append(
 	 									'<label>'+dir+'：</label>'+
 	 									'<input type="text" class="form-control" style="width: 250px; " disabled="disabled" style="background:#CCCCCC" data-span="'+dir+'" value="1-'+json.obj[dir]+'">'
 	 								);
							}
						//	for(var dir in json.obj){
						//		dom.find('.direction').append('<label class="radio radio-inline">'+
						//		'<input type="radio" class="radiobox" name="'+struct.struct_id+'" value="'+dir+'" data-span="'+json.obj[dir]+'">'+
						//		'<span>'+dir+'</span>'+
						//		'</label>');
// 								dom.find('.span-range').append('<div class="form-inline">'+
// 	 									'<label>'+dir+'：</label>'+
// 	 									'<input type="text" class="form-control" style="width: 700px; " value="'+json.obj[dir]+'">'+
// 	 								'</div>');
						//	}
							$('#reportArea').append(dom);
							if(struct.struct_mode!='bridge'){
								dom.find('input[data-name="2"]').click().prop('disabled', 'disabled');
								dom.find('input[data-name="3"]').click().prop('disabled', 'disabled');
//		 						dom.find('input[data-name="6"]').click().prop('disabled', 'disabled');
							}
							var chk_type = $("#prj option[value='"+$('#prj').val()+"']").attr('data-chk');
							if(chk_type=='often'){
								dom.find('input[data-name="2"]').click().prop('disabled', 'disabled');
								dom.find('input[data-name="3"]').click().prop('disabled', 'disabled');
							}
							if(chk_type=='daily'){
								dom.find('input[data-name="1"]').click().prop('disabled', 'disabled');
								dom.find('input[data-name="2"]').click().prop('disabled', 'disabled');
								dom.find('input[data-name="3"]').click().prop('disabled', 'disabled');
								dom.find('input[data-name="5"]').click().prop('disabled', 'disabled');
								dom.find('input[data-name="6"]').click().prop('disabled', 'disabled');
							}
							dom.find('input:radio').on('change', function(){
								var dir = this.value;
						//		var spanMax = $(this).attr('data-span');
								if(dir=='全部'){
									dom.find('.span-range').html('');
									var fatherDiv = $(this).parent().parent();
									dom.find('.span-range').append('<div class="form-inline range">'+'</div>');
									for(var dir in json.obj){
										$($(fatherDiv).parent()).find(".range").append(
		 	 									'<label>'+dir+'：</label>'+
		 	 									'<input type="text" class="form-control" style="width: 250px; " disabled="disabled" style="background:#CCCCCC" data-span="'+dir+'" value="1-'+json.obj[dir]+'">'
		 	 								);
									};
									$(fatherDiv.find('input')[1]).attr("checked",false);
									//$("#kuaRadio").attr("checked",false);
									return false;
								}else{
									
									var fatherDiv = $(this).parent().parent();
									dom.find('.span-range').html('');
									dom.find('.span-range').append('<div class="form-inline range">'+'</div>');
									for(var dir in json.obj){
										$($(fatherDiv).parent()).find(".range").append(
		 	 									'<label>'+dir+'：</label>'+
		 	 									'<input type="text" class="form-control" style="width: 250px; " data-span="'+dir+'" placeholder="1-'+json.obj[dir]+'">'
		 	 								);
									};
									
									$(fatherDiv.find('input')[0]).attr("checked",false)
									//$($(this).prev()).attr("checked",false);
									//$("#allRadio").attr("checked",false);
									
								}
							});
							dom.find( ".sort" ).sortable({
								snap: true,
						    	containment: "parent",
						    	grid: [ 30, 110 ],
						    	scroll: false
						    });
						}
					}); 
			}
			
			
			var con;
			
			var structTable = $('#structTable').DataTable( {
				"deferRender": true,
				"processing": true,
		    	"sDom": 
					"t"+
					"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
		        "bDestroy": true,
		        "iDisplayLength": 7,
		        "autoWidth" : false,
				"bScrollCollapse" : true,
				"sScrollY" : 400, 
		        "oLanguage": {
				    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
				},
		        "columns": [
		        	{ "data": "state", 'orderable': false },
		        	{ "data": "struct_no" },
		            { "data": "struct_name" },
		            { "data": "struct_mode", 'visible': false },
		            { "data": "highway_name" },
		            { "data": "stub_no", 'orderable': false },
		            { "data": "manage_short_name" },
		            { "data": "section_name" },
		            { "data": "zone_name" },
		            { "data": null, 'visible': false },
		            { "data": null, 'visible': false }
		        ],
		        "columnDefs": [ 
		        	 {	
		        		  "class": "tcenter",
					      "targets": 0,
					      "searchable": true,
					      "render": function(data, type, full) {
					    	  	if(data==false){
					    	  		return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox"><span></span></label>';
					    	  	}else{
					    	  		return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox" checked><span></span></label>';
					    	  	}
					          }
					    },
		        	 {
					      "targets": 3,
					      "searchable": true,
					      "render": function(data, type, full) {
					    	  	if(data=="bridge"){
					    	  		return '桥梁';
					    	  	}
					    	  	if(data=="pass"){
					    	  		return '通道';
					    	  	}
					    	  	if(data=="culvert"){
					    	  		return '涵洞';
					    	  	}
					          }
					    },
		        	 {
					      "targets": 5,
					      "searchable": true,
					      "render": function(data, type, full) {
					    	  	if(data==undefined){
					    	  		return '--';
					    	  	}
					    	  	return data;
					          }
					    },
				    {
					      "targets": 9,
					      "searchable": true,
					      "render": function(data, type, full) {
					    	  try{
					    		 	var s = full.stub_no;
						            var pre = Number(s.substring(s.indexOf('K')+1,s.indexOf('+')))*1000;
						            var stuff = Number(s.substring(s.indexOf('+')+1));
						            var stub_trace = Number(pre+stuff);
						            if(isNaN(stub_trace)){
						            	return '';
						            }else{
						            	return stub_trace;
						            }
					    	  }catch(e){
					    		  return '';
					    	  }
					          }
					    },{
						      "targets": 10,
						      "searchable": true,
						      "render": function(data, type, full) { 
						    	  	return full.state;
						          }
						    }],
		        "order": [[1, 'asc']],
		        "oLanguage": { //国际化配置  
	                "sProcessing" : "正在获取数据，请稍后...",    
	                "sLengthMenu" : "显示 _MENU_ 条",    
	                "sZeroRecords" : "查询不到相关数据",    
	                "sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",    
	                "sInfoEmpty" : "记录数为0",    
	                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",    
	                "sInfoPostFix" : "",    
	                "sSearch" : "搜索",    
	                "sUrl" : "",    
	                "oPaginate": {    
	                    "sFirst" : "第一页",    
	                    "sPrevious" : "上一页",    
	                    "sNext" : "下一页",    
	                    "sLast" : "最后一页"    
	         		}  
		     	}
		    } );
	
	 $(".hasinput").on( 'change', function () {
		 structTable
	            .column( $(this).parent().index()+':visible' )
	            .search( this.value )
	            .draw(false);
	    } );
	 
	 $('#structTable').on('draw.dt',function() {
		 autoChk();
        });
	 
	 $('#structTable').delegate('.cbox', 'change', function(){
		 var state = $(this).prop('checked');
		 var tr = $(this).closest('tr');
		 structTable.row(tr).data().state=state;
		 autoChk();
		 structTable.cell(tr, 10).data(state);
		 
	 });
	 $('#autoChk').on('click', function(){
		 var s = $(this).prop('checked');
		$('#structTable .cbox').prop('checked', s).trigger('change');
	 });
	 
	 function autoChk(){
		 var s = true;
        $('#structTable').find('.cbox').each(function(){
        	if($(this).prop('checked')==false){
        		s=false;
        		return false;
        	}
        });
       $('#autoChk').prop('checked', s);
	 }
	
	function orderStub(){
		structTable
	    .column( '9' )
	    .order( 'asc' )
	    .draw( false );
	}
	function searchMode( d ){
		structTable
	    .column( '3' )
	    .search( d )
	    .draw ( false );
	}
	
	
	function initStructTable(){
		$.ajax({
			type: 'POST',
			url: '../ReportMgrServlet',
			dataType: 'json',
			data: {
				type:"initBridgeTable",
				prj_id: $('#prj').val()
			},
			error : function(msg) {
				errMessage("请求ReportMgrServlet失败");
				$('#structTable').dataTable().fnClearTable();
		    },
			success : function(json) {
				$('#structTable').dataTable().fnClearTable();
				 if(json.success=="fail"){
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
				 }else{
					 structTable.rows.add(json.obj).draw( false );
				 }
			}
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
				
			}
			function releaseMember(){//项目参与人
				
			}
			function releaseGuest(){//普通用户
				
			}
		</script>
	</body>
</html>