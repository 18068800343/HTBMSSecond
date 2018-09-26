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

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<% 
	String org_id = (String)session.getAttribute("orgid");
	if(org_id==null){
		response.sendRedirect("prjMgr.jsp");
	}
	%>
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
<style>
.tcenter {
	text-align: center;
	cursor: pointer;
}

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

.sort {
	list-style-type: none;
	padding: 0 0 0 20px;
	/* 	 padding-top: 10px; */
}

.sort  li {
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

.timeline>li {
	position: relative;
	margin-right: 10px;
	margin-bottom: 15px;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li>.timeline-item {
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

.timeline>li>.timeline-item>.time {
	color: #999;
	float: right;
	padding: 10px;
	font-size: 12px;
}

.timeline>li>.timeline-item>.timeline-header {
	margin: 0;
	color: #555;
	border-bottom: 1px solid #f4f4f4;
	padding: 10px;
	font-size: 16px;
	line-height: 1.1;
}

.timeline>li>.timeline-item>.timeline-header>a {
	font-weight: 600;
}

.timeline>li>.timeline-item>.timeline-body, .timeline>li>.timeline-item>.timeline-footer
	{
	padding: 10px;
}

.timeline>li>.fa, .timeline>li>.glyphicon, .timeline>li>.ion {
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

.timeline>.time-label>span {
	font-weight: 600;
	padding: 5px;
	display: inline-block;
	background-color: #fff;
	border-radius: 4px;
}

.timeline-inverse>li>.timeline-item {
	background: #f0f0f0;
	border: 1px solid #ddd;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.timeline-inverse>li>.timeline-item>.timeline-header {
	border-bottom-color: #ddd;
}

nav>.pager {
	position: inherit;
}

.well {
	padding: 10px;
}
</style>

<script type="text/javascript">
	
	function stepInit() {
		$('#step1-next')
				.on(
						'click',
						function() {
							var prj_desc = $('#prj_desc').val();
							var chk_type = $('#chk_type').val();
							var maintain_org = $('#maintain_org').val();
							var prj_charge_man = $('#prj_charge_man').val();
							var prj_member_list = $('#prj_member').val();
							if (prj_desc == '' || chk_type == ''
									|| maintain_org == ''
									|| prj_charge_man == ''
									|| prj_member_list == null) {
								errMessage('数据不完整！');
								return false;
							}
							$('#step1').slideUp('normal', 'swing');
							$('#step2').slideDown('normal', 'swing',
									function() {
										initStructTable(chk_type);
									});
							$('#step1-state').removeClass('fa-info').addClass(
									'fa-check');

						});

		$('#step2-previous').on('click', function() {
			$('#step1').slideDown('normal', 'swing');
			$('#step2').slideUp('normal', 'swing');
			$('#step2-state').removeClass('fa-check').addClass('fa-info');

		});

		$('#step-finish').on('click', function() {

			saveNewPrj();
		});
	}
</script>
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
				data-title="refresh" data-placement="bottom"
				data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
				data-html="true"> <i class="fa fa-refresh"></i>
			</span>
			</span>

			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>检查评定</li>
				<li>项目</li>
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
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

							<header>
								<span class="widget-icon"> <i class="fa fa-eye"></i>
								</span>
								<h2>项目</h2>

							</header>

							<!-- widget div-->
							<div class="row">

								<!-- widget content -->
								<div class="widget-body no-padding">

									<div class="widget-body-toolbar bg-color-white">


										<div class="row">

											<div class="col-sm-12 col-md-12">
												<div class="pull-left col-xs-2">
													<select style="width:100%" class="form-control input-sm select2"  onchange="reloadData(this)" >
														<option value="regular">定期检查</option>
														<option value="special">特殊检查</option>
														<option value="often">经常检查</option>
														<option value="daily">日常检查</option>
													</select>
												</div>
												
												<a class="btn btn-primary pull-right disabled" onclick="newProject()">
													增加经常项目 </a><div class="pull-right" >&nbsp;&nbsp;&nbsp;&nbsp;</div>
													<a class="btn btn-primary pull-right disabled" href="prjMgr3.jsp">
													日常项目配置 </a>
													
											</div>

										</div>


									</div>
									<table id="prjTable"
										class="table table-striped table-bordered table-hover"
										style="width: 100%">
										<thead>
											<tr>
												<th style="width: 45px;"></th>
												<th>项目名称</th>
												<th>创建日期</th>
												<th>检查进度</th>
												<th>评定进度</th>
												<th>项目状态</th>
												<th>操作</th>
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

	<%@ include file="footer.jsp"%>

	<div id="newPrj" hidden="hidden">

		<!-- #MAIN CONTENT -->
		<div id="content">
			<section id="widget-grid">
				<!-- widget grid -->
				<!-- row -->
				<div class="row">

					<!-- SINGLE GRID -->
					<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">



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
										<li><i id="step1-state" class="fa fa-info bg-aqua"></i>

											<div class="timeline-item">
												<span class="time"><i class="fa fa-clock-o"></i></span>
												<h3 class="timeline-header no-border">
													<a>步骤一：</a> 项目信息
												</h3>
												<div class="timeline-body" id="step1"
													style="display: block;">
													<div style="width: 100%; padding: 0 0 0 0">

														<div class="row">
															<div class="form-group col-xs-4">
																<label>项目名称</label><i class="text-danger">*</i> <input
																	class="form-control" id="prj_desc" value=""
																	placeholder="项目名称" type="text" style="width: 100%;">
															</div>
															<div class="form-group col-xs-4">
																<label>项目类型</label><i class="text-danger">*</i> <select
																	id="chk_type" class="form-control select2" style="width: 100%;">
																	<option value="often">经常检查</option>
																	
																</select>
															</div>
															<div class="form-group col-xs-4">
																<label>分区名称</label><i class="text-danger">*</i> 
																<select id="zoneName" class="form-control select2"
																	style="width: 100%;">
																	
																</select>
															</div>
															<div class="form-group col-xs-6">
																<label>项目负责人</label><i class="text-danger">*</i> <select
																	id="prj_charge_man" class="form-control select2"
																	style="width: 100%;">
																	
																</select>
															</div>
															<div class="form-group col-xs-6">
																<label>添加本公司工程师</label>
																<label>
			                                                         <input type="checkbox" id="checkPeopleBox" onchange="selectCheckPeople()"> 
		                                                        </label>
																<i class="text-danger">*</i> 
																<select id="prj_member" class="form-control select2"
																	style="width: 100%;" multiple="multiple">
																	
																</select>
															</div>
														</div>

													</div>
													<nav aria-label="...">
														<ul class="pager "
															style="margin-top: 0px; margin-bottom: 0px;">
															<li class="next"><a id="step1-next" href="#">下一步</a></li>
														</ul>
													</nav>
												</div>
											</div></li>
										<li><i id="step2-state" class="fa fa-info bg-aqua"></i>
											<div class="timeline-item">
												<span class="time"><i class="fa fa-clock-o"></i></span>
												<h3 class="timeline-header">
													<a href="#">步骤二：</a>选择结构物
												</h3>

												<div class="timeline-body" id="step2" style="display: none;">
													<table id="structTable"
														class="table table-striped table-bordered table-hover"
														style="width: 100%">
														<thead>
															<tr>
																<th style="width: 80px;"><select
																	class="input-sm form-control" style="width: 100%;"
																	onchange="structTable.column( '10' ).search( this.value ).draw( false );"><option
																			value="">全部</option>
																		<option value="true">已选</option>
																		<option value="false">未选</option></select></th>
																<th style="width: 100px;"><select
																	class="input-sm form-control" style="width: 100%;"
																	onchange="searchMode(this.value)">
																	    <option value="">全部</option>
																		<option>桥梁</option>
																		<option>涵洞</option>
																		</select></th>
																<th><input type="text"
																	class="form-control hasinput" placeholder="检索" /></th>
																<th><input type="text"
																	class="form-control hasinput" placeholder="检索" /></th>
																<th><input type="text"
																	class="form-control hasinput" placeholder="检索" /></th>
																<th>
																	<button class="btn btn-default" style="width: 100%;"
																		onclick="orderStub()">排序</button>
																</th>
																<th><input type="text"
																	class="form-control hasinput" placeholder="检索" /></th>
																<th><input type="text"
																	class="form-control hasinput" placeholder="检索" /></th>
																<th><input type="text"
																	class="form-control hasinput" placeholder="检索" /></th>
															</tr>
															<tr>
																<th><label class="checkbox-inline"
																	style="width: 100%; height: 100%;"> <input
																		type="checkbox" class="checkbox style-0" id="autoChk">
																		<span></span>
																</label></th>
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
													<nav aria-label="..." class="clearfix" style="clear: both;">
														<ul class="pager">
															<li class="previous"><a id="step2-previous" href="#">上一步</a></li>
															<li class="next"><a id="step-finish" href="#">完成</a></li>
														</ul>
													</nav>
												</div>

											</div></li>
									</ul>


								</div>
								<!-- end widget content -->

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
	</div>

	<div id="addStruct" hidden="hidden">
		<table id="addTable"
			class="table table-striped table-bordered table-hover"
			style="width: 100%">
			<thead>
				<tr>
					<th style="width: 80px;"><select class="input-sm form-control"
						style="width: 100%;"
						onchange="addTable.column( '10' ).search( this.value ).draw( false );"><option
								value="">全部</option>
							<option value="true">已选</option>
							<option value="false">未选</option></select></th>
					<th style="width: 100px;"><select
						class="input-sm form-control" style="width: 100%;"
						onchange="searchMode2(this.value)"><option value="">全部</option>
							<option>桥梁</option>
							<option>通道</option>
							<option>涵洞</option></select></th>
					<th><input type="text" class="form-control hasinput2"
						placeholder="检索" /></th>
					<th><input type="text" class="form-control hasinput2"
						placeholder="检索" /></th>
					<th><input type="text" class="form-control hasinput2"
						placeholder="检索" /></th>
					<th>
						<button class="btn btn-default" style="width: 100%;"
							onclick="orderStub2()">排序</button>
					</th>
					<th><input type="text" class="form-control hasinput2"
						placeholder="检索" /></th>
					<th><input type="text" class="form-control hasinput2"
						placeholder="检索" /></th>
					<th><input type="text" class="form-control hasinput2"
						placeholder="检索" /></th>
				</tr>
				<tr>
					<th><label class="checkbox-inline"
						style="width: 100%; height: 100%;"> <input type="checkbox"
							class="checkbox style-0" id="autoChk2"> <span></span>
					</label></th>
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
	</div>

	<div id="editPrj" hidden="hidden">
		<form>
			<fieldset>
				<div class="form-group">
					<label>负责人</label>
				    <select class="form-control input-sm"
						id="manage">

					</select>
				</div>
				<div class="form-group">
					<label>参与人</label>
				    <select class="form-control input-sm select2"
						id="member" multiple>

					</select>
				</div>
			</fieldset>
		</form>
	</div>

	<div id="lookStruct" hidden="hidden" class="row"></div>

	<div id="cover" class="cover">
		<div id="loading" class="loading">复制历史记录中</div>
	</div>
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
	<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
	<script src="../js/myTool.js"></script>
	<script type="text/javascript">
	var orgid = '<%=session.getAttribute("orgid")%>';
		$(document).ready(function() {
			
			pageSetUp();
			//initStructTable();
			initZone();
			
			initPrjTable();
			stepInit();
		});

		$('#editPrj').dialog({
			autoOpen : false,
			width : 600,
			resizable : false,
			modal : true,
			show : 'drop',
			hide : 'drop',
			title : '修改'
		});

		$('#addStruct').dialog({
			autoOpen : false,
			width : 900,
			resizable : false,
			modal : true,
			show : 'drop',
			hide : 'drop',
			title : '增加结构'
		});

		$('#lookStruct').dialog({
			autoOpen : false,
			width : 600,
			maxHeight : 500,
			resizable : false,
			modal : true,
			show : 'drop',
			hide : 'drop',
			title : '查看结构物'
		});
		
		
	    //@author xianing
	    function reloadData(a){
			prjTable.column(7).search(a.value).draw();
			
			if(a.value == 'daily'){
				
			/* 	$(".progress").each(function(){
					$(this).parent().remove();
					$(this).remove();
				    
				});
				
				$("th.sorting").each(function(){
					if($(this).text() == '检查进度' || $(this).text() == '评定进度'){
						$(this).remove();
					}
				});  */
				prjTable.column(3).visible(false);
				prjTable.column(4).visible(false);
			}else{
				prjTable.column(3).visible(true);
				prjTable.column(4).visible(true);
			}
			
			//a.value = 'regular';
		}

		var tr;
		var editDel = "<div class='text-align-center'><button class='look btn btn-warning btn-xs'><li class='fa fa-reorder'></li></button>&nbsp;&nbsp;<button class='end btn btn-warning btn-xs' disabled data-hold><span class='fa fa-check'></span></button>&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
		var prjTable = $('#prjTable')
				.DataTable(
						{
							"deferRender" : true,
							"processing" : true,
							"sDom" : "t"
									+ "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
							"bDestroy" : true,
							"iDisplayLength" : 10,
							"autoWidth" : false,
							"bScrollCollapse" : true,
							"sScrollY" : 400,
							"oLanguage" : {
								"sSearch" : '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
							},
							"columns" : [ {
								"class" : 'details-control',
								"orderable" : false,
								"data" : null,
								"defaultContent" : ''
							}, {
								"data" : "prj_desc"
							}, {
								"data" : "prj_establish_tm", "width": 80
							}, {
								"data" : null
							}, {
								"data" : null
							},{
								"data" : 'prj_state', "width": 60,  render: function(data){
									if(data==0){
										return '<label class="label label-info">进行中</label>';
									}
									if(data==1){
										return '<label class="label label-success">已完成</label>';
									}
									if(data==2){
										return '<label class="label label-warning">已过期</label>';
									}
								}
							}, {
								"data" : null
							}, {
								"data": "chk_type", visible: false
							}],
							"columnDefs" : [
									{
										"targets" : 3,
										"searchable" : false,
										"render" : function(data, type, full) {
											if (full.member_chk_no == 0) {
												return "<div class='progress progress-xs' data-progressbar-value='0'><div class='progress-bar'></div></div>";
											}
											return "<div class='progress progress-xs' data-progressbar-value='"
													+ parseInt((Number(full.member_chk_no)
															/ Number(full.member_no) * 100))
													+ "'><div class='progress-bar'></div></div>";
										}
									},
									{
										"targets" : 4,
										"searchable" : false,
										"render" : function(data, type, full) {
											
											if(full.chk_type =='daily'||full.chk_type=='often'){
												return "<div class='progress progress-xs' data-progressbar-value='100'><div class='progress-bar'></div></div>";
											}else 
											if (full.struct_eva == 0) {
												return "<div class='progress progress-xs' data-progressbar-value='0'><div class='progress-bar'></div></div>";
											}
											return "<div class='progress progress-xs' data-progressbar-value='"
													+ parseInt((Number(full.struct_eva)
															/ Number(full.struct_no) * 100))
													+ "'><div class='progress-bar'></div></div>";
										}
									},
									{
										"targets" : 6,
										"width" : 180,
										"searchable" : false,
										"render" : function(data, type, full) {
											if (full.prj_state > 0) {
												return editDel.replace(
														/data-hold/g,
														'disabled');
											}
											return editDel;
										}
									} ],
							"order" : [ [ 2, 'desc' ] ],
							"oLanguage" : { //国际化配置  
								"sProcessing" : "正在获取数据，请稍后...",
								"sLengthMenu" : "显示 _MENU_ 条",
								"sZeroRecords" : "查询不到相关数据",
								"sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
								"sInfoEmpty" : "记录数为0",
								"sInfoFiltered" : "(全部记录数 _MAX_ 条)",
								"sInfoPostFix" : "",
								"sSearch" : "搜索",
								"sUrl" : "",
								"oPaginate" : {
									"sFirst" : "第一页",
									"sPrevious" : "上一页",
									"sNext" : "下一页",
									"sLast" : "最后一页"
								}
							}
						});

		$('#prjTable tbody').on('click', 'td.details-control', function() {
			tr = $(this).closest('tr');
			row = prjTable.row(tr);
		
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				cache:false, 
				data : {
					type : "getbridgeCount",
					prj_id:row.data().prj_id
				},
				success:function(json){
					if (row.child.isShown()) {
						row.child.hide();
						tr.removeClass('shown');
					} else {
						row.child(format(row.data(),json.obj)).show();
						tr.addClass('shown');
					}
				}
			});
		});

		function format(d,o) {
			return '<table cellpadding="5" cellspacing="0" border="0" class="table table-hover table-condensed">'
					+ '<tr>' + '<td style="width:100px">项目名称：</td>' + '<td>'
					+ d.prj_desc
					+ '</td>'
					+ '<td></td>'
					+ '<td></td>'
					+ '</tr>'
					+ '<tr>' + '<td style="width:200px">公司名称：</td>' + '<td>'
					+ d.maintain_org
					+ '</td>'
					+ '<td></td>'
					+ '<td></td>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>负责人：</td>'
					+ '<td>'
					+ d.prj_charge_man
					+ '</td>'
					+ '<td></td>'
					+ '<td></td>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>参加人员：</td>'
					+ '<td>'
					+ d.prj_member
					+ '</td>'
					+ '<td></td>'
					+ '<td></td>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>结构总数：</td>'
					+ '<td>'
					+ d.struct_no+' ('+getBrgCount(o.bridge)+' '+getPassCount(o.pass)+' '+getCulvertCount(o.culvert)+' )'
					+ '</td>'
					+ '<td>检查完成：'
					+ d.struct_checked+' ('+getBrgCount(o.brgChk)+' '+getPassCount(o.passChk)+' '+getCulvertCount(o.culvertChk)+' )'
					+ '</td>'
					+ '<td>评定完成：'
					+ d.struct_eva+' ('+getBrgCount(o.brgEva)+' )'
					+ '</td>'
					+ '</tr>'
					+ '<tr>'
					+ '<td>构件总数：</td>'
					+ '<td>'
					+ d.member_no
					+ '</td>'
					+ '<td>检查完成：'
					+ d.member_chk_no
					+ '</td>'
					+ '<td></td>' + '</tr>' + '</table>';
		}

		function getBrgCount(obj){
			if(obj==0){
				return '';
			}else{
				return '桥梁:'+obj
			}
		}	
		
		function getPassCount(obj){
			if(obj==0){
				return '';
			}else{
				return '通道:'+obj
			}
		}
		
		function getCulvertCount(obj){
			if(obj==0){
				return '';
			}else{
				return '涵洞:'+obj
			}
		}
		
		
		
		function initPrjTable() {
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				data : {
					type : "initPrjTable"
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
					$('#prjTable').dataTable().fnClearTable();
				},
				success : function(json) {
					$('#prjTable').dataTable().fnClearTable();
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
						prjTable.rows.add(json.obj).draw(false);
						prjTable.column(7).search("regular").draw();
					}
				}
			});
		}

		$('#prjTable').delegate('.add', 'click', function() {
			tr = $(this).closest('tr');
			var prjData = prjTable.row(tr).data();
			$('#addStruct').dialog('open');
			addTable.draw(false);
			$('#addStruct').dialog({
				buttons : [ {
					html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					"class" : "btn btn-default",
					click : function() {
						console.log(prjData);
						var data = addTable.data();
						var structs = [];
						for (var i = 0; i < data.length; i++) {
							if (data[i].state) {
								structs.push(data[i]);
							}
						}
						console.log(structs);
						if (structs.length == 0) {
							errMessage('未选择任何结构物！');
							return;
						}
						myTool.mask.show('处理中,同步复制病害...')
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
		});

		$('#prjTable')
				.delegate(
						'.edit',
						'click',
						function() {
							tr = $(this).closest('tr');
							var data = prjTable.row(tr).data();
							$('#manage').val(data.prj_charge_man);
							$('#member').val(data.prj_member.split(','))
									.trigger('change');
							$('#editPrj')
									.dialog(
											{
												buttons : [
														{
															html : "<i class='fa fa-plus'></i>&nbsp; 保存",
															"class" : "btn btn-default",
															click : function() {
																var prj_charge_man = $(
																		'#manage')
																		.val();
																var prj_member = $(
																		'#member')
																		.val();
																if (prj_member == null) {
																	errMessage("参与人不可为空！");
																	return;
																}
																prj_member = $(
																		'#member')
																		.val()
																		.toString();
																$
																		.ajax({
																			type : 'POST',
																			url : '../PrjMgrServlet',
																			dataType : 'json',
																			data : {
																				type : "editPrj",
																				prj_charge_man : prj_charge_man,
																				prj_member : prj_member,
																				prj_id : data.prj_id
																			},
																			error : function(
																					msg) {
																				errMessage("系统错误！");
																			},
																			success : function(
																					json) {
																				if (json.success == "fail") {
																					switch (json.error) {
																					case 1:
																						errMessage("保存失败");
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
																				} else {
																					data.prj_charge_man = prj_charge_man;
																					data.prj_member = prj_member;
																					prjTable
																							.row(
																									tr)
																							.data(
																									data)
																							.draw(
																									false);
																					prjTable
																							.row(
																									tr)
																							.child(
																									format(data))
																							.show();
																					$(
																							'#editPrj')
																							.dialog(
																									'close');
																				}
																			}
																		});
															}
														},
														{
															html : "<i class='fa fa-times'></i>&nbsp; 取消",
															"class" : "btn btn-default",
															click : function() {
																$(this)
																		.dialog(
																				"close");
															}
														} ]
											});
							$('#editPrj').dialog('open');
						});

		$('#prjTable')
				.delegate(
						'.look',
						'click',
						function() {
							tr = $(this).closest('tr');
							var data = prjTable.row(tr).data();
							$
									.ajax({
										type : 'POST',
										url : '../PrjMgrServlet',
										dataType : 'json',
										data : {
											type : "lookStruct",
											prj_id : data.prj_id
										},
										error : function(msg) {
											errMessage("系统错误！");
										},
										success : function(json) {
											$('#lookStruct').empty();
											var bridge = json.obj.bridge;
											if (1) {
												var div = $("<div class='col-xs-4'></div>");
												var table = $("<table class='table table-striped table-bordered table-hover'></table>");
												table
														.append("<thead><tr><th>桥梁</th></tr></thead>");
												if (bridge != undefined) {
													for (var i = 0; i < bridge.length; i++) {
														table.append("<tr><td>"
																+ bridge[i]
																+ "</td></tr>");
													}
												}
												div.append(table);
												$('#lookStruct').append(div);
											}
											var culvert = json.obj.culvert;
											if (1) {
												var div = $("<div class='col-xs-4'></div>");
												var table = $("<table class='table table-striped table-bordered table-hover'></table>");
												table
														.append("<thead><tr><th>涵洞</th></tr></thead>");
												if (culvert != undefined) {
													for (var i = 0; i < culvert.length; i++) {
														table.append("<tr><td>"
																+ culvert[i]
																+ "</td></tr>");
													}
												}
												div.append(table);
												$('#lookStruct').append(div);
											}

											var pass = json.obj.pass;
											if (1) {
												var div = $("<div class='col-xs-4'></div>");
												var table = $("<table class='table table-striped table-bordered table-hover'></table>");
												table
														.append("<thead><tr><th>通道</th></tr></thead>");
												if (pass != undefined) {
													for (var i = 0; i < pass.length; i++) {
														table.append("<tr><td>"
																+ pass[i]
																+ "</td></tr>");
													}
												}
												div.append(table);
												$('#lookStruct').append(div);
											}

											$('#lookStruct')
													.dialog(
															{
																buttons : [ {
																	html : "确定",
																	"class" : "btn btn-default",
																	click : function() {
																		$(this)
																				.dialog(
																						"close");
																	}
																} ]
															});

											$('#lookStruct').dialog('open');
										}
									});
						});

		$('#prjTable').delegate(
				'.end',
				'click',
				function() {
					tr = $(this).closest('tr');
					var data = prjTable.row(tr).data();
					if (data.member_chk_no != 0
							&& data.member_chk_no == data.member_no
							&& data.struct_eva != 0
							&& data.struct_eva == data.struct_no) {
						$.SmartMessageBox({
							title : "确认提示",
							content : "确认结束该项目吗",
							buttons : '[取消][确定]'
						}, function(ButtonPressed) {
							if (ButtonPressed === "确定") {
								$.ajax({
									type : 'POST',
									url : '../PrjMgrServlet',
									dataType : 'json',
									data : {
										type : "endPrj",
										prj_id : data.prj_id
									},
									error : function(msg) {
										errMessage("系统错误！");
									},
									success : function(json) {
										if (json.success == "fail") {
											switch (json.error) {
											case 1:
												errMessage("结束失败");
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
										} else {
											data.prj_state = 1;
											prjTable.cell(tr, 5).data(1);
										}
									}
								});
							}
						});

					} else {
						errMessage('项目未完成！');
					}
				});

		$('#prjTable').delegate('.del', 'click', function() {
			tr = $(this).closest('tr');
			var data = prjTable.row(tr).data();
			$.SmartMessageBox({
				title : "删除提示",
				content : "确认删除该项目吗",
				buttons : '[取消][确定]'
			}, function(ButtonPressed) {
				if (ButtonPressed === "确定") {
					myTool.mask.show('删除中...');
					$.ajax({
						type : 'POST',
						url : '../PrjMgrServlet',
						dataType : 'json',
						data : {
							type : "delPrj",
							prj_id : data.prj_id
						},
						error : function(msg) {
							myTool.mask.hide();
							errMessage("系统错误！");
						},
						success : function(json) {
							myTool.mask.hide();
							if (json.success == "fail") {
								switch (json.error) {
								case 1:
									errMessage("删除失败");
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
							} else {
								prjTable.row(tr).remove().draw(false);
							}
						}
					});
				}
			});

		});

		function newProject() {
			$('#newPrj').dialog('open');
			structTable.draw(false);
		}

		$('#newPrj').dialog({
			autoOpen : false,
			width : 1000,
			resizable : false,
			modal : true,
			show : 'drop',
			hide : 'drop',
			title : "新建项目",
		/* buttons : [ {
			html : "<i class='fa fa-plus'></i>&nbsp; 保存",
			"class" : "btn btn-default",
			click : function() {
				saveNewPrj();
			}
		}, {
			html : "<i class='fa fa-times'></i>&nbsp; 取消",
			"class" : "btn btn-default",
			click : function() {
				$(this).dialog("close");
			}
		} ] */
		});

		function saveNewPrj() {
			var prj_desc = $('#prj_desc').val();
			var chk_type = $('#chk_type').val();
			var maintain_org = $('#maintain_org').val();
			var prj_charge_man = $('#prj_charge_man').val();
			var prj_member_list = $('#prj_member').val();
			if (prj_desc == '' || chk_type == '' || maintain_org == ''
					|| prj_charge_man == '' || prj_member_list == null) {
				errMessage('数据不完整！');
				return;
			}
			var prj_member = prj_member_list.toString().replace(/,/g, '#');
			var data = structTable.data();
			var structs = [];
			for (var i = 0; i < data.length; i++) {
				if (data[i].state) {
					structs.push(data[i]);
				}
			}
			if (structs.length == 0) {
				errMessage('未选择任何结构物！');
				return;
			}

			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				data : {
					type : "saveNewPrj",
					prj_desc : prj_desc,
					chk_type : chk_type,
					maintain_org : maintain_org,
					prj_charge_man : prj_charge_man,
					prj_member : prj_member,
					structs : JSON.stringify(structs),
					zoneId: zoneId
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
				},
				success : function(json) {
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
						copyStart(json.obj, chk_type);
						initPrjTable();
						$('#newPrj').dialog("close");
					}
				}
			});

		}

		var structTable = $('#structTable')
				.DataTable(
						{
							"deferRender" : true,
							"processing" : true,
							"sDom" : "t"
									+ "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
							"bDestroy" : true,
							"iDisplayLength" : 7,
							"autoWidth" : false,
							"bScrollCollapse" : true,
							"sScrollY" : 400,
							"oLanguage" : {
								"sSearch" : '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
							},
							"columns" : [ {
								"data" : "state",
								'orderable' : false
							}, {
								"data" : "struct_no"
							}, {
								"data" : "struct_name"
							}, {
								"data" : "struct_mode",
								'visible' : false
							}, {
								"data" : "highway_name"
							}, {
								"data" : "stub_no",
								'orderable' : false
							}, {
								"data" : "manage_short_name"
							}, {
								"data" : "section_name"
							}, {
								"data" : "zone_name"
							}, {
								"data" : null,
								'visible' : false
							}, {
								"data" : null,
								'visible' : false
							} ],
							"columnDefs" : [
									{
										"class" : "tcenter",
										"targets" : 0,
										"searchable" : true,
										"render" : function(data, type, full) {
											if (data == false) {
												return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox"><span></span></label>';
											} else {
												return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox" checked><span></span></label>';
											}
										}
									},
									{
										"targets" : 3,
										"searchable" : true,
										"render" : function(data, type, full) {
											if (data == "bridge") {
												return '桥梁';
											}
											if (data == "pass") {
												return '通道';
											}
											if (data == "culvert") {
												return '涵洞';
											}
										}
									},
									{
										"targets" : 5,
										"searchable" : true,
										"render" : function(data, type, full) {
											if (data == undefined) {
												return '--';
											}
											return data;
										}
									},
									{
										"targets" : 9,
										"searchable" : true,
										"render" : function(data, type, full) {
											try {
												var s = full.stub_no;
												var pre = Number(s.substring(s
														.indexOf('K') + 1, s
														.indexOf('+'))) * 1000;
												var stuff = Number(s
														.substring(s
																.indexOf('+') + 1));
												var stub_trace = Number(pre
														+ stuff);
												if (isNaN(stub_trace)) {
													return '';
												} else {
													return stub_trace;
												}
											} catch (e) {
												return '';
											}
										}
									}, {
										"targets" : 10,
										"searchable" : true,
										"render" : function(data, type, full) {
											return full.state;
										}
									} ],
							"order" : [ [ 1, 'asc' ] ],
							"oLanguage" : { //国际化配置  
								"sProcessing" : "正在获取数据，请稍后...",
								"sLengthMenu" : "显示 _MENU_ 条",
								"sZeroRecords" : "查询不到相关数据",
								"sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
								"sInfoEmpty" : "记录数为0",
								"sInfoFiltered" : "(全部记录数 _MAX_ 条)",
								"sInfoPostFix" : "",
								"sSearch" : "搜索",
								"sUrl" : "",
								"oPaginate" : {
									"sFirst" : "第一页",
									"sPrevious" : "上一页",
									"sNext" : "下一页",
									"sLast" : "最后一页"
								}
							}
						});

		$(".hasinput").on(
				'change',
				function() {
					structTable.column($(this).parent().index() + ':visible')
							.search(this.value).draw(false);
				});

		$('#structTable').on('draw.dt', function() {
			autoChk();
		});

		$('#structTable').delegate('.cbox', 'change', function() {
			var state = $(this).prop('checked');
			var tr = $(this).closest('tr');
			structTable.row(tr).data().state = state;
			autoChk();
			structTable.cell(tr, 10).data(state);

		});
		$('#autoChk').on('click', function() {
			var s = $(this).prop('checked');
			$('#structTable .cbox').prop('checked', s).trigger('change');
		});

		function autoChk() {
			var s = true;
			$('#structTable').find('.cbox').each(function() {
				if ($(this).prop('checked') == false) {
					s = false;
					return false;
				}
			});
			$('#autoChk').prop('checked', s);
		}

		function orderStub() {
			structTable.column('9').order('asc').draw(false);
		}
		function searchMode(d) {
			structTable.column('3').search(d).draw(false);
		}

		function initStructTable(chk_type) {
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				data : {
					type : "initStructTable2",
					chk_type : chk_type,
					zoneId : zoneId
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
					$('#structTable').dataTable().fnClearTable();
				},
				success : function(json) {
					$('#structTable').dataTable().fnClearTable();
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
						structTable.rows.add(json.obj).draw(false);
						addTable.rows.add(json.obj).draw(false);
					}
				}
			});
		}

		function initUser(checkZone) {
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				async:false,
				data : {
					type : "initUser2",
					checkZone: checkZone
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
				},
				success : function(json) {
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
						var d1 = $('#prj_charge_man').empty();
						var d2 = $('#prj_member').empty();
						var d3 = $('#manage').empty();
						var d4 = $('#member').empty();
						var ll = json.obj;
						var orgCharge = ll[0];
						var orgEngineer = ll[1];
						var prj_memberArray = new Array();
						for (var i = 0; i < orgCharge.length; i++) {
							d1.append('<option>' + orgCharge[i] + '</option>');
							d3.append('<option>' + orgCharge[i] + '</option>');
							
						}
						for (var i = 0; i < ll[0].length; i++) {
							prj_memberArray.push(orgEngineer[i]);
							d2.append('<option>' + orgEngineer[i] + '</option>');
							d4.append('<option>' + orgEngineer[i] + '</option>');
						}
						d2.val(prj_memberArray).trigger('change');
						d4.val(prj_memberArray).trigger('change');
						d1.trigger('change');
						d2.trigger('change');
					}
				}
			});
		}
		
		//@author xianing 
		function initCheckPeople(checkZone) {
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				data : {
					type : "initCheckPeople",
					checkZone: checkZone
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
				},
				success : function(json) {
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
						var d2 = $('#prj_member').empty();
						var ll = json.obj;
						var prj_memberArray = new Array();
						for (var i = 0; i < ll.length; i++) {
							prj_memberArray.push(ll[i]);
							d2.append('<option>' + ll[i] + '</option>');
						}
						//d2.val(prj_memberArray).trigger('change');
						d2.trigger('change');
					}
				}
			});
		}

		function initZone() {
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				data : {
					type : "initZone"
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
				},
				success : function(json) {
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
						var zone = $('#zoneName').empty();
						var zoneList = json.obj;
						
						for (var i = 0; i < zoneList.length; i++) {
							zone.append('<option id='+zoneList[i].zone_id+'>' + zoneList[i].zone_name + '</option>');
						}
						zone.trigger('change');
						
					}
				}
			});
		}
		
	
		
		$('#zoneName').change(function(){
			pageZoneId = undefined;
			
			$("#checkPeopleBox").attr("checked",false);
			
			var d1 = $('#prj_charge_man').empty().trigger('change');
			var d2 = $('#prj_member').empty().trigger('change');
// 			var d3 = $('#manage').empty();
// 			var d4 = $('#member').empty();
			var checkZone=$("#zoneName").find("option:selected").attr("id"); 
			zoneId = checkZone;
			initUser(checkZone);
			
			var value = $("#prj_charge_man").val();
			if(value == '' || value==null){
				$("#checkPeopleBox").attr("disabled","disabled");
			}else{
				$("#checkPeopleBox").removeAttr("disabled");
			}
		});
		
		function copyStart(prj_id, chk_type) {
			myTool.mask.show('复制中...');
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				data : {
					type : "copy",
					prj_id : prj_id,
					chk_type : chk_type
				},
				error : function(msg) {
					myTool.mask.hide();
					errMessage("系统错误！");
				},
				success : function(json) {
					myTool.mask.hide();
					location.reload();
				}
			});
		}

		var addTable = $('#addTable')
				.DataTable(
						{
							"deferRender" : true,
							"processing" : true,
							"sDom" : "t"
									+ "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
							"bDestroy" : true,
							"iDisplayLength" : 7,
							"autoWidth" : false,
							"bScrollCollapse" : true,
							"sScrollY" : 400,
							"oLanguage" : {
								"sSearch" : '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
							},
							"columns" : [ {
								"data" : "state",
								'orderable' : false
							}, {
								"data" : "struct_no"
							}, {
								"data" : "struct_name"
							}, {
								"data" : "struct_mode",
								'visible' : false
							}, {
								"data" : "highway_name"
							}, {
								"data" : "stub_no",
								'orderable' : false
							}, {
								"data" : "manage_short_name"
							}, {
								"data" : "section_name"
							}, {
								"data" : "zone_name"
							}, {
								"data" : null,
								'visible' : false
							}, {
								"data" : null,
								'visible' : false
							} ],
							"columnDefs" : [
									{
										"class" : "tcenter",
										"targets" : 0,
										"searchable" : true,
										"render" : function(data, type, full) {
											if (data == false) {
												return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox"><span></span></label>';
											} else {
												return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox" checked><span></span></label>';
											}
										}
									},
									{
										"targets" : 3,
										"searchable" : true,
										"render" : function(data, type, full) {
											if (data == "bridge") {
												return '桥梁';
											}
											if (data == "pass") {
												return '通道';
											}
											if (data == "culvert") {
												return '涵洞';
											}
										}
									},
									{
										"targets" : 5,
										"searchable" : true,
										"render" : function(data, type, full) {
											if (data == undefined) {
												return '--';
											}
											return data;
										}
									},
									{
										"targets" : 9,
										"searchable" : true,
										"render" : function(data, type, full) {
											try {
												var s = full.stub_no;
												var pre = Number(s.substring(s
														.indexOf('K') + 1, s
														.indexOf('+'))) * 1000;
												var stuff = Number(s
														.substring(s
																.indexOf('+') + 1));
												var stub_trace = Number(pre
														+ stuff);
												if (isNaN(stub_trace)) {
													return '';
												} else {
													return stub_trace;
												}
											} catch (e) {
												return '';
											}
										}
									}, {
										"targets" : 10,
										"searchable" : true,
										"render" : function(data, type, full) {
											return full.state;
										}
									} ],
							"order" : [ [ 1, 'asc' ] ],
							"oLanguage" : { //国际化配置  
								"sProcessing" : "正在获取数据，请稍后...",
								"sLengthMenu" : "显示 _MENU_ 条",
								"sZeroRecords" : "查询不到相关数据",
								"sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
								"sInfoEmpty" : "记录数为0",
								"sInfoFiltered" : "(全部记录数 _MAX_ 条)",
								"sInfoPostFix" : "",
								"sSearch" : "搜索",
								"sUrl" : "",
								"oPaginate" : {
									"sFirst" : "第一页",
									"sPrevious" : "上一页",
									"sNext" : "下一页",
									"sLast" : "最后一页"
								}
							}
						});

		$(".hasinput2").on(
				'change',
				function() {
					addTable.column($(this).parent().index() + ':visible')
							.search(this.value).draw(false);
				});

		$('#addTable').on('draw.dt', function() {
			autoChk2();
		});

		$('#addTable').delegate('.cbox', 'change', function() {
			var state = $(this).prop('checked');
			var tr = $(this).closest('tr');
			addTable.row(tr).data().state = state;
			autoChk2();
			addTable.cell(tr, 10).data(state);

		});
		$('#autoChk2').on('click', function() {
			var s = $(this).prop('checked');
			$('#addTable .cbox').prop('checked', s).trigger('change');
		});
		
		//@author xianing
		function selectCheckPeople(){
			var $isChecked = $("#checkPeopleBox").is(":checked");
			if($isChecked){
				$("#checkPeopleBox").parent().prev().text("添加检测公司工程师");
				initCheckPeople();
			}else{
				$("#checkPeopleBox").parent().prev().text("添加本公司工程师");
				initUser(zoneId);
			}
		}

		function autoChk2() {
			var s = true;
			$('#addTable').find('.cbox').each(function() {
				if ($(this).prop('checked') == false) {
					s = false;
					return false;
				}
			});
			$('#autoChk2').prop('checked', s);
		}

		function orderStub2() {
			addTable.column('9').order('asc').draw(false);
		}
		function searchMode2(d) {
			addTable.column('3').search(d).draw(false);
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

		function releaseAdmin() {//管理员
		}
		function releaseManage() {//项目负责人
			$('.widget-body-toolbar a').eq(0).removeClass('disabled');
			$('.widget-body-toolbar a').eq(1).removeClass('disabled');
			editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' data-hold><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;<button class='look btn btn-warning btn-xs'><span class='fa fa-reorder'></span></button>&nbsp;&nbsp;<button class='end btn btn-warning btn-xs' data-hold><span class='fa fa-check'></span></button>&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
		}
		function releaseMember() {//项目参与人

		}
		function  releaseOrgCharge(){
			$('.widget-body-toolbar a').eq(0).removeClass('disabled');
			$('.widget-body-toolbar a').eq(1).removeClass('disabled');
			editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' data-hold><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;<button class='look btn btn-warning btn-xs'><span class='fa fa-reorder'></span></button>&nbsp;&nbsp;<button class='end btn btn-warning btn-xs' data-hold><span class='fa fa-check'></span></button>&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
		}
		function releaseGuest() {//普通用户
		
		}
		function releaseGuest(e){//普通用户
			if(e=="superAdmin"){
			releaseOrgAdmin();
			}
		}
		function releaseOrgAdmin(){
			$('.widget-body-toolbar a').eq(0).removeClass('disabled');
			$('.widget-body-toolbar a').eq(1).removeClass('disabled');
			editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' data-hold><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;<button class='look btn btn-warning btn-xs'><span class='fa fa-reorder'></span></button>&nbsp;&nbsp;<button class='end btn btn-warning btn-xs' data-hold><span class='fa fa-check'></span></button>&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
		}
	</script>

</body>
</html> 