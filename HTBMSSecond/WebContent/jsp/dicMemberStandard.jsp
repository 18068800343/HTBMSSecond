<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="apple-touch-startup-image" href="../img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="../img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
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
                          rel="tooltip" data-placement="bottom"
                          data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存" data-html="true">
						<i class="fa fa-refresh"></i>
					</span> 
				</span>

        <!-- breadcrumb -->
        <ol class="breadcrumb">
            <li>基础数据</li>
            <li>其他</li>
            <li>标准构件</li>
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
                <article class="col-xs-4 col-sm-4 col-md-4 col-lg-4">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1" data-widget-colorbutton="false"
                         data-widget-editbutton="false"
                         data-widget-togglebutton="false"
                         data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
                            <h2>结构</h2>
                        </header>

                        <!-- widget div-->
                        <div>

                            <div class="widget-body-toolbar bg-color-white">
                                <div class="col-sm-12">
                                    <div class="text-align-right">
                                      
                                                                                    
                                           <a class="btn btn-primary pull-right disabled" onclick="deleteRelation()"
                                               id="deleteMem">
                                                删除
                                            </a>
                                          <span  class="pull-right">&nbsp;&nbsp;</span>
                                            <a class="btn btn-primary btn-sm" onclick="addSystem()">添加标准构件库</a>
                                    </div>
                                </div>
                            </div>
                            <!-- widget content -->
                            <div class="widget-body">
                                <div class="custom-scroll table-responsive" style="height:550px; overflow-y: scroll;">
                                    <div class="tree smart-form">
                                        <ul>
                                            <li><span><i class='fa fa-lg fa-minus-circle'></i> 标准构件</span>
                                                <ul id='mbrStandard'>
                                                </ul>

                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- end widget content -->

                        </div>
                        <!-- end widget div -->

                    </div>
                    <!-- end widget -->

                </article><!-- END GRID -->

                <!-- SINGLE GRID -->
                <article id="tree_view" class="col-xs-8 col-sm-8 col-md-8 col-lg-8">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"
                         data-widget-editbutton="false"
                         data-widget-togglebutton="false"
                         data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                            <h2>标准构件数据 </h2>

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
                                            <div class="pull-left col-xs-3"><input class="form-control" id="searchData"
                                                                                   value="" placeholder="搜索"
                                                  
                                                                                   type="text"></div>
                                      
                                            <a class="btn btn-primary pull-right disabled" onclick="addRelation()"
                                               id="addMem">
                                                增加
                                            </a>

                                        </div>

                                    </div>
                                </div>
                                <table id="dt" class="table table-striped table-bordered table-hover" width="100%">
                                    <thead>
                                    <tr>
                                        <th>构件类型</th>
                                        <th>构件名称</th>
                                        <th>构件型号</th>
                                        <th>修改-删除</th>
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
                            <input type="text" name="mydate1" class="form-control datepicker"
                                   data-dateformat="dd/mm/yy">
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
                            <input type="text" name="mydate2" class="form-control datepicker"
                                   data-dateformat="dd/mm/yy">
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
                    <label>桥型</label>
                    <select style="width:100%" class="input-sm select2 " id="bridge_type">
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <label>形式</label>
                    <select style="width:100%" class="input-sm select2 " id="condition_style">
                        <option>整体式</option>
                        <option>分离式</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <label>规格</label>
                    <input type='text' class="form-control" id='condition_norm'>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <label>位置</label>
                    <select style="width:100%" class="input-sm select2 " id="location">
                        <option>桥首</option>
                        <option>桥尾</option>
                        <option>联首</option>
                        <option>联尾</option>
                        <option>中间</option>
                    </select>
                </div>
            </div>
        </fieldset>

    </form>
</div>


<div id="dig2" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>构件类型</label>
                <select style="width:100%" class="form-control input-sm select2 mem" id="member_type">

                </select>
            </div>
            <div class="form-group">
                <label>构件名称</label>
                <input type='text' class="form-control memberName" id="member_name">
            </div>
            <div class="form-group">
                <label>构件型号</label>
                <select style="width:100%" class="form-control input-sm select2 memType" id="member_model">

                </select>
            </div>
        </fieldset>
    </form>
