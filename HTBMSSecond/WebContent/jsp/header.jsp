<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华通桥涵管理系统</title>
</head>
<body>

	<!-- HEADER -->
	<header id="header">
		<div id="logo-group" >

			<!-- PLACE YOUR LOGO HERE -->
			<!-- <span id="logo"> <img src="../img/logo.png" alt="SmartAdmin"> </span> -->
			<div class="row" style="width: 600px">
			
				&nbsp;&nbsp;&nbsp;&nbsp;<img alt="华通桥涵管理系统" src="../img/htlogo.png" class="" style="width: 25%;">
				<span id="logo" style="padding-left:0px;font-size:1.5em;font-weight:bold">华通桥涵管理系统</span>
<!-- 				<a style="font-size: 1.5em;cursor: pointer;" href="/HTBMSSecond/DescripDownloadServices" target="_blank"><i class="fa fa-question-circle" ></i></a> -->
			</div>
			<!-- END LOGO PLACEHOLDER -->

			<!-- Note: The activity badge color changes when clicked and resets the number to 0
			Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
			<!-- <span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 1 </b> </span> -->

			<!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
			<div class="ajax-dropdown">

				<!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
				<!-- <div class="btn-group btn-group-justified" data-toggle="buttons">
					<label class="btn btn-default">
						<input type="radio" name="activity" id="../ajax/notify/mail.html">
						消息 (14) </label>
					<label class="btn btn-default">
						<input type="radio" name="activity" id="../ajax/notify/notifications.html">
						通知 (3) </label>
					<label class="btn btn-default">
						<input type="radio" name="activity" id="notify.jsp">
						任务 (4) </label>
				</div> -->
				<div class="text-align-center">
					<label><h4>正在进行项目</h4></label>
				</div>

				<!-- notification content -->
				<div class="ajax-notifications custom-scroll">

					<!-- <div class="alert alert-transparent">
						<h4>Click a button to show messages here</h4>
						This blank page message helps protect your privacy, or you can show the first message here automatically.
					</div>

					<i class="fa fa-lock fa-4x fa-border"></i> -->
					
					<ul class="notification-body no-padding">
						<li>
							<span>
								<div class="bar-holder no-padding">
									<p class="margin-bottom-5"><i class="fa fa-warning text-warning"></i> <strong>黄坝河中桥检查:</strong> <i>定期检查</i> <span class="pull-right semi-bold text-muted">85%</span></p>
									<div class="progress progress-md progress-striped">
										<div class="progress-bar bg-color-teal"  style="width: 85%;"></div>
									</div>
									<em class="note no-margin">启动时间：2016-04-05</em>
								</div>
							</span>
						</li>
						
					</ul>

				</div>
				<!-- end notification content -->

				<!-- footer: refresh area -->
				<!-- <span> Last updated on: 12/12/2013 9:43AM
					<button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..." class="btn btn-xs btn-default pull-right">
						<i class="fa fa-refresh"></i>
					</button> 
				</span> -->
				<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				%>
				<span class="text-align-right"> <%=sdf.format(new Date()) %> </span>
				<!-- end footer -->

			</div>
			<!-- END AJAX-DROPDOWN -->
		</div>

		<!-- projects dropdown -->
		<!--  
		<div class="project-context hidden-xs">

			<span class="label">Projects:</span>
			<span class="project-selector dropdown-toggle" data-toggle="dropdown">Recent projects <i class="fa fa-angle-down"></i></span>

			<ul class="dropdown-menu">
				<li>
					<a href="javascript:void(0);">Online e-merchant management system - attaching integration with the iOS</a>
				</li>
				<li>
					<a href="javascript:void(0);">Notes on pipeline upgradee</a>
				</li>
				<li>
					<a href="javascript:void(0);">Assesment Report for merchant account</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="javascript:void(0);"><i class="fa fa-power-off"></i> Clear</a>
				</li>
			</ul>

		</div>
		-->
		<!-- end projects dropdown -->

		<!-- pulled right: nav area -->
		<div class="pull-right">
			
			<!-- collapse menu button -->
			<!-- <div id="hide-menu" class="btn-header pull-right">
				<span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
			</div> -->
			<!-- end collapse menu -->
			
			<!-- #MOBILE -->
			<!-- Top menu profile link : this shows only when top menu is active -->
			<ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
				<li class="">
					<a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown"> 
						<img src="../img/user.png" alt="John Doe" class="online" />  
					</a>
					<ul class="dropdown-menu pull-right">
						<li>
							<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> 设置</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="profile.html" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> 资料</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> 全屏</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="login.html" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i> <strong>登出</strong></a>
						</li>
					</ul>
				</li>
			</ul>

			<!-- logout button -->
			<!-- <div id="logout" class="btn-header transparent pull-right">
				<span> <a href="login.jsp" title="登出" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i class="fa fa-sign-out"></i></a> </span>
			</div> -->
			<!-- end logout button -->

			<!-- search mobile button (this is hidden till mobile view port) -->
			<!--  
			<div id="search-mobile" class="btn-header transparent pull-right">
				<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
			</div>
			-->
			<!-- end search mobile button -->

			<!-- input: search field -->
			<!--  
			<form action="search.html" class="header-search pull-right">
				<input id="search-fld"  type="text" name="param" placeholder="Find reports and more" data-autocomplete='[
				"ActionScript",
				"AppleScript",
				"Asp",
				"BASIC",
				"C",
				"C++",
				"Clojure",
				"COBOL",
				"ColdFusion",
				"Erlang",
				"Fortran",
				"Groovy",
				"Haskell",
				"Java",
				"JavaScript",
				"Lisp",
				"Perl",
				"PHP",
				"Python",
				"Ruby",
				"Scala",
				"Scheme"]'>
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
				<a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
			</form>
			-->
			<!-- end input: search field -->

			<!-- fullscreen button -->
			<!-- <div id="fullscreen" class="btn-header transparent pull-right">
				<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="全屏显示"><i class="fa fa-arrows-alt"></i></a> </span>
			</div> -->
			<!-- end fullscreen button -->
			
			<!-- #Voice Command: Start Speech -->
			<!--  
			<div id="speech-btn" class="btn-header transparent pull-right hidden-sm hidden-xs">
				<div> 
					<a href="javascript:void(0)" title="Voice Command" data-action="voiceCommand"><i class="fa fa-microphone"></i></a> 
					<div class="popover bottom"><div class="arrow"></div>
						<div class="popover-content">
							<h4 class="vc-title">Voice command activated <br><small>Please speak clearly into the mic</small></h4>
							<h4 class="vc-title-error text-center">
								<i class="fa fa-microphone-slash"></i> Voice command failed
								<br><small class="txt-color-red">Must <strong>"Allow"</strong> Microphone</small>
								<br><small class="txt-color-red">Must have <strong>Internet Connection</strong></small>
							</h4>
							<a href="javascript:void(0);" class="btn btn-success" onclick="commands.help()">See Commands</a> 
							<a href="javascript:void(0);" class="btn bg-color-purple txt-color-white" onclick="$('#speech-btn .popover').fadeOut(50);">Close Popup</a> 
						</div>
					</div>
				</div>
			</div>
			-->
			<!-- end voice command -->

			<!-- multiple lang dropdown : find all flags in the flags page -->
			<!--  
			<ul class="header-dropdown-list hidden-xs">
				<li>
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="img/blank.gif" class="flag flag-us" alt="United States"> <span> English (US) </span> <i class="fa fa-angle-down"></i> </a>
					<ul class="dropdown-menu pull-right">
						<li class="active">
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-us" alt="United States"> English (US)</a>
						</li>
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-fr" alt="France"> Français</a>
						</li>
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-es" alt="Spanish"> Español</a>
						</li>
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-de" alt="German"> Deutsch</a>
						</li>
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-jp" alt="Japan"> 日本語</a>
						</li>
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-cn" alt="China"> 中文</a>
						</li>	
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-it" alt="Italy"> Italiano</a>
						</li>	
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-pt" alt="Portugal"> Portugal</a>
						</li>
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-ru" alt="Russia"> Русский язык</a>
						</li>
						<li>
							<a href="javascript:void(0);"><img src="img/blank.gif" class="flag flag-kr" alt="Korea"> 한국어</a>
						</li>						
						
					</ul>
				</li>
			</ul>
			-->
			<!-- end multiple lang -->

		</div>
		<!-- end pulled right: nav area -->

	</header>
	<!-- END HEADER -->

</body>
</html>