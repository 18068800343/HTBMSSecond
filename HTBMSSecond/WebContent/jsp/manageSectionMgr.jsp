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
					<li>基础数据</li><li>结构</li><li>下辖路段</li>
				</ol>
				<!-- end breadcrumb -->

			</div>
			<!-- END RIBBON -->
			
			<!-- #MAIN CONTENT -->
			<div id="content">
				<section id="widget-grid">
					<div class="row">
					
						<!-- NEW WIDGET START -->
						<article class="col-sm-12 col-md-8 col-lg-8">
				
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-eye"></i> </span>
									<h2>下辖路段</h2>
				
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
													<div class="col-sm-12 col-md-12">
														<div class="pull-left col-xs-4">
															<select class="form-control input-sm pull-left select2"  onchange="orgChange(this)"  id="org">
																
															</select>
														</div>
														<button class="btn btn-primary pull-right" disabled onclick="addRelation()">
															增加
														</button>
													</div>
												</div>
										</div>
										
										<table  id="std" class="table table-bordered table-striped table-hover"  style="width:100%">
											<thead>
												<tr>
													<th>下辖路段编号</th>
													<th>下辖路段</th>
													<th>管养单位</th>
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
		
		
				<div id="dig" hidden="hidden">
				<form>
					<fieldset>
					<div class="form-group" >
							<label>管养单位</label><i class="text-danger">*</i>
							<select style="width:100%" class="form-control" id="manage_id" >
								
							</select>
						</div>
						<div class="form-group">
							<label>下辖路段编号</label><i class="text-danger">*</i>
							<input class="form-control" id="section_no" value="" placeholder="下辖路段编号" type="text">
						</div>
						<div class="form-group">
							<label>下辖路段</label><i class="text-danger">*</i>
							<input class="form-control" id="section_name" value="" placeholder="下辖路段" type="text">
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
		<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
		
		<script type="text/javascript">

			
			$(document).ready(function() {
				// DO NOT REMOVE : GLOBAL FUNCTIONS!
				pageSetUp();
			 	initTable(); 
				getManageOrg();
			});
			
			
			var editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
			var table = $('#std').DataTable({
				"sDom": 
				"t"+
				"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
	        "bDestroy": true,
	        "iDisplayLength": 10,
	        "autoWidth" : true,
			"bScrollCollapse" : true,
			"sScrollY" : 400, 
	        "oLanguage": {
			    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
			},
	        "columns": [
	        	{ "data": "section_no" },
	            { "data": "section_name" },
	            { "data": "manage_name" },
	            { "data": null,"orderable": false }
	        ],
	        "columnDefs": [ {
			      "targets": 3,
			      "searchable": false,
			      "render": function(data, type, full) {
			            return editDel;
			          }
			    } ],
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
			
			function orgChange(t){
				var d = $(t).val();
				table.search(d).draw(false);
			}
			
			$('#dig').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
			
			function initTable(){
				$.ajax({
					type: 'POST',
					url: '../ManageSectionMgrServlet',
					dataType: 'json',
					data: {
						type:"initTable"
					},
					error : function(msg) {
						errMessage("请求ManageSectionMgrServlet失败");
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
							 $('#std').dataTable().fnClearTable();
						 }else{
							 $('#std').dataTable().fnClearTable();
								var data = json.obj;
								table.rows.add(data).draw(false); 
								initOption();
						 }
					}
				});
			}
			
			
			function getManageOrg(){
				$.ajax({
					type: 'POST',
					url: '../ManageOrgMgrServlet',
					dataType: 'json',
					data: {
						type:"initTable"
					},
					error : function(msg) {
						errMessage("请求ManageOrgMgrServlet失败");
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
							 	$('#manage_id').empty();
								var data = json.obj;
								console.log(data);
								for(var i=0;i<data.length;i++){
									$('#manage_id').append("<option value='"+data[i].manage_id+"'>"+data[i].manage_name+"</option>")
								}
						 }
					}
				});
			}
			
			function initOption(){
				var data = table.data();
				var set = new Set();
				for(var i=0;i<data.length;i++){
					set.add(data[i].manage_name);
				}
				var d = $('#org');
				d.empty();
				d.append('<option value="">全部</option>');
				set.forEach(function( e ){
					d.append('<option>'+e+'</option>');
				});
				d.trigger('change');
			}

			
			function addRelation(){
				$('#manage_id').prop('disabled', false);
				$('#dig input').val('');
				$('#dig').dialog({
					title: '增加管养分区',
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var info={
					    			  manage_id: $('#manage_id').val(),
					    			  section_no: $('#section_no').val(),
					    			  section_name: $('#section_name').val()
							        }
								for(var s in info){
									if(info[s]==''){
										errMessage('数据不可为空');
										return;
									}
								}
					        	$.ajax({
									type: 'POST',
									url: '../ManageSectionMgrServlet',
									dataType: 'json',
									data: {
										type:"addSection",
										info:JSON.stringify(info)
									},
									error : function(msg) {
										errMessage("请求ManageSectionMgrServlet失败");
								    },
									success : function(json) {   
										 if(json.success=="fail"){
											 switch (json.error) {
												case 1:
													errMessage("保存失败");
													break;
												case 2:
													errMessage("服务器错误");
													break;
												case 3:
													errMessage("已存在关系");
													break;
												default:
													break;
												}
										 }else{
											 info.section_id=json.obj;
											 info.manage_name = $('#manage_id option:selected').html();
											table.row.add(info).draw(false);
											initOption();
											 $('#dig').dialog( "close" );
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
				$('#dig').dialog('open');
			}
			
			$('#std').delegate('.edit','click', function () {
				
				var tr = $(this).closest('tr');
				var data = table.row(tr).data();
				for(var s in data){
					$('#'+s).val(data[s]);
				}
				$('#manage_id').prop('disabled', 'disabled');
				$('#dig').dialog({
					title: '修改下辖路段',
					buttons: [{
						html: '<i class="fa fa-plus"></i>&nbsp; 保存',
						'class': 'btn btn-default',
						click: function(){
							var info={
					    			  manage_id: data.manage_id,
					    			  manage_name: data.manage_name,
					    			  section_id: data.section_id,
					    			  section_no: $('#section_no').val(),
					    			  section_name: $('#section_name').val()
							}
							for(var s in info){
								if(info[s]==''){
									errMessage('数据不可为空');
									return;
								}
							}
							$.ajax({
								type: 'POST',
								url: '../ManageSectionMgrServlet',
								dataType: 'json',
								data: {
									type:"editSection",
									info: JSON.stringify(info)
								},
								error : function(msg) {
									errMessage("请求ManageSectionMgrServlet失败");
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
										$('#dig').dialog('close');
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
				$('#dig').dialog('open');
		    } ); 
			
			$('#std').delegate('.del','click', function () {
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
							url: '../ManageSectionMgrServlet',
							dataType: 'json',
							data: {
								type:"delSection",
								section_id: data.section_id
							},
							error : function(msg) {
								errMessage("请求ManageSectionMgrServlet失败");
						    },
							success : function(json) {   
								 if(json.success=="fail"){
									 switch (json.error) {
										case 1:
											errMessage("删除失败");
											break;
										case 2:
											errMessage("服务器错误");
											break;
										case 3:
											errMessage("已存在关系");
											break;
										default:
											break;
										}
								 }else{
									table.row(dom).remove().draw(false);
								 }
							}
						});
			        }
			    });
		    } ); 
			
			
			
			
			
			
			
			
			
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
			
			function releaseAdmin(){//管理员
				editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
				$('.widget-body-toolbar button').prop('disabled', false);
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
		</script>
		
	</body>
</html>