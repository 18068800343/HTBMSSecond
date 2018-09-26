<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8;IE=edge,chrome=1">
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
		<link rel="stylesheet" href="../css/calender.css" type="text/css"></link>
		<style>
		
		.tree-second:hover{
		background-color: #ccc;
		cursor: pointer;
		}
		
		#fileName{
		background-color:#ccc;
		color:black;
		}
		
		.shb1{
		bottom: -27px;
		}
		
		
		   .cover {
            position: fixed;
            top: 0px;
            right: 0px;
            bottom: 0px;
            filter: alpha(opacity=60);
            background-color: #E2E2E2;
            z-index: 8888;
            left: 0px;
            display: none;
            opacity: 0.6;
            -moz-opacity: 0.5;
        }
        
		#reservation{margin-left:12px;border:1;padding:5px;}
		
		#reservationEnd{margin-left:12px;border:1;padding:5px;}
		
		.spa{margin-left:12px;border:0;padding:0;}
		
			ul, ol, li {
		list-style: none;
		padding: 0;
		margin: 0;
	}
	#date_panel {
		width: 380px;
		margin: 50px auto;
	}
	p {
		margin: 0;
	}
	a {
		text-decoration: none;
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
					<li>实时监测</li><li>监测数据</li><li>数据下载</li>
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
			            <article class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
									<h2>数据情况</h2>	
									<div class="pull-right"><a style="" href="monitoringData.jsp"><font class="form-control" style="color: black;border: 0px"> << 返回上一级</font></a></div>			
								</header>
				
								<!-- widget div-->
								<div>
				
				                        <div class="widget-body-toolbar bg-color-white">
												<div class="col-sm-12">
												<div class="col-sm-4"><input  id="brg_name" class="form-control" ></div>
												<div class="pull-right ">
												<div id="view_type" class="btn-group " data-toggle="buttons" >
												<label data_dir="动态称重" id="btn_weight"  class="btn btn-info active" onclick="view_type('weight')">
													<input type="radio" name="options"  >动态称重
												</label>
												<label data_dir="健康监测" id="btn_health" class="btn btn-info" onclick="view_type('health')" >
													<input type="radio" name="options"  >健康监测
												</label>
												<label data_dir="GPS" id="btn_gps" class="btn btn-info"  onclick="view_type('GPS')">
												<input type="radio" name="options"  >GPS
												</label>
												</div>
												</div>
										</div>
										</div>
									<!-- widget content -->
									<div class="widget-body  no-padding" style="height: 530px">
										<div id="cal_panel" style="width: 300px;height: 300px;margin-left: 50px;margin-top: 20px">
										<div id="calendar">
										</div>
										</div>
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
			
			            </article><!-- END GRID -->
			            
			            <!-- SINGLE GRID -->
			            <article id="tree_view" class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>动态称重数据 </h2>
				
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
														<input type="text" style="width:120px" class="form-control" placeholder="请选择日期" id="reservation" onclick="">
														</div>	
														<span class="pull-left spa" style="padding-top: 5px;">至</span>
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
		
		<div id="cover" class="cover">
		    <div id="loading" class="loading"> 查询数据中
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
		<script src="../js/plugin/jquery-form/jquery-form.min.js"></script>

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
		<script src="../js/multiDownload.js"></script>
		<script src="../js/ZeroClipboard.js"></script>
		<script src="http://pstatic.xunlei.com/js/webThunderDetect.js"></script>
		<script src="http://pstatic.xunlei.com/js/base64.js"></script>
        <!--layDate日期控件-->
        <script src="../js/laydate/laydate.js"></script>
        <script type="text/javascript" src="../js/plugin/carlendar/calendar.js"></script>
        <script src="../js/jquery.cookie.js"></script>
		<script type="text/javascript">
		
		
		var data_type = "weight";
		
		
		//格式化时间
		function FormatDate (strTime) {
		    var date = new Date(strTime);
		    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
		}
		    // 开始时间
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
						 var thunder=ThunderEncode("ftp://ht:ht123,@115.159.78.246/"+full.bridge_no+"W/"+full.data_file);
						 link=link+thunder+"\r\n";
			    	  }else{
			    		  var thunder=ThunderEncode("ftp://ht:ht123,@115.159.109.101/"+full.bridge_no+"W/"+full.data_file);
						  link=link+thunder+"\r\n";
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
		
		  var brg_name =  $.cookie("brg_name");
	      var brg_id = $.cookie("brg_id");
	         //复制内容到剪贴板成功后的操作  
			$(document).ready(function() {
				// DO NOT REMOVE : GLOBAL FUNCTIONS!
				pageSetUp();
				setBrg();
				//initTree();
				//initManageSection();
				//dialogOperation();
				initCopy();
				hideBtn();
				
			});
			
	         
	       
	         function setBrg() {
				$("#brg_name").val(brg_name);
			};
	         
			 function hideBtn() {
				 $("#btn_weight").hide();
				 $("#btn_health").hide();
				 $("#btn_gps").hide();
				 $.ajax({
						type:'POST',
						url: '../WeightHealthServlet',
						dataType: 'json',
						data:{
							type:"hideBtn",
							brg_id : brg_id
						},
						success:function(json){
							if (json.success=="success") {
								var data = json.obj;
								for (var i = 0; i < data.length; i++) {
									console.log(data[i].mode);
									if (data[i].mode=="g") {
										 $("#btn_gps").show();
										 data_type="GPS";
										 resetActive("gps");
									}else if(data[i].mode=="s"){
										$("#btn_health").show();
										data_type="health";
										resetActive("health");
									}else if(data[i].mode=="w"){
										$("#btn_weight").show();
										 data_type="weight";
										 resetActive("weight");
									}
								}
								getStart_date();
							}
						}
					});		
			}

			var thunder_url = "ftp://ht:ht123,@115.159.109.101/S38LR0710320281W/2017-05-16%2014-12-32.txt";
			var thunder_url2="ftp://ht:ht123,@115.159.109.101/S38LR0710320281W/2017-05-16%2009-42-32.txt";
			var tdd="ftp://ht:ht123,@115.159.109.101/S38LR0710320281W/2017-05-16%2006-12-32.txt";
			var thunder_pid = "57029";
			var restitle = "121";
			function thunderDownload(){
				console.log(ThunderEncode(thunder_url));
				$('#thunderDownload').attr('thunderHref',ThunderEncode(thunder_url));
				$('#thunderDownload').attr('thunderPid',thunder_pid);
				$('#thunderDownload').attr('thunderResTitle',restitle);
				$('#thunderDownload').attr('onClick',"return OnDownloadClick_Simple(this,2,4)" );
				$('#thunderDownload').attr('oncontextmenu',"ThunderNetwork_SetHref(this)" );
				
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
				
				$('#showtable').dialog({
					  buttons: [
					    {
						   	  html : "<i class='fa fa-times'></i>&nbsp; 确定",
							  "class" : "btn btn-default",
							  click: function() {
							     $( this ).dialog( "close" );
								}
							}
					  ]
					});
				
				$('#dynamic').dialog({
					  buttons: [
					    {
						   	  html : "<i class='fa fa-times'></i>&nbsp; 取消",
							  "class" : "btn btn-default",
							  click: function() { 
								  $(this).dialog("close");
								}
							}
					  ]
					});
			}
			
			function fileUpload(){
				var fileName = $('#fileName').val();
		        if (fileName == "") {
		            return;
		        }
				var option = {
						url:'../FileUploadServlet',
						type:'POST',
						dataType: 'json',
						headers:{"ClientCallMode" : "ajax"},
						success:function(json){
							if(json.obj.brgName=='lanetell.m'){
								$("#td1").html('').append("<td id='td1'>"+json.obj.brgUploadTime+"</td>");
								$("#td2").html('').append("<td id='td2' style='color:green'>"+json.obj.brgUploadStatus+"</td>");
							}else if(json.obj.brgName=='overload.m'){
								$("#td3").html('').append("<td id='td3'>"+json.obj.brgUploadTime+"</td>");
								$("#td4").html('').append("<td id='td4' style='color:green'>"+json.obj.brgUploadStatus+"</td>");
							}else if(json.obj.brgName=='WIM_Mainfunc.m'){
								$("#td5").html('').append("<td id='td5'>"+json.obj.brgUploadTime+"</td>");
								$("#td6").html('').append("<td id='td6' style='color:green'>"+json.obj.brgUploadStatus+"</td>");
							}else if(json.obj.brgName=='axletell.m'){
								$("#td7").html('').append("<td id='td7'>"+json.obj.brgUploadTime+"</td>");
								$("#td8").html('').append("<td id='td8' style='color:green'>"+json.obj.brgUploadStatus+"</td>");
							}else if(json.obj.brgName=='axletellhou.m'){
								$("#td9").html('').append("<td id='td9'>"+json.obj.brgUploadTime+"</td>");
								$("#td10").html('').append("<td id='td10' style='color:green'>"+json.obj.brgUploadStatus+"</td>");
							}else{
								alert("错误文件");
							}
							if($("#td2").text()=='成功'&&$("#td4").text()=='成功'&&$("#td6").text()=='成功'&&$("#td8").text()=='成功'&&$("#td10").text()=='成功'){
								$("#showButton").attr("disabled",false);	
							}
						}
				}   
			      $("#fm1").ajaxSubmit(option);
			      return false;
			}
			
			
			function compile(){
				myTool.mask.show('编译中...');
				$.ajax({
					type:'POST',
					url: '../NumVehiServlet',
					dataType: 'json',
					data:{
						type:"compile",
					},
					success:function(json){
						myTool.mask.hide();
						successMessage(json.obj);
					}
				});
			}
			
			
			$('#showtable').dialog({
				autoOpen: false,
				width : 1100,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop',
				title:'查看信息'
			});
			
			$('#dynamic').dialog({
				closeOnEscape:true,
				autoOpen: false,
				width : 500,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop',
				title:'动态编译'
			});
			
			$(".ui-dialog-titlebar-close").on('click', function(){
				$(this).dialog("close");
			});
			
			
			
			
			function addBrgSystem(){
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"addBrgWeightSystem",
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
									  },
						                 {
								      "targets": 4,
								      "searchable": false,
								      "render": function(data, type, full) {
								    	  if(full.is_download==1){
								    		  return "<a href='ftp://ht:ht123,@115.159.78.246/"+full.bridge_no+"W/"+full.data_file+"' download='"+full.data_file+"'>下载</a>";
								    	  }else{
								    	  return "<a id='"+full.data_file+"' href='ftp://ht:ht123,@115.159.109.101/"+full.bridge_no+"W/"+full.data_file+"' download='"+full.data_file+"'>下载</a>";
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

			function initBridge(){
				$.ajax({
					type: 'POST',
					url: '../StructMgrServlet',
					dataType: 'json',
					data: {
						type:"initBridge",
						mode:"w"
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
		
			
		function view_type(str){
			data_type=str;
			getStart_date();
			
		}	
			
		
			
		function initCalendar(str,start){
			console.log(str);
			$('#cal_panel').empty();
			$("#cal_panel").append("<div id='calendar'></div>")
			$('#calendar').calendar({
		        width: 450,
		        height: 450,
				format: 'yyyy-MM-dd',
				selectedRang:[start,FormatDate(new Date())],
				data : str,
		        onSelected: function (view, date, data) {
		        	
		        	 
        	    var selectDate = new Date(date).format("yyyy-MM-dd");
        	    console.log(selectDate);	
		        searchByCalendar(selectDate);
		        }
		    });	
		}
			
		function searchByCalendar(time) {
			$.fn.dataTable.ext.search.pop();
	         console.log(time);
	         $.fn.dataTable.ext.search.push(
	             function (settings, data, dataIndex) {
	                 if(data[1].indexOf(time) != -1){
	                         return true; 
	                 }else{
	                 }
	             }
	         );
	         table.draw();
		}

		Date.prototype.format = function(fmt) { 
		     var o = { 
		        "M+" : this.getMonth()+1,                 //月份 
		        "d+" : this.getDate(),                    //日 
		        "h+" : this.getHours(),                   //小时 
		        "m+" : this.getMinutes(),                 //分 
		        "s+" : this.getSeconds(),                 //秒 
		        "q+" : Math.floor((this.getMonth()+3)/3),   //季度  
		        "S"  : this.getMilliseconds()             //毫秒 
		    }; 
		    if(/(y+)/.test(fmt)) {
		            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
		    }
		     for(var k in o) {
		        if(new RegExp("("+ k +")").test(fmt)){
		             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
		         }
		     }
		    return fmt; 
		}        
		
		
		
			function initTable(){
				$('#dt').dataTable().fnClearTable();
				showMask();
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"Sourcedata",
						bridge_id:brg_id,
						data_type:data_type
					},
					error : function(msg) {
						errMessage("请求WeightHealthServlet失败");
				    },
					success : function(json) {   
						 if(json.success=="fail"){
							 switch (json.error) {
							case 1:
								//successMessage("没有数据");
								break;
							case 2:
								errMessage("服务器错误！");
								break;
							default:
								break;
							}
						 }else{
							
							 var data = json.obj.table;
							 for(var i in data){
								 data[i].state=false;
							 }
							 hideMask();
							 table.rows.add(data).draw(false); 
							 initCalendar(json.obj.calendar,start);
						 }
						
					}
				});
			}
			var start ;
			function getStart_date() {
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"getStart_date",
						brg_id : brg_id,
						data_type : data_type
						
					},
					error : function(msg) {
						errMessage("请求StructMgrServlet失败");
				    },
					success : function(json) {   
						if (json.success !="fail") {
							console.log(json);
							start= json.success;
							initTable();
						}
						
					}
			});
			};
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
			
			/***/
			function resetActive(str) {
				$("#view_type .btn-info").removeClass("active");
				var a = "#btn_"+str;
				$(a).addClass("active");
			}
			
			/**遮罩*/
			function showMask() {
		        $("#cover").show();
		    }
		    function hideMask() {
		        $("#cover").css('display', 'none');
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