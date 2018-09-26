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

<link rel="stylesheet" href="../jstree/themes/default/style.min.css" />
<style>
.treess:hover {
	background-color: #ccc;
	cursor: pointer;
}

.loading {
	width: 220px;
	height: 56px;
	position: absolute;
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
	filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70 );
}

.cover {
	position: fixed;
	top: 0px;
	right: 0px;
	bottom: 0px;
	filter: alpha(opacity = 60);
	background-color: #E2E2E2;
	z-index: 1002;
	left: 0px;
	display: none;
	opacity: 0.6;
	-moz-opacity: 0.5;
}


	ul, ol, li {
		list-style: none;
		padding: 0;
		margin: 0;
	}
	#date_panel {
		width: 380px;
		margin: 50px auto;
	}
	p {
		margin: 0;
	}
	a {
		text-decoration: none;
	}
</style>
<link rel="stylesheet" href="../css/bootstrap-switch.css"
	type="text/css"></link>

<link rel="stylesheet" href="../css/bootstrap-switch.css"
	type="text/css"></link>
<link rel="stylesheet" href="check/jquery.datetimepicker.css" />
<link rel="stylesheet"
	href="../js/plugin/bootstrap-timepicker/bootstrap-datetimepicker.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="../css/calender.css" type="text/css"></link>
