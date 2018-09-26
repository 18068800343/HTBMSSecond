<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// System.out.println(path);
	// System.out.println(basePath);
%>

<!DOCTYPE html>
<html lang="zh-CN" style="background-color: rgb(231,231,231);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华通桥涵管理系统</title>

<base href="<%=basePath%>">

<!-- #CSS Links -->
<!-- Basic Styles -->
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/font-awesome.min.css">

<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
<link rel="stylesheet" type="text/css" media="screen"
	href="css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/smartadmin-skins.min.css">

<!-- SmartAdmin RTL Support -->
<link rel="stylesheet" type="text/css" media="screen"
	href="css/smartadmin-rtl.min.css">

<!-- We recommend you use "your_style.css" to override SmartAdmin
		     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
		<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->

<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
<link rel="stylesheet" type="text/css" media="screen"
	href="css/font.css">
<!-- #FAVICONS -->
<link rel="shortcut icon" href="img/favicon/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">


<!-- #APP SCREEN / ICONS -->
<!-- Specifying a Webpage Icon for Web Clip 
			 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="img/splash/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="img/splash/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="img/splash/touch-icon-ipad-retina.png">

<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<!-- Startup image for web apps -->
<link rel="apple-touch-startup-image"
	href="img/splash/ipad-landscape.png"
	media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
<link rel="apple-touch-startup-image"
	href="img/splash/ipad-portrait.png"
	media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
<link rel="apple-touch-startup-image" href="img/splash/iphone.png"
	media="screen and (max-device-width: 320px)">
<style type="text/css">
.client-form header {
	padding: 8px 0;
}

.smart-form footer .btn {
	margin: 0;
}

.smart-form footer {
	padding: 5px;
	background: rgba(231, 231, 231, 0);
	border-top: 0;
}

