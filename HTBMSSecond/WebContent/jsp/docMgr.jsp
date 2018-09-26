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
				<li>文档管理</li><li>资料共享</li>
			</ol>
			<!-- end breadcrumb -->

		</div>
		<!-- END RIBBON -->

		<!-- #MAIN CONTENT -->
		<div id="content">
		
			<section id="widget-grid">
					<div class="row">
			            
			            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
							<div class="jarviswidget" id="wid-id-1" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false"
									data-widget-sortable="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
									<h2>文档管理</h2>	
									
									<ul id="myTab1" class="nav nav-tabs pull-right in">
										<li class="active"><a href="#s1" data-toggle="tab">共享文件</a></li>
										<li><a href="#s2" data-toggle="tab">上传文件</a></li>
										<li><a href="#s3" data-toggle="tab">我的文件</a></li>
									</ul>	
											
								</header>
				
								<div>
				
									<div class="jarviswidget-editbox">
										
									</div>
				
									<div class="widget-body no-padding">

										<div id="myTabContent1"
											class="tab-content bg-color-white no-padding">
											<div class="tab-pane fade in active" id="s1">
												<table id="dt_basic" class="table table-striped table-bordered table-hover">
													<thead>
														<tr>
															<th>序号</th>
															<th>文件名</th>
															<th>文件格式</th>
															<th>文件类别</th>
															<th>文件大小（KB）</th>
															<th>文件上传时间</th>
															<th>分享用户</th>
															<th>关键词</th>
															<th>下载</th>
														</tr>
													</thead>
													<tbody id="share">
													</tbody>
												</table>
											</div>
											<!-- end widget -->
											<div class="tab-pane fade padding-10" id="s2">
											<form id="uploadfile" class="form-horizontal" method="post" action='../FileManageServlet'>
<!-- 												<form class="form-horizontal"> -->
													<fieldset class="demo-switcher-1">
														<div class="form-group">
															<label class="col-md-2 control-label" for="select-1">文件类型：</label>
															<div class="col-md-10">
																<select	class="form-control" id="filetype">
																		<option value="标准规范">标准规范</option>
																		<option value="企业宣贯">企业宣贯</option>
																		<option value="应用程序">应用程序</option>
																		<option value="专业参考">专业参考</option>
																		<option value="综合资料">综合资料</option>
																		<option value="其他">其他</option>
																</select>
															</div>
														</div>
														<div class="form-group">
															<label class="col-md-2 control-label">文件：</label>
															<div class="col-md-10">
																<input type="file" class="btn btn-default" name="realfile"
																	id="realfile"">
															</div>
														</div>
														<div class="form-group">
															<label class="col-md-2 control-label">文件别名：</label>
															<div class="col-md-10">
																<input type="text" class="form-control" id="nickname">（如果不写，默认原名！）
															</div>
														</div>
														<div class="form-group">
															<label class="col-md-2 control-label">关键词：</label>
															<div class="col-md-10">
																<input type="text" class="form-control tagsinput" id="note" data-role="tagsinput">
															</div>
														</div>
													</fieldset>
												
					
												<div class="text-center padding-10">
													<hr>
													<a class="btn btn-primary pull-right" id="upload">确定</a>
													<br>
												</div>
												</form>
											</div>
											<div class="tab-pane fade" id="s3">
												<table id="dt_basic1"
													class="table table-striped table-bordered table-hover"
													width="100%">
					
													<thead>
					
														<tr>
															<th>序号</th>
															<th>文件名</th>
															<th>文件格式</th>
															<th>文件类别</th>
															<th>文件大小（KB）</th>
															<th>文件上传时间</th>
															<th>关键词</th>
															<th>修改-删除-下载</th>
														</tr>
													</thead>
													<tbody id="mine">
					
													</tbody>
												</table>
					
					
											</div>
										</div>
										
									</div>
				
								</div>
							</div>
			
			            </article>
					</div>
				</section>
		</div>
		<!-- END #MAIN CONTENT -->
	</div>
	<!-- END #MAIN PANEL -->
        <div id="opera" hidden="hidden" style="width: 500px;">
				<form>
					<fieldset>
						<div class="form-group">
							<label>文件名</label>
							<input class="form-control" id="ffname"  type="text">
						</div>

						<div class="form-group">
							<label>文件类别</label>
							<select	class="form-control" id="ffclass">
													<option value="标准规范">标准规范</option>
																		<option value="企业宣贯">企业宣贯</option>
																		<option value="应用程序">应用程序</option>
																		<option value="专业参考">专业参考</option>
																		<option value="综合资料">综合资料</option>
																		<option value="其他">其他</option>
											</select>
						</div>
						<div class="form-group">
							<label>关键词</label>
							<input class="form-control" id="ffnote"  type="text">
						</div>
					</fieldset>
				</form>
			</div>
		<div id="cover" class="cover">		
			<div id="loading" class="loading">上传文件中
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
	<script
		src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
	<script src="../js/ajaxfileupload.js"></script>
    <script src="../js/plugin/bootstrap-tags/bootstrap-tagsinput.min.js"></script>
    <script src="http://malsup.github.io/jquery.form.js"></script>
	<script type="text/javascript">
			

