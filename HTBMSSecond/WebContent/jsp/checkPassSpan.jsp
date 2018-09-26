<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.alibaba.fastjson.JSON" %>
<%@page import="hs.bm.vo.OperationConstruct" %>
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
    <link rel="stylesheet" href="../js/cropper/cropper.min.css"/>

    <style>

        .tree-second:hover {
            background-color: #ccc;
            cursor: pointer;
        }

        /* 		.cropper-crop-box{ */
        /* 			width: 8cm; */
        /* 			height: 6cm; */
        /* 		} */
        .well {
            padding: 10px;
        }

        .dropdown-menu {
            min-width: 100px;
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
    
    <div id="sendMessage" hidden="hidden">
    	<label>选择发送人员：</label>
    	<select id="userName" style="width: 100%" class="select2" multiple>
    	</select>
    </div>
    <div id="sendCode" hidden="hidden">
    	<table class="table table-bordered table-hover">
    		<thead>
    			<tr>
	    			<td>姓名</td>
	    			<td>状态</td>
    			</tr>
    		</thead>
    		<tfoot id="codeTable">
    		</tfoot>
    	</table>
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
                            <h2>跨检查</h2>

                        </header>

                        <!-- widget div-->

                        <%
                            if (oc == null) {
                        %>
                        <div>
                            <div class="widget-body no-padding">

                                <h4>您好，当前没有选中人任何结构物。请至 <b>检查评定 > 结构物</b> 选择一个结构物</h4>

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

                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <h4 class="pull-left"></h4>
                                            <div class="pull-left col-xs-3"><input class="form-control" id="searchData"
                                                                                   value="" placeholder="搜索"
                                                                                   type="text"></div>
                                            <a class="btn btn-primary disabled" onclick="newMem()">
                                                选择构件
                                            </a>
                                            &nbsp;
                                            <a class="btn btn-primary disabled" onclick="overCheck()">
                                                完成跨检查
                                            </a>
                                        </div>

                                    </div>


                                </div>
                                <!-- *****************************************表格1区域 ***************************************************** -->
                                <table id="dt_basic" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>部件类型</th>
                                        <th>构件类型</th>
                                        <th>构件名称</th>
                                        <th>病害统计</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>

                            </div>
                            <!-- end widget content -->

                        </div>


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
<script src="../js/cropper/cropper.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="check/bootstrap3-typeahead.min.js"></script>
<script src="../js/myTool.js"></script>
<script type="text/javascript">

    if (!HTMLCanvasElement.prototype.toBlob) {
        Object.defineProperty(HTMLCanvasElement.prototype, 'toBlob', {
            value: function (callback, type, quality) {

                var binStr = atob(this.toDataURL(type, quality).split(',')[1]),
                    len = binStr.length,
                    arr = new Uint8Array(len);

                for (var i = 0; i < len; i++) {
                    arr[i] = binStr.charCodeAt(i);
                }

                callback(new Blob([arr], {type: type || 'image/png'}));
            }
        });
    }

    var bridgeChk = {
        prj_id: undefined,
        prj_desc: undefined,
        chk_type: undefined,
        chk_id: undefined,
        audit_state: undefined
    }
    var cookieData = $.cookie('data');
    if (cookieData == undefined) {
        location.href = "checkPass.jsp";
    }
    var span = JSON.parse(cookieData);
    var autoOpen = false;
    var info = <%=JSON.toJSONString(oc)%>;
    $('h4').html("<label class='label label-success label-lg'>" + span.direction + "第" + span.span_no + "跨</label>");

    $(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();

        $('#addMemDialog').dialog({
            autoOpen: false,
            width: 600,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '选择构件'
        });
        $('#addMemDialog').prop('hidden', false);
        $('#sendMessage').dialog({
            autoOpen: false,
            width: 600,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '发送病害信息',
            buttons: [
                      {
                          html: "发送",
                          "class": "btn btn-default",
                          click: function () {
                              sendMsg();
                          }
                      },{
                          html: "取消",
                          "class": "btn btn-default",
                          click: function () {
                        	  $('#sendMessage').dialog('close'); 
                          }
                      }]
        });
        $('#sendCode').dialog({
            autoOpen: false,
            width: 600,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '发送信息状态',
            buttons: [{
                          html: "确定",
                          "class": "btn btn-default",
                          click: function () {
                        	  $('#sendCode').dialog('close'); 
                          }
                      }]
        });
        $('#defectDialog').dialog({
            autoOpen: false,
            width: 600,
            maxHeight: 700,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '病害录入'
        });
        $('#defectDialog').prop('hidden', false);
        $('#hisDialog').dialog({
            autoOpen: false,
            width: 600,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '历史病害'
        });
        $('#hisDialog').prop('hidden', false);
        $('#lookImg').dialog({
            autoOpen: false,
            width: 'auto',
            height: 500,
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '查看照片',
            buttons: [
                {
                    html: "确定",
                    "class": "btn btn-default",
                    click: function () {
                        $('#lookImg').dialog('close');
                    }
                }]
        });
        $('#lookImg').prop('hidden', false);
        $('#cropper').dialog({
            autoOpen: false,
            width: 'auto',
            height: '500',
            resizable: false,
            modal: true,
            show: 'drop',
            hide: 'drop',
            title: '裁剪照片',
            buttons: [
                {
                    html: "裁剪",
                    "class": "btn btn-default",
                    click: function () {
                        var imageData = $('#cropperImg').cropper('getImageData');
                        var hw = {};
                        console.log(imageData.naturalWidth);
                        if (imageData.naturalWidth > 2000) {
                            hw = {width: 1600, height: 1200}
                        }
                        $('#cropperImg').cropper('getCroppedCanvas', hw).toBlob(function (blob) {
                            var formData = new FormData();

                            formData.append('croppedImage', blob);

                            $.ajax('../ImageUpLoadServer', {
                                method: "POST",
                                data: formData,
                                processData: false,
                                contentType: false,
                                dataType: 'json',
                                success: function (json) {
                                    //TODO: 生成图片节点
                                    //data-new="1"代表新节点。data-del="0"代表是否删除
                                    var dom = $('<div data-new="1" data-del="0"  class="photo thumbnail col-lg-12" >' +
                                        '<div class="load" style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50% ;">' +
                                        '<img src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">' +
                                        '</div>' +
                                        '<img style="height: 200px" alt="" src=""  class="img" onload="imgLoadSuccess(this)" >' +
                                        '<label class="photo_name"></label>&nbsp&nbsp<a class="btn btn-default btn-xs" onclick="removeImg(this);">删除图片</a>' +
                                        '<input type="text" class="photo_path" style="display: none;">' +
                                        '</div>');
                                    preImg = json.obj;
                                    dom.find('.img').prop('src', encodeURI('../ImageDownLoadServer?path=' + preImg + '&' + Math.random()));
                                    dom.find('.photo_path').val(preImg);
// 								     	$('#img').prop('src',encodeURI('../ImageDownLoadServer?path='+preImg+'&'+Math.random()));
// 									 	$('#defect_photo').val(preImg);
// 									 	var d = $('#defect').val();
// 									 	if(tableData.member_no=='其他'){
// 									 		dom.find('.photo_name').html(defect[d].defect_name);
// 									 		$('#defect_photo_memo').val(defect[d].defect_name);
// 									 	}else{
// 									 		dom.find('.photo_name').html(tableData.member_no+defect[d].defect_name);
// 									 		$('#defect_photo_memo').val(tableData.member_no+defect[d].defect_name);
// 									 	}
                                    $('#cropperImg').cropper('destroy');
                                    $('#cropper').dialog('close');
                                    $('#photo_area').append(dom);
                                    reSetPhotoName();
                                },
                                error: function (josn) {
                                    $('#cropperImg').cropper('destroy');
                                    $('#cropper').dialog('close');
                                }
                            });
                        });
                    }
                }, {
                    html: "取消",
                    "class": "btn btn-default",
                    click: function () {
                        $('#cropperImg').cropper('destroy');
                        $('#cropper').dialog('close');
// 								 imgLoadSuccess();
                    }
                }]
        });
        checkState();
    });


    function checkState() {
        if (info.prj_id == undefined) {
            errMessage("您好，该结构物下没有正在进行中的项目！");
            $('.widget-body-toolbar a').addClass('disabled');
            return;
        }
        $.ajax({
            type: 'POST',
            url: '../CheckPassServlet',
            dataType: 'json',
            data: {
                type: "checkState",
                info: JSON.stringify(info)
            },
            error: function (msg) {
                errMessage("请求CheckPassServlet失败");
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
                } else {
                    bridgeChk.prj_id = json.obj.prj_id;
                    bridgeChk.prj_desc = json.obj.prj_desc;
                    bridgeChk.chk_type = json.obj.chk_type;
                    bridgeChk.chk_id = json.obj.chk_id;
                    bridgeChk.audit_state = json.obj.audit_state;
                    bridgeChk.eval_level = json.obj.eval_level;
                    if(info.prj_state==0){
                    	if (span.chk_state == '1') {
                            $('.widget-body-toolbar a').eq(1).addClass('disabled');
                        }
                    }
                    initComBox();
                    initTable();
                    buildDefReference();
                }
            }
        });
    }


    /************************************************ 加载项目 ************************************************/
    //初始化表格数据
    function initTable() {
        $.ajax({
            type: 'POST',
            url: '../CheckPassSpanServlet',
            dataType: 'json',
            data: {
                type: "initTable",
                span_chk_id: span.span_chk_id
            },
            error: function (msg) {
                errMessage("请求CheckPassSpanServlet失败");
                $('.widget-body a').addClass('disabled');
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("没有数据！");
                            break;
                        case 2:
                            errMessage("服务器错误！");
                            break;
                        case 3:
                            errMessage("");
                            break;
                        default:
                            break;
                    }
                    $('#dt_basic').dataTable().fnClearTable();
                } else {
                    //成功时操作
                    //successMessage("找到正在进行中的检查");
                    $('#dt_basic').dataTable().fnClearTable();
                    var mems = json.obj;
                    if (bridgeChk.audit_state == '2') {
                        editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
                        editDel2 = "<button class='sendMeg btn btn-warning btn-xs'><span class='glyphicon glyphicon-envelope'></span></button>&nbsp;<button class='edit2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-trash'></i></button>";
                        control = "disabled";
                        $('.widget-body-toolbar a').eq(0).addClass('disabled');
                        $('.widget-body-toolbar a').eq(1).addClass('disabled');
                    }
                    table.rows.add(mems).draw(false);
                }
            }
        });
    }


    /************************************************ 完成检查 ************************************************/
    function overCheck() {
        $.SmartMessageBox({
            title: "确认提示",
            content: "确认结束当前跨检查吗？",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../CheckPassSpanServlet',
                    dataType: 'json',
                    data: {
                        type: "overCheck",
                        span_chk_id: span.span_chk_id
                    },
                    error: function (msg) {
                        errMessage("请求CheckPassSpanServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    errMessage("失败！");
                                    break;
                                case 2:
                                    errMessage("出错！");
                                    break;
                                case 3:
                                    errMessage("卡片结构技术数据不完善！");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                            /*  buildPDF(); */
                            location.href = "checkPass.jsp";
                        }
                    }
                });

            }
        });
    }

    function buildPDF() {

        $.ajax({
            type: 'POST',
            url: '../CheckPassSpanServlet',
            dataType: 'json',
            data: {
                type: "buildPDF",
                direction: span.direction,
                span_no: span.span_no,
                span_chk_id: span.span_chk_id
            },
            error: function (msg) {
            },
            success: function (json) {
            }
        });

    }


    /************************************************ 选择构件 ************************************************/
    //初始化构件选框信息
    function initComBox() {
        $.ajax({
            type: 'POST',
            url: '../CheckPassSpanServlet',
            dataType: 'json',
            data: {
                type: "initComBox",
                pass_id: info.id,
                direction: span.direction,
                span_no: span.span_no
            },
            error: function (msg) {
                errMessage("请求CheckPassSpanServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("无数据！");
                            break;
                        case 2:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        memList[data[i].r_id] = data[i];
                        //添加结构和部件关系
                        if (checkRe(dis['无'], data[i].component9)) {
                            dis['无'].push(data[i].component9);
                            com[data[i].component9] = [];
                        }
                        //添加部件和构件类型关系
                        if (checkRe(com[data[i].component9], data[i].member_type)) {
                            com[data[i].component9].push(data[i].member_type);
                            memType[data[i].member_type] = [];
                        }
                        //添加构件类型和构件关系
                        if (checkRe(memType[data[i].member_type], data[i].member_no)) {
                            memType[data[i].member_type].push(data[i]);
                        }
                    }
                    autoOpen = $.cookie('autoOpen');
                    disChange();
                    if (autoOpen == 'true') {
                        newMem();
                        autoOpen = 'false';
                        $.cookie('autoOpen', "false");
                    }
                }
            }
        });
    }

    function disChange() {
        var d = $('#dis').val();
        if (d == '0') {
            $('#com').empty();
            $('#com').append("<select class='form-control input-sm select2'   onchange='comChange()'><option value='0'>---部件类型---</option></select>");
            $('#com select').select2();
        } else {
            buildCom(dis[d]);
        }
        comChange();
    }
    function comChange() {
        var d = $('#com select').val();
        if (d == '0') {
            $('#memType').empty();
            $('#memType').append("<select class='form-control input-sm select2'   onchange='memTypeChange()'><option value='0'>---构件类型---</option></select>");
            $('#memType select').select2();
        } else {
            buildMemType(com[d]);
        }
        memTypeChange();
    }

    function memTypeChange() {
        var d = $('#memType select').val();
        if (d == '0') {
            $('#mem').empty();
            $('#mem').append("<select class='form-control input-sm select2' ><option value='0'>---构件---</option></select>");
            $('#mem select').select2();
        } else {
            buildMem(memType[d]);
        }
    }

    function buildCom(data) {
        $('#com').empty();
        $('#com').append("<select class='form-control input-sm select2'   onchange='comChange()' style='width: 100%'></select>");
        var xx = $('#com select');
        for (var i = 0; i < data.length; i++) {
            xx.append("<option >" + data[i] + "</option>");
        }
        xx.select2();
    }

    function buildMemType(data) {
        $('#memType').empty();
        $('#memType').append("<select class='form-control input-sm select2'   onchange='memTypeChange()' style='width: 100%'></select>");
        var xx = $('#memType select');
        for (var i = 0; i < data.length; i++) {
            xx.append("<option>" + data[i] + "</option>");
        }
        xx.select2();
    }

    function buildMem(data) {
        $('#mem').empty();
        $('#mem').append("<select class='form-control input-sm select2' style='width: 100%'><option value=''>---构件---</option></select>");
        var xx = $('#mem select');
        for (var i = 0; i < data.length; i++) {
            xx.append("<option value='" + data[i].r_id + "'>" + data[i].member_no + "</option>");
        }
        xx.select2();
    }


    var memList = {};
    var dis = {
        "无": []
    }
    var com = {};
    var memType = {};
    function checkRe(d, b) {
        for (var i = 0; i < d.length; i++) {
            if (d[i] == b) {
                return false;
            }
        }
        return true;
    }


    function newMem() {
        $('#addMemDialog').dialog({
            title: "选择构件",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 选定",
                    "class": "btn btn-default",
                    click: function () {
                        var d = $('#mem select').val();
                        if (d == "" || d == null || d == undefined) {
                            return;
                        }
                        var dd = memList[d];
                        var tdata = table.data();
                        for (var i = 0; i < tdata.length; i++) {
                            if (dd.member_no == tdata[i].member_no) {
                                errMessage("该构件已添加！");
                                return;
                            }
                        }
                        tableData = {};
                        tableData.direction = dd.direction;
                        tableData.span_chk_id = span.span_chk_id;
                        tableData.span_no = dd.span_no;
                        tableData.distr_name = dd.distr_name;
                        tableData.component_name = dd.component9;
                        tableData.mbr_no = dd.r_id;
                        tableData.member_no = dd.member_no;
                        tableData.member_name = dd.member_type;
                        tableData.bridge_id = info.id;
                        tableData.defects = [];
                        $.ajax({
                            type: 'POST',
                            url: '../CheckPassSpanServlet',
                            dataType: 'json',
                            data: {
                                type: "newMem",
                                tableData: JSON.stringify(tableData)
                            },
                            error: function (msg) {
                                errMessage("请求CheckPassSpanServlet失败");
                            },
                            success: function (json) {
                                if (json.success == "fail") {
                                    switch (json.error) {
                                        case 1:
                                            errMessage("出错！");
                                            break;
                                        case 2:
                                            errMessage("出错！");
                                            break;
                                        default:
                                            break;
                                    }
                                } else {
                                    //successMessage("选择成功")
                                    tableData.mbr_chk_id = json.obj;
                                    var node = $(table.row.add(tableData).draw(false).node());
                                    $('#addMemDialog').dialog("close");
                                    changeChkState();
                                    node.find('.add').click();
                                }
                            }
                        });

                    }
                },
                {
                    html: "<i class='fa fa-times'></i>&nbsp; 取消",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]
        });
        $('#addMemDialog').dialog('open');
    }


    /************************************************ 删除构件 ************************************************/
    var dom = undefined;
    $('#dt_basic').delegate('.del', 'click', function () {
        dom = $(this).parents('tr');
        var data = table.row(dom).data();
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var ph = [];
                for (var i = 0; i < data.defects.length; i++) {
                    ph.push(data.defects[i].defect_photo);
                }
                $.ajax({
                    type: 'POST',
                    url: '../CheckPassSpanServlet',
                    dataType: 'json',
                    data: {
                        type: "delMem",
                        mbr_chk_id: data.mbr_chk_id,
                        ph: JSON.stringify(ph)
                    },
                    error: function (msg) {
                        errMessage("请求CheckPassSpanServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    errMessage("出错！");
                                    break;
                                case 2:
                                    errMessage("出错！");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                            //successMessage("删除成功")
                            table.row(dom).remove().draw(false);
                            changeChkState();
                        }
                    }
                });
            }
        });
    });


    /************************************************ 病害增加和修改 ************************************************/


    var sad = false;
    $('#dt_basic').delegate('.add', 'click', function () {
        dom = $(this).closest('tr');
        var data = table.row(dom).data();
        tableData = data;
        tr = $(this).closest('tr');
        row = table.row(tr);
        $('#chk_defect_memo').val('');
        $.ajax({
            type: 'POST',
            url: '../CheckPassSpanServlet',
            dataType: 'json',
            data: {
                type: "getDefect",
                component_name: data.component_name
            },
            error: function (msg) {
                errMessage("请求CheckPassSpanServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("缺少病害关系！");
                            break;
                        case 2:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data2 = json.obj;
                    defect_f = {};
                    defect_f_list = [];
                    for (var i = 0; i < data2.length; i++) {
                        defect_f[data2[i].defect_f_id] = data2[i];
                        var df = {};
                        df.defect_f_id = data2[i].defect_f_id;
                        df.defect_f_name = data2[i].defect_f_name;
                        defect_f_list.push(df);
                    }

                    buildDefect_f();
                    //$('#develop_state input[value="2"]').prop('checked', 'checked');
                    $('#defect_photo').val("");
                    $('#defect_photo_memo').val("");
                    $('#img').prop('src', '../ImageDownLoadServer?path=' + "eweqwe.jpg");

                    $('#photo_area').empty();
                    $('#defectDialog').dialog('open');
                    if (selectDefect != undefined) {
                        $('#defect_f').val(selectDefect.defect_f_name).trigger('change');
                        $('#defect').val(selectDefect.defect_name).trigger('change');
                        setDefectVal(selectDefect.defect_location_desc_val, selectDefect.defect_count_val);
                        $('#chk_defect_memo').val(selectDefect.chk_defect_memo);
                        setDefectAttr(selectDefect.defect_attr);
                    }
                }
            }
        });
        $('#defectDialog').dialog({
            close: function (ev, ui) {
                if (!sad) {
                    selectDefect = undefined;
                    saveAndAdd = false;
                }
                sad = false;
            },
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default save",
                    click: function () {
                        var info2 = {
                            defect_serial: "",
                            defect_id: "",
                            mbr_chk_id: "",
                            mbr_no: "",
                            defect_name: "",
                            defect_name_f: "",
                            defect_location_desc: "",
                            defect_count: "",
                            defect_photo: "",
                            repair_state: "0",
                            develop_state: $('#develop_state input:checked').val(),
                            defect_photo_memo: "",
                            defect_attr: getAttrData(),
                            defect_location_desc_val: "",
                            defect_count_val: "",
                            chk_defect_memo: ""
                        }
                        if(info2.develop_state==undefined||info2.develop_state==null||info2.develop_state.trim()==''){
                        	info2.develop_state=0;
                        }
                        var d = defect[$('#defect').val()];
                        info2.defect_id = d.defect_id;
                        info2.defect_name = d.defect_name;
                        info2.defect_name_f = $('#defect_f option:selected').html();
                        info2.mbr_chk_id = tableData.mbr_chk_id;
                        info2.mbr_no = tableData.mbr_no;
                        info2.defect_photo = $('#defect_photo').val();
                        info2.defect_photo_memo = $('#defect_photo_memo').val();
                        info2.chk_defect_memo = $('#chk_defect_memo').val();
                        var flag = true;
                        var d1 = [];
                        var d2 = [];
                        $('#defect_loc_def').find('input,select').each(function () {
                            var e = $(this).val();
                            /* 	if(e==""||e==undefined){
                             flag = false;
                             return;
                             } */
                            d1.push(e);
                        });
                        $('#defect_def').find('input,select').each(function () {
                            var e = $(this).val();
                            /* 	if(e==""||e==undefined){
                             flag = false;
                             return;
                             } */
                            d2.push(e);
                        });
                        if (flag == false) {
                            errMessage("请确认数据完整！");
                            return;
                        }
                        info2.defect_location_desc_val = JSON.stringify(d1);
                        info2.defect_count_val = JSON.stringify(d2);

                        var temAndVal = rebuildTemplet(d.defect_loc_def, d1);
                        d.defect_loc_def = temAndVal.defect_loc_def;
                        d1 = temAndVal.d1;

                        var temAndVal_count = rebuildTemplet(d.defect_def, d2);
                        d.defect_def = temAndVal_count.defect_loc_def;
                        d2 = temAndVal_count.d1;

                        info2.defect_location_desc = d.defect_loc_def.format(d1);
                        info2.defect_count = d.defect_def.format(d2);
                        if (info2.defect_attr != '') {
                            info2.defect_count = info2.defect_count + "，" + info2.defect_attr;
                        }
                        //TODO:获取所有病害图片信息并组织成list
                        var imgList = new Array();


                        $(".photo").each(function () {
                            var imgObj = new Object();
                            imgObj.photo_path = $(this).find('.photo_path').val();
                            imgObj.photo_name = $(this).find('.photo_name').html();
                            imgObj.photo_date = new Date();

                            imgList.push(imgObj);
                        });

                        $.ajax({
                            type: 'POST',
                            url: '../CheckPassSpanServlet',
                            dataType: 'json',
                            async: false,
                            data: {
                                type: "newDefect",
                                info: JSON.stringify(info2),
                                bridge_id: data.bridge_id,
                                chk_type: bridgeChk.chk_type,
                                prj_id: bridgeChk.prj_id,
                                saveData: JSON.stringify(getSaveData()),
                                imgList: JSON.stringify(imgList)

                            },
                            error: function (msg) {
                                errMessage("请求CheckPassSpanServlet失败");
                            },
                            success: function (json) {
                                if (json.success == "fail") {
                                    switch (json.error) {
                                        case 1:
                                            errMessage("出错！");
                                            break;
                                        case 2:
                                            errMessage("出错！");
                                            break;
                                        default:
                                            break;
                                    }
                                } else {
                                    //successMessage("添加成功")
                                    info2.defect_photo = json.obj.path;
                                    info2.defect_id = json.obj.defect_id;
                                    info2.defect_serial = json.obj.defect_serial;
                                    info2.repair_state = '0';
                                    data.defects.push(info2);
                                    table.row(dom).data(data).draw(false);
                                    row.child(format(data)).show();
                                    $("#defectDialog").dialog("close");
                                    changeChkState();
                                    if (saveAndAdd) {
                                        selectDefect = {};
                                        selectDefect.defect_f_name = $('#defect_f').val();
                                        selectDefect.defect_name = $('#defect').val();
                                        selectDefect.defect_location_desc_val = info2.defect_location_desc_val;
                                        selectDefect.defect_count_val = info2.defect_count_val;
                                        selectDefect.chk_defect_memo = info2.chk_defect_memo;
                                        selectDefect.defect_attr = info2.defect_attr;
                                        dom.find('.add').click();
                                    } else {
                                        selectDefect = undefined;
                                    }
                                    saveAndAdd = false;
                                }
                            }
                        });
                    }
                },
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存并添加",
                    "class": "btn btn-default",
                    click: function () {
                        saveAndAdd = true;
                        sad = true;
                        $('.save').click();
                    }
                },
                {
                    html: "<i class='fa fa-times'></i>&nbsp; 取消",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                        selectDefect = undefined;
                        saveAndAdd = false;
                    }
                }
            ]
        });
    });


    var selectDefect = undefined;
    var saveAndAdd = false;


    $('#dt_basic').delegate('.edit2', 'click', function () {

    	$("#develop_state input").each(function(){
    		$(this).removeAttr('checked');
    	});
        dom = $(this).closest('table').closest('tr').prev('tr');
        tr = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(tr);
        var data = table.row(dom).data();
        tableData = data;
        var id = $(this).closest('tr').children('td').eq(0).html();
        var de = $(this).closest('tr').children('td').eq(1).html();
        var ph = $(this).closest('tr').children('td').eq(5).children('a').attr('data-src');
        var defectData;
        for (var i = 0; i < data.defects.length; i++) {
            if (data.defects[i].defect_serial == id) {
                defectData = data.defects[i];
                break;
            }
        }
        $.ajax({
            type: 'POST',
            url: '../CheckPassSpanServlet',
            dataType: 'json',
            data: {
                type: "getDefect",
                component_name: data.component_name,
                defect_name: de,
                defect_name_f: defectData.defect_name_f
            },
            error: function (msg) {
                errMessage("请求CheckPassSpanServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("出错！");
                            break;
                        case 2:
                            errMessage("出错！");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data2 = json.obj;
                    defect_f = {};
                    defect_f_list = [];
                    for (var i = 0; i < data2.length; i++) {
                        defect_f[data2[i].defect_f_id] = data2[i];
                        var df = {};
                        df.defect_f_id = data2[i].defect_f_id;
                        df.defect_f_name = data2[i].defect_f_name;
                        defect_f_list.push(df);
                    }
                    buildDefect_f();
                    $('#develop_state input[value="' + defectData.develop_state + '"]').prop('checked', 'checked');
                    $('#defect_photo').val("ph");
                    //$('#img').prop('src',encodeURI('../ImageDownLoadServer?path='+ph));
                    //$('#defect_photo').val(ph);
                    $('#chk_defect_memo').val(defectData.chk_defect_memo);
                    //$('#defect_photo_memo').val(defectData.defect_photo_memo);
                    //TODO: 生成图片节点
                    //data-new="1"代表新节点。data-del="0"代表是否删除
                    var dom;
                    var preImgs = defectData.photos;
                    $('#photo_area').empty();
                    for (var i = 0; i < preImgs.length; i++) {
                        dom = $('<div data-new="0" data-del="0"  class="photo thumbnail col-lg-12" >' +
                            '<div class="load" style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50% ;">' +
                            '<img src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">' +
                            '</div>' +
                            '<img style="height: 200px" alt="" src=""  class="img" onload="imgLoadSuccess(this)" >' +
                            '<label class="photo_name"></label>&nbsp&nbsp<a class="btn btn-default btn-xs" onclick="removeImg(this);">删除图片</a>' +
                            '<input type="text" class="photo_path" style="display: none;">' +
                            '<input type="text" class="photo_id" style="display: none;">' +
                            '</div>');

                        dom.find('.img').prop('src', encodeURI('../ImageDownLoadServer?path=' + preImgs[i].photo_path + '&' + Math.random()));
                        dom.find('.photo_path').val(preImgs[i].photo_path);
                        dom.find('.photo_name').html(preImgs[i].photo_name);
                        dom.find('.photo_id').val(preImgs[i].photo_id);
                        $('#photo_area').append(dom);
                        reSetPhotoName();

                    }
                    setDefectVal(defectData.defect_location_desc_val, defectData.defect_count_val);
                    setDefectAttr(defectData.defect_attr);
                    $('#defectDialog').dialog('open');
                }
            }
        });

        $('#defectDialog').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 修改",
                    "class": "btn btn-default",
                    click: function () {
                        var info2 = {
                            defect_serial: "",
                            defect_id: "",
                            mbr_chk_id: "",
                            mbr_no: "",
                            defect_name: "",
                            defect_name_f: "",
                            defect_location_desc: "",
                            defect_count: "",
                            defect_photo: "",
                            defect_photo_memo: "",
                            develop_state: $('#develop_state input:checked').val(),
                            defect_attr: getAttrData(),
                            defect_location_desc_val: "",
                            defect_count_val: "",
                            chk_defect_memo: ""
                        }
                        if(info2.develop_state==undefined||info2.develop_state==null||info2.develop_state.trim()==''){
                        	info2.develop_state=0;
                        }
                        var d = defect[$('#defect').val()];
                        info2.defect_serial = id;
                        info2.defect_name = d.defect_name;
                        info2.defect_name_f = $('#defect_f option:selected').html();
                        info2.mbr_chk_id = tableData.mbr_chk_id;
                        info2.mbr_no = tableData.mbr_no;
                        info2.defect_photo = $('#defect_photo').val();
                        info2.defect_photo_memo = $('#defect_photo_memo').val();
                        info2.chk_defect_memo = $('#chk_defect_memo').val();
                        var flag = true;
                        var d1 = [];
                        var d2 = [];
                        $('#defect_loc_def').find('input,select').each(function () {
                            var e = $(this).val();
                            /* if(e==""||e==undefined){
                             flag = false;
                             return;
                             } */
                            d1.push(e);
                        });
                        $('#defect_def').find('input,select').each(function () {
                            var e = $(this).val();
                            /*  if(e==""||e==undefined){
                             flag = false;
                             return;
                             }  */
                            d2.push(e);
                        });
                        if (flag == false) {
                            errMessage("请确认数据完整！");
                            return;
                        }
                        info2.defect_location_desc_val = JSON.stringify(d1);
                        info2.defect_count_val = JSON.stringify(d2);

                        var temAndVal = rebuildTemplet(d.defect_loc_def, d1);
                        d.defect_loc_def = temAndVal.defect_loc_def;
                        d1 = temAndVal.d1;

                        var temAndVal_count = rebuildTemplet(d.defect_def, d2);
                        d.defect_def = temAndVal_count.defect_loc_def;
                        d2 = temAndVal_count.d1;

                        info2.defect_location_desc = d.defect_loc_def.format(d1);
                        info2.defect_count = d.defect_def.format(d2);
                        if (info2.defect_attr != '') {
                            info2.defect_count = info2.defect_count + "，" + info2.defect_attr;
                        }
                        flag = true;
                        if ($('#defect_photo').val() == ph) {
                            flag = false;
                        }

                        //TODO:获取所有病害图片信息并组织成list
                        var addImgList = new Array();//添加图片列表
                        var updateImgList = new Array();//更名图片列表
                        var delIdList = new Array();//删除的photo_id列表

                        $(".photo").each(function () {

                            var newFlag = $(this).attr('data-new');
                            var delFlag = $(this).attr('data-del');

                            if (newFlag == 1 && delFlag == 0) {
                                //新图片
                                var imgObj = new Object();
                                imgObj.photo_path = $(this).find('.photo_path').val();
                                imgObj.photo_name = $(this).find('.photo_name').html();
                                imgObj.photo_date = new Date();
                                addImgList.push(imgObj);

                            }
                            if (newFlag == 0 && delFlag == 1) {
                                //删除的图片
                                var photo_id = $(this).find('.photo_id').val();
                                delIdList.push(photo_id);
                            }

                            if (newFlag == 0 && delFlag == 0) {
                                //改名字
                                var imgObj = new Object();
                                imgObj.photo_id = $(this).find('.photo_id').val();
                                imgObj.photo_name = $(this).find('.photo_name').html();
                                updateImgList.push(imgObj);

                            }
                        });

                        $.ajax({
                            type: 'POST',
                            url: '../CheckPassSpanServlet',
                            dataType: 'json',
                            async: false,
                            data: {
                                type: "editDefect",
                                info: JSON.stringify(info2),
                                bridge_id: data.bridge_id,
                                chk_type: bridgeChk.chk_type,
                                prj_id: bridgeChk.prj_id,
                                flag: flag,
                                ph: ph,
                                saveData: JSON.stringify(getSaveData()),
                                addImgList: JSON.stringify(addImgList),
                                updateImgList: JSON.stringify(updateImgList),
                                delIdList: JSON.stringify(delIdList),
                                mbr_chk_id: info2.mbr_chk_id
                            },
                            error: function (msg) {
                                errMessage("请求CheckPassSpanServlet失败");
                            },
                            success: function (json) {
                                if (json.success == "fail") {
                                    switch (json.error) {
                                        case 1:
                                            errMessage("出错！");
                                            break;
                                        case 2:
                                            errMessage("出错！");
                                            break;
                                        default:
                                            break;
                                    }
                                } else {
                                    //successMessage("修改成功")
                                    // info2.defect_photo = json.obj;

                                    data.defects = json.obj;
                                    /*  for(var i=0;i<data.defects.length;i++){
                                     if(data.defects[i].defect_serial==info2.defect_serial){
                                     info2.repair_state = data.defects[i].repair_state;
                                     data.defects[i]=json.obj;
                                     break;
                                     }
                                     } */
                                    table.row(dom).data(data).draw(false);
                                    row.child(format(data)).show();
                                    $("#defectDialog").dialog("close");
                                    changeChkState();
                                }
                            }
                        });
                    }
                },
                {
                    html: "<i class='fa fa-times'></i>&nbsp; 取消",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]
        });
    });

    
    var locations;
	var defectName;
    $('#dt_basic').delegate('.sendMeg', 'click', function () {
    	$("#userName").html('');
    	var aaa=$($(this).parent().parent()).find("td")[2];
    	var bbb=$($(this).parent().parent()).find("td")[3];
    	locations=$(aaa).text();
    	defectName=$(bbb).text();
    	$.ajax({
    		type: 'POST',
            url: '../CheckSpanServlet',
            dataType: 'json',
            data: {
                type: "sendManOfPass"
            },
            error: function (msg) {
                errMessage("请求CheckSpanServlet失败");
            },
            success:function(json){
            	for(var i=0;i<json.obj.length;i++){
	            	$("#userName").append("<option value='"+json.obj[i]+"'>"+json.obj[i]+"</option>");
            	}
            	$("#userName").select2();
            }
    	});
    	$('#sendMessage').dialog('open');
    });

    $('#dt_basic').delegate('.rep', 'click', function () {
        var bt = $(this);
        dom = $(this).closest('table').closest('tr').prev('tr');
        tr = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(tr);
        var sta = undefined;
        var id = $(this).closest('tr').children('td').eq(0).html();
        var mess = "";
        if (bt.html() == "未修复") {
            mess = "确认该病害已经修复吗";
            sta = "1";
        } else {
            mess = "确认该病害已经破损吗";
            sta = "0";
        }

        $.SmartMessageBox({
            title: "修改提示",
            content: mess,
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                if (sta != undefined) {
                    var data = table.row(dom).data();
                    $.ajax({
                        type: 'POST',
                        url: '../CheckPassSpanServlet',
                        dataType: 'json',
                        data: {
                            type: "changeRepState",
                            id: id,
                            state: sta
                        },
                        error: function (msg) {
                            errMessage("请求CheckPassSpanServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("出错！");
                                        break;
                                    case 2:
                                        errMessage("出错！");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                                //successMessage("修改成功")
                                for (var i = 0; i < data.defects.length; i++) {
                                    if (data.defects[i].defect_serial == id) {
                                        data.defects[i].repair_state = sta;
                                        break;
                                    }
                                }
                                table.row(dom).data(data).draw(false);
                                row.child(format(data)).show();
                                changeChkState();
                            }
                        }
                    });
                }
            }
        });
    });

    $('#dt_basic').delegate('.dev', 'click', function () {
        var bt = $(this);
        dom = $(this).closest('table').closest('tr').prev('tr');
        tr = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(tr);
        var sta = undefined;
        var id = $(this).closest('tr').children('td').eq(0).html();
        var mess = "";
        if (bt.html() == "未发展") {
            mess = "确认该病害已经发展吗";
            sta = "1";
        } else {
            mess = "确认该病害已经修复吗";
            sta = "0";
        }

        $.SmartMessageBox({
            title: "修改提示",
            content: mess,
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                if (sta != undefined) {
                    var data = table.row(dom).data();
                    $.ajax({
                        type: 'POST',
                        url: '../CheckPassSpanServlet',
                        dataType: 'json',
                        data: {
                            type: "changeDevState",
                            id: id,
                            state: sta
                        },
                        error: function (msg) {
                            errMessage("请求CheckPassSpanServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("出错！");
                                        break;
                                    case 2:
                                        errMessage("出错！");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                                //successMessage("修改成功")
                                for (var i = 0; i < data.defects.length; i++) {
                                    if (data.defects[i].defect_serial == id) {
                                        data.defects[i].develop_state = sta;
                                        break;
                                    }
                                }
                                table.row(dom).data(data).draw(false);
                                row.child(format(data)).show();
                                changeChkState();
                            }
                        }
                    });
                }
            }
        });
    });


    $('#dt_basic').delegate('.del2', 'click', function () {
        dom = $(this).closest('table').closest('tr').prev('tr');
        tr = $(this).closest('table').closest('tr').prev('tr');
        row = table.row(tr);
        var qq = this;
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var data = table.row(dom).data();
                tableData = data;
                var id = $(qq).closest('tr').children('td').eq(0).html();
                var de = $(qq).closest('tr').children('td').eq(1).html();
                var ph = $(qq).closest('tr').children('td').eq(5).children('a').attr('data-src');
                $.ajax({
                    type: 'POST',
                    url: '../CheckPassSpanServlet',
                    dataType: 'json',
                    data: {
                        type: "delDefect",
                        id: id,
                        ph: ph
                    },
                    error: function (msg) {
                        errMessage("请求CheckPassSpanServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    errMessage("出错！");
                                    break;
                                case 2:
                                    errMessage("出错！");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                            //successMessage("删除成功");
                            for (var i = 0; i < data.defects.length; i++) {
                                if (data.defects[i].defect_serial == id) {
                                    data.defects.splice(i, 1);
                                    break;
                                }
                            }
                            table.row(dom).data(data).draw(false);
                            row.child(format(data)).show();
                            changeChkState();
                        }
                    }
                });
            }
        });

    });

    var structMode="pass";
    function sendMsg(){
    	$('#codeTable').html('');
    	console.log(datas);
    	var userList=$("#userName").val();
    	if(userList==null){
    		errMessage("请选择联系人");
    		return;
    	}
    	myTool.mask.show('发送中...');
    	  $.ajax({
            type: 'POST',
            url: '../CheckSpanServlet',
            dataType: 'json',
            data: {
                type: "sendMsg",
                structMode:structMode,
                defectName:defectName,
                locations:locations,
                span_chk_id:datas.span_chk_id,
    			userList:userList.toString(),
            },
            error: function (msg) {
                errMessage("请求CheckSpanServlet失败");
            },
            success:function(json){
            	console.log(json.obj);
            	for(var i=0;i<userList.length;i++){
            		var name=userList[i];
	            	$('#codeTable').append("<tr><td>"+name+"</td><td>"+getState(json.obj[i])+"</td></tr>");
            	}
            	myTool.mask.hide();
            	$('#sendMessage').dialog('close');
            	$('#sendCode').dialog('open');
            }
    	});
    }
    
    
    function getAll(d) {
        var pa = new RegExp('\\[|\\]', 'g');
        var s;
        var i = 0;
        var all = [];
        while ((s = pa.exec(d)) != null) {
            var struct = {
                arr_index: undefined,
                loc_index: undefined,
                val: undefined
            }
            struct.arr_index = i;
            struct.loc_index = pa.lastIndex - 1;
            struct.val = s[0];
            all.push(struct);
            i++;
        }
        return all;
    }

    function getLeft(index, all) {
        for (var i = (all.length - 1); i >= 0; i--) {
            if (all[i].loc_index < index && all[i].val == '[') {
                return all[i];
            }
        }
        return null;
    }

    function getRight(left, all) {
        var count = 0;
        var stack = [];
        stack.push(left);
        var right = left;
        while (stack.length > 0) {
            right = all[right.arr_index + 1];
            if (right.val == stack[stack.length - 1].val) {
                stack.push(right);
            } else {
                stack.pop();
                count++;
            }
        }
        var re = {
            count: count,
            right: right
        }
        return re;
    }


    function rebuildTemplet(defect_loc_def, d1) {
        var patt = new RegExp("\{[^\{\}]*\}", "g");
        var ar = defect_loc_def.match(patt);
        var all = getAll(defect_loc_def);

        if (all.length > 0) {
            for (var i = 0; i < d1.length; i++) {
                if (d1[i] == '') {
                    var index = defect_loc_def.indexOf(ar[i]);
                    var left = getLeft(index, all);
                    if (left != null) {
                        var right = getRight(left, all);
                        var pla = defect_loc_def.substring(left.loc_index, right.right.loc_index + 1);

                        defect_loc_def = defect_loc_def.replace(pla, '');
                        d1.splice(i, right.count);
                        all = getAll(defect_loc_def);
                        ar = defect_loc_def.match(patt);
                        i = 0;
                    }
                }
            }
        }

        var s = {
            defect_loc_def: defect_loc_def.replace(/\[|\]/g, ''),
            d1: d1
        }
        return s;
    }

    function setDefectVal(loc_val, count_val) {
        var i = 0;
        loc_val = JSON.parse(loc_val);
        count_val = JSON.parse(count_val);
        $('#defect_loc_def').find('input,select').each(function () {
            $(this).val(loc_val[i]);
            i++;
        });
        i = 0;
        $('#defect_def').find('input,select').each(function () {
            $(this).val(count_val[i]);
            i++;
        });
    }

    function setDefectAttr(defectAttr) {
        defectAttr = defectAttr.split(',');
        $('#defect_attr').find('input').each(function () {
            var d = $(this).next('span').html();
            if (checkRe(defectAttr, d) == false) {
                $(this).prop('checked', 'checked')
            }
        });
    }
	
    var defReference;
    //生成参照；
    function buildDefReference() {
        defReference = $("<select class='input-xs'></select>");

        $.ajax({
            type: 'POST',
            url: '../CheckPassSpanServlet',
            dataType: 'json',
            data: {
                type: "reference",
                span_no: span.span_no,
                direction: span.direction
            },
            error: function (msg) {
                errMessage("请求CheckPassSpanServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
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
                } else {
                    var ll = json.obj;
                    for (var i = 0; i < ll.length; i++) {
                        defReference.append("<option>" + ll[i] + "</option>");
                    }
                }
                defReference.append("<option>顶板</option>");
                defReference.append("<option>内侧</option>");
                defReference.append("<option>外侧</option>");
                defReference.append("<option>左侧</option>");
                defReference.append("<option>右侧</option>");
                defReference.append("<option>底面</option>");
            }
        });
    }


    var defect = {};//存储病害名称
    var defect_f = {};//存储病害类型
    var defect_f_list = [];
    var defect_variable = {}; //存储变量节点

    function buildDefectDef() {
        var d = $('#defect').val();

// 			$('#defect_photo_memo').val(tableData.member_no+"_"+defect[d].defect_name);

        var data = defect[d];
        var d1 = data.defect_loc_def;
        var d2 = data.defect_def;
        var patt1 = new RegExp("\{[^\{\}]*\}", "g");
        var patt2 = new RegExp("\{[^\{\}]*\}", "i");
        var dd1 = d1.match(patt1);
        var dd2 = d2.match(patt1);
        for (var a in dd1) {
            dd1[a] = dd1[a].replace(/\{|\}/g, '')
        }
        for (var a in dd2) {
            dd2[a] = dd2[a].replace(/\{|\}/g, '')
        }
        d1 = d1.replace(/距/g, '<br>距');
        d1 = d1.replace(/\^2/g, '<sup>2</sup>');
        d1 = d1.replace(/\^3/g, '<sup>3</sup>');
        d1 = d1.replace(/\[|\]/g, '');

        d2 = d2.replace(/\^2/g, '<sup>2</sup>');
        d2 = d2.replace(/\^3/g, '<sup>3</sup>');
        if (dd1 != null) {
            for (var i = 0; i < dd1.length; i++) {
                if (dd1[i] == "参照") {
                    d1 = d1.replace(patt2, defReference.prop('outerHTML'));
                } else {
                    d1 = d1.replace(patt2, "<input type='text' style='width:100px;margin: 0px 5px;' placeholder='" + dd1[i] + "' data-name='" + dd1[i] + "'></input>");
                }
            }
        }
        if (dd2 != null) {
            for (var i = 0; i < dd2.length; i++) {
                d2 = d2.replace(patt2, "<input type='text' style='width:100px;margin: 0px 5px;' placeholder='" + dd2[i] + "' data-name='" + dd2[i] + "'></input>");
            }
        }

        $('#defect_loc_def').empty();
        $('#defect_def').empty();
        $('#defect_loc_def').append(d1);
        $('#defect_def').append(d2);

        var template = JSON.parse(data.defect_template);
        defect_variable = {};
        function setInput(d) {
            var s = $(d).attr('data-name');
            if (s == "构件") {
                $(d).val(tableData.member_no);
                $(d).prop('disabled', 'disabled');
                return;
            }
            if (s == "病害") {
                $(d).val(data.defect_name);
                return;
            }
            var t = getT(template, s);
            if (s != "" && t != undefined) {
                defect_variable[s] = $(d)//存储变量节点;
                if (t.calculate != "") {
                    $(d).prop('placeholder', $(d).prop('placeholder') + "=" + t.calculate);
                    $(d).focus(function () {
                        var z = t.calculate;
                        var variables = getVariable(z);
                        for (var y in variables) {
                            var x = variables[y];
                            if (defect_variable[x].val() == "" && x != t.variable) {
                                errMessage("请完善数据！");
                                $(d).val("");
                                return;
                            }
                            if (defect_variable[x].val() < 0) {
                                errMessage("数据中不能出现负数！");
                                $(d).val("");
                                return;
                            }
                            if (isNaN(defect_variable[x].val())) {
                                errMessage("不合法数据！");
                                $(d).val("");
                                return;
                            }
                            z = z.replace(new RegExp(x, "g"), defect_variable[x].val());
                        }
                        var res = getResult(z);
                        if (res == null) {
                            errMessage("不合法数据！");
                            $(d).val("");
                            return;
                        }
                        $(d).val(formatRes(res));
                    });
                }
                if (t.describe != "") {
                    $(d).prop('placeholder', $(d).prop('placeholder') + "(" + t.describe + ")");
                }
                if (t.describe.indexOf('宽度') >= 0) {
                    if (data.defect_name.indexOf('裂缝') >= 0) {
                        $(d).typeahead(
                            {
                                source: ['0.10', '0.08', '0.12', '0.06', '0.04', '0.15', '0.14', '0.20'],
                                showHintOnFocus: 'all',
                                matcher: function (g) {
                                    return true;
                                },
                                highlighter: function (g) {
                                    return g;
                                }
                            });
                    }
                }
                if (t.save == "1") {
                    $(d).prop('placeholder', $(d).prop('placeholder') + "(存储)");
                }
            }
        }

        $('#defect_loc_def').children('input').each(function () {
            setInput(this);
        });
        $('#defect_def').children('input').each(function () {
            setInput(this);
        });
        $('#defect_attr').empty();
        var attr = data.defect_attr.split(",");
        for (var i = 0; i < attr.length; i++) {
            $('#defect_attr').append("<label class='checkbox-inline'><input type='checkbox' class='checkbox style-0' ><span>" + attr[i] + "</span></label>");
        }


    }

    function formatRes(d) {
        d = d + "";
        var patt = new RegExp('\\.', 'g');
        if (d.match(patt) == null) {
            return d;
        }
        return Number(d).toFixed(1);
    }

    function getVariable(d) {
        var patt = new RegExp("[\\+\\-\\*\\/\\^\(\)]", "g");
        var va = d.split(patt);
        for (var i = 0; i < va.length; i++) {
            if (va[i] == "" || isNaN(va[i]) == false) {
                va.splice(i, 1);
                i--;
            }
        }
        return va;
    }

    function getResult(d) {
        var patt = new RegExp("[\\+\\-\\*\\/\\^\(\)]", "g");
        var va = d.split(patt);
        var flag = true;
        for (var i = 0; i < va.length; i++) {
            if (isNaN(va[i])) {
                return null;
            }
            if (va[i] == "") {
                va.splice(i, 1);
                i--;
            }
        }

        var valueStack = new MyStack();
        var operStack = new MyStack();

        function Count(e) {
            var exp = e;
            var index = 0;// 扫描指针
            var spliceNum = "";// 用来拼接多位数的变量
            while (true) {
                // 取出字符
                var cha = exp.substr(index, 1);
                // 判断cha
                if (operStack.isOper(cha)) {
                    // 是运算符,判断运算符栈是否为空
                    if (operStack.isEmpty()) {
                        // 放入运算符栈
                        operStack.push(cha);
                    } else {
                        if (cha == "(") {
                            operStack.push(cha);
                        } else if (cha == ")") {
                            while (operStack.getTop() != "(" && !operStack.isEmpty() && operStack.PRI(cha) <= operStack.PRI(operStack.getTop())) {
                                // 从数值栈出栈两个数值
                                var num1 = valueStack.pop();
                                var num2 = valueStack.pop();
                                // 再从运算符栈出栈一个运算符
                                var oper = operStack.pop();
                                // 调用计算函数
                                var res = operStack.result(num1, num2, oper);
                                // 把结果放入数值栈
                                valueStack.push(res);
                            }
                            operStack.pop();
                        } else {
                            while (!operStack.isEmpty() && operStack.PRI(cha) <= operStack.PRI(operStack.getTop())) {
                                // 从数值栈出栈两个数值
                                var num1 = valueStack.pop();
                                var num2 = valueStack.pop();
                                // 再从运算符栈出栈一个运算符
                                var oper = operStack.pop();
                                // 调用计算函数
                                var res = operStack.result(num1, num2, oper);
                                // 把结果放入数值栈
                                valueStack.push(res);
                            }
                            operStack.push(cha);
                        }
                    }
                } else {
                    // 是数值，放入数值栈
                    spliceNum = spliceNum + cha;
                    // 先判断是否到了字符串的最后，如果到了，就直接放入数值栈
                    if (index == exp.length - 1) {
                        valueStack.push(spliceNum);
                    } else {
                        // 判断cha字符的下一个字符是数字还是运算符
                        if (operStack.isOper(exp.substr(Number(index) + 1, 1))) {
                            // 如果是运算符，直接入栈
                            valueStack.push(spliceNum);
                            spliceNum = "";
                        } else {
                            // 如果是数字，则不做处理,继续循环拼接全部数字
                        }
                    }
                }
                // 让扫描指针指向下一个字符
                index++;
                // 判断是否扫描完毕,扫描完毕，break.
                if (index == exp.length) {
                    break;
                }

            }
            // 如果运算符栈不为空就一直计算
            while (!operStack.isEmpty()) {
                // 从数值栈出栈两个数值
                var num1 = valueStack.pop();
                var num2 = valueStack.pop();
                // 再从运算符栈出栈一个运算符
                var oper = operStack.pop();
                // 调用计算函数
                var res = operStack.result(num1, num2, oper);
                // 把结果放入数值栈
                valueStack.push(res);
            }
            // 在退出循环后，数值栈中留下的数值，就是最终结果
            return valueStack.getTop();
        }

        return Count(d);
    }

    function getT(template, s) {
        for (var i = 0; i < template.length; i++) {
            if (template[i].variable == s) {
                return template[i];
            }
        }
        return undefined;
    }

    function MyStack() {
        this.stackTop = -1;// 栈的指针
        this.stackSize = 50;// 栈的容量
        this.stack = new Array();
        // 入栈操作
        this.push = function (val) {
            if (this.stackTop == this.stackSize - 1) {
                alert("栈已经满了");
            }
            this.stackTop++;
            this.stack[this.stackTop] = val;
        }
        // 出栈操作
        this.pop = function () {
            if (this.stackTop == -1) {
                alert("栈内没有数据");
            }
            var stackTopVal = this.stack[this.stackTop];
            this.stackTop--;
            return stackTopVal;
        }
        // 显示栈内的数据
        this.show = function () {
            if (this.stackTop == -1) {
                alert("栈内没有数据");
            }
            for (var i = this.stackTop; i > -1; i--) {
                alert(this.stack[i]);
            }
        }
        // 判断当前字符是数值还是运算符
        this.isOper = function (cha) {
            if (cha == "+" || cha == "-" || cha == "*" || cha == "/" || cha == "(" || cha == ")" || cha == "^") {
                return true;
            } else {
                return false;
            }
        }
        // 判断栈是否为空
        this.isEmpty = function () {
            if (this.stackTop == -1) {
                return true;
            } else {
                return false;
            }
        }
        // 获取运算符的优先级
        this.PRI = function (cha) {
            if (cha == "*" || cha == "/") {
                return 2;
            } else if (cha == "+" || cha == "-") {
                return 1;
            } else if (cha == "^") {
                return 3;
            } else if (cha == "(") {
                return 0;
            } else if (cha == ")") {
                return 0;
            }
        }
        // 获取栈顶的字符
        this.getTop = function () {
            return this.stack[this.stackTop];
        }
        // 计算函数
        this.result = function (num1, num2, oper) {
            var res = 0;
            switch (oper) {
                case '+':
                    res = Number(num2) + Number(num1);// 数据必须先要转换
                    break;
                case '-':
                    res = Number(num2) - Number(num1);
                    break;
                case '*':
                    res = Number(num2) * Number(num1);
                    break;
                case '/':
                    res = Number(num2) / Number(num1);
                    break;
                case '^':
                    res = Math.pow(num2, num1);
                    break;
            }
            return res;
        }
    }

    function getSaveData() {
        var d = $('#defect').val();
        var data = defect[d];
        var template = JSON.parse(data.defect_template);
        var re = [];

        function setRes(q) {
            var name = $(q).attr('data-name');
            if (name != "") {
                var t = getT(template, name);
                if (t != undefined) {
                    if (t.save == "1") {
                        var val = $(q).val();
                        var defect_count = {
                            struct_id: info.id,
                            chk_id: bridgeChk.chk_id,
                            member_no: tableData.mbr_no,
                            defect_id: d,
                            defect_record: undefined,
                            defect_record_val: undefined,
                            defect_record_type: undefined
                        }
                        defect_count.defect_record = t.describe;
                        defect_count.defect_record_val = val;
                        defect_count.defect_record_type = t.type;
                        re.push(defect_count);
                    }
                }
            }
        }

        $('#defect_loc_def input').each(function () {
            setRes(this);
        });
        $('#defect_def input').each(function () {
            setRes(this);
        });
        return re;
    }

    function getAttrData() {
        var attrs = [];
        $('#defect_attr').find('input:checked').each(function () {
            attrs.push($(this).next('span').html());
        });
        return attrs.toString();
    }

    
    function getState(data){
    	if(data=='OK'){
    		return "<p style='color:green'>发送成功</p>";
    	}else if(data=='isv.OUT_OF_SERVICE'){
    		return "<p style='color:red'>发送失败(业务停机)</p>";
    	}else if(data=='isv.PRODUCT_UN_SUBSCRIPT'){
    		return "<p style='color:red'>发送失败(未开通云通信)</p>";
    	}else if(data=='isv.PRODUCT_UNSUBSCRIBE'){
    		return "<p style='color:red'>发送失败(产品未开通)</p>";
    	}else if(data=='isv.ACCOUNT_NOT_EXISTS'){
    		return "<p style='color:red'>发送失败(账户不存在)</p>";
    	}else if(data=='isv.ACCOUNT_ABNORMAL'){
    		return "<p style='color:red'>发送失败(账户异常)</p>";
    	}else if(data=='isv.SMS_TEMPLATE_ILLEGAL'){
    		return "<p style='color:red'>发送失败(短信模板不合法)</p>";
    	}else if(data=='isv.SMS_SIGNATURE_ILLEGAL'){
    		return "<p style='color:red'>发送失败(短信签名不合法)</p>";
    	}else if(data=='isv.INVALID_PARAMETERS'){
    		return "<p style='color:red'>发送失败(参数异常)</p>";
    	}else if(data=='isp.SYSTEM_ERROR'){
    		return "<p style='color:red'>发送失败(系统错误)</p>";
    	}else if(data=='isv.MOBILE_NUMBER_ILLEGAL'){
    		return "<p style='color:red'>发送失败(非法手机号)</p>";
    	}else if(data=='isv.MOBILE_COUNT_OVER_LIMIT'){
    		return "<p style='color:red'>发送失败(手机号码数量超过限制)</p>";
    	}else if(data=='isv.TEMPLATE_MISSING_PARAMETERS'){
    		return "<p style='color:red'>发送失败(模板缺少变量)</p>";
    	}else if(data=='isv.BUSINESS_LIMIT_CONTROL'){
    		return "<p style='color:red'>发送失败(业务限流)</p>";
    	}else if(data=='isv.INVALID_JSON_PARAM'){
    		return "<p style='color:red'>发送失败(JSON参数不合法)</p>";
    	}else if(data=='isv.BLACK_KEY_CONTROL_LIMIT'){
    		return "<p style='color:red'>发送失败(黑名单管控)</p>";
    	}else if(data=='isv.PARAM_LENGTH_LIMIT'){
    		return "<p style='color:red'>发送失败(参数超出长度限制)</p>";
    	}else if(data=='isv.PARAM_NOT_SUPPORT_URL'){
    		return "<p style='color:red'>发送失败(不支持URL)</p>";
    	}else if(data=='isv.AMOUNT_NOT_ENOUGH'){
    		return "<p style='color:red'>发送失败(账户余额不足)</p>";
    	}else if(data=='非工作时间,明天自动发送'){
    		return "<p style='color:blue'>非工作时间,明天自动发送</p>";
    	}else{
    		return "<p style='color:red'>发送失败</p>";
    	}
    }

    function buildDefect_f() {
        $('#defect_f').empty();
        for (i = 0; i < defect_f_list.length; i++) {
            $('#defect_f').append("<option value='" + defect_f_list[i].defect_f_id + "'>" + defect_f_list[i].defect_f_name + "</option>");
        }
        buildDefect();
    }
    function buildDefect() {
        var defect_f_id = $('#defect_f').val();
        var data2 = defect_f[defect_f_id].defects;
        $('#defect').empty();
        defect = {};
        for (var i = 0; i < data2.length; i++) {
            $('#defect').append("<option value='" + data2[i].defect_id + "'>" + data2[i].defect_name + "</option>");
            defect[data2[i].defect_id] = data2[i];
        }
        buildDefectDef();
    }

    String.prototype.format = function () {
        if (arguments.length == 0) return this;
        var d = arguments[0];
        for (var s = this, i = 0; i < d.length; i++) {
            s = s.replace(new RegExp("\{[^\{\}]*\}", "i"), d[i]);
        }
        return s;
    };


    //图片
    var preImg = "*";
    function imgUpLoad() {
        var imgName = $('#imgFile').val();
        if (imgName == "") {
            return;
        }
        var suff = suffix(imgName.toUpperCase());
        if (!(suff == ".JPG" || suff == ".PNG" || suff == ".BMP" || suff == ".JPEG")) {
            errMessage("请选择正确格式的图片文件！");
            return;
        }
// 			$('#load').prop('hidden',false);
// 			$('#img').on('mousedown',function(){
// 				return false;
// 			});
        $('#defectDialog').next('div').find('button').eq(0).prop('disabled', true);
        $('#defectDialog').next('div').find('button').eq(1).prop('disabled', true);
        var url;
        if (navigator.userAgent.indexOf("MSIE") >= 1) { // IE
            url = document.getElementById('imgFile').value;
        } else if (navigator.userAgent.indexOf("Firefox") > 0) { // Firefox
            url = window.URL.createObjectURL(document.getElementById('imgFile').files.item(0));
        } else if (navigator.userAgent.indexOf("Chrome") > 0) { // Chrome
            url = window.URL.createObjectURL(document.getElementById('imgFile').files.item(0));
        }
        document.getElementById('cropperImg').src = url;
// 			$('#cropperImg').prop('src',encodeURI('../ImageDownLoadServer?path='+json.obj+'&'+Math.random()));
        $('#cropper').dialog('open');

        $('#cropperImg').cropper({
            aspectRatio: 8 / 6,
            viewMode: 1,
            dragMode: "move",
        });

// 			$('#f2').ajaxSubmit({
// 				headers:{
// 					suff: suff
// 				},
// 				dataType:'json',
// 				success:function(json){

// 					$('#cropperImg').prop('src',encodeURI('../ImageDownLoadServer?path='+json.obj+'&'+Math.random()));
// 					$('#cropper').dialog('open');

// 					$('#cropperImg').cropper({
// 						  aspectRatio: 8 / 6,
// 						  viewMode: 1,
// 						  dragMode: "move",
// 					});

// 				},
// 				error:function(json){
// 					errMessage("上传错误")
// 				}
// 			});
    }


    function imgLoadSuccess(d) {
// 			$('#load').prop('hidden','hidden');
// 			$('#img').off('mousedown');
        $('#defectDialog').next('div').find('button').eq(0).prop('disabled', false);
        $('#defectDialog').next('div').find('button').eq(1).prop('disabled', false);
        $(d).closest('.photo').find('.load').hide();
        $('#imgFile').val('');
    }


    function suffix(file_name) {
// 		    var result =/\.[^\.]+/.exec(file_name);
        return file_name.substring(file_name.lastIndexOf('.'));
    }

    function lookImg(d) {

        var serial = $(d).attr('data-serial');
        console.log(serial);
        var photos = new Array();
        $.ajax({
            type: 'POST',
            url: '../CheckPassSpanServlet',
            dataType: 'json',
            async: false,
            data: {
                type: "lookImgBySerial",
                serial: serial
            },
            error: function (msg) {
                errMessage("请求CheckSpanServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    errMessage("出错！");
                } else {
                    photos = json.obj;
                }
            }
        });

        /* if(path==""||path==undefined){
         errMessage("暂无图片");
         return;
         } */
         $('#lookImg_area').empty();
         for (var i = 0; i < photos.length; i++) {
             var dom = $('<div class="photo thumbnail col-lg-12" >'
                 + '<div style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50% ;">'
                 + '<img class="load" src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">'
                 + '</div>'
                 + '<img style="height: 200px" alt="" src="" class="img" onload="$(this).closest(\'.photo\').find(\'.load\').hide();" >'
                 + '<label class="photo_name"></label><a class="download btn btn-default btn-xs" href="" >下载图片</a>'
                 + '<input type="text" class="photo_path" style="display: none;">'
                 + '<input type="text" class="photo_id" style="display: none;">'
                 + '</div>');
             console.log(photos);
             dom.find('.img').prop(
                 'src',
                 encodeURI('../ImageDownLoadServer?path='
                     + photos[i].photo_path + '&' + Math.random()));
             dom.find('.download').prop(
                 'href',
                 encodeURI('../ImageDownLoadServer?path='
                     + photos[i].photo_path + '&' + Math.random()));

             dom.find('.photo_path').val(photos[i].photo_path);
             dom.find('.photo_name').html(photos[i].photo_name);
             dom.find('.photo_id').val(photos[i].photo_id);
             $('#lookImg_area').append(dom);

         }

        $('#lookImg').dialog('open');
    }


    /************************************************ 生成表格结构 ************************************************/
    var editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
    var table = $('#dt_basic').DataTable({
        "sDom": "t" +
        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "bDestroy": true,
        "iDisplayLength": 10,
        "autoWidth": true,
        "bScrollCollapse": true,
        "sScrollY": 400,
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        },
        "columns": [
            {
                "class": 'details-control',
                "orderable": false,
                "data": null,
                "defaultContent": ''
            },
            {"data": "component_name"},
            {"data": "member_name"},
            {"data": "member_no"},
            {"data": null},
            {"data": null},
        ],
        "columnDefs": [
            {
                "targets": 4,
                "searchable": false,
                "render": function (data, type, full) {
                    return "共计" + data.defects.length + "个病害";
                }
            }, {
                "targets": 5,
                "searchable": false,
                "render": function (data, type, full) {
                    return editDel;
                }
            }],
        "order": [[1, 'asc']],
        "oLanguage": { //国际化配置
            "sProcessing": "正在获取数据，请稍后...",
            "sLengthMenu": "显示 _MENU_ 条",
            "sZeroRecords": "查询不到相关数据",
            "sInfo": "从 _START_ 到  _END_ 条记录 总记录数为 _TOTAL_ 条",
            "sInfoEmpty": "记录数为0",
            "sInfoFiltered": "(全部记录数 _MAX_ 条)",
            "sInfoPostFix": "",
            "sSearch": "搜索",
            "sUrl": "",
            "oPaginate": {
                "sFirst": "第一页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "sLast": "最后一页"
            }
        }
    });
    var tr = undefined;
    var row = undefined;
    $('#dt_basic tbody').on('click', 'td.details-control', function () {
        tr = $(this).closest('tr');
        row = table.row(tr);
        dom = $(this).parents('tr');

        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child(format(row.data())).show();
            tr.addClass('shown');
        }
    });

    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
    });
    var tableData = {
        "mbr_chk_id": undefined,
        "span_chk_id": undefined,
        "bridge_id": undefined,
        "direction": undefined,
        "span_no": undefined,
        "distr_name": undefined,
        "component_name": undefined,
        "member_no": undefined,
        "member_name": undefined,
        "defects": []
    }
    var defect = {
        "defect_serial": undefined,
        "defect_id": undefined,
        "mbr_chk_id": undefined,
        "mbr_no": undefined,
        "defect_name": undefined,
        "defect_location_desc": undefined,
        "defect_count": undefined,
        "repair_state": undefined,
        "develop_state": undefined,
        "defect_photo": undefined,
        "operation": "<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>"
    }


    function formatRepair(d) {
        if (d == "0") {
            return "<button class='rep label label-danger' " + control + ">未修复</button>";
        } else {
            return "<button class='rep label label-success' " + control + ">已修复</button>";
        }
    }

    function formatDevelop(d) {
        if (d == "0") {
            return "<button class='label label-success' " + control + ">未发展</button>";
        } else if (d == "1") {
            return "<button class='label label-danger' " + control + ">已发展</button>";
        } else {
            return "<button class='label label-info' " + control + ">新增</button>";
        }
    }

    var editDel2 = "<button class='edit2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs' disabled><i class='glyphicon glyphicon-trash'></i></button>";
    var control = "disabled";
    var datas;
    function format(d) {
        var html = "";
        datas=d;
        if (d != undefined) {
            for (var i = 0; i < d.defects.length; i++) {
                var defect_location_desc = d.defects[i].defect_location_desc;
                defect_location_desc = defect_location_desc.replace(/\^2/g, '<sup>2</sup>');
                defect_location_desc = defect_location_desc.replace(/\^3/g, '<sup>3</sup>');
                var defect_count = d.defects[i].defect_count;
                defect_count = defect_count.replace(/\^2/g, '<sup>2</sup>');
                defect_count = defect_count.replace(/\^3/g, '<sup>3</sup>');
                var photo = "<a style='cursor:pointer'  data-memo='"
                    + d.defects[i].defect_photo_memo + "' data-src='"
                    + d.defects[i].defect_photo + "'data-serial='"
                    + d.defects[i].defect_serial
                    + "' onclick='lookImg(this)'>查看</a>";
                var serial = d.defects[i].defect_serial;
                var photos = new Array();
                $.ajax({
                    type: 'POST',
                    url: '../CheckPassServlet',
                    dataType: 'json',
                    async: false,
                    data: {
                        type: "lookImgBySerial",
                        serial: serial
                    },
                    error: function (msg) {
                        errMessage("请求CheckSpanDailyServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            errMessage("出错！");
                        } else {
                            photos = json.obj;
                        }
                    }
                });
                if (photos.length == 0) {
                    photo = "<a style='color: red;' data-src=''>无图</a>"
                }
              /*   var photo = "<a style='cursor:pointer'  data-memo='" + d.defects[i].defect_photo_memo + "' data-src='" + d.defects[i].defect_photo + "'data-serial='" + d.defects[i].defect_serial + "' onclick='lookImg(this)'>查看</a>";

                if (d.defects[i].defect_photo == "" || d.defects[i].defect_photo == undefined) {
                    photo = "<a style='color: red;' data-src=''>无图</a>"
                } */

                html = html + "<tr><td hidden='hidden'>" + d.defects[i].defect_serial + "</td><td>" + d.defects[i].defect_name + "</td><td>" + defect_location_desc + "</td><td>" + defect_count + "</td><td>" + d.defects[i].defect_attr + "</td><td>" + photo + "</td><td>" + formatRepair(d.defects[i].repair_state) + "</td><td>" + formatDevelop(d.defects[i].develop_state) + "</td><td>" + d.defects[i].chk_defect_memo + "</td><td style='width: 120px'>" + editDel2 + "</td></tr>";
            }
        }

        return '<div style="margin:10px"><table class="table table-striped table-bordered table-hover table-condensed text-align-center">' +
            "<thead><tr><th> 病害名称</th><th> 缺损位置</th><th>缺损状况</th><th>附加信息</th><th>照片</th><th style='width: 50px;'>修复状态</th><th style='width: 50px;'>发展状态</th><th> 病害备注</th><th> 操作</th></tr></thead><tbody>" +
            html +
            '</tbody></table></div>';
    }


    function errMessage(info) {
        $.smallBox({
            title: "处理信息",
            content: "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 3000
        });
    }

    function successMessage(info) {
        $.smallBox({
            title: "处理信息",
            content: "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
            color: "#659265",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 3000
        });
    }


    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.hash.substr(1).match(reg);
        if (r != null) return decodeURI(r[2]);
        return null;
    }

    function releaseAdmin() {//管理员

    }
    function releaseManage() {//项目负责人
     //   releaseMember();
        if(info.prj_state==0){
    		$('.widget-body-toolbar a').eq(0).removeClass('disabled');
            $('.widget-body-toolbar a').eq(1).removeClass('disabled');
            editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs'><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
            editDel2 = "<button class='sendMeg btn btn-warning btn-xs'><span class='glyphicon glyphicon-envelope'></span></button>&nbsp;<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>";
            control = "";
    	}
    }
    function releaseMember() {//项目参与人
    	 if(info.prj_state==0){
    		 $('.widget-body-toolbar a').eq(0).removeClass('disabled');
    	        $('.widget-body-toolbar a').eq(1).removeClass('disabled');
    	        editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs'><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
    	        editDel2 = "<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>";
    	        control = "";
    	 }
    }
    function releaseGuest() {//普通用户

    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
    	 if(info.prj_state==0){
    		 $('.widget-body-toolbar a').eq(0).removeClass('disabled');
    	        $('.widget-body-toolbar a').eq(1).removeClass('disabled');
    	        editDel = "<div class='text-align-center'><button class='add btn btn-warning btn-xs'><span class='glyphicon glyphicon-plus'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
    	        editDel2 = "<button class='edit2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-pencil'></i></button>&nbsp;<button class='del2 btn btn-warning btn-xs'><i class='glyphicon glyphicon-trash'></i></button>";
    	        control = "";
    	 }
		}
	
	}


    function changeChkState() {
        if (bridgeChk.audit_state == '1' || span.chk_state == '1') {
            $.ajax({
                type: 'POST',
                url: '../CheckPassSpanServlet',
                dataType: 'json',
                data: {
                    type: "changeChkState",
                    chk_id: bridgeChk.chk_id,
                    prj_id: bridgeChk.prj_id,
                    span_chk_id: span.span_chk_id,
                    audit_state: bridgeChk.audit_state
                },
                error: function (msg) {
                    errMessage("请求CheckBridgeServlet失败");
                },
                success: function (json) {
                    if (json.success == "fail") {
                        switch (json.error) {
                            case 1:
                                errMessage("出错！");
                                break;
                            case 2:
                                errMessage("出错！");
                                break;
                            case 3:
                                errMessage("出错！");
                                break;
                            case 4:
                                errMessage("出错！");
                                break;
                            default:
                                break;
                        }
                    } else {
                        bridgeChk.audit_state = '0';
                        $('.widget-body-toolbar a').eq(0).removeClass('disabled');
                        $('.widget-body-toolbar a').eq(1).removeClass('disabled');
                        span.chk_state = '0';
                        $.cookie("data", JSON.stringify(span));
                    }
                }
            });

        }
    }

    function removeImg(d) {
        //TODO:删除图片
        //当前添加直接删除节点，之前存在则修改data-del="1"，并隐藏节点
        var top = $('#defectDialog').scrollTop();
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该图片吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var $photo = $(d).closest('.photo');
                if ($photo.attr('data-new') == '1') {
                    $photo.remove();
                } else {
                    $photo.hide();
                    $photo.attr('data-del', '1');
                }
                reSetPhotoName();
            }
            $('#defectDialog').scrollTop(top);
        });


