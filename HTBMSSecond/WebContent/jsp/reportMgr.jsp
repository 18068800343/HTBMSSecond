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
	
	 #sort { 
	 list-style-type: none;
	 padding-top: 10px;
	 }
	 #sort  li{ 
	 	width: 150px;;
	 	height: 30px;
	 	margin-top: 5px;
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
									<h2>报告</h2>
				
								</header>
								
								<% 
										if(oc==null){
									%>
									 	<div>
										<div class="widget-body no-padding">
										
										<h4>您好，当前没有选中任何结构物。请至 <b>结构</b> 选择一个结构物</h4>
										
										</div>
										</div>
									<%
										}else{
												if(true){
													%>
													
								<!-- widget div-->
								<div>
				
									<!-- widget edit box -->
									<div class="jarviswidget-editbox">
										<!-- This area used as dropdown edit box -->
				
									</div>
									<!-- end widget edit box -->
				
									<!-- widget content -->
									<div class="widget-body no-padding">
										
										<div class="widget-body-toolbar bg-color-white">
												<div class="row">
													<div class="col-sm-12 col-md-12 text-align-right">
													<div class="pull-left col-xs-3"><input class="form-control" id="searchData" value="" placeholder="搜索" type="text"></div>
														<a  class="btn btn-default" href="imgMgr.jsp">图片</a>
														<a  class="btn btn-primary" onclick="newReport()">生成报告</a>
													</div>
												</div>
										</div>
										
										<table id="reportGrid" class="table table-striped table-bordered table-hover"  style="width: 100%">
											<thead>			                
												<tr>
													<th> 项目名称</th>
													<th> 文件名</th>
													<th> 报告组成</th>
													<!-- <th> 执行标准</th> -->
													<th> 生成时间</th>
													<th> 操作</th>
												</tr>
											</thead>
										</table>
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
													
													<%
												}
												%> <script>var info=<%=JSON.toJSONString(oc)%></script> <%
										}
									%>
				
				
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
			<form class="form-horizontal" >
															
				<fieldset class="demo-switcher-1">
					<div class="form-group">
						<label class="control-label col-md-3">检查记录（任务号）</label>
						<div class="col-md-9">
							<select class="form-control" id="prj" style="width:100%">
							
							</select>
						</div>
					</div>		
					<div id="spanChoice" class=" col-xs-12"  style="padding: 0;margin-bottom: 0;">
							<div class="direction col-md-12 form-group" >
								<input type="button" class="btn btn-primary btn-sm" value="全部" onclick="returnBack()">
 								<input type="button" class="btn btn-primary btn-sm" value="选择跨检查" onclick="getStride()">
							</div>
							<div id="kuachoice" class="span-range col-md-12 form-group" hidden="hidden">
							</div>
					</div>												
					<div class="form-group col-xs-6" id="build">
						<label class="control-label col-md-5">报告组成</label>
						<div class="col-md-7">
							<label class="checkbox">
								  <input type="checkbox" class="checkbox style-0"  data-name="1" checked="checked" data-value="封面">
								  <span>结构封面</span>
							</label>
							<label class="checkbox">
								  <input type="checkbox" class="checkbox style-0" data-name="5" checked="checked" data-value="检查记录">
								  <span>结构卡片</span>
							</label>
							<label class="checkbox brg">
								  <input type="checkbox" class="checkbox style-0" data-name="2" checked="checked" data-value="部件评定结果报告">
								  <span>04规范</span>
							</label>
							<label class="checkbox brg" >
								  <input type="checkbox" class="checkbox style-0" data-name="3" checked="checked" data-value="总体评定结果报告">
								  <span>11规范</span>
							</label>
							<label class="checkbox">
								  <input type="checkbox" class="checkbox style-0"  data-name="6" checked="checked" data-value="封面">
								  <span>结构概述</span>
							</label>
							<label class="checkbox">
								  <input type="checkbox" class="checkbox style-0" data-name="4" checked="checked" data-value="检查记录">
								  <span>检查记录</span>
							</label>
						</div>
					</div>
					<div class="form-group col-xs-6" id="sp">
						<label class="col-md-4 control-label">报告排序</label>
						<div class="col-md-8" >
							<ul id="sort" style="height: 240px;width: 200px;">
								<li class="btn btn-default" data-name="1">结构封面</li>
								<li class="btn btn-default" data-name="5">结构卡片</li>
								<li class="btn btn-default brg" data-name="2">04规范</li>
								<li class="btn btn-default brg" data-name="3">11规范</li>
								<li class="btn btn-default" data-name="6">结构概述</li>
								<li class="btn btn-default" data-name="4">检查记录</li>
							</ul>
						</div>
					</div>		
						
				</fieldset>																																	
				<!-- <div class="form-actions">
					<div class="row">
						<div class="col-md-12">
							<button class="btn btn-primary" type="submit">
								生成报告
							</button>
						</div>
					</div>
				</div> -->

			</form>
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
		
		<script type="text/javascript">
		var report_type="all";
		
			$(document).ready(function() {
				pageSetUp();
				<%if(oc!=null){%>
				initTable();
				initPrj();
				<%}%>
				if(info.mode!='bridge'){
					$('.brg').remove();
				}
				$( "#sort" ).sortable({
				      placeholder: "ui-state-highlight",
				    	  containment: "#sort",
				    	  scroll: false
				    });
				
		//		buildStructArea();
			});
			
			$('#searchData').on('change', function(){
				var d = $(this).val();
				table.search(d).draw(true);
			});
			var table = $('#reportGrid').DataTable( {
				"deferRender": true,
				"processing": true,
		    	"sDom":
					"t"+
					"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
		        "bDestroy": true,
		        "iDisplayLength": 10,
		        "oLanguage": {
				    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
				},
		        "columns": [
		            { "data": "prj_name" },
		            { "data": "report_file_name" },
		            { "data": "report_build" },
		           // { "data": "report_sp" },
		            { "data": "report_date" },
		            {
		                "orderable":      false,
		                "data":           null,
		                "defaultContent": "<button class='down btn btn-warning btn-xs'><li class='fa fa-download'></li></button><button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button>"
		            },
		        ],
		        "columnDefs": [ 
		                         {
				      "targets": 2,
				      "render": function(data, type, full) {
				    		  return formatBuild(data);
				          }
				    } ],
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
			
			var tableData = {
					report_id:undefined,
					prj_id:undefined,
					prj_name:undefined,
					struct_id:undefined,
					struct_mode:undefined,
					report_file_name:undefined,
					report_file_path:undefined,
					report_date:undefined,
					report_build:undefined,
					report_sp:undefined
			}
			
			function initTable(){
				tableData.prj_id=info.prj_id,
				tableData.struct_id = info.id;
				tableData.struct_mode = info.mode;
				
				$.ajax({
					type: 'POST',
					url: '../ReportMgrServlet',
					dataType: 'json',
					data: {
						type:"initTable",
						tableData:JSON.stringify(tableData)
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
							 $('#reportGrid').dataTable().fnClearTable();
						 }else{
							 $('#reportGrid').dataTable().fnClearTable();
							 var data = json.obj;
							 table.rows.add(data).draw(false); 
						 }
					}
				});
			}
			
			
			//报告组成设置
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
			
			//设置跨选择
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
			
			function getStride(){
				report_type="span";
				console.log(info);
				var struct = {
						struct_id: info.id,
						struct_mode: info.mode
				}
				$.ajax({
					type: 'POST',
					url: '../ReportMgrServlet',
					dataType: 'json',
					async:false,
					data: {
						type:"getDircetionSpan",
						struct : JSON.stringify(struct)
					},
					error : function(msg) {
						errMessage("请求ReportMgrServlet失败");
				    },
					success : function(json) {
						var kuachoice=$("#kuachoice").html('');
						
						for(var dir in json.obj){
							var spanMax=json.obj[dir];
							kuachoice.append('<div id="abcd" class="form-inline">'+
				 	 									'<label>'+dir+'</label>'+
				 	 									'<input  type="text" data-span="'+dir+'" class="form-control span_no" style="" placeholder="1-'+spanMax+'" value="">'+
				 	 								'</div>');
							
						}
						$("#kuachoice").css("display","block");
							kuachoice.find('input:text').on('change', function(){
											var spanStr = this.value;
												try{
													spanMin0 = Number(spanStr.split('-')[0]);
													spanMax0 = Number(spanStr.split('-')[1]);
													if(spanMin0<1 || spanMin0>spanMax0){
														alert('跨输入格式有错');
														this.value = '1-'+spanMax;
														return false;
													}
													if(spanMax0>spanMax){
														alert('跨输入格式有错');
														this.value = '1-'+spanMax;
														return false;
													}
												}catch(e){
													alert('跨输入格式有错');
													this.value = '1-'+spanMax;
													return false;
												}
											});
					}
				});
			}
			
			function returnBack(){
				$("#kuachoice").html('');
				$("#kuachoice").hide();
				report_type="all";
			}
			
			
	//		function buildStructArea(){
	//			var struct = {
	//					struct_id: info.id,
		//				struct_mode: info.mode
		//		}
		//		 $.ajax({
			//			type: 'POST',
			//			url: '../ReportMgrServlet',
			//			dataType: 'json',
			//			data: {
			//				type:"getDircetionSpan",
			//				struct : JSON.stringify(struct)
			//			},
			//			error : function(msg) {
			//				errMessage("请求ReportMgrServlet失败");
			//		    },
			//			success : function(json) {
			//				var dom = $('#spanChoice');
					//		dom.find('.direction').append(
					//				'<input type="button" class="btn btn-primary btn-sm" name="'+struct.struct_id+'" value="全部">'+
					//				'<input type="button" class="btn btn-primary btn-sm" value="选择跨检查" onclick="getStride()">');
							
						//	for(var dir in json.obj){
						//		kuachoice.append('<label class="radio radio-inline">'+
						//		'<input type="radio" class="radiobox" name="'+struct.struct_id+'" value="'+dir+'" data-span="'+json.obj[dir]+'">'+
						//		'<span>'+dir+'</span>'+
						//		'</label>');
						//	}
						//	dom.find('input:radio').on('change', function(){
						//		dom.find('.span-range').empty();
						//		var dir = this.value;
						//		var spanMax = $(this).attr('data-span');
						//		if(dir=='全部'){
						//			return false;
						//		}else{
						//			dom.find('.span-range').append('<div class="form-inline">'+
	 	 				//					'<label>'+dir+'：</label>'+
	 	 				//					'<input type="text" class="form-control" style="" value="1-'+spanMax+'">'+
	 	 				//				'</div>');
						//			dom.find('input:text').on('change', function(){
						//			var spanStr = this.value;
						//				try{
						//					spanMin0 = Number(spanStr.split('-')[0]);
						//					spanMax0 = Number(spanStr.split('-')[1]);
						//					if(spanMin0<1 || spanMin0>spanMax0){
						//						alert('跨输入格式有错');
						//						this.value = '1-'+spanMax;
						//						return false;
						//					}
						//					if(spanMax0>spanMax){
						//						alert('跨输入格式有错');
						//						this.value = '1-'+spanMax;
						//						return false;
						//					}
						//				}catch(e){
						//					alert('跨输入格式有错');
						//					this.value = '1-'+spanMax;
						//					return false;
						//				}
						//			});
						//		}
						//	});
				//		}
				//	}); 
	//		}
			
			
			function addReport(){
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
				tableData = {};
				tableData.report_build = build;
				tableData.report_sp = sp;
				tableData.report_file_name = name;
				tableData.prj_id = prj_id;
				tableData.prj_name = $("#prj option[value='"+prj_id+"']").html();
				tableData.struct_id = info.id;
				tableData.struct_mode = info.mode;
				tableData.chk_type=info.chk_type;
				tableData.report_date="2016-09-24 17:01:01";
				ParaMsg = "2,"+prj_id+","+info.id+","+sp+","+build;
				//加入跨的识别和校验
				var $radio = $('#spanChoice').find('input[name="'+info.id+'"]:checked');
				var direction = $radio.val();
				console.log(direction);
				var span_no = $radio.attr('data-span');
				var spanMin = 1;
				var spanMax = 1;
				if(direction=='全部'){
					spanMin = 1;
					spanMax = 1;
				}else{
					var spanStr = $('#spanChoice').find('input:text').val();
					spanMin = Number(spanStr.split('-')[0]);
					spanMax = Number(spanStr.split('-')[1]);
					if(spanMin==1 && spanMax==span_no){
						tableData.report_file_name = tableData.report_file_name+'('+direction+')';
					}else{
						tableData.report_file_name = tableData.report_file_name+'('+direction+'['+spanStr+'])';
					}
				}
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
							case 4:
								errMessage("报告生成次数已达上限，请联系技术人员");
								$('#rgw').dialog('close');
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
				
			}
			
			function addTableRow(){
				table.row.add(tableData).draw(false);
			}
			
	/* 		$('#sp input').change(function(){
				var d = $('#build input').eq(2);
				var s = $(this).attr('data-name');
				if(s=="2004"){
					d.prop('checked', false);
					d.prop('disabled', 'disabled');
				}else{
					d.prop('checked', 'checked');
					d.prop('disabled', false);
				}
		}) */
		
			$('#reportGrid').delegate('.del','click', function () {
				var dom = $(this).parents('tr');
				var data = table.row(dom).data();
				$.SmartMessageBox({
			        title: "删除提示",
			        content: "确认删除该条记录吗",
			        buttons: '[取消][确定]'
			    }, function (ButtonPressed) {
			        if (ButtonPressed === "确定") {
			        	 $.ajax({
								type: 'POST',
								url: '../ReportMgrServlet',
								dataType: 'json',
								data: {
									type:"delReport",
									report_id:data.report_id
								},
								error : function(msg) {
									errMessage("请求ReportMgrServlet失败");
							    },
								success : function(json) {   
									 if(json.success=="fail"){
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
									 }else{
										 successMessage("删除成功");
										 table.row(dom).remove().draw(true); 
									 }
								}
							});
			        }
			    });
			});
			
			
			$('#reportGrid').delegate('.down','click', function () {
				var dom = $(this).parents('tr');
				var data = table.row(dom).data();
				var fileName = data.report_file_name.replace('+', '%2B');
				window.location.href=encodeURI("../ReportMgrServlet?type=downFile&filePath="+encodeURI(data.report_file_path)+"&fileName="+encodeURI(fileName)+"&struct_id="+encodeURI(data.struct_id)+"&struct_mode="+encodeURI(data.struct_mode));
			});
			
			
			
			
			function formatBuild( d ){
				d=d.replace('1', '结构封面');
				d=d.replace('4', '检查记录');
				d=d.replace('5', '结构卡片');
				d=d.replace('6', '结构概述');
				d=d.replace('2', '04规范');
				d=d.replace('3', '11规范');
				return d;
			}
			
			
			
			
			
			
			
			
			function initPrj(){
				buildPrjComboBox([{prj_id: info.prj_id, prj_name: info.prj_desc}]);
				return;
				$.ajax({
					type: 'POST',
					url: '../ReportMgrServlet',
					dataType: 'json',
					data: {
						type:"initPrj",
						id:info.id,
						mode:info.mode
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
					$('#prj').append("<option value='"+d[i].prj_id+"'>"+d[i].prj_name+"</option>");
				}
				$('#prj').select2();
			}
			
			function getBuild(){
				var s = "";
				var b = false;
				
				var span='';
				var a=false;
				var x_value='';
				var s_value='';
				var w_value='';
				$('.span_no').each(function(){
					if(a==false){
						if($(this).attr("data-span")=='下行'){
							span='x_spans'+':'+$(this).val();	
						}else if($(this).attr("data-span")=='上行'){
							span='s_spans'+':'+$(this).val();
						}else{
							span='w_spans'+':'+$(this).val();
						}  
					}else{
						if($(this).attr("data-span")=='上行')
					  		 span=span+","+'s_spans'+':'+$(this).val();
					}
					a = true;
				})
				
				$("#sort").find('li').each(function(){
					if(b==false){
						s=$(this).attr('data-name');
					}else{
						s=s+"+"+$(this).attr('data-name');
					}
					b = true;
				});
				var ss="arg"+":"+s;
				var spans=ss+','+span;
				console.log(spans);
				return spans;
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
				width : 600,
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
						//	addReport();
							getBuild();
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