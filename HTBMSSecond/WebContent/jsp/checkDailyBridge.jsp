<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.alibaba.fastjson.JSON" %>
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
    <link rel="apple-touch-startup-image" href="../img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="../img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="../img/splash/iphone.png" media="screen and (max-device-width: 320px)">

    <link rel="stylesheet" href="../jstree/themes/default/style.min.css"/>
    <link rel="stylesheet" href="check/jquery.datetimepicker.css"/>

    <style>

        .tree-second:hover {
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
					<span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"
                          data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
                          data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>检查评定</li>
            <li>检查</li>
        </ol>
        <!-- end breadcrumb -->

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">
        <section id="widget-grid">
            <div class="row">

                <%@include file="currentStruct.jsp" %>

                <!-- NEW WIDGET START -->
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
                            <h2>桥梁日常检查</h2>

                        </header>

                        <!-- widget div-->

                        <%
                            if (oc == null) {
                        %>
                        <div>
                            <div class="widget-body no-padding">

                                <h4>您好，当前没有选中任何结构物。请至 <b>结构</b> 选择一个结构物</h4>

                            </div>
                        </div>
                        <%
                        } else {
                        %>

                        <div>

                            <!-- widget content -->
                            <div class="widget-body no-padding">

                                <div class="widget-body-toolbar bg-color-white">


                                    <div class="row">

                                        <div class="col-sm-12 col-md-12  text-align-right">
                                            <div class="pull-left col-xs-3 pull-left">
                                            <form class="form-inline">
											  <div class="form-group">
											    <div class="input-group">
											      <div class="input-group-addon">当前温度</div>
											      <input type="text" class="form-control" id="exampleInputAmount" readonly="readonly" placeholder="">
											      <div class="input-group-addon" title="设置为默认温度">
											      	<b>°C</b>
											      </div>
											      <div class="input-group-addon" data-toggle="tooltip" data-placement="bottom" title="设置为默认温度">
											      	<input id="setTemp"  type="checkbox">
											      </div>
											    </div>
											  </div>
											</form>
                                            </div>
                                            <a class="btn btn-primary disabled"   onclick="overCheck()">
                                              	完成桥梁检查  
                                            </a>
                                        </div>

                                    </div>


                                </div>
                                
                                
                                
                                
                                
                           <!-- *****************************************表格1区域 ***************************************************** -->
							<table id = "table1" class="table table-striped table-bordered table-hover">
							 <thead>
							<tr>
							<th>部件类型</th>
							<th>检查时间</th>
							<th>病害</th>
							<th>操作</th>							
							</tr>
							</thead>
                             <tbody>

                             </tbody>
							</table>
                            </div>
                            <!-- end widget content -->

                        </div>

                   
                        <script>var info =<%=JSON.toJSONString(oc)%>
                        </script>
                        <%
                            }
                        %>


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

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../js/plugin/jquery-form/jquery-form.min.js"></script>
<script src="../js/plugin/select2/select2.min.js"></script>
<script src="../jstree/jstree.min.js"></script>

<script src="check/jquery.datetimepicker.full.min.js"></script>
<script src="../js/jquery.cookie.js"></script>

<script>
	var info = <%=JSON.toJSONString(oc)%>;
	
	/****************测试数据**********************************/
    $(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
       $("[data-toggle='tooltip']").tooltip(); 
        pageSetUp();
        <%if(oc!=null){%>
        checkState();
        <%}%>
        initTable();
        getTemp();
    });
    
    
    
	function initTable() {
		$.ajax({
			type : 'POST',
			url : '../CheckBridgeServlet',
			dataType : 'json',
			data : {
				type : "initDailyChkTable",
			},
			error : function(msg) {
				errMessage("请求CheckBridgeServlet失败");
			},
			success : function(json) {
				if(json.success=="success"){
					table.rows.add(json.obj).draw(false);
				}
			}
		});

	}

	/************************************************ 生成表格结构 ************************************************/
	var editDel = "<div class='text-align-center' title='添加病害'><button class='btn btn-default glyphicon glyphicon-list plus' disbaled title='查看病害'></button></div>";
	var table = $('#table1').DataTable({
						"deferRender" : true,
						"processing" : true,
						"sDom" : "t"
								+ "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
						"bDestroy" : true,
						"iDisplayLength" : 10,
						"autoWidth" : true,
						"bScrollCollapse" : true,
						"sScrollY" : 400,
						"oLanguage" : {
							"sSearch" : '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
						},
						"columns" : [
								{
									"data" : "member_type"
								},
								{
									"data" : "chk_date"
								},
								{
									"orderable" : false,
									"data" : null,
									"defaultContent" : "<button class='btn btn-default glyphicon glyphicon-list add' title='查看病害'></button>"
								}, {
									"data" : null
								} ],
						"columnDefs" : [ {
							"targets" : 3,
							"searchable" : false,
							"render" : function(data, type, full) {
								return editDel;
							}
						} ],
						"order" : [ [ 1, 'asc' ] ],
						"oLanguage" : { //国际化配置
							"sProcessing" : "正在获取数据，请稍后...",
							"sLengthMenu" : "显示 _MENU_ 条",
							"sZeroRecords" : "查询不到相关数据",
							"sInfo" : "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
							"sInfoEmpty" : "记录数为0",
							"sInfoFiltered" : "(全部记录数 _MAX_ 条)",
							"sInfoPostFix" : "",
							"sSearch" : "搜索",
							"sUrl" : "",
							"oPaginate" : {
								"sFirst" : "第一页",
								"sPrevious" : "上一页",
								"sNext" : "下一页",
								"sLast" : "最后一页"
							}
						}
					});
	$('#searchData').on('change', function() {
		var d = $(this).val();
		table.search(d).draw(true);
	});

	$('#table1').delegate('.add', 'click', function() {
		var dom = $(this).closest('tr');
		var data = table.row(dom).data();
		$.cookie("data", JSON.stringify(data));
		$.cookie("tem", "");
		$.cookie("autoOpen", "false");
		window.location.href = encodeURI("checkDailySpan3.jsp");
	});

	$('#table1').delegate('.plus', 'click', function() {
		var dom = $(this).closest('tr');
		var data = table.row(dom).data();
		console.log(data);
		$.cookie("data", JSON.stringify(data));
		$.cookie("tem", $("#exampleInputAmount").val());
		$.cookie("autoOpen", "true");
		window.location.href = encodeURI("checkDailySpan3.jsp");
	});
	
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
			
	function setTemp(){
		$.ajax({
			type : 'POST',
			url : '../CheckBridgeServlet',
			dataType : 'json',
			data : {
				type : "setTemp",
				tem : $("#exampleInputAmount").val()
			},
			error : function(msg) {
				errMessage("请求CheckBridgeServlet失败");
			},
			success : function(json) {
				if(json.success=="success"){
					successMessage("设置成功");
				}
			}
		});
	}	
	
	
	function getTemp(){
		$.ajax({
			type : 'POST',
			url : '../CheckBridgeServlet',
			dataType : 'json',
			data : {
				type : "getTemp",
			},
			error : function(msg) {
				errMessage("请求CheckBridgeServlet失败");
			},
			success : function(json) {
				if(json.success=="success"){
					$("#exampleInputAmount").val(json.obj);
				}
			}
		});	
	}
			
	$("#setTemp").click(function(){ 
		if($("#setTemp").prop("checked")==true){
			if($("#exampleInputAmount").val()==""){
				errMessage("请先填写当前温度");
				$("#setTemp").attr("checked",false);
				return;
			}
			 $.SmartMessageBox({
	            title: "确认",
	            content: "是否设置为默认温度",
	            buttons: '[取消][确定]'
	        }, function (ButtonPressed) {
	            if (ButtonPressed === "确定") {
	            	setTemp();
	            }else{
	            	$("#setTemp").attr("checked",false);
	            }
	        });
		}
	}); 		
	
	
	function overCheck(){
        $.SmartMessageBox({
            title: "确认提示",
            content: "确认结束该结构物检查吗？",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
        if($("#exampleInputAmount").val()==""||$("#exampleInputAmount").val()==undefined){
			errMessage("请先填写当前温度");
			return;
		}
                $.ajax({
                    type: 'POST',
                    url: '../CheckBridgeServlet',
                    dataType: 'json',
                    data: {
                        type: "overCheck",
                        chk_id: info.chk_id,
                        temp : $("#exampleInputAmount").val()
                    },
                    error: function (msg) {
                        errMessage("请求CheckBridgeServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    errMessage("结束失败！");
                                    break;
                                case 2:
                                    errMessage("出错！");
                                    break;
                                case 3:
                                    errMessage("设置的结构已失效，需重新设置！");
                                    break;
                                case 4:
                                    errMessage("卡片结构技术数据不完善！");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                        	 window.location.reload();
                        }
                    }
                });
            }
        });
    }
    
     //判断状态，是否存在正在进行项目 和 项目下是否存在当前桥梁结构
    var bridgeChk = {
        prj_id: undefined,
        prj_desc: undefined,
        chk_type: undefined,
        chk_id: undefined
    }
    
        function checkState() {
        if (info.prj_id == undefined) {
            errMessage("您好，该结构物下没有正在进行中的项目！");
            $('.widget-body-toolbar a').addClass('disabled');
            return;
        }
        $.ajax({
            type: 'POST',
            url: '../CheckBridgeServlet',
            dataType: 'json',
            data: {
                type: "checkState",
                info: JSON.stringify(info)
            },
            error: function (msg) {
                errMessage("请求CheckBridgeServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("您好，请选择您参与的项目下的结构物！");
                            $('.widget-body-toolbar a').addClass('disabled');
                            break;
                        case 2:
                            errMessage("您好，请选择您参与的项目下的结构物！");
                            break;
                        case 3:
                            //successMessage("您好，当前结构物已完成检查！");
                            break;
                        default:
                            break;
                    }
                    $('#dt_basic').dataTable().fnClearTable();
                } else {
                	  if(info.prj_state==0){
                          //成功时操作
                          console.log(json.obj);
                          if (json.obj.audit_state == '1' ) {
                              //successMessage("您好，当前结构物已完成检查！");
                              $('.widget-body-toolbar a').removeClass('btn-warning').addClass('btn-success').text('已完成');
                               $('.widget-body-toolbar a').addClass('disabled');
                              /*  $('#ddd').append("<span class='label label-primary'>检查已经完成</span>"); */
                          } 
                          	if(!join){
                              	 $('.widget-body-toolbar a').addClass('disabled');
                              }
                          bridgeChk.prj_id = json.obj.prj_id;
                          bridgeChk.prj_desc = json.obj.prj_desc;
                          bridgeChk.chk_type = json.obj.chk_type;
                          bridgeChk.chk_id = json.obj.chk_id;
                          bridgeChk.audit_state = json.obj.audit_state;
                          if (bridgeChk.audit_state == '2') {
                              $('.widget-body-toolbar a').eq(2).removeClass('btn-warning').addClass('btn-info').text('已审核');
                              editDel = "<div ><button class='btn btn-default glyphicon glyphicon-plus plus' disabled title='添加病害'></button></div>";
                          } else {
                              permision = true;
                          }
                      }
                }
            }
        });
    }
	var join = false;
	function releaseAdmin() {//管理员

    }
    function releaseManage() {//项目负责人
        releaseMember();
    }
    function releaseMember() {//项目参与人
        join = true;
    	if(info.prj_state==0){
    		 $('.widget-body-toolbar a').removeClass('btn-warning disabled');
    		 $("#exampleInputAmount").prop("readonly",false);
    	         editDel = "<div title='添加病害'><button class='btn btn-default glyphicon glyphicon-plus plus' title='添加病害'></button></div>";
    	}
       }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		
		if(e=="superAdmin"){
			         join = true;
		    		 $('.widget-body-toolbar a').removeClass('btn-warning disabled');
		    		 $("#exampleInputAmount").prop("readonly",false);
		    	         editDel = "<div title='添加病害'><button class='btn btn-default glyphicon glyphicon-plus plus' title='添加病害'></button></div>";
		}
	
	}
	
</script>


</body>
</html>