// 				$('#img').prop('src',encodeURI('../ImageDownLoadServer?path='));
// 				$('#defect_photo').val('');
// 				$('#defect_photo_memo').val('');
    }

    function reSetPhotoName() {
        var d = $('#defect').val();
        var name = "";
        if (tableData.member_no == '其他') {
            name = defect[d].defect_name;
        } else {
            name = tableData.member_no + defect[d].defect_name;
        }
        var $photo = $('.photo:visible');
        if ($photo.length == 1) {
            $photo.find('.photo_name').html(name);
        } else {
            var i = 1;
            $('.photo:visible').each(function () {
                $(this).find('.photo_name').html(name + '-' + i);
                i++;
            });
        }
    }
</script>


<!-- *****************************************新增病害 ***************************************************** -->
<div id="defectDialog" hidden="hidden" class="row">
    <form class="col-xs-12">
        <fieldset>
            <div class="form-group">
                <label>病害类型</label>
                <select class="form-control input-sm" id="defect_f" onchange="buildDefect()">
                </select>
            </div>
            <div class="form-group">
                <label>病害名称</label>
                <select class="form-control input-sm" id="defect" onchange="buildDefectDef()">
                </select>
            </div>
            <div class="form-group">
                <label>缺损位置</label>
                <div id="defect_loc_def" class="well" style="height: auto"></div>
            </div>
            <div class="form-group">
                <label>缺损状况</label>
                <div id="defect_def" class="well" style="height: auto"></div>
            </div>
            <div class="form-group">
                <label>附加信息</label>
                <div id="defect_attr" class="well" style="height: auto"></div>
            </div>
            <div class="form-group">
                <label>发展状态</label>
                <div id="develop_state" class="well" style="height: auto;padding: 0 5px;'">
                    <div class="form-group">
                        <label class="radio radio-inline" style="vertical-align: bottom;">
                            <input type="radio" class="radiobox" value="2" name="develop_state">
                            <span>新增</span>
                        </label>
                        <label class="radio radio-inline" style="vertical-align: bottom;">
                            <input type="radio" class="radiobox" value="0" name="develop_state">
                            <span>未发展</span>
                        </label>
                        <label class="radio radio-inline" style="vertical-align: bottom;">
                            <input type="radio" class="radiobox" value="1" name="develop_state">
                            <span>已发展</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>病害备注</label>
                <input class="form-control" type="text" id="chk_defect_memo">
            </div>
            <div class="form-group" hidden="hidden">
                <label>病害照片</label>
                <input type="text" id="defect_photo">
            </div>
            <div class="form-group">
                <label>病害照片描述（上传后自动生成）</label>
                <input class="form-control" type="text" id="defect_photo_memo">
            </div>
        </fieldset>
    </form>
    <form id="f2" method="post" enctype="multipart/form-data" action="../ImageUpLoadServer" class="col-xs-12">
        <div class="form-group">
            <label>病害照片（点击下方修改或上传图片）</label>
            <a class="btn btn-default btn-xs" onclick="$('#imgFile').click();">增加图片</a>
            <input type="file" id="imgFile" name="imgFile" style="display: none" onchange="imgUpLoad()"
                   accept="image/*">
            <div id="photo_area" class="thumbnail col-lg-12" style="padding: 10px 20px 10px 20px;text-align: center;">

            </div>
        </div>
    </form>