</script>

	<script type="text/javascript">
		
		$(document).ready(function() {
			    pageSetUp();
				initShare();
				initMine();
		});
		
		function initShare(){
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				async:false,
				data: {
				    type:'initShare'
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败！");
			    },
				success : function(json) { 
					if(json.obj==""||json.obj==undefined||json.obj==null){
						errMessage("获取共享文件信息失败！");
					}else{
						var data=json.obj;
						for(var i=0;i<data.length;i++){
							data[i].id=i+1;
						}
						shareTable.rows.add(data).draw(false);
			        }
		         }
	          });
		}
		
		
		function initMine(){
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				async:false,
				data: {
				    type:'initMine'
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败！");
			    },
				success : function(json) { 
					if(json.obj==""||json.obj==undefined||json.obj==null){
						//errMessage("获取我的文件信息失败！");
					}else{
						var data=json.obj;
						for(var i=0;i<data.length;i++){
							data[i].id=i+1;
						}
						mineTable.rows.add(data).draw(false);
			        }
		         }
	          });
		}
		
		function getFileName(){
			var fn=$('#realfile').val();
			return fn.substring(fn.lastIndexOf('\\')+1,fn.length);
		}
		function getExtraName(){
			var fn=$('#realfile').val();
			return fn.substring(fn.lastIndexOf('.')+1,fn.length);
		}
		
		$('#upload').on('click', function() {
            console.log('开始上传');
            showMask();
            var filetype=$('#filetype').val();
            var nickname=$('#nickname').val();
            var filename=getFileName();
            var extraname=getExtraName();
            var note=$('#note').val();
		    $('#uploadfile').ajaxSubmit({
		    		 headers:{
		    			 extraname: extraname
					},
					dataType:'json',
		            //type: 'post', // 提交方式 get/post
		            error : function(msg) {
		            	hidMask();
						errMessage("请求FileManageServlet失败");
				    },
		            success: function(json) { // data 保存提交后返回的数据，一般为 json 数据
		                // 此处可对 data 作相关处理
		                console.log(json);
		                hidMask();
		                var path=json.obj;
		                if(json.success=='success'){
		                	successMessage('文件上传成功');
		                }else{
		                	errMessage("文件上传失败");
		                }
		                $.ajax({
							type: 'POST',
							url: '../FileManageServlet',
							dataType: 'json',
							data: {
								type:"holddata",
								filetype: filetype,
								filename: filename,
								nickname: nickname,
								path: path,
								note: note
							},
							error : function(msg) {
								errMessage("请求FileManageServlet失败");
						    },
							success : function(json) {
								if(json.success=='success'){
				                	successMessage('数据入库成功');
				                	var dt=json.obj;
				                	var i=shareTable.data().length;
				                	dt.id=i+1;
				                	shareTable.row.add(dt).draw(false);
				                	dt.id=mineTable.data().length+1;
				                	mineTable.row.add(dt).draw(false);
				                }else{
				                	errMessage("数据入库失败");
				                }
							}
						});
		            }
		            //$(this).resetForm(); // 提交后重置表单
		        });
		        return false; // 阻止表单自动提交事件
		});
		
		/*初始化共享文件表格*/
		
	   var shareTable = $('#dt_basic').DataTable( {
			    	"sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f>r>"+
						"t"+
						"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
			        "autoWidth" : false,
			        "oLanguage": {
					    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
					},
			        "columns": [
			            { "data": "id" },
			            { "data": "file_nickname" },
			            { "data": "file_extension" },
			            { "data": "file_type" },
			            { "data": "file_size" },
			            { "data": "file_date" },
			            { "data": "user_name" },
			            { "data": "file_note" },
			            { "data": null,"orderable": false }
			        ],
			        "columnDefs": [ {
					      "targets": 8,//哪一列,从0开始
					      "searchable": false,//是否允许搜索
					      "render": function(data, type, full) {//类似format,data:当前表格数据,full:所有数据
					    	    var fn=full.file_name;
					            var nickname=full.file_nickname+'.'+full.file_extension;
					            //下载链接按钮
					            return "<a class='btn btn-default btn-xs' href='../FileManageServlet?type=downloadFile&filename="+fn+"&nickname="+nickname+"'> <i class='fa fa-arrow-down'></i></a>";
					          }
					    }],
			        "order": [[0, 'asc']],
			        "oLanguage": { //国际化配置  
		                "sProcessing" : "正在获取数据，请稍后...",    
		                "sLengthMenu" : "显示 _MENU_ 条",    
		                "sZeroRecords" : "查询不到相关数据",    
		                "sInfo" : " _START_ ~  _END_ 条 共 _TOTAL_ 条",    
		                "sInfoEmpty" : "记录数为0",    
		                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",    
		                "sInfoPostFix" : "",    
		                "sSearch" : "搜索",    
		                "sUrl" : "",    
		                "oPaginate": {    
		                    "sFirst" : "第一页",    
		                    "sPrevious" : "<",    
		                    "sNext" : ">",    
		                    "sLast" : "最后一页"    
		         		}  
			     	}
			    } );
		
	   /*初始化我的文件表格*/
		
	   var mineTable = $('#dt_basic1').DataTable( {
			    	"sDom": "<'dt-toolbar'<'col-xs-12 col-sm-6'f>r>"+
						"t"+
						"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
			        "autoWidth" : false,
			        "oLanguage": {
					    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
					},
			        "columns": [
			            { "data": "id" },
			            { "data": "file_nickname" },
			            { "data": "file_extension" },
			            { "data": "file_type" },
			            { "data": "file_size" },
			            { "data": "file_date" },
			            { "data": "file_note" },
			            { "data": null,"orderable": false }
			        ],
			        "columnDefs": [ {
					      "targets": 7,//哪一列,从0开始
					      "searchable": false,//是否允许搜索
					      "render": function(data, type, full) {//类似format,data:当前表格数据,full:所有数据
					    	  //修改按钮
					    	  var edit="<a class='edit btn btn-default btn-xs'><i class='fa fa-pencil'></i></a>";
					    	  //删除按钮
					          var del="<a class='del btn btn-default btn-xs'> <i class='fa fa-times'></i></a>";
					    	    var fn=full.file_name;
					    	    var id=full.file_id;
					            var nickname=full.file_nickname+'.'+full.file_extension;
					            var download="<a class='btn btn-default btn-xs' href='../FileManageServlet?type=downloadFile&filename="+fn+"&nickname="+nickname+"'> <i class='fa fa-arrow-down'></i></a>";
					            //下载链接按钮
					            return edit+'&nbsp;&nbsp;'+del+'&nbsp;&nbsp;'+download;
					          }
					    }],
			        "order": [[0, 'asc']],
			        "oLanguage": { //国际化配置  
		                "sProcessing" : "正在获取数据，请稍后...",    
		                "sLengthMenu" : "显示 _MENU_ 条",    
		                "sZeroRecords" : "查询不到相关数据",    
		                "sInfo" : " _START_ ~  _END_ 条 共 _TOTAL_ 条",    
		                "sInfoEmpty" : "记录数为0",    
		                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",    
		                "sInfoPostFix" : "",    
		                "sSearch" : "搜索",    
		                "sUrl" : "",    
		                "oPaginate": {    
		                    "sFirst" : "第一页",    
		                    "sPrevious" : "<",    
		                    "sNext" : ">",    
		                    "sLast" : "最后一页"    
		         		}  
			     	}
			    } );
		
	   
	   $('#dt_basic1').delegate('.edit','click', function () {
			var dom = $(this).parents('tr');
			var data = mineTable.row(dom).data();
			$('#ffname').val(data.file_nickname);
			$('#ffclass').val(data.file_type);
			$('#ffnote').val(data.file_note);
			$('#opera').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() {
				    	  var info={
				    			  id:data.id,
				    			  file_extension:data.file_extension,
				    			  file_id:data.file_id,
				    			  file_size:data.file_size,
				    			  file_date:data.file_date,
				    			  file_nickname:$('#ffname').val(),
				    			  file_type:$('#ffclass').val(),
				    			  file_note:$('#ffnote').val(),
						        }
				    		  if(info.file_nickname=="" || info.file_type==""||info.file_note==""){
					        	errMessage("不可为空");
						        }else{
						        	$.ajax({
										type: 'POST',
										url: '../FileManageServlet',
										dataType: 'json',
										data: {
											type:"editFileData",
											info:JSON.stringify(info)
										},
										error : function(msg) {
											errMessage("请求FileManageServlet失败");
									    },
										success : function(json) {   
											 if(json.success=="fail"){
												 errMessage("修改失败");
											 }else{
												 successMessage("修改成功");
												mineTable.row(dom).data(info);
												 $('#opera').dialog( "close" );
											 }
										}
									});
						        }
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
			$('#opera').dialog('open');
	    } ); 
	   
	   $('#dt_basic1').delegate('.del','click', function () {
			var dom = $(this).parents('tr');
			var data = mineTable.row(dom).data();
			$.SmartMessageBox({
		        title: "删除提示",
		        content: "确认删除该条记录吗",
		        buttons: '[取消][确定]'
		    }, function (ButtonPressed) {
		        if (ButtonPressed === "确定") {
		        	$.ajax({
						type: 'POST',
						url: '../FileManageServlet',
						dataType: 'json',
						data: {
							type:"deleteFile",
							file_id:data.file_id,
						},
						error : function(msg) {
							errMessage("请求FileManageServlet失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								errMessage("删除失败");
							 }else{
								 successMessage("删除成功");
								 $('#dt_basic1').DataTable().row(dom).remove().draw();;
							 }
						}
					});
		        }

		    });
	    } ); 
	   $('#opera').dialog({
			autoOpen: false,
			width : 600,
			resizable : false,
			modal : true,
			show :'drop',
			hide: 'drop',
			title:'修改'
		});

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
				
			}
			function releaseManage(){//项目负责人
				
			}
			function releaseMember(){//项目参与人
				
			}
			function releaseGuest(){//普通用户
				
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