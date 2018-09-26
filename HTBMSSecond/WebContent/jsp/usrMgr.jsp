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
					<article class="col-sm-10 col-md-10 col-lg-10">
				
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
													<button class="btn btn-primary pull-right" onclick="newOperation()">
														增加
													</button>
													
												</div>
			
											</div>
									</div>
									<table id="dt_basic" class="table table-striped table-bordered table-hover">
										<thead>			                
											<tr>
												<th class="col-sm-1 col-md-1">编号</th>
												<th>用户名</th>
												<th>密码</th>
												<th>角色</th>
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
						<label>用户名</label>
						<input class="form-control" id="domain_name" value="" placeholder="用户名" type="text">
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
			
		var table;
		/*
		$('input[id=sign_imgfile]').change(function() {  
			$('#photoCover').val($(this).val());  
		});  */
		$(document).ready(function() {
			// DO NOT REMOVE : GLOBAL FUNCTIONS!
			pageSetUp();
			initTable();


			var editAddDel = "<div class='text-align-center'><button class='edit btn-circle'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle'><span class='glyphicon glyphicon-trash'></span></button></div>";
			var editAddDel2 = "<div class='text-align-center'><button class='edit btn-circle' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
			
			table = $('#dt_basic').DataTable({
				"sDom": 
					"t"+
					"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
				"autoWidth" : false,
				"bScrollCollapse" : true,
				"sScrollY" : 400, 
				 "columns": [
			            { "data": "usr_id" },
			            { "data": "usr_name" },
			            { "data": "usr_pwd" },
			            { "data": "role_name" },
			            { "data": null }
			        ],
				"columnDefs": [ {
				      "targets": 4,
				      "searchable": false,
				      "render": function(data, type, full) {
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
					    	    if(data=="guest"){
					    	    	return "普通用户";
					    	    }
					    	    if(data=="admin"){
					    	    	return "管理员"
					    	    }
					          }
					    } ],
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
			
			$('#searchData').on('change', function(){
				var d = $(this).val();
				table.search(d).draw(true);
			});
			
			
			/* END TABLETOOLS */
			$(".theme-popover").hide();
			$('#login').click(function(){
				alert(11);
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
			sign_img.append("<div><img id='sign' src='"+encodeURI("../ImageDownLoadServer?path=user\\"+name+".jpg+")+"'  width='100px' height='100px'></div>");
			}
			else{
			$("#sign").prop("src",encodeURI("../ImageDownLoadServer?path=user\\"+name+".jpg"+"&a=Math.random()"));
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
					errMessage("请求UserMgrServlet失败");
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
		
		$('#opera').dialog({
			autoOpen: false,
			width : 600,
			resizable : false,
			modal : true
			});
		
		
		var dom;
		function dialogOperation(op){
			
			
			$('#opera').dialog({
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
				});
			
		 	var data = table.row(dom).data();
			var title;
			if(op=="edit"){
				title="修改数据"
				$("#domain_id").val(data.usr_id);
				$("#domain_name").val(data.usr_name);
				$("#domain_pass").val(data.usr_pwd);
				$("#domain_role").val(data.role_name);
				$("#domain_id").prop('readonly','readonly');
			}
			if(op=="del"){
				title="删除数据"
				$("#domain_id").val(data.usr_id);
				$("#domain_name").val(data.usr_name);
				$("#domain_pass").val(data.usr_pwd);
				$("#domain_role").val(data.role_name);
				$("#domain_id").prop('readonly','readonly');
				deleteOperation();
				return false;
			}
			$('#opera').dialog({
				title:title
			});
			$('#opera').dialog( "open" );
			initSign_img();
	/* 		$('#dt_basic').DataTable().row(dom).data([1,2,3])
			alert($('#dt_basic').DataTable().row(dom).data()); */
		}
		
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
		
		function editOperation(){
			var info={
		        	domain_id:$('#domain_id').val(),
		        	domain_role:$('#domain_role').val()
		        }
		        if(info.domain_role=="" || info.domain_id==""){
		        	errMessage("不可为空");
		        }else{
		        	$.ajax({
						type: 'POST',
						url: '../UserMgrServlet',
						dataType: 'json',
						data: {
							type:"edit",
							domain_id:$('#domain_id').val(),
				        	domain_role:$('#domain_role').val(),
				        	domain_pass:$('#domain_pass').val(),
				        	domain_name:$('#domain_name').val()
						},
						error : function(msg) {
							errMessage("请求UserMgrServlet失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("修改失败");
							 }else{
								 //successMessage("修改成功");
								  var file_name = $("#sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload();
												 }
												 else{
												 location.reload([true]);
												 }
								 
								// $('#dt_basic').DataTable().row(dom).data([info.domain_id,info.domain_name,info.domain_pass,info.domain_role]);
								// $('#opera').dialog( "close" );
							 }
						}
					});
		        }
		}
		
		function deleteOperation(){
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
							domain_id:$('#domain_id').val()
						},
						error : function(msg) {
							errMessage("请求UserMgrServlet失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("删除失败");
							 }else{
								 //successMessage("删除成功");
								 $('#dt_basic').DataTable().row(dom).remove().draw();;
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
			$("#sign").prop("src",encodeURI("../ImageDownLoadServer?path=user\\no.jpg"+"&a=Math.random()"));
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
								        	file_name:$("#sign_imgfile").val()
										},
										error : function(msg) {
											errMessage("请求UserMgrServlet失败");
									    },
										success : function(json) {  
											
											 if(json.success=="fail"&&json.error=="0"){
												 errMessage("用户名重名，请重输");
											 }else if(json.success=="fail"&&json.error=="1"){
												 errMessage("插入失败");
											 	 
												 /* $('#dt_basic').DataTable().row.add([info.domain_id,info.item_value,info.domain_memo]).draw(true);  */
												// location.reload([true]);
												 /* $('#opera').dialog( "close" ); */
											 }else{
												 //successMessage("插入成功");
												 var file_name = $("#sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload();
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
		function imgupload(){
			 $.ajaxFileUpload({
					url:'../UserMgrServlet?type=img',
					secureuri : false,
					fileElementId : 'sign_imgfile',
					dataType:'text',
					success : function(data,status) {
					//successMessage("保存成功");	
					location.reload([true]);
						}
											 });
		}
		
		function buildRole(){
			if(superAdmin){
				$('#domain_role').append("<option value='admin'>系统管理员</option><option value='guest'>普通用户 </option>");
			}else{
				$('#domain_role').append("<option value='guest'>普通用户 </option>");
			}
		}
		
		
		var superAdmin = false;
		function releaseAdmin(){//管理员
			buildRole();
		}
		function releaseManage(){//项目负责人
			
		}
		function releaseMember(){//项目参与人
			
		}
		function releaseGuest( e ){
			if(e=='superAdmin'){
				superAdmin = true;
			}else{
				location.href="index.jsp";
			}
			buildRole();
		}
		</script>
		
		
	</body>
</html>