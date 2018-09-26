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
    <style>
        .kh:hover {
            background-color: #ccc;
            cursor: pointer;
        }

        .loading {
            width: 220px;
            height: 56px;
            position: fixed;
            top: 50%;
            left: 50%;
            line-height: 56px;
            color: #fff;
            padding-left: 60px;
            font-size: 15px;
            background: #000 url(../img/loader.gif) no-repeat 10px 50%;
            z-index: 9999;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            border-radius: 20px;
            filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
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
            <li>结构</li>
            <li>桥梁构件</li>
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

                <article class="col-sm-4 col-md-4 col-lg-4">

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

                            <!-- widget content -->
                            <div class="widget-body no-padding">
                                <div class="widget-body-toolbar bg-color-white text-align-right">
                                    <a onclick="addSpan()" class="btn btn-primary btn-xs disabled">
                                        增加
                                    </a>
                                    &nbsp;
                                    <a onclick="editSpan()" class="btn btn-primary btn-xs disabled">
                                        修改
                                    </a>
                                    &nbsp;
                                    <a onclick="delSpan()" class="btn btn-primary btn-xs disabled">
                                        删除
                                    </a>
                                </div>
                                <div class="custom-scroll table-responsive" style="height:450px; overflow-y: scroll;">

                                    <div class="tree smart-form">

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
                <article class="col-xs-8 col-sm-8 col-md-8 col-lg-8">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"
                         data-widget-editbutton="false"
                         data-widget-togglebutton="false"
                         data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>桥梁构件 </h2>

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
                                    <div class="pull-left col-xs-3"><input class="form-control" id="searchData" value=""
                                                                           placeholder="搜索" type="text"></div>
                                    <form class="form-inline" id="domeform" method="post" enctype="multipart/form-data">
                                        <div class="row" style="float:right;margin-right:2%">
                                          <a  class="btn btn-primary btn-sm disabled">
                                            <input id="realfile"  type="file" name="file" value="选择文件">
                                            </a>
                                             <input class="btn btn-primary btn-sm" type="button" value="提交" id="ormdatasub"> 
                                            
                                            <a onclick="quickMen()" class="btn btn-primary btn-sm disabled">
                                                <i class="fa fa-table "></i> 标准构件
                                            </a>
                                            <a onclick="copyMember()" class="btn btn-primary btn-sm disabled">
                                                <i class="fa fa-copy "></i> 复制
                                            </a>
                                            <a onclick="addMember()" class="btn btn-primary btn-sm disabled">
                                                <i class="fa fa-plus"></i> 增加
                                            </a>
                                        </div>
                                    </form>
                                </div>
                                <table id="datatable_fixed_column"
                                       class="table table-striped table-bordered table-hover" style="width:100%">
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
                                    <tbody id="cttt">

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
<div id="opera" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>构件类型</label>
                <select class="form-control select2" id="ggjlx" onchange="change()" style="width: 100%">
                </select>
            </div>
            <div class="form-group">
                <label>构件名称</label>
                <input class="form-control" id="ggjbh" value="" placeholder="构件编号" type="text">
            </div>
            <!--
						<div class="form-group">
							<label>构件描述</label>
							<input class="form-control" id="ggjms" value="" placeholder="构件描述" type="text">
						</div>
						 -->
            <div class="form-group">
                <label>构件型号</label>
                <select class="form-control select2" id="ggjxh" style="width: 100%">
                </select>
                <!-- <input class="form-control" id="ggjxh" value="" placeholder="构件型号" type="text"> -->
            </div>
            <!--
						<div class="form-group">
							<label>主材信息：</label>
							<select	class="form-control" id="zzcmc">
							<option value='无' selected="selected">无</option>
							</select>
						</div>

						<div class="form-group">
							<label>支座信息：</label>
							<select	class="form-control" id="zzzmc">
							<option value='无' selected="selected">无</option>
							</select>
						</div>
						 -->
        </fieldset>
    </form>
</div>
<div id="opera1" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>方向<span style="color:red">*</span></label>
                <select class="form-control select2" style="width: 100%" id="ffx">
                    <option value='上行'>上行</option>
                    <option value='下行'>下行</option>
                    <option value='无'>无</option>
                </select>
            </div>
            <div class="form-group">
                <label>跨号<span style="color:red">*</span></label>
                <input class="form-control" id="kkh" value="" placeholder="跨号" type="text">
            </div>
            <div class="form-group">
                <label>桥型<span style="color:red">*</span></label>
                <select class="form-control select2" style="width: 100%" id="qqx">
                </select>
            </div>
            <div class="form-group">
                <label>联号</label>
                <input class="form-control" id="span_line_no" value="" placeholder="联号" type="text">
            </div>
             <div class="form-group">
                <label>跨径(m)</label>
                <input class="form-control" id="span_length" value="" placeholder="跨径(m)" type="text">
            </div>
             <div class="form-group">
                <label>材料<span style="color:red">*</span></label>
                <select class="form-control" style="width: 100%" id="span_material">
                </select>
            </div>
             <div class="form-group">
                <label>跨越情况<span style="color:red">*</span></label>
                <select class="form-control select2" style="width: 100%" id="spanning_case">
                	<option selected="selected" value='无'>无</option>
                    <option value='跨路'>跨路</option>
                    <option value='跨河'>跨河</option>
                </select>
            </div>
             <div class="form-group">
                <label>净空(m)</label>
                <input class="form-control" id="clearance" value="" placeholder="净空(m)" type="text">
            </div>
        </fieldset>
    </form>
</div>

<div id="copyMem" hidden="hidden">
    <form>
        <label>复制来源</label>
        <select class="imput-sm form-control select2" style="width: 100%" id="allBridge">

        </select>
        <label>方向</label>
        <select class="imput-sm form-control select2" style="width: 100%" id="allDirection">

        </select>
        <label>跨</label>
        <select class="imput-sm form-control select2" style="width: 100%" id="allSpan">

        </select>
    </form>
    <br>
    <br>
    <div class="text-align-center">
        <button class="btn btn-default" onclick="copyAllMem()">复制结构</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="btn btn-default" onclick="copyThisDirection()">复制方向</button>
        <button class="btn btn-default" onclick="copyThisMem()">复制跨</button>
    </div>
</div>

<!-- 快速构件 -->
<div id="quickMen" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>跨数</label>
                <input class="form-control" id="quick_span_number" value="" placeholder="跨数 (填写格式  : 1-1,2-4,5-8,...)"
                       type="text">
            </div>
            <div class="form-group">
                <label>形式</label>
                <select class="form-control" id="quick_span_type" style="width: 100%">
                    <option value="1" onselect="showSpan_direction()">分离式</option>
                    <option value="2">整体式</option>
                </select>
            </div>
            <div id="span_direction">
                <label>
                    <input type="checkbox" name="direction" id="span_top" value="上行">上行
                </label>
                &nbsp
                <label>
                    <input type="checkbox" name="direction" id="span_down" value="下行">下行
                </label>
            </div>
        </fieldset>
    </form>
</div>

<div id="quickMen_table" hidden="hidden">
    <form class="smart-form">
        <fieldset>
            <table id="table_quickMen" class="table table-bordered table-striped">
                <tr>
                    <th>跨号</th>
                    <th>联号</th>
                    <th>桥型</th>
                    <th>规格</th>
                    <th>位置</th>
                    <th>跨径(m)</th>
                    <th>材料</th>
                    <th>跨越情况</th>
                    <th>净空(m)</th>
                </tr>
            </table>
        </fieldset>
    </form>
</div>

<div id="duplicate_table" hidden="hidden">
    <form class="smart-form">
        <fieldset>
            <table id="table_duplicate" class="table table-bordered table-striped">
                <tr>
                    <th>跨号</th>
                    <th>方向</th>
                </tr>
            </table>
        </fieldset>
    </form>
</div>

<div id="cover" class="cover">
    <div id="loading" class="loading">处理中
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
<script type="text/javascript" src="check/select2Fix.js"></script>
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
	/**
	 * 使用FormData
	 */
	$("#ormdatasub").click(function(){
	    var formdata = new FormData($("#domeform")[0]);
	    var fileName=$("#realfile").val();
		var fileEnd=fileName.split(".")[1];
		if(fileEnd==''||fileEnd==undefined){
			errMessage('文件不能为空');
			return false;
		}else{
			if(fileEnd.indexOf("xls")==-1){
				errMessage('格式不正确');
				return false;
			}else{
				
			    $.ajax({
			        url: "../UpLoadFileServlet",
			        type: "POST",
			        data:formdata,
			        dataType: "json",
			        processData: false,  // 告诉jQuery不要去处理发送的数据
			        contentType: false,   // 告诉jQuery不要去设置Content-Type请求头
			        success: function (json) {
			        	if(json.error==0){
			        		 //table.dataTable().fnDraw(false);
			        		location.reload();
			                autoFromMbr();
			                successMessage("上传成功！");
			        	}else if(json.error==-1){
			        		errMessage("上传文件格式错误！");
			        	}
			        }
			    })
			}
		}
		
	}) 

    /**************************************定义全局变量*************************************************************/
    var $li1 = undefined;
    /*上行标签*/
    var $li2 = undefined;
    /*下行标签*/
    var $lli = undefined;
    /*选定的跨号节点*/
    var $tree = $("#tree-ul");
    /*树形图父节点*/
    var $ll = undefined;
    /*被选定的方向节点*/
    var gjlx = undefined;
    /**所有构件类型的对象的数组*/
    var table = undefined;
    /**右边表格的节点*/
    var isEdit = 0;
    var store = undefined;
    var isSeparate = undefined;
    var session =
    <%=JSON.toJSONString(oc)%>
    var check_val = [];
    var span_top = undefined;
    var span_down = undefined;
    var all_span = undefined;
    var arrs_format = undefined;
    var span_material = undefined;
    function creatQuickSpan(quickSpan_no, quickSpan_line_no, quickSpan_brg_type, quickSpan_format, quickSpan_location,quickSpan_length,quickSpan_material,quickSpanning_case,quickClearance) {
        var o = {
            quickSpan_no: quickSpan_no,
            quickSpan_line_no: quickSpan_line_no,
            quickSpan_brg_type: quickSpan_brg_type,
            quickSpan_format: quickSpan_format,
            quickSpan_location: quickSpan_location,
            quickSpan_length : quickSpan_length,
            quickSpan_material : quickSpan_material,
            quickSpanning_case : quickSpanning_case,
            quickClearance : quickClearance 
        }
        return o;
    }
	
	function getSpan_material(){
		  $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "getSpan_material",
            },
            error: function (msg) {
                errMessage("查询构件类型失败！");
            },
            success: function (json) {
            	if(json.success=="success"){
					span_material = json.obj;
					  for(var j = 0; j < span_material.length; j++) {
                        	$("#span_material").append(
                                "<option value='" + span_material[j].item_value + "'>"
                                + span_material[j].item_value + "</option>");
                       }    
                    $("#span_material").select2();           	
            	}
            }
		});
	}
	
	function autoFromMbr(){
		$.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "topFromSpanInfo",
            },
            error: function (msg) {
                errMessage("统计上部结构失败");
            },
            success: function (json) {
            }
		});
	}

    $(document).ready(function () {
        pageSetUp();
        initTable();
        initTree();
        initLX();
        initMember_type();
        querySpan();
        getAllBridge();
        getSpan_material();
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "isCheckAudited",
            },
            error: function (msg) {
                errMessage("查询构件类型失败！");
            },
            success: function (json) {
                if (json.error == 0) {
                    var audit_state = json.success;
                    if (audit_state == "2") {
                        $('.widget-body-toolbar a').addClass('disabled');
                        control = "disabled";
                    }

                }
            }
        });
        autoFromMbr();
    });

    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
    });
    /***************************************************新建构件对象******************************************************/

    var member = {
        r_id: undefined,
        s_id: undefined,
        member_type: undefined,
        member_no: undefined,
        member_desc: undefined,
        member_model: undefined,
        /*
         material_name:undefined,
         bearing_name:undefined,
         */
        component_name: undefined,
        distr_name: undefined,
        caozuo: undefined
    }
    /******************************************************创建构件表格节点************************************************************************/
    $type = $("#ggjlx");
    $no = $("#ggjbh");
    $desc = $("#ggjms");
    $model = $("#ggjxh");
    $material = $("#zzcmc");
    $bearing = $("#zzzmc");


    /*****************************************************清空构件表格值***********************************************************************/

    function clearMember() {
        $type.val("").trigger("change");
        $no.val("");
        $desc.val("");
        $model.val("").trigger("change");
        /*
         $material.val("无");
         $bearing.val("无");
         */
    }

    /*******************************************************************************************************************************************/

    function evalMember(a, mem) {
        var tr = $(a).closest('tr');
        var row = table.row(tr);
        member.r_id = table.row(tr).data().r_id;
        isEdit = 1;
        store = mem.member_model;
        for (var ii = 0; ii < gjlx.length; ii++) {
            if (gjlx[ii].member_name == mem.member_type) {
                $type.val(gjlx[ii].member_id).trigger("change");
            }
        }
        //$type.val("7").trigger("change");
        $no.val(mem.member_no);
        $desc.val(mem.member_desc);
        //$('#select2-ggjxh-container').text(mem.member_model);
        //$model.select2("val",mem.member_model).trigger('change');
        /*
         $material.val(mem.material_name);
         $bearing.val(mem.bearing_name);
         */
    }


    /******************************************************提取构件表格里面的值************************************************************************/

    function assMember() {
        member.s_id = $lli.attr("data-id");

        for (var ii = 0; ii < gjlx.length; ii++) {
            if (gjlx[ii].member_id == $type.val()) {
                member.member_type = gjlx[ii].member_name;
                break;
            }
        }
        member.member_no = $no.val();
        member.member_desc = $desc.val();
        member.member_model = $model.val();
        /*
         member.material_name=$material.val();
         member.bearing_name=$bearing.val();
         */
        //member.caozuo="&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip' data-placement='top'  data-id='"+member.r_id+"' data-original-title='修改' onclick='editMember(this)'><i class='fa fa-pencil'></i></a>&nbsp;&nbsp;<a class='btn btn-warning btn-xs "+control+"' rel='tooltip'  data-id='"+member.r_id+"' data-placement='top' data-original-title='删除' onclick='delMember(this)' ><i class='fa fa-minus'></i></a>";
        if (member.member_type == "" || member.member_no == "") {
            errMessage("信息不能为空！");
            return false;
        }
        if (member.member_desc == "") {
            member.member_desc = "无";
        }
        if (member.member_model == "") {
            member.member_model = "无";
        }

        return true;
    }

    /***************************************************构件类型******************************************************/
    function initMember_type() {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "member_type",
            },
            error: function (msg) {
                errMessage("查询构件类型失败！");
            },
            success: function (json) {
                var arr = json.obj;
                if (arr.length > 0) {
                    isEdit = 0;
                    for (var i = 0; i < arr.length; i++) {
                        $option = $("<option></option>");
                        $option.prop("value", arr[i].member_id);
                        $option.prop("text", arr[i].member_name);
                        $type.append($option);
                        //	$type.append("<option value='"+arr[i].member_id+"'>"+arr[i].member_name+"</option>");
                    }
                    $type.select2();
                } else {

                }

            }
        });
    }
    //$type.on("select2:select",function(e){ log("select2:select", e);});
    function change() {
        remove$model();
        var select1 = $type.val();
        if (select1 != "") {
            $.ajax({
                type: 'POST',
                url: '../BrgMemberServlet',
                dataType: 'json',
                data: {
                    choice: "mem_mem_type",
                    id: select1
                },
                error: function (msg) {
                    errMessage("查询构件型号失败！");
                },
                success: function (json) {
                    var arr = json.obj;
                    console.log(arr);
                    if (arr == undefined) {
                        $option = $("<option></option>");
                        $option.prop("value", "无");
                        $option.prop("text", "无");
                        $model.append($option);
                    } else {
                        for (var i = 0; i < arr.length; i++) {
                            $option = $("<option></option>");
                            $option.prop("value", arr[i].member_type_name);
                            $option.prop("text", arr[i].member_type_name);
                            $model.append($option);
                        }
                    }
                    $model.select2();
                    if (isEdit == 1) {
                        if (arr != undefined && store != "无") {
                            $model.val(store).trigger("change");
                        }
                    }
                }
            });
        }
    }

    function remove$model() {
        $model.html("");
    }


    /*****************************************************查询构件***************************************************************/

    function queryMember() {
        $('#datatable_fixed_column').dataTable().fnClearTable();
        showMask();
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: 6,
                spanid: $lli.attr("data-id"),
            },
            error: function (msg) {
                errMessage("查询构件失败！");
                hidMask();
            },
            success: function (json) {
                if (json.success == "success") {
                    var len1 = json.obj.length;
                    table.rows.add(json.obj).draw(false);
                    /* 	for(var ii=0;ii<len1;ii++){
                     addRow(json.obj[ii]);
                     } */
                } else {
                    errMessage("没有数据！");
                }
                hidMask();
            }
        });

    }

    /****************************************************新建构件***************************************************************/

    function addMember() {
        if ($lli == undefined) {
            errMessage("请选择跨号!");
            return false;
        }
        clearMember();
        isEdit = 0;
        //choiceType();
        $('#opera').dialog({
            title: "新增构件"
        });
        $('#opera').dialog("open");
        $('#opera').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        if (!assMember()) {
                            return false;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../BrgMemberServlet',
                            async: false,
                            dataType: 'json',
                            data: {
                                choice: 7,
                                member: JSON.stringify(member),
                            },
                            error: function (msg) {
                                errMessage("添加构件失败！");
                            },
                            success: function (json) {
                                if (json.success == "success") {
                                    //successMessage("添加成功！");
                                    var data = json.obj;
                                    member.r_id = data[0].r_id;
                                    for (var ii = 0; ii < gjlx.length; ii++) {
                                        if (gjlx[ii].member_name == member.member_type) {
                                            member.component_name = gjlx[ii].component8;
                                            member.distr_name = gjlx[ii].distr_name;
                                            break;
                                        }
                                    }
                                    //addRow(member);
                                    table.row.add(member).draw(false);
                                    $('#opera').dialog("close");
                                    autoFromMbr();
                                } else {
                                    if (json.error == "0") {
                                        errMessage("添加构件失败！");
                                    } else if (json.error == "-2") {
                                        errMessage("构件名称重复！");
                                    } else if (json.error == "-1") {
                                        errMessage("添加构件失败！");
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
    }

    /****************************************************修改构件************************************************************/


    function editMember(a) {
        //choiceType();
        var tr = $(a).closest('tr');
        var row = table.row(tr);
        evalMember(a, row.data());

        $('#opera').dialog({
            title: "修改构件"
        });
        $('#opera').dialog("open");
        $('#opera').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        if (!assMember()) {
                            return false;
                        }
                        if ($model.val() == "") {
                            errMessage("构件类型不能空");
                            return false;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../BrgMemberServlet',
                            dataType: 'json',
                            data: {
                                choice: 8,
                                member: JSON.stringify(member),
                                memberno: row.data().member_no
                            },
                            error: function (msg) {
                                errMessage("修改构件失败！");
                            },
                            success: function (json) {
                                if (json.success == "success") {
                                    //successMessage("修改成功！");
                                    for (var ii = 0; ii < gjlx.length; ii++) {
                                        if (gjlx[ii].member_name == member.member_type) {
                                            member.member_type = gjlx[ii].member_name;
                                            member.component_name = gjlx[ii].component8;
                                            member.distr_name = gjlx[ii].distr_name;
                                            break;
                                        }
                                    }
									/*
                                    $(a).parent().parent().children("td").eq(0).text(member.distr_name);
                                    $(a).parent().parent().children("td").eq(1).text(member.component_name);
                                    $(a).parent().parent().children("td").eq(2).text(member.member_type);
                                    $(a).parent().parent().children("td").eq(3).text(member.member_no);
                                    */
                                    row.data(member);
                                    /*
                                     row.child.hide();
                                     tr.removeClass('shown');
                                     row.child( format(row.data()) ).show();
                                     tr.addClass('shown');
                                     */
                                     autoFromMbr();
                                    $('#opera').dialog("close");
                                } else {
                                    if (json.error == "0") {
                                        errMessage("修改构件失败！");
                                    } else if (json.error == "-2") {
                                        errMessage("构件编号重复！");
                                    } else if (json.error == "-1") {
                                        errMessage("编号重复！");
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


    }

    /***************************************************删除构件*********************************************************************************/

    function delMember(a) {
        $.SmartMessageBox({
            title: "构件删除",
            content: "您是否确认删除此记录？",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../BrgMemberServlet',
                    dataType: 'json',
                    data: {
                        memberid: $(a).attr("data-id"),
                        spanid: $lli.attr("data-id"),
                        choice: 9
                    },
                    error: function (msg) {
                        errMessage("系统错误！");
                    },
                    success: function (json) {
                        if (json.success == "success") {
                            table.row($(a).parents("tr")).remove().draw(false);
                            autoFromMbr();
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


    /***************************************************新建跨号对象****************************************************/
    var span = {
        s_id: undefined,
        bridge_id: undefined,
        direction: undefined,
        span_no: undefined,
        brg_type_id: undefined,
        brg_type_name: undefined,
        span_line_no: undefined,
        span_length : undefined,
        span_material : undefined,
        spanning_case : undefined,
        clearance : undefined
    }


    /****************************************************创建跨号表格所有节点**************************************************/

    var $khbh = $("#kkhbh");
    var $fx = $("#ffx");
    var $kh = $("#kkh");
    var qx = $("#qqx");


    /*************************************************清空跨号表格值*************************************************************/

    function clearKH() {
        $kh.val("");
        
        $("#span_line_no").val("");
        $("#span_length").val("");
        $("#clearance").val("");
        $("#span_material").select2().val(null).trigger("change");
        $("#spanning_case").select2().val("无").trigger("change");
        $fx.select2().val(null).trigger("change");
        qx.select2().val(null).trigger("change");
        
    }

    /**************************************************给跨号表格赋值****************************************************************************/

    function evalSpan() {
        span.s_id = $lli.attr("data-id");
        //$fx.val($lli.attr("data-direction"));
        $fx.select2().val($lli.attr("data-direction")).trigger("change");
        $kh.val($lli.attr("data-name"));
        //qx.val($lli.attr("data-type"));
         qx.select2().val($lli.attr("data-type")).trigger("change");
        $("#span_line_no").val($lli.attr("data-no"));
         $("#span_length").val($lli.attr("data-length"));
         $("#clearance").val($lli.attr("data-clearance"));
         $("#span_material").select2().val($lli.attr("data-material")).trigger("change");
         $("#spanning_case").select2().val($lli.attr("data-case")).trigger("change");
    }


    /**************************************************提取跨号表格里面的值********************************************************/

    function assSpan() {
        span.direction = $fx.val();
        span.span_no = $kh.val();
        span.brg_type_name = qx.val();
        span.span_line_no = $("#span_line_no").val();
        span.span_length = $("#span_length").val();
        span.span_material = $("#span_material").val();
        span.spanning_case = $("#spanning_case").val();
        span.clearance = $("#clearance").val();
        if (span.direction == undefined || span.span_no == undefined || span.brg_type_name == undefined
        	||span.span_length==undefined||span.span_material==undefined||span.spanning_case==undefined||span.clearance==undefined
        	) {
            errMessage("信息不能为空！");
            return false;
        } else {
            return true
        }
    }


    /**********************************************新建跨号*********************************************************/


    function addSpan(){
        clearKH();
        $('#opera1').dialog({
            title: "新增跨号"
        });
        $('#opera1').dialog("open");

        $('#opera1').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        span.s_id = Math.uuid();
                        if (!assSpan()) {
                            return false;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../BrgMemberServlet',
                            async: false,
                            dataType: 'json',
                            data: {
                                choice: 2,
                                span: JSON.stringify(span),
                            },
                            error: function (msg) {
                                errMessage("添加跨号失败！");
                            },
                            success: function (json) {
                                if (json.success == "success") {
                                    //successMessage("添加成功！");
                                    var $li = $("<li></li>");
                                    $li.attr("data-id", span.s_id);
                                    $li.attr("data-type", span.brg_type_name);
                                    $li.attr("data-direction", span.direction);
                                    $li.attr("data-name", span.span_no);
                                    $li.attr("data-no", span.span_line_no);
                                    $li.attr("data-length", span.span_length);
                                    $li.attr("data-material", span.span_material);
                                    $li.attr("data-case", span.spanning_case);
                                    $li.attr("data-clearance", span.clearance);
                                    if (span.span_line_no == "") {
                                        $li.append("<span class='kh col-lg-1 col-md-1 col-xs-1' onclick='choiceSpan(this)'>" + span.span_no + "</span>&nbsp;--&nbsp;" + "<i style='font-style:normal;color:#214e75'>" + span.brg_type_name + "</i>");
                                    } else {
                                        $li.append("<span class='kh col-lg-1 col-md-1 col-xs-1' onclick='choiceSpan(this)'>" + span.span_no + "</span>&nbsp;--&nbsp;" + "<i style='font-style:normal;color:#214e75'>" + span.brg_type_name + "</i>&nbsp;--&nbsp;<i style='font-style:normal;color:blue'>第" + span.span_line_no + "联</i>");
                                    }
                                    if (span.direction == "上行") {
                                        if (addLi("上行") == false) {
                                            $ul.prepend($li1);
                                            $li1.append("<ul hidden='hidden'></ul>");
                                            ReAnimotion($li1);
                                        }
                                        $li1.children("ul").append($li);
                                    } else if (span.direction == "下行") {
                                        if (addLi("下行") == false) {
                                            $ul.append($li2);
                                            $li2.append("<ul hidden='hidden'></ul>");
                                            ReAnimotion($li2);
                                        }
                                        $li2.children("ul").append($li);
                                    } else if (span.direction == "无") {
                                        if (addLi("无") == false) {
                                            $ul.append($li3);
                                            $li3.append("<ul hidden='hidden'></ul>");
                                            ReAnimotion($li3);
                                        }
                                        $li3.children("ul").append($li);
                                    }
                                    $('#opera1').dialog("close");
                                } else {
                                    if (json.error == "0") {
                                        errMessage("添加失败！");
                                    } else {
                                        errMessage("跨号重复！");
                                    }
                                }
                                autoFromMbr();
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
    }


    function addLi(str) {
        var flag = false;
        var data = $tree.children();
        for (var i = 0; i < data.length; i++) {
            if (data[i].id == str) {
                flag = true;
            }
        }
        return flag;
    }

    /***********************************************快速构件**************************************************************/
    $("#quick_span_type").on("select2:select", function (e) {
        if ($("#quick_span_type").val() == 1) {
            $("#span_direction").show();
        } else {
            $("#span_top").attr("checked", false);
            $("#span_down").attr("checked", false);
            $("#span_direction").hide();
        }
    });

    function fun() {
        check_val.splice(0, check_val.length);
        span_top = undefined;
        span_down = undefined;
        obj = document.getElementsByName("direction");
        for (k in obj) {
            if (obj[k].checked)
                check_val.push(obj[k].value);
        }

    }


    function quickMen() {
        $("#quick_span_number").val("");
        $("#quick_span_type").select2();
        $("#span_top").attr("checked", false);
        $("#span_down").attr("checked", false);
        $('#quickMen').dialog({
            title: "快速创建构件"
        });
        $('#quickMen').dialog("open");
        $('#quickMen').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 下一步",
                    "class": "btn btn-default",
                    click: function () {
                        fun();
                        var quick_span_number = $("#quick_span_number").val();
                        quick_span_number = quick_span_number.replace("，", ",");
                        if (quick_span_number.indexOf("-") != -1) {
                            if (quick_span_number.indexOf(",") != -1) {
                                /**连续*/
                                var arrs = quick_span_number.split(",");
                                var end = "";
                                for (var i = 0; i < arrs.length; i++) {
                                    var arr = arrs[i].split("-");
                                    if (arr.length != 2 || isNaN(parseInt(arr[0])) || isNaN(parseInt(arr[1]))) {
                                        errMessage("请输入正确的跨数格式");
                                        return false;
                                    } else {
                                        if (i == 0) {
                                            end = parseInt(arr[1]);
                                            if (parseInt(arr[0]) > parseInt(arr[1])) {
                                                errMessage("请输入正确的跨数格式");
                                                return false;
                                            }
                                        } else {
                                            if (parseInt(arr[0]) > parseInt(arr[1]) || parseInt(arr[0]) < end || parseInt(arr[0]) == end) {
                                                errMessage("请输入正确的跨数格式");
                                                return false;
                                            }
                                            end = parseInt(arr[1]);
                                        }
                                    }
                                }
                            } else {
                                /**不连续*/
                                var arr = quick_span_number.split("-");
                                if (arr.length != 2) {
                                    errMessage("请输入正确的跨数格式");
                                    return false;
                                } else {
                                    if (isNaN(parseInt(arr[0])) || isNaN(parseInt(arr[1]))) {
                                        errMessage("请输入正确的跨数格式");
                                        return false;
                                    }
                                    else {
                                        if (parseInt(arr[0]) > parseInt(arr[1])) {
                                            errMessage("请输入正确的跨数格式");
                                            return false;
                                        }
                                    }
                                }
                            }
                        } else {
                            errMessage("请输入正确的跨数格式");
                            return false;
                        }
                        if ($("#quick_span_type").val() == "1") {
                            if (check_val.length == 0) {
                                errMessage("请至少选择一个方向");
                                return false;
                            }
                        }
                        if (check_val.length == 1) {
                            if (check_val[0] == "上行") {
                                span_top = "上行";
                            } else {
                                span_down = "下行";
                            }
                        } else if (check_val.length = 2) {
                            span_top = "上行";
                            span_down = "下行";
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../BrgMemberServlet',
                            dataType: 'json',
                            data: {
                                choice: "quickSpanNumber",
                                quick_span_number: quick_span_number,
                                quick_span_type: $("#quick_span_type").val(),
                                span_top: span_top,
                                span_down: span_down
                            },
                            error: function (msg) {
                            },
                            success: function (json) {
                                if (json.success == "success") {
                                    isSeparate = $("#quick_span_type").val();
                                    var arrs = json.obj;
                                    all_span = json.obj;
                                    var $table1 = $("#table_quickMen");
                                    removeTabel1();
                                    for (var i = 0; i < arrs.length; i++) {
                                        var arr = arrs[i];
                                        for (var j = 0; j < arr.length; j++) {
                                            $table1.append("<tr id='" + i + "'><td id='quickSpan_no" + arr[j] 
                                            + "' style='width:30px'>" + arr[j] 
                                            + "</td><td style='width:40px'><input class='form-control' id='quickSpan_line_no"
                                            + arr[j] + "'onchange='quickSpan_line_noControl(this)'></td><td style='width:200px'><select class='select2 form-control' style='width:100%' id='quickSpan_brg_type" 
                                            + arr[j] + "'></select></td><td><select class='select2 form-control' style='width:100%' id='quickSpan_format" 
                                            + arr[j] + "'></select></td><td><select class='select2 form-control' style='width:100%' id='quickSpan_location" 
                                            + arr[j] + "'><option value='桥首'>桥首</option><option value='联首'>联首</option><option value='中间' selected='selected'>中间</option><option value='联尾'>联尾</option><option value='桥尾'>桥尾</option></select></td>"
                                            +"<td style='width:50px'><input class='form-control' id='quickSpan_length" + arr[j] + "'onchange='quickSpan_lengthControl(this)'></td>"
                                            +"<td style='width:130px'><select class='select2 form-control' style='width:100%' id='quickSpan_material" + arr[j] + "'></select></td>"
                                            +"<td style='width:120kpx'><select class='select2 form-control' style='width:100%' id='quickSpanning_case" + arr[j] + "'> <option selected='selected' value='无'>无</option><option value='跨路'>跨路</option><option value='跨河'>跨河</option></select></td>"
                                            +"<td style='width:50px'><input class='form-control' id='quickClearance" + arr[j] + "'onchange='quickClearanceControl(this)'></td></tr>");
                                        }
                                    }
                                    initQuickSpan_brg_type();
                                    build_quickMem_table();
                                    onSelect2_quickSpan_material();
                                    onSelect2_quickSpanning_case();
                                    onSelect2_quickSpan_location();
                                } else {
                                    var $tb2 = $("#table_duplicate");
                                    removeTabel2();
                                    var arrs = json.obj;
                                    for (var i = 0; i < arrs.length; i++) {
                                        var arr = arrs[i];
                                        for (var j = 0; j < arr.length; j++) {
                                            if ($("#quick_span_type").val() == 1) {
                                                /**分离式*/
                                                if (arr[j].direction == "上行" || arr[j].direction == "下行") {
                                                    $tb2.append("<tr><td>" + arr[j].span_no + "</td><td>" + arr[j].direction + "</td></tr>");
                                                }
                                            } else {
                                                /**整体式*/
                                                if (arr[j].direction == "无") {
                                                    $tb2.append("<tr><td>" + arr[j].span_no + "</td><td>" + arr[j].direction + "</td></tr>");
                                                }
                                            }
                                        }
                                    }
                                    build_table_duplicate();
                                }
                                $("#quickMen").dialog("close");
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
    }

    function initQuickSpan_brg_type() {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "initQuickSpan_brg_type",
                condition: $("#quick_span_type").val()
            },
            error: function (msg) {
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    
                    var tr = $("#table_quickMen").find("tr");
                    for (var i = 1; i < tr.length; i++) {
                        var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
                        for (var j = 0; j < arr.length; j++) {
                            $("#quickSpan_brg_type" + no + "").append(
                                "<option value='" + arr[j].bridge_type + "'>"
                                + arr[j].bridge_type + "</option>");
                            initQuickSpan_format(arr[0].bridge_type, no);
                        }
                        for(var j = 0; j < span_material.length; j++) {
                        	$("#quickSpan_material" + no + "").append(
                                "<option value='" + span_material[j].item_value + "'>"
                                + span_material[j].item_value + "</option>");
                        }
                        //$("#table_quickMen tr:eq(" + i + ") td:eq(2)").children()[0].select2();
                        $("#quickSpan_brg_type" + no + "").select2();
                        $("#quickSpan_location" + no).select2();
                        $("#quickSpanning_case" + no).select2();
                        $("#quickSpan_material" + no).select2();
                    }
                    onSelect2_quickSpan_brg_type();
                    onSelect2_quickSpan_format();
                }
                else {
                    errMessage("桥型未查到数据，请产看字典是否绑定")
                }
            }
        });
    }
    /**桥型选择事件*/
    function onSelect2_quickSpan_brg_type() {
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quickSpan_brg_type" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quickSpan_brg_type", "");
                initQuickSpan_format(e.params.data.text, id);
                quickSpan_brg_typeControl(e.target.id, id, e.params.data.text);
            });
        }
    }
    
    
    /**联号控制*/
    function quickSpan_line_noControl(obj) {
        var no = $("#" + obj.id).parent().parent().attr("id");
        var span_id = obj.id.replace("quickSpan_line_no", "");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                $("#quickSpan_line_no" + arr[i]).val($("#" + obj.id).val());
            }
        }
    }
    /*跨径控制*/
     function quickSpan_lengthControl(obj) {
        var no = $("#" + obj.id).parent().parent().attr("id");
        var span_id = obj.id.replace("quickSpan_length", "");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                $("#quickSpan_length" + arr[i]).val($("#" + obj.id).val());
            }
        }
    }
    
     /*净空控制*/
     function quickClearanceControl(obj) {
        var no = $("#" + obj.id).parent().parent().attr("id");
        var span_id = obj.id.replace("quickClearance", "");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                $("#quickClearance" + arr[i]).val($("#" + obj.id).val());
            }
        }
    }

    /**规格选择事件*/
    function onSelect2_quickSpan_format() {
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quickSpan_format" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quickSpan_format", "");
                quickSpan_formatControl(e.target.id, id, e.params.data.text);
            });
        }
    }
    /**规格选择控制*/
    function quickSpan_formatControl(id, span_id, span_val) {
        var no = $("#" + id).parent().parent().attr("id");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                arrs_format = $("#quickSpan_format" + arr[i])[0].options;
                for (var j = 0; j < arrs_format.length; j++) {
                    if (parseInt(arrs_format[j].value) == parseInt(span_val))
                        $("#quickSpan_format" + arr[i]).val(span_val).trigger("change");
                }
            }
        }
    }
    /****************************************************************************************/
     /**材料选择事件*/
    function onSelect2_quickSpan_material() {
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quickSpan_material" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quickSpan_material", "");
                quickSpan_materialControl(e.target.id, id, e.params.data.text);
            });
        }
    }
    /**材料选择控制*/
    function quickSpan_materialControl(id, span_id, span_val) {
        var no = $("#" + id).parent().parent().attr("id");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                arrs_format = $("#quickSpan_material" + arr[i])[0].options;
                for (var j = 0; j < arrs_format.length; j++) {
                    if (arrs_format[j].value == span_val)
                        $("#quickSpan_material" + arr[i]).val(span_val).trigger("change");
                }
            }
        }
    }
	/****************************************************************************************/
	  /**跨越选择事件*/
    function onSelect2_quickSpanning_case() {
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quickSpanning_case" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quickSpanning_case", "");
                quickSpanning_caseControl(e.target.id, id, e.params.data.text);
            });
        }
    }
    /**跨越选择控制*/
    function quickSpanning_caseControl(id, span_id, span_val) {
        var no = $("#" + id).parent().parent().attr("id");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                arrs_format = $("#quickSpanning_case" + arr[i])[0].options;
                for (var j = 0; j < arrs_format.length; j++) {
                    if (arrs_format[j].value == span_val)
                        $("#quickSpanning_case" + arr[i]).val(span_val).trigger("change");
                }
            }
        }
    }
	/****************************************************************************************/
		  /**位置选择事件*/
    function onSelect2_quickSpan_location(){
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quickSpan_location" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quickSpan_location", "");
                quickSpan_locationControl(e.target.id, id, e.params.data.text);
            });
        }
    }
    /**位置选择控制*/
    function quickSpan_locationControl(id, span_id, span_val) {
        var no = $("#" + id).parent().parent().attr("id");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                arrs_format = $("#quickSpan_location" + arr[i])[0].options;
                for (var j = 0; j < arrs_format.length; j++) {
                    if (arrs_format[j].value == span_val)
                        $("#quickSpan_location" + arr[i]).val(span_val).trigger("change");
                }
            }
        }
    }
	/****************************************************************************************/
    /**桥型选择控制*/
    function quickSpan_brg_typeControl(id, span_id, span_val) {
        var array = [];
        var no = $("#" + id).parent().parent().attr("id");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                $("#quickSpan_brg_type" + arr[i]).val(span_val).trigger("change");
                array.push(arr[i]);
            }
        }
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "initQuickSpan_format",
                condition: $("#quick_span_type").val(),
                brg_type: span_val
            },
            error: function (msg) {
            },
            success: function (json) {
                if (json.success == "success") {
                    var arrs = json.obj;            
                    for (var i = 0; i < array.length; i++) {
                        var number = array[i];
                        $("#quickSpan_format" + number).empty();
                        for (var j = 0; j < arrs.length; j++) {
                            $("#quickSpan_format" + number).append(
                                "<option value='" + arrs[j].condition_norm + "'>"
                                + arrs[j].condition_norm + "</option>");
                        }
                        $("#quickSpan_format" + number).select2();
                    }
                }
            }
        });
    }

    function initQuickSpan_format(brg_type, span_id) {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "initQuickSpan_format",
                condition: $("#quick_span_type").val(),
                brg_type: brg_type
            },
            error: function (msg) {
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    var tr = $("#table_quickMen").find("tr");
                    $("#quickSpan_format" + span_id).empty();
                    for (var j = 0; j < arr.length; j++) {
                        $("#quickSpan_format" + span_id).append(
                            "<option value='" + arr[j].condition_norm + "'>"
                            + arr[j].condition_norm + "</option>");
                    }
                    //$("#table_quickMen tr:eq(" + i + ") td:eq(2)").children()[0].select2();
                    $("#quickSpan_format" + span_id).select2();
                }
            }
        });
    }

    /**提交表格*/
    function build_quickMem_table() {
        $('#quickMen_table').dialog({
            title: "快速创建构件"
        });
        $('#quickMen_table').dialog("open");
        $('#quickMen_table').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-home'></i>&nbsp; 上一步",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                        $('#quickMen').dialog("open");
                    }
                },
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 确认",
                    "class": "btn btn-default",
                    click: function () {
                        var tr = $("#table_quickMen").find("tr");
                        var quickSpan_s = new Array();
                        for (var i = 1; i < tr.length; i++) {
                            var quickSpan_no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
                            var quickSpan_line_no = $("#quickSpan_line_no" + quickSpan_no).val();
                            var quickSpan_brg_type = $("#quickSpan_brg_type" + quickSpan_no).val();
                            var quickSpan_format = $("#quickSpan_format" + quickSpan_no).val();
                            var quickSpan_location = $("#quickSpan_location" + quickSpan_no).val();
                            var quickSpan_length = $("#quickSpan_length" + quickSpan_no).val();
                            var quickSpan_material = $("#quickSpan_material" + quickSpan_no).val();
                            var quickSpanning_case = $("#quickSpanning_case" + quickSpan_no).val();
                            var quickClearance = $("#quickClearance" + quickSpan_no).val();
                            var quickSpan = creatQuickSpan(quickSpan_no, quickSpan_line_no, quickSpan_brg_type, quickSpan_format, quickSpan_location,quickSpan_length,quickSpan_material,quickSpanning_case,quickClearance);
                            quickSpan_s.push(quickSpan);
                        }
                        if (check_val.length == 1) {
                            if (check_val[0] == "上行") {
                                span_top = "上行";
                            } else {
                                span_down = "下行";
                            }
                        } else if (check_val.length = 2) {
                            span_top = "上行";
                            span_down = "下行";
                        }
                        $("#cover").show();
                        $.ajax({
                            type: 'POST',
                            url: '../BrgMemberServlet',
                            dataType: 'json',
                            data: {
                                choice: "quickSpan_s",
                                quickSpan_s: JSON.stringify(quickSpan_s),
                                condition: $("#quick_span_type").val(),
                                span_top: span_top,
                                span_down: span_down
                            },
                            error: function (msg) {
                                errMessage("请求BrgCardServlet失败");
                            },
                            success: function (json) {
                                if (json.success == "success") {
                                    $("#cover").hide();
                                    location.reload();
                                    autoFromMbr();
                                }
                                else {
                                    errMessage("创建失败");
                                    $("#cover").hide();
                                }
                            }
                        });

                        // $( this ).dialog( "close" );
                    }
                }
            ]
        });
    }


    function build_table_duplicate() {
        $('#duplicate_table').dialog({
            title: "跨号重复,请确认跨数"
        });
        $('#duplicate_table').dialog("open");
        $('#duplicate_table').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 确认",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                        $("#quickMen").dialog("open");
                    }
                }
            ]
        });
    }

    function removeTabel1() {
        var tr = $("#table_quickMen").find("tr");
        for (var i = 1; i < tr.length; i++) {
            tr[i].remove();
        }
    }

    function removeTabel2() {
        var tr = $("#table_duplicate").find("tr");
        for (var i = 1; i < tr.length; i++) {
            tr[i].remove();
        }
    }


    /***********************************************查询跨号**************************************************************/

    function querySpan() {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: 3
            },
            error: function (msg) {
                errMessage("查询跨号失败！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var len = json.obj.length;
                    for (var ii = 0; ii < len; ii++) {
                        var $li = $("<li></li>")
                        $li.attr("data-id", json.obj[ii].s_id);
                        $li.attr("data-type", json.obj[ii].brg_type_name);
                        $li.attr("data-direction", json.obj[ii].direction);
                        $li.attr("data-name", json.obj[ii].span_no);
                        $li.attr("data-no", json.obj[ii].span_line_no);
                        $li.attr("data-length", json.obj[ii].span_length);
                        $li.attr("data-material", json.obj[ii].span_material);
                        $li.attr("data-case", json.obj[ii].spanning_case);
                        $li.attr("data-clearance", json.obj[ii].clearance);
                        if (json.obj[ii].span_line_no == "") {
                            $li.append("<span class='kh col-lg-1 col-md-1 col-xs-1' onclick='choiceSpan(this)'>" + json.obj[ii].span_no + "</span>&nbsp;--&nbsp;" + "<i style='font-style:normal;color:#214e75'>" + json.obj[ii].brg_type_name + "</i>");
                        } else {
                            $li.append("<span class='kh col-lg-1 col-md-1 col-xs-1' onclick='choiceSpan(this)'>" + json.obj[ii].span_no + "</span>&nbsp;--&nbsp;" + "<i style='font-style:normal;color:#214e75'>" + json.obj[ii].brg_type_name + "</i>&nbsp;--&nbsp;<i style='font-style:normal;color:blue'>第" + json.obj[ii].span_line_no + "联</i>");
                        }

                        if (json.obj[ii].direction == "上行") {
                            $li1.children("ul").append($li);
                        } else if (json.obj[ii].direction == "下行") {
                            $li2.children("ul").append($li);
                        } else {
                            $li3.children("ul").append($li);
                        }
                    }
                } else {
                    errMessage("没有数据！");
                }
            }
        });


    }
    /****************************************************修改跨号*************************************************/

    function editSpan() {
        if ($lli == undefined) {
            errMessage("请选择跨号！");
            return false;
        }
        evalSpan();
        $('#opera1').dialog({
            title: "修改跨号"
        });
        $('#opera1').dialog("open");

        $('#opera1').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        span.s_id = $lli.attr("data-id");
                        if (!assSpan()) {
                            return false;
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../BrgMemberServlet',
                            dataType: 'json',
                            data: {
                                choice: 4,
                                span: JSON.stringify(span),
                            },
                            error: function (msg) {
                                errMessage("修改跨号失败！");
                            },
                            success: function (json) {
                                if (json.success == "success") {
                                    $lli.remove();
                                    $lli.attr("data-direction", span.direction);
                                    $lli.attr("data-type", span.brg_type_name);
                                    $lli.attr("data-name", span.span_no);
                                    $lli.attr("data-no", span.span_line_no);
                                    $lli.attr("data-length", span.span_length);
                                    $lli.attr("data-material", span.span_material);
                                    $lli.attr("data-case", span.spanning_case);
                                    $lli.attr("data-clearance", span.clearance);
                                    $lli.html("");
                                    if (span.span_line_no == "") {
                                        $lli.append("<span class='kh col-lg-1 col-md-1 col-xs-1' onclick='choiceSpan(this)'>" + span.span_no + "</span>&nbsp;--&nbsp;" + "<i style='font-style:normal;color:#214e75'>" + span.brg_type_name + "</i>");
                                    } else {
                                        $lli.append("<span class='kh col-lg-1 col-md-1 col-xs-1' onclick='choiceSpan(this)'>" + span.span_no + "</span>&nbsp;--&nbsp;" + "<i style='font-style:normal;color:#214e75'>" + span.brg_type_name + "</i>&nbsp;--&nbsp;<i style='font-style:normal;color:blue'>第" + span.span_line_no + "联</i>");
                                    }
                                    if (span.direction == "上行") {
                                        $li1.children("ul").append($lli);
                                    } else if (span.direction == "下行") {
                                        $li2.children("ul").append($lli);
                                    } else {
                                        $li3.children("ul").append($lli);
                                    }
                                    $lli.children("span").css("background", "#ccc");
                                    //successMessage("修改成功！");
                                    $('#opera1').dialog("close");
                                    autoFromMbr();
                                } else {
                                    if (json.error == "0") {
                                        errMessage("修改跨号失败！");
                                    } else {
                                        errMessage("跨号重复！");
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

    }

    /*****************************************************删除跨号**************************************************************/

    function delSpan() {
        if ($lli == undefined) {
            errMessage("请选择跨号！");
            return false;
        }
        $.SmartMessageBox({
            title: "跨号删除",
            content: "您是否确认删除此记录？",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $("#cover").show();
                $.ajax({
                    type: 'POST',
                    url: '../BrgMemberServlet',
                    dataType: 'json',
                    data: {
                        spanid: $lli.attr("data-id"),
                        choice: 5
                    },
                    error: function (msg) {
                        errMessage("系统错误！");
                    },
                    success: function (json) {
                        $("#cover").hide();
                        if (json.success == "success") {
                            //successMessage("删除成功！");
                            if ($lli.parent().children().length < 2) {
                                $lli.parent().parent().remove();
                                $lli.parent().remove();
                                $lli.remove();
                            } else {
                                $lli.remove();
                            }
                            $('#datatable_fixed_column').dataTable().fnClearTable();
                            autoFromMbr();
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

    var $ul = $("#tree-ul");
    $li1 = $("<li></li>")
    $li1.prop("value", "上行");
    $li1.prop("id", "上行");
    $li1.prop("class", "parent_li");
    $li1.append("<span title='展开'><i class='fa fa-lg fa-plus-circle'></i>上行</span>");
    $li2 = $("<li></li>")
    $li2.prop("value", "下行");
    $li2.prop("id", "下行");
    $li2.prop("class", "parent_li");
    $li2.append("<span title='展开'><i class='fa fa-lg fa-plus-circle'></i>下行</span>");
    $li3 = $("<li></li>")
    $li3.prop("value", "无");
    $li3.prop("id", "无");
    $li3.prop("class", "parent_li");
    $li3.append("<span title='展开'><i class='fa fa-lg fa-plus-circle'></i>无方向</span>");


    function initTree() {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "initTree",
            },
            error: function (msg) {
                errMessage("请求BrgCardServlet失败");
            },
            success: function (json) {
                if (json.success == "success") {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        if (data[i].direction == "上行") {
                            $ul.prepend($li1);
                            $li1.append("<ul hidden='hidden'></ul>");
                        }
                        if (data[i].direction == "下行") {
                            $ul.append($li2);
                            $li2.append("<ul hidden='hidden'></ul>");
                        }
                        else if (data[i].direction == "无") {
                            $ul.append($li3);
                            $li3.append("<ul hidden='hidden'></ul>");
                        }
                    }
                    animotion();
                }
            }
        });

    }
    //	var $ul1=$("<ul hidden='hidden'></ul>");
    /* $li1.append($ul1[0]);
     $li2.append($ul1[0]); */
    function animotion() {
        $tree.find("span").on("click", function () {
            if ($(this).parent().prop("class") == "parent_li") {
                if ($(this).parent().children("ul").prop("hidden") == true) {
                    $(this).parent().children("ul").prop("hidden", false);
                    $(this).parent().children("span").prop("title", "折叠");
                    $(this).parent().children("span").children("i").prop("class", "fa fa-lg fa-minus-circle");
                } else {
                    $(this).parent().children("ul").prop("hidden", "hidden");
                    $(this).parent().children("span").prop("title", "展开");
                    $(this).parent().children("span").children("i").prop("class", "fa fa-lg fa-plus-circle");
                }
                if ($ll == undefined) {
                    $ll = $(this).parent();
                } else if ($(this).parent()[0] == $ll[0]) {
                    return false;
                } else {
                    $ll.children("ul").prop("hidden", true);
                    $ll.children("span").prop("title", "展开");
                    $ll.children("span").children("i").prop("class", "fa fa-lg fa-plus-circle");
                    $ll = $(this).parent();
                }
            } else {
                choiceSpan($(this));
                queryMember();
            }
        });

    }


    /****************************************树形图枝干和叶子节点的点击控制********************************************/

    function ReAnimotion($obj) {
        $obj.find("span").on("click", function () {
            if ($(this).parent().prop("class") == "parent_li") {
                if ($(this).parent().children("ul").prop("hidden") == true) {
                    $(this).parent().children("ul").prop("hidden", false);
                    $(this).parent().children("span").prop("title", "折叠");
                    $(this).parent().children("span").children("i").prop("class", "fa fa-lg fa-minus-circle");
                } else {
                    $(this).parent().children("ul").prop("hidden", "hidden");
                    $(this).parent().children("span").prop("title", "展开");
                    $(this).parent().children("span").children("i").prop("class", "fa fa-lg fa-plus-circle");
                }
                if ($ll == undefined) {
                    $ll = $(this).parent();
                } else if ($(this).parent()[0] == $ll[0]) {
                    return false;
                } else {
                    $ll.children("ul").prop("hidden", true);
                    $ll.children("span").prop("title", "展开");
                    $ll.children("span").children("i").prop("class", "fa fa-lg fa-plus-circle");
                    $ll = $(this).parent();
                }
            } else {
                choiceSpan($(this));
                queryMember();
            }
        });

    }


    /***********************************************叶子节点的点击选中效果*****************************************************************/

    function choiceSpan(a) {
        $(a).parent().children("span").css("background", "#ccc");
        if ($lli == undefined) {
            $lli = $(a).parent();
        } else {
            if ($(a).parent()[0] == $lli[0]) {
            } else {
                $lli.children("span").css("background", "#fff");
                $lli = $(a).parent();
            }
        }
        queryMember();
    }


    /***********************************************两个隐藏div的初始化*************************************************/
    $('#opera').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    $('#opera1').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });
    $('#quickMen').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    $('#quickMen_table').dialog({
        autoOpen: false,
        width: 1050,
        height: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });
    $('#duplicate_table').dialog({
        autoOpen: false,
        width: 600,
        height: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    $('#opera').prop("hidden", false);
    $('#opera1').prop("hidden", false);


    $('#copyMem').dialog({
        title: "构件复制",
        autoOpen: false,
        width: 400,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });


    /****************************************初始化加载支座类型，主材类型，构件类型，桥型************************************************************/
    function initLX() {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "1"
            },
            error: function (msg) {
                errMessage("查询类型失败！");
            },
            success: function (json) {
                if (json.success == "success") {
                    obj = json.obj[0];
					console.log(JSON.stringify(json));
                    var len1 = obj.qx.length;
                    gjlx = obj.gjlx;
                    span.bridge_id = obj.bridge_id;
                    for (var ii = 0; ii < len1; ii++) {
                        $option = $("<option></option>");
                        $option.prop("value", obj.qx[ii].brg_type_name);
                        $option.prop("text", obj.qx[ii].brg_type_name);
                        qx.append($option);
                    }

                } else if (json.error == "-1") {
                    errMessage("请选择结构！");
                    $tree.prop("hidden", true);
                    $("a").removeAttr("onclick");

                } else {
                    errMessage("没有数据！");
                }
            }
        });

    }


    /***************************************初始化右边表格***************************************************************/
    function initTable() {
        var responsiveHelper_dt_basic = undefined;
        var responsiveHelper_datatable_fixed_column = undefined;
        var responsiveHelper_datatable_col_reorder = undefined;
        var responsiveHelper_datatable_tabletools = undefined;

        var breakpointDefinition = {
            tablet: 1024,
            phone: 480
        };

        /* COLUMN FILTER  */


        table = $('#datatable_fixed_column').DataTable({
            "deferRender": true,
            "processing": true,
            "sDom": "t" +
            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
            "dataSrc": "data",
            "autoWidth": false,
            "columns": [
                /* 							{
                 "class":          'details-control',
                 "orderable":      false,
                 "data":          null,
                 "defaultContent": ''
                 }, */
                {"data": "distr_name"},
                {"data": "component_name"},
                {"data": "member_type"},
                {"data": "member_no"},
                {"data": "member_model"},
                {"data": null},
                /*  { "data": "finish" } */
            ],
            "columnDefs": [{
                "targets": 5,
                "searchable": false,
                "render": function (data, type, full) {
                    return "&nbsp;<a class='btn btn-warning btn-xs " + control + "' rel='tooltip' data-placement='top'  data-id='" + data.r_id + "' data-original-title='修改' onclick='editMember(this)'><i class='fa fa-pencil'></i></a>&nbsp;&nbsp;<a class='btn btn-warning btn-xs " + control + "' rel='tooltip'  data-id='" + data.r_id + "' data-placement='top' data-original-title='删除' onclick='delMember(this)' ><i class='fa fa-minus'></i></a>";
                }
            }],
            "oLanguage": { //国际化配置
                "sProcessing": "正在获取数据，请稍后...",
                "sLengthMenu": "显示 _MENU_ 条",
                "sZeroRecords": "没有您要搜索的内容",
                "sInfo": " _START_ ~  _END_ 条 共 _TOTAL_ 条",
                "sInfoEmpty": "记录数为0",
                "sInfoFiltered": "(全部记录数 _MAX_ 条)",
                "sInfoPostFix": "",
                "sSearch": "搜索",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": "<",
                    "sNext": ">",
                    "sLast": "最后一页"
                }
            },
            "order": [[1, 'asc']],

            "preDrawCallback": function () {
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
            var row = table.row(tr);

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
    }

    /****************************************format方法************************************************************************/


    function format(d) {
        // `d` is the original data object for the row
        return '<table cellpadding="5" cellspacing="0" border="0" class="table table-hover table-condensed table-striped table-bordered">' +
                /* '<tr>'+
                 '<td style="width:100px">构件编号:</td>'+
                 '<td>'+d.member_no+'</td>'+
                 '</tr>'+ */
                /*
                 '<tr>'+
                 '<td>构件描述:</td>'+
                 '<td>'+d.member_desc+'</td>'+
                 '</tr>'+
                 */
            '<tr>' +
            '<td>构件型号:</td>' +
            '<td>' + d.member_model + '</td>' +
            '</tr>' +
            '</table>';
    }
    /**
     '<tr>'+
     '<td>主材信息:</td>'+
     '<td>'+d.material_name+'</td>'+
     '</tr>'+
     '<tr>'+
     '<td>支座信息:</td>'+
     '<td>'+d.bearing_name+'</td>'+
     '</tr>'+
     */


    /*************************************根据桥型筛选构件类型下拉框******************************************************************************************/

    function choiceType() {
        $type.html("");
        var type = $lli.attr("data-type");
        if (type == "梁式桥") {
            for (var ii = 0; ii < gjlx.length; ii++) {

                if (gjlx[ii].component1 == undefined || gjlx[ii].component1 == "") {

                } else {
                    $option = $("<option></option>");
                    $option.prop("value", gjlx[ii].member_name);
                    $option.prop("text", gjlx[ii].member_name);
                    $type.append($option);
                }
            }

        } else if (type == "肋拱桥" || type == "板拱桥" || type == "双曲拱桥" || type == "箱形拱桥") {
            for (var ii = 0; ii < gjlx.length; ii++) {

                if (gjlx[ii].component2 == undefined || gjlx[ii].component2 == "") {

                } else {
                    $option = $("<option></option>");
                    $option.prop("value", gjlx[ii].member_name);
                    $option.prop("text", gjlx[ii].member_name);
                    $type.append($option);
                }
            }
        } else if (type == "刚架拱桥" || type == "桁架拱桥") {
            for (var ii = 0; ii < gjlx.length; ii++) {

                if (gjlx[ii].component3 == undefined || gjlx[ii].component3 == "") {

                } else {
                    $option = $("<option></option>");
                    $option.prop("value", gjlx[ii].member_name);
                    $option.prop("text", gjlx[ii].member_name);
                    $type.append($option);
                }
            }
        } else if (type == "钢混组合拱桥") {
            for (var ii = 0; ii < gjlx.length; ii++) {

                if (gjlx[ii].component4 == undefined || gjlx[ii].component4 == "") {

                } else {
                    $option = $("<option></option>");
                    $option.prop("value", gjlx[ii].member_name);
                    $option.prop("text", gjlx[ii].member_name);
                    $type.append($option);
                }
            }
        } else if (type == "悬索桥") {
            for (var ii = 0; ii < gjlx.length; ii++) {

                if (gjlx[ii].component5 == undefined || gjlx[ii].component5 == "") {

                } else {
                    $option = $("<option></option>");
                    $option.prop("value", gjlx[ii].member_name);
                    $option.prop("text", gjlx[ii].member_name);
                    $type.append($option);
                }
            }
        } else if (type == "斜拉桥") {
            for (var ii = 0; ii < gjlx.length; ii++) {

                if (gjlx[ii].component6 == undefined || gjlx[ii].component6 == "") {

                } else {
                    $option = $("<option></option>");
                    $option.prop("value", gjlx[ii].member_name);
                    $option.prop("text", gjlx[ii].member_name);
                    $type.append($option);
                }
            }
        }

    }


    /************************************构件表格增加数据******************************************************************************/

    function addRow(member) {
        $('#datatable_fixed_column').DataTable().row.add({
            "distr_name": member.distr_name,
            "component_name": member.component_name,
            "member_type": member.member_type,
            "member_no": member.member_no,
            "caozuo": "&nbsp;<a class='btn btn-warning btn-xs " + control + "' rel='tooltip' data-placement='top'  data-id='" + member.r_id + "' data-original-title='修改' onclick='editMember(this)'><i class='fa fa-pencil'></i></a>&nbsp;&nbsp;<a class='btn btn-warning btn-xs " + control + "' rel='tooltip'  data-id='" + member.r_id + "' data-placement='top' data-original-title='删除' onclick='delMember(this)' ><i class='fa fa-minus'></i></a>",
            "member_desc": member.member_desc,
            "member_model": member.member_model,
            "material_name": member.material_name,
            "bearing_name": member.bearing_name
        }).draw(false);
    }


    /***********************************js生成uuid*******************************************************************/

    Math.uuid = function (len, radix) {
        var CHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
        var chars = CHARS, uuid = [], i;
        radix = radix || chars.length;

        if (len) {
            // Compact form
            for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random() * radix];
        } else {
            // rfc4122, version 4 form
            var r;

            // rfc4122 requires these characters
            uuid[14] = '4';

            // Fill in random data.  At i==19 set the high bits of clock sequence as
            // per rfc4122, sec. 4.1.5
            for (i = 0; i < 32; i++) {
                if (!uuid[i]) {
                    r = 0 | Math.random() * 16;
                    uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
                }
            }
        }

        return uuid.join('');
    };


    function copyMember() {
        $('#copyMem').dialog("open");
    }

    function copyThisDirection() {
        if ($lli == undefined) {
            errMessage("请先选中一个方向");
            return;
        }
        var oldDirection = $lli.attr('data-direction');
        var direction = $('#allDirection').val();
        var copyBridge = $('#allBridge').val();
        if (session.id == copyBridge && direction == oldDirection) {
            errMessage("不可复制当前桥当前跨至当前桥当前跨！");
            return;
        }
        $.SmartMessageBox({
            title: "复制提示",
            content: "确认从选中的桥梁中复制构件到当前方向中吗？该操作会清空当前方向的构件！",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var s_id = $lli.attr("data-id");
                showMask();
                $.ajax({
                    type: 'POST',
                    url: '../BrgMemberServlet',
                    dataType: 'json',
                    data: {
                        choice: "copyThisDirection",
                        direction: direction,
                        copyBridge: copyBridge,
                        bridge: session.id,
                        oldDirection: oldDirection
                    },
                    error: function (msg) {
                        errMessage("请求BrgMemberServlet失败");
                        hidMask();
                    },
                    success: function (json) {
                        hidMask();
                        if (json.success == "fail") {
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
                        } else {
                            if (json.obj == true) {
                                successMessage("复制成功");
                                location.reload();
                                autoFromMbr();
                            } else {
                                errMessage("复制失败");
                            }
                        }
                    }
                });
            }
        });
    }


    function copyThisMem() {
        if ($lli == undefined) {
            errMessage("请先选中一个跨");
            return;
        }
        var oldDirection = $lli.attr('data-direction');
        var oldSpan = $lli.attr('data-name');
        var direction = $('#allDirection').val();
        var span_no = $('#allSpan').val();
        var copyBridge = $('#allBridge').val();
        if (session.id == copyBridge && direction == oldDirection && span_no == oldSpan) {
            errMessage("不可复制当前桥当前跨至当前桥当前跨！");
            return;
        }
        $.SmartMessageBox({
            title: "复制提示",
            content: "确认从选中的桥梁中复制构件到当前跨中吗？该操作会清空当前跨的构件！",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                var s_id = $lli.attr("data-id");
                showMask();
                $.ajax({
                    type: 'POST',
                    url: '../BrgMemberServlet',
                    dataType: 'json',
                    data: {
                        choice: "copyThisMem",
                        direction: direction,
                        span_no: span_no,
                        copyBridge: copyBridge,
                        s_id: s_id
                    },
                    error: function (msg) {
                        errMessage("请求BrgMemberServlet失败");
                        hidMask();
                    },
                    success: function (json) {
                        hidMask();
                        if (json.success == "fail") {
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
                        } else {
                            if (json.obj == true) {
                                successMessage("复制成功");
                                location.reload();
                                autoFromMbr();
                            } else {
                                errMessage("复制失败");
                            }
                        }
                    }
                });
            }
        });
    }
    function copyAllMem() {
        var copyBridge = $('#allBridge').val();
        if (session.id == copyBridge) {
            errMessage("不可复制当前桥至当前桥！");
            return;
        }
        $.SmartMessageBox({
            title: "复制提示",
            content: "确认从选中的桥梁中复制所有的跨和构件到当前桥梁吗？该操作会清空当前桥梁所有跨和构件记录！",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                showMask();
                $.ajax({
                    type: 'POST',
                    url: '../BrgMemberServlet',
                    dataType: 'json',
                    data: {
                        choice: "copyAllMem",
                        copyBridge: copyBridge
                    },
                    error: function (msg) {
                        errMessage("请求BrgMemberServlet失败");
                        hidMask();
                    },
                    success: function (json) {
                        hidMask();
                        if (json.success == "fail") {
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
                        } else {
                            if (json.obj == true) {
                                successMessage("复制成功");
                                location.reload();
                                autoFromMbr();
                            } else {
                                errMessage("复制失败");
                            }
                        }
                    }
                });
            }
        });
    }

    $('#allBridge').change(function () {
        buildDirection();
    });
    $('#allDirection').change(function () {
        buildSpan();
    });
    function getAllBridge() {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "getAllBridge"
            },
            error: function (msg) {
                errMessage("请求BrgMemberServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
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
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        $('#allBridge').append("<option value='" + data[i].bridge_id + "'>" + data[i].bridge_name + "</option>");
                    }
                    $('#allBridge').trigger('change');
                }
            }
        });
    }

    function buildDirection() {
        var brg_id = $('#allBridge').val();
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "buildDirection",
                brg_id: brg_id
            },
            error: function (msg) {
                errMessage("请求BrgMemberServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("失败");
                            break;
                        case 2:
                            errMessage("服务器错误");
                            break;
                        case 3:
                            errMessage("");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    $('#allDirection').empty();
                    for (var i = 0; i < data.length; i++) {
                        $('#allDirection').append("<option>" + data[i] + "</option>");
                    }
                    $('#allDirection').trigger('change');
                }
            }
        });
    }

    function buildSpan() {
        var brg_id = $('#allBridge').val();
        var direction = $('#allDirection').val();
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            data: {
                choice: "buildSpan",
                brg_id: brg_id,
                direction: direction
            },
            error: function (msg) {
                errMessage("请求BrgMemberServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    switch (json.error) {
                        case 1:
                            errMessage("失败");
                            break;
                        case 2:
                            errMessage("服务器错误");
                            break;
                        case 3:
                            errMessage("");
                            break;
                        default:
                            break;
                    }
                } else {
                    var data = json.obj;
                    $('#allSpan').empty();
                    for (var i = 0; i < data.length; i++) {
                        $('#allSpan').append("<option>" + data[i] + "</option>");
                    }
                    $('#allSpan').trigger('change');
                }
            }
        });
    }

    /**********************************提示信息*********************************************************************/
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

    
    function showMask() {
        $("#cover").show();
    }
    function hidMask() {
        $("#cover").css('display', 'none');
    }

    var control = "disabled";
    function releaseAdmin() {//管理员
        $('.widget-body-toolbar a').removeClass('disabled');
        control = "";
    }
    function releaseManage() {//项目负责人
    }
    function releaseMember() {//项目参与人
    }
    function releaseGuest() {//普通用户
    }
    function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
    	 $('.widget-body-toolbar a').removeClass('disabled');
         control = "";
		}
	
	}
    function releaseOrgAdmin() {//管养公司管理员
    	 $('.widget-body-toolbar a').removeClass('disabled');
        control = "";
    }
</script>
</body>
</html>