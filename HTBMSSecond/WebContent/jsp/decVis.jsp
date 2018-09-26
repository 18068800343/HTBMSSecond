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
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/font.css">
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

			<span class="ribbon-button-alignment"> <span id="refresh"
                                                         class="btn btn-ribbon" data-action="resetWidgets"
                                                         data-title="refresh" rel="tooltip" data-placement="bottom"
                                                         data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
                                                         data-html="true"> <i class="fa fa-refresh"></i>
			</span>
			</span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>养护决策</li>
            <li>可视化</li>
            <li>裂缝分布图</li>
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
                <article class="col-sm-4 col-md-4 col-lg-3">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
								<span class="widget-icon"> <i class="fa fa-eye"></i>
								</span>
                            <h2>结构</h2>

                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget content -->
                            <div class="widget-body no-padding">

                                <form>
                                    <div class="form-group" style="padding: 5px 10px">
                                        <label>项目</label>
                                        <select style="width: 100%" class="form-control input-sm select2" id="project">
                                        </select>
                                    </div>
                                </form>
                                <div class="tree smart-form"
                                     style="height: 500px; overflow-y: auto;"></div>

                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

                    </div>
                    <!-- end widget -->

                </article>
                <!-- WIDGET END -->

                <!-- NEW WIDGET START -->
                <article class="col-sm-8 col-md-8 col-lg-9">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
								<span class="widget-icon"> <i class="fa fa-eye"></i>
								</span>
                            <h2>构件</h2>

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
                                            <div class="pull-left col-xs-3">
                                                <input class="form-control" id="searchData" value=""
                                                       placeholder="搜索" type="text">
                                            </div>
                                            <a class="btn btn-primary pull-right" onclick="crackView()">
                                                可视化 </a>

                                        </div>

                                    </div>


                                </div>

                                <table id="dt_basic"
                                       class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>构件</th>
                                        <th>缺损位置</th>
                                        <th>裂缝类型</th>
                                        <th>数量</th>
                                        <th>长度(m)</th>
                                        <th>宽度(mm)</th>
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

                </article>
                <!-- WIDGET END -->

            </div>
        </section>
    </div>
    <!-- END #MAIN CONTENT -->
</div>
<!-- END #MAIN PANEL -->

<div id="svg" hidden="hidden">
    <svg id="mysvg" version="1.1" xmlns="http://www.w3.org/2000/svg" style="width: 700px;height: 1000px"></svg>
</div>
<div id="visDialog" hidden="hidden">
    <form>
        <fieldset>
        	<div class="form-group">
        		<label>裂缝类型</label>
                <select class="select2" id="defectName">
                	<option value="全部">全部</option>
                	<option value="横向裂缝">横向裂缝</option>
                	<option value="竖向裂缝">竖向裂缝</option>
                	<option value="纵向裂缝">纵向裂缝</option>
                	<option value="斜向裂缝">斜向裂缝</option>
                	<option value="水平裂缝">水平裂缝</option>
                	<option value="网状裂缝">网状裂缝</option>
                	<option value="其他裂缝">其他裂缝</option>
                </select>
            </div>
            <div class="form-group">
                <label>梁长度</label> <input class="form-control" id="beamLength"
                                          value="" placeholder="梁长度" type="text">
            </div>
            <div class="form-group">
                <label>底板宽度</label> <input class="form-control" id="bottomWidth"
                                           value="" placeholder="底板宽度" type="text">
            </div>
            <div class="form-group">
                <label>腹板高度</label> <input class="form-control" id="webHeight"
                                           value="" placeholder="腹板高度" type="text">
            </div>
            <div class="form-group">
                <label>翼板宽度</label> <input class="form-control" id="flangeWidth"
                                           value="" placeholder="翼板宽度" type="text">
            </div>
            <div class="form-group">
                <label>湿接缝宽度</label> <input class="form-control" id="jointWidth"
                                            value="" placeholder="湿接缝宽度" type="text">
            </div>
        </fieldset>
    </form>


</div>
<%@ include file="footer.jsp" %>

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
<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

<script src="../js/saveSvgAsPng.js"></script>

