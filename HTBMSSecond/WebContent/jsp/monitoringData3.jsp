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
		<link rel="stylesheet" href="../js/plugin/daterangepicker/daterangepicker.css">
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
		
		#reservation{margin-left:12px;border:1;padding:5px;}
		
		#reservationEnd{margin-left:12px;border:1;padding:5px;}
		
		.spa{margin-left:12px;border:0;padding:0;}
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
					<li>实时监测</li><li>监测数据</li>
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
			            <!-- SINGLE GRID -->
			            
			            <article id="monitoring_img" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>工程图例</h2>
									<span class="pull-right"><a class="btn btn-primary" onclick="turnBack()">返回上一级</a></span>
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
										<div style="height: auto; ">
										<img alt="工程图" style=" height:640px;width: 800px" src="../img/GCTL/123.jpg"></img>
										</div>
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
			
			            </article><!-- END GRID -->		
			            <article id="monitoring_data" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>监测数据 </h2>
				
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
									
									<div style="height: auto">
										 <table id="myTabOne1" class="table table-bordered table-hover" border="2"  bordercolor="black" cellspacing="0" cellpadding="0"></table>
									</div>
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
							<select style="width:100%" class="input-sm select2 " id="section">
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
		<div id="showtable" hidden="hidden">
			<ul  class="nav nav-tabs pull-left">
                      <li class="active"><a href="#s1" data-toggle="tab" id='tab1'>车道系统交通量</a></li>
                      <li><a href="#s2" data-toggle="tab" id='tab2'>最大车重</a></li>
                      <li><a href="#s3" data-toggle="tab" id='tab3'>超载车辆数</a></li>
                      <li><a href="#s4" data-toggle="tab" id='tab4'>超载比例</a></li>
                      <li><a href="#s5" data-toggle="tab" id='tab5'>平均超载率</a></li>
            </ul>
                   <div id="myTabContent1"
                        class="tab-content bg-color-white no-padding" style="overflow-x: auto; overflow-y: auto; height:410px; width:1080px;">
                       <div class="tab-pane fade in active" id="s1">
                                <table id="myTabOne1" class="table table-bordered table-hover" border="2"  bordercolor="black" cellspacing="0" cellpadding="0"></table>
                       </div>
                       <div class="tab-pane fade in" id="s2">
                               <table id="myTabOne2" class="table table-bordered table-hover" border="2"  bordercolor="black" cellspacing="0" cellpadding="0"></table>
                       </div>
                       <div class="tab-pane fade in" id="s3">
                               <table id="myTabOne3" class="table table-bordered table-hover" border="2"  bordercolor="black" cellspacing="0" cellpadding="0"></table>
                       </div>
                       <div class="tab-pane fade in" id="s4">
                               <table id="myTabOne4" class="table table-bordered table-hover" border="2"  bordercolor="black" cellspacing="0" cellpadding="0"></table>
                       </div>
                       <div class="tab-pane fade in" id="s5">
                               <table id="myTabOne5" class="table table-bordered table-hover" border="2"  bordercolor="black" cellspacing="0" cellpadding="0"></table>
                       </div>
                   </div>
         	</div>
         	<div id="dynamic" hidden="hidden">
         		<table id="fileTable" class='table table-bordered table-hover'>
         			
         		</table>
	         	<div class="col-sm-12">
	         		<div class="col-sm-10">
	         			<form id="fm1" method="post" enctype="multipart/form-data" action="../FileUploadServlet">
	         				<input type="file" id="fileName" name="fileUpload">
	         				<a class="btn btn-primary btn-sm" onclick="fileUpload()">上传</a>
	         			</form>
	         		</div>
	         		<div class="col-sm-2 shb1">
	         			<a class="btn btn-primary btn-sm pull-left" disabled="true" id="showButton" onclick="compile()">编译</a>
	         		</div>
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
		<script src="../js/plugin/daterangepicker/moment.min.js"></script>
        <script src="../js/plugin/daterangepicker/daterangepicker.js"></script>
        <script src="../js/My97DatePicker/WdatePicker.js"></script>
        <!--layDate日期控件-->
        <script src="../js/laydate/laydate.js"></script>
		
		<script type="text/javascript">
		function turnBack()
		{
			location.href="monitoringDataV2.jsp";
			
		}
		
		var now = "1";
		function changeView(){
			if(now=="1"){
			$("#monitoring_data").hide();
			$("#monitoring_img").hide();
			$("#changePage").text("查看监测数据 >>");
			now = "2";
			}else if(now=="2"){
			$("#monitoring_data").show();
			$("#monitoring_img").show();
			$("#changePage").text("数据下载 >>");
			now="1";
			}
			
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
	         //复制内容到剪贴板成功后的操作  
			$(document).ready(function() {
				// DO NOT REMOVE : GLOBAL FUNCTIONS!
				pageSetUp();
				initTree();
				initManageSection();
				dialogOperation();
				initCopy();
				showtable();
			});
			

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
			
			function dynamic(){
				var fileTable=$("#fileTable").html('');
				$.ajax({
					type: 'POST',
					url: '../GetFileServlet',
					dataType: 'json',
					success:function(json){
						console.log(json.obj)
						fileTable.append("<tr>"+
		         				"<td>"+"编号"+"</td>"+
		         				"<td>"+"文件名"+"</td>"+
		         				"<td>"+"上传时间"+"</td>"+
		         				"<td>"+"上传状态"+"</td>"+
		         			"</tr>"+
		         			"<tr>"+
		         				"<td>"+"1"+"</td>"+
		         				"<td>"+"lanetell.m"+"</td>"+
		         				"<td id='td1'>"+json.obj[0].list1[0].brgUploadTime+"</td>"+
		         				"<td id='td2' style='color:green'>"+json.obj[0].list1[0].brgUploadStatus+"</td>"+
		         			"</tr>"+
		         			"<tr>"+
		         				"<td>"+"2"+"</td>"+
		         				"<td>"+"overload.m"+"</td>"+
		         				"<td id='td3'>"+json.obj[0].list2[0].brgUploadTime+"</td>"+
		         				"<td id='td4' style='color:green'>"+json.obj[0].list2[0].brgUploadStatus+"</td>"+
	         				"</tr>"+
	         				"<tr>"+
		         				"<td>"+"3"+"</td>"+
		         				"<td>"+"WIM_Mainfunc.m"+"</td>"+
		         				"<td id='td5'>"+json.obj[0].list3[0].brgUploadTime+"</td>"+
		         				"<td id='td6' style='color:green'>"+json.obj[0].list3[0].brgUploadStatus+"</td>"+
		         			"</tr>"+
		         			"<tr>"+
			     				"<td>"+"4"+"</td>"+
			     				"<td>"+"axletell.m"+"</td>"+
			     				"<td id='td7'>"+json.obj[0].list4[0].brgUploadTime+"</td>"+
			     				"<td id='td8' style='color:green'>"+json.obj[0].list4[0].brgUploadStatus+"</td>"+
			     			"</tr>"+
			     			"<tr>"+
				 				"<td>"+"5"+"</td>"+
				 				"<td>"+"axletellhou.m"+"</td>"+
				 				"<td id='td9'>"+json.obj[0].list5[0].brgUploadTime+"</td>"+
				 				"<td id='td10' style='color:green'>"+json.obj[0].list5[0].brgUploadStatus+"</td>"+
 							"</tr>")
						$('#dynamic').dialog("open");
						if($("#td2").text()=='成功'&&$("#td4").text()=='成功'&&$("#td6").text()=='成功'&&$("#td8").text()=='成功'&&$("#td10").text()=='成功'){
							$("#showButton").attr("disabled",false);	
						}
					}
				});
			}
			
			
			function showtable(){
				var NumVehi=$("#myTabOne1").html('');
				var MaxGw=$("#myTabOne2").html('');
				var NumOvlo=$("#myTabOne3").html('');
				var RatioOvlo=$("#myTabOne4").html('');
				var ProbOvlo=$("#myTabOne5").html('');
				$.ajax({
					type: 'POST',
					url: '../NumVehiServlet',
					dataType: 'json',
					data:{
						type:"getNumVehi",
						timeType:"day"
					},
					success : function(json){	
					//	console.log(json.obj[0].NumVehi[0].brgId);
						NumVehi.append("<thead>"+
							"<tr>"+
								"<th colspan='10'>"+"车道系统交通量"+"</th>"+
							"</tr>"+
						"</thead>"+
						"<tfoot>"+
							"<tr align='center'>"+
								"<td>"+"方向"+"</td>"+
								"<td>"+"车道编号"+"</td>"+
								"<td>"+"车道名"+"</td>"+
								"<td>"+"2轴车"+"</td>"+
								"<td>"+"3轴车"+"</td>"+
								"<td>"+"4轴车"+"</td>"+
								"<td>"+"5轴车"+"</td>"+
								"<td>"+"6轴车"+"</td>"+
								"<td>"+"7轴车及以上"+"</td>"+
								"<td>"+"合计"+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"上行"+"</td>"+
								"<td>"+"1"+"</td>"+
								"<td>"+"停车道"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi1_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi1_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi1_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi1_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi1_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi1_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiLane1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"2"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi2_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi2_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi2_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi2_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi2_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi2_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiLane2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"3"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi3_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi3_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi3_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi3_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi3_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi3_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiLane3+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax1_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax1_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax1_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax1_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax1_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax1_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHalf1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"下行"+"</td>"+
								"<td>"+"4"+"</td>"+
								"<td>"+"车道1"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi4_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi4_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi4_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi4_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi4_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi4_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiLane4+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"5"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi5_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi5_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi5_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi5_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi5_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi5_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiLane5+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"6"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi6_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi6_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi6_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi6_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi6_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehi6_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiLane6+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax2_1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax2_2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax2_3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax2_4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax2_5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHax2_6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiHalf2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+""+"</td>"+
								"<td colspan='2'>"+"合计"+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiAxle1+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiAxle2+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiAxle3+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiAxle4+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiAxle5+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiAxle6+"</td>"+
								"<td>"+json.obj[0].NumVehi[0].numVehiAll+"</td>"+
							"</tr>"+
						"</tfoot>");
						
						MaxGw.append("<thead>"+
							"<tr>"+
								"<th colspan='10'>"+"最大车重"+"</th>"+
							"</tr>"+
						"</thead>"+
						"<tfoot>"+
							"<tr align='center'>"+
								"<td>"+"方向"+"</td>"+
								"<td>"+"车道编号"+"</td>"+
								"<td>"+"车道名"+"</td>"+
								"<td>"+"2轴车"+"</td>"+
								"<td>"+"3轴车"+"</td>"+
								"<td>"+"4轴车"+"</td>"+
								"<td>"+"5轴车"+"</td>"+
								"<td>"+"6轴车"+"</td>"+
								"<td>"+"7轴车及以上"+"</td>"+
								"<td>"+"合计"+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"上行"+"</td>"+
								"<td>"+"1"+"</td>"+
								"<td>"+"停车道"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_1+"'>"+json.obj[0].MaxGw[0].maxGw1_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_2+"'>"+json.obj[0].MaxGw[0].maxGw1_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_3+"'>"+json.obj[0].MaxGw[0].maxGw1_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_4+"'>"+json.obj[0].MaxGw[0].maxGw1_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_5+"'>"+json.obj[0].MaxGw[0].maxGw1_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw1_6+"'>"+json.obj[0].MaxGw[0].maxGw1_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane1+"'>"+json.obj[0].MaxGw[0].maxGwLane1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"2"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_1+"'>"+json.obj[0].MaxGw[0].maxGw2_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_2+"'>"+json.obj[0].MaxGw[0].maxGw2_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_3+"'>"+json.obj[0].MaxGw[0].maxGw2_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_4+"'>"+json.obj[0].MaxGw[0].maxGw2_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_5+"'>"+json.obj[0].MaxGw[0].maxGw2_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw2_6+"'>"+json.obj[0].MaxGw[0].maxGw2_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane2+"'>"+json.obj[0].MaxGw[0].maxGwLane2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"3"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_1+"'>"+json.obj[0].MaxGw[0].maxGw3_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_2+"'>"+json.obj[0].MaxGw[0].maxGw3_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_3+"'>"+json.obj[0].MaxGw[0].maxGw3_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_4+"'>"+json.obj[0].MaxGw[0].maxGw3_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_5+"'>"+json.obj[0].MaxGw[0].maxGw3_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw3_6+"'>"+json.obj[0].MaxGw[0].maxGw3_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane3+"'>"+json.obj[0].MaxGw[0].maxGwLane3+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_1+"'>"+json.obj[0].MaxGw[0].maxGwHax1_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_2+"'>"+json.obj[0].MaxGw[0].maxGwHax1_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_3+"'>"+json.obj[0].MaxGw[0].maxGwHax1_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_4+"'>"+json.obj[0].MaxGw[0].maxGwHax1_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_5+"'>"+json.obj[0].MaxGw[0].maxGwHax1_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax1_6+"'>"+json.obj[0].MaxGw[0].maxGwHax1_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHalf1+"'>"+json.obj[0].MaxGw[0].maxGwHalf1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"下行"+"</td>"+
								"<td>"+"4"+"</td>"+
								"<td>"+"车道1"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_1+"'>"+json.obj[0].MaxGw[0].maxGw4_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_2+"'>"+json.obj[0].MaxGw[0].maxGw4_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_3+"'>"+json.obj[0].MaxGw[0].maxGw4_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_4+"'>"+json.obj[0].MaxGw[0].maxGw4_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_5+"'>"+json.obj[0].MaxGw[0].maxGw4_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw4_6+"'>"+json.obj[0].MaxGw[0].maxGw4_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane4+"'>"+json.obj[0].MaxGw[0].maxGwLane4+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"5"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_1+"'>"+json.obj[0].MaxGw[0].maxGw5_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_2+"'>"+json.obj[0].MaxGw[0].maxGw5_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_3+"'>"+json.obj[0].MaxGw[0].maxGw5_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_4+"'>"+json.obj[0].MaxGw[0].maxGw5_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_5+"'>"+json.obj[0].MaxGw[0].maxGw5_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw5_6+"'>"+json.obj[0].MaxGw[0].maxGw5_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane5+"'>"+json.obj[0].MaxGw[0].maxGwLane5+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"6"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_1+"'>"+json.obj[0].MaxGw[0].maxGw6_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_2+"'>"+json.obj[0].MaxGw[0].maxGw6_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_3+"'>"+json.obj[0].MaxGw[0].maxGw6_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_4+"'>"+json.obj[0].MaxGw[0].maxGw6_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_5+"'>"+json.obj[0].MaxGw[0].maxGw6_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGw6_6+"'>"+json.obj[0].MaxGw[0].maxGw6_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwLane6+"'>"+json.obj[0].MaxGw[0].maxGwLane6+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_1+"'>"+json.obj[0].MaxGw[0].maxGwHax2_1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_2+"'>"+json.obj[0].MaxGw[0].maxGwHax2_2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_3+"'>"+json.obj[0].MaxGw[0].maxGwHax2_3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_4+"'>"+json.obj[0].MaxGw[0].maxGwHax2_4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_5+"'>"+json.obj[0].MaxGw[0].maxGwHax2_5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHax2_6+"'>"+json.obj[0].MaxGw[0].maxGwHax2_6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwHalf2+"'>"+json.obj[0].MaxGw[0].maxGwHalf2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+""+"</td>"+
								"<td colspan='2'>"+"合计"+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle1+"'>"+json.obj[0].MaxGw[0].maxGwAxle1+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle2+"'>"+json.obj[0].MaxGw[0].maxGwAxle2+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle3+"'>"+json.obj[0].MaxGw[0].maxGwAxle3+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle4+"'>"+json.obj[0].MaxGw[0].maxGwAxle4+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle5+"'>"+json.obj[0].MaxGw[0].maxGwAxle5+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAxle6+"'>"+json.obj[0].MaxGw[0].maxGwAxle6+"</td>"+
								"<td title='"+json.obj[0].MaxGwInfo[0].maxGwAll+"'>"+json.obj[0].MaxGw[0].maxGwAll+"</td>"+
							"</tr>"+
						"</tfoot>")
						
						NumOvlo.append("<thead>"+
							"<tr>"+
								"<th colspan='10'>"+"超载车辆数"+"</th>"+
							"</tr>"+
						"</thead>"+
						"<tfoot>"+
							"<tr align='center'>"+
								"<td>"+"方向"+"</td>"+
								"<td>"+"车道编号"+"</td>"+
								"<td>"+"车道名"+"</td>"+
								"<td>"+"2轴车"+"</td>"+
								"<td>"+"3轴车"+"</td>"+
								"<td>"+"4轴车"+"</td>"+
								"<td>"+"5轴车"+"</td>"+
								"<td>"+"6轴车"+"</td>"+
								"<td>"+"7轴车及以上"+"</td>"+
								"<td>"+"合计"+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"上行"+"</td>"+
								"<td>"+"1"+"</td>"+
								"<td>"+"停车道"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo1_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo1_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo1_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo1_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo1_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo1_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloLane1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"2"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo2_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo2_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo2_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo2_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo2_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo2_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloLane2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"3"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo3_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo3_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo3_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo3_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo3_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo3_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloLane3+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax1_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax1_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax1_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax1_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax1_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax1_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHalf1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"下行"+"</td>"+
								"<td>"+"4"+"</td>"+
								"<td>"+"车道1"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo4_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo4_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo4_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo4_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo4_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo4_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloLane4+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"5"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo5_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo5_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo5_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo5_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo5_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo5_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloLane5+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"6"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo6_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo6_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo6_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo6_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo6_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvlo6_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloLane6+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax2_1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax2_2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax2_3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax2_4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax2_5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHax2_6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloHalf2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+""+"</td>"+
								"<td colspan='2'>"+"合计"+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloAxle1+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloAxle2+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloAxle3+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloAxle4+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloAxle5+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloAxle6+"</td>"+
								"<td>"+json.obj[0].NumOvlo[0].numOvloAll+"</td>"+
							"</tr>"+
						"</tfoot>")
						
						RatioOvlo.append("<thead>"+
							"<tr>"+
								"<th colspan='10'>"+"超载比例"+"</th>"+
							"</tr>"+
						"</thead>"+
						"<tfoot>"+
							"<tr align='center'>"+
								"<td>"+"方向"+"</td>"+
								"<td>"+"车道编号"+"</td>"+
								"<td>"+"车道名"+"</td>"+
								"<td>"+"2轴车"+"</td>"+
								"<td>"+"3轴车"+"</td>"+
								"<td>"+"4轴车"+"</td>"+
								"<td>"+"5轴车"+"</td>"+
								"<td>"+"6轴车"+"</td>"+
								"<td>"+"7轴车及以上"+"</td>"+
								"<td>"+"合计"+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"上行"+"</td>"+
								"<td>"+"1"+"</td>"+
								"<td>"+"停车道"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo1_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo1_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo1_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo1_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo1_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo1_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloLane1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"2"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo2_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo2_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo2_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo2_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo2_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo2_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloLane2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"3"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo3_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo3_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo3_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo3_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo3_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo3_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloLane3+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax1_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax1_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax1_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax1_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax1_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax1_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHalf1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"下行"+"</td>"+
								"<td>"+"4"+"</td>"+
								"<td>"+"车道1"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo4_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo4_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo4_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo4_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo4_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo4_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloLane4+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"5"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo5_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo5_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo5_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo5_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo5_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo5_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloLane5+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"6"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo6_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo6_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo6_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo6_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo6_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvlo6_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloLane6+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax2_1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax2_2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax2_3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax2_4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax2_5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHax2_6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloHalf2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+""+"</td>"+
								"<td colspan='2'>"+"合计"+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloAxle1+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloAxle2+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloAxle3+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloAxle4+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloAxle5+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloAxle6+"</td>"+
								"<td>"+json.obj[0].RatioOvlo[0].ratioOvloAll+"</td>"+
							"</tr>"+
						"</tfoot>")
						
						ProbOvlo.append("<thead>"+
							"<tr>"+
								"<th colspan='10'>"+"平均超载率"+"</th>"+
							"</tr>"+
						"</thead>"+
						"<tfoot>"+
							"<tr align='center'>"+
								"<td>"+"方向"+"</td>"+
								"<td>"+"车道编号"+"</td>"+
								"<td>"+"车道名"+"</td>"+
								"<td>"+"2轴车"+"</td>"+
								"<td>"+"3轴车"+"</td>"+
								"<td>"+"4轴车"+"</td>"+
								"<td>"+"5轴车"+"</td>"+
								"<td>"+"6轴车"+"</td>"+
								"<td>"+"7轴车及以上"+"</td>"+
								"<td>"+"合计"+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"上行"+"</td>"+
								"<td>"+"1"+"</td>"+
								"<td>"+"停车道"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo1_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo1_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo1_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo1_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo1_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo1_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloLane1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"2"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo2_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo2_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo2_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo2_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo2_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo2_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloLane2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"3"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo3_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo3_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo3_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo3_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo3_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo3_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloLane3+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax1_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax1_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax1_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax1_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax1_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax1_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHalf1+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td rowspan='4'>"+"下行"+"</td>"+
								"<td>"+"4"+"</td>"+
								"<td>"+"车道1"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo4_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo4_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo4_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo4_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo4_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo4_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloLane4+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"5"+"</td>"+
								"<td>"+"车道2"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo5_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo5_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo5_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo5_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo5_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo5_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloLane5+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+"6"+"</td>"+
								"<td>"+"车道3"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo6_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo6_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo6_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo6_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo6_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvlo6_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloLane6+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td colspan='2'>"+"小计"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax2_1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax2_2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax2_3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax2_4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax2_5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHax2_6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloHalf2+"</td>"+
							"</tr>"+
							"<tr align='center'>"+
								"<td>"+""+"</td>"+
								"<td colspan='2'>"+"合计"+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloAxle1+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloAxle2+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloAxle3+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloAxle4+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloAxle5+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloAxle6+"</td>"+
								"<td>"+json.obj[0].ProbOvlo[0].probOvloAll+"</td>"+
							"</tr>"+
						"</tfoot>")
						
						//$('#showtable').dialog('open');	
					}
				})
				
			}
			
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
			
			
			function initTree(){
				$.ajax({
					type: 'POST',
					url: '../WeightHealthServlet',
					dataType: 'json',
					data: {
						type:"initWeightTree"
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
					if(data[i].type!="weight"){
						//li.prop('style','display:none');
					}
					if(data[i].children.length>0){
						var a = "";
						if(data[i].name=="动态称重"){
							a = "实时监测";
							li.append("<span><i class='fa fa-lg fa-minus-circle'></i> "+a+"</span>");
						}else{
						li.append("<span><i class='fa fa-lg fa-minus-circle'></i> "+data[i].name+"</span>");
						}
						
						li.append(buildTree(data[i].children));
					}else{
						if(data[i].bgco==undefined||data[i].bgco==""){
							li.append("<span class='tree-second'>"+data[i].name+"</span>");
						}else{
								li.append("<span class='tree-second'>"+data[i].name+"</span>");
						}
						if(data[i].type=='bridge'){
							
						}
						//$('#cont').append("<option value='"+data[i].id+"'>"+data[i].name+"<option>");
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
					info.line_no=$(treeSecondSelect).parents('li[data-type=line]').attr('data-id');
					info.line_name=$(treeSecondSelect).parents('li[data-type=line]').attr('data-name');
					info.mode=$(treeSecondSelect).closest('ul').closest('li').attr('data-type');
					info.id = $(treeSecondSelect).closest('li').attr('data-id');
					info.name = $(treeSecondSelect).closest('li').attr('data-name');
					info.type = $(treeSecondSelect).closest('li').attr('data-type');
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
						type:"weight",
						bridge_id:info.id
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
			
			function addSystem(){
				$('#addSystem').dialog('open');
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