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
<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="../js/libs/jquery-2.1.1.min.js"></script>
<script src="../js/libs/jquery-ui-1.10.3.min.js"></script>
<!-- BOOTSTRAP JS -->
<script src="../js/bootstrap/bootstrap.min.js"></script>
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
<link rel="stylesheet" type="text/css" media="screen"
	href="../css/font.css">
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
</style>
<script type="text/javascript" src="../js/bootstrap/bootstrap.js"></script>
<link rel="stylesheet" href="../css/bootstrap-switch.css"
	type="text/css"></link>
<script type="text/javascript"
	src="../js/bootstrap/bootstrap-switch.min.js"></script>
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
				<li>审核</li>
				<li>评定审核</li>
			</ol>
			<!-- end breadcrumb -->

		</div>
		<!-- END RIBBON -->

		<!-- #MAIN CONTENT -->
		<div id="content">
			<section id="widget-grid">
				<div class="row">

					<%@include file="currentStruct.jsp"%>

					<article class="col-sm-4 col-md-4 col-lg-4">
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

							<header>
								<span class="widget-icon"> <i class="fa fa-sitemap"></i>
								</span>
								<h2>结构</h2>

							</header>

							<div>

								<div class="jarviswidget-editbox"></div>
								<div class="widget-body-toolbar bg-color-white">
									<div class="row col-sm-12 col-md-12 col-lg-12">
										<div class="col-sm-9 col-md-9 col-lg-9"></div>
										<div class="col-sm-3 col-md-3 col-lg-3">
											<input type="checkbox" name="my-checkbox" checked>
										</div>
									</div>
								</div>

								<div class="widget-body">
									<div class="custom-scroll table-responsive"
										style="height:450px; overflow-y: scroll;">
										<div id="jstree" class="tree smart-form">
											<ul id="tree-ul" class="tree">
											</ul>
										</div>
									</div>
								</div>

							</div>

						</div>
					</article>
					<!-- NEW WIDGET START -->
					<article class="col-sm-8 col-md-8 col-lg-8">

						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

							<header>
								<span class="widget-icon"> <i class="fa fa-eye"></i> </span>
								<h2>评定记录审核</h2>

							</header>

							<!-- widget div-->
							<div>

								<!-- widget edit box -->
								<div class="jarviswidget-editbox">
									<!-- This area used as dropdown edit box -->

								</div>
								<div class="widget-body-toolbar bg-color-white ">
									<div class="row col-sm-12 col-md-12 col-lg-12">
										<div class="col-sm-11 col-md-11 col-lg-11"></div>
										<!-- <div class="row" id="shenhe"></div> -->
										<div class="col-sm-1 col-md-1 col-lg-1">
											<button  style="width: 80px;height: 28px" onclick="refresh()" class="btn btn-sm btn-primary " id="refreshDPF" disabled="disabled">刷新</button>
										</div>
									</div>
								</div>
								<!-- end widget edit box -->

								<!-- widget content -->
								<!-- <div class="widget-body no-padding"> -->
								<!-- pdf标签 -->
								<div class="widget-body no-padding" id="pdf">
									<embed id="pdf1" name="pdf" width="100%" height="600px"
										type="application/pdf" internalinstanceid="3">
								</div>
								<!-- <embed src="data/chkReport.pdf" width="100%" height="600px"> -->
								<!-- </div> -->
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

	<%@ include file="footer.jsp"%>

	<!--================================================== -->

	<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
	<script data-pace-options='{ "restartOnRequestAfter": true }'
		src="../js/plugin/pace/pace.min.js"></script>


	<!-- IMPORTANT: APP CONFIG -->
	<script src="../js/app.config.js"></script>

	<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
	<script src="../js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script>



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

	<script src="../jstree/jstree.min.js"></script>
	<!-- pdfobjs -->
	<script type="text/javascript" src="../js/plugin/PDFObjects/pdfobject.js"></script>

	<script type="text/javascript">
		var standard = "";
		var standard_04 = "";
		var standard_11 = "";
		var hhhs;
		var hhhhh;
		var hhhhs;
		var hhbs;
		var hhhbs;
		var briid;
		var bdir;
		var pdir;
		var prjid;
		var briid;
		var passid;
		var culid;
		var model_brg;
		var role = undefined;
		$.fn.bootstrapSwitch.defaults.onColor = 'primary';
		$.fn.bootstrapSwitch.defaults.offColor = 'danger';
		$.fn.bootstrapSwitch.defaults.onText = '已审';
		$.fn.bootstrapSwitch.defaults.offText = '未审';
		$.fn.bootstrapSwitch.defaults.size = 'mini';
		$(document).ready(
				function() {
					// DO NOT REMOVE : GLOBAL FUNCTIONS!
					pageSetUp();
					$("input[name='my-checkbox']").bootstrapSwitch();
					$('input[name="my-checkbox"]').bootstrapSwitch('state',
							false, true);
					$("input[name='my-checkbox']").bootstrapSwitch("disabled",
							true);
					
					
					$('input[name="my-checkbox"]').on(
							'switchChange.bootstrapSwitch',
							function(event, state) {
								console.log(standard);
								console.log(state);
								if (state) {
									Audit(standard);
								} else {
									reAudit(standard);
								}
							});
					/*
					$('#jstree').tree({
						data:{
							type:"json",
							opts:{
								method:"get",
								url:'../EvalAuditServlet?type=BaseTree'
							}
						}
					
					});
					 */
					/*
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

					$.ajax({
							type : 'GET',
							url : '../EvalAuditServlet',
							dataType : 'json',
							data : {
								type : "BaseTree"
							},
							error : function(msg) {
								errMessage("系统错误！");
							},
							success : function(json) {
								if (json.success == "success") {
									console.log(json);
									var len = json.obj.length;
									for ( var a = 0; a < len; a++) {
										if (json.obj[a].state == '1') {
											$("input[name='my-checkbox']").bootstrapSwitch("state",false,true);
											$("input[name='my-checkbox']").on("switchChange.bootstrapSwitch",function(event,state) {
																if (state) {
																	Audit();
																} else {
																	reAudit();
																}
															});
										} else {
											$("input[name='my-checkbox']").bootstrapSwitch("state",true,true);
											$("input[name='my-checkbox']").on("switchChange.bootstrapSwitch",function(event,state) {
																if (state) {
																	Audit();
																} else {
																	reAudit();
																}
															});
										}
									}
								} else if (json.success == "error type") {
									$
											.smallBox({
												title : "处理信息",
												content : "<i class='fa fa-clock-o'></i><i>当前结构不需评定，请重新设置当前结构</i>",
												color : "#C46A69",
												iconSmall : "fa fa-times fa-2x fadeInRight animated",
												timeout : 4000
											});

								}
							}
						});*/
				});

		function initTree() {
			$.ajax({
						type : 'post',
						url : '../EvalAuditServlet',
						dataType : 'json',
						data : {
							type : "BaseTree"
						},
						error : function(msg) {
							errMessage("请求EvalAuditServlet失败");
						},
						success : function(json) {
							if (json.success == "empty") {
								errMessage("请选择结构物");
							}
							else if(json.success == "noprj"){
							errMessage("该结构物下没有正在进行的项目");
							} else {
								var len = json.obj.length
								if (len > 0) {
									$("input[name='my-checkbox']")
											.bootstrapSwitch("disabled", true);
									$("#tree-ul")
											.append(
													"<li class='parent_li' title='展开' id='1"+json.obj[0].id+"'><span id='"
															+ json.obj[0].id
															+ "' onclick='showTreeS(this.id)' style='font-size:10px;font-family:微软雅黑'><i id='i"+json.obj[0].id+"'class='fa fa-lg fa-plus-circle'></i>"
															+ json.obj[0].name
															+ "</span></li>");
									if (len == 1) {
										standard_04 = json.obj[0].standard
												+ "标准";
									} else if (len = 2) {
										standard_04 = json.obj[0].standard
												+ "标准";
										standard_11 = json.obj[1].standard
												+ "标准";
									}
								}
							}
							 if(role=="Member"){
                            	$("input[name='my-checkbox']").bootstrapSwitch("disabled", true);
                            }
						}

					});

		}
		/* 桥二级树 */
		function showTreeS(hid) {
			briid = hid;
			standard = "";
			$("input[name='my-checkbox']").bootstrapSwitch("state", true, true);
			$("input[name='my-checkbox']").bootstrapSwitch("disabled", true);
			if (hhhhh == undefined || hhhhh == null) {
				hhhhh = hid;
			}
			if (hid != hhhhh) {
				$("#h" + hhhhh).remove();
				$("#i" + hhhhh).removeAttr("class");
				$("#i" + hhhhh).attr("class", "fa fa-lg fa-plus-circle");
				$("#h" + hhhhh).remove();
				$("#i" + hhhhh).removeAttr("class");
				$("#i" + hhhhh).attr("class", "fa fa-lg fa-plus-circle");
				$("#h" + hhhhh).remove();
				$("#i" + hhhhh).removeAttr("class");
				$("#i" + hhhhh).attr("class", "fa fa-lg fa-plus-circle");
				hhhhh = hid;
			}
			if ($("#h" + hid).length > 0) {
				$("#h" + hid).remove();
				$("#i" + hid).removeAttr("class");
				$("#i" + hid).attr("class", "fa fa-lg fa-plus-circle");
				$("#h" + hid).remove();
				$("#i" + hid).removeAttr("class");
				$("#i" + hid).attr("class", "fa fa-lg fa-plus-circle");
				$("#h" + hid).remove();
				$("#i" + hid).removeAttr("class");
				$("#i" + hid).attr("class", "fa fa-lg fa-plus-circle");
			} else {
				$("#i" + hid).removeAttr("class");
				$("#i" + hid).attr("class", "fa fa-lg fa-minus-circle");
				$("#i" + hid).removeAttr("class");
				$("#i" + hid).attr("class", "fa fa-lg fa-minus-circle");
				$("#i" + hid).removeAttr("class");
				$("#i" + hid).attr("class", "fa fa-lg fa-minus-circle");
				$("#1" + hid).append("<ul id='h"+hid+"'></ul>");
				if (standard_04 != "") {
					$("#h" + hid)
							.append(
									"<li class='parent_li' id='1"+standard_04+"'><span id='"
											+ standard_04
											+ "' onclick='standardState(this.id)' style='font-size:10px;font-family:微软雅黑'>"
											+ standard_04 + "</span></li>");

				}
				if (standard_11 != "") {
					$("#h" + hid)
							.append(
									"<li class='parent_li' id='1"+standard_11+"'><span id='"
											+ standard_11
											+ "' onclick='standardState(this.id)' style='font-size:10px;font-family:微软雅黑'>"
											+ standard_11 + "</span></li>");

				}

			}
		}
		/*生成pdf*/
		function initBPDF(mode) {
			model_brg = mode;
			showMask();
			$.ajax({
				type : 'POST',
				url : '../EvalAuditServlet',
				dataType : 'json',
				data : {
					type : "initBriPDF",
					mode  : mode
				},
				error : function(msg) {
					errMessage("请求ChkAuditServlet失败");
				},
				success : function(json) {
 					/*pdf_fail*/
					console.log(json);
					if (json.success=="pdf_fail"){
					 $("#pdf1").prop("src","");
						errMessage("DPF文件生成失败");
						}
					else {
					var arr = json.obj;
					var path = arr[0].path;
					console.log(path);					
					if(getExplorer()=="Firefox"){
					$("#pdf1").prop("src","../PDFDownLoadServer?path="+ encodeURI(encodeURI(path)));
					}
					else if(getExplorer()=="Chrome"){
					var options = {
	    			height: "600px",
	    			pdfOpenParams: { view: 'FitV', page: '2' }
					};
					PDFObject.embed("../PDFDownLoadServer?path="+ encodeURI(encodeURI(path)), "#pdf",options);
						}
						}
					$("#refreshDPF").attr("disabled", false);
					hidMask();			
				}
			});
		}
		
		 function refresh() {
					showMask();
					$.ajax({
						type: 'POST',
						url: '../EvalAuditServlet',
						dataType: 'json',
						data: {
							type:"refreshPDF",
							mode  : model_brg
						},
						error : function(msg) {
							errMessage("请求ChkAuditServlet失败");
					    },
						success : function(json) {
							 /*pdf_fail*/
							 console.log(json);
							 if (json.success=="pdf_fail"){
							 $("#pdf1").prop("src","");
								errMessage("DPF文件生成失败");
							}
							else {
							var arr = json.obj;
							var path = arr[0].path;
					if(getExplorer()=="Firefox"){
					$("#pdf1").prop("src","../PDFDownLoadServer?path="+ encodeURI(encodeURI(path)));
					}
					else if(getExplorer()=="Chrome"){
					var options = {
	    			height: "600px",
	    			pdfOpenParams: { view: 'FitV', page: '2' }
					};
					PDFObject.embed("../PDFDownLoadServer?path="+ encodeURI(encodeURI(path)), "#pdf",options);
						}
						}
						hidMask();	
						}
					});
			}
		
		function standardState(id) {
			standard = id;
			if (standard != "") {
				$.ajax({
					type : 'POST',
					url : '../EvalAuditServlet',
					dataType : 'json',
					data : {
						sta : id,
						type : "sta_state"
					},
					error : function(msg) {
						errMessage("系统错误！");
					},
					success : function(json) {
						if (json.success == "success") {
							if (json.obj[0].state == 1) {
								$("input[name='my-checkbox']").bootstrapSwitch(
										"disabled", false);
								$("input[name='my-checkbox']").bootstrapSwitch(
										"state", false, true);
								initBPDF(id);
							} else if (json.obj[0].state == 2) {

								$("input[name='my-checkbox']").bootstrapSwitch(
										"disabled", false);
								$("input[name='my-checkbox']").bootstrapSwitch(
										"state", true, true);
								initBPDF(id);
							}
						}
					}
				});
			} else {
				errMessage("请选择评定标准");
			}
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

		function Audit(id) {
			console.log(id);
			$.SmartMessageBox({
				title : "审核",
				content : "您是否确认审核？",
				buttons : '[取消]&nbsp;[确定]'
			}, function(ButtonPressed) {
				if (ButtonPressed === "确定") {
					$.ajax({
						type : 'GET',
						url : '../EvalAuditServlet',
						dataType : 'json',
						async : false,
						data : {
							type : "Audit",
							id : id
						},
						error : function(msg) {
							errMessage("审核失败！");
						},
						success : function(json) {
							//successMessage("审核成功！");

						}
					});
				}
				if (ButtonPressed === "取消") {
					$('input[name="my-checkbox"]').bootstrapSwitch('state',
							false, true);
				}

			});
		}
		function reAudit(id) {
			console.log(id);
			$.SmartMessageBox({
				title : "取消审核",
				content : "您是否确认审核？",
				buttons : '[取消]&nbsp;[确定]'
			}, function(ButtonPressed) {
				if (ButtonPressed === "确定") {
					$.ajax({
						type : 'GET',
						url : '../EvalAuditServlet',
						dataType : 'json',
						async : false,
						data : {
							type : "reAudit",
							id : id
						},
						error : function(msg) {
							errMessage("取消审核失败！");
						},
						success : function(json) {
							//successMessage("取消审核成功！");

						}
					});
				}
				if (ButtonPressed === "取消") {
					$('input[name="my-checkbox"]').bootstrapSwitch('state',
							true, true);
				}

			});
		}

		function errMessage(info) {
			$.smallBox({
				title : "处理信息",
				content : "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
				color : "#C46A69",
				iconSmall : "fa fa-times fa-2x fadeInRight animated",
				timeout : 4000
			});
		}

		function successMessage(info) {
			$.smallBox({
				title : "处理信息",
				content : "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
				color : "#659265",
				iconSmall : "fa fa-times fa-2x fadeInRight animated",
				timeout : 4000
			});
		}
		function showMask() {
			$("#cover").show();
		}
		function hidMask() {
			$("#cover").css('display', 'none');
		}

		function releaseAdmin() {//管理员
			
		}
		function releaseManage() {//项目负责人
			initTree();
		}
		function releaseMember() {//项目参与人
			if(!manage){
				role="Member";	
			}
	        initTree();
	        if(!manage_role){
	        	 $("#tree-ul").remove();
	 	        errMessage("您没有审核的权限");	
			}
	       
		}
		function releaseGuest() {//普通用户
		}
		function releaseGuest(e){//普通用户
			if(e=="superAdmin"){
    			initTree();
			}
		
		}
	</script>
</body>
</html>