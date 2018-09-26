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
<link rel="stylesheet" href="../css/bootstrap-switch.css"
    type="text/css"></link>


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
												
													<a class="btn btn-primary pull-right" href="./prjMgr2.jsp">
													返回上一页 </a>
													
											</div>

										</div>


									</div>
									<table id="prjTable"
										class="table table-striped table-bordered table-hover"
										style="width: 100%">
										<thead>
											<tr>
												<th>分区</th>
												<th>负责人</th>
												<th>参与人</th>
												<th>是否自动建立</th>
												<th>操作</th>
												<th>orgid</th>
												<th>zoneid</th>
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
		
		<div id="newPrj" hidden="hidden">
		<!-- #MAIN CONTENT -->
		<div id="content">
				<!-- widget grid -->
				<!-- row -->

					<!-- SINGLE GRID -->

						<!-- Widget ID (each widget will need unique ID)-->



							<!-- widget div-->
							<div>


								<!-- widget content -->



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



								<!-- end widget content -->

							</div>
							<!-- end widget div -->


						<!-- end widget -->

					<!-- END GRID -->


				<!-- end row -->
			<!-- end widget grid -->
		</div>
		<!-- END #MAIN CONTENT -->
	</div>
	</div>
	<!-- END #MAIN PANEL -->
	
	

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
 	<script type="text/javascript"
        src="../js/bootstrap/bootstrap-switch.min.js"></script>
	<script
		src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
	<script src="../js/myTool.js"></script>
	<script type="text/javascript">
	//初始化开关控件bootstrapswitch样式
	
	
	var orgid = '<%=session.getAttribute("orgid")%>';
		$(document).ready(function() {
			
			pageSetUp();
			//initStructTable();
			initPrjTable();
			onChange();
		});

		
		
        //定义日常项目表格datatable
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
							"columns" : [  {
								"data" : "zone_name"
							}, {
								"data" : "prj_charge_man"
							}, {
								"data" : "check_people"
							},{
								"data" : 'build_prj', "width": 200,  render: function(data, type, full){
									if(data=='0'){
										return '<div class="switch"><input id ="prj_build"  type="checkbox" data-id="0" data-zone_id="'+full.zone_id+'" data-full="'+full+'" data-prj_charge_man="'+full.prj_charge_man+'"  data-check_people="'+full.check_people+'"></div>';
									}
									if(data=='1'){
										return "<div class='switch'><input id ='prj_build'  type='checkbox' data-id='1' data-zone_id='"+full.zone_id+"' data-full='"+full+"' data-prj_charge_man='"+full.prj_charge_man+"' data-check_people='"+full.check_people+"'></div>";
									}
								}
							}, {
								"data" : null
							},{
								"data" : "org_id",
								"visible":false
							}, {
								"data" : "zone_id",
								"visible":false
							}],
							"columnDefs" : [
									{
										"targets" : 4,
										"searchable" : false,
										"render" : function(data, type, full) {
											return "<button class='btn btn-xs btn-primary' data-prj_charge_man='"+full.prj_charge_man+"' data-check_people='"+full.check_people+"' data-zone_id='"+full.zone_id+"' onclick='newProject(this)'>配置</button>";
										}
									}],
							"order" : [ [ 6, 'asc' ] ],
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


        //初始化分区日常项目表格
		function initPrjTable() {
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				async:false,
				data : {
					type : "initZoneDailyPrj",
					orgid:orgid
				},
				error : function(msg) {
					errMessage("请求PrjMgrServlet失败");
					$('#prjTable').dataTable().fnClearTable();
				},
				success : function(json) {
					if(json.error==0){
					$('#prjTable').dataTable().fnClearTable();
					prjTable.rows.add(json.obj).draw(false);
					
					//var doms = $("#prj_build");
					$(".switch input").each(function(){
						if($(this).attr("data-id")=='0'){
							$(this).bootstrapSwitch('state',false,true);
						}else{
							$(this).bootstrapSwitch('state',true,true);
						}
					});
					}else{
						errMessage("本公司下无分区");
					}
				}
			});
		}
		
		
		
		//给bootstrapswitch绑定变化事件
		var holeLength=-1;//初始化结构物是否有值变量
		var pageZoneId=undefined;
		
		
		function onChange(){
		$(".switch input").each(function(){
			var dom = $(this);
			
		//给每一行的开关按钮，即swithChange绑定change事件
		$(this).on('switchChange.bootstrapSwitch', function (e, state) {
			//console.log($(this).attr("data-zone_id"));
			var zone_id=$(this).attr("data-zone_id");
			var check_people=$(this).attr("data-check_people");
			var prj_charge_man=$(this).attr("data-prj_charge_man");
			if(check_people==null||check_people==undefined||check_people.trim()==''){
				errMessage("无工程师，无法建立日常项目");
				$(dom).bootstrapSwitch('state',false, true);
			}
			if(prj_charge_man==null||prj_charge_man==undefined||prj_charge_man.trim()==''){
				errMessage("无负责人，无法建立日常项目");
				$(dom).bootstrapSwitch('state',false, true);
			}
			
			queryStruct(zone_id);//查询分区下结构物
			if(holeLength==0){
				errMessage("无结构物，无法建立日常项目");
				$(dom).bootstrapSwitch('state',false, true);
			}
			if(check_people.trim()!=''&&prj_charge_man.trim()!=''&&holeLength==1){
				
			if(state){
				build_prj=1;
				
			}else{
				build_prj=0;
			}
			setZoneBuild_prj(build_prj,zone_id);
			}
			
		});
		});
		}
		
		//标志位改变事件
		
		function setZoneBuild_prj(build_prj,zone_id){
			$.SmartMessageBox({
		        title: "设置提示",
		        content: "确定改变日常项目设置?",
		        buttons: '[No][Yes]'
		    }, function (ButtonPressed) {
		        if (ButtonPressed === "Yes") {
		        	$.ajax({
			  			type: 'POST',
			  			url: '../OrgManagerServlet',
			  			dataType: 'json',
			  			data: {
			  				build_prj:build_prj,
			  				zone_id:zone_id,
			  				type: "setZoneBuild_prj",
			  			},
			  			error : function(msg) {
			  				errMessage("请求setZoneBuild_prj失败");
			  		    },
			  			success : function(json) { 
			  				if(json.success=='success'){
			  					 successMessage("设置成功");
			  				}else{
			  					errMessage("设置失败");
			  				}
			  			}
		  				});
		        }else{
		        	initPrjTable();
		        	onChange();
		        }

		    });
		}
		/* function setZoneBuild_prj(build_prj,zone_id){
			 $.ajax({
		  			type: 'POST',
		  			url: '../OrgManagerServlet',
		  			dataType: 'json',
		  			data: {
		  				build_prj:build_prj,
		  				zone_id:zone_id,
		  				type: "setZoneBuild_prj",
		  			},
		  			error : function(msg) {
		  				errMessage("请求setZoneBuild_prj失败");
		  		    },
		  			success : function(json) { 
		  				if(json.success=='success'){
		  					 successMessage("设置成功");
		  				}else{
		  					errMessage("设置失败");
		  				}
		  			}
	  				});
		} */
		
		
		
		//根据分区id查询结构物，回调函数给全局变量赋值
		function queryStruct(zone_id){
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				async:false,
				data: {
					id:zone_id,
					type: "getStructByid",
				},
				error : function(msg) {
					errMessage("加载结构物信息失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						data = json.obj;
						    holeLength=-1;
						if(data==''){
							holeLength=0;
						}
						else{
							holeLength=1;
						}
					}else{
						errMessage("加载结构物信息失败");
					}
				}
				});
		}
		/**********************************日常检查配置人员*********************************************************************/
		var dataPage=undefined;
		var pageCheckPeople=undefined;
		var pagePrjChargeMan=undefined;
		//配置人员按钮方法
		function newProject(dom) {
			$('#newPrj').dialog('open');
			$("#checkPeopleBox").attr("checked",false);//初始化单选框
			$("#checkPeopleBox").parent().prev().text("添加本公司工程师");//初始化单选框
			dataPage=$(dom).attr("data-zone_id");
			pageCheckPeople=$(dom).attr("data-check_people");
			pagePrjChargeMan=$(dom).attr("data-prj_charge_man");
			var d1 = $('#prj_charge_man').empty().trigger('change');
			var d2 = $('#prj_member').empty().trigger('change');
			initUser(dataPage);
		}
		//配置人员弹出框
		$('#newPrj').dialog({
			autoOpen : false,
			width : 800,
			height:250,
			resizable : false,
			modal : true,
			show : 'drop',
			hide : 'drop',
			title : "配置人员",
		});
		//配置人员弹出框dialog保存事件
		$('#newPrj').dialog({
			  buttons: [
			    {
			    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
			      "class" : "btn btn-default",
			      click: function() {
	    	           var prjChargeMan= $('#prj_charge_man').val();
	    	           var checkPeople= $('#prj_member').val();
	    	           if(checkPeople!=null&&checkPeople!=''){
	    	        	   checkPeople=checkPeople.toString();
	    	        	   
	    	           }else{
	    	        	   checkPeople='';
	    	        	   }
	    	           $.ajax({
	    					type : 'POST',
	    					url : '../PrjMgrServlet',
	    					dataType : 'json',
	    					data : {
	    						prjChargeMan:prjChargeMan,
	    					    checkPeople:checkPeople,
	    						zone_id:dataPage,
	    						type : "updateDailyPrj"
	    					},
	    					error : function(msg){
	    						errMessage("请求PrjMgrServlet失败");
	    					},
	    					success : function(json) {
	    						if (json.success == "fail") {
    								errMessage("服务器错误");
	    						} else {
	    							successMessage("配置成功");
	    							$('#newPrj').dialog('close');
	    							initPrjTable();
	    							onChange();
	    						}
	    					}
	    				});
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
		
		//@author xianing 配置检测公司人员input框change事件
		function selectCheckPeople(){
			var $isChecked = $("#checkPeopleBox").is(":checked");
			if($isChecked){
				$("#checkPeopleBox").parent().prev().text("添加检测公司工程师");
				initCheckPeople();
			}else{
				$("#checkPeopleBox").parent().prev().text("添加本公司工程师");
				initUser(dataPage);
			}
		}
		
		
		//@author xianing 初始化检测公司下拉框
		function initCheckPeople() {
			$.ajax({
				type : 'POST',
				url : '../PrjMgrServlet',
				dataType : 'json',
				data : {
					type : "initCheckPeople"
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
						var array = pageCheckPeople.replace(" ","").split("#");
						var ll = json.obj;
						for (var i = 0; i < ll.length; i++) {
							d2.append('<option>' + ll[i] + '</option>');
						}
						d2.val(array).trigger('change');
						console.log(array);
						d2.trigger('change');
					}
				}
			});
		}
		
		//@author xianing 初始化分区人员下拉框
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
						var array = pageCheckPeople.replace(" ","").split("#");
					    var array1=pagePrjChargeMan.replace(" ","").split("#");
						var d1 = $('#prj_charge_man').empty();
						var d2 = $('#prj_member').empty();
						var ll = json.obj;
						var orgCharge = ll[0];
						var orgEngineer = ll[1];
						var prj_memberArray = new Array();
						for (var i = 0; i < orgCharge.length; i++) {
							d1.append('<option>' + orgCharge[i] + '</option>');
							
						}
						for (var i = 0; i < ll[0].length; i++) {
							prj_memberArray.push(orgEngineer[i]);
							d2.append('<option>' + orgEngineer[i] + '</option>');
						}
						d2.val(array).trigger('change');
						d1.val(array1).trigger('change');
						d1.trigger('change');
						d2.trigger('change');
					}
				}
			});
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
		
		function releaseAdmin() {//管理员
		}
		function releaseManage() {//项目负责人

		}
		function releaseMember() {//项目参与人

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