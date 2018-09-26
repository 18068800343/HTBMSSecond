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
				<li>文档管理</li><li>报告归档</li><li>归档</li>
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
									<h2>归档</h2>	
									
											
								</header>
				
				
									<div class="jarviswidget-editbox">
										
									</div>
				
									<div class="widget-body">

										<div id="myTabContent1"
											class="tab-content bg-color-white no-padding">
											
			<div class="row">
			    <div class="form-group col-xs-4" style="height: 20px">
					<label>上传报告</label>
					<form id="uploadfile" method="post" action='../FileManageServlet'>
					<input type="file" class="btn btn-default" id="reportfile" name="reportfile" style="height: 32px;width: 100%">
					</form>
				</div>
				<div class="form-group col-xs-4">
					<label>报告类型</label><i class="text-danger">*</i>
					<select	class="form-control" id="filetype">
						<option value="科研">科研</option>
						<option value="检测">检测</option>
						<option value="设计">设计</option>
						<option value="施工">施工</option>
						</select>
				</div>
				<div class="form-group col-xs-4">
					<label>报告名称</label>
					<input type="text" class="form-control" id="reportname" placeholder='报告名称'>
				</div>
				<div class="form-group col-xs-4">
					<label>报告编号</label>
					<input type="text" class="form-control" id="reportid" placeholder='报告编号'>
				</div>
				<div class="form-group col-xs-4">
					<label>任务单号</label>
					<input type="text" class="form-control" id="missionno" placeholder='任务单号'>
				</div>
				<div class="form-group col-xs-4">
					<label>项目名称</label>
					<input type="text" class="form-control" id="prjname" placeholder='项目名称'>
				</div>
				<div class="form-group col-xs-4">
					<label>负责人</label>
					<select	class="form-control select2" id="user">
					</select>
				</div>
				<div class="form-group col-xs-4">
					<label>出版时间</label>
					<input type="text" class="form-control" placeholder="选择日期" id="publishdate">
				</div>
				<div class="form-group col-xs-4">
					<label>份/张</label>
					<input type="text" class="form-control" id='copies'>
				</div>
				<div class="form-group col-xs-4">
					<label>归档日期</label>
					<input type="text" class="form-control" placeholder="选择日期" id="filingdate">
				</div>
				<div class="form-group col-xs-4">
					<label>档案编号</label><i class="text-danger">*</i>
					<input type="text" class="form-control" id='recordno'>
				</div>
				<div class="form-group col-xs-4">
					<label>是否公开</label><i class="text-danger">*</i>
					<select	class="form-control select2" id="publicornot">
					<option>公开</option>
					<option>不公开</option>
					</select>
				</div>
				<div class="form-group col-xs-4">
					<label>合同归档</label><i class="text-danger">*</i>
					<select	class="form-control select2" id="contractFiling">
					<option>是</option>
					<option>否</option>
					</select>
				</div>
				<div class="form-group col-xs-4">
					<label>备注</label>
					<input type="text" class="form-control" id='note'>
				</div>
			</div>
			<table id="structTable" class="table table-striped table-bordered table-hover" style="width: 100%">
				<thead>
					<tr>
						<th>
							<select class="input-sm form-control" style="width: 100%;" onchange="structTable.column( '6' ).search( this.value ).draw( false );"><option value="">全部</option><option value="true">已选</option><option value="false">未选</option></select>
						</th>
						<th> 
							<select class="input-sm form-control" style="width: 100%;" onchange="searchMode(this.value)"><option value="">全部</option><option>桥梁</option><option>通道</option><option>涵洞</option></select>
						</th>
						<th>
							<input type="text" class="form-control hasinput" placeholder="检索" />
						</th>
						<th >
							<input type="text" class="form-control hasinput" placeholder="检索" />
						</th>
						<th>
							<input type="text" class="form-control hasinput" placeholder="检索" />
						</th>
						
					</tr>	 
					<tr>
						<th>
							<label class="checkbox-inline" style="width: 100%;height: 100%;">
								  <input type="checkbox" class="checkbox style-0" id="autoChk">
								  <span></span>
							</label>
						</th>
						<th>结构编号</th>
						<th>结构名称</th>
						<th>管养单位</th>
						<th>所属路段</th>
						<th>结构分类</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			<div class="text-center padding-10">
					<a class="btn btn-primary pull-right" id="upload">报告归档</a>
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
			<div id="loading" class="loading">上传报告中
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
    <!--layDate日期控件-->
    <script src="../js/laydate/laydate.js"></script>
	<script type="text/javascript">
			

