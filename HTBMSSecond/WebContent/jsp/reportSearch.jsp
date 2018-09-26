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
<link rel="stylesheet" type="text/css" media="screen" href="../css/font.css">
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
	<link rel="stylesheet" href="check/jquery.datetimepicker.css" />

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
				data-html="true"> <i class="fa fa-refresh"></i>
			</span>
			</span>

			<!-- breadcrumb -->
			<ol class="breadcrumb">
					<li>文档管理</li><li>报告归档</li><li>查档</li>
				</ol>
			<!-- end breadcrumb -->

		</div>
		<!-- END RIBBON -->

		<!-- #MAIN CONTENT -->
		<div id="content">
		
			<section id="widget-grid">
					<div class="row">
			            
			            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false"
									data-widget-sortable="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-comment"></i> </span>
									<h2>查档</h2>
								</header>
				
				
									<div class="jarviswidget-editbox">
										
									</div>
				
									<div class="widget-body">

										<div id="myTabContent1"
											class="tab-content bg-color-white no-padding">
												<div class="widget-body no-padding">
									<div class="col-xs-12">
										<div class="panel panel-default" >
											<div class="panel-heading">
												<div class="panel-title"  >
													条件录入
													<div id="tabBtn" style="position: absolute;top: 5px;right: 170px;height: 32px;"></div>
													<button class="fa fa-search" style="position: absolute;top: 5px;right: 103px;height: 32px;" onclick="search()">检索</button>
													<button class="fa fa-angle-up" style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;" data-toggle="collapse" data-parent="#accordion" data-target ="#collapseOne"></button>
													<button class="fa fa-angle-down" style="width: 80px;position: absolute;height: 32px;top: 5px;right: 18px;display: none" data-toggle="collapse" data-parent="#accordion" data-target ="#collapseOne"></button>
												</div>
											</div>
											<div id="collapseOne" class="panel-collapse collapse in">
												<div class="panel-body" style="width: 100%;">
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>报告类型</label> 
														<select	class="form-control" id="reporttype2">
														  <option value="%">--全部--</option>
						                                  <option value="科研">科研</option>
						                                  <option value="检测">检测</option>
						                                  <option value="设计">设计</option>
						                                  <option value="施工">施工</option>
						                                </select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>报告名称</label> 
														<input type="text" class="form-control" id="reportname2" placeholder='报告名称'>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>报告编号</label> 
														<input type="text" class="form-control" id="reportid2" placeholder='报告编号'>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>任务单号</label> 
														<input type="text" class="form-control" id="missionno2" placeholder='任务单号'>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>项目名称</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="prjname2" >
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>负责人</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="chargeman2" >
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>出版时间</label> 
														<div>
														<div class="col-xs-6 col-sm-6 col-lg-6" style="padding-left:0px">
														<input type="text" class="form-control" id="publish_start"  placeholder='开始时间' >
														</div>
														<div class="col-xs-6 col-sm-6 col-lg-6" style="padding-right:0px">
														<input type="text" class="form-control" id="publish_end"  placeholder='结束时间' >
														</div>
														</div>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>归档日期</label> 
														<div>
														<div class="col-xs-6 col-sm-6 col-lg-6" style="padding-left:0px">
														<input type="text" class="form-control" id="filing_start"  placeholder='开始时间'>
														</div>
														<div class="col-xs-6 col-sm-6 col-lg-6" style="padding-right:0px">
														<input type="text" class="form-control" id="filing_end"  placeholder='结束时间'>
														</div>
														</div>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>档案编号</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="recordno2" >
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
														<label>结构名称</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="structname" >
														</select>
													</div>
													<div class="form-group col-xs-12 col-sm-6 col-lg-4">
														<label>备注</label> 
														<select style="width:100%" class="form-control input-sm select2"  id="note2" >
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-12">
										<table id="dt_basic" class="table table-striped table-bordered table-hover" style="border-top:1px solid #ddd !important;border-left:1px solid #ddd !important;border-right:1px solid #ddd !important;">
											<thead>	
												<tr>
												    <th style="width: 20px;"></th>
													<th style="width: 50px;">报告类型</th>
													<th style="width: 150px;">报告名称</th>
													<th style="width: 50px;">报告编号</th>
													<th style="width: 50px;">任务单号</th>
													<th style="width: 80px;">项目名称</th>
													<th style="width: 50px;">负责人</th>
									 				<th style="width: 80px;">出版时间</th>
									 				<th style="width: 30px;">份/张</th>
									 				<th style="width: 80px;">归档日期</th>
													<th style="width: 100px;">档案编号</th>
													<th style="width: 50px;">是否公开</th>
													<th style="width: 50px;">合同归档</th>
													<th style="width: 70px;">备注</th>
													<th style="width: 50px;">文件格式</th>
													<th style="width: 50px;">文件大小</th>
													<th style="width: 60px;">操作</th>
												</tr>
											</thead>
											<tbody>
											
											</tbody>
										</table>
									</div>
									</div>
											</div>
											
											</div>
											
											<!-- end widget -->
										</div>
			            </article>
					</div>
				</section>
		</div>
		<!-- END #MAIN CONTENT -->
	</div>
	<!-- END #MAIN PANEL -->
		<div id="cover" class="cover">		
			<div id="loading" class="loading">报告检索中...
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
	<!-- PAGE RELATED PLUGIN(S) -->
	<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
	<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
	<script	src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
	<script src="../js/ajaxfileupload.js"></script>
    <script src="../js/plugin/bootstrap-tags/bootstrap-tagsinput.min.js"></script>
    <script src="http://malsup.github.io/jquery.form.js"></script>
    <script src="check/jquery.datetimepicker.full.min.js"></script>
    <!--laydate日期控件-->
    <script src="../js/laydate/laydate.js"></script>
	<script type="text/javascript">
			