.smart-form fieldset {
	padding: 10px 8px 0 8px;
	background: rgba(231, 231, 231, 0);
}
body {  
    margin: 0;    
    background-color: #22C3AA;  
}  
</style>
</head>
<body>
<!-- <div id="Layer1" style="position:absolute; width:100%; height:100%; background-color: #22C3AA; z-index:-1" >      
<img src="img/brg.jpg" height="100%" width="100%"/>     -->  
</div>  
	<div role="main">
		<div class="container" style="position: relative;">
			<p class="login-header-big"
				style="top:50px;left: 50%;transform: translate(-50%, 0);font-size: 40px;position: absolute;z-index: 1;">华通桥涵管理系统</p>
			<div class="col-xs-12">
				<div class="" align="center"
					style="position: absolute;top: 190px;left: 50%;transform: translate(-50%,0);width: 250px;z-index: 2;">
					<div class=" no-padding">
						<form action="LoginServlet" id="" class="smart-form client-form"
							method="post">
							<fieldset>
								<%
									if (request.getParameter("r") != null
											&& request.getParameter("r").equals("fail")) {
								%>
								<section>
									<label class="label" style="color:red">用户名或者密码错误，请重试！</label>
								</section>
								<%
									}
								%>
								<%
									if (request.getParameter("r") != null
											&& request.getParameter("r").equals("nolicense")) {
								%>
								<section>
									<label class="label" style="color:red">授权认证错误，请联系技术人员！</label>
								</section>
								<%
									}
								%>
								<%
									if (request.getParameter("r") != null
											&& request.getParameter("r").equals("timeout")) {
								%>
								<section>
									<label class="label" style="color:red">授权已过期，请联系技术人员！</label>
								</section>
								<%
									}
								%>
								<section>
									<label class="label">账号</label> <label class="input">
										<i class="icon-append fa fa-user"></i> <input type="text"
										name="username" value=""> <b
										class="tooltip tooltip-top-right"><i
											class="fa fa-user txt-color-teal"></i> 请输入用户名</b> </label>
								</section>
								<section>
									<label class="label">密码</label> <label class="input"> <i
										class="icon-append fa fa-lock"></i> <input type="password"
										name="password" value=""> <b
										class="tooltip tooltip-top-right"><i
											class="fa fa-lock txt-color-teal"></i> 请输入密码</b> </label>
								</section>
							</fieldset>
							<footer>
								<button type="submit" class="btn btn-primary">登录</button>
							</footer>
						</form>
					</div>
				</div>
			</div>
			<div class="col-xs-12">
				<div
					style="position: absolute;top: 510px;left: 50%;transform: translate(-50%,0);width: 470px;z-index: 1;">
					<img class="pull-left" alt="扫描下载APK" src="img/apk.png"
						style="width: 62px;margin-right: 15px;">
					<p class="pull-left"
						style="width: 300px;font-size: 13px;color: rgb(78,94,116);">
						华通桥涵v2.2&nbsp;&nbsp;&nbsp;Android版扫码下载 &nbsp; &nbsp; &nbsp;<a
							href="javascript:void(0)" id="checkPower">查看授权</a>
					</p>
					<br>
					<p class="pull-left" style="width: 385px;font-size: 13px;">
						版权所有：江苏华通工程检测有限公司&nbsp;&nbsp;南京市秦淮区紫云大道9号<br>
						技术支持：南京棱点信息科技有限公司&nbsp;&nbsp;南京市秦淮区永智路6号
					</p>
					<br>
				</div>
			</div>
		</div>
	</div>
	<div id="showBox" hidden="hidden">
		<table id="t1" class="table table-bordered table-striped">
		</table>
	</div>
	<!--================================================== -->

	<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
	<script src="js/plugin/pace/pace.min.js"></script>

	<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->

	<script src="js/libs/jquery-2.1.1.min.js"></script>
	<script src="js/libs/jquery-ui-1.10.3.min.js"></script>

	<!-- IMPORTANT: APP CONFIG -->
	<script src="js/app.config.js"></script>

	<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

	<!-- BOOTSTRAP JS -->
	<script src="js/bootstrap/bootstrap.min.js"></script>

	<!-- JQUERY VALIDATE -->
	<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>

	<!-- JQUERY MASKED INPUT -->
	<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>
	<script src="js/jquery.cookie.js"></script>
	<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

	<!-- MAIN APP JS FILE -->
	<script src="js/app.min.js"></script>

	<script type="text/javascript">
		var pathname= location.pathname
		var project= pathname.substring(0,pathname.substr(1).indexOf('/')+1);
		runAllForms();
		$(function() {
			// Validation
			$("#login-form").validate({
				// Rules for form validation
				rules : {
					username : {
						//email : true,
						required : true
					},
					password : {
						//minlength : 3,
						//maxlength : 20,
						required : true
					}
				},

				// Messages for form validation
				/*
				messages : {
					email : {
						required : 'Please enter your email address',
						email : 'Please enter a VALID email address'
					},
					password : {
						required : 'Please enter your password'
					}
				},
				 */
				messages : {
					username : {
						required : '请输入用户名'
					},
					password : {
						required : '请输入密码'
					}
				},

				// Do not change code below
				errorPlacement : function(error, element) {
					error.insertAfter(element.parent());
				}
			});
		});

		$("#checkPower").click(function getCheckPower() {
			removeTabel();
			$.ajax({
				type : 'POST',
				url : '..'+project+'/UserMgrServlet',
				dataType : 'json',
				data : {
					type : "checkPower",
				},
				error : function(msg) {
				},
				success : function(json) {
					if(json.success=="success"){
						var t = $("#t1");
						if(json.obj.date_limit=="#"){
							t.append("<tr><th>授权到期</th><td>不限</td></tr>");
							t.append("<tr><th>授权结构数</th><td>不限</td></tr>");
							t.append("<tr><th>授权报告数</th><td>不限</td></tr>");
						}else{
						t.append("<tr><th>当前日期</th><td>"+json.obj.date_now+"</td><th>授权到期</th><td>"+json.obj.date_limit+"</td></tr>");
						t.append("<tr><th>已用结构数</th><td>"+json.obj.struct_no+"</td><th>授权结构数</th><td>"+json.obj.struct_limit+"</td></tr>");
						if(json.obj.report_limit=="*"){
							t.append("<tr><th>已用报告数</th><td>"+json.obj.report_no+"</td><th>授权报告数</th><td>不限</td></tr>");
						}else{
							t.append("<tr><th>已用报告数</th><td>"+json.obj.report_no+"</td><th>授权报告数</th><td>"+json.obj.report_limit+"</td></tr>");
						}
						}
						
						
					}
				}
			});
			$('#showBox').dialog("open");
			//getModelDefectServicesData();
		});
		
		
		$('#showBox').dialog({
			autoOpen : false,
			width : 500,
			height : 200,
			resizable : false,
			modal : true,
			show : 'drop',
			hide : 'drop'
		});
		/**
		function getModelDefectServicesData(){
				$.ajax({
				type : 'POST',
				url : '..'+project+'/ModelDefectServices',
				dataType : 'json',
				data : {
					style : "json",//"json"或者"jsonp"
					bridge : "32954458d5764018ad9311a6334760e5",//桥梁ID
					span : "1",//跨号
					direction : "无",//方向
					member :  "0#台背墙",//构建编号
				},
				error : function(msg) {
				},
				success : function(json) {
					if(json.code=="1000"){//错误代码:1001缺少参数，1002参数无效，code=1003未参加项目，code=1004不存在结构物，code=1005构件不存在
					var data = json.data.defects;
						for(var i = 0; i<data.length;i++){
							console.log("defect_location_desc:"+data[i].defect_location_desc+"   defect_name:"
							+data[i].defect_name+"    defect_count:"+data[i].defect_count);
						}
					}
				}
			});
		}
		*/
		
		function removeTabel() {
		var tr = $("#t1").find("tr");
		for ( var i = 0; i < tr.length; i++) {
			tr[i].remove();
		}
	}
		$.cookie('structSearchInfo','');
		
	</script>

</body>
</html>