</script>
</head>
<body class="">
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>

	<!-- #MAIN PANEL -->
	<div id="main">

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
				<li>审核</li>
				<li>日常检查审核</li>
			</ol>
			<!-- end breadcrumb -->

		</div>
		<!-- END RIBBON -->

		<!-- #MAIN CONTENT -->
		<div id="content">
			<section id="widget-grid">
				<div class="row">

					<!--   <%@include file="currentStruct.jsp" %> -->

					<article class="col-sm-7 col-md-7 col-lg-7">
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

							<header>
								<span class="widget-icon"> <i class="fa fa-sitemap"></i>
								</span>
								<h2>检查记录审核</h2>

							</header>

							<div class="col-sm-9 col-md-9 col-lg-9">

								<div class="jarviswidget-editbox"></div>
								<div class="widget-body-toolbar bg-color-white ">
									<div class="row col-sm-12 col-md-12 col-lg-12">
										<div class="row col-sm-4 col-md-4 col-lg-4">
											<select id="zone_select2" class="select2" style="width: 100%">
											</select>
										</div>
										<div class="row col-sm-3 col-md-3 col-lg-3 pull-right" id="btn_pass" hidden="hidden">
										<button class="btn btn-primary" title="通过过期项目" disabled="disabled" id="prj_pass">通过</button>
										</div>
										<div id="showHistoryDailyGroud" class="row col-sm-5 col-md-5 col-lg-5 pull-right">
											<div class="input-group row col-sm-9 col-md-9 col-lg-9">
												<span class="input-group-addon">日期</span> <input type="text"
													class="form-control" id="date_pick" readonly="readonly" placeholder="历史项目日期">
											</div>
										</div>
										
									</div>
								</div>
								<div class="widget-body">

									<table id="datatable_fixed_column"
										class="table table-striped table-bordered table-hover"
										style="width:100%">
										<thead>
											<tr>
												<th>桥梁编号</th>
												<th>桥梁名称</th>
												<th>状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="cttt">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</article>

					<!-- NEW WIDGET START -->
					<article class="col-sm-5 col-md-5 col-lg-5">

						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

							<header>
								<span class="widget-icon"> <i class="fa fa-eye"></i> </span>
								<h2>日期</h2>
							</header>

							<!-- widget div-->
							<div>

								<!-- widget edit box -->
								<div class="jarviswidget-editbox">
									<!-- This area used as dropdown edit box -->


								</div>
								<!-- 
                            <div class="widget-body-toolbar bg-color-white ">
                                <div class="row col-sm-12 col-md-12 col-lg-12">
                                </div>
                            </div>
                             -->
								<!-- end widget edit box -->

								<!-- widget content -->
								<div class="widget-body no-padding" id="date_panel" style="height: 450px" >
									<div id="calendar"></div>
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

	<!-- 加载提示 -->
	<div id="cover" class="cover">
		<div id="loading" class="loading">加载PDF</div>
	</div>

	<div id="pdf_panel" hidden="hidden">
		<div  id="pdf">
			<embed id="pdf1" width="100%" height="600px" type="application/pdf" internalinstanceid="3">
		</div>
	</div>

	<%@ include file="footer.jsp"%>

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


	<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
	<script src="check/jquery.datetimepicker.full.min.js"></script>
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

	<script src="../jstree/jstree.min.js"></script>
	<!-- jq-media -->
	<script type="text/javascript"
		src="../js/plugin/jq-media/jquery.media.js"></script>
	<!-- pdfobjects -->
	<script type="text/javascript" src="../js/plugin/PDFObjects/pdfobject.js"></script>
		<script type="text/javascript" src="../js/plugin/carlendar/calendar.js"></script>
	<script type="text/javascript">
		//表格
		var table = $("#datatable_fixed_column");
		//权限 duty/charge
		var role = undefined;
		//日历点取的日期
		var date_selectd= undefined;
		//初始化分区选择框
		$("#zone_select2").select2();
		//按钮控制
		var control = undefined;
		//项目id
		var dailyChk_prj_id = undefined;
		//dataTable单一结构物数据
		var audit_data = {
			brg_no : undefined,
			brg_name : undefined,
			brg_id : undefined,
			line_name : undefined,
			chk_id : undefined,
			audit_state : undefined
		};
		
		//格式化时间
		function FormatDate (strTime) {
		    var date = new Date(strTime);
		    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		}
		
		/**************************************************************/
		//PDF弹框
		$('#pdf_panel').dialog({
				autoOpen: false,
				width : 1000,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop',
				title:'查看PDF'
		});				
		/****************************************************************/
		//加载
		$(document).ready(function() {
			//页面
			pageSetUp();
			//初始化表格
			initTable();
			//今天日期
			date_selectd =FormatDate(new Date());
			$("#date_pick").val(date_selectd);
		});
		//通过按钮点击事件
		$("#prj_pass").click(function(event) {
			$.SmartMessageBox({
				title : "确认",
				content : "您是否确认通过该项目",
				buttons : '[取消][确定]'
			}, function(ButtonPressed) {
				if (ButtonPressed === "确定") {
					prj_Pass();
				}
				if (ButtonPressed === "取消") {
				}
			});
		});
		//通过项目
		function prj_Pass(){
			$.ajax({
				type : 'POST',
				url : '../DailyChkAuditServlet',
				dataType : 'json',
				data : {
					type : "prj_Pass",
					prj_id : dailyChk_prj_id
				},
				error : function(msg) {
					errMessage("通过项目出错！");
				},
				success : function(json) {
					if(json.success=="success"){
						getCalendarData();
						queryDailyChk_byZone($("#zone_select2").val(),date_selectd);
					}
					else{
						errMessage("通过项目失败");
					}
				}
			});
		}
		
		//分区下拉框数据
		function initZone_select(str,date) {
			$("#zone_select2").empty();
			$.ajax({
				type : 'POST',
				url : '../DailyChkAuditServlet',
				dataType : 'json',
				data : {
					type : "initZone_select",
					role : str,
					date : date
				},
				error : function(msg) {
					errMessage("加载分区出错！");
				},
				success : function(json) {
					if (json.success) {
						var data = json.obj;
						for ( var i = 0; i < data.length; i++) {
							$("#zone_select2").append(
									"<option value="+data[i].zone_id+">"
											+ data[i].zone_name + "</option>");
						}
						$("#zone_select2").select2();
						getCalendarData();
						queryDailyChk_byZone($("#zone_select2").val(),date_selectd);
					} else {
						errMessage("加载分区失败");
					}
				}
			});
		}
		
		//查询分区日常检查数据
		function queryDailyChk_byZone(zone_id,date_selectd,model) {
			$("#datatable_fixed_column").dataTable().fnClearTable();
			$.ajax({
				type : 'POST',
				url : '../DailyChkAuditServlet',
				dataType : 'json',
				data : {
					type : "queryDailyChk_byZone",
					zone_id : zone_id,
					date : date_selectd,
					model : model
				},
				error : function(msg) {
					errMessage("加载日常检查数据出错！");
				},
				success : function(json) {
					if (json.success == "success") {
						table.rows.add(json.obj).draw(false);
					}else{
						errMessage("该分区"+date_selectd+"没有日常检查任务");
					}

				}
			});
		}
		
		/************下拉框触发事件*************************************************************************/

		$('#zone_select2').on("select2:select", function(e) {
			getCalendarData();
			queryDailyChk_byZone($("#zone_select2").val(),date_selectd);
		});

		/*****************初始化表格************************************************************/
		function initTable() {
			var responsiveHelper_dt_basic = undefined;
			var responsiveHelper_datatable_fixed_column = undefined;
			var responsiveHelper_datatable_col_reorder = undefined;
			var responsiveHelper_datatable_tabletools = undefined;

			var breakpointDefinition = {
				tablet : 1024,
				phone : 480
			};

			/* COLUMN FILTER  */

			table = $('#datatable_fixed_column')
					.DataTable(
							{
								"deferRender" : true,
								"processing" : true,
								"sDom" : "t"
										+ "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
								"dataSrc" : "data",
								"autoWidth" : false,
								"columns" : [
								/* 							{
								 "class":          'details-control',
								 "orderable":      false,
								 "data":          null,
								 "defaultContent": ''
								 }, */
								{
									"data" : "brg_no"
								}, {
									"data" : "brg_name"
								}, {
									"data" : null
								}, {
									"data" : null
								},
								/*  { "data": "finish" } */
								],
								"columnDefs" : [
										{
											"targets" : 2,
											"searchable" : false,
											"render" : function(data, type,
													full) {
												if (role == "duty") {
													if (parseInt(data.audit_state) < 1) {
														return "<font style='color: red'>检查中</font>";
														control = "disabled";
													} else if (parseInt(data.audit_state) > 1) {
														return "<font style='color: blue'>已审核</font>";
														control = "disabled";
													} else {
														return "<font style='color: green'>待审核</font>";
														control = "";
													}
												} else if (role == "charge") {
													if (parseInt(data.audit_state) < 1) {
														return "<font style='color: red'>检查中</font>";
														control = "disabled";
													} else if (data.audit_state < 2) {
														return "<font style='color: purple'>待审核</font>";
														control = "disabled";
													} else if (parseInt(data.audit_state) > 2) {
														return "<font style='color: blue'>已审批</font>";
														control = "disabled";
													} else {
														return "<font style='color: green'>待审批</font>";
														control = "";
													}
												}
											}
										},
										{
											"targets" : 3,
											"searchable" : false,
											"render" : function(data, type,
													full) {
												var audit = undefined;
												dailyChk_prj_id = data.prj_id;
												if (role == "duty") {
													audit = "审核";
													if (parseInt(data.audit_state) < 1) {
														control = "disabled";
													} else if (parseInt(data.audit_state) > 1) {
														control = "disabled";
													} else {
														control = "";
													}
												} else if (role == "charge") {
													audit = "审批";
													if (parseInt(data.audit_state) < 2) {
														control = "disabled";
													} else if (parseInt(data.audit_state) > 2) {
														control = "disabled";
													} else {
														control = "";
													}
												}

												return "&nbsp;<a class='btn btn-warning btn-xs "
														+ control
														+ " ' rel='tooltip' data-placement='top'  data-id='"
														+ data.chk_id
														+ "' data-prj='"
														+ data.prj_id
														+ "' data-brgid='"
														+ data.brg_id
														+ "' data-original-title='查看PDF' title='查看PDF' onclick='loadPDF(this)'><i data-original-title='查看PDF' title='查看PDF' class='fa fa-eye'></i></a>&nbsp;&nbsp;<a class='btn btn-warning btn-xs "
														+ control
														+ " ' rel='tooltip'  data-id='"
														+ data.chk_id
														+ "' data-placement='top' data-original-title='"
														+ audit
														+ "' title='"
														+ audit
														+ "' onclick='eval(this)' ><i data-original-title='"+audit+"' title='"+audit+"' class='fa fa-pencil'></i></a>";
											}
										}

								],
								"oLanguage" : { //国际化配置
									"sProcessing" : "正在获取数据，请稍后...",
									"sLengthMenu" : "显示 _MENU_ 条",
									"sZeroRecords" : "没有您要搜索的内容",
									"sInfo" : " _START_ ~  _END_ 条 共 _TOTAL_ 条",
									"sInfoEmpty" : "记录数为0",
									"sInfoFiltered" : "(全部记录数 _MAX_ 条)",
									"sInfoPostFix" : "",
									"sSearch" : "搜索",
									"sUrl" : "",
									"oPaginate" : {
										"sFirst" : "第一页",
										"sPrevious" : "<",
                    				"sNext": ">",
										"sLast" : "最后一页"
									}
								},
								"order" : [ [ 1, 'asc' ] ],

								"preDrawCallback" : function() {
									// Initialize the responsive datatables helper once.
									if (!responsiveHelper_datatable_fixed_column) {
										responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper(
												$('#datatable_fixed_column'),
												breakpointDefinition);
									}
								},
							/*
							 "rowCallback" : function(nRow) {
							 responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
							 },
							 "drawCallback" : function(oSettings) {
							 responsiveHelper_datatable_fixed_column.respond();
							 }
							 */

							});

			$('#datatable_fixed_column tbody').on('click',
					'td.details-control', function() {
						var tr = $(this).closest('tr');
						var row = table.row(tr);

						if (row.child.isShown()) {
							// This row is already open - close it
							row.child.hide();
							tr.removeClass('shown');
						} else {
							// Open this row
							row.child(format(row.data())).show();
							tr.addClass('shown');
						}
					});
		}

		/****************遮罩*****************************************************/

		function showMask() {
			$("#cover").show();
		}
		function hidMask() {
			$("#cover").css('display', 'none');
		}
		/*******************加载PDF*******************************************************************************/
		function loadPDF(obj) {
			var prj_id = $(obj).attr("data-prj");
			var brg_id = $(obj).attr("data-brgid");
			var chk_id = $(obj).attr("data-id");
			showMask();
			$.ajax({
				type : 'POST',
				url : '../DailyChkAuditServlet',
				dataType : 'json',
				data : {
					type : "loadPDF",
					prj_id : prj_id,
					brg_id : brg_id,
					chk_id : chk_id
				},
				error : function(msg) {
					errMessage("PDF生成出错！");
					hidMask();
				},
				success : function(json) {
					if (json.success == "success") {
						var data = json.obj;
						var path = data.path;
						if (getExplorer() == "Firefox") {
							$("#pdf1").prop(
									"src",
									"../PDFDownLoadServer?path="
											+ encodeURI(encodeURI(path)));
						} else if (getExplorer() == "Chrome") {
							var options = {
								height : "600px",
								pdfOpenParams : {
									view : 'FitV',
									page : '2'
								}
							};
							PDFObject.embed("../PDFDownLoadServer?path="
									+ encodeURI(encodeURI(path)), "#pdf",
									options);
						}
						$("#pdf_panel").dialog("open");
					} else {
						$("#pdf1").prop("src", "");
						errMessage("DPF文件生成失败");
					}
					hidMask();
				}
			});

		}

		/*获得浏览器版本*/
		function getExplorer() {
			var explorer = window.navigator.userAgent;
			var version = "";
			if (explorer.indexOf("MSIE") >= 0) {
				version = "ie";
			}
			//firefox
			else if (explorer.indexOf("Firefox") >= 0) {
				version = "Firefox";
			}
			//Chrome
			else if (explorer.indexOf("Chrome") >= 0) {
				version = "Chrome";
			}
			return version;
		}

		/***************审核******************************/
		function eval(obj) {
			var audit = undefined;
			if (role == "duty") {
				audit = "审核";
			} else if (role == "charge") {
				audit = "审批";
			}
			$.SmartMessageBox({
				title : audit + "确认",
				content : "您是否确认" + audit + "该条信息",
				buttons : '[取消][确定]'
			}, function(ButtonPressed) {
				if (ButtonPressed === "确定") {
					evalution(obj);
				}
				if (ButtonPressed === "取消") {
				}
			});
		}

		function evalution(obj) {
			var tr = $(obj).closest('tr');
			var row = table.row(tr);
			setData(row.data());
			var chk_id = $(obj).attr("data-id");
			$.ajax({
				type : 'POST',
				url : '../DailyChkAuditServlet',
				dataType : 'json',
				data : {
					type : "DailyChk_audit",
					chk_id : chk_id
				},
				error : function(msg) {
					errMessage("加载日常检查数据出错！");
				},
				success : function(json) {
					if (json.success == "success") {
						row.data(audit_data);
					}
				}
			});
		}
		
		function setData(data) {
			audit_data.audit_state = parseInt(data.audit_state) + 1;
			audit_data.brg_name = data.brg_name;
			audit_data.brg_no = data.brg_no;
			audit_data.chk_id = data.chk_id;
			audit_data.line_name = data.line_name;
			audit_data.brg_id = data.brg_id;
		}
		/**********************************提示信息*********************************************************************/
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
		
		/****************日历*****************************************************/
		function initCalendar(str,start){
			console.log(str);
			$('#calendar').calendar({
		        width: 380,
		        height: 400,
				format: 'yyyy-mm-dd',
				selectedRang:[start,FormatDate(new Date())],
				data : str,
		        onSelected: function (view, date, data) {
		        	$("#date_pick").val(FormatDate(date));
		        	date_selectd = FormatDate(date);
		        	queryDailyChk_byZone($("#zone_select2").val(), date_selectd,data);
		        	if(data != undefined && data != ""){
		        		$("#prj_pass").attr("disabled",false);
		        	}else{
		        		$("#prj_pass").attr("disabled",true);
		        	}
		        	
		        }
		    });	
		}
		
		function getCalendarData(){
				$.ajax({
				type : 'POST',
				url : '../DailyChkAuditServlet',
				dataType : 'json',
				data : {
					type : "getCalendarData",
					zone_id : $("#zone_select2").val(),
				},
				error : function(msg) {
					errMessage("加载日常检查数据出错！");
				},
				success : function(json) {
					if(json.error !=1){
						$("#date_panel").empty();
						$("#date_panel").append("<div id='calendar'></div>")
						initCalendar(json.obj,json.success);	
					}else{
						if(json.success=="fail"){
							$("#date_panel").empty();
							errMessage("该分区没有日常检查任务");
						}
					}
				}
			});
		}
		/*****************权限设定************************************************************/
		function releaseManage() {//管理人

		}
		function releaseMember() {//参与人

		}
		function releaseGuest(e){//普通用户
			if(e=="superAdmin"){
				initZone_select("charge");
				role = "charge";
				$("#showHistoryDailyGroud").show();
				$("#btn_pass").show();
			}
		
		
		}
		function releaseOrgAdmin() {//管养单位管理员
			errMessage("您没有审核的权限");
		}
		function releaseOrgEngineer() {//管养单位工程师
			errMessage("您没有审核的权限");
		}
		function releaseOrgDuty() {//管养单位分区负责人
			initZone_select("duty");
			role = "duty";
			$("#zone_select2").attr("disabled",true);
			$("#btn_pass").show();
		}
		function releaseOrgCharge() {//管养单位桥梁主管
			initZone_select("charge");
			role = "charge";
			$("#showHistoryDailyGroud").show();
			
		}
	</script>
</body>
</html>