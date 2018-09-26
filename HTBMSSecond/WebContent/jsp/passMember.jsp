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
		
		<link rel="stylesheet" href="../jstree/themes/default/style.min.css" />
		<style>
		.treess:hover{
		background-color:#ccc;
		cursor: pointer;
		}
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
					<li>检查评定</li><li>结构</li><li>通道构件</li>
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
			            <!-- NEW WIDGET START -->
						<article class="col-sm-3 col-md-3 col-lg-3">
				
							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
									<h2>跨信息</h2>
				
								</header>
				
								<!-- widget div-->
								<div>
				
									<!-- widget edit box -->
									<div class="jarviswidget-editbox">
										<!-- This area used as dropdown edit box -->
				
									</div>
									<!-- end widget edit box -->
				
									<!-- widget content -->
										<!-- widget content -->
							       <div class="widget-body no-padding">
							       <div class="widget-body-toolbar bg-color-white text-align-right">
											<a onclick="addSpan()" class="btn btn-primary btn-xs disabled">
												 增加
											</a>
											&nbsp;
											<a  onclick="editSpan()" class="btn btn-primary btn-xs disabled">
												 修改
											</a>														
											&nbsp;
											<a onclick="delSpan()" class="btn btn-primary btn-xs disabled">
												 删除
											</a>
										</div>

										<div class="custom-scroll table-responsive" style="height:450px; overflow-y: scroll;">
										<div class="tree smart-form" >
											<ul id="tree-ul" class="tree">
											
											</ul>
										</div>
									</div>
									</div>
									<!-- end widget content -->
				
								</div>
								<!-- end widget div -->
				
							</div>
							<!-- end widget -->
						
						</article>
						<!-- WIDGET END -->
			            
			            <!-- SINGLE GRID -->
			            <article class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
			
			                <!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"	
									data-widget-editbutton="false"
									data-widget-togglebutton="false"
									data-widget-deletebutton="false"
									data-widget-fullscreenbutton="false"
									data-widget-custombutton="false">
								
								<header>
									<span class="widget-icon"> <i class="fa fa-table"></i> </span>
									<h2>通道构件 </h2>
				
								</header>
				
								<!-- widget div-->
								<div>
				
									<!-- widget edit box -->
									<div class="jarviswidget-editbox">
										<!-- This area used as dropdown edit box -->
				
									</div>
									<!-- end widget edit box -->
				
				
				
										<!-- widget content -->
									<div class="widget-body no-padding" >
										<div class="widget-body-toolbar bg-color-white">
												<div class="pull-left col-xs-3"><input class="form-control" id="searchData" value="" placeholder="搜索" type="text"></div>
											<form class="form-inline"   >
												<div class="row" style="float:right;margin-right:2%">
														<a  onclick="copyMember()" class="btn btn-primary btn-sm disabled" >
															<i class="fa fa-copy "></i> 复制
														</a>
														<a  onclick="addMember()" class="btn btn-primary btn-sm disabled" >
															<i class="fa fa-plus"></i> 增加
														</a>							
															</div>
				
											</form>
				
										</div>
										<table id="datatable_fixed_column" class="table table-striped table-bordered table-hover" style="width:100%">
											<thead>		
												<tr>
											<!-- 		<th data-hide="phone">#</th> -->
													<th>分部结构</th>
													<th>部件类型</th>
													<th>构件类型</th>
													<th data-hide="phone,tablet">构件名称</th>
													<th>构件型号</th>
													<th style="width:60px">操作</th>
												</tr>
											</thead>
											<tbody id="cttt" >
												
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
		<!-- div start -->
		<div id="add_span" hidden="hidden">
				<form>
					<fieldset>
						<div class="form-group">
							<label>方向</label>
							<select	class="form-control" id="pass_direction">
							<option value='无'>无</option>
							<option value='上行'>上行</option>
							<option value='下行'>下行</option>
					</select>
					</select>
					</select>
						</div>
						<div class="form-group">
							<label>跨号</label>
							<input class="form-control" id="pass_span" value="" placeholder="跨号" type="text">
						</div>
						<div class="form-group">
							<label>通道类型</label>
							<select	class="form-control select2" id="pass_type" style="width:100%">
					</select>
						</div>
					</fieldset>
				</form>
			</div>
		<!-- div end -->
		<div id="opera">
				<form>
					<fieldset>
						<div class="form-group">
							<label>构件类型</label>
							<select	class="form-control select2" id="member_type" style="width: 100%">
							</select>
						</div>
						<div class="form-group">
							<label>构件名称</label>
							<input class="form-control" id="member_no" value="" placeholder="构件名称" type="text">
						</div>
						<!-- 
						<div class="form-group">
							<label>构件描述</label>
							<input class="form-control" id="member_desc" value="" placeholder="构件描述" type="text">
						</div>
						 -->
						<!-- <div class="form-group">
							<label>构件型号</label>
							<input class="form-control" id="ggjxh" value="" placeholder="构件型号" type="text">
						</div> -->
					
					</fieldset>
				</form>
			</div>
			<!-- 遮罩 -->
			<div id="cover" class="cover">		
			<div id="loading" class="loading">处理中
			</div> 	
			</div>
			
			<!-- coyp -->
			<div id="copyMem" hidden="hidden">
				<form>
					<label>复制来源</label>
					<select class="imput-sm form-control" style="width: 100%" id="allBridge">
						
					</select>
				</form>
				<br>
				<br>
				<div class="text-align-center">
					<button class="btn btn-default" onclick="copyAllMem()">复制全通道构件</button>&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- 	<button class="btn btn-default" onclick="copyThisMem()">复制当前选中跨</button> -->
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
		
		<script src="../jstree/jstree.min.js"></script>
		
		<script type="text/javascript">
		var hhhhh;var hhhhs;var hhhbs;
		
		/**********************************/
		
		var $li1=undefined;/*上行标签*/
		var $li2=undefined;/*下行标签*/
		var $lli=undefined;/*选定的跨号节点*/
		var $tree=$("#tree-ul");/*树形图父节点*/
		var $ll=undefined;/*被选定的方向节点*/
		var arr_type=undefined;
		var table=undefined;/**右边表格的节点*/
		var isEdit=0;
		var store=undefined;
		
		var session = <%=JSON.toJSONString(oc)%>
		
		/**********************************/
			$(document).ready(function() {
				// DO NOT REMOVE : GLOBAL FUNCTIONS!
				pageSetUp();
					/*树的根节点*/
							initTable();
							loadpass_type();
							initTree();
							querySpan();
							initMember_type();
							getAllCul();
					$.ajax({
					type : 'POST',
					url : '../PasMbrServlet',
					dataType : 'json',
					data : {
						choice:"isCheckAudited",
					},
					error : function(msg) {
						errMessage("查询构件类型失败！");
					},
					success : function(json) {
						if(json.error==0){
						var audit_state = json.success;
						if(audit_state=="2"){
						 	$('.widget-body-toolbar a').addClass('disabled');
						 	control = "disabled";
						}
					}
					}
				});
				
				
				$('#searchData').on('change', function(){
				var d = $(this).val();
				table.search(d).draw(true);
				});
			});
			
			/**加载通道类型*/
			function loadpass_type(){
				var pass_type = $("#pass_type");
				$.ajax({
					type : 'POST',
					url : '../PasMbrServlet',
					dataType : 'json',
					data : {
						choice:"loadpass_type"
					},
					error : function(msg) {
						errMessage("系统错误！");
					},
					success : function(json) {
						if(json.success=="success"){
							var arr = json.obj;
							arr_type=arr;
							for ( var i = 0; i < arr.length; i++) {
								$option = $("<option></option>");
								$option.prop("value", arr[i].pass_type_id);
								$option.prop("text", arr[i].pass_type_name);
								pass_type.append($option);
							}
							pass_type.select2();
						}else {
							errMessage("通道类型没有数据");
						}
						
					}
				});
			}
			/**加载构件类型*/
			function initMember_type(){
				$.ajax({
					type : 'POST',
					url : '../BrgMemberServlet',
					dataType : 'json',
					data : {
						choice:"member_type",
					},
					error : function(msg) {
						errMessage("查询构件类型失败！");
					},
					success : function(json) {
						var arr = json.obj;
						if(arr.length>0)
						{
							isEdit=0;
							for(var i =0;i<arr.length;i++)
							{
							$option=$("<option></option>");
							$option.prop("value",arr[i].member_name);
							$option.prop("text",arr[i].member_name);
							$("#member_type").append($option);
						//	$type.append("<option value='"+arr[i].member_id+"'>"+arr[i].member_name+"</option>");
							}
							$("#member_type").select2();
						}else{
						
						}
						
					}
				});
			}
			
			/**********************************************通道类型键值转换*********************************************************/
			function type_id2name(str){
				var name;
				for ( var i = 0; i < arr_type.length; i++) {
					if(str==arr_type[i].pass_type_id)
					{
						name=arr_type[i].pass_type_name;
					}
				}
				return name;
			}
			
			function type_name2id(str){
				var name;
				for ( var i = 0; i < arr_type.length; i++) {
					if(str==arr_type[i].pass_type_name)
					{
						name=arr_type[i].pass_type_id;
					}
				}
				return name;
			}
			
			
			
			
			
			
			/**********************************************新建跨号*********************************************************/
			
			
			
			function addSpan(){
				//clearKH();
				$('#add_span').dialog({
					title:"新增跨号"
				});
				$("#pass_span").val("");
				//$("#pass_type").val("").trigger("change");
				//$("#pass_direction").val("").trigger("change");
				$('#add_span').dialog( "open" );
				$('#add_span').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      	click: function() {
					      	 if ($("#span_no").val()=="") {
							errMessage("请输入跨号!");
							return false;
							}
					    	 // var s_id=Math.uuid();
					    	  //console.log(s_id);
								$.ajax({
									type : 'POST',
									url : '../PasMbrServlet',
								//	async:false,
									dataType : 'json',
									data : {
										choice:"add_pass_span",
										//s_id:s_id,
										pass_direction:$("#pass_direction").val(),
										pass_span:$("#pass_span").val(),
										pass_type:$("#pass_type").val()
									},
									error : function(msg) {
										errMessage("添加跨号失败！");
									},
									success : function(json) {
										if (json.success == "success") {
											//successMessage("添加成功！");
											var span = json.obj;
											var name = type_id2name(span.pass_type_id);
											var $li=$("<li></li>");
											$li.attr("data-id",span.s_id);
											$li.attr("data-type",span.pass_type_id);
											$li.attr("data-direction",span.direction);
											$li.attr("data-name",span.span_no);
											$li.append("<span class='kh col-lg-2 col-md-2 col-xs-2' onclick='choiceSpan(this)'>"+span.span_no+"</span>&nbsp;--&nbsp;"+"<i style='font-style:normal;color:#214e75'>"+name+"</i>");
											if(span.direction=="上行"){
												if(addLi("上行")==false)
												{
													$ul.prepend($li1);
													$li1.append("<ul hidden='hidden'></ul>");
													ReAnimotion($li1);
												}
												$li1.children("ul").append($li);
											}else if(span.direction=="下行"){
												if(addLi("下行")==false)
												{
													$ul.append($li2);
													$li2.append("<ul hidden='hidden'></ul>");
													ReAnimotion($li2);
												}
												$li2.children("ul").append($li);
											}else if(span.direction=="无"){
												if(addLi("无")==false)
												{
													$ul.append($li3);
													$li3.append("<ul hidden='hidden'></ul>");
													ReAnimotion($li3);
												}
												$li3.children("ul").append($li);
											}
											$('#add_span').dialog( "close" );
										} else {
											if(json.error=="1"){
											errMessage("添加失败！");
											}else{
											errMessage("跨号重复！");
											}
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
			}
			function addLi(str){
				var flag = false;
				var data = $tree.children();
				for(var i=0;i<data.length;i++){
					if(data[i].id==str){
						flag = true;					
					}
				}
				return flag;
			}
			/***********************************************查询跨号**************************************************************/
			
			function querySpan(){
				$.ajax({
					type : 'POST',
					url : '../PasMbrServlet',
					dataType : 'json',
					data : {
						choice : "querySpan"
					},
					error : function(msg) {
						errMessage("查询跨号失败！");
					},
					success : function(json) {
					console.log(json);
						if (json.success == "success") {
							var len=json.obj.length;
							for(var i=0;i<len;i++){
								var span = json.obj[i];
								var $li=$("<li></li>")
									$li.attr("data-id",json.obj[i].s_id);
									$li.attr("data-type",json.obj[i].pass_type_name);
									$li.attr("data-direction",json.obj[i].direction);
									$li.attr("data-name",json.obj[i].span_no);
									$li.append("<span class='kh col-lg-2 col-md-2 col-xs-2' onclick='choiceSpan(this)'>"+json.obj[i].span_no+"</span>&nbsp;--&nbsp;"+"<i style='font-style:normal;color:#214e75'>"+json.obj[i].pass_type_name+"</i>");
									if(span.direction=="上行"){
										$li1.children("ul").append($li);
									}else if(span.direction=="下行") {
										$li2.children("ul").append($li);
									}else{
										$li3.children("ul").append($li);
									}
								//	$li1.children("ul").append($li);
							}
						}else if (json.success=="empty") {
							errMessage("请选择一个通道！");
						} 
						else {
							errMessage("通道跨信息没有数据！");
						}
					}
				});
			}
			/**************************************************给跨号表格赋值****************************************************************************/
			
			function evalSpan(){
				$("#pass_direction").val($lli.attr("data-direction"));
				$("#pass_span").val($lli.attr("data-name"));
				$("#pass_type").val(type_name2id($lli.attr("data-type"))).trigger("change");
				
			}
			
			/****************************************************修改跨号*************************************************/
			
			function editSpan(){
				if($lli==undefined){
					errMessage("请选择跨号！");
					return false;
				}
				evalSpan();
				$('#add_span').dialog({
					title:"修改跨号"
				});
				$('#add_span').dialog( "open" );
				$('#add_span').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					       if ($("#span_no").val()=="") {
							errMessage("请输入跨号!");
							return false;
							}
					    	  var s_id=$lli.attr("data-id");
								$.ajax({
									type : 'POST',
									url : '../PasMbrServlet',
									dataType : 'json',
									data : {
										choice:"editspan",
										s_id:s_id,
										span_no:$("#pass_span").val(),
										pass_type_id:$("#pass_type").val(),
										direction:$("#pass_direction").val()																					
									},
									error : function(msg) {
										errMessage("修改跨号失败！");
									},
									success : function(json) {
										if (json.success == "success") {
										var span = json.obj;
											console.log(span);
											var name = type_id2name(span.pass_type_id);
											$lli.remove();
											 $lli.attr("data-direction",span.direction);
											 $lli.attr("data-type",span.pass_type_id);
											 $lli.attr("data-name",span.span_no);
											 $lli.html("");
											 $lli.append("<span class='kh col-lg-2 col-md-2 col-xs-2' onclick='choiceSpan(this)'>"+span.span_no+"</span>&nbsp;--&nbsp;"+"<i style='font-style:normal;color:#214e75'>"+name+"</i>");
											 if(span.direction=="上行"){
												$li1.children("ul").append($lli);
											}else if(span.direction=="下行") {
												$li2.children("ul").append($lli);
											}else{
												$li3.children("ul").append($lli);
											}
											// $li1.children("ul").append($lli);
											 $lli.children("span").css("background","#ccc");
											 //successMessage("修改成功！");
											 $('#add_span').dialog( "close" );
										} else {
											if(json.error=="1"){
											errMessage("修改跨号失败！");
											}else{
											errMessage("跨号重复！");
											}
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
			}
				/*****************************************************删除跨号**************************************************************/
			
			function delSpan(){
				if($lli==undefined){
					errMessage("请选择跨号！");
					return false;
				}
				$.SmartMessageBox({
					title : "跨号删除",
					content : "您是否确认删除此记录？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						$("#cover").show();
						$.ajax({
							type : 'POST',
							url : '../PasMbrServlet',
							dataType : 'json',
							data : {
								s_id : $lli.attr("data-id"),
								choice : "deleteSpan"
							},
							error : function(msg) {
								errMessage("系统错误！");
							},
							success : function(json) {
							$("#cover").hide();
								if (json.success == "success") {
									//successMessage("删除成功！");
									if($lli.parent().children().length<2){
										$lli.parent().parent().remove();
										$lli.parent().remove();
										$lli.remove();
									}else{
										$lli.remove();
									}
									$('#datatable_fixed_column').dataTable().fnClearTable();
								} else {
									errMessage("删除失败！");
								}
							}
						});
					}
					if (ButtonPressed === "取消") {
					}

				});
			}
			
			
			/***********************************************初始化左边树*******************************************************/
				var $ul=$("#tree-ul");
				$li1=$("<li></li>")
				$li1.prop("value","上行");
				$li1.prop("id","上行");
				$li1.prop("class","parent_li");
				$li1.append("<span title='展开'><i class='fa fa-lg fa-plus-circle'></i>上行</span>");
				$li2=$("<li></li>")
				$li2.prop("value","下行");
				$li2.prop("id","下行");
				$li2.prop("class","parent_li");
				$li2.append("<span title='展开'><i class='fa fa-lg fa-plus-circle'></i>下行</span>");
				$li3=$("<li></li>")
				$li3.prop("value","无");
				$li3.prop("id","无");
				$li3.prop("class","parent_li");
				$li3.append("<span title='展开'><i class='fa fa-lg fa-plus-circle'></i>无方向</span>");
			
					
			
			function initTree(){
				$.ajax({
					type : 'POST',
					url : '../PasMbrServlet',
					dataType : 'json',
					data : {
						choice : "initTree",
					},
					error : function(msg) {
					errMessage("请求PasMbrServlet失败");
					},
					success : function(json) {
						var data = json.obj;
						for ( var i = 0; i < data.length; i++) {
							if(data[i].direction=="上行"){
							$ul.prepend($li1);
							$li1.append("<ul hidden='hidden'></ul>");
							}
							if(data[i].direction=="下行")
							{
								$ul.append($li2);
								$li2.append("<ul hidden='hidden'></ul>");
							}
							else if(data[i].direction=="无"){
								$ul.append($li3);
								$li3.append("<ul hidden='hidden'></ul>");
								}
							}
							animotion();
						}
					});
				
				}
				
				function animotion(){
					$tree.find("span").on("click",function(){
					if($(this).parent().prop("class")=="parent_li"){ 
						if($(this).parent().children("ul").prop("hidden")==true){
							$(this).parent().children("ul").prop("hidden",false);
							$(this).parent().children("span").prop("title","折叠");
							$(this).parent().children("span").children("i").prop("class","fa fa-lg fa-minus-circle");
						}else{
							$(this).parent().children("ul").prop("hidden","hidden");
							$(this).parent().children("span").prop("title","展开");
							$(this).parent().children("span").children("i").prop("class","fa fa-lg fa-plus-circle");
				 	}
					if($ll==undefined){
							$ll=$(this).parent();
						}else if($(this).parent()[0]==$ll[0]){
							return false;
						}else{
							$ll.children("ul").prop("hidden",true);
							$ll.children("span").prop("title","展开");
							$ll.children("span").children("i").prop("class","fa fa-lg fa-plus-circle");
							$ll=$(this).parent();
						}
				 }else{
					choiceSpan($(this));
					}
				});
					
				}
				
				
				/****************************************树形图枝干和叶子节点的点击控制********************************************/
				
				function ReAnimotion($obj){
					$obj.find("span").on("click",function(){
					if($(this).parent().prop("class")=="parent_li"){ 
						if($(this).parent().children("ul").prop("hidden")==true){
							$(this).parent().children("ul").prop("hidden",false);
							$(this).parent().children("span").prop("title","折叠");
							$(this).parent().children("span").children("i").prop("class","fa fa-lg fa-minus-circle");
						}else{
							$(this).parent().children("ul").prop("hidden","hidden");
							$(this).parent().children("span").prop("title","展开");
							$(this).parent().children("span").children("i").prop("class","fa fa-lg fa-plus-circle");
				 	}
					if($ll==undefined){
							$ll=$(this).parent();
						}else if($(this).parent()[0]==$ll[0]){
							return false;
						}else{
							$ll.children("ul").prop("hidden",true);
							$ll.children("span").prop("title","展开");
							$ll.children("span").children("i").prop("class","fa fa-lg fa-plus-circle");
							$ll=$(this).parent();
						}
				 }else{
					choiceSpan($(this));
					}
				});
					
				}
				
			/***********************************************叶子节点的点击选中效果*****************************************************************/
			
			function choiceSpan(a){
				$(a).parent().children("span").css("background","#ccc");
				if($lli==undefined){
					$lli=$(a).parent();
				}else{
					if($(a).parent()[0]==$lli[0]){}else{
					$lli.children("span").css("background","#fff");
					$lli=$(a).parent();
					}
				} 
				queryMember();
			}
			
			/*
			function add(){
				if(hhhbs==null||hhhbs==undefined){
					errMessage("请先选择通道！");
					return false;
				}else{
					$('#opera').dialog({
						title:"新增数据"
					});
					$('#opera').dialog( "open" );
			
					$('#opera').dialog({
						  buttons: [
						    {
						    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
						      "class" : "btn btn-default",
						      click: function() {
								var gjlx=$("#ggjlx").val();
								var gjbh=$("#ggjbh").val();
								var gjms=$("#ggjms").val();
								var gjxh=$("#ggjxh").val();
									if(bjlx==""||gjlx==""||gjbh==""||gjms==""||gjxh==""){
										errMessage("信息不能为空！");
										return false;
									}
									$.ajax({
										type : 'GET',
										url : '../PasMbrServlet',
										dataType : 'json',
										data : {
											jcbz:$("#jcbz").val(),
											cid:hhhbs,
											gjlx:gjlx,
											gjbh:gjbh,
											gjms:gjms,
											gjxh:gjxh,
											choice:"1"
										},
										error : function(msg) {
											errMessage("系统错误！");
										},
										success : function(json) {
											if (json.success == "success") {
												//successMessage("添加成功！");
												$("#ggjlx").val("");
												$("#ggjbh").val("");
												$("#ggjms").val("");
												$("#ggjxh").val("");
												 $('#opera').dialog( "close" );
												 query(hhhbs);
											} else {
												errMessage("添加失败！");
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
		
				}
				
			}
			*/
			/************************************************************/
			/*构件*/
			function queryMember(){
				$('#datatable_fixed_column').dataTable().fnClearTable();
				showMask();
				$.ajax({
					type : 'POST',
					url : '../PasMbrServlet',
					dataType : 'json',
					data : {
						choice:"queryMember",
						s_id:$lli.attr("data-id"),
					},
					error : function(msg) {
						errMessage("查询构件失败！");
						hidMask();
					},
					success : function(json) {
						if (json.success == "success") {
							var len1=json.obj.length;
							table.rows.add(json.obj).draw(false);
							/*
							for(var ii=0;ii<len1;ii++){
							addRow(json.obj[ii]);
							    }*/
							} else {
							errMessage("没有数据！");
						}
						hidMask();
					}
				});
			}
			/*新增构件*/
			function addMember(){
				if($lli==undefined){
					errMessage("请选择跨号!");
					return false;
				} 
				//$("#member_type").val("").trigger("change");
				$("#member_no").val("");
				$("#member_desc").val("");
				//clearMember();
				//isEdit=0;
				//choiceType();
				$('#opera').dialog({
					title:"新增构件"
				});
				$('#opera').dialog( "open" );
				var s_id=$lli.attr("data-id");
				$('#opera').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					      if ($("#member_no").val()=="") {
							errMessage("请输入构件名称!");
							return false;
							}
								$.ajax({
									type : 'POST',
									url : '../PasMbrServlet',
									dataType : 'json',
									data : {
										choice:"addMember",
										s_id:s_id,
										member_type:$("#member_type").val(),
										member_no:$("#member_no").val(),
										member_desc:$("#member_desc").val(),
									},
									error : function(msg) {
										errMessage("添加构件失败！");
									},
									success : function(json) {
										console.log(json);
										var member = json.obj;
										if (json.success == "success") {
											//successMessage("添加成功！");
											//addRow(member);
											table.row.add(member).draw(false);
											 $('#opera').dialog( "close" );
										} else {
											if(json.error=="0"){
											errMessage("添加构件失败！");
											}else if(json.error=="2"){
												errMessage("构件编号重复！");
											}else if(json.error=="1"){
												errMessage("编号重复！");
											}
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
			}
			
			/****************************************************修改构件************************************************************/
			
				function evalMember(a,mem){
				
				/*isEdit=1;
				store=mem.member_model;
				for(var ii=0;ii<gjlx.length;ii++){
					if(gjlx[ii].member_name==mem.member_type){
						$type.val(gjlx[ii].member_id).trigger("change");
					}
					}*/
					$("#member_type").val(mem.member_type).trigger("change");
					$("#member_no").val(mem.member_no);
					$("#member_desc").val(mem.member_desc);
				/*$no.val(mem.member_no);
				$desc.val(mem.member_desc);
				console.log(mem.member_model);*/
			}
			
			
			function editMember(a){
			
				var tr = $(a).closest('tr');
			    var row = table.row( tr );
			    var r_id=table.row( tr ).data().r_id;
				evalMember(a,row.data());
				$('#opera').dialog({
					title:"修改构件"
				});
				$('#opera').dialog( "open" );
				$('#opera').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
								if ($("#member_no").val()=="") {
								errMessage("请输入构件名称!");
								return false;
								}
								$.ajax({
									type : 'POST',
									url : '../PasMbrServlet',
									dataType : 'json',
									data : {
										choice:"editMember",
										r_id:r_id,
										member_type:$("#member_type").val(),
										member_no:$("#member_no").val(),
										member_desc:$("#member_desc").val()
									//	member:JSON.stringify(member),
										//memberno:row.data().member_no
									},
									error : function(msg) {
										errMessage("修改构件失败！");
									},
									success : function(json) {
										if (json.success == "success") {
											var member = json.obj;
											console.log(member);
											member.caozuo="&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip' data-placement='top'  data-id='"+member.r_id+"' data-original-title='修改' onclick='editMember(this)'><i class='fa fa-pencil'></i></a>&nbsp;&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip'  data-id='"+member.r_id+"' data-placement='top' data-original-title='删除' onclick='delMember(this)' ><i class='fa fa-minus'></i></a>";
											 //successMessage("修改成功！");
											 $(a).parent().parent().children("td").eq(0).text(member.distr_name);
											 $(a).parent().parent().children("td").eq(1).text(member.component_name);
											 $(a).parent().parent().children("td").eq(2).text(member.member_type);
											 $(a).parent().parent().children("td").eq(3).text(member.member_no);
											
											  
										 	row.data(member);
										 // $(a).parent().parent().children("td").eq(5).html();
											 /*
											 row.child.hide();
									          tr.removeClass('shown');
											  row.child(format(row.data()) ).show();
									          tr.addClass('shown');
									          */
											 $('#opera').dialog( "close" );
										} else {
											if(json.error=="1"){
											errMessage("修改构件失败！");
											}else if(json.error=="2"){
												errMessage("构件名称重复！");
											}
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
			}
			
			/****************************************format方法************************************************************************/
			
			
			function format ( d ) {
				    // `d` is the original data object for the row
				    return '<table cellpadding="5" cellspacing="0" border="0" class="table table-hover table-condensed table-striped table-bordered">'+
				        /* '<tr>'+
				            '<td style="width:100px">构件编号:</td>'+
				            '<td>'+d.member_no+'</td>'+
				        '</tr>'+ */
				        /*
				        '<tr>'+
				            '<td>构件描述:</td>'+
				            '<td>'+d.member_desc+'</td>'+
				        '</tr>'+*/
				        '<tr>'+
				            '<td>构件型号:</td>'+
				            '<td>'+d.member_model+'</td>'+
				        '</tr>'+
				   		'</table>';
				}
			/***************************************************删除构件*********************************************************************************/
			
			function delMember(a){
				$.SmartMessageBox({
					title : "构件删除",
					content : "您是否确认删除此记录？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						$.ajax({
							type : 'POST',
							url : '../PasMbrServlet',
							dataType : 'json',
							data : {
							 	r_id : $(a).attr("data-id"),
							 	s_id: $lli.attr("data-id"),
								choice : "delMember"
							},
							error : function(msg) {
								errMessage("系统错误！");
							},
							success : function(json) {
								if (json.success == "success") {
									//successMessage("删除成功！");
									table.row($(a).parents("tr")).remove().draw(false);
								} else {
									errMessage("删除失败！");
								}
							}
						});
					}
					if (ButtonPressed === "取消") {
					}

				});	
				
				
				
			}
			
			/************************************************************/
			/*
			function query(a){
				$("#"+hhhbs).css("background","");
				$("#"+a).css("background","#ccc");
				hhhbs=a;
				$('#datatable_fixed_column').dataTable().fnClearTable();
				$.ajax({
					type : 'GET',
					url : '../PasMbrServlet',
					dataType : 'json',
					data : {
						cid:a,
						choice:"2"
					},
					error : function(msg) {
						errMessage("系统错误！");
					},
					success : function(json) {
						if (json.success == "success") {
							var len=json.obj.length;
							for(var a=0;a<len;a++){
								$('#datatable_fixed_column').DataTable().row.add (["<span id='ggjid"+a+"'name='"+json.obj[a].r_id+"'>"+(a+1)+"</span>",json.obj[a].component_type,json.obj[a].member_model,json.obj[a].member_no,json.obj[a].member_desc,json.obj[a].member_type," &nbsp;<a class='btn btn-warning btn-xs'rel='tooltip' data-placement='top' data-original-title='修改'onclick='edit("+a+")'><i class='fa fa-pencil'></i></a> &nbsp;<a  class='btn btn-warning btn-xs'rel='tooltip' data-placement='top' data-original-title='删除' onclick='del("+a+")'><i class='fa fa-minus'></i></a>"]).draw(true);
							}	
						} else {
							errMessage("没有数据！");
						}
					}
				});
			}
			function edit1(a){
			        	if($("#bbjlx").val()==""||$("#ffx").val()==""||$("#ggjlx").val()==""||$("#ggjbh").val()==""||$("#ggjms").val()==""||$("#ggjxh").val()==""){
							errMessage("信息不能为空！");
							return false;
						}
			        	$.ajax({
							type: 'POST',
							url: '../PasMbrServlet',
							dataType: 'json',
							data: {
								gjid:$("#ggjid"+a).attr("name"),
								gjlx:$("#ggjlx").val(),
								gjbh:$("#ggjbh").val(),
								gjms:$("#ggjms").val(),
								gjxh:$("#ggjxh").val(),
								choice:3,
								
							},
							error : function(msg) {
								errMessage("请求DicCardServlet失败");
						    },
							success : function(json) {   
								 if(json.success=="fail"){
									 errMessage("修改失败");
								 }else if(json.success=="success"){
									 //successMessage("修改成功");
										$("#ggjlx").val("");
										$("#ggjbh").val("");
										$("#ggjms").val("");
										$("#ggjxh").val("");
									 //$('#dt_basic').DataTable().row(dom).data([info.domain_id,info.item_value,info.domain_memo]);
									 $('#opera').dialog( "close" );
									 query(hhhbs);
								 }
							}
						});
			        }*/
			$('#opera').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
			$('#add_span').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
			
			
			
			
			
		
			
			/***************************************初始化右边表格***************************************************************/
			function initTable(){
				var responsiveHelper_dt_basic = undefined;
				var responsiveHelper_datatable_fixed_column = undefined;
				var responsiveHelper_datatable_col_reorder = undefined;
				var responsiveHelper_datatable_tabletools = undefined;
				
				var breakpointDefinition = {
					tablet : 1024,
					phone : 480
				};
	
				/* COLUMN FILTER  */
			

					 table = $('#datatable_fixed_column').DataTable( {
						"sDom":
								"t"+
								"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
						"dataSrc": "data",
						"autoWidth" : false,
						"columns": [
/* 							{
								"class":          'details-control',
								"orderable":      false, 
				                "data":          null,
								"defaultContent": ''
							}, */
				            { "data": "distr_name" },
				            { "data": "component_name" },
				            { "data": "member_type" },
				            { "data": "member_no" }, 
				            { "data": "member_model" }, 
				            { "data": null },
				           /*  { "data": "finish" } */
				        ],
				         "columnDefs": [ {
						      "targets": 5,
						      "searchable": false,
						      "render": function(data, type, full) {
						            return "&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip' data-placement='top'  data-id='"+data.r_id+"' data-original-title='修改' onclick='editMember(this)'><i class='fa fa-pencil'></i></a>&nbsp;&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip'  data-id='"+data.r_id+"' data-placement='top' data-original-title='删除' onclick='delMember(this)' ><i class='fa fa-minus'></i></a>";
						          }
						    } ],
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
				        "order": [[1, 'asc']],
					
					"preDrawCallback" : function() {
						// Initialize the responsive datatables helper once.
						if (!responsiveHelper_datatable_fixed_column) {
							responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
						}
					},
					/*
					"rowCallback" : function(nRow) {
						responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
					},
					"drawCallback" : function(oSettings) {
						responsiveHelper_datatable_fixed_column.respond();
					}		
					*/
			    });

					$('#datatable_fixed_column tbody').on('click', 'td.details-control', function () {
				        var tr = $(this).closest('tr');
				        var row = table.row( tr );
				 
				        if ( row.child.isShown() ) {
				            // This row is already open - close it
				            row.child.hide();
				            tr.removeClass('shown');
				        }
				        else {
				            // Open this row
				            row.child( format(row.data()) ).show();
				            tr.addClass('shown');
				        }
				    });
			}
			
			/************************************构件表格增加数据******************************************************************************/
			
			function  addRow(member){
				$('#datatable_fixed_column').DataTable().row.add({"distr_name":member.distr_name,"component_name":member.component_name,"member_type":member.member_type,"member_no":member.member_no,"caozuo":"&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip' data-placement='top'  data-id='"+member.r_id+"' data-original-title='修改' onclick='editMember(this)'><i class='fa fa-pencil'></i></a>&nbsp;&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip'  data-id='"+member.r_id+"' data-placement='top' data-original-title='删除' onclick='delMember(this)' ><i class='fa fa-minus'></i></a>","member_desc":member.member_desc,"member_model":member.member_model,"material_name":member.material_name,"bearing_name":member.bearing_name}).draw(false); 
			}
			/*************************************************************/
			
				/************************************* 通道构件的复制************************************************************/
			function copyAllMem(){
				var copyBridge = $('#allBridge').val();
	        	if(session.id==copyBridge){
	        		errMessage("不可复制当前桥至当前桥！");
	        		return;
	        	}
				$.SmartMessageBox({
			        title: "复制提示",
			        content: "确认从选中的通道中复制所有的跨和构件到当前通道吗？该操作会清空当前通道所有跨和构件记录！",
			        buttons: '[取消][确定]'
			    }, function (ButtonPressed) {
			    	  if (ButtonPressed === "确定") {
				        	showMask();
				        	$.ajax({
								type: 'POST',
								url: '../PasMbrServlet',
								dataType: 'json',
								data: {
									choice:"copyAllMem",
									copyBridge: copyBridge
								},
								error : function(msg) {
									errMessage("请求PasMbrServlet失败");
									hidMask();
							    },
								success : function(json) {
									hidMask();
									 if(json.success=="fail"){
										 switch (json.error) {
										 case 1:
												errMessage("保存失败");
												break;
											case 2:
												errMessage("服务器错误");
												break;
											case 3:
												errMessage("名称重复");
												break;
											default:
												break;
											}
									 }else{
										 if(json.obj==true){
											 successMessage("复制成功");
											 location.reload();
										 }else{
											 errMessage("复制失败");
										 }
									 }
								}
							});
				        }
			    });
			}
			function getAllCul(){
				 $.ajax({
						type: 'POST',
						url: '../PasMbrServlet',
						dataType: 'json',
						data: {
							choice:"getAllpass"
						},
						error : function(msg) {
							errMessage("请求PasMbrServlet失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 switch (json.error) {
									case 1:
										errMessage("没有通道信息");
										break;
									case 2:
										errMessage("服务器错误");
										break;
									case 3:
										errMessage("名称重复");
										break;
									default:
										break;
									}
							 }else{
								 var data = json.obj;
								 for(var i=0;i<data.length;i++){
									 $('#allBridge').append("<option value='"+data[i].pass_id+"'>"+data[i].pass_name+"</option>");
								 }
								 $('#allBridge').select2();
							 }
						}
					});
			}
			/*************************************************************/
			
				$('#copyMem').dialog({
				title: "构件复制",
				autoOpen: false,
				width : 400,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
				function copyMember(){
				$('#copyMem').dialog("open");
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
			 function showMask(){
		        	$("#cover").show();		
		       	}
		       	function hidMask(){
		       		$("#cover").css('display','none');
		       	}
		       	
				var control = "disabled";
				function releaseAdmin(){//管理员
					$('.widget-body-toolbar a').removeClass('disabled');
					control="";
				}
				function releaseManage(){//项目负责人
					
				}
				function releaseMember(){//项目参与人
					
				}
				function releaseGuest(){//普通用户
				}
				function releaseGuest(e){//普通用户
					if(e=="superAdmin"){
     					releaseOrgAdmin();
					}
				
				}
				function releaseOrgAdmin() {//管养公司管理员
			    	 $('.widget-body-toolbar a').removeClass('disabled');
			        control = "";
    			}
		
		</script>
	</body>
</html>