</script>

	<script type="text/javascript">
	Date.prototype.Format = function(fmt)   
	{ //author: meizz
	  var o = {   
	    "M+" : this.getMonth()+1,                 //月份
	    "d+" : this.getDate(),                    //日
	    "h+" : this.getHours(),                   //小时
	    "m+" : this.getMinutes(),                 //分
	    "s+" : this.getSeconds(),                 //秒
	    "q+" : Math.floor((this.getMonth()+3)/3), //季度
	    "S"  : this.getMilliseconds()             //毫秒
	  };   
	  if(/(y+)/.test(fmt))   
	    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
	  for(var k in o)   
	    if(new RegExp("("+ k +")").test(fmt))   
	  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
	  return fmt;   
	} ;
	$.datetimepicker.setLocale('ch');
	
	laydate.render({
		elem:'#publish_start',
		type:'date',
        done: function(date) {
       	 var beginDate=date;  
       	 var endDate=$("#publish_end").val();
       	 var d1 = beginDate;
       	 var d2 = endDate;
       	  if(beginDate!=""&&endDate!=""&&d1 >d2)  
       	 {  
       	  errMessage("开始时间不能大于结束时间！");
       	  $("#publish_start").val(''); 
       	  return false;  
       	 }
       }
	});
	laydate.render({
		elem:'#publish_end',
		type:'date',
        done: function(date) {
          	 var beginDate=$("#publish_start").val();  
          	 var endDate=date;
          	 var d1 = beginDate;
          	 var d2 = endDate;
          	  if(beginDate!=""&&endDate!=""&&d1 >d2)  
          	 {  
          	  errMessage("开始时间不能大于结束时间！");
          	  $("#publish_end").val(''); 
          	  return false;  
          	 }
          }
	});
	laydate.render({
		elem:'#filing_start',
		type:'date',
        done: function(date) {
          	 var beginDate=date;  
          	 var endDate=$("#filing_end").val();
          	 var d1 = beginDate;
          	 var d2 = endDate;
          	  if(beginDate!=""&&endDate!=""&&d1 >d2)  
          	 {  
          	  errMessage("开始时间不能大于结束时间！");
          	  $("#filing_start").val(''); 
          	  return false;  
          	 }
          }
	});
	laydate.render({
		elem:'#filing_end',
		type:'date',
        done: function(date) {
         	 var beginDate=$("#filing_start").val();  
         	 var endDate=date;
         	 var d1 = beginDate;
         	 var d2 = endDate;
         	  if(beginDate!=""&&endDate!=""&&d1 >d2)  
         	 {  
         	  errMessage("开始时间不能大于结束时间！");
         	  $("#filing_end").val(''); 
         	  return false;  
         	 }
         }
	});
	   var download=false;
		$(document).ready(function() {
			    pageSetUp();
			    initSearch();
				initStructs();
				
		});
		
		
		
	   
		
		var table = $('#dt_basic').DataTable( {
			"deferRender": true,
			"processing": true,
			"sDom": 
				"t"+
				"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
	        "columns": [
				{
   					 "class":          'details-control',
   					 "orderable":      false,
  					  "data":           null,
   					 "defaultContent": ''
					}, 
	            { "data": "report_type" },
	            { "data": "report_name" },
	            { "data": "report_id" },
	            { "data": "mission_no" },
	            { "data": "project_name" },
	            { "data": "charge_man" },
	            { "data": "publish_date" },
	            { "data": "copies" },
	            { "data": "filing_date" },
	            { "data": "record_no" },
	            { "data": "is_public" },
	            { "data": "contract_filing" },
	            { "data": "note" },
	            { "data": "report_extension" },
	            { "data": "report_size" },
	            {
	                "orderable":      false,
	                "data":           null
	            },
	        ],
	       "columnDefs": [
					{
					    "targets": 2,
					    "searchable": false,
					    "render": function(data, type, full) {
					  	     if(data.length>11){
					  	    	 return data.substring(0,11)+"...";
					  	     }else{
					  	    	 return data;
					  	     }
					  	  }
					  },
					    {
			      "targets": 16,//哪一列,从0开始
			      "render": function(data, type, full) {//类似format,data:当前表格数据,full:所有数据
			    	    var fn=full.report_dir;
			    	    var edit="<a class='edit btn btn-default btn-xs' href='reportFiling.jsp?id="+full.id+"'><i class='fa fa-pencil'></i></a>";
			            var edit1="<a class='edit btn btn-default btn-xs disabled' href='reportFiling.jsp?id="+full.id+"'><i class='fa fa-pencil'></i></a>";
			            if(fn==""||fn==undefined){
			            	if(download){
			            		return edit;
			            	}else{
			            		return edit1;
			            	}
			            }
			            fn=fn.substring(fn.lastIndexOf('\\')+1,fn.length);
			            var nickname=full.report_name+"."+full.report_extension;
			            if(full.report_name==""||full.report_name==undefined){
			            	nickname=fn;
			            }
			            //下载链接按钮
			            if(download){
			            	return edit+'&nbsp;'+"<a class='btn btn-default btn-xs' href='../FileManageServlet?type=downloadFile&filename="+fn+"&nickname="+nickname+"&filetype=report'> <i class='fa fa-arrow-down'></i></a>";
			            }else{
			            	return edit1+'&nbsp;'+"<a class='btn btn-default btn-xs disabled' href='../FileManageServlet?type=downloadFile&filename="+fn+"&nickname="+nickname+"&filetype=report'> <i class='fa fa-arrow-down'></i></a>";
			            }
			            
			          }
			    }], 
			    "rowCallback": function( row, data, index ) {
			    	     if(data.report_name.length>14){
			    	    	 $('td:eq(2)', row).attr('title',data.report_name);
			    	     }
			    	
			      },
			    "bDestroy": true,
		        "iDisplayLength": 10,
		        "autoWidth" : true,
				"bScrollCollapse" : true,
				"sScrollY" : 400, 
				"sScrollX" : true, 
	        "oLanguage": { //国际化配置  
                "sProcessing" : "正在获取数据，请稍后...",    
                "sLengthMenu" : "显示 _MENU_ 条",    
                "sZeroRecords" : "没有您要搜索的内容",    
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
	        "order": [[1, 'asc']]
	    } );
	   
		
		function initSearch(){
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				data: {
					type:"initSearch"
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败");
			    },
				success : function(json) {   
					 if(json.success=="fail"){
						//errMessage("请求失败");
					 }else{
						 buildSearch(json.obj);
					 }
				}
			});
		}
		
		function buildSearch(data){
			$('#prjname2').empty;
			$('#prjname2').append('<option value="%">--全部--</option>');
			$('#chargeman2').empty;
			$('#chargeman2').append('<option value="%">--全部--</option>');
			$('#recordno2').empty;
			$('#recordno2').append('<option value="%">--全部--</option>');
			$('#note2').empty;
			$('#note2').append('<option value="%">--全部--</option>');
			var rtname=[];var rtid=[];var mnno=[];var pjname=[];var phdate=[];var fgdate=[];
			var rdno=[];var nt=[];var cgman=[];
		   for(var i=0;i<data.length;i++){
			   if(data[i].project_name!=undefined&&data[i].project_name!=''){
				   pjname.push(data[i].project_name);
			   }
			   if(data[i].record_no!=undefined&&data[i].record_no!=''){
				   rdno.push(data[i].record_no);
			   }
			   if(data[i].note!=undefined&&data[i].note!=''){
				   nt.push(data[i].note);
			   }
			   cgman.push(data[i].charge_man);
		   }
		   sortSearch(pjname,$('#prjname2'));
		   sortSearch(rdno,$('#recordno2'));
		   sortSearch(nt,$('#note2'));
		   sortSearch(cgman,$('#chargeman2'));
		}
		
		function sortSearch(arr,node){
			var arr1=arr.sort();
			for(var i=0;i<arr1.length;i++){
				if(i>0&&arr1[i]==arr1[i-1]){
					continue;
				}
				node.append('<option value="'+arr1[i]+'">'+arr1[i]+'</option>');
			}
			node.trigger('change');
		}
		function initStructs(){
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				data: {
					type:"initStructs"
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败");
			    },
				success : function(json) {   
					 if(json.success=="fail"){
						errMessage("请求失败");
					 }else{
						 buildStructs(json.obj);
					 }
				}
			});
		}
		function buildStructs(data){
			$('#manage').empty;
			$('#manage').append('<option value="%">--全部--</option>');
			$('#section').empty;
			$('#section').append('<option value="%">--全部--</option>');
			$('#structname').empty;
			$('#structname').append('<option value="%">--全部--</option>');
			for(var i=0;i<data.manage.length;i++){
				$('#manage').append('<option value="'+data.manage[i]+'">'+data.manage[i]+'</option>');
			}
			for(var i=0;i<data.section.length;i++){
				$('#section').append('<option value="'+data.section[i]+'">'+data.section[i]+'</option>');
			}
			for(var i=0;i<data.structname.length;i++){
				$('#structname').append('<option value="'+data.structname[i]+'">'+data.structname[i]+'</option>');
			}
			$('#manage').trigger('change');
			$('#section').trigger('change');
			$('#structname').trigger('change');
		}
		
		
		
		
		function search(){
			var report_type='%'+$('#reporttype2').val()+'%';
			var report_name='%'+$('#reportname2').val()+'%';
			var report_id='%'+$('#reportid2').val()+'%';
			var mission_no='%'+$('#missionno2').val()+'%';
			var project_name='%'+$('#prjname2').val()+'%';
			var charge_man='%'+$('#chargeman2').val()+'%';
			var record_no='%'+$('#recordno2').val()+'%';
			var note='%'+$('#note2').val()+'%';
			var manage_name='%'+$('#manage').val()+'%';
			var section_name='%'+$('#section').val()+'%';
			var struct_name='%'+$('#structname').val()+'%';
			var publish_start='%'+$('#publish_start').val()+'%';
			var publish_end='%'+$('#publish_end').val()+'%';
			var filing_start='%'+$('#filing_start').val()+'%';
			var filing_end='%'+$('#filing_end').val()+'%';
			var publish_date=publish_start+"\t"+publish_end;
			var filing_date=filing_start+"\t"+filing_end;
			var info={
				report_type:report_type,
			    report_name:report_name,
			    report_id:report_id,
			    mission_no:mission_no,
			    project_name:project_name,
			    charge_man:charge_man,
			    publish_date:publish_date,
			    filing_date:filing_date,
			    record_no:record_no,
			    note:note
			};
			showMask();
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				data: {
					type:"search",
					info:JSON.stringify(info),
					manage_name:manage_name,
					section_name:section_name,
					struct_name:struct_name
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败");
					hidMask();
			    },
				success : function(json) {   
					$('#dt_basic').dataTable().fnClearTable();
					 if(json.success=="fail"){
					 }else{
						 var alldata=json.obj;
						 for(var i=0;i<alldata.length;i++){
							 var data=alldata[i];
							 if(alldata[i].report_id==undefined){
								 alldata[i].report_id="";
							 }
							 if(alldata[i].mission_no==undefined){
								 alldata[i].mission_no="";
							 }
							 if(alldata[i].project_name==undefined){
								 alldata[i].project_name="";
							 }
							 if(alldata[i].charge_man==undefined){
								 alldata[i].charge_man="";
							 }
							 if(alldata[i].copies==undefined){
								 alldata[i].copies="";
							 }
							 if(alldata[i].publish_date==undefined){
								 alldata[i].publish_date="";
							 }
							 if(alldata[i].filing_date==undefined){
								 alldata[i].filing_date="";
							 }
							 if(alldata[i].record_no==undefined){
								 alldata[i].record_no="";
							 }
							 if(alldata[i].is_public==undefined){
								 alldata[i].is_public="";
							 }
							 if(alldata[i].contract_filing==undefined){
								 alldata[i].contract_filing="";
							 }
							 if(alldata[i].note==undefined){
								 alldata[i].note="";
							 }
							 if(alldata[i].report_dir==undefined){
								 alldata[i].report_dir="";
							 }
							 if(alldata[i].report_size==undefined){
								 alldata[i].report_size="";
							 }
							 if(alldata[i].report_extension==undefined){
								 alldata[i].report_extension="";
							 }
						 }
						 
						table.rows.add(alldata).draw( false );
					 }
					 hidMask();
				}
			});
		}
		
		$('#dt_basic tbody').on('click', 'td.details-control', function () {
	        tr = $(this).closest('tr');
	        row = table.row( tr );
	        dom = $(this).parents('tr');
	 
	        if ( row.child.isShown() ) {
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	        }
	        else {
	            if(row.data().reportstruct==undefined){
	            	return;
	            }
	            row.child( format(row.data()) ).show();
	            tr.addClass('shown');
	        }
	    });
		
		function format ( d ) {
		    var html="";
		    if(d!=undefined){
		    	for(var i=0;i<d.reportstruct.length;i++){
					html=html+"<tr><td>"+d.reportstruct[i].struct_name+"</td><td>"+d.reportstruct[i].manage_name+"</td><td>"+d.reportstruct[i].section_name+"</td></tr>";
				}
		    }
		    return '<div style="margin:10px;"><table class="table table-striped table-bordered table-hover table-condensed text-align-center">'+
		    "<thead><tr><th style='text-align:center'>结构物名称</th><th style='text-align:center'>管养单位</th><th style='text-align:center'>所属路段</th></tr></thead><tbody>"+
		      html+
		    '</tbody></table></div>';
		}

		/******************************提示信息*******************************************************************/
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
			
			function releaseAdmin(){//管理员
				download=true;
			}
			function releaseManage(){//项目负责人
				
			}
			function releaseMember(){//项目参与人
				
			}
			function releaseGuest(){//普通用户
			}
			
			function releaseGuest(e){//普通用户
				if(e=="superAdmin"){
     				download=true;
				}
			
			}
			 function showMask(){
		        	$("#cover").show();		
		       	}
		   	function hidMask(){
		       		$("#cover").css('display','none');
		       	}
		</script>

	
</body>
</html>