</div>


<div id="dig" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>构件类型</label>
                <select style="width:100%" class="form-control input-sm select2 mem" id="mem">

                </select>
            </div>
            <div class="form-group">
                <label>构件名称</label>
                <input type='text' class="form-control" id='memberName'>
            </div>
            <div class="form-group">
                <label>构件型号</label>
                <select style="width:100%" class="form-control input-sm select2 memType" id="memType">

                </select>
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


<script type="text/javascript">
    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();
        initTree();
        dialogOperation();
        initBridgeType();
        structBaseDef.init();
    });
    $('#dig').dialog({
        title: "修改",
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

 	function deleteRelation(){
 		$.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../DicMemberStandardServlet',
                    dataType: 'json',
                    data: {
                        type: "delete2",
                        condition_id: condition_id
                    },
                    error: function (msg) {
                        errMessage("请求DicMemberStandardServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            errMessage("删除失败");
                        } else {
                            $(treeSecondSelect).parent().remove();
                            $('#dt').dataTable().fnClearTable();
                            $('#deleteMem').addClass('disabled');
                        if(childrenLength-1==0){
                        	firstTreeSelect.remove();
                        	 if(secondLength-1==0){
                             	treeSelect.remove();
                             }
                        }
                        successMessage("删除成功");
                        firstTreeSelect = undefined;
                        childrenLength = undefined;
                        }
                    }
                });
            }
        });
	}
 	
    function addRelation() {
        var member_type = $('#mem option:eq(0)').val();
        $('#mem').val(member_type).trigger('change');
        $('#memberName').val('');
        $('#dig').dialog({
            title: "增加",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        addStandard();
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
        $('#dig').dialog('open');
    }


    var structBaseDef = {
        memberData: undefined,
        memTypeData: undefined,
        init: function () {
            structBaseDef.initMember();
            structBaseDef.initMemType();
            $('#mem').on('change', function () {
                structBaseDef.buildMemType();
            });
        },
        initMember: function () {
            $.ajax({
                type: 'POST',
                url: '../DicMemTypeServlet',
                dataType: 'json',
                data: {
                    type: "initMemType"
                },
                error: function (msg) {
                    errMessage("请求DicMemTypeServlet失败");
                },
                success: function (json) {
                    structBaseDef.memberData = json.obj;
                    structBaseDef.buildMember();
                }
            });
        },
        initMemType: function () {
            $.ajax({
                type: 'POST',
                url: '../DicMemMemberTypeServlet',
                dataType: 'json',
                data: {
                    type: "initTable"
                },
                error: function (msg) {
                    errMessage("请求DicMemMemberTypeServlet失败");
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
                        var data = json.obj;
                        structBaseDef.memTypeData = {};
                        for (var i = 0; i < data.length; i++) {
                            if (structBaseDef.memTypeData[data[i].member_name] != undefined) {
                                structBaseDef.memTypeData[data[i].member_name].push(data[i].member_type_name);
                            } else {
                                structBaseDef.memTypeData[data[i].member_name] = [];
                                structBaseDef.memTypeData[data[i].member_name].push(data[i].member_type_name);
                            }
                        }
                    }
                }
            });
        },
        buildMember: function () {
            var d = $('#mem');
            d.empty();
            for (var i = 0; i < structBaseDef.memberData.length; i++) {
                d.append("<option>" + structBaseDef.memberData[i].member_name + "</option>");
            }
            d.trigger('change');
        },
        buildMemType: function () {
            var mem = $('#mem').val();
            if (structBaseDef.memTypeData == undefined) {
                setTimeout(function () {
                    structBaseDef.buildMemType();
                }, 1500);
                return;
            }
            var d = $('#memType');
            d.empty();
            var dd = structBaseDef.memTypeData[mem];
            if (dd != undefined) {
                for (var i = 0; i < dd.length; i++) {
                    d.append("<option>" + dd[i] + "</option>");
                }
            } else {
                d.append("<option>无</option>");
            }
            d.trigger('change');
        }
    }

    function initBridgeType() {
        $('#bridge_type').empty();
        $.ajax({
            type: 'POST',
            url: '../DicStructTypeServlet',
            dataType: 'json',
            data: {
                type: "initBridgeType"
            },
            error: function (msg) {
                errMessage("请求DicStructTypeServlet失败");
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
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        var data2 = data[i].ll;
                        for (var j = 0; j < data2.length; j++) {
                            $('#bridge_type').append("<option value='" + data2[j].brg_type_name + "'>" + data2[j].brg_type_name + "</option>");
                        }
                    }
                    $('#bridge_type').select2();
                }
            }
        });
    }
    function dialogOperation() {
        $('#addSystem').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        addCondition();
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

    function addCondition() {
        var info = {
            bridge_type: $('#bridge_type').val(),
            condition_style: $('#condition_style').val(),
            condition_norm: $('#condition_norm').val(),
            location: $('#location').val(),
        };
        $.ajax({
            type: 'POST',
            url: '../DicMemberStandardServlet',
            dataType: 'json',
            data: {
                type: "addCondition",
                info: JSON.stringify(info),
            },
            error: function (msg) {
                errMessage("请求DicMemberStandardServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    errMessage("插入失败");
                }else if(json.success=="repetition"){
                	errMessage("插入重复");
                }
                else {
                    successMessage("插入成功")
                    $('#addSystem').dialog("close");
                    initTree();
                }
            }
        });
    }

    var table = $('#dt').DataTable({
        "sDom": "t" +
        "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
        "columns": [
            {"data": "member_type"},
            {"data": "member_name"},
            {"data": "member_model"},
            {"data": null}
        ],
        "columnDefs": [{
            "targets": 3,
            "searchable": false,
            "render": function (data, type, full) {
                var edit = "<a class='edit btn btn-warning btn-xs'><span class='glyphicon glyphicon-pencil'></span></a>";
                var del = "<a class='del btn btn-warning btn-xs'><span class='glyphicon glyphicon-trash'></span></a>";
                return edit + '&nbsp;&nbsp;&nbsp;' + del;
            }
        }],
        "oLanguage": { //国际化配置
            "sProcessing": "正在获取数据，请稍后...",
            "sLengthMenu": "显示 _MENU_ 条",
            "sZeroRecords": "没有您要搜索的内容",
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
        },
        "order": [[0, 'desc']],
    });

    $('#searchData').on('change', function () {
        var d = $(this).val();
        table.search(d).draw(true);
    });

    function initTree() {
        $.ajax({
            type: 'POST',
            url: '../DicMemberStandardServlet',
            dataType: 'json',
            data: {
                type: "initTree"
            },
            error: function (msg) {
                errMessage("请求DicMemberStandardServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    errMessage("当前无数据");
                } else {
                    $('.tree').empty();
                    var tree = json.obj;
                    /*  var ul = $("<ul></ul>");
                     var li = $("<li></li>");
                     li.append("<span><i class='fa fa-lg fa-plus-circle'></i> 标准构件</span>");
                     li.append(buildTree(getConnect(tree)));
                     ul.append(li); */
                    $('.tree').append(buildTree(getConnect(tree)));
                    treeControl();

                }
            }
        });
    }

    function getConnect(data) {
        var con = [];
        var st = {};
        var children = [];
        for (var i = 0; i < data.length; i++) {
            var child = {};
            child.name = data[i].condition_style;
            child.id = data[i].condition_id;
            child.location = data[i].location;
            child.norm = data[i].condition_norm;
            if (con.length == 0) {
                st.name = data[i].bridge_type;
                st.type = 'bridge_type';
                children.push(child);
                st.children = children;
                con.push(st);
                continue;
            }
            if (con[con.length - 1].name == data[i].bridge_type) {
                children.push(child);
            } else {
                con[con.length - 1].children = getConnect2(children);
                st = {};
                children = [];
                st.name = data[i].bridge_type;
                st.type = 'bridge_type';
                children.push(child);
                con.push(st);
            }
            if (i == data.length - 1) {
                con[con.length - 1].children = getConnect2(children);
            }
        }
        return con;
    }

    function getConnect2(data) {
        var con = [];
        var st = {};
        var children = [];
        for (var i = 0; i < data.length; i++) {
            var child = {};
            if (data[i].norm == '') {
                data[i].norm = '无';
            }
            child.name = data[i].norm + "--" + data[i].location;
            child.id = data[i].id;
            child.location = data[i].location;
            child.norm = data[i].norm;
            if (con.length == 0) {
                st.name = data[i].name;
                children.push(child);
                st.children = children;
                con.push(st);
                continue;
            }
            if (con[con.length - 1].name == data[i].name) {
                children.push(child);
            } else {
                con[con.length - 1].children = children;
                st = {};
                children = [];
                st.name = data[i].name;
                children.push(child);
                con.push(st);
            }
            if (i == data.length - 1) {
                con[con.length - 1].children = children;
            }
        }
        return con;
    }

    $('#dt').delegate('.edit', 'click', function () {
        var dom = $(this).parents('tr');
        var data = table.row(dom).data();
        var standard_id = data.standard_id;
        $('#mem').val(data.member_type).trigger('change');
        $('#memberName').val(data.member_name);
        $('#memType').val(data.member_model).trigger('change');
        $('#dig').dialog({
            title: "修改",
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        var info = {
                            member_type: $('#mem').val(),
                            member_name: $('#memberName').val(),
                            member_model: $('#memType').val(),
                            standard_id: standard_id
                        }
                        $.ajax({
                            type: 'POST',
                            url: '../DicMemberStandardServlet',
                            dataType: 'json',
                            data: {
                                type: "edit",
                                info: JSON.stringify(info)
                            },
                            error: function (msg) {
                                errMessage("请求DicMemberStandardServlet失败");
                            },
                            success: function (json) {
                                if (json.success == "fail") {
                                    errMessage("修改失败");
                                } else {
                                    successMessage("保存成功");
                                    table.row(dom).data(info).draw(false);
                                    $('#dig').dialog("close");
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
        $('#dig').dialog('open');
    })


    $('#dt').delegate('.del', 'click', function () {
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
                    url: '../DicMemberStandardServlet',
                    dataType: 'json',
                    data: {
                        type: "delete",
                        standard_id: data.standard_id
                    },
                    error: function (msg) {
                        errMessage("请求DicMemberStandardServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            errMessage("删除失败");
                        } else {
                            successMessage("删除成功");
                            table.row(dom).remove().draw(false);
                        }
                    }
                });
            }
        });
    });

    //构造树
    function buildTree(data) {
        var ul = $("<ul></ul>")
        for (var i = 0; i < data.length; i++) {
            var li = $("<li></li>");
            li.attr('data-norm', data[i].norm);
            li.attr('data-id', data[i].id);
            li.attr('data-name', data[i].name);
            li.attr('data-location', data[i].location);
            if (data[i].type != 'bridge_type') {
                li.prop('style', 'display: none');
            }
            if ("children" in data[i]) {
                //li.prop('style','display: none');
                li.append("<span><i class='fa fa-lg fa-plus-circle'></i> " + data[i].name + "</span>");
                li.append(buildTree(data[i].children));
            } else {
                li.prop('style', 'display: none');
                li.append("<span class='tree-second data-id='"+data[i].id+"'>" + data[i].name + "</span><i style='font-style:normal;color:#214e75'></i>");

                if (data[i].type == 'bridge') {

                }
                //$('#cont').append("<option value='"+data[i].id+"'>"+data[i].name+"<option>");
            }
            ul.append(li);
        }
        return ul;
    }

    var sss = undefined;//级联关闭1级
    var sss2 = undefined;//级联关闭2级
    var firstTreeSelect = undefined;//一级子菜单选中对象
    var treeSecondSelect = undefined;//选中状态
    var childrenLength = undefined;
    var secoundLength=  undefined;
    var treeSelect = undefined;
    //树控制
    var condition_id = '';
    function treeControl() {
        sss = undefined;
    	firstTreeSelect = undefined;
        childrenLength = undefined;
        secoundLength=  undefined;
        treeSecondSelect = undefined;
        treeSelect = undefined;
        
        $('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
        $('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', '展开').on('click', function (e) {
        	firstTreeSelect = undefined;
            childrenLength = undefined;
            secoundLength=  undefined;
            treeSecondSelect = undefined;
            treeSelect = undefined;
            sss = this;
            var children = $(this).parent('li.parent_li').find(' > ul > li');           
            $('#deleteMem').addClass('disabled');
            
            
            if (children.is(':visible')) {
                children.hide('fast');
                $(this).attr('title', '展开').find(' > i').removeClass().addClass('fa fa-lg fa-plus-circle');
            } else {
                children.show('fast');
                $(this).attr('title', '折叠').find(' > i').removeClass().addClass('fa fa-lg fa-minus-circle');
            }
            e.stopPropagation();
           
            
        });
        $('.tree-second').on('click', function () {
            
        	
            $('#addMem').removeClass('disabled');
            $('#deleteMem').removeClass('disabled');
            $(treeSecondSelect).css('background', '');
            $(this).css('background', '#ccc');
            $(this).attr('title', '展开');
            childrenLength = undefined;
            secoundLength=  undefined;
            
            treeSecondSelect = this;
            firstTreeSelect = $(this).parent().parent().parent();
            treeSelect = $(this).parent().parent().parent().parent().parent();
            
            console.log(treeSelect);
            childrenLength = $(this).parent().parent().children('li').length;
            
            secondLength=$(this).parent().parent().parent().parent().children('li').length;  
            
            var info = {};
            
            info.condition_id = $(treeSecondSelect).closest('li').attr('data-id');
            condition_id = info.condition_id;         
            initTable(info);
        });
    }


    function addStandard() {
        if (condition_id == '' || condition_id == null || condition_id == undefined) {
            errMessage("请选择标准构件库!");
            return;
        }
        var info = {
            member_type: $('#mem').val(),
            member_name: $('#memberName').val(),
            member_model: $('#memType').val(),
            condition_id: condition_id
        }
        $.ajax({
            type: 'POST',
            url: '../DicMemberStandardServlet',
            dataType: 'json',
            data: {
                type: "addStandard",
                info: JSON.stringify(info)
            },
            error: function (msg) {
                errMessage("请求DicMemberStandardServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    errMessage("添加失败");
                } else {
                    successMessage("添加成功");
                    table.row.add(json.obj).draw(false);
                    $('#dig').dialog("close");
                }
            }
        });
    }

    function initTable(info) {
        $('#dt').dataTable().fnClearTable();
        $.ajax({
            type: 'POST',
            url: '../DicMemberStandardServlet',
            dataType: 'json',
            data: {
                type: "initTable",
                condition_id: info.condition_id
            },
            error: function (msg) {
                errMessage("请求DicMemberStandardServlet失败");
            },
            success: function (json) {
                if (json.success == "fail") {
                    errMessage("当前无数据！");
                } else {
                    var data = json.obj;
                    table.rows.add(data).draw(false);
                }
            }
        });
    }

    //dialog

    $('#addSystem').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        title: '添加系统'
    });
    $('#addSystem').prop('hidden', false);

    function openExp() {
        $('#expDialog').dialog('open');
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

    function addSystem() {
        $('#addSystem').dialog('open');
    }

    function releaseAdmin() {//管理员

    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户

    }
</script>
</body>
</html>