<script type="text/javascript">
    var table = undefined;
    /**树节点*/
    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();
        <%if (oc == null) {%>
        errMessage("请选择结构物");
        <%} else {%>
        initTree();
        project.init();
        initSpanNum();
        <%}%>
    });

    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
    });

    //项目
    var project = {
        data: [],
        init: function () {
            /* $.ajax({
                type: 'POST',
                url: '../DecVisServlet',
                dataType: 'json',
                data: {
                    type: "initProject"
                },
                error: function (msg) {
                    errMessage("请求StatisticsServlet失败");
                },
                success: function (json) {
                    project.data = json.obj;
                    
                }
            }); */
        	 <%if (oc != null) {%>
        	 var info =<%=JSON.toJSONString(oc)%>
        	 	
             	project.data=info
         		project.build();
             <%}%>
            
        },
        build: function () {
            var d = $('#project');
            d.empty();
            if(project.data.prj_id!=null&&project.data.prj_id!=undefined&&project.data.prj_id!=""){
            	 d.append('<option value="' + project.data.prj_id + '">'
                         + project.data.prj_desc + '</option>');
            }
           
          
            d.trigger('change');
        },
        getId: function () {
            return $('#project').val();
        },
        getName: function () {
            var d = project.getId();
            for (var i = 0; i < project.data.length; i++) {
                if (d == project.data[i].prj_id) {
                    return project.data[i].prj_desc;
                }
            }
            return '全部';
        }
    }

    function initTree() {
        $.ajax({
            type: 'POST',
            url: '../DecVisServlet',
            dataType: 'json',
            data: {
                type: "initTree"
            },
            error: function (msg) {
                errMessage("请求DecVisServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
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
                } else {
                    $('.tree').empty();
                    $('.tree').append(buildTree(json.obj));
                    treeControl();
                }
            }
        });
    }

    //构造树
    function buildTree(data) {
        var ul = $("<ul></ul>")
        for (var i = 0; i < data.length; i++) {
            var li = $("<li></li>");
            li.attr('data-type', data[i].type);
            li.attr('data-id', data[i].id);
            li.attr('data-name', data[i].name)
            if (data[i].type != "direction") {
                li.prop('style', 'display:none');
            }
            if (data[i].children.length > 0) {
                li.append("<span><i class='fa fa-lg fa-plus-circle'></i> "
                    + data[i].name + "</span>");
                li.append(buildTree(data[i].children));
            } else {
                if (data[i].bgco == undefined || data[i].bgco == "") {
                    li.append("<span class='tree-second'>" + data[i].name
                        + "</span>");
                } else {
                    li
                        .append("<span class='tree-second' data-brgType='" + data[i].bgco + "'>"
                            + data[i].name + "号跨" + "</span>");
                }

                $('#cont').append(
                    "<option value='" + data[i].id + "'>" + data[i].name
                    + "<option>");
            }
            ul.append(li);
        }
        return ul;
    }

    var sss = undefined;//级联关闭1级
    var sss2 = undefined;//级联关闭2级
    var treeSecondSelect = undefined;//选中状态
    //树控制
    function treeControl() {
        sss = undefined;
        treeSecondSelect = undefined;
        $('.tree > ul').attr('role', 'tree').find('ul').attr('role',
            'group');
        $('.tree').find('li:has(ul)').addClass('parent_li').attr('role',
            'treeitem').find(' > span').attr('title', '展开').on(
            'click',
            function (e) {

                sss = this;
                var children = $(this).parent('li.parent_li').find(
                    ' > ul > li');
                if (children.is(':visible')) {
                    children.hide('fast');
                    $(this).attr('title', '展开').find(' > i')
                        .removeClass().addClass(
                        'fa fa-lg fa-plus-circle');
                } else {
                    children.show('fast');
                    $(this).attr('title', '折叠').find(' > i')
                        .removeClass().addClass(
                        'fa fa-lg fa-minus-circle');
                }
                e.stopPropagation();
            });
        $('.tree-second').on(
            'click',
            function () {
                $(treeSecondSelect).css('background', '');
                $(this).css('background', '#ccc');
                $(this).attr('title', '展开');
                treeSecondSelect = this;
                var info = {};
                /* info.line_no=$(treeSecondSelect).parents('li[data-type=line]').attr('data-id');
                 info.line_name=$(treeSecondSelect).parents('li[data-type=line]').attr('data-name');
                 info.mode=$(treeSecondSelect).closest('ul').closest('li').attr('data-type'); */
                info.id = $(treeSecondSelect).closest('li').attr(
                    'data-id');
                info.name = $(treeSecondSelect).closest('li').attr(
                    'data-name');
                info.type = $(treeSecondSelect).attr('data-brgType');
                info.direction = $(treeSecondSelect).parents(
                    'li[data-type=direction]').attr('data-name');
                initTable(info);

                //方向
                direction = info.direction; //填写
                //桥型
                bridgeType = formatBrgType(info.type); //填写
                initVisDialog();
                //跨号
                spanNumber = info.name; //填写
                //跨总数
                spanCount = spanNum[direction]; //填写 统计
            });
    }

    var formatBrgType = function (d) {
        switch (d) {
            case '1':
                return "板梁";
            case '2':
                return "板梁";
            case '3':
                return "板梁";
            case '4':
                return "组合箱梁";
            case '8':
                return "大箱梁";
            case '9':
                return "大箱梁";
            case '10':
                return "大箱梁";
        }
    }

    /*
     返回数据格式 当前选择项目、方向、跨号下面的构件病害记录
     defect_name_f为  裂缝  的病害的整条记录
     */

    /*

     chk_defect_memo
     defect_attr
     defect_count
     defect_count_val
     defect_id
     defect_location_desc
     defect_location_desc_val
     defect_name
     defect_name_f
     defect_photo
     defect_photo_memo
     defect_serial
     mbr_chk_id
     mbr_no
     repair_state
     */

    //组合箱梁 梁长  底板宽  腹板高  翼板宽  湿接缝宽
    //板梁	梁长  底板宽  腹板高  翼板宽
    //大箱梁  梁长  底板宽  腹板高  翼板宽
    //线条类型
    var DASH = 1, SOLID = 0;
    //起始点坐标偏移量
    var DX = 150, DY = 50;
    //梁SVG长度
    var svgBeamLength = 500;
    //底板SVG宽度
    var svgBottomWidth;
    //腹板SVG高度
    var svgWebHeight;
    //翼板SVG宽度
    var svgFlangeWidth;
    //湿接缝SVG宽度
    var svgJointWidth;
    //第一参考点第一svg偏移
    var svgA;
    //第一参考点第二svg偏移
    var svgB;
    //第二参考点第一svg偏移
    var svgC;
    //第二参考点第二svg偏移
    var svgD;
    //裂缝svg总长
    var svgCrackLength;
    //当前坐标
    var x, y;
    //横向线条坐标位置数组
    var ys;
    //构件名称数组
    var ts;
    //已绘制的裂缝数量
    var crackNumber;

    //方向
    var direction; //填写
    //桥型
    var bridgeType; //填写
    //跨号
    var spanNumber; //填写
    //跨总数
    var spanCount; //填写 统计
    //梁总数
    var beamCount; //填写 统计
    //梁长度
    var beamLength; //填写 用户输入
    //底板宽度
    var bottomWidth; //填写 用户输入
    //腹板高度
    var webHeight; //填写 用户输入
    //翼板宽度
    var flangeWidth; //填写 用户输入
    //湿接缝宽度
    var jointWidth; //填写 用户输入
    //构件
    var component; //member
    //参考位置1
    var reference1;
    //距参考位置1的第一个坐标
    var a;
    //距参考位置1的第二个坐标
    var b;
    //参考位置2
    var reference2;
    //距参考位置2的第一个坐标
    var c;
    //距参考位置2的第二个坐标
    var d;
    //裂缝总数
    var crackCount;
    //裂缝类型
    var crackType;
    //裂缝总长度
    var crackLength;

    var defect_list = undefined;//存储返回的病害数据
    var defect_list_h;
    var defect_list_sx;
    var defect_list_zx;
    var defect_list_xx;
    var defect_list_sp;
 //   var defect_list_hx;
    var defect_list_wz;
    var defect_list_qt;
    
    
    var formatBrgType = function (d) {
        switch (d) {
            case '1':
                return "板梁";
            case '2':
                return "板梁";
            case '3':
                return "板梁";
            case '4':
                return "组合箱梁";
            case '8':
                return "大箱梁";
            case '9':
                return "大箱梁";
            case '10':
                return "大箱梁";
        }
    }

    var formatMember = function (d) {
        try {
            if (bridgeType == "组合箱梁") {
                if (d.indexOf('#梁') >= 0 && d.indexOf('外侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁外侧翼板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('外侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁外侧腹板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('右侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁右侧翼板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('右侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁右侧腹板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('底板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁底板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('内侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁内侧腹板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('内侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁内侧翼板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('左侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁左侧腹板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('左侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁左侧翼板';
                }
                if (d.indexOf('湿接缝') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#湿接缝';
                }
                alert("组合箱梁构件格式化不完整！请联系我们进行修正");
            }
        } catch (e) {
            alert('组合箱梁构件格式化出错！请联系我们进行修正');
        }

        try {
            if (bridgeType == "板梁") {
                if (d.indexOf('外侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '外侧翼板';
                }
                if (d.indexOf('外侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '外侧腹板';
                }
                if (d.indexOf('右侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '右侧翼板';
                }
                if (d.indexOf('右侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '右侧腹板';
                }
                if (d.indexOf('#梁') >= 0 && d.indexOf('底板') >= 0) {
                    return d.substring(0, d.indexOf('#')) + '#梁底板';
                }
                if (d.indexOf('内侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '内侧腹板';
                }
                if (d.indexOf('内侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '内侧翼板';
                }
                if (d.indexOf('左侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '左侧腹板';
                }
                if (d.indexOf('左侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '左侧翼板';
                }
                alert("板梁构件格式化不完整！请联系我们进行修正");
            }
        } catch (e) {
            alert('板梁构件格式化出错！请联系我们进行修正');
        }

        try {
            if (bridgeType == "大箱梁") {
                console.log(d);
                if (d.indexOf('外侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '外侧翼板';
                }
                if (d.indexOf('外侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '外侧腹板';
                }
                if (d.indexOf('右侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '右侧翼板';
                }
                if (d.indexOf('右侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '右侧腹板';
                }
                if (d.indexOf('底板') >= 0) {
                    return '底板';
                }
                if (d.indexOf('内侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '内侧腹板';
                }
                if (d.indexOf('内侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '内侧翼板';
                }
                if (d.indexOf('左侧') >= 0 && d.indexOf('腹板') >= 0) {
                    return '左侧腹板';
                }
                if (d.indexOf('左侧') >= 0 && d.indexOf('翼板') >= 0) {
                    return '左侧翼板';
                }
                alert("大箱梁构件格式化不完整！请联系我们进行修正");
            }
        } catch (e) {
            alert('大箱梁构件格式化出错！请联系我们进行修正');
        }

    }


    function startDraw() {
        if (defect_list == undefined) {
            errMessage("未选择跨");
            return;
        }
        if (defect_list.length == 0) {
            errMessage("该跨下没有裂缝");
            return;
        }

        $('#svg').dialog({
            buttons: [
                {
                    html: "隐藏编号",
                    "class": "numcontrol btn btn-default",
                    click: function () {
                        if ($('.numcontrol').html().indexOf('隐藏') >= 0) {
                            $('text[num="num"]').hide();
                            $('.numcontrol').html("显示编号");
                        } else if ($('.numcontrol').html().indexOf('显示') >= 0) {
                            $('text[num="num"]').show();
                            $('.numcontrol').html("隐藏编号");
                        }
                    }
                },
                {
                    html: "保存为图片",
                    "class": "btn btn-default",
                    click: function () {
                        save();
                    }
                },
                {
                    html: "确定",
                    "class": "btn btn-default",
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ]
        });

        $('#svg').dialog('open');

        var mod = true;
        var dd=null;
        var defectName=$("#defectName").val();
        if(defectName=="全部"){
        	dd=defect_list;
        }else if(defectName=="横向裂缝"){
        	dd=defect_list_h;
        }else if(defectName=="竖向裂缝"){
        	dd=defect_list_sx;
        }else if(defectName=="纵向裂缝"){
        	dd=defect_list_zx;
        }else if(defectName=="斜向裂缝"){
        	dd=defect_list_xx;
        }else if(defectName=="水平裂缝"){
        	dd=defect_list_sp;
        }else if(defectName=="网状裂缝"){
        	dd=defect_list_wz;
        }else if(defectName=="其他裂缝"){
        	dd=defect_list_qt;
        }
        
        for (var i = 0; i < dd.length; i++) {
            var def = dd[i];
            if (def.mbr_no.indexOf('外侧') >= 0 || def.mbr_no.indexOf('内侧') >= 0) {
                mod = true;
            } else if (def.mbr_no.indexOf('右侧') >= 0 || def.mbr_no.indexOf('左侧') >= 0) {
                mod = false;
            }
        }
        draw(mod);

        for (var i = 0; i < dd.length; i++) {
            var def = dd[i];
            var count_val = JSON.parse(def.defect_count_val);
            var loc_val = JSON.parse(def.defect_location_desc_val);
            component = formatMember(def.mbr_no);
            reference1 = loc_val[2];
            a = loc_val[3];
            b = loc_val[4];
            reference2 = loc_val[5];
            c = loc_val[6];
            d = loc_val[7];
            crackCount = count_val[0];
            crackType = def.defect_name;
            crackLength = count_val[1];
            drawCrack();
        }

    }

    function initCrack() {
        svgA = svgBeamLength * a / beamLength;
        svgB = svgBeamLength * b / beamLength;
        svgC = svgBeamLength * c / beamLength;
        svgD = svgBeamLength * d / beamLength;
        svgCrackLength = svgBeamLength * crackLength / beamLength;

        crackNumber++;
    }


    //填写完成调用
    //初始化跨相关变量和SVG
    function initSpan() {
        $('#mysvg').html('');
        crackNumber = 0;
        ys = new Array();
        ts = new Array();

        svgBottomWidth = svgBeamLength * bottomWidth / beamLength;
        svgWebHeight = svgBeamLength * webHeight / beamLength;
        svgFlangeWidth = svgBeamLength * flangeWidth / beamLength;
        svgJointWidth = svgBeamLength * jointWidth / beamLength;
    }


    //绘制
    function draw(mod) {
        initSpan();

        if (bridgeType.indexOf('组合箱梁') >= 0) {
            drawSpan1(mod);
        } else if (bridgeType.indexOf('板梁') >= 0) {
            drawSpan2(mod);
        } else if (bridgeType.indexOf('大箱梁') >= 0) {
            drawSpan3(mod);
        }


        drawStub();
        drawRuler();
        //drawCrack();
        ajustSVGHeight();
    }


    //表格
    var table_no = 0;
    table = $('#dt_basic')
        .DataTable(
            {
                "sDom": "t"
                + "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
                "bDestroy": true,
                "iDisplayLength": 10,
                "autoWidth": true,
                "bScrollCollapse": true,
                "sScrollY": 400,
                "oLanguage": {
                    "sSearch": '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
                },
                "columns": [{
                    "data": null,
                }, {
                    "data": "member"
                },//构件名
                    {
                        "data": "defect_loc"
                    },//病害缺损位置
                    {
                        "data": "crack"
                    },//病害名称名--defect_name
                    {
                        "data": "number"
                    },//通过取到的defect_count_val格式化
                    {
                        "data": "length"
                    },//通过取到的defect_count_val格式化
                    {
                        "data": "width"
                    } //通过取到的defect_count_val格式化
                ],
                "columnDefs": [{
                    "targets": 0,
                    "searchable": false,
                    "render": function (data, type, full) {
                        return table_no++;
                    }
                }],
                "order": [[0, 'asc']],
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

    function initTable(info) {
        var prj = $('#project').val();
        $('#dt_basic').dataTable().fnClearTable();
        $.ajax({
            type: 'POST',
            url: '../DecVisServlet',
            dataType: 'json',
            data: {
                type: "initTable",
                prj_id: prj,
                span_no: info.name,
                direction: info.direction
            },
            error: function (msg) {
                errMessage("请求DecVisServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
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
                } else {
                    table_no = 0;
                    var data = json.obj.list;
                    beamCount = json.obj.beam;
                    defect_list = data;
                    defect_list_h=json.obj.list1;
                    defect_list_sx=json.obj.list2;
                    defect_list_zx=json.obj.list3;
                    defect_list_xx=json.obj.list4;
                    defect_list_sp=json.obj.list5;
    //                defect_list_hx=json.obj.list6;
                    defect_list_wz=json.obj.list7;
                    defect_list_qt=json.obj.list8;
                    var d = [];
                    for (var i = 0; i < data.length; i++) {
                        var val = JSON.parse(data[i].defect_count_val);
                        var s = {
                            member: data[i].mbr_no,
                            defect_loc: data[i].defect_location_desc,
                            crack: data[i].defect_name,
                            number: val[0],
                            length: val[1],
                            width: val[2]
                        }
                        d.push(s);
                    }
                    table.rows.add(d).draw(false);
                }
            }
        });
    }

    function crackView() {
        if (defect_list == undefined) {
            errMessage("未选择跨");
            return;
        }
        if (defect_list.length == 0) {
            errMessage("该跨下没有裂缝");
            return;
        }

        $('#visDialog').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 确定",
                "class": "btn btn-default",
                click: function () {
                    beamLength = Number($('#beamLength').val());
                    bottomWidth = Number($('#bottomWidth').val());
                    webHeight = Number($('#webHeight').val());
                    flangeWidth = Number($('#flangeWidth').val());
                    jointWidth = Number($('#jointWidth').val());
                    $(this).dialog("close");
                    startDraw();
                }
            }, {
                html: "<i class='fa fa-times'></i>&nbsp; 取消",
                "class": "btn btn-default",
                click: function () {
                    $(this).dialog("close");
                }
            }]
        });
        $('#visDialog').dialog({
            title: "可视化"
        });
        $('#visDialog').dialog("open");
    }


    function errMessage(info) {
        $.smallBox({
            title: "处理信息",
            content: "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 4000
        });
    }

    function successMessage(info) {
        $.smallBox({
            title: "处理信息",
            content: "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
            color: "#659265",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 4000
        });
    }

    /************************************************ 测试 ************************************************/

    //dialog
    $('#svg').dialog({
        autoOpen: false,
        width: 750,
        maxHeight: 650,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: '病害可视化'
    });
    $('#visDialog').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: '病害可视化'
    });

    function openVis() {
        $('#visDialog').dialog('open');
    }

    var spanNum = {
        "上行": 0,
        "下行": 0,
        "无": 0
    }

    function initSpanNum() {
        $.ajax({
            type: 'POST',
            url: '../DecVisServlet',
            dataType: 'json',
            data: {
                type: "initSpanNum",
            },
            error: function (msg) {
                errMessage("请求StructMgrServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
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
                } else {
                    var list = json.obj;
                    for (var s in list) {
                        spanNum[s] = list[s];
                    }
                }
            }
        });
    }

    function initVisDialog() {
        if (bridgeType == '板梁') {
            $('#jointWidth').closest('div').hide();
        } else if (bridgeType == '大箱梁') {
            $('#jointWidth').closest('div').hide();
        } else if (bridgeType == '组合箱梁') {
            $('#jointWidth').closest('div').show();
        }
    }


    function releaseAdmin() {//管理员

    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户

    }


    function drawSpan1(mod) {
        var textHeight = 20;
        var text;

        x = DX;
        y = DY;
        drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');

        if (direction.indexOf('下') >= 0) {
            for (var i = 1; i <= beamCount; i++) {
                if (mod) {
                    text = i + "#梁外侧翼板";
                } else {
                    text = i + "#梁右侧翼板";
                }
                y = y + svgFlangeWidth;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - (svgFlangeWidth / 2) + (textHeight / 2), text);
                ys[(i - 1) * 6] = y;
                ts[(i - 1) * 6] = text;

                if (mod) {
                    text = i + "#梁外侧腹板";
                } else {
                    text = i + "#梁右侧腹板";
                }
                y = y + svgWebHeight;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
                ys[(i - 1) * 6 + 1] = y;
                ts[(i - 1) * 6 + 1] = text;

                text = i + "#梁底板";
                y = y + svgBottomWidth;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgBottomWidth / 2 + textHeight / 2, text);
                ys[(i - 1) * 6 + 2] = y;
                ts[(i - 1) * 6 + 2] = text;

                if (mod) {
                    text = i + "#梁内侧腹板";
                } else {
                    text = i + "#梁左侧腹板";
                }
                y = y + svgWebHeight;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
                ys[(i - 1) * 6 + 3] = y;
                ts[(i - 1) * 6 + 3] = text;

                if (mod) {
                    text = i + "#梁内侧翼板";
                } else {
                    text = i + "#梁左侧翼板";
                }
                y = y + svgFlangeWidth;
                if (i == beamCount) {
                    drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                } else {
                    drawLine(x, y, x + svgBeamLength, y, DASH, 'BLACK');
                }
                drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
                ys[(i - 1) * 6 + 4] = y;
                ts[(i - 1) * 6 + 4] = text;

                if (i != beamCount) {
                    text = i + "#湿接缝";
                    y = y + svgJointWidth;
                    drawLine(x, y, x + svgBeamLength, y, DASH, 'BLACK');
                    drawText(0, y - svgJointWidth / 2 + textHeight / 2, text);
                    ys[(i - 1) * 6 + 5] = y;
                    ts[(i - 1) * 6 + 5] = text;
                }
            }
        } else {
            for (var i = beamCount; i >= 1; i--) {
                if (mod) {
                    text = i + "#梁内侧翼板";
                } else {
                    text = i + "#梁左侧翼板";
                }
                y = y + svgFlangeWidth;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
                ys[(beamCount - i) * 6] = y;
                ts[(beamCount - i) * 6] = text;

                if (mod) {
                    text = i + "#梁内侧腹板";
                } else {
                    text = i + "#梁左侧腹板";
                }
                y = y + svgWebHeight;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
                ys[(beamCount - i) * 6 + 1] = y;
                ts[(beamCount - i) * 6 + 1] = text;

                text = i + "#梁底板";
                y = y + svgBottomWidth;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgBottomWidth / 2 + textHeight / 2, text);
                ys[(beamCount - i) * 6 + 2] = y;
                ts[(beamCount - i) * 6 + 2] = text;

                if (mod) {
                    text = i + "#梁外侧腹板";
                } else {
                    text = i + "#梁右侧腹板";
                }

                y = y + svgWebHeight;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
                ys[(beamCount - i) * 6 + 3] = y;
                ts[(beamCount - i) * 6 + 3] = text;

                if (mod) {
                    text = i + "#梁外侧翼板";
                } else {
                    text = i + "#梁右侧翼板";
                }
                y = y + svgFlangeWidth;
                if (i == 1) {
                    drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                } else {
                    drawLine(x, y, x + svgBeamLength, y, DASH, 'BLACK');
                }
                drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
                ys[(beamCount - i) * 6 + 4] = y;
                ts[(beamCount - i) * 6 + 4] = text;

                if (i != 1) {
                    text = (i - 1) + "#湿接缝";
                    y = y + svgJointWidth;
                    drawLine(x, y, x + svgBeamLength, y, DASH, 'BLACK');
                    drawText(0, y - svgJointWidth / 2 + textHeight / 2, text);
                    ys[(beamCount - i) * 6 + 5] = y;
                    ts[(beamCount - i) * 6 + 5] = text;
                }
            }
        }
    }
    //绘制板梁
    function drawSpan2(mod) {
        var textHeight = 20;
        var text;

        x = DX;
        y = DY;
        drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');

        if (direction.indexOf('下') >= 0) {
            if (mod) {
                text = "外侧翼板";
            } else {
                text = "右侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[0] = y;
            ts[0] = text;

            if (mod) {
                text = "外侧腹板";
            } else {
                text = "右侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[1] = y;
            ts[1] = text;

            for (var i = 1; i <= beamCount; i++) {
                text = i + "#梁底板";
                y = y + svgBottomWidth;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgBottomWidth / 2 + textHeight / 2, text);
                ys[i + 1] = y;
                ts[i + 1] = text;
            }

            if (mod) {
                text = "内侧腹板";
            } else {
                text = "左侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[Number(beamCount) + 2] = y;
            ts[Number(beamCount) + 2] = text;

            if (mod) {
                text = "内侧翼板";
            } else {
                text = "左侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[Number(beamCount) + 3] = y;
            ts[Number(beamCount) + 3] = text;
        } else {
            if (mod) {
                text = "内侧翼板";
            } else {
                text = "左侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[0] = y;
            ts[0] = text;

            if (mod) {
                text = "内侧腹板";
            } else {
                text = "左侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[1] = y;
            ts[1] = text;

            for (var i = beamCount; i >= 1; i--) {
                text = i + "#梁底板";
                y = y + svgBottomWidth;
                drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
                drawText(0, y - svgBottomWidth / 2 + textHeight / 2, text);
                ys[beamCount - i + 2] = y;
                ts[beamCount - i + 2] = text;
            }

            if (mod) {
                text = "外侧腹板";
            } else {
                text = "右侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[Number(beamCount) + 2] = y;
            ts[Number(beamCount) + 2] = text;

            if (mod) {
                text = "外侧翼板";
            } else {
                text = "右侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[Number(beamCount) + 3] = y;
            ts[Number(beamCount) + 3] = text;
        }
    }
    //绘制大箱梁
    function drawSpan3(mod) {
        var textHeight = 20;
        var text;

        x = DX;
        y = DY;
        drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');

        if (direction.indexOf('下') >= 0) {
            if (mod) {
                text = "外侧翼板";
            } else {
                text = "右侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[0] = y;
            ts[0] = text;

            if (mod) {
                text = "外侧腹板";
            } else {
                text = "右侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[1] = y;
            ts[1] = text;

            text = "底板";
            y = y + svgBottomWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgBottomWidth / 2 + textHeight / 2, text);
            ys[2] = y;
            ts[2] = text;

            if (mod) {
                text = "内侧腹板";
            } else {
                text = "左侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[3] = y;
            ts[3] = text;

            if (mod) {
                text = "内侧翼板";
            } else {
                text = "左侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[4] = y;
            ts[4] = text;
        } else {
            if (mod) {
                text = "内侧翼板";
            } else {
                text = "左侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[0] = y;
            ts[0] = text;

            if (mod) {
                text = "内侧腹板";
            } else {
                text = "左侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[1] = y;
            ts[1] = text;

            text = "底板";
            y = y + svgBottomWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgBottomWidth / 2 + textHeight / 2, text);
            ys[2] = y;
            ts[2] = text;

            if (mod) {
                text = "外侧腹板";
            } else {
                text = "右侧腹板";
            }
            y = y + svgWebHeight;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgWebHeight / 2 + textHeight / 2, text);
            ys[3] = y;
            ts[3] = text;

            if (mod) {
                text = "外侧翼板";
            } else {
                text = "右侧翼板";
            }
            y = y + svgFlangeWidth;
            drawLine(x, y, x + svgBeamLength, y, SOLID, 'BLACK');
            drawText(0, y - svgFlangeWidth / 2 + textHeight / 2, text);
            ys[4] = y;
            ts[4] = text;
        }
    }
    //绘制墩台
    function drawStub() {
        var textHeight = 20;
        var textWidth = 30;
        if (spanNumber == 1) {
            drawText(DX, DY - textHeight, (spanNumber - 1) + "#台");
            drawText(DX + svgBeamLength - textWidth, DY - textHeight, spanNumber + "#墩");
        } else if (spanNumber == spanCount) {
            drawText(DX, DY - textHeight, (spanNumber - 1) + "#墩");
            drawText(DX + svgBeamLength - textWidth, DY - textHeight, spanNumber + "#台");
        } else {
            drawText(DX, DY - textHeight, (spanNumber - 1) + "#墩");
            drawText(DX + svgBeamLength - textWidth, DY - textHeight, spanNumber + "#墩");
        }
        drawLine(DX, DY, DX, y, SOLID, 'BLACK');
        drawLine(DX + svgBeamLength, DY, DX + svgBeamLength, y, SOLID, 'BLACK');
    }
    //绘制标尺
    function drawRuler() {
        var rulerHeight = 20;
        var textHeight = 15;
        var textWidth = 30;
        var unit = svgBeamLength / beamLength;
        y = y + 5;
        drawLine(DX, y, DX + svgBeamLength, y, SOLID, 'GRAY');
        drawText(DX - textWidth, y + textHeight, '(m)');
        for (var i = 0; i <= beamLength; i++) {
            if (i % 2 == 0) {
                drawLine(DX + i * unit, y, DX + i * unit, y + rulerHeight, SOLID, 'GRAY');
                drawText(DX + i * unit, y + rulerHeight, i);
            } else {
                drawLine(DX + i * unit, y, DX + i * unit, y + (rulerHeight / 2), SOLID, 'GRAY');
            }
        }
        y = y + rulerHeight;
    }
    //绘制裂缝
    function drawCrack() {
        initCrack();

        var x1, y1, x2, y2;
        var index = 0;
        for (var i = 0; i < ts.length; i++) {
            if (ts[i] == component) {//TODO
                index = i;
                break;
            }
        }
        x1 = DX;
        x2 = DX + svgBeamLength;
        y1 = (index == 0) ? (DY) : (ys[index - 1]);
        y2 = ys[index];

        //console.log(x1+","+x2+","+y1+","+y2);

        reference1 = reference1.replace('号', '#');//to delete
        reference2 = reference2.replace('号', '#');//to delete

        //调整坐标系，始终保证svgA和svgB对应x坐标，svgC和svgD对应y坐标
        if (reference1.indexOf('#') < 0) {//参照1不是墩台，则原始svgA和svgB表示y坐标偏移量
            var t1, t2;
            t1 = svgA;
            t2 = svgB;
            svgA = svgC;
            svgB = svgD;
            svgC = svgA;
            svgD = svgB;
        }
        if (svgA != 0 && svgB == 0 && svgC == 0 && svgD == 0) {
            if (crackType.indexOf('竖') >= 0 || crackType.indexOf('横') >= 0) {
                svgB = svgA;
                svgC = (y2 - y1 - svgCrackLength) / 2;
                svgD = (y2 - y1 + svgCrackLength) / 2;
            } else if (crackType.indexOf('纵') >= 0 || crackType.indexOf('水平') >= 0) {
                svgB = svgA + svgCrackLength;
                svgC = (y2 - y1) / 2;
                svgD = svgC;
            }
            if (reference1.indexOf('#') >= 0) {//墩台
                reference2 = '内上';
            } else {
                reference2 = '#';
            }
        } else if (svgA == 0 && svgB == 0 && svgC != 0 && svgD == 0) {
            if (crackType.indexOf('竖') >= 0 || crackType.indexOf('横') >= 0) {
                svgA = (x2 - x1) / 2;
                svgB = svgA;
                svgD = svgC + svgCrackLength;
            } else if (crackType.indexOf('纵') >= 0 || crackType.indexOf('水平') >= 0) {
                svgB = svgA + svgCrackLength;
                svgC = (y2 - y1) / 2;
                svgD = svgC;
            }
            if (reference1.indexOf('#') >= 0) {//墩台
                reference2 = '内上';
            } else {
                reference2 = '#';
            }
        } else {
            if (svgA != 0 && svgB == 0) {
                svgB = svgA;
            }
            if (svgC != 0 && svgD == 0) {
                svgD = svgC;
            }
        }

        if (reference1.indexOf('#') >= 0) {//墩台
            if (parseInt(reference1) == spanNumber) {
                x1 = DX + svgBeamLength - svgA;
                x2 = DX + svgBeamLength - svgB;
            } else {
                x1 = DX + svgA;
                x2 = DX + svgB;
            }
        } else if (reference1.indexOf('内') >= 0 || reference1.indexOf('左') >= 0) {//内侧/左侧
            if (direction.indexOf("下") >= 0) {//下行
                y1 = ys[index] - svgC;
                y2 = ys[index] - svgD;
            } else {//上行或无
                var d = (index == 0) ? (DY) : (ys[index - 1]);
                y1 = d + svgC;
                y2 = d + svgD;
            }
        } else if (reference1.indexOf('外') >= 0 || reference1.indexOf('右') >= 0) {//外侧/右侧
            if (direction.indexOf("下") >= 0) {//下行
                var d = (index == 0) ? (DY) : (ys[index - 1]);
                y1 = d + svgC;
                y2 = d + svgD;
            } else {//上行或无
                y1 = ys[index] - svgC;
                y2 = ys[index] - svgD;
            }
        } else if (reference1.indexOf('上') >= 0) {//上侧
            if (direction.indexOf("下") >= 0) {//下行
                if (component.indexOf("内") >= 0) {//内侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                }
            } else {//上行或无
                if (component.indexOf("内") >= 0) {//内侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                }
            }
        } else if (reference1.indexOf('下') >= 0) {//下侧
            if (direction.indexOf("下") >= 0) {//下行
                if (component.indexOf("内") >= 0) {//内侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                }
            } else {//上行或无
                if (component.indexOf("内") >= 0) {//内侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                }
            }
        }

        if (reference2.indexOf('#') >= 0) {//墩台
            if (parseInt(reference2) == spanNumber) {
                x1 = DX + svgBeamLength - svgA;
                x2 = DX + svgBeamLength - svgB;
            } else {
                x1 = DX + svgA;
                x2 = DX + svgB;
            }
        } else if (reference2.indexOf('内') >= 0 || reference2.indexOf('左') >= 0) {//内侧/左侧
            if (direction.indexOf("下") >= 0) {//下行
                y1 = ys[index] - svgC;
                y2 = ys[index] - svgD;
            } else {//上行或无
                var d = (index == 0) ? (DY) : (ys[index - 1]);
                y1 = d + svgC;
                y2 = d + svgD;
            }
        } else if (reference2.indexOf('外') >= 0 || reference2.indexOf('右') >= 0) {//外侧/右侧
            if (direction.indexOf("下") >= 0) {//下行
                var d = (index == 0) ? (DY) : (ys[index - 1]);
                y1 = d + svgC;
                y2 = d + svgD;
            } else {//上行或无
                y1 = ys[index] - svgC;
                y2 = ys[index] - svgD;
            }
        } else if (reference2.indexOf('上') >= 0) {//上侧
            if (direction.indexOf("下") >= 0) {//下行
                if (component.indexOf("内") >= 0) {//内侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                }
            } else {//上行或无
                if (component.indexOf("内") >= 0) {//内侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                }
            }
        } else if (reference2.indexOf('下') >= 0) {//下侧
            if (direction.indexOf("下") >= 0) {//下行
                if (component.indexOf("内") >= 0) {//内侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                }
            } else {//上行或无
                if (component.indexOf("内") >= 0) {//内侧腹板
                    y1 = ys[index] - svgC;
                    y2 = ys[index] - svgD;
                } else if (component.indexOf("外") >= 0) {//外侧腹板
                    var d = (index == 0) ? (DY) : (ys[index - 1]);
                    y1 = d + svgC;
                    y2 = d + svgD;
                }
            }
        }
        if (crackCount > 1) {//多于1条裂缝
            var len = svgBeamLength * (crackLength / crackCount) / beamLength;
            if (crackType.indexOf("横") >= 0 ||
                crackType.indexOf("竖") >= 0 ||
                crackType.indexOf("斜") >= 0) {//横向裂缝 or 竖向裂缝 or 斜向裂缝
                var s = (x2 - x1) / (crackCount - 1);
                for (var k = 0; k < crackCount; k++) {
                    drawLine(x1 + k * s, y1 + (y2 - y1) / 2 - len / 2, x1 + k * s, y1 + (y2 - y1) / 2 + len / 2, SOLID, 'RED');
                }
            } else if (crackType.indexOf("纵") >= 0 || crackType.indexOf("水平")) {//纵向裂缝/水平裂缝
                var s = (y2 - y1) / (crackCount - 1);
                for (var k = 0; k < crackCount; k++) {
                    drawLine(x1 + (x2 - x1) / 2 - len / 2, y1 + k * s, x1 + (x2 - x1) / 2 + len / 2, y1 + k * s, SOLID, 'RED');
                }
            }
        } else {//1条裂缝
            //console.log(x1+","+x2+","+y1+","+y2);
            drawLine(x1, y1, x2, y2, SOLID, 'RED');
        }
        drawText2(x1 + (x2 - x1) / 2, y1 + (y2 - y1) / 2, '[' + crackNumber + ']');
    }
    function ajustSVGHeight() {
        $('#mysvg').height(y + 10);
    }
    //保存为图片
    function save() {
        saveSvgAsPng(
            document.getElementById("mysvg"), "defect.png",
            {width: $('#mysvg').width(), height: $('#mysvg').height()}
        );
    }
    //绘制线条
    function drawLine(x1, y1, x2, y2, type, color) {
        line = document.createElementNS("http://www.w3.org/2000/svg", "line");
        line.setAttribute("x1", x1);
        line.setAttribute("y1", y1);
        line.setAttribute("x2", x2);
        line.setAttribute("y2", y2);
        if (type == DASH) {
            line.setAttribute("stroke-dasharray", "5,5");
        }
        line.style.stroke = color;
        $('#mysvg').append(line);
    }
    //绘制文本
    function drawText(x, y, txt) {
        text = document.createElementNS("http://www.w3.org/2000/svg", "text");
        text.setAttribute("x", x);
        text.setAttribute("y", y);
        text.textContent = txt;
        $('#mysvg').append(text);
    }
    function drawText2(x, y, txt) {
        text = document.createElementNS("http://www.w3.org/2000/svg", "text");
        text.setAttribute("x", x);
        text.setAttribute("y", y);
        text.setAttribute("num", 'num');
        text.textContent = txt;
        $('#mysvg').append(text);
    }
</script>

</body>
</html>