</div>

<div id="lookImg" class="row" hidden="hidden" style="min-width: 500px">
    <div class="col-xs-12">
        <h5></h5>
        <div id="lookImg_area" class="col-lg-12"
             style="padding: 10px 20px 10px 20px; text-align: center;"></div>
    </div>

    <!-- <div
			style="position: absolute; transform: translate(-50%, -50%); top: 50%; left: 50%;">
			<img src="../img/upload.gif" alt="..." style="width: 100px"
				onmousedown="return false;">
		</div>
		<img alt="" src="" style="width: auto; max-height: 400px"
			onload="$('#lookImg').find('img').eq(0).hide();"> <span
			style="display: none;"></span> -->
</div>

<div id="cropper" hidden="hidden" style="min-width: 600px">
    <img id="cropperImg" alt="" src="" style="width: auto;max-width: 100%;">
</div>

<div id="addMemDialog" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group" hidden="hidden">
                <label>分部结构</label>
                <select class="form-control input-sm select2" id="dis" onchange="disChange()">
                    <option value="无">---分部结构---</option>
                </select>
            </div>
            <div class="form-group">
                <label>部件类型</label>
                <div id="com">

                </div>
            </div>
            <div class="form-group">
                <label>构件类型</label>
                <div id="memType">

                </div>
            </div>
            <div class="form-group">
                <label>构件</label>
                <div id="mem">

                </div>
            </div>
        </fieldset>
    </form>
</div>

<div id="size" style="display: none;width: 8cm;height: 6cm;"></div>

</body>
</html>