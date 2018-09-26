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
		<link rel="stylesheet" href="../js/plugin/daterangepicker/daterangepicker.css">
		<style>
		
		.tree-second:hover{
		background-color: #ccc;
		cursor: pointer;
		}
		
		.text-align-right{
		margin-top:-3px;
		}
		
		</style>
		<script src="http://pstatic.xunlei.com/js/thunderBatch.js"></script>
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
					<li>实时监测</li><li>数据管理</li><li>风速风向</li>
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
			            <article class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
									<h2>结构</h2>				
								</header>
				
								<!-- widget div-->
								<div>
				
									<!-- widget edit box -->
									 <div class="widget-body-toolbar bg-color-white">
												<div class="col-sm-12">
													<div class="text-align-right">
														<a id="system1" class="btn btn-primary btn-sm disabled" onclick="addSystem()">添加系统</a>
													</div>
												</div>
										</div>
									<!-- end widget edit box -->
				
									<!-- widget content -->
									<div class="widget-body">
				
										<div class="tree smart-form">
											
										</div>
				
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
			
			            </article><!-- END GRID -->
			            
			            <!-- SINGLE GRID -->
			            <article id="tree_view" class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>风速风向数据 </h2>
				
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
														<div class="pull-left col-xs-2">
														<select class="input-sm form-control" style="width: 100%;" onchange="table.column( '5' ).search( this.value ).draw( false );">
														<option value="">全部</option>
														<option value="true">已选</option>
														<option value="false">未选</option>
														</select>
														</div>		
														<div class="pull-left col-xs-1.5">
														<select class="input-sm form-control" style="width: 100%;" onchange="table.page.len( this.value ).draw( false );">
														<option value=10>10</option>
														<option value=20>20</option>
														<option value=50>50</option>
														<option value=100>100</option>
														</select>
														</div>	
														<div class="pull-left col-xs-2.5">
														<input type="text" style="width:132px;margin-left: 15px;" class="form-control" placeholder="请选择日期" id="reservation" onclick="">
														</div>	
														<span class="pull-left spa" style="padding-top: 5px;margin-left: 5px;margin-right: 5px;">至</span>
														<div class="pull-left col-xs-2.5">
														<input type="text" style="width:120px" class="form-control" placeholder="请选择日期" id="reservationEnd" onclick=""><br/>
														</div>
														<div class="pull-left col-sm-1">
														  <a class="btn btn-primary btn-sm" onclick="searchBydate()">检索</a>
														</div>		
														<a class="btn btn-primary btn-sm pull-right" id="thunderDownload">复制迅雷下载链接</a>
													</div>
				
												</div>
										</div>
										<table id="dt" class="table table-striped table-bordered table-hover" width="100%">
											<thead>			                
												<tr>
												    <th>
														<label class="checkbox-inline" style="width: 100%;height: 100%;">
															  <input type="checkbox" class="checkbox style-0" id="autoChk">
															  <span></span>
														</label>
						                            </th>
													<th> 开始时间</th>
													<th>结束时间</th>
													<th> 文件大小（KB）</th>
													<th>下载</th>
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
			
			            </article><!-- END GRID -->			
			        </div><!-- end row -->								        
			    </section><!-- end widget grid -->
			</div>
			<!-- END #MAIN CONTENT -->
		</div>
		<!-- END #MAIN PANEL -->
		
		<div id="expDialog" hidden="hidden">
			<form class="">
				 
				<fieldset>

					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label>开始时间</label>
								<div class="input-group">
									<input type="text" name="mydate1" class="form-control datepicker" data-dateformat="dd/mm/yy">
									<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-12">
							<div class="form-group">
								<label>结束时间</label>
								<div class="input-group">
									<input type="text" name="mydate2" class="form-control datepicker" data-dateformat="dd/mm/yy">
									<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								</div>
							</div>
						</div>
					</div>
				</fieldset>

				<footer>
					<button type="submit" class="btn btn-primary pull-right">
						导出Excel
					</button>
				</footer>
			</form>
		</div>
		<div id="addSystem" hidden="hidden">
			<form class="">
				 
				<fieldset>

					<div class="row">
						<div class="col-sm-12 col-md-12">
						<label>管养单位</label> 
							<select style="width:100%" class="input-sm select2 " id="manage">
						    </select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-12">
						<label>所属路段</label> 
							<select style="width:100%;color:black" class="input-sm select2 " id="section">
						    </select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-12">
						<label>桥梁名称</label> 
							<select style="width:100%" class="input-sm select2 " id="structname">
						    </select>
						</div>
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
		<script src="../js/ZeroClipboard.js"></script>
		<script src="http://pstatic.xunlei.com/js/webThunderDetect.js"></script>
		<script src="http://pstatic.xunlei.com/js/base64.js"></script>
		
		<script src="../js/plugin/daterangepicker/moment.min.js"></script>
        <script src="../js/plugin/daterangepicker/daterangepicker.js"></script>
        <!--layDate日期控件-->
        <script src="../js/laydate/laydate.js"></script>
		<script type="text/javascript">
		function batchDownload(){
	    	BatchTasker.BeginBatch(20,pid);    //开始批量添加
	    	var arr=getLink2();
	    	console.log(arr);
	    	for(var i=0;i<arr.length;i++){
	    		BatchTasker.AddTask(ThunderEncode(arr[i]), i+"");
	    	}
	    	BatchTasker.EndBatch(pid);    //结束添加，开始下载
	    }

		var startTime = {
		        elem: '#reservation',
		        type: 'date',
		        trigger: 'click',
		        done: function(date) {
		        	 var beginDate=date;  
		        	 var endDate=$("#reservationEnd").val();
		        	 var d1 = beginDate;
		        	 var d2 = endDate;
		        	  if(beginDate!=""&&endDate!=""&&d1 >d2)  
		        	 {  
	        		  errMessage("开始时间不能大于结束时间！");
		        	  $("#reservation").val(''); 
		        	  return false;  
		        	 }
		        }
		    };
		    // 结束时间
		    var endTime = {
		        elem: '#reservationEnd',
		        type: 'date',
		        trigger: 'click',
		        done: function(date) {
		        	 var beginDate=$("#reservation").val();  
		        	 var endDate=date;  
		        	 var d1 = beginDate;
		        	 var d2 = endDate;
		        	  if(beginDate!=""&&endDate!=""&&d1 >d2)  
		        	 {  
	        		  errMessage("开始时间不能大于结束时间！");  
		        	  $("#reservationEnd").val(''); 
		        	  return false;  
		        	 }
		        }
		    };
		   laydate.render(startTime);
	   	   laydate.render(endTime);
		
           function searchBydate() {
       	     $.fn.dataTable.ext.search.pop();
  	         var begin=$('#reservation').val();
  	         var start=begin.replace(/年|月/g,'-').replace('日','');
  	         var end=$('#reservationEnd').val().replace(/年|月/g,'-').replace('日','');
  	         console.log(start);
  	         $.fn.dataTable.ext.search.push(
  	             function (settings, data, dataIndex) {
  	                 if(data[1]>=start){
  	                     if(data[1]<=myTrim(end+' 23:59:59')){
  	                         return true; 
  	                     }
  	                 }else{
  	                    console.log(start+"/"+end);
  	                 }
  	             }
  	         );
  	         table.draw();
	         //$.fn.dataTable.ext.search.pop();
	         //table.ajax.url('/getAgentByTime?time='+$('#reservation').val()).load();
	     }
		function myTrim(x) {
	        return x.replace(/^\s+|\s+$/gm,'');
	    }
		function getLink(){
			var data=table.data();
			var link="";
			for(var i=0;i<data.length;i++){
				if(data[i].state){
					var full=data[i];
					 if(full.is_download==1){
						 var thunder=ThunderEncode("ftp://ht:ht123,@115.159.78.246/"+full.bridge_no+"F/"+full.data_file);
						 link=link+thunder+"\r\n";
			    	  }else{
			    		  var thunder=ThunderEncode("ftp://ht:ht123,@115.159.109.101/"+full.bridge_no+"F/"+full.data_file);
						  link=link+thunder+"\r\n";
			    	  }
				}
			}
			return link;
		}
		function getLink2(){
			var data=table.data();
			var link=[];
			for(var i=0;i<data.length;i++){
				if(data[i].state){
					var full=data[i];
					 if(full.is_download==1){
						 var thunder="ftp:\/\/ht:ht123,@115.159.78.246/"+full.bridge_no+"F/"+full.data_file;
						 //link.push(ThunderEncode(thunder));
						 link.push(thunder);
			    	  }else{
			    		  var thunder="ftp:\/\/ht:ht123,@115.159.109.101/"+full.bridge_no+"F/"+full.data_file;
			    		  //link.push(ThunderEncode(thunder));
			    		  link.push(thunder);
			    	  }
				}
			}
			return link;
		}
		
		
		function initCopy(){
			if(isIE()){
				$('#thunderDownload').click(function(){
					  var link=getLink();
					  if(link==""){
						  errMessage("请选择数据!");
							return;
					  }
					  window.clipboardData.setData("Text",link);
				  });
			}else{
				var clip = new ZeroClipboard( document.getElementById("thunderDownload"), {  
			           moviePath:"../js/ZeroClipboard.swf"//设置ZeroClipboard.swf位置  
			         }); 
				clip.addEventListener('mouseDown', function (client) {
					var link=getLink();
					if(link==""){
						errMessage("请选择数据!");
						return;
					}
					clip.setText(link);
				});
				
				clip.addEventListener('complete', function (client, text) {
					OnDownloadClick_Simple();
					clip.clip();
				});
			}
		}
		function isIE() { //ie?
			 if (!!window.ActiveXObject || "ActiveXObject" in window)
			  return true;
			  else
			  return false;
		}
			$(document).ready(function() {
				// DO NOT REMOVE : GLOBAL FUNCTIONS!
				pageSetUp();
				initTree();
				initManageSection();
				dialogOperation();	
				initCopy();
			});
			function addSystem(){
				$('#addSystem').dialog('open');
			}
			
			

			function initBridge(){
				$.ajax({
					type: 'POST',
					url: '../StructMgrServlet',
					dataType: 'json',
					data: {
						type:"initBridge",
						mode:"h"
					},
					error : function(msg) {
						errMessage("请求StructMgrServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								errMessage("没有数据");
								break;
							case 2:
								errMessage("服务器错误");
								break;
							default:
								break;
							}
						 }else{
							 var data=json.obj;
							 for(var i=0;i<data.length;i++){
								 $('#cont').append("<option value='"+data[i].bridge_no+"'>"+data[i].bridge_name+"<option>");
							 }
							 $('#cont').trigger('change');
						 }
					}
				});
			}
			function addBrgSystem(){
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"addBrgWindSystem",
						bridge_id:$('#structname').val(),
					},
					error : function(msg) {
						errMessage("请求WeightHealthServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								errMessage("插入失败");
								break;
							case 2:
								errMessage("文件目录不可用");
								break;
							default:
								break;
							}
						 }else{
							 successMessage("插入成功")
							 $('#addSystem').dialog("close");
							 initTree();
						 }
					}
				});
			}
			function dialogOperation(){
				$('#addSystem').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  addBrgSystem();
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
			}
			$('#addSystem').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop',
				title:'添加系统'
			});
			$('#addSystem').prop('hidden',false);
			
			
			var table = $('#dt').DataTable( {
				"sDom":
						"t"+
						"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
						"columns": [
                                    { "data": "state", 'orderable': false },
						            { "data": "start_time" },
						            { "data": "end_time" },
						            { "data": "file_size" },
						            { "data": null },
						            { "data": null, 'visible': false }
							        ],
							        "pageLength": 10,
							 "columnDefs": [ 
							                 {	
										  "class": "tcenter",
									    "targets": 0,
									    "searchable": true,
									    "render": function(data, type, full) {
									  	  	if(data==false){
									  	  		return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox"><span></span></label>';
									  	  	}else{
									  	  		return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" class="checkbox style-0 cbox" checked><span></span></label>';
									  	  	}
									        }
									  },{
									      "targets": 4,
									      "searchable": false,
									      "render": function(data, type, full) {
									    	  if(full.is_download==1){
									    		  return "<a href='ftp://ht:ht123,@115.159.78.246/"+full.bridge_no+"F/"+full.data_file+"' download='"+full.data_file+"'>下载</a>";
									    	  }else{
									    		  return "<a href='ftp://ht:ht123,@115.159.109.101/"+full.bridge_no+"F/"+full.data_file+"' download='"+full.data_file+"'>下载</a>";
									    	  }
									    	  }
									    },
									    {
										      "targets": 5,
										      "searchable": true,
										      "render": function(data, type, full) { 
										    	  	return full.state;
										          }
										    }],
										    "iDisplayLength": 10,
											"bScrollCollapse" : true,
											"sScrollY" : 700, 
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
		        "order": [[0, 'desc']],
		    });

			$('#autoChk').on('click', function(){
				 var s = $(this).prop('checked');
				 console.log(s);
				$('#dt .cbox').prop('checked', s).trigger('change');
			 });
			$('#dt').delegate('.cbox', 'change', function(){
				 var state = $(this).prop('checked');
				 var tr = $(this).closest('tr');
				 table.row(tr).data().state=state;
				 autoChk();
				 table.cell(tr, 5).data(state);
			 });
			$('#dt').on('draw.dt',function() {
				autoChk()
		        });
			function autoChk(){
				 var s = true;
		        $('#dt').find('.cbox').each(function(){
		        	if($(this).prop('checked')==false){
		        		s=false;
		        		return false;
		        	}
		        });
		        if($('#dt').find('.cbox').length==0){
		        	s=false;
		        }
		       $('#autoChk').prop('checked', s);
			 }
			function initTree(){
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"initWindTree"
					},
					error : function(msg) {
						errMessage("请求WeightHealthServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 2:
								errMessage("服务器错误");
								break;
							default:
								break;
							}
						 }else{
							 $('.tree').empty();
							 console.log(json.obj);
							 $('.tree').append(buildTree(json.obj));
							 treeControl();
						 }
					}
				});
			}
		
			//构造树
			function buildTree(data){
				var ul = $("<ul></ul>")
				for(var i=0;i<data.length;i++){
					var li = $("<li></li>");
					li.attr('data-type',data[i].type);
					li.attr('data-id',data[i].id);
					li.attr('data-name',data[i].name);
					li.attr('data-dir',data[i].bgco);
					if(data[i].type!="health"){
						//li.prop('style','display:none');
					}
					if(data[i].children.length>0){
						li.append("<span><i class='fa fa-lg fa-minus-circle'></i> "+data[i].name+"</span>");
						li.append(buildTree(data[i].children));
					}else{
						if(data[i].bgco==undefined||data[i].bgco==""){
							li.append("<span class='tree-second'>"+data[i].name+"</span>");
						}else{
							if(data[i].bgco!="1"){
								li.append("<span class='tree-second'>"+data[i].name+"</span><i style='font-style:normal;color:#214e75'>---无数据接入("+formatEndTime(data[i].bgco)+")</i>");
							}else{
								li.append("<span class='tree-second'>"+data[i].name+"</span>");
							}
							
						}
						
					}
					ul.append(li);
				}
				return ul;
			}
			function formatEndTime(end_time){
				if(end_time=='0'){
					return '>7d';
				}
				var nowtime=new Date().getTime();
				var endtime=new Date(end_time).getTime();
				var i=parseInt((nowtime-endtime)/3600000);
				console.log(i);
				if(i<=24){
					return i+'h';
				}else{
					i=parseInt(i/24);
					if(i<=7){
						return i+'d';
					}else{
						return '>7d';
					}
				}
			}
			var sss=undefined;//级联关闭1级
			var sss2=undefined;//级联关闭2级
			var treeSecondSelect = undefined;//选中状态
			//树控制
			function treeControl(){
				sss=undefined;
				treeSecondSelect = undefined;
				$('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
				$('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', '展开').on('click', function(e) {
	
					sss=this; 
					var children = $(this).parent('li.parent_li').find(' > ul > li');
					if (children.is(':visible')) {
						children.hide('fast');
						$(this).attr('title', '展开').find(' > i').removeClass().addClass('fa fa-lg fa-plus-circle');
					} else {
						children.show('fast');
						$(this).attr('title', '折叠').find(' > i').removeClass().addClass('fa fa-lg fa-minus-circle');
					}
					e.stopPropagation();
				});			
				$('.tree-second').on('click',function(){
					$(treeSecondSelect).css('background','');
					$(this).css('background','#ccc');
					$(this).attr('title', '展开');
					treeSecondSelect=this;
					var info={};
					info.id = $(treeSecondSelect).closest('li').attr('data-id');
					info.name = $(treeSecondSelect).closest('li').attr('data-name');
					info.type = $(treeSecondSelect).closest('li').attr('data-type');
					info.dir = $(treeSecondSelect).closest('li').attr('data-dir');
					initTable(info);
				});
			}
			
			
			function initTable(info){
				$('#dt').dataTable().fnClearTable();
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"wind",
						bridge_id:info.id
					},
					error : function(msg) {
						errMessage("请求WeightHealthServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								//errMessage("没有数据");
								break;
							case 2:
								errMessage("服务器错误！");
								break;
							default:
								break;
							}
						 }else{
							 var data = json.obj;
							 for(var i in data){
								 data[i].state=false;
							 }
							 table.rows.add(data).draw(false); 
						 }
					}
				});
			}
			var msb;
			function initManageSection(){
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"initManageSection",
					},
					error : function(msg) {
						errMessage("请求StructMgrServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								errMessage("没有数据");
								break;
							case 2:
								errMessage("服务器错误");
								break;
							default:
								break;
							}
						 }else{
							 var data=json.obj;
							 msb=data;
							 var manage=getManage(data);
							 var section=getSection(data);
							 for(var i=0;i<manage.length;i++){
								 $('#manage').append("<option value='"+manage[i]+"'>"+manage[i]+"<option>");
							 }
							 for(var i=0;i<section.length;i++){
								 $('#section').append("<option value='"+section[i]+"'>"+section[i]+"<option>");
							 }
							 for(var i=0;i<data.length;i++){
								 $('#structname').append("<option value='"+data[i].struct_id+"'>"+data[i].struct_name+"<option>");
							 }
							 
							 $('#structname').trigger('change');
							 
						 }
					}
				});
			}
			$('#manage').change(function(){
				$('#section').empty();
				$('#structname').empty();
				var val=$('#manage').val();
				var section=[];
				for(var i in msb){
					if(msb[i].manage_name==val){
						section.push(msb[i].section_name);
						$('#structname').append("<option value='"+msb[i].struct_id+"'>"+msb[i].struct_name+"<option>");
					}
				}
				section=unique(section);
				for(var i=0;i<section.length;i++){
					 $('#section').append("<option value='"+section[i]+"'>"+section[i]+"<option>");
				 }
				$('#section').trigger('change');
			});
			$('#section').change(function(){
				$('#structname').empty();
				var val=$('#section').val();
				for(var i in msb){
					if(msb[i].section_name==val){
						$('#structname').append("<option value='"+msb[i].struct_id+"'>"+msb[i].struct_name+"<option>");
					}
				}
				$('#structname').trigger('change');	
				
			});
			
			
			function getManage(data){
				var manage=[];
				for(var i=0;i<data.length;i++){
					manage.push(data[i].manage_name);
				 }
				return unique(manage);
			}
			function getSection(data){
				var manage=[];
				for(var i=0;i<data.length;i++){
					manage.push(data[i].section_name);
				 }
				return unique(manage);
			}
		   function unique(data){
			   data.sort(); //先排序
				 var res = [data[0]];
				 for(var i = 1; i < data.length; i++){
				  if(data[i] !== res[res.length - 1]){
				   res.push(data[i]);
				  }
				 }
				 return res;
				}
			
			//dialog
			$('#expDialog').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop',
				title:'数据导出'
			});
			$('#expDialog').prop('hidden',false);
			
			function openExp() {
				$('#expDialog').dialog('open');
			}
			
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
				$('.widget-body-toolbar a').removeClass('disabled');
				}
			
			}
		</script>
	</body>
</html>