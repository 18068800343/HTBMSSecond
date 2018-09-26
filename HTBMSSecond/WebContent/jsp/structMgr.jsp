<%@page import="hs.bm.vo.OperationConstruct"%>
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
		<style>
/* 	 	table{
			table-layout: fixed;
		} 

 		td{
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
		}  */
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
					<li>结构</li>
				</ol>
				<!-- end breadcrumb -->

			</div>
			<!-- END RIBBON -->
			
			<!-- #MAIN CONTENT -->
			<div id="content">
				<section id="widget-grid">
					<div class="row">
					
						
						<%@include file="currentStruct.jsp" %>
					
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
									<h2>结构</h2>
				
								</header>
				
								<!-- widget div-->
								<div class="row">
				
									<!-- widget content -->
									<div class="widget-body no-padding">
								<!-- 		<div class="widget-body-toolbar bg-color-white">
										</div> -->
										
										
										
										<div class="col-xs-12" style="display: block;">
										<div class="panel panel-default" >
											<div class="panel-heading">
												<div class="panel-title"  >
													高级检索
													<div id="tabBtn" style="position: absolute;top: 5px;right: 170px;height: 32px;"></div>
													<button class="fa fa-search" style="position: absolute;top: 5px;right: 103px;height: 32px;" onclick="search()">检索</button>
													<button class="fa fa-angle-up" style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;display: none;" data-toggle="collapse" data-parent="#accordion" data-target ="#collapseOne"></button>
													<button class="fa fa-angle-down" style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;" data-toggle="collapse" data-parent="#accordion" data-target ="#collapseOne"></button>
												</div>
											</div>
											<div id="collapseOne" class="panel-collapse collapse out">
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
														<select style="width:100%" class="form-control input-sm select2"  id="project" >
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>结构分类</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="struct_mode" >
															<option value='bridge'>桥梁</option>
															<option value='pass'>通道</option>
															<option value='culvert'>涵洞</option>
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>路线</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="line" >
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>管养单位</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="manage" >
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>所属路段</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="section" >
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>所属分区</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="zone" >
														</select>
													</div>
													<div class="bridge-show form-group col-xs-12 col-sm-6 col-lg-4">
														<label>桥梁类型</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="bridge_type" >
														</select>
													</div>
													<div class="pass-show form-group col-xs-12 col-sm-6 col-lg-4" style="display: none;">
														<label>通道类型</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="pass_type" >
														</select>
													</div>
													<div class="culvert-show form-group col-xs-12 col-sm-6 col-lg-4" style="display: none;">
														<label>涵洞类型</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="culvert_type" >
														</select>
													</div>
													<div class="bridge-show form-group col-xs-12 col-sm-6 col-lg-4">
														<label>桥梁分类</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="bridge_mode" >
															<option value='%'>全部</option>
															<option>特大桥</option>
															<option>大桥</option>
															<option>中桥</option>
															<option>小桥</option>
														</select>
													</div>
													<div class="bridge-show form-group col-xs-12 col-sm-6 col-lg-4">
														<label>功能分类</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="function_type" >
															<option value='%'>全部</option>
															<option>主线桥</option>
															<option>匝道桥</option>
															<option>支线上跨桥</option>
															<option>其他</option>
														</select>
													</div>
													<div class="pass-show form-group col-xs-12 col-sm-6 col-lg-4" style="display: none;">
														<label>使用类型</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="use_type" >
															<option value='%'>全部</option>
															<option>机耕通道</option>
															<option>人行通道</option>
															<option>汽车通道</option>
														</select>
													</div>
													<div class="prj-show form-group col-xs-12 col-sm-6 col-lg-4" style="display: none;">
														<label>检查状态</label> 
														<select class="input-sm form-control hasinput select2" id="check_state">
															<option value="%">全部</option>
															<option value="0">未完成</option>
															<option value="1">待审核</option>
															<option value="2">已审核</option>
														</select>
													</div>
													<div class="prj-bridge-show form-group col-xs-12 col-sm-6 col-lg-4" style="display: none;">
														<label>评定状态</label> 
														<select class="input-sm form-control hasinput select2" id="eval_state">
															<option value="%">全部</option>
															<option value="0">未完成</option>
															<option value="1">待评定</option>
															<option value="2">已评定</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										</div>
										
										
										
										<table id="structTable" class="table table-striped table-bordered table-hover" style="width: 100%">
											<thead>
												<tr>
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
														<input type="text" class="form-control hasinput" placeholder="检索" />
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
														<a class="btn btn-sm btn-success disabled addStruct" onclick="newData()">增加</a>
													</th>
												</tr>	 
												<tr>
													<th>结构编号</th>
													<th>结构名称</th>
													<th>路线名称</th>
													<th>中心桩号</th>
													<th>管养单位</th>
													<th>所属路段</th>
													<th>所属分区</th>
													<th style="width: 60px;">操作</th>
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
						
						</article>
						<!-- WIDGET END -->
								
					</div>
				</section>
			</div>
			<!-- END #MAIN CONTENT -->
		</div>
		<!-- END #MAIN PANEL -->
		
		<%@ include file="footer.jsp" %>
		
		
		
			<div id="opera" style="display: none;">
				<div class="text-align-center" id="btn">
					<button class="btn btn-default" onclick="location.href='brgCard.jsp#add=true'">增加桥梁</button>
					<button class="btn btn-default" onclick="location.href='passCard.jsp#add=true'">增加通道</button>
					<button class="btn btn-default" onclick="location.href='culCard.jsp#add=true'">增加涵洞</button>
				</div>
			</div>
			<div id="opera2">
			 
				<div class="text-align-left" id="btn2">
				<label>项目</label>  
                                                <select class="select2-selection select2-selection--single pull-right" 
                                                        onchange="reloadData(this)" id="typeQuery">
                                                    <option value="%">全部</option>
                                                    <option value="regular">定期检查</option>
													<option value="special">特殊检查</option>
													<option value="often">经常检查</option>
													<option value="daily">日常检查</option>
                                                </select>
					<select style="width:100%" class="form-control input-sm select2"  id="historyPro" >
														</select>
				</div>
			</div>
			
		<div id="cover" class="cover">		
			<div id="loading" class="loading">处理中...
			</div> 	
		</div>
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
		<script src="../js/plugin/datatables/dataTables.buttons.min.js" ></script>
		<script src="../js/plugin/datatables/buttons.html5.min.js" ></script>
		<script src="../js/plugin/datatables/buttons.flash.min.js" ></script>
		<script src="../js/plugin/datatables/jszip.min.js"></script>
		<script src="../js/jquery.cookie.js"></script>
		
		<script type="text/javascript">
	
			var structSearchInfo = $.cookie('structSearchInfo');
			$(document).ready(function() {
				if(structSearchInfo!=undefined &&  structSearchInfo!=''){
					structSearchInfo=JSON.parse(structSearchInfo);
					$('#struct_mode').val(structSearchInfo.struct_mode).trigger('change');
					$('#bridge_mode').val(structSearchInfo.bridge_mode).trigger('change');
					$('#function_type').val(structSearchInfo.function_type).trigger('change');
					$('#use_type').val(structSearchInfo.use_type).trigger('change');
					$('#check_state').val(structSearchInfo.check_state).trigger('change');
					$('#eval_state').val(structSearchInfo.eval_state).trigger('change');
				}
				//initCheckType();
				pageSetUp();
				initTable();
		 		line.init();
				project.init();
				manage_ss.init(); 
				
				structBaseDef.init();
				//$('#qqq').html("<a class='btn btn-primary btn-xs' href='brgCard.jsp'''>查看卡片</a> <a class='btn btn-primary btn-xs' href='brgMember.jsp'>查看构件</a>");
				
			});
			
			
			
			var role = '<%=session.getAttribute("userRole")%>';
			
			
			$('#opera').dialog({
				autoOpen: false,
				width : 500,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
			

			$('#opera2').dialog({
				autoOpen: false,
				width : 500,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
			$('#struct_mode').on('change', function(){
				var d = $(this).val();
				if(d=="bridge"){
					$('.bridge-show').show();
					$('.pass-show').hide();
					$('.culvert-show').hide();
					
					if($('#project').val()!='0'){
						$('.prj-bridge-show').show();
					}else{
						$('.prj-bridge-show').hide();
					}
				}else if(d=="pass"){
					$('.bridge-show').hide();
					$('.pass-show').show();
					$('.culvert-show').hide();
					$('.prj-bridge-show').hide();
				}
				else if(d=="culvert"){
					$('.bridge-show').hide();
					$('.pass-show').hide();
					$('.culvert-show').show();
					$('.prj-bridge-show').hide();
				}
			});
			
			$('#project').on('change', function(){
				var d = $(this).val();
				if(d=="0"){
					$('.prj-show').hide();
					$('.prj-bridge-show').hide();
				}else{
					$('.prj-show').show();
					if($('#struct_mode').val()=='bridge'){
						$('.prj-bridge-show').show();
					}else{
						$('.prj-bridge-show').hide();
					}
				}
				
			});
			
			
			function search(){
				var other=$('#function_type').val();
				if(other=="其他"){
					other="";
				}
				var info = {
						project: $('#project').val(),
						line: $('#line').val(),
						section: $('#section').val(),
						manage: $('#manage').val(),
						zone: $('#zone').val(),
						struct_mode: $('#struct_mode').val(),
						struct_type: getStructType(),
						bridge_mode: $('#bridge_mode').val(),
						function_type:other,
						use_type: $('#use_type').val(),
						check_state: $('#check_state').val(),
						eval_state: $('#eval_state').val()
				}
				$.cookie('structSearchInfo', JSON.stringify(info));
				showMask();
				$.ajax({
					type: 'POST',
					url: '../StructMgrServlet',
					dataType: 'json',
					data: {
						type:"searchStruct",
						info: JSON.stringify(info)
					},
					error : function(msg) {
						errMessage("请求StructMgrServlet失败");
						$('#structTable').dataTable().fnClearTable();
						hidMask();
				    },
					success : function(json) { 
						$('#structTable').dataTable().fnClearTable();
						//$('#structTable').dataTable().destroy();
						 //$('#structTable').empty();
						table.rows.add(json.obj).draw(false);
						
						hidMask();
					}
				});
			}
			
			function getStructType(){
				var md = $('#struct_mode').val();
				return $('#'+md+'_type').val();
			}
			
			//项目
			var project = {
					data: [],
					init: function(){
						$.ajax({
							type: 'POST',
							url: '../StatisticsServlet',
							dataType: 'json',
							data: {
								type:"initProject"
							},
							error : function(msg) {
								errMessage("请求StatisticsServlet失败");
						    },
							success : function(json) {
								project.data = json.obj;
								project.build();
								$('#chk_type').on('change', function(){
									project.build();
								});
							}
						});
					},
					build: function(){
						var chk_type = $('#chk_type').val();
						var d = $('#project');
						d.empty();
						d.append('<option value="0">--不参与--</option>');
						for(var i = 0; i<project.data.length; i++){
							if(chk_type=='%' || chk_type==project.data[i].chk_type){
								d.append('<option value="'+project.data[i].prj_id+'">'+project.data[i].prj_desc+'</option>');
							}
						}
						if(structSearchInfo!=undefined && structSearchInfo!=''){
							d.val(structSearchInfo.project);
						}
						d.trigger('change');
					},
					getId: function(){
						return $('#project').val();
					},
					getName: function(){
						var d = project.getId();
						for(var i = 0; i<project.data.length; i++){
							if(d==project.data[i].prj_no){
								return project.data[i].prj_desc;
							}
						}
						return '全部';
					}
			}
			
			
			//路线
			var line = {
					data: [],
					init: function(){
						$.ajax({
							type: 'POST',
							url: '../LineMgrServlet',
							dataType: 'json',
							data: {
								type:"initTable"
							},
							error : function(msg) {
								errMessage("请求LineMgrServlet失败");
						    },
							success : function(json) {   
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
									 line.data = json.obj;
									 line.buileLine();
								 }
							}
						});
					},
					buileLine: function(){
						var d = $('#line');
						d.empty();
						d.append('<option value="%">--全部--</option>');
						for(var i=0;i<line.data.length;i++){
							 d.append("<option value='"+line.data[i].highway_id+"'>"+line.data[i].highway_name+"</option>");
						 }
						if(structSearchInfo!=undefined && structSearchInfo!=''){
							d.val(structSearchInfo.line);
						}
						d.trigger('change');
						initCount++;
					}
			}
			
			
			
			
			var manage_ss = {
					manageData: undefined,
					sectionData: undefined,
					zoneData: undefined,
					init: function(){
						this.initManage();
						this.initSection();
						this.initZone();
						$('#manage').on('change', function(){
							manage_ss.buildSection();
							manage_ss.buildZone();
						});
					},
					initManage: function(){
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
								 if(json.success=="fail"){
									 switch (json.error) {
										case 1:
											break;
										case 2:
											errMessage("服务器错误");
											break;
										default:
											break;
										}
								 }else{
									 manage_ss.manageData = json.obj;
									 manage_ss.buildManage();
								 }
							}
						});
					},
					buildManage: function(){
						
						var d = $('#manage');
						d.empty();
						if(role=='admin'||role=='guest'||role=='superAdmin'){
							d.append('<option value="%">--全部--</option>');
						}
						for(var i=0;i<manage_ss.manageData.length;i++){
							 d.append("<option value='"+manage_ss.manageData[i].org_id+"'>"+manage_ss.manageData[i].org_name_short+"</option>");
						 }
						if(structSearchInfo!=undefined && structSearchInfo!=''){
							d.val(structSearchInfo.manage);
						}
						d.trigger('change');
						initCount++;
					},
					initSection: function(){
						$.ajax({
							type: 'POST',
							url: '../StructMgrServlet',
							dataType: 'json',
							data: {
								type:"initSection"
							},
							error : function(msg) {
								errMessage("请求ManageSectionMgrServlet失败");
						    },
							success : function(json) {   
								 if(json.success=="fail"){
									 switch (json.error) {
									case 1:
										break;
									case 2:
										errMessage("服务器错误");
										break;
									default:
										break;
									}
								 }else{
									 manage_ss.sectionData = json.obj;
									 manage_ss.buildSection();
								 }
							}
						});
					},
					buildSection: function(){
						var mg = $('#manage').val();
						if(manage_ss.sectionData==undefined || mg==null){
							setTimeout(function() {
								manage_ss.buildSection();
							}, 1500);
							return;
						}
						var d = $('#section');
						d.empty();
						d.append('<option value="%">--全部--</option>');
						for(var i=0;i<manage_ss.sectionData.length;i++){
							if(mg=='%' || mg==manage_ss.sectionData[i].org_id){
								 d.append("<option value='"+manage_ss.sectionData[i].section_id+"'>"+manage_ss.sectionData[i].section_name+"</option>");
							}
						 }
						if(structSearchInfo!=undefined && structSearchInfo!=''){
							d.val(structSearchInfo.section);
						}
						d.trigger('change');
						initCount++;
					},
					initZone: function(){
						$.ajax({
							type: 'POST',
							url: '../StructMgrServlet',
							dataType: 'json',
							data: {
								type:"initZone"
							},
							error : function(msg) {
								errMessage("请求ManageZoneMgrServlet失败");
						    },
							success : function(json) {   
								 if(json.success=="fail"){
									 switch (json.error) {
									case 1:
										break;
									case 2:
										errMessage("服务器错误");
										break;
									default:
										break;
									}
								 }else{
									 manage_ss.zoneData = json.obj;
									 manage_ss.buildZone();
								 }
							}
						});
					},
					buildZone: function(){
						var mg = $('#manage').val();
						if(manage_ss.zoneData==undefined || mg==null){
							setTimeout(function() {
								manage_ss.buildZone();
							}, 1500);
							return;
						}
						var d = $('#zone');
						d.empty();
						d.append('<option value="%">--全部--</option>');
						for(var i=0;i<manage_ss.zoneData.length;i++){
							if(mg=='%' || mg==manage_ss.zoneData[i].org_id){
								 d.append("<option value='"+manage_ss.zoneData[i].zone_id+"'>"+manage_ss.zoneData[i].zone_name+"</option>");
							}
						 }
						if(structSearchInfo!=undefined && structSearchInfo!=''){
							d.val(structSearchInfo.zone);
						}
						d.trigger('change');
						initCount++;
					}
					
			}
			
			
			
			var structBaseDef = {
					structTypeData: undefined,
					init:  function(){
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
								structBaseDef.structTypeData = json.obj;
								structBaseDef.buildStructType();
							}
						});
					},
					buildStructType: function(){
						for(var mid in structBaseDef.structTypeData){
							var types = structBaseDef.structTypeData[mid];
							var d = $('#'+mid+'_type');
							d.empty();
							d.append('<option value="%">--全部--</option>');
							for(var i=0;i<types.length;i++){
								 d.append("<option value='"+types[i].id+"'>"+types[i].name+"</option>");
							 }
							if(structSearchInfo!=undefined && structSearchInfo!=''){
								d.val(structSearchInfo.struct_type);
							}
							d.trigger('change');
						}
					}
			}
			
			
			
			
			function newData(){
				$('#opera').dialog({
					title:"选择增加项",
					buttons:[
					        {
					        	html : "取消",
								  "class" : "btn btn-default",
								  click: function() {
								     $( this ).dialog( "close" );
									}
								}
					        ]
				});
				$('#opera').dialog('open');
			}

			
			$.fn.dataTable.Buttons.swfPath = '../js/plugin/datatables/swf/flashExport.swf';
			var editDel = "<div class='text-align-center'><button  class='construct btn btn-warning btn-xs' ><span class='glyphicon glyphicon-cog'></span></button><button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
			var table = $('#structTable').DataTable( {
						"deferRender": true,
						"processing": true,
				    	"sDom": 
							"t"+
							"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
				        "bDestroy": true,
				        "iDisplayLength": 10,
				        "autoWidth" : true,
						"bScrollCollapse" : true,
						"sScrollY" : 500, 
	 					//"orderFixed": [ 8, 'asc' ],
						"orderClasses": true, 
				        "oLanguage": {
						    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
						},
				        "columns": [
				        	{ "data": "struct_no" },
				            { "data": "struct_name" },
				            { "data": "highway_name" },
				            { "data": "stub_no", 'orderable': false },
				            { "data": "manage_short_name" },
				            { "data": "section_name" },
				            { "data": "zone_name" },
				            { "data": null, 'orderable': false },
				            { "data": null, 'visible': false }
				        ],
				        "columnDefs": [ 
				              {
						      "targets": 7,
						      "searchable": false,
						      "render": function(data, type, full) {
						            return editDel;
						          }
						    },
						    {
							      "targets": 8,
							      "searchable": false,
							      "render": function(data, type, full) {
							    	  try{
							    		 	var s = full.stub_no;
							    		 	s = s.replace("k","K");
								            var pre = Number(s.substring(s.indexOf('K')+1,s.indexOf('+')))*1000;
								            var stuff = Number(s.substring(s.indexOf('+')+1));
								            if(pre==0){
								            	pre = "";
								            }
								            var stub_trace = Number(pre+stuff);
								            if(isNaN(stub_trace)){
								            	return 0;
								            }else{
								            	return stub_trace;
								            }
							    	  }catch(e){
							    		  return 0;
							    	  }
							          }
							    }],
				        "order": [[8, 'asc']],
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
				     	},
				     	 "buttons": [
					        	{
					                extend: "csv",
					                text: "导出csv",
					                bom: true,
					                filename: '结构搜索结果',
					                fieldSeparator: ',',
					                exportOptions: {
					                	format: {
					                        header: function ( data) {
					                            return data;
					                        },
					                        body: function ( data, columnIdx, rowIdx, code ) {
								                return data;
								            }
					                    },
					                    columns:[0,1,2,3,4,5,6]
					                }
					            }
					        ]
				    } );
			
			 $(".hasinput").on( 'change', function () {
			        table
			            .column( $(this).parent().index()+':visible' )
			            .search( this.value )
			            .draw(false);
			    } );
			 
			 
			  table.buttons().container().appendTo( $('#tabBtn') );
			    $('.buttons-csv').addClass('btn btn-default');
	/* 		    table.buttons.exportData( {
			        format: {
			            header: function ( data, columnIdx ) {
			                return columnIdx +': '+ data;
			            },
			            body: function ( data, columnIdx, rowIdx, code ) {
			                return columnIdx +': '+ data;
			            }
			        }
			    } ); */
			
			function orderStub(){
				table
			    .column( '8' )
			    .order( 'asc' )
			    .draw( false );
			}
			
			var initCount = 0;
			function initTable(){
				var info;
				if(initCount<4){
					
					setTimeout(function() {
						initTable();
					}, 1500);
					return;
				}
				if(structSearchInfo==undefined || structSearchInfo==''){
					info = {
							bridge_mode: "%",
							check_state: "%",
							eval_state: "%",
							function_type: "%",
							line: $("#line").val(),
							manage: $("#manage").val(),
							project: "0",
							section: $("#section").val(),
							struct_mode: "bridge",
							struct_type: "%",
							use_type: "%",
							zone: $("#zone").val()
					}
				}else{
					info=structSearchInfo;
				}
				showMask();
				$.ajax({
					type: 'POST',
					url: '../StructMgrServlet',
					dataType: 'json',
					data: {
						type:"searchStruct",
						superQueryType:superQueryType,
						info: JSON.stringify(info)
					},
					error : function(msg) {
						errMessage("请求StructMgrServlet失败");
						$('#structTable').dataTable().fnClearTable();
						hidMask();
				    },
					success : function(json) { 
						$('#structTable').dataTable().fnClearTable();
						table.rows.add(json.obj).draw(false);
						hidMask();
					}
				});
			}

			
			var pageId = undefined;
			var pageMode = undefined;
			var pageInfo = undefined; 
           
            
			$('#structTable').delegate('.construct','click', function () {
				pageId = undefined;
				pageMode = undefined;
				pageInfo = undefined;
				
				tr = $(this).closest('tr');
				var data = table.row(tr).data();
				pageId = data.struct_id;
				pageMode = data.struct_mode;
				var info = {
						id: data.struct_id,
						name: data.struct_name,
						no: data.struct_no,
						mode: data.struct_mode,
						span_build: data.span_build,
						stub_no: data.stub_no,
						line_no: data.highway_id,
						line_name: data.highway_name,
						section_id: data.section_id,
						section_name: data.section_name,
						org_id: data.org_id,
						org_name: data.org_name,
						org_name_short: data.org_name_short,
						zone_id: data.zone_id,
						zone_name: data.zone_name
				};
				pageInfo = info;
			
				
				$.ajax({
					type: 'POST',
					url: '../HistoryProJectServlet',
					dataType: 'json',
					data: {
						id: data.struct_id,
						mode: data.struct_mode,
						chkType : '%'
					},
					error : function(msg) {
						errMessage("加载历史相关项目失败");
				    },
					success : function(json) { 
						historyProdata = json.obj;
						var d = $('#historyPro');
						d.empty();
						for(var i = 0; i<historyProdata.length; i++){
							d.append('<option value="'+historyProdata[i].prj_id+'">'+historyProdata[i].prj_desc+'</option>');
						}
						//d.select2();
						d.trigger('change');
						if(historyProdata.length>0){
							$('#opera2').dialog({
								title:"选择项目",
								
								buttons:[
									 {
								        	html : "确认",
											  "class" : "btn btn-default",
											  click: function() {
												  selectedOption($('#historyPro').val());
												
											     $( this ).dialog( "close" );
												}
								              
											},
							        {
							        	html : "取消",
							        	"class" : "btn btn-default",
							        	click: function() {
										     $( this ).dialog( "close" );
											}
							              
										}
							        ]
							});
							$('#opera2').dialog('open');
							$("#typeQuery").val("%");
						}
						else{
							var spaceValue;
							selectedOption(spaceValue);
						}
					}
						
					});
				
				
				
					
				function selectedOption(selectedPro_id){
					$.ajax({
						type: 'POST',
						url: '../StructMgrServlet',
						dataType: 'json',
						data: {
							type: "setConstruct",
							info: JSON.stringify(info),
							prj_id: selectedPro_id,
						},
						error : function(msg) {
							errMessage("请求StructMgrServlet失败");
					    },
						success : function(json) {
							 if(json.success=="fail"){
								 switch (json.error) {
								case 1:
									break;
								case 2:
									errMessage("服务器错误");
									break;
								default:
									break;
								}
							 }else{
								var data = json.obj;
								var ht;
								if(data.prj_id==undefined){
									ht=" <label class='label label-danger'>当前项目：无</label>";
								}else{
									var ProjectState="未完成";
									
									if(data.prj_state==1){ProjectState="已结束";}
									if(data.prj_state==2){ProjectState="已过期";}
									
									ht=" <label class='label label-info projectName' data-type='"+data.prj_desc+"'>当前项目："+data.prj_desc+"-"+ProjectState+"</label>";
								}
								if(info.section_id!=undefined){
									$('#qq').html("当前结构 : "+info.section_name+" > "+info.no+"-"+info.name+ht);
									$('#qqq').empty();
								}else{
									$('#qq').html("当前结构 : "+info.line_name+" > "+info.name+ht);
									$('#qqq').empty();
								}
								if(info.mode=="bridge"){
									$('#qqq').html("<a class='btn btn-primary btn-xs' href='brgCard.jsp#add=false'>查看卡片</a> <a class='btn btn-primary btn-xs' href='brgMember.jsp'>查看构件</a>");
								}else if(info.mode=="pass"){
									$('#qqq').html("<a class='btn btn-primary btn-xs' href='passCard.jsp#add=false'>查看卡片</a> <a class='btn btn-primary btn-xs' href='passMember.jsp'''>查看构件</a>");
								}else if(info.mode=="culvert"){
									$('#qqq').html("<a class='btn btn-primary btn-xs' href='culCard.jsp#add=false'>查看卡片</a> <a class='btn btn-primary btn-xs' href='culMember.jsp'>查看构件</a>");
								}
							 }
						}
					}); 
				}
	
			});
			


			$('#structTable').delegate('.del','click', function () {
				tr = $(this).closest('tr');
				var data = table.row(tr).data();
				
				$.SmartMessageBox({
					title : "结构删除",
					content : "您是否确认删除此结构？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						showMask();
						$.ajax({
							type: 'POST',
							url: '../StructMgrServlet',
							dataType: 'json',
							data: {
								type: "delStruct",
								data: JSON.stringify(data)
							},
							error : function(msg) {
								hidMask();
								errMessage("请求StructMgrServlet失败");
						    },
							success : function(json) {   
								hidMask();
								 if(json.success=="fail"){
									 switch (json.error) {
									case 1:
										break;
									case 2:
										errMessage("服务器错误");
										break;
									default:
										break;
									}
								 }else{
									 table.row(tr).remove().draw( false );
								 }
							}
						});
					}
				});
			});
			
			
			
			
			
			function errMessage(info){
				$.smallBox({
	                title: "处理信息",
	                content: "<i class='fa fa-clock-o'></i> <i>"+info+"</i>",
	                color: "#C46A69",
	                iconSmall: "fa fa-times fa-2x fadeInRight animated",
	                timeout: 3000
	            });
			}
			
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
			function successMessage(info){
				$.smallBox({
	                title: "处理信息",
	                content: "<i class='fa fa-clock-o'></i> <i>"+info+"</i>",
	                color: "#659265",
	                iconSmall: "fa fa-times fa-2x fadeInRight animated",
	                timeout: 3000
	            });
			}
			
			//面板事件
			$('#collapseOne').on('show.bs.collapse', function () {
				$('.fa-angle-up').show();
				$('.fa-angle-down').hide();
			});
			$('#collapseOne').on('hide.bs.collapse', function () {
				$('.fa-angle-up').hide();
				$('.fa-angle-down').show();
			});
			
			 function showMask(){
		        	$("#cover").show();		
		       	}
		   	function hidMask(){
		       		$("#cover").css('display','none');
		       	}
			
			function releaseAdmin(){//管理员
				$('.addStruct').removeClass('disabled');
			}
			function releaseManage(){//项目负责人
				
			}
			function releaseMember(){//项目参与人
				
			}
			function releaseGuest(){//普通用户
			}
			
			
			var superQueryType = undefined;
			function releaseGuest(e){//普通用户
				if(e=="superAdmin"){
					superQueryType = undefined;
					$('.addStruct').removeClass('disabled');
					superQueryType = 'superAdmin';
				}
			
			}
			
			function releaseOrgAdmin(){
				$('.addStruct').removeClass('disabled');
			}
			
			
			
			
			 function reloadData(a){
				
	            	 $.ajax({
						type: 'POST',
						url: '../HistoryProJectServlet',
						dataType: 'json',
						data: {
							id: pageId,
							mode: pageMode,
							chkType : a.value
						},
						error : function(msg) {
							errMessage("加载历史相关项目失败");
					    },
						success : function(json) { 
							historyProdata = json.obj;
							var d = $('#historyPro');
							d.empty();
							for(var i = 0; i<historyProdata.length; i++){
								d.append('<option value="'+historyProdata[i].prj_id+'">'+historyProdata[i].prj_desc+'</option>');
							}
							//d.select2();
							d.trigger('change');
							if(historyProdata.length>0){
								$('#opera2').dialog({
									title:"选择项目",
									
									buttons:[
										 {
									        	html : "确认",
												  "class" : "btn btn-default",
												  click: function() {
													  selectedOption($('#historyPro').val());
												     $( this ).dialog( "close" );
													}
									              
												},
								        {
								        	html : "取消",
								        	"class" : "btn btn-default",
								        	click: function() {
											     $( this ).dialog( "close" );
												}
								              
											}
								        ]
								});
								$('#opera2').dialog('open');
							}
							else{
								var spaceValue;
								selectedOption(spaceValue);
							}
						}
							
						}); 
				}			
			 
			 
			 
		 	 function selectedOption(selectedPro_id){
					
                    
					$.ajax({
						type: 'POST',
						url: '../StructMgrServlet',
						dataType: 'json',
						data: {
							type: "setConstruct",
							info: JSON.stringify(pageInfo),
							prj_id: selectedPro_id,
						},
						error : function(msg) {
							errMessage("请求StructMgrServlet失败");
					    },
						success : function(json) {
							 if(json.success=="fail"){
								 switch (json.error) {
								case 1:
									break;
								case 2:
									errMessage("服务器错误");
									break;
								default:
									break;
								}
							 }else{
								var data = json.obj;
								var ht;
							
								if(data.prj_id==undefined){
									ht=" <label class='label label-danger'>当前项目：无</label>";
								}else{
									var ProjectState="未完成";
									
									if(data.prj_state==1){ProjectState="已结束";}
									if(data.prj_state==2){ProjectState="已过期";}
										
									ht=" <label class='label label-info'>当前项目："+data.prj_desc+"-"+ProjectState+"</label>";
								}
								if(pageInfo.section_id!=undefined){
									$('#qq').html("当前结构 : "+pageInfo.section_name+" > "+pageInfo.no+"-"+pageInfo.name+ht);
									$('#qqq').empty();
								}else{
									$('#qq').html("当前结构 : "+pageInfo.line_name+" > "+pageInfo.name+ht);
									$('#qqq').empty();
								}
								if(pageInfo.mode=="bridge"){
									$('#qqq').html("<a class='btn btn-primary btn-xs' href='brgCard.jsp#add=false'>查看卡片</a> <a class='btn btn-primary btn-xs' href='brgMember.jsp'>查看构件</a>");
								}else if(pageInfo.mode=="pass"){
									$('#qqq').html("<a class='btn btn-primary btn-xs' href='passCard.jsp#add=false'>查看卡片</a> <a class='btn btn-primary btn-xs' href='passMember.jsp'''>查看构件</a>");
								}else if(pageInfo.mode=="culvert"){
									$('#qqq').html("<a class='btn btn-primary btn-xs' href='culCard.jsp#add=false'>查看卡片</a> <a class='btn btn-primary btn-xs' href='culMember.jsp'>查看构件</a>");
								}
							 }
						}
					}); 
				} 
			 
		</script>
		
	</body>
</html>