</script>

	<script type="text/javascript">
	var structTable = $('#structTable').DataTable( {
		"deferRender": true,
		"processing": true,
    	"sDom": 
			"t"+
			"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "bDestroy": true,
        "iDisplayLength": 7,
        "autoWidth" : false,
		"bScrollCollapse" : true,
		"sScrollY" : 400, 
        "oLanguage": {
		    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
		},
        "columns": [
        	{ "data": "state", 'orderable': false },
        	{ "data": "struct_no" },
        	{ "data": "struct_name" },
            { "data": "manage_short_name" },
            { "data": "section_name" },
            { "data": "struct_mode", 'visible': false },
            { "data": null, 'visible': false },
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
				      "targets": 5,
				      "searchable": true,
				      "render": function(data, type, full) {
				    	  	if(data=="bridge"){
				    	  		return '桥梁';
				    	  	}
				    	  	if(data=="pass"){
				    	  		return '通道';
				    	  	}
				    	  	if(data=="culvert"){
				    	  		return '涵洞';
				    	  	}
				          }
				    },
				    {
					      "targets": 6,
					      "searchable": true,
					      "render": function(data, type, full) { 
					    	  	return full.state;
					          }
					    }],
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
	function initStructTable(){
		$.ajax({
			type: 'POST',
			url: '../PrjMgrServlet',
			dataType: 'json',
			data: {
				type:"initAllStructTable"
			},
			error : function(msg) {
				errMessage("请求PrjMgrServlet失败");
				$('#structTable').dataTable().fnClearTable();
		    },
			success : function(json) {
				$('#structTable').dataTable().fnClearTable();
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
					 var tabledata=json.obj;
					 if(reportvo!=null&&reportvo.reportstruct!=undefined){
						 console.log(reportvo);
						 tabledata=checkStructIn(tabledata,reportvo.reportstruct)
					 }
					 structTable.rows.add(tabledata).draw( false );
				 }
			}
		});
	}
	function checkStructIn(data,reportstruct){
		for(var i=0;i<data.length;i++){
			for(var j=0;j<reportstruct.length;j++){
				if(data[i].struct_name==reportstruct[j].struct_name){
					if(data[i].manage_name==reportstruct[j].manage_name){
						if(data[i].section_name==reportstruct[j].section_name){
							data[i].state=true;
							break;
						}
					}
				}
			}
		}
		return data;
	}
	 $('#autoChk').on('click', function(){
		 var s = $(this).prop('checked');
		$('#structTable .cbox').prop('checked', s).trigger('change');
	 });
	 $(".hasinput").on( 'change', function () {
		 structTable
	            .column( $(this).parent().index()+':visible' )
	            .search( this.value )
	            .draw(false);
	    } );
	 function searchMode( d ){
			structTable
		    .column( '5' )
		    .search( d )
		    .draw ( false );
		}
	 $('#structTable').delegate('.cbox', 'change', function(){
		 var state = $(this).prop('checked');
		 var tr = $(this).closest('tr');
		 structTable.row(tr).data().state=state;
		 autoChk();
		 structTable.cell(tr, 6).data(state);
	 });
	 $('#structTable').on('draw.dt',function() {
		 autoChk();
        });
	 function autoChk(){
		 var s = true;
        $('#structTable').find('.cbox').each(function(){
        	if($(this).prop('checked')==false){
        		s=false;
        		return false;
        	}
        });
       $('#autoChk').prop('checked', s);
	 }
	 
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
		 elem: '#publishdate',
		 type: 'date'
	});
	
	laydate.render({
		 elem: '#filingdate',
		 type: 'date'
	});
	
	function initUser(){
		$.ajax({
			type: 'POST',
			url: '../FileManageServlet',
			dataType: 'json',
			async:false,
			data: {
			    type:'initUser'
			},
			error : function(msg) {
				errMessage("请求FileManageServlet失败！");
		    },
			success : function(json) { 
				if(json.obj==""||json.obj==undefined||json.obj==null){
					errMessage("获取用户信息失败！");
				}else{
					$('#user').empty();
					var data=json.obj;
					for(var i=0;i<data.length;i++){
						$('#user').append('<option>'+data[i]+'</option>');
					}
		        }
	         }
          });
	}
	var id=null;
		$(document).ready(function() {
			    pageSetUp();
				initUser();
				id=getQueryString('id')
				if(id!=null){
					initEditReport(id)
				}else{
					initStructTable();
				}
				
				
		});
		function getQueryString(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) return unescape(r[2]); return null; 
		} 
		
		
		
		function checkReportID(report_id){
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				async:false,
				data: {
				    type:'checkReportID',
				    report_id:report_id
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败！");
			    },
				success : function(json) { 
					if(json.success=="fail"){
						$('#upload').removeClass('disabled');
					}else{
						errMessage("当前编号已存在!");
						$('#upload').addClass('disabled');
			        }
		         }
	          });
		}
		var reportvo=null;
		var type='reportFile';
		function initEditReport(id){
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				async:false,
				data: {
				    type:'initEditReport',
				    id:id
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败！");
			    },
				success : function(json) { 
					if(id==json.obj.id){
						reportvo=json.obj;
						$('#filetype').val(reportvo.report_type);
						$('#reportname').val(reportvo.report_name);
						$('#reportid').val(reportvo.report_id);
						$('#missionno').val(reportvo.mission_no);
						$('#prjname').val(reportvo.project_name);
						$('#user').val(reportvo.charge_man).trigger('change');
						$('#publishdate').val(reportvo.publish_date);
						$('#copies').val(reportvo.copies);
						$('#filingdate').val(reportvo.filing_date);
						$('#recordno').val(reportvo.record_no);
						$('#publicornot').val(reportvo.is_public);
						$('#contractFiling').val(reportvo.contract_filing);
						$('#note').val(reportvo.note);
						$('#upload').html('报告修改');
						type='updateReport';
						initStructTable();
					}else{
						location.href='reportFiling.jsp';
					}
		         }
	          });
		}
		
		function getFileName(){
			var fn=$('#reportfile').val();
			return fn.substring(fn.lastIndexOf('\\')+1,fn.length);
		}
		function getExtraName(){
			var fn=$('#reportfile').val();
			return fn.substring(fn.lastIndexOf('.')+1,fn.length);
		}
		//报告归档
		$('#upload').on('click', function() {
			var fn=$('#reportfile').val();
			var reporttype = $('#filetype').val();
			var reportname = $('#reportname').val();
			var reportid = $('#reportid').val();
			var missionno = $('#missionno').val();
			var prjname = $('#prjname').val();
			var user = $('#user').val();
			var publishdate = $('#publishdate').val();
			var copies = $('#copies').val();
			var filingdate = $('#filingdate').val();
			var recordno = $('#recordno').val();
			var publicornot = $('#publicornot').val();
			var contractFiling=$('#contractFiling').val();
			var note = $('#note').val();
			if(reporttype==''||recordno==''||publicornot==''||contractFiling==''){
				errMessage('数据不完整！');
				return;
			}
			var data = structTable.data();
			var structs = [];
			for(var i=0;i<data.length;i++){
				if(data[i].state){
					structs.push(data[i]);
				}
			}
			console.log(structs);
			if(fn==null||fn==''){
				if(reportvo!=null){
					reportToDb(reportvo.report_dir);
				}else{
					reportToDb('');
				}
				return;
			}
            console.log('开始上传');
            showMask();
            var filename=getFileName();
            var extraname=getExtraName();
		    $('#uploadfile').ajaxSubmit({
		    		 headers:{
		    			 extraname: extraname,
		    			 filetype:'report'
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
		                	successMessage('报告上传成功');
		                	reportToDb(path);
		                }else{
		                	errMessage("报告上传失败");
		                }
		            }
		        });
		     
		});
		
		
		function reportToDb(path){
			var report_id='';
			if(type=='updateReport'){
			   report_id=reportvo.report_id;
			}
			var fn=$('#reportfile').val();
			var reporttype = $('#filetype').val();
			var reportname = $('#reportname').val();
			var reportid = $('#reportid').val();
			var missionno = $('#missionno').val();
			var prjname = $('#prjname').val();
			var user = $('#user').val();
			var publishdate = $('#publishdate').val();
			var copies = $('#copies').val();
			var filingdate = $('#filingdate').val();
			var recordno = $('#recordno').val();
			var publicornot = $('#publicornot').val();
			var contractFiling=$('#contractFiling').val();
			var note = $('#note').val();
			var data = structTable.data();
			var structs = [];
			for(var i=0;i<data.length;i++){
				if(data[i].state){
					structs.push(data[i]);
				}
			}
			$.ajax({
				type: 'POST',
				url: '../FileManageServlet',
				dataType: 'json',
				async:false,
				data: {
				    type:type,
				    id:id,
				    structs:JSON.stringify(structs),
				    reporttype:reporttype,
				    reportname:reportname,
				    reportid:reportid,
				    missionno:missionno,
				    prjname:prjname,
				    user:user,
				    publishdate:publishdate,
				    copies:copies,
				    filingdate:filingdate,
				    recordno:recordno,
				    publicornot:publicornot,
				    contractFiling:contractFiling,
				    note:note,
				    path:path,
				    report_id:report_id
				},
				error : function(msg) {
					errMessage("请求FileManageServlet失败！");
			    },
				success : function(json) { 
					if(json.success=="fail"){
						errMessage("失败！");
					}else{
						if(type=='reportFile'){
							successMessage("归档成功！");
						}else{
							successMessage("修改报告成功！");
						}
						
			        }
		         }
	          });
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