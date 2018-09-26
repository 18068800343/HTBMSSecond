<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
		/*a  upload */
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
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
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存" data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>
	
				<!-- breadcrumb -->
				<ol class="breadcrumb">
					<li>系统管理</li>
					<li>用户管理</li>
				</ol>
				<!-- end breadcrumb -->

			</div>
			<!-- END RIBBON -->
			
			<!-- #MAIN CONTENT -->
			<div id="content">
				<div class="row">

				<div class="col-sm-12">
					<article class="col-sm-12 col-md-12 col-lg-12">
				
						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
							
							<header>
								<span class="widget-icon"> <i class="fa fa-eye"></i> </span>
								<h2>用户管理</h2>
								
							</header>
			
							<!-- widget div-->
							<div>
			
								<!-- widget edit box -->
								<div class="jarviswidget-editbox">
									<!-- This area used as dropdown edit box -->
			
								</div>
								<!-- end widget edit box -->
			
								<!-- widget content -->
								<div class="widget-body  no-padding">
									<div class="widget-body-toolbar bg-color-white">
			
											<div class="row">
																																					
												<div class="col-sm-12 col-md-12 ">
													<div class="pull-left col-xs-3"><input class="form-control" id="searchData" value="" placeholder="搜索" type="text"></div>
													<div class="col-sm-6 col-md-6 col-lg-6">
											             <select class=" pull-left select2 " id="company" style="width:100%;">
											              </select>
										          </div>
													<button class="btn btn-primary pull-right" onclick="addUserByCompany()">
														增加
													</button>
													
												</div>
			
											</div>
									</div>
									<table id="dt_basic" class="table table-striped table-bordered table-hover">
										<thead>			                
											<tr>
												<th class="col-sm-1 col-md-1">序号</th>
												<th>用户名</th>
												<th>密码</th>
												<th>角色</th>
												 <th>姓名</th>
												<th>QQ</th>
												<th>电话</th>
												<th>邮箱</th>
												<th>操作</th>
												
											</tr>
										</thead>
										<tbody id="share"></tbody>
									</table>
			
								</div>
								<!-- end widget content -->
			
							</div>
							<!-- end widget div -->
			
						</div>
						<!-- end widget -->
					
					</article>
					
				</div>

			</div>
				<!-- end widget grid -->
			</div>
			<!-- END #MAIN CONTENT -->
		</div>
		<!-- END #MAIN PANEL -->
		<div id="opera" hidden="hidden">
			<form>
				<fieldset>
					<div class="form-group">
						<label>用户编号</label>
						<input class="form-control" id="domain_id" value="" placeholder="用户编号" type="text">
					</div>

					<div class="form-group">
						<label>账号</label>
						<input class="form-control" id="domain_name" value="" placeholder="账号" type="text">
					</div>
					<div class="form-group">
						<label>密码</label>
						<input class="form-control" id="domain_pass" value="" placeholder="密码" type="text">
					</div>
					<div id="cdiv" style="position:relative;width: 172;height: 50"  class="form-group">
						<label>角色</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="domain_role">   
	                    </select>  
	                </div>
	            
	                <label>签名图片</label>
	                	<div id="sign_img"></div>
	                	<a href="javascript:;" class="file">上传签名图片
	               	 	<input id="sign_imgfile" class="file" name="sign_imgfile" type="file">
						</a>
	                <div>
	                </div>
				</fieldset>
			</form>
		</div>
		<div id="testingCompanyAddUser" hidden="hidden">
			<form>
				<fieldset>
				    <div class="form-group" hidden="hidden">
						<label>用户编号</label>
						<input class="form-control" id="tcauId" value="" placeholder="用户编号" type="text">
					</div>
					<div class="form-group">
						<label>账号</label><font style="color: red">*</font>
						<input class="form-control" id="tcauName" value="" placeholder="账号" type="text">
					</div>
					<div class="form-group">
						<label>密码</label><font style="color: red">*</font>
						<input class="form-control" id="tcauPass" value="" placeholder="密码" type="text">
					</div>
					<div id="cdiv" style="position:relative;width: 172;height: 50"  class="form-group">
						<label>角色</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="tcauRole" style="width:100%">   
	                    </select>  
	                </div>
	            <div class="form-group">
				     <label>姓名</label><font style="color: red">*</font>
					 <input class="form-control" id="add_usr_name" value="" placeholder="姓名" type="text">
				</div>
				<div class="form-group">
					<label>电话</label>
					 <input class="form-control" id="phone_no" value="" placeholder="电话" type="text" ">
				</div>
				<div class="form-group">
					<label>QQ</label>
					 <input class="form-control" id="qq_no" value="" placeholder="QQ" type="text" ">
				</div>
				<div class="form-group">
					<label>邮箱</label>
					 <input class="form-control" id="email_no" value="" placeholder="邮箱" type="text"">
				</div>
	                <label>签名图片</label>
	                	<div id="tcau_sign_img" hidden="hidden">
	                	<img id="preview_t" width="100" height="100">
	                	</div>
	                	<a href="javascript:;" class="file">上传签名图片
	               	 	<input id="tcau_sign_imgfile" class="file" name="tcau_sign_imgfile" type="file">
						</a>
	                <div>
	                </div>
				</fieldset>
			</form>
		</div>
		<div id="keepingCompanyAddUser" hidden="hidden">
			<form>
				<fieldset>
				    <div class="form-group" hidden="hidden">
						<label>用户编号</label>
						<input class="form-control" id="kcauId" value="" placeholder="用户编号" type="text">
					</div>
					<div class="form-group">
						<label>用户名</label><font style="color: red">*</font>
						<input class="form-control" id="kcauName" value="" placeholder="用户名" type="text">
					</div>
					<div class="form-group">
						<label>密码</label><font style="color: red">*</font>
						<input class="form-control" id="kcauPass" value="" placeholder="密码" type="text">
					</div>
					<!--@author xianing-->
				<div class="form-group">
				     <label>姓名</label><font style="color: red">*</font>
					 <input class="form-control" id="unit_name" value="" placeholder="姓名" type="text">
				</div>
				<div class="form-group">
					 <label>电话</label>
					 <input class="form-control" id="unit_phone_no" value="" placeholder="电话" type="text">
				</div>
				<div class="form-group">
					<label>QQ</label>
					 <input class="form-control" id="unit_qq_no" value="" placeholder="QQ" type="text">
				</div>
				<div class="form-group">
					<label>邮箱</label>
					 <input class="form-control" id="unit_email_no" value="" placeholder="邮箱" type="text">
				</div>
				   <!--end-->
					
					<div id="krdiv" style="position:relative;width: 172;height: 50"  class="form-group">
						<label>角色</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauRole" style="width:100%">
	                    <option value="orgAdmin">管养公司管理员</option>
	                     <option value="orgCharge">管养公司桥梁主管</option>
	                      <option value="orgDuty">管养公司桥梁分管</option> 
	                      <option value="orgEngineer">管养公司分区工程师</option> 
	                    </select>  
	                </div>
					<div id="kpdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden" >
						<label>部门</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauPart" style="width:100%">   
	                    </select>  
	                </div>
	                <div id="kzdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden">
						<label>分区</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauZone" style="width:100%">   
	                    </select>  
	                </div>
					<div id="kjdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden">
						<label>角色</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauJob" style="width:100%">   
	                    </select>  
	                </div>
	                <!--<div id="kperdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden">
						<label>姓名</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauPerson" style="width:100%">   
	                    </select>  
	                </div> -->
	                <label>签名图片</label>
	                	<div id="kcau_sign_img" hidden="hidden">
	                	<img id="preview_k" width="100" height="100">
	                	</div>
	                	<a href="javascript:;" class="file">上传签名图片
	               	 	<input id="kcau_sign_imgfile" class="file" name="kcau_sign_imgfile" type="file">
						</a>
	                <div>
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
		<!-- <script src="../js/plugin/jqgrid/jquery.jqGrid.min.js"></script>
		<script src="../js/plugin/jqgrid/grid.locale-en.min.js"></script> -->
			
		<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
		<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
		<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>
		<!-- ajaxfileupload文件上传组件 -->
		<script src="../js/ajaxfileupload.js"></script>
		<script type="text/javascript">	
		/**************************************定义全局变量*************************************************************/
		var testingCompanyId='0000#0000#0000';
		var table;
		var parAndZoneInfo=undefined;
		var editAddDel = "<div class='text-align-center'><button class='edit btn-circle'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle'><span class='glyphicon glyphicon-trash'></span></button></div>";
		var editAddDel2 = "<div class='text-align-center'><button class='edit btn-circle' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
		
		/*
		$('input[id=sign_imgfile]').change(function() {  
			$('#photoCover').val($(this).val());  
		});  */
		$.ajaxSetup({
			  async: false
			  });
		$(document).ready(function() {
			// DO NOT REMOVE : GLOBAL FUNCTIONS!
			pageSetUp();
			//initTable();
			/*  $('#dt_basic').on('order.dt search.dt',
					 function(){
				 $('#dt_basic').column(0,{
					 search:'applied',
					 order:'applied',
					 }).nodes().each(
					function(cell,i){
						 cell.innerHtML=i+1;
					});
					}).draw();
             */
			

			
			$('#searchData').on('change', function(){
				var d = $(this).val();
				table.search(d).draw(true);
			});
			
			
			/* END TABLETOOLS */
			$(".theme-popover").hide();
			$('#login').click(function(){
				//alert(11);
				$(".theme-popover").show();
				$('.theme-popover-mask').fadeIn(100);
				$('.theme-popover').slideDown(200);
			});
			$('.theme-poptit .close').click(function(){
				$('.theme-popover-mask').fadeOut(100);
				$('.theme-popover').slideUp(200);
			});

		});
		
		var treeSecondSelect;
		$(function(){
			
			$('#dt_basic').delegate('.edit','click', function () {
				dom=$(this).parents('tr');
				dialogOperation("edit");
		    } );
			$('#dt_basic').delegate('.add','click', function () {
				dom=$(this).parents('tr');
				dialogOperation("add");
		    } );
			$('#dt_basic').delegate('.del','click', function () {
				dom=$(this).parents('tr');
				dialogOperation("del");
		    } ); 
		});
		
		function initSign_img(){
			var sign_img = $("#sign_img");
			var name =  $('#domain_id').val();
			if(sign_img.html()==""){
			sign_img.append("<div><img id='sign' src='"+encodeURI("../ImageDownLoadServer?path=user\\"+encodeURI(name)+".jpg+")+"'  width='100px' height='100px'></div>");
			}
			else{
			$("#sign").prop("src",encodeURI("../ImageDownLoadServer?path=user\\"+encodeURI(name)+".jpg&a="+Math.random()));
			}
		}
		
		function initTable(id){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				data: {
					type:"initTable",
					item_id:id
				},
				error : function(msg) {
					errMessage("请求initTable失败");
			    },
				success : function(json) {   
					 if(json.success=="fail"){
						 errMessage("没有数据或服务器错误");
						 $('#dt_basic').dataTable().fnClearTable();
					 }else{
						 $('#dt_basic').dataTable().fnClearTable(); 
						var data = json.obj;
						for(var i=0;i<data.length;i++){
							if(data[i].role_name=="superAdmin"){
								data.splice(i,1);
								continue;
							}
						}
						$('#dt_basic').DataTable().rows.add(data).draw(false); 
					 }
				}
			});
		}
		//图片预览
		$("#tcau_sign_imgfile").change(function() {
			//alert("秀安");
               var $file = $(this);
               changeImgT($file);
               
});
		function changeImgT($file){
			  var fileObj = $file[0];
              var windowURL = window.URL || window.webkitURL;
              var dataURL;
               var $img = $("#preview_t");

                 if(fileObj && fileObj.files && fileObj.files[0]){
                    dataURL = windowURL.createObjectURL(fileObj.files[0]);
                       $img.attr('src',dataURL);
                                  }else{
                              dataURL = $file.val();
var imgObj = document.getElementById("preview_t");
imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

}
                 $("#tcau_sign_img").show();
		}
		$("#kcau_sign_imgfile").change(function() {
		
            var $file = $(this);
            changeImgK($file);
             
});
		function changeImgK($file){
			 var fileObj = $file[0];
             var windowURL = window.URL || window.webkitURL;
             var dataURL;
              var $img = $("#preview_k");

                if(fileObj && fileObj.files && fileObj.files[0]){
                   dataURL = windowURL.createObjectURL(fileObj.files[0]);
                      $img.attr('src',dataURL);
                                 }else{
                             dataURL = $file.val();
var imgObj = document.getElementById("preview_k");
imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

}
                $("#kcau_sign_img").show();
		}
		//初始化检测公司人员的dataTable的数据
		function initTesTingCompanyTableData(){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				data: {
					type:"initTesTingCompanyTable",
					
				},
				error : function(msg) {
					errMessage("请求initTesTingCompanyTable失败");
			    },
				success : function(json) {   
					 if(json.success=="fail"){
						 errMessage("没有数据或服务器错误==1");
						 $('#dt_basic').dataTable().fnClearTable();
					 }else{
						 $('#dt_basic').dataTable().fnClearTable(); 
						var data = json.obj;
						console.log(data);
						$('#dt_basic').DataTable().rows.add(data).draw(false);
						table.column(4).visible(false);
						table.column(5).visible(false);
						table.column(6).visible(false);
						table.column(7).visible(false);
						//$('#dt_basic').dataTable().column(4).visible(true);
						
					 }
				}
			});
		}
		//初始化 初始化管养公司表格
	function initKeepingCompanyTableData(company){
		$.ajax({
			type: 'POST',
			url: '../UserMgrServlet',
			dataType: 'json',
			data: {
				type:"initKeepingCompanyTable",
				org_id:company,
			},
			error : function(msg) {
				errMessage("请求initKeepingCompanyTable失败");
		    },
			success : function(json) {   
				 if(json.success=="fail"){
					 errMessage("没有数据或服务器错误==");
					 $('#dt_basic').dataTable().fnClearTable();
				 }else{
					 $('#dt_basic').dataTable().fnClearTable(); 
					var data = json.obj;
					$('#dt_basic').DataTable().rows.add(data).draw(false); 
				 }
			}
		});
		}
		//初始化检测公司表格
		function initTesTingCompanyTable(editAddDel,editAddDel2){
			table = $('#dt_basic').DataTable({
				"sDom": 
					"t"+
					"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
				"autoWidth" : false,
				"bScrollCollapse" : true,
				"sScrollY" : 400, 
				 "columns": [
			            { "data": null },
			            { "data": "usr_name" },
			            { "data": "usr_pwd" },
			            { "data": "usr_role" },
			            {"data": "org_usr_name"},
			            {"data": "qq"},
			            {"data": "phone_no"},
			            {"data": "email"},
			            { "data": "usr_id" }
			        ],
				"columnDefs": [ {
				      "targets": 8,
				      "searchable": false,
				      "render": function(data, type, full) {
				    	  //console.log(data);
				    	  if(superAdmin){
				    		  return editAddDel;
				    	  }else{
				    		  if(full.role_name=="admin"){
				    			  return editAddDel2;
				    		  }else{
				    			  return editAddDel;
				    		  }
				    	  }
				          }
				    },{
					      "targets": 3,
					      "searchable": false,
					      "render": function(data, type, full) {
					    	  console.log(data);
					    	    if(data=="guest"){
					    	    	return "检测公司普通用户";
					    	    }
					    	    if(data=="admin"){
					    	    	return "检测公司管理员"
					    	    }
					    	    if(data=='orgAdmin'){
					    	    	return '管养公司管理员'
					    	    }
					    	    if(data=='orgCharge'){
					    	    	return '桥梁主管'
					    	    }
					    	    if(data=='orgDuty'){
					    	    	return '桥梁分管'
					    	    }
					    	    if(data=='orgEngineer'){
					    	    	return '工程师'
					    	    }
					          }
					    } ,{
						      "targets": 0,
						      "searchable": false,
						      "orderable":false,
						    },
					    {	                          
	                          "defaultContent": "",
	                          "targets": "_all"
	                        }
					    ],
				 "order":[[1,'asc']],
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
		     	},
		     	"fnDrawCallback": function(){
                            var api = this.api();
                            var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                            api.column(0).nodes().each(function(cell, i) {
                            cell.innerHTML = startIndex + i + 1;
});
}
			});
		}
		$('#opera').dialog({
			autoOpen: false,
			width : 600,
			resizable : false,
			modal : true
			});
		
		$('#testingCompanyAddUser').dialog({
			autoOpen: false,
			width : 600,
			resizable : false,
			modal : true
			});
		
		$('#keepingCompanyAddUser').dialog({
			autoOpen: false,
			width : 400,
			height:600,
			resizable : false,
			modal : true
			});
		var dom;
		function dialogOperation(op){
			var company=$("#company").val();
			var data = table.row(dom).data();
			var title;
			
			/* $('#opera').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() {
				    	  editOperation();
				    	  window.opener.location.reload();
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
				}); */
			
		 	
			if(op=="edit"){
				title="修改数据"
				
				if(company!=testingCompanyId){
					//$("#kcauId").val(data.usr_no);
					$("#kcauName").val(data.usr_name);
					$("#kcauPass").val(data.usr_pwd);
					$("#kcauRole").val(data.usr_role).trigger("change");
					//$("#kcauRole").find('option:selected').val();
					$("#kcauRole").select2();
					/*  {"data": "org_usr_name"},
			            {"data": "qq"},
			            {"data": "phone_no"},
			            {"data": "email"}, */
					$("#unit_name").val(data.org_usr_name);
					$("#unit_qq_no").val(data.qq);
					$("#unit_phone_no").val(data.phone_no);
					$("#unit_email_no").val(data.email);
					keepingComapnyUserEdit(data);
				}
				else{
					//alert(data.usr_no);
					//$("#tcauId").val(data.usr_no);
					$("#tcauName").val(data.usr_name);
					$("#tcauPass").val(data.usr_pwd);
					$("#tcauRole").val(data.usr_role).trigger("change");
					//$("#kcauRole").find('option:selected').val();
					$("#tcauRole").select2();
					testingComapnyUserEdit(data);
				}
				//$("#domain_id").prop('readonly','readonly');
			}
			if(op=="del"){
				/* title="删除数据"
				$("#domain_id").val(data.usr_id);
				$("#domain_name").val(data.usr_name);
				$("#domain_pass").val(data.usr_pwd);
				$("#domain_role").val(data.role_name);
				$("#domain_id").prop('readonly','readonly'); */
				deleteOperation(data.usr_id);
				return false;
			}
            
			//alert($('#dt_basic').DataTable().row(dom).data());
			//initSign_img();
		}
		//检测公司人员修改
		function testingComapnyUserEdit(data){
	var toAddFile=$("#tcau_sign_imgfile").parent();
			
			$("#tcau_sign_imgfile").remove();
		toAddFile.append("<input id='tcau_sign_imgfile' class='file' name='tcau_sign_imgfile' type='file'>"); 
		$("#tcau_sign_imgfile").change(function() {
		
               var $file = $(this);
               changeImgT($file);
               
});
			var company=$("#company").val();
			var reg=/#/g;
			
			company=company.replace(reg,'@');
			var name=$(dom.children()[1]).text();
			
			$("#preview_t").prop("src",encodeURI("../ImageDownLoadServer?path=user\\"+company+"\\"+encodeURI(name)+".jpg&a="+Math.random()));
			$("#tcau_sign_img").show();
			 $("#tcauRole").val(data.usr_role).trigger("change");
				$("#tcauRole").select2();
          $('#testingCompanyAddUser').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() {
				    	  var userName=$('#tcauName').val();
							var password=$('#tcauPass').val();
							var role=$('#tcauRole').val();
							//var id=$('#tcauId').val();
							var org_id=$("#company").val();
							
							
							
					         var flag=false;
					         var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
					         if (regular.test(userName)) {
					        	 errMessage("账号名不可包含特殊字符");
				                    return false;
				                }
					         
					         
					         
					         var reg="[A-Za-z0-9]\+";
					         if (regular.test(password)) {
					        	 errMessage("密码只能为数字和字母");
				                    return false;
				                }
					       
					        /*   $.ajax({
									type: 'POST',
									url: '../UserMgrServlet',
									dataType: 'json',
									data: {
										id:id,
										org_id:org_id,
										type: "identifyIdTestingEdit",
									},
									error : function(msg) {
										errMessage("请求identifyId失败");
								    },
									success : function(json) {  
										
										 if(json.success=="fail"&&json.error=="-1"){
											 errMessage("人员编号已存在，请重输");
											
										 }else{
											 if(userName=="" || password==""||id==""){
										        	errMessage("必填字段不可为空");
										        }else{
										        	 if(userName=="" || password==""||id==""){
												        	errMessage("必填字段不可为空");
												        }else{
												        	editOperationt(data.usr_id,data);
												        }
										        }
											 }
										 }
									
								}); */
					         
					        
					        	
							        	 if(userName=="" || password==""){
									        	errMessage("必填字段不可为空");
									        }else{
									        	
									        	editOperationt(data.usr_id,data);
									        }
							      
					        
						       
				      }
				    }
				    ,
				    {
					   	  html : "<i class='fa fa-times'></i>&nbsp; 取消",
						  "class" : "btn btn-default",
						  click: function() {
						     $( this ).dialog( "close" );
							}
						}
				  ]
				});
			$('#testingCompanyAddUser').dialog({
				title:"修改用户"
			});
			$('#testingCompanyAddUser').dialog( "open" )
		}
		function getOrg_usr_id(usr_id){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				data: {
					usr_id:usr_id,
					type: "getOrg_usr_id",
				},
				error : function(msg) {
					errMessage("请求getOrg_usr_id失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var id=json.obj[0].org_usr_id;
						//alert("绑定人员"+id);
						 $("#kcauPerson").val(id).trigger("change");
						 $("#kcauPerson").select2();
						// alert("现在的org_id:"+id);
					}else{
						errMessage("加载人员信息失败");
					}
					
				}
					
				});
		}
		//管养公司人员修改
		//@author xianing update
		function keepingComapnyUserEdit(data){
			//lulu
			//待改
			var toAddFile=$("#kcau_sign_imgfile").parent();
			$("#kcau_sign_imgfile").remove();
			toAddFile.append('<input id="kcau_sign_imgfile" class="file" name="kcau_sign_imgfile" type="file">');
			$("#kcau_sign_imgfile").change(function() {
				//alert("秀安");
	               var $file = $(this);
	               changeImgK($file);
	        });
			var company=$("#company").val();
			var reg=/#/g;

			company=company.replace(reg,'@');
			var name=$(dom.children()[1]).text();
			/* $("#preview_k").remove();
			$("#kcau_sign_img").append('<img id="preview_k" width="100" height="100">'); */
			$("#preview_k").prop("src",encodeURI("../ImageDownLoadServer?path=user\\"+company+"\\"+encodeURI(name)+".jpg&a="+Math.random()));
		
			
			$("#kcau_sign_img").show();
			$("#kpdiv").hide();
			$("#kzdiv").hide();
			$("#kjdiv").hide();
            $("#kperdiv").hide();
            $("#kcauRole").val(data.usr_role).trigger("change");
			$("#kcauRole").select2();
			initPartAndZoneKE(data.usr_id);
			//alert(data.usr_id);
			if(data.usr_role!="orgAdmin"){
				getOrg_usr_id(data.usr_id);
			
			}
	           $('#keepingCompanyAddUser').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() { 
					    	  var userName=$('#kcauName').val();
								var password=$('#kcauPass').val();
								var role=$('#kcauRole').val();
								//var id=$('#kcauId').val();
								var org_id=$("#company").val();
								var org_usr_id=$("#kcauPerson").val();
							
							
								
								var flag=false;
								 var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
						         if (regular.test(userName)) {
						        	 errMessage("账号名不可包含特殊字符");
					                    return false;
					                }
						         var reg="[A-Za-z0-9]\+";
						         if (regular.test(password)) {
						        	 errMessage("密码只能为数字和字母");
					                    return false;
					                }
								/*  if(data.usr_no!=id){
						          $.ajax({
										type: 'POST',
										url: '../UserMgrServlet',
										dataType: 'json',
										data: {
											id:id,
											org_id:org_id,
											type: "identifyId",
										},
										error : function(msg) {
											errMessage("请求identifyId失败");
									    },
										success : function(json) {  
											
											 if(json.success=="fail"&&json.error=="-1"){
												 errMessage("人员编号已存在，请重输");
												
											 }else{
												 //successMessage("插入成功");
												 //控制没有绑定人员时不执行
												 if($("#kcauRole").val()!="orgAdmin"&&$("#kcauPerson").val()==null){
													 errMessage("无绑定人员，请重选角色");
													 return false;
												 }
												   if(userName=="" || password==""||id==""){
											        	errMessage("必填字段不可为空");
											        }else{
											        	
											        	editOperationk(data.usr_id,data);
											        }
												 }
											 }
										
									});
								 }
								 else{ */
									/*  if($("#kcauRole").val()!="orgAdmin"&&$("#kcauPerson").val()==null){
										 errMessage("无绑定人员，请重选角色");
										 return false;
									 } */
									   if(userName=="" || password==""){
								        	errMessage("必填字段不可为空");
								        }else{
								        	editOperationk(data.usr_id,data);
								        }
								/*  } */
							     
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
	           $('#keepingCompanyAddUser').dialog({
					title:"修改数据"
				});
				$('#keepingCompanyAddUser').dialog( "open" );
				
		}
		//打开检测公司人员添加的dialog及操作
		function tcauDialogOperation(){
			
			 $("#tcau_sign_img").hide();
			$('#testingCompanyAddUser input').val("");
			 $("#tcauRole").find('option:selected').val("admin");
				$("#tcauRole").select2();
           $('#testingCompanyAddUser').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() {
				    	  var userName=$('#tcauName').val();
							var password=$('#tcauPass').val();
							var role=$('#tcauRole').val();
							//var id=$('#tcauId').val();
							var org_id=$("#company").val();
							
							var user_name = $("#add_usr_name").val();
					        var phone_no = $("#phone_no").val();
					        var qq_no = $("#qq_no").val();
					        var email_no = $("#email_no").val();
					        
					        var data = {};
					        data.user_name = user_name;
					        data.phone_no = phone_no;
					        data.qq_no = qq_no;
					        data.email_no = email_no;
							
							var flag=false;
					        var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
					         if (regular.test(userName)) {
					        	 errMessage("账号名不可包含特殊字符");
				                    return false;
				                }
					         
					         var fiveChins = /^[\u4E00-\u9FA5]+$/;
					         if(fiveChins.test(userName)){
					        	 if(userName.length>10){
					        		 errMessage("中文账号长度只能小于等于五个字");
					                    return false; 
					        	 }
					         }
					         
					         if(len(userName)>10){
					        	 errMessage("账号长度过长,请重新输入");
				                    return false; 
					         }
					         
					         var reg=/^[A-Za-z0-9]+$/;
					         if (regular.test(password)) {
					        	 errMessage("密码只能为数字和字母");
				                    return false;
				                }
					   /*        $.ajax({
									type: 'POST',
									url: '../UserMgrServlet',
									dataType: 'json',
									data: {
										id:id,
										org_id:org_id,
										type: "identifyIdTesting",
									},
									error : function(msg) {
										errMessage("请求identifyId失败");
								    },
									success : function(json) {  
										
										 if(json.success=="fail"&&json.error=="-1"){
											 errMessage("人员编号已存在，请重输");
											
										 }else{
											 */
										        	 if(userName=="" || password==""){
												        	errMessage("必填字段不可为空");
												        }else{
												        	addTestAccount(userName,password,role,org_id,data);
												        }
										       
									/* 		 }
										 }
									
								}); */
					        
						       
				      }
				    }
				    ,
				    {
					   	  html : "<i class='fa fa-times'></i>&nbsp; 取消",
						  "class" : "btn btn-default",
						  click: function() {
						     $( this ).dialog( "close" );
							}
						}
				  ]
				});
			$('#testingCompanyAddUser').dialog({
				title:"新增用户"
			});
			$('#testingCompanyAddUser').dialog( "open" )
		}
		function addTestAccount(userName,password,role,org_id,data){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				data: {
					type:"accountAdd",
					org_id:org_id,
					userName:userName,
					password:password,
					role:role,
				    user_name:data.user_name,
				    phone_no:data.phone_no,
				    qq_no:data.qq_no,
				    email_no:data.email_no,
					
					//id:id,
					
		        	file_name:$("#tcau_sign_imgfile").val()
				},
				error : function(msg) {
					errMessage("请求accountAdd失败");
			    },
				success : function(json) {  
					
					 if(json.success=="fail"&&json.error=="0"){
						 errMessage("账号重名，请重输");
					 }else if(json.success=="fail"&&json.error=="1"){
						 errMessage("账户添加失败");
						// $('#dt_basic').DataTable().row.add([id,userName,role]).draw(true); 
						// location.reload([true]);
					     
					 }else{
						 //successMessage("插入成功");
						 var file_name = $("#tcau_sign_imgfile").val();
						 if(file_name != "")
						 {
						 imgupload('tcau_sign_imgfile');
						 }
						 else{
						// location.reload([true]);这句话意义啥？   @author xianing ：这句话为了刷新页面，但是下面调用了dataTable重新加载了数据，因此不需要了。
						 }
						 $('#testingCompanyAddUser').dialog( "close" );
						 //hahah
						 $('#dt_basic').DataTable().row.add(json.obj).draw();
					 }
				}
			});
		}
		//打开管养公司人员添加的dialog及操作
		function kcauDialogOperation(){
			//初始化部门分区
			$('#keepingCompanyAddUser input').val("");
			$("#kcau_sign_img").hide();
			$("#kpdiv").hide();
			$("#kzdiv").hide();
			$("#kjdiv").hide();
            $("#kperdiv").hide();
            $("#kcauRole").val("orgAdmin").trigger("change");
           
			$("#kcauRole").select2();
			//initPartAndZone();
           $('#keepingCompanyAddUser').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() { 
				    	    var userName=$('#kcauName').val();
							var password=$('#kcauPass').val();
							var role=$('#kcauRole').val();
							//var id=$('#kcauId').val();
							var org_id=$("#company").val();
							var org_usr_id=$("#kcauPerson").val();
							
							//@author xianing 
							var unit_name=$("#unit_name").val();
							var unit_phone_no=$("#unit_phone_no").val();
							var unit_qq_no=$("#unit_qq_no").val();
							var unit_email_no=$("#unit_email_no").val();
							
							var data={};
							data.unit_name=unit_name,
							data.unit_phone_no=unit_phone_no,
							data.unit_qq_no=unit_qq_no,
							data.unit_email_no=unit_email_no;
							
							 var flag=false;
							 var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
					         if (regular.test(userName)) {
					        	 errMessage("账号名不可包含特殊字符");
				                    return false;
				                }
					         var reg="[A-Za-z0-9]\+";
					         if (regular.test(password)) {
					        	 errMessage("密码只能为数字和字母");
				                    return false;
				                }
					    /*       $.ajax({
									type: 'POST',
									url: '../UserMgrServlet',
									dataType: 'json',
									data: {
										id:id,
										org_id:org_id,
										type: "identifyId",
									},
									error : function(msg) {
										errMessage("请求identifyId失败");
								    },
									success : function(json) {  
										
										 if(json.success=="fail"&&json.error=="-1"){
											 errMessage("人员编号已存在，请重输");
											
										 }else{ */
											 //successMessage("插入成功");
											 //控制没有绑定人员时不执行
											/*  if($("#kcauRole").val()!="orgAdmin"&&$("#kcauPerson").val()==null){
												 errMessage("无绑定人员，请重选角色");
												 return false;
											 } */
											   if(userName=="" || password==""){
										        	errMessage("必填字段不可为空");
										        }else{
										        	addKeepAccount(userName,password,role,org_id,org_usr_id,data);
										        }
											 }
									/* 	 }
									
								}); */
					      
						     
				      
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
			$('#keepingCompanyAddUser').dialog({
				title:"新增数据"
			});
			$('#keepingCompanyAddUser').dialog( "open" )
		}
		function addKeepAccount(userName,password,role,org_id,org_usr_id,data){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				data: {
					type:"accountAdd",
					org_id:org_id,
					userName:userName,
					password:password,
					role:role,
					departmentId:$("#kcauZone").val(),
					unit_name:data.unit_name,
					unit_phone_no:data.unit_phone_no,
					unit_qq_no:data.unit_qq_no,
					unit_email_no:data.unit_email_no,
					//id:id,
					roleName:$("#kcauRole option:selected").text(),
					org_usr_id:org_usr_id,
		        	file_name:$("#kcau_sign_imgfile").val()
				},
				error : function(msg) {
					errMessage("请求accountAdd-k失败");
			    },
				success : function(json) {  
					
					 if(json.success=="fail"&&json.error=="0"){
						 errMessage("用户名重名，请重输");
					 }else if(json.success=="fail"&&json.error=="1"){
						 errMessage("账户添加失败");
						 /* $('#dt_basic').DataTable().row.add([info.domain_id,info.item_value,info.domain_memo]).draw(true);  */
						// location.reload([true]);
					     $('#keepingCompanyAddUser').dialog( "close" ); 
					 }else{
						successMessage("插入成功");
						  $('#keepingCompanyAddUser').dialog( "close" ); 
						 var file_name = $("#kcau_sign_imgfile").val();
						 if(file_name != "")
						 {
						 imgupload('kcau_sign_imgfile');
						 }
						 else{
						// location.reload([true]);这句话意义啥？
						 }
						 $('#dt_basic').DataTable().row.add(json.obj).draw();
					 }
				}
			});
		}
		//初始化部门分区
		function initPartAndZone(){
			var company=$("#company").val();
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				data: {
					company:company,
					type: "initPartAndZone",
				},
				error : function(msg) {
					errMessage("请求initPartAndZone失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						parAndZoneInfo = json.obj;
						//console.log(selectCompanydata);
					/*	var tech = $('#kcauPart');
						tech.empty();
						tech.append("<option value='' >不选择部门</option>");
						for(var i = 0; i<parAndZoneInfo.length; i++){
							tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
							break;
						}
						tech.select2();
						tech.trigger('change');
						var zone = $('#kcauZone');
						zone.empty();
						zone.append("<option value='' >不选择分区</option>");
						for(var i = 0; i<parAndZoneInfo.length; i++){
							zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
							
						}
						zone.select2();
						zone.trigger('change');
						$('#kcauRole').empty();
						$('#kcauRole').append("<option value='orgAdmin' >管养公司管理员</option>");
						$('#kcauRole').select2();
						$('#kcauRole').trigger('change');
						*/
					}else{
						errMessage("加载公司部门分区信息失败");
					}
					
				}
					
				});
		}
		//管养单位初始化部门分区    
		function initPartAndZoneKE(usr_id){
	        tocorrespondingRole();
	        
	                   // alert('原来的分区'+$('#kcauZone').val());
	                    //alert('选择人的usr_id:'+usr_id);
	        var role=$("#kcauRole").val();
			if(role=="orgAdmin"){
				return false;
				}
						getZoneIdByUsr_id(usr_id,$("#kcauRole").val());
						//嘿嘿
						
						
						var zone = $('#kcauZone');
						var job = $('#kcauJob');
						job.empty();
						if(role=="orgDuty"){
						for(var i = 0; i<parAndZoneInfo.length; i++){
							if(parAndZoneInfo[i].zone_id==zone.val()){
								job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
								break;
							}
							
						}
						job.select2();
						job.trigger('change');
						//alert('现在的分区'+zone.val());
						getPersons(zone.val(),job.val());
					}
						else if(role=="orgEngineer"){
							for(var i = 0; i<parAndZoneInfo.length; i++){
								if(parAndZoneInfo[i].zone_id==zone.val()){
									job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
									break;
								}
								
							}
							job.select2();
							job.trigger('change');
							//alert('现在的分区'+zone.val());
							getPersons(zone.val(),job.val());
						}
						else if(role=="orgCharge"){
							for(var i = 0; i<parAndZoneInfo.length; i++){
								job.append('<option value="'+parAndZoneInfo[i].chargeman_name+'">'+parAndZoneInfo[i].chargeman_name+'</option>');
								break;
							}
							job.select2();
							job.trigger('change');
							getPersons($("#kcauPart").val(),job.val());
						}
						
					
			
					
				
		}
		//部门下拉框改变时事件
		$('#kcauRole').select2();
		$('#kcauRole').on("select2:select", function (e) {
			//heihei
			tocorrespondingRole();
			
		});
		//初始化主管
		function initOrgCharge(){
			$("#kzdiv").hide();
			var tech = $('#kcauPart');
			tech.empty();
			
			for(var i = 0; i<parAndZoneInfo.length; i++){
				tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
				break;
			}
			tech.select2();
			tech.trigger('change');
			//$("#kpdiv").show();
			//
			var job = $('#kcauJob');
			job.empty();
			
			for(var i = 0; i<parAndZoneInfo.length; i++){
				job.append('<option value="'+parAndZoneInfo[i].chargeman_name+'">'+parAndZoneInfo[i].chargeman_name+'</option>');
				break;
			}
			job.select2();
			job.trigger('change');
			//$("#kjdiv").show();
			//人员初始化
			getPersons(tech.val(),job.val());
			
			$("#kperdiv").show();
		}
		//初始化负责人
		function initOrgDuty(){
			var tech = $('#kcauPart');
			tech.empty();
			
			for(var i = 0; i<parAndZoneInfo.length; i++){
				tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
				break;
			}
			tech.select2();
			tech.trigger('change');
			//$("#kpdiv").show();
			//
			var zone = $('#kcauZone');
			zone.empty();
			
			for(var i = 0; i<parAndZoneInfo.length; i++){
				zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
				
			}
			zone.select2();
			zone.trigger('change');
			$("#kzdiv").show();
			//职位名字
			var job = $('#kcauJob');
			job.empty();
			
			for(var i = 0; i<parAndZoneInfo.length; i++){
				if(parAndZoneInfo[i].zone_id==zone.val()){
					job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
					break;
				}
				
			}
			job.select2();
			job.trigger('change');
			//$("#kjdiv").show();
			getPersons(zone.val(),job.val());
			$("#kperdiv").show();
		}
		//初始化工程师
		function initOrgEngineer(){
			var tech = $('#kcauPart');
			tech.empty();
			
			for(var i = 0; i<parAndZoneInfo.length; i++){
				tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
				break;
			}
			tech.select2();
			tech.trigger('change');
			//$("#kpdiv").show();
			//
			var zone = $('#kcauZone');
			zone.empty();
			
			for(var i = 0; i<parAndZoneInfo.length; i++){
				zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
				
			}
			zone.select2();
			zone.trigger('change');
			$("#kzdiv").show();
			//职位名字
			var job = $('#kcauJob');
			job.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				if(parAndZoneInfo[i].zone_id==zone.val()){
					job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
					break;
				}
			}
			job.select2();
			job.trigger('change');
			//$("#kjdiv").show();
			getPersons(zone.val(),job.val());
			$("#kperdiv").show();
		}
		//根据角色变化显示部门等信息
		function  tocorrespondingRole(){
			var role=$("#kcauRole").val();
			console.log(role);
			if(role=="orgAdmin"){
				
				$("#kpdiv").hide();
				$("#kzdiv").hide();
				$("#kjdiv").hide();
	            $("#kperdiv").hide();
				
			}
			if(role=="orgCharge"){
				initOrgCharge();
			}
			if(role=="orgDuty"){
				initOrgDuty();
			}
			if(role=="orgEngineer"){
				initOrgEngineer();
			}	
		}
		//根据编辑人员角色变化显示部门等信息
		function  tocorrespondingEditRole(usr_id){
			var role=$("#kcauRole").val();
			console.log(role);
			if(role=="orgAdmin"){
				
				$("#kpdiv").hide();
				$("#kzdiv").hide();
				$("#kjdiv").hide();
	            $("#kperdiv").hide();
				
			}
			if(role=="orgCharge"){
				initOrgCharge();
			}
			if(role=="orgDuty"){
				initOrgDuty();
				getZoneIdByUsr_id(usr_id,role);
				var job = $('#kcauJob');
				job.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==$('#kcauPart').val()){
						job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
						break;
					}
					
				}
				job.select2();
				job.trigger('change');
				//$("#kjdiv").show();
				getPersons($('#kcauPart').val(),job.val());
			}
			if(role=="orgEngineer"){
				initOrgEngineer();
				getZoneIdByUsr_id(usr_id,role);
				var job = $('#kcauJob');
				job.empty();
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==$('#kcauPart').val()){
						job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
						break;
					}
				}
				job.select2();
				job.trigger('change');
				//$("#kjdiv").show();
				getPersons($('#kcauPart').val(),job.val());
				
			}	
		}
		//获取人员分区根据人员id
		function getZoneIdByUsr_id(id,role){
			//alert("enter");
			//alert("人员id:"+id);
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				data: {
					id:id,
					type: "getZoneIdByUsr_id",
				},
				error : function(msg) {
					errMessage("请求account_getPersons失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						if(role=="orgCharge"){
							//alert("重新改变分区id:"+json.obj[0].department_id);
							
						}
						else{
							//alert("人员id:"+id+"分区id:"+json.obj[0].department_id);
							$('#kcauZone').val(json.obj[0].department_id).trigger("change");
							 $('#kcauZone').select2();
						}
						
					}else{
						errMessage("加载人员信息失败");
					}
					
				}
					
				});
		}
		//人员初始化
		function getPersons(id,job){
			//alert(id+"haha"+job);
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				data: {
					id:id,
					job:job,
					type: "account_getPersons",
				},
				error : function(msg) {
					errMessage("请求account_getPersons失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var pesonInfo=json.obj;
						var person = $('#kcauPerson');
						person.empty();
						//alert(pesonInfo.length);
						for(var i = 0; i<pesonInfo.length; i++){
							person.append('<option value="'+pesonInfo[i].org_usr_id+'">'+pesonInfo[i].org_usr_name+'</option>');
							//break;
						}
						person.select2();
						person.trigger('change');
						//alert("原来的org_id:"+person.val());
					}else{
						errMessage("加载人员信息失败");
					}
					
				}
					
				});
		}
		/*$('#kcauPart').on("select2:select", function (e) {
			var part=$('#kcauPart').val();
			if(part==''){
				$('#kcauZone').empty();
				$('#kcauZone').append("<option value='' >不选择分区</option>");
				$('#kcauZone').select2();
				$('#kcauZone').trigger('change');
				//
				$('#kcauRole').empty();
				$('#kcauRole').append("<option value='orgAdmin' >管养公司管理员</option>");
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
			}
			else{
				//
				$('#kcauRole').empty();
				for(var i = 0; i<parAndZoneInfo.length; i++){
					$('#kcauRole').append('<option value="orgCharge">'+parAndZoneInfo[i].chargeman_name+'</option>');
					break;
				}
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
			}
			
		});
		//分区下拉列表改变事件
		$('#kcauZone').on("select2:select", function (e) {
			var zone=$('#kcauZone').val();
			if(zone==''){
				if($('#kcauPart').val()==''){
				$('#kcauRole').empty();
				$('#kcauRole').append("<option value='orgAdmin' >管养公司管理员</option>");
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
				}
				else{
					$('#kcauRole').empty();
					for(var i = 0; i<parAndZoneInfo.length; i++){
						$('#kcauRole').append('<option value="orgCharge">'+parAndZoneInfo[i].chargeman_name+'</option>');
						break;
					}
					$('#kcauRole').select2();
					$('#kcauRole').trigger('change');
				}
			}
			else{
				//
				$('#kcauRole').empty();
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(zone==parAndZoneInfo[i].zone_id){
						$('#kcauRole').append('<option value="orgDuty">'+parAndZoneInfo[i].dutyman_name+'</option>');
						$('#kcauRole').append('<option value="orgEngineer">'+parAndZoneInfo[i].engineer_name+'</option>');
						break;
					}
					
				}
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
			}
			
		});*/
		$('#kcauZone').on("select2:select", function (e) {
			var role=$("#kcauRole").val();
			var zone = $('#kcauZone');
			var job = $('#kcauJob');
			job.empty();
			if(role=="orgDuty"){
			for(var i = 0; i<parAndZoneInfo.length; i++){
				if(parAndZoneInfo[i].zone_id==zone.val()){
					job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
					break;
				}
				
			}
		}
			else{
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==zone.val()){
						job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
						break;
					}
					
				}
			}
			job.select2();
			job.trigger('change');
			getPersons(zone.val(),job.val());
			});
		//公司下拉列表改变事件
		$('#company').on("select2:select", function (e) {
			var company=$('#company').val();
			if(company==testingCompanyId){
				initTesTingCompanyTableData();
				initPartAndZone();
				//initTesTingCompanyTable(editAddDel,editAddDel2);
			}
			else{
				initKeepingCompanyTableData(company);
				//initKeepingCompanyTable(editAddDel,editAddDel2);
				initPartAndZone();
			}
			
		});
		function errMessage(info){
			$.smallBox({
                title: "处理信息",
                content: "<i class='fa fa-clock-o'></i> <i>"+info+"</i>",
                color: "#C46A69",
                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                timeout: 4000
            });
		}
		
		function successMessage(info){
			$.smallBox({
                title: "处理信息",
                content: "<i class='fa fa-clock-o'></i> <i>"+info+"</i>",
                color: "#659265",
                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                timeout: 4000
            });
		}
		
		function editOperationk(usr_id,data){
			var oldNum=$(dom.children()[0]).text();
			var company=$("#company").val();
			
			//@author xianing 
			var unit_name=$("#unit_name").val();
			var unit_phone_no=$("#unit_phone_no").val();
			var unit_qq_no=$("#unit_qq_no").val();
			var unit_email_no=$("#unit_email_no").val();
		       
		        	$.ajax({
						type: 'POST',
						url: '../UserMgrServlet',
						dataType: 'json',
						data: {
							type:"edit",
							domain_id:usr_id,
				        	domain_role:$('#kcauRole').val(),
				        	domain_pass:$('#kcauPass').val(),
				        	domain_name:$('#kcauName').val(),
				        	//usr_no:$("#kcauId").val(),
				        	
				        	//@author xianing 
							unit_name:$("#unit_name").val(),
							unit_phone_no:$("#unit_phone_no").val(),
							unit_qq_no:$("#unit_qq_no").val(),
							unit_email_no:$("#unit_email_no").val(),
							departmentId:$("#kcauZone").val(),
				        	company:company,
						},
						error : function(msg) {
							errMessage("请求edit失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("修改失败");
							 }else{
								successMessage("修改成功");
								  var file_name = $("#kcau_sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload('kcau_sign_imgfile');
												 }
												 else{
												// location.reload([true]);
												 }
												 table.row(dom).data(json.obj);
												 $(dom.children()[0]).text(oldNum);
								// $('#opera').dialog( "close" );
								$("#keepingCompanyAddUser").dialog( "close" );
							 }
						}
					});
		       
		}
		function editOperationt(usr_id,data){
			var oldNum=$(dom.children()[0]).text();
			var company=$("#company").val();
		       
		        	$.ajax({
						type: 'POST',
						url: '../UserMgrServlet',
						dataType: 'json',
						data: {
							type:"edit",
							domain_id:usr_id,
				        	domain_role:$('#tcauRole').val(),
				        	domain_pass:$('#tcauPass').val(),
				        	domain_name:$('#tcauName').val(),
				        	
				        	//domain_
				        	//usr_no:$("#tcauId").val(),
				        	company:company,
						},
						error : function(msg) {
							errMessage("请求edit失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("修改失败");
							 }else{
								 successMessage("修改成功");
								  var file_name = $("#tcau_sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload('tcau_sign_imgfile');
												 }
												 else{
												// location.reload([true]);
												 }
								 
												 table.row(dom).data(json.obj[0]);
												 $(dom.children()[0]).text(oldNum);
								// $('#opera').dialog( "close" );
								$("#testingCompanyAddUser").dialog( "close" );
							 }
							 
						}
					});
		       
		}
		function deleteOperation(usr_id){
			$.SmartMessageBox({
		        title: "删除提示",
		        content: "确认删除该条记录吗",
		        buttons: '[No][Yes]'
		    }, function (ButtonPressed) {
		        if (ButtonPressed === "Yes") {
		        	$.ajax({
						type: 'POST',
						url: '../UserMgrServlet',
						dataType: 'json',
						data: {
							type:"delete",
							domain_id:usr_id,
						},
						error : function(msg) {
							errMessage("请求delete失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("删除失败");
							 }else{
								 //successMessage("删除成功");
								
								 $('#dt_basic').DataTable().row(dom).remove().draw();
								 $('#opera').dialog( "close" );
							 }
						}
					});
		        }

		    });
		}
		
		function clearData(){
		$('#domain_id').val("");
		$('#domain_name').val("");
		$('#domain_pass').val("");
		$('#domain_role').val("");
		var sign_img = $("#sign_img");
		var name = $('#domain_name').val();
			if(sign_img.html()==""){
			sign_img.append("<div><img id='sign' src='"+encodeURI("../ImageDownLoadServer?path=user\\no.jpg")+"'  width='100px' height='100px'></div>");
			}
			else{
			$("#sign").prop("src",encodeURI("../ImageDownLoadServer?path=user\\no.jpg&a="+Math.random()));
			}
		}
		
		function newOperation(){
			clearData();
			var item_id = $(treeSecondSelect).prop('id');
			domain_id:$('#domain_id').val();
        	domain_name:$('#domain_name').val();
        	domain_pass:$('#domain_pass').val();
        	domain_role:$('#domain_role').val();
			$("#domain_id").prop('readonly',false);

			$('#opera').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() { 
				    	  var info={
				    			domain_id:$('#domain_id').val(),
					        	domain_name:$('#domain_name').val(),
					        	domain_pass:$('#domain_pass').val(),
					        	domain_role:$('#domain_role').val()
						        }
						        if(info.domain_id=="" || info.domain_name==""){
						        	errMessage("不可为空");
						        }else{
						        	$.ajax({
										type: 'POST',
										url: '../UserMgrServlet',
										dataType: 'json',
										data: {
											type:"new",
											domain_id:$('#domain_id').val(),
								        	domain_name:$('#domain_name').val(),
								        	domain_pass:$('#domain_pass').val(),
								        	domain_role:$('#domain_role').val(),
								        	file_name:$("#tcau_sign_imgfile").val()
										},
										error : function(msg) {
											errMessage("请求new失败");
									    },
										success : function(json) {  
											
											 if(json.success=="fail"&&json.error=="0"){
												 errMessage("用户名重名，请重输");
											 }else if(json.success=="fail"&&json.error=="1"){
												 errMessage("添加用户失败");
											 }else{
												 //successMessage("插入成功");
												 var file_name = $("#tcau_sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload('tcau_sign_imgfile');
												 }
												 else{
												 location.reload([true]);
												 }
											 }
										}
									});
						        }
				      }
				    },
				    {
				   	  html : "<i class='fa fa-trash-o'></i>&nbsp; 重置",
					  "class" : "btn btn-default",
					  click: function() {
						  $("#domain_id").val("");
							$("#domain_name").val("");
							$("#domain_pass").val("");
							$("#domain_role").val("");
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
			$('#opera').dialog({
				title:"新增数据"
			});
			$('#opera').dialog( "open" );
		}
		function imgupload(str){
			 $.ajaxFileUpload({
					url:'../UserMgrServlet?type=img',
					secureuri : false,
					fileElementId : str,
					dataType:'text',
					success : function(data,status) {
					//successMessage("保存成功");	
					//location.reload([true]);
						}
											 });
		}
		//加载所有公司
		function initAllCompanies(){
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				data: {
					
					type: "selectCompany",
				},
				error : function(msg) {
					errMessage("加载公司信息失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var selectCompanydata = json.obj;
						//console.log(selectCompanydata);
						var d = $('#company');
						d.empty();
						d.append("<option value="+testingCompanyId+" >检测公司</option>");
						for(var i = 0; i<selectCompanydata.length; i++){
							d.append('<option value="'+selectCompanydata[i].org_id+'">'+selectCompanydata[i].org_name+'</option>');
						}
						d.select2();
						d.trigger('change');
						
					}else{
						errMessage("加载公司信息失败");
					}
					
				}
					
				});
		}
		//加载对应的公司
		function inintSpecifiedCompany(identity){
			var username = "<%=session.getAttribute("username") %>";
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				data: {
					username:username,
					identity:identity,
					type: "selectSpecifiedCompany",
				},
				error : function(msg) {
					errMessage("加载公司信息失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var selectCompanydata = json.obj;
						//console.log(selectCompanydata);
						var d = $('#company');
						d.empty();
						for(var i = 0; i<selectCompanydata.length; i++){
							d.append('<option value="'+selectCompanydata[i].org_id+'">'+selectCompanydata[i].org_name+'</option>');
							break;
						}
						d.select2();
						d.trigger('change');
						
					}else{
						errMessage("加载公司信息失败");
					}
					
				}
					
				});
		}
		//针对下拉框选值弹出不同增加人员的弹出框
		function addUserByCompany(){
			var companyId=$('#company option:selected').val();
			if(companyId==testingCompanyId){
				tcauDialogOperation();
			}
			else{
				kcauDialogOperation();	
			}
		}
		
		function buildRole(){
			/* if(superAdmin){
				$('#domain_role').append("<option value='admin'>系统管理员</option><option value='guest'>普通用户 </option>");
			}else{
				$('#domain_role').append("<option value='guest'>普通用户 </option>");
			} */
			$('#tcauRole').append("<option value='admin'>系统管理员</option><option value='guest'>普通用户 </option>");
		}
		
		
		var superAdmin = false;
		function releaseAdmin(){//管理员
			buildRole();
			var identity="admin";
			inintSpecifiedCompany(identity);
			initTesTingCompanyTable(editAddDel,editAddDel2);
			initTesTingCompanyTableData(); 
			initPartAndZone();
			$("#company").attr("disabled","disabled");
		}
		function releaseManage(){//项目负责人
			
		}
		function releaseMember(){//项目参与人
			
		}
		function releaseGuest( e ){
			if(e=='superAdmin'){
				superAdmin = true;
				initAllCompanies();
				initTesTingCompanyTable(editAddDel,editAddDel2);
				initTesTingCompanyTableData();
				initPartAndZone();
			}else{
				location.href="index.jsp";
			}
			buildRole();
		}
		function  releaseOrgAdmin(){
			buildRole();
			var identity="orgAdmin";
			inintSpecifiedCompany(identity);
			initTesTingCompanyTable(editAddDel,editAddDel2);
			initKeepingCompanyTableData($("#company").val());
			initPartAndZone();
			$("#company").attr("disabled","disabled");
		}
		
		/*
		 *@author xianing 
		 *输入字符串返回字符串的长度
		 */
		function len(s) {
			 var l = 0;
			 var a = s.split("");
			 for (var i=0;i<a.length;i++) {
			  if (a[i].charCodeAt(0)<299) {
			   l++;
			  } else {
			   l+=2;
			  }
			 }
			 return l;
			}
		
		</script>
		
		
	</body>
</html>