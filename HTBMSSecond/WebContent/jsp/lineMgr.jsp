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
		<link rel="stylesheet" type="text/css" media="screen" href="../css/font.css">
		<!-- SmartAdmin Styles : Caution! DO NOT change the order -->
		<link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-production.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../css/smartadmin-skins.min.css">

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
		
		.tree-second:hover{
		background-color: #ccc;
		cursor: pointer;
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
					<li>基础数据</li><li>其他</li><li>路线字典</li>
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
			            <article id="tree_view" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>路线字典</h2>
				
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
										<div class="widget-body-toolbar bg-color-white">
						
				
												<div class="row">
																																						
													<div class="col-sm-12 col-md-12 ">
														<div class="pull-left col-xs-3"><input class="form-control" id="searchData" value="" placeholder="搜索" type="text"></div>		
														<a class="btn btn-primary pull-right disabled" onclick="addHighWay()">
															增加
														</a>
														
													</div>
				
												</div>
										</div>
										<table id="dt_basic" class="table table-striped table-bordered table-hover" style="width:100%" >
											<thead>			                
												<tr>
													<th>路线编号</th>
									 				<th>路线名称</th>
													<th>路线等级</th>
													<th class="col-xs-2">操作</th>
												</tr>
											</thead>
										</table>

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
		
			<div id="highwayDia" hidden="hidden">
				<form>
					<fieldset>
<!-- 						<div class="form-group">
							<label>路线编码（唯一）</label>
							<input class="form-control" id="highway_id" value="" placeholder="路线编码（唯一）" type="text">
						</div> -->
						<div class="form-group">
							<label>路线编号</label><i class="text-danger">*</i>
							<input class="form-control" id="highway_no" value="" placeholder="路线编号" type="text">
						</div>
						<div class="form-group">
							<label>路线名称</label><i class="text-danger">*</i>
							<input class="form-control" id="highway_name" value="" placeholder="路线名称" type="text">
						</div>
						<div class="form-group">
							<label>路线等级</label><i class="text-danger">*</i>
							<input class="form-control" id="highway_level" value="" placeholder="路线等级" type="text">
						</div>
					</fieldset>
				</form>
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
		<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
		<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
		
		
		<script type="text/javascript">
		
		
			$(document).ready(function() {
				pageSetUp();
				initTable();
			});
			
			var dom;
			
			$('#searchData').on('change', function(){
				var d = $(this).val();
				table.search(d).draw(true);
			});
			
			$('#highwayDia').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
			
			
			var editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
			var table = $('#dt_basic').DataTable({
				"sDom": 
					"t"+
					"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
				"autoWidth" : true,
				"bScrollCollapse" : true,
				"sScrollY" : 400, 
				"columns": [
		            { "data": "highway_no" },
		            { "data": "highway_name" },
		            { "data": "highway_level" },
		            { "data": null },
		        ],
				"columnDefs": [ {
				      "targets": 3,
				      "searchable": false,
				      "render": function(data, type, full) {
				            return editDel;
				          }
				}],
				 "order": [[0, 'asc']],
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
			});
			
			/*初始化表格*/
			function initTable(){
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
							 $('#dt_basic').dataTable().fnClearTable();
						 }else{
							 $('#dt_basic').dataTable().fnClearTable(); 
							var data = json.obj;
							$('#dt_basic').DataTable().rows.add(data).draw(false);
						 }
					}
				});
			}
			
			function addHighWay(){
				$('#highwayDia input').val('');
				
				$('#highwayDia').dialog({
					title: '增加路线',
					buttons: [{
						html: '<i class="fa fa-plus"></i>&nbsp; 保存',
						'class': 'btn btn-default',
						click: function(){
							var info = {
									highway_no: $('#highway_no').val(),
									highway_name: $('#highway_name').val(),
									highway_level: $('#highway_level').val()
							}
							for(var s in info){
								if(info[s]==''){
									errMessage('数据不可为空');
									return;
								}
							}
							$.ajax({
								type: 'POST',
								url: '../LineMgrServlet',
								dataType: 'json',
								data: {
									type:"addHighWay",
									info: JSON.stringify(info)
								},
								error : function(msg) {
									errMessage("请求LineMgrServlet失败");
							    },
								success : function(json) {   
									 if(json.success=="fail"){
										 switch (json.error) {
											case 1:
												errMessage("失败");
												break;
											case 2:
												errMessage("服务器错误");
												break;
											default:
												break;
											}
									 }else{
										var highway_id = json.obj;
										info.highway_id = highway_id;
										table.row.add(info).draw( false );
										$('#highwayDia').dialog('close');
									 }
								}
							});
							
						}
					},{
						html: '<i class="fa fa-times"></i>&nbsp; 取消',
						'class': 'btn btn-default',
						click: function(){
							$(this).dialog('close');
						}
					}]
				});
				
				$('#highwayDia').dialog('open');
			}
			
			$('#dt_basic').delegate('.edit','click', function () {
				
				var tr = $(this).closest('tr');
				var data = table.row(tr).data();
				for(var s in data){
					$('#'+s).val(data[s]);
				}
				$('#highwayDia').dialog({
					title: '修改路线',
					buttons: [{
						html: '<i class="fa fa-plus"></i>&nbsp; 保存',
						'class': 'btn btn-default',
						click: function(){
							var info = {
									highway_id: data.highway_id,
									highway_no: $('#highway_no').val(),
									highway_name: $('#highway_name').val(),
									highway_level: $('#highway_level').val()
							}
							for(var s in info){
								if(info[s]==''){
									errMessage('数据不可为空');
									return;
								}
							}
							$.ajax({
								type: 'POST',
								url: '../LineMgrServlet',
								dataType: 'json',
								data: {
									type:"editHighWay",
									info: JSON.stringify(info)
								},
								error : function(msg) {
									errMessage("请求LineMgrServlet失败");
							    },
								success : function(json) {   
									 if(json.success=="fail"){
										 switch (json.error) {
											case 1:
												errMessage("失败");
												break;
											case 2:
												errMessage("服务器错误");
												break;
											default:
												break;
											}
									 }else{
										table.row(tr).data(info).draw( false );
										$('#highwayDia').dialog('close');
									 }
								}
							});
							
						}
					},{
						html: '<i class="fa fa-times"></i>&nbsp; 取消',
						'class': 'btn btn-default',
						click: function(){
							$(this).dialog('close');
						}
					}]
				});
				$('#highwayDia').dialog('open');
		    } ); 
			
			
			$('#dt_basic').delegate('.del','click', function () {
				var tr = $(this).closest('tr');
				var data = table.row(tr).data();
				$.SmartMessageBox({
					title : "路线删除",
					content : "您是否确认删除此记录？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						$.ajax({
							type: 'POST',
							url: '../LineMgrServlet',
							dataType: 'json',
							data: {
								type:"delHighWay",
								highway_id: data.highway_id
							},
							error : function(msg) {
								errMessage("请求LineMgrServlet失败");
						    },
							success : function(json) {   
								 if(json.success=="fail"){
									 switch (json.error) {
										case 1:
											errMessage("失败");
											break;
										case 2:
											errMessage("服务器错误");
											break;
										default:
											break;
										}
								 }else{
									 table.row(tr).remove().draw(false); 
									$('#highwayDia').dialog('close');
								 }
							}
						});
					}
				});
		    } ); 
			
			
			
			function releaseAdmin(){//管理员
				editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
				$('.widget-body-toolbar a').removeClass('disabled');
			}
			function releaseManage(){//项目负责人
				
			}
			function releaseMember(){//项目参与人
				
			}
			function releaseGuest(){//普通用户
			}
			function releaseGuest(e){//普通用户
				if(e=="superAdmin"){
     				releaseAdmin();
				}
			
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
			
		</script>
		
		
	</body>
</html>