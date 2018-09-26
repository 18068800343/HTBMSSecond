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
                            <h2>桥梁检查</h2>

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
                        } else if(oc.getChk_type()==null){
                        %>	
                          <div>
                            <div class="widget-body no-padding">

                                <h4>您好，当前结构下无任何项目。请至 <b>结构</b> 重新选择一个结构物</h4>

                            </div>
                        </div>
                        <%	
                        }else if(!oc.getChk_type().equals("daily")) {
                            if (oc.getMode().equals("bridge")) {
                        %>

                        <div>

                            <!-- widget content -->
                            <div class="widget-body no-padding">

                                <div class="widget-body-toolbar bg-color-white">


                                    <div class="row">

                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <div class="pull-left col-xs-2 pull-left">
                                                <select class="form-control input-sm pull-left"
                                                        onchange="dirChange(this)">
                                                    <option value="">--方向--</option>
                                                    <option>上行</option>
                                                    <option>下行</option>
                                                    <option>无</option>
                                                </select>
                                            </div>
                                            <div class="pull-left col-xs-3 pull-left"><input class="form-control"
                                                                                             id="searchData" value=""
                                                                                             placeholder="搜索"
                                                                                             type="text"></div>
                                            <div id="ddd" class="pull-left"
                                                 style="margin-left: 5px;margin-top: 2px"></div>
                                            <a class="btn btn-warning disabled"
                                               onclick="initPhoto();$('#photo').dialog('open');">
                                                受限
                                            </a>
                                            &nbsp;
                                            <a class="btn btn-warning disabled" onclick="addSpan()">
                                                受限
                                            </a>
                                            &nbsp;
                                            <a class="btn btn-warning disabled" onclick="overCheck()">
                                                受限
                                            </a>
                                             &nbsp;
                                            <a class="btn btn-warning" href="imgMgr.jsp">
                                                图片打包
                                            </a>
                                           
                                        </div>

                                    </div>


                                </div>
                                <!-- *****************************************表格1区域 ***************************************************** -->
                                <table id="dt_basic" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>方向</th>
                                        <th>跨号</th>
                                        <th>桥跨组成</th>
                                        <th>上部结构</th>
                                        <th>下部结构</th>
                                        <th>检查时间</th>
                                        <th>检查天气</th>
                                        <th>气温</th>
                                        <th>附注</th>
                                        <th>意见</th>
                                        <th>病害</th>
                                        <th>检查状态</th>
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
                        } else if (oc.getMode().equals("pass")) {
                        %>
                        <script>location.href = "checkPass.jsp";</script>
                        <%
                        } else if (oc.getMode().equals("culvert")) {
                        %>
                        <script>location.href = "checkCulvert.jsp";</script>
                        <%
                            }
                        %>
                        <script>var info =<%=JSON.toJSONString(oc)%>
                        </script>
                        <%
                            }else{
                        %>
						<script>location.href = "checkDailyBridge.jsp";</script>
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

<div id="photo" hidden="hidden" class="row">
    <form id="f2" method="post" enctype="multipart/form-data" action="../ImageUpLoadServer">
        <div class="form-group col-xs-6">
            <label>正面照（点击下方修改或上传图片）</label>
            <div class="thumbnail col-lg-12">
                <div style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50% ;" id="load"
                     hidden="hidden">
                    <img src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">
                </div>
                <img id="img1" style="height: 200px" alt="" class="pull-center" onload="imgLoadSuccess()"
                     onclick="photo_type='face';$('#imgFile').click()">
            </div>
        </div>
        <div class="form-group col-xs-6">
            <label>立面照（点击下方修改或上传图片）</label>
            <div class="thumbnail col-lg-12">
                <div style="position: absolute;transform: translate(-50%, -50%);top: 50%;left: 50% ;" id="load"
                     hidden="hidden">
                    <img src="../img/upload.gif" alt="..." style="width:100px" onmousedown="return false;">
                </div>
                <img id="img2" style="height: 200px" alt="" class="pull-center" onload="imgLoadSuccess()"
                     onclick="photo_type='facade';$('#imgFile').click()">
            </div>
        </div>
        <input type="file" id="imgFile" name="imgFile" style="display: none" onchange="imgUpLoad()" accept="image/*">
    </form>
</div>

<div id="addSpan" hidden="hidden">
    <form class="col-xs-6">
        <fieldset>
            <div class="form-group">
                <label>方向</label><i class="text-danger">*</i>
                <select class="form-control input-sm select2" id="direction">
                    <option value="0">--方向--</option>
                    <option>上行</option>
                    <option>下行</option>
                    <option>无</option>
                </select>
            </div>
            <div class="form-group">
                <label>跨号</label><i class="text-danger">*</i>
                <div id="span">
                    <select style="width:100%" class="form-control input-sm select2" id="span_no">

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label>桥跨组成</label>
                <input class="form-control" id="span_build" value="" placeholder="详见附注" type="text">
                <span class="input-control-addon" id="show_build">...</span>
            </div>
            
            <div class="form-group">
                <label>上部结构</label><i class="text-danger">*</i>
                <input class="form-control" id="span_top_struct" value="" placeholder="上部结构" type="text">
            </div>
            <div class="form-group">
                <label>下部结构</label><i class="text-danger">*</i>
                <select id="span_down_struct" class="form-control input-sm select2" multiple="multiple"></select>
            </div>
			<div class="form-group" id="record" hidden="hidden">
                <label>检查人</label>
                <input class="form-control" id="record_person" value=""  type="text" readonly="readonly">
                </select>
            </div>

        </fieldset>
    </form>
    <form class="col-xs-6">
        <fieldset>
            <div class="form-group">
                <label>检查时间</label><i class="text-danger">*</i>
                <input class="form-control" id="chk_time" value="" placeholder="检查时间" type="text">
            </div>
            <div class="form-group">
                <label>检查天气</label><i class="text-danger">*</i>
                <select style="width:100%" class="form-control input-sm " id="chk_weather">
                    <option>晴天</option>
                    <option>多云</option>
                    <option>小雨</option>
                    <option>中雨</option>
                    <option>小雪</option>
                </select>
            </div>
            <div class="form-group">
                <label>气温</label><i class="text-danger">*</i>
                <input class="form-control" id="temp" value="" placeholder="气温" type="text">
            </div>
            <div class="form-group">
                <label>附注</label>
                <input class="form-control" id="span_memo" value="" placeholder="附注" type="text">
            </div>
            <div class="form-group">
                <label>意见</label>
                <input class="form-control" id="span_suggestion" value="" placeholder="意见" type="text">
            </div>
            <div class="form-group">
                <label>复核人</label><i class="text-danger">*</i>
                <select style="width:100%" class="form-control input-sm " id="recheck_person">
                </select>
            </div>
        </fieldset>
    </form>
</div>
 <div id="showtip" hidden="hidden">
        <table class="table table-bordered table-striped">
            <tr>
                <th>跨径组成</th>
                <td id="showspan_build"></td>
            </tr>
        </table>
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

<!-- PAGE RELATED PLUGIN(S) -->
<script src="../js/plugin/jquery-form/jquery-form.min.js"></script>
<script src="../js/plugin/select2/select2.min.js"></script>
<script src="../jstree/jstree.min.js"></script>

<script src="check/jquery.datetimepicker.full.min.js"></script>
<script src="../js/jquery.cookie.js"></script>

<script>
    $(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();
        <%if(oc!=null){%>
        checkState();
        <%}%>
    });
    var photo_type;
    var permision = false;
    $('#photo').dialog({
        autoOpen: false,
        width: 800,
        maxHeight: 700,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: '照片',
        buttons: [
            {
                html: "确定",
                "class": "btn btn-default",
                click: function () {
                    $(this).dialog("close");
                }
            }
        ]
    });

    function initPhoto() {
        $.ajax({
            type: 'POST',
            url: '../CheckBridgeServlet',
            dataType: 'json',
            data: {
                type: "initPhoto",
                id: info.id,
                prj_id: info.prj_id
            },
            error: function (msg) {
                errMessage("请求CheckBridgeServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {

                } else {
                    console.log(json);
                    if (json.obj.face == undefined) {
                        json.obj.face = "";
                    }
                    if (json.obj.facade == undefined) {
                        json.obj.facade = "";
                    }
                    $('#img1').prop('src', encodeURI('../ImageDownLoadServer?path=' + json.obj.face));
                    $('#img2').prop('src', encodeURI('../ImageDownLoadServer?path=' + json.obj.facade));
                }
            }
        });
    }

    function imgUpLoad() {
        if (permision == false) {
            errMessage("不允许上传");
            return;
        }
        var imgName = $('#imgFile').val();
        if (imgName == "") {
            return;
        }
        var suff = suffix(imgName.toUpperCase())
        if (!(suff == ".JPG" || suff == ".PNG" || suff == ".BMP" || suff == ".JPEG")) {
            errMessage("请选择正确格式的图片文件！");
            return;
        }
        $('.load').prop('hidden', false);
        $('.img').on('mousedown', function () {
            return false;
        });
        $('#f2').ajaxSubmit({
            headers: {
                suff: suff,
                photo_type: photo_type
            },
            dataType: 'json',
            success: function (json) {
                console.log(json.obj);
                if (photo_type == 'face') {
                    $('#img1').prop('src', encodeURI('../ImageDownLoadServer?path=' + json.obj));
                }
                if (photo_type == 'facade') {
                    $('#img2').prop('src', encodeURI('../ImageDownLoadServer?path=' + json.obj));
                }
                updatePhoto(json.obj, photo_type)
            },
            error: function (json) {
                errMessage("上传错误")
            }
        });
    }

    function updatePhoto(path, photo_type) {
        $.ajax({
            type: 'POST',
            url: '../CheckBridgeServlet',
            dataType: 'json',
            data: {
                type: "updatePhoto",
                id: info.id,
                prj_id: info.prj_id,
                photo_type: photo_type,
                path: path
            },
            error: function (msg) {
                errMessage("请求CheckBridgeServlet失败");
            },
            success: function (json) {
            }
        });
    }

    function suffix(file_name) {
// 		    var result =/\.[^\.]+/.exec(file_name);
        return file_name.substring(file_name.lastIndexOf('.'));
    }

    function imgLoadSuccess() {
        $('.load').prop('hidden', 'hidden');
        $('.img').off('mousedown');
        $('#imgFile1').val('');
        $('#imgFile2').val('');
    }

    //判断状态，是否存在正在进行项目 和 项目下是否存在当前桥梁结构
    var bridgeChk = {
        prj_id: undefined,
        prj_desc: undefined,
        chk_type: undefined,
        chk_id: undefined
    }
    
    
    var audit_state = undefined;
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
                          if (json.obj.audit_state == '1' && join) {
                              //successMessage("您好，当前结构物已完成检查！");
                              $('.widget-body-toolbar a').eq(0).removeClass('btn-warning disabled').addClass('btn-primary').text('照片');
                              $('.widget-body-toolbar a').eq(1).removeClass('btn-warning disabled').addClass('btn-primary').text('选择跨');
                              $('.widget-body-toolbar a').eq(2).removeClass('btn-warning').addClass('btn-success disabled').text('已完成');
                              /*  $('#ddd').append("<span class='label label-primary'>检查已经完成</span>"); */
                          } else {
                              //successMessage("找到正在进行中的检查");
                              /* $('#ddd').append("<span class='label label-success'>检查正在进行中</span>"); */
                          }
                          bridgeChk.prj_id = json.obj.prj_id;
                          bridgeChk.prj_desc = json.obj.prj_desc;
                          bridgeChk.chk_type = json.obj.chk_type;
                          bridgeChk.chk_id = json.obj.chk_id;
                          bridgeChk.audit_state = json.obj.audit_state;
                          if (bridgeChk.audit_state == '2') {
                             $('.widget-body-toolbar a').eq(0).removeClass('btn-warning').addClass('btn-primary').text('照片');
                              $('.widget-body-toolbar a').eq(1).removeClass('btn-warning').addClass('btn-primary').text('选择跨');
                              $('.widget-body-toolbar a').eq(2).removeClass('btn-warning').addClass('btn-info').text('已审核');
                              $('.widget-body-toolbar a').eq(1).addClass('disabled');
                              $('.widget-body-toolbar a').eq(2).addClass('disabled');
                              editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs' ><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
                              audit_state = "2";
                          } else {
                              permision = true;
                          }
                          $('#dt_basic').dataTable().fnClearTable();
                          var spans = json.obj.spans;
                          table.rows.add(spans).draw(false);
                          getSpan();
                          buildPerson();
                          setDownConstruct();
                          $('#span_memo').val(info.span_build);
                      }
                	  
                	  $('#dt_basic').dataTable().fnClearTable();
                      var spans = json.obj.spans;
                      table.rows.add(spans).draw(false);
                	
                }
            }
        });
    }

    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
    });

    var editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
    var table = $('#dt_basic').DataTable({
        "deferRender": true,
        "processing": true,
        "sDom": "t" +
        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "bDestroy": true,
        "iDisplayLength": 10,
        "autoWidth": false,
        "bScrollCollapse": true,
        "sScrollY": 400,
        "oLanguage": {
            "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
        },
        "columns": [
            {"data": "direction"},
            {"data": "span_no"},
            {"data": "span_build"},
            {"data": "span_top_struct"},
            {"data": "span_down_struct"},
            {"data": "chk_time"},
            {"data": "chk_weather"},
            {"data": "temp"},
            {"data": "span_memo","width":"10%"},
            {"data": "span_suggestion"},
            {
                "orderable": false,
                "data": null,
                "defaultContent": "<button class='btn btn-default glyphicon glyphicon-list add'></button>"
            },
            {"data": "chk_state"},
            {"data": null,"width":"80px"}
        ],
        "columnDefs": [
			{
			    "targets": 8,
				"width":"12%",					
			    "searchable": false,
			     "render": function (data, type, full) {
			        if (data.length>8) {
			            return "<span title='"+data+"'>"+data.substring(0,8)+"...</span>";
			        } else {
			            return "<span>"+data+"</span>";
			        }
			    }
			},
            {
                "targets": 11,
                "searchable": false,
                "render": function (data, type, full) {
                    if (data == "0") {
                        return "<span class='label label-danger'>未检查完成</span>";
                    } else {
                        return "<span class='label label-success'>检查完成</span>";
                    }
                }
            }, {
                "targets": 12,
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

    function setVal(data) {
        if (data == undefined) {
            $('#span_build').val('');
            $('#span_top_struct').val('');
            $('#chk_time').val('');
            $('#temp').val('');
            $('#span_memo').val('');
            $('#span_suggestion').val('');
        } else {
            $('#span_build').val(data.span_build);
            //
            $('#span_top_struct').val(data.span_top_struct);
            $('#span_down_struct').val(data.span_down_struct.split(',')).trigger('change');
            $('#chk_time').val(data.chk_time);
            $('#chk_weather').val(data.chk_weather);
            $('#temp').val(data.temp);
            $('#span_memo').val(data.span_memo);
            $('#span_suggestion').val(data.span_suggestion);
            $('#recheck_person').val(data.recheck_person);
            $('#record_person').val(data.record_person);
        }
    }
    $('#showtip').dialog({
        autoOpen: false,
        minWidth: 1000,
        resizable: true,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    $('#dt_basic').delegate('.add', 'click', function () {
        var dom = $(this).closest('tr');
        var data = table.row(dom).data();
        $.cookie("data", JSON.stringify(data));
        $.cookie("autoOpen", "false");
        if(info.chk_type=='daily'){
        	window.location.href = encodeURI("checkSpan3.jsp");
        }else{
        	window.location.href = encodeURI("checkSpan.jsp");
        }
    });

    function showdata(data) {
        $("#showspan_build").text(data);
        $('#showtip').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-times'></i>&nbsp; 取消",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                    }
                }]
        });
        $('#showtip').dialog("open");
    }
    $('#dt_basic').delegate('.edit', 'click', function () {
        var dom = $(this).closest('tr');
        var data = table.row(dom).data();
        console.log(data);
        if(data.span_build.length>10){
        	$("#show_build").click(function(){
        	       showdata(data.span_build);
        	});
        }        

		$('#record').show();
        $('#direction').val(data.direction);
        $('#select2-direction-container').html(data.direction);
        $('#select2-direction-container').prop('title', data.direction);
        $('#direction').prop('disabled', true);
        buildSpan();
        $('#span_no').prop('disabled', true);
        $('#span_no').val(data.span_no).trigger("change");
        setVal(data);
       
        $('#addSpan').dialog({
            title: "修改跨",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info2 = {
                            span_chk_id: data.span_chk_id,
                            chk_id: data.chk_id,
                            direction: data.direction,
                            span_no: data.span_no,
                            span_build: $('#span_build').val(),
                            span_top_struct: $('#span_top_struct').val(),
                            span_down_struct: $('#span_down_struct').val().toString(),
                            span_memo: $('#span_memo').val(),
                            span_suggestion: $('#span_suggestion').val(),
                            chk_time: $('#chk_time').val(),
                            chk_weather: $('#chk_weather').val(),
                            temp: $('#temp').val(),
                            chk_state: data.chk_state,
                            recheck_person: $('#recheck_person').val()
                        }
                        if(audit_state=="2"){
                        	errMessage("已审核，不能修改任何数据");
                        	return;
                        }
                       	
                        for (var s in info2) {

                            if (s == "span_suggestion" || s == 'span_memo') {
                                continue;
                            }
                            if (s == "span_build") {
                                if (info2[s] == "") {
                                    info2[s] = "详见附注";
                                }
                                continue;
                            }
                            if (info2[s] == "") {
                                errMessage("请确认数据完整！");
                                return;
                            }
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../CheckBridgeServlet',
                            dataType: 'json',
                            data: {
                                type: "editSpan",
                                info: JSON.stringify(info2)
                            },
                            error: function (msg) {
                                errMessage("请求CheckBridgeServlet失败");
                            },
                            success: function (json) {
                                if (json.success == "fail") {
                                    switch (json.error) {
                                        case 1:
                                            errMessage("保存失败");
                                            break;
                                        case 2:
                                            errMessage("服务器错误！");
                                            break;
                                        case 3:
                                            errMessage("出错！");
                                            break;
                                        default:
                                            break;
                                    }
                                } else {
                                    //successMessage("修改成功");
                                    table.row(dom).data(info2).draw(false);
                                    $('#addSpan').dialog('close');
                                    changeState();
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

        $('#addSpan').dialog('open');
    });


    $('#dt_basic').delegate('.del', 'click', function () {
        var dom = $(this).parents('tr');
        var data = table.row(dom).data();
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../CheckBridgeServlet',
                    dataType: 'json',
                    data: {
                        type: "delSpan",
                        span_chk_id: data.span_chk_id
                    },
                    error: function (msg) {
                        errMessage("请求CheckBridgeServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    errMessage("删除失败");
                                    break;
                                case 2:
                                    errMessage("服务器错误！");
                                    break;
                                case 3:
                                    errMessage("出错！");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                            //successMessage("删除成功");
                            table.row(dom).remove().draw(false);
                            changeState();
                        }
                    }
                });
            }
        });
    });


    $('#direction').on('change', function () {
        buildSpan();
    });


    var spanInfo = {
        "上行": [],
        "下行": [],
        "无": [],
        "0": []
    }

    function buildSpan() {
        var d = $('#direction').val();
        var data = spanInfo[d];
        $('#span').empty();
        $('#span').append("<select style='width:100%' class='form-control input-sm select2'  id='span_no'></select>");
         for (var i = 0; i < data.length; i++) {
             $('#span_no').append("<option value="+data[i].span_no+">" + data[i].span_no + "</option>");
        } 
         
        $('#span_no').select2();
        setTopConstruct();
        $('#span_no').change(function () {
            setTopConstruct();
            var no = $('#span_no').val();
            if (no != '1') {
                var tdata = table.data();
                for (var i = 0; i < tdata.length; i++) {
                    if (tdata[i].direction == d && tdata[i].span_no == (Number(no) - 1)) {
                        setVal(tdata[i]);
                        return;
                    }
                }
                setVal();
            }
            setVal();
        });
        $('#span_no').trigger('change'); 
    }


    function getSpan() {
        $.ajax({
            type: 'POST',
            url: '../CheckBridgeServlet',
            dataType: 'json',
            data: {
                type: "getSpan",
                bridge_id: info.id
            },
            error: function (msg) {
                errMessage("请求CheckBridgeServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            //successMessage("不存在跨！");
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
                        spanInfo[data[i].direction].push(data[i]);
                    }
                }
            }
        });
    }


    $('#addSpan').dialog({
        autoOpen: false,
        width: 800,
        maxHeight: 700,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: '选择跨'
    });
    $('#addSpan').prop('hidden', false);


    function setTopConstruct() {
        if ($('#direction').prop('disabled') == true) {
            return;
        }
        $.ajax({
            type: 'POST',
            url: '../CheckBridgeServlet',
            dataType: 'json',
            data: {
                type: "setTopConstruct",
                id: info.id,
                direction: $('#direction').val(),
                span_no: $('#span_no').val()
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
                        default:
                            break;
                    }
                } else {
                    $('#span_top_struct').val(json.obj);
                }
            }
        });
    }

    function setDownConstruct() {
        $.ajax({
            type: 'POST',
            url: '../CheckBridgeServlet',
            dataType: 'json',
            data: {
                type: "setDownConstruct",
                id: info.id
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
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                    	if(data[i]==null || data[i]=='null'){
                    		continue;
                    	}
                        $('#span_down_struct').append("<option>" + data[i] + "</option>");
                    }
                    $('#span_down_struct').trigger('change');
                }
            }
        });
    }

    function addSpan() {
        $('#direction').prop('disabled', false);
        $('#span_no').prop('disabled', false);
        $('#record').hide();
        setTopConstruct();
        if(null!= $.cookie('direction')&&''!=$.cookie('direction')){
        	var direction = $.cookie('direction');
        	$('#direction').val($.cookie('direction')).trigger("change");
        }
        /* buildSpan();  */
        
		var myDate = new Date();
		var month =   parseInt(myDate.getMonth()+1);
		if(month<10){
			month ="0"+month;
		}	
		var now = myDate.getFullYear()+"-"+month+"-"+myDate.getDate();
		$('#chk_time').val(now);
		//alert(now);  
        $('#addSpan').dialog({
            title: "选择跨",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 选定",
                    "class": "btn btn-default",
                    click: function () {
                        var info2 = {
                            chk_id: bridgeChk.chk_id,
                            direction: $('#direction').val(),
                            span_no: $('#span_no').val(),
                            span_build: $('#span_build').val(),
                            span_top_struct: $('#span_top_struct').val(),
                            span_down_struct: ($('#span_down_struct').val()==null?'':$('#span_down_struct').val()).toString(),
                            span_memo: $('#span_memo').val(),
                            span_suggestion: $('#span_suggestion').val(),
                            chk_time: $('#chk_time').val(),
                            chk_weather: $('#chk_weather').val(),
                            temp: $('#temp').val(),
                            chk_state: '0',
                            recheck_person: $('#recheck_person').val()
                        }
                        console.log(info2);
                        if (checkRepeat(info2.direction, info2.span_no)) {
                            errMessage("该跨已经被选中，请勿重复选中");
                            return;
                        }
                        if(info.chk_type=='daily'){
                        	 if(info2.direction=='' || info2.direction==null){
                        		  errMessage("请选择方向！");
                                  return;
                        	 }
                        	 if(info2.span_no=='' || info2.span_no==null){
                       		  errMessage("请选择跨！");
                                 return;
                       	 }
                        }else{
                        	 for (var s in info2) {

                                 if (s == "span_suggestion" || s == 'span_memo') {
                                     continue;
                                 }
                                 if (s == "span_build") {
                                     if (info2[s] == "") {
                                         info2[s] = "详见附注";
                                     }
                                     continue;
                                 }
                                 if (info2[s] == "" || info2[s] == null) {
                                     errMessage("请确认数据完整！");
                                     return;
                                 }
                             }
                        }
                       
                        $.ajax({
                            type: 'POST',
                            url: '../CheckBridgeServlet',
                            dataType: 'json',
                            data: {
                                type: "addSpan",
                                info: JSON.stringify(info2)
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
                                        default:
                                            break;
                                    }
                                } else {
                                    info2.span_chk_id = json.obj;
                                    table.row.add(info2).draw(false);
                                    $('#addSpan').dialog('close');
                                    changeState();
                                    $.cookie("data", JSON.stringify(info2));
                                    $.cookie("autoOpen", "true");
                                    if(info.chk_type=='daily'){
                                    	//window.location.href = encodeURI("checkSpan3.jsp");
                                    }else{
                                    	window.location.href = encodeURI("checkSpan.jsp");
                                    }
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

        $('#addSpan').dialog('open');
    }

    function buildPerson() {
        $.ajax({
            type: 'POST',
            url: '../CheckBridgeServlet',
            dataType: 'json',
            data: {
                type: "getPerson",
                prj_id: bridgeChk.prj_id

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
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    var ss = data.split('#');
                    for (var i = 0; i < ss.length; i++) {
                        $('#recheck_person').append("<option>" + ss[i] + "</option>");
                    }

                }
            }
        });
    }


    function overCheck() {
        spans = {
            "上行": [],
            "下行": [],
            "无": []
        }
        var data = table.data();
        for (var i = 0; i < data.length; i++) {
            if (data[i].chk_state == '0') {
                errMessage("存在跨没有完成检查！");
                return;
            }
            spans[data[i].direction].push(data[i].span_no);
        }
        var message = "";
        if (spans["上行"].length != spanInfo["上行"].length) {
            errMessage("存在上行跨没有进行检查！");
            message = message + "-上行-";
        }
        if (spans["下行"].length != spanInfo["下行"].length) {
            errMessage("存在下行跨没有进行检查！");
            message = message + "-下行-";
        }
        if (spans["无"].length != spanInfo["无"].length) {
            errMessage("存在跨没有进行检查！");
            message = message + "-无-";
        }
        if (message != "") {
            if (info.chk_type == 'regular') {
                message = message + "存在跨" + "没有进行添加，请继续检查。";
                errMessage(message);
                return;
            } else {
                successMessage("进行的不是定期检查，可以结束检查");
            }
        }

        $.SmartMessageBox({
            title: "确认提示",
            content: "确认结束该结构物检查吗？",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../CheckBridgeServlet',
                    dataType: 'json',
                    data: {
                        type: "overCheck",
                        chk_id: bridgeChk.chk_id
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

    function dirChange(t) {
        var d = $(t).val();
        table.search(d).draw(false);
    }

    function checkRepeat(dir, sp) {
        var d = table.data();
        for (var i = 0; i < d.length; i++) {
            if (dir == d[i].direction && sp == d[i].span_no) {
                return true;
            }
        }
        return false;
    }


    $.datetimepicker.setLocale('ch');
    $('#chk_time').datetimepicker({
        format: "Y-m-d",
        timepicker: false,
        todayButton: true,
    });


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

    function changeState() {
        if (bridgeChk.audit_state == '1') {

            $.ajax({
                type: 'POST',
                url: '../CheckBridgeServlet',
                dataType: 'json',
                data: {
                    type: "changeState",
                    chk_id: bridgeChk.chk_id,
                    prj_id: bridgeChk.prj_id
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
                        bridgeChk.audit_state == '0';
                        $('.widget-body-toolbar a').removeClass('disabled');
                        $('.widget-body-toolbar a').eq(0).removeClass('disabled').addClass('btn-primary').text('照片');
                        $('.widget-body-toolbar a').eq(1).removeClass('disabled').addClass('btn-primary').text('选择跨');
                        $('.widget-body-toolbar a').eq(2).removeClass('btn-success disabled').addClass('btn-primary').text('完成桥梁检查');
                    }
                }
            });
        }
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
    		 $('.widget-body-toolbar a').eq(0).removeClass('btn-warning disabled').addClass('btn-primary').text('照片');
    	        $('.widget-body-toolbar a').eq(1).removeClass('btn-warning disabled').addClass('btn-primary').text('选择跨');
    	        $('.widget-body-toolbar a').eq(2).removeClass('btn-warning disabled').addClass('btn-primary').text('完成桥梁检查');
    	        editDel = "<div class='text-align-center'><button class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></button></div>";
    	    
    	}else{
    		 $('.widget-body-toolbar a').eq(0).removeClass('btn-warning disabled').addClass('btn-primary').text('照片');
    	}
       }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
			 releaseMember();
		}
	
	}
</script>


</body>
</html>