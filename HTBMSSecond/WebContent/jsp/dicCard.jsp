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
            <li>桥梁卡片</li>
            <li>桥梁卡片字典</li>
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
                            <h2>桥梁卡片项</h2>
                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox">

                            </div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body no-padding">

                                <div class="custom-scroll table-responsive" style="height:450px; overflow-y: scroll;">
                                    <div class="tree smart-form">
                                        <ul id="tree-ul">

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
                            <h2>桥梁卡片字典 </h2>

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
                                            <a class="btn btn-primary pull-right disabled" onclick="newOperation()">
                                                增加
                                            </a>

                                        </div>

                                    </div>


                                </div>

                                <table id="dt_basic" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="col-sm-3 col-md-3"> 编号</th>
                                        <th class="col-sm-3 col-md-3"> 取值</th>
                                        <th class="col-sm-2 col-md-2">操作</th>
                                    </tr>
                                    </thead>
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

<div id="opera">
    <form>
        <fieldset>
            <div class="form-group">
                <label>编号</label>
                <input class="form-control" id="domain_id" value="" placeholder="编号" type="text">
            </div>

            <div class="form-group">
                <label>取值</label>
                <input class="form-control" id="item_value" value="" placeholder="取值" type="text">
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
<script src="../js/plugin/datatables/jquery.dataTables.min.js"></script>
<script src="../js/plugin/datatables/dataTables.colVis.min.js"></script>
<script src="../js/plugin/datatables/dataTables.tableTools.min.js"></script>
<script src="../js/plugin/datatables/dataTables.bootstrap.min.js"></script>
<script src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>


<script type="text/javascript">
    var table;
    $(document).ready(function () {
        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();

        // grid
        /* BASIC ;*/
        var responsiveHelper_dt_basic = undefined;
        var responsiveHelper_datatable_fixed_column = undefined;
        var responsiveHelper_datatable_col_reorder = undefined;
        var responsiveHelper_datatable_tabletools = undefined;

        var breakpointDefinition = {
            tablet: 1024,
            phone: 480
        };


        table = $('#dt_basic').DataTable({
            "sDom": "t" +
            "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
            "autoWidth": true,
            "bScrollCollapse": true,
            "sScrollY": 400,
            "columns": [
                {"data": "domain_id"},
                {"data": "item_value"},
                {"data": null}
            ],
            "columnDefs": [{
                "targets": 2,
                "searchable": false,
                "render": function (data, type, full) {
                    return editDel;
                }
            }],
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
            },
            "preDrawCallback": function () {
                // Initialize the responsive datatables helper once.
                if (!responsiveHelper_dt_basic) {
                    responsiveHelper_dt_basic = new ResponsiveDatatablesHelper($('#dt_basic'), breakpointDefinition);
                }
            },
            "rowCallback": function (nRow, data) {
                responsiveHelper_dt_basic.createExpandIcon(nRow);
            },
            "drawCallback": function (oSettings) {
                responsiveHelper_dt_basic.respond();
            }
        });
        $('#searchData').on('change', function () {
            var d = $(this).val();
            table.search(d).draw(true);
        });
        /* END COLUMN FILTER */

        /* END COLUMN SHOW - HIDE */

        /* END TABLETOOLS */
    });

    /* 初始化树 */
    var sss = undefined;
    function initTree() {
        $.ajax({
            type: 'POST',
            url: '../DicCardServlet',
            dataType: 'json',
            data: {
                type: "initTree"
            },
            error: function (msg) {
                errMessage("请求DicCardServlet失败");
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
                    var $ul = $('#tree-ul');
                    $ul.empty();
                    var info = json.obj;
                    for (var i = 0; i < info.length; i++) {
                        var data = info[i];
                        var $li = $("<li></li>");
                        $li.append("<span><i class='fa fa-lg fa-plus-circle'></i> " + data.root + "</span>");
                        var $ul2 = $("<ul></ul>");
                        for (var j = 0; j < data.items.length; j++) {
                            $ul2.append("<li style='display:none'><span id='" + data.items[j].item_id + "' class='tree-second'>" + data.items[j].item_name + "</span></li>");
                        }
                        $li.append($ul2);
                        $ul.append($li);
                    }
                    $('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
                    $('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', '展开').on('click', function (e) {
                        if (sss != undefined) {
                            if ($(sss).html() != $(this).html()) {
                                $(sss).parent('li.parent_li').find(' > ul > li').hide('fast');
                                $(sss).attr('title', '展开').find(' > i').removeClass().addClass('fa fa-lg fa-plus-circle');
                            }
                        }
                        sss = this;
                        var children = $(this).parent('li.parent_li').find(' > ul > li');
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
                        $(treeSecondSelect).css('background', '');
                        $(this).css('background', '#ccc');
                        $(this).attr('title', '展开');
                        treeSecondSelect = this;
                        initTable($(this).prop('id'));
                    });
                }
            }
        });
    }
    var treeSecondSelect;
    $(function () {
        initTree();
        //绑定双击事件
        /* 	$('#dt_basic').delegate('tr','dblclick', function () {
         dom=this;
         dialogOperation("edit");
         } );  */
        $('#dt_basic').delegate('.edit', 'click', function () {
            dom = $(this).parents('tr');
            dialogOperation("edit");
        });
        $('#dt_basic').delegate('.del', 'click', function () {
            dom = $(this).parents('tr');
            dialogOperation("del");
        });
    });

    /*初始化表格*/
    function initTable(id) {
        $.ajax({
            type: 'POST',
            url: '../DicCardServlet',
            dataType: 'json',
            data: {
                type: "initTable",
                item_id: id
            },
            error: function (msg) {
                errMessage("请求DicCardServlet失败");
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
                    $('#dt_basic').dataTable().fnClearTable();
                } else {
                    $('#dt_basic').dataTable().fnClearTable();
                    var data = json.obj;
                    table.rows.add(data).draw(false);
                }
            }
        });
    }

    $('#opera').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });


    var dom;
    function dialogOperation(op) {
        $('#opera').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {
                        editOperation();
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

        var dd = $(dom).find('td');
        var data = table.row(dom).data();
        var title;
        if (op == "edit") {
            title = "修改数据"
            $("#domain_id").val(data.domain_id);
            $("#item_value").val(data.item_value);
            $("#domain_id").prop('readonly', 'readonly');
        }
        if (op == "del") {
            title = "修改数据"
            $("#domain_id").val(data.domain_id);
            $("#item_value").val(data.item_value);
            $("#domain_id").prop('readonly', 'readonly');
            deleteOperation();
            return false;
        }
        $('#opera').dialog({
            title: title
        });
        $('#opera').dialog("open");
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

    function editOperation() {
        var info = {
            domain_id: $('#domain_id').val(),
            item_value: $('#item_value').val(),
            item_id: $(treeSecondSelect).prop('id')
        }
        if (info.item_value == "") {
            errMessage("不可为空");
        } else {
            $.ajax({
                type: 'POST',
                url: '../DicCardServlet',
                dataType: 'json',
                data: {
                    type: "edit",
                    info: JSON.stringify(info)
                },
                error: function (msg) {
                    errMessage("请求DicCardServlet失败");
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
                            default:
                                break;
                        }
                    } else {
                        //successMessage("保存成功");
                        $('#dt_basic').DataTable().row(dom).data(info);
                        $('#opera').dialog("close");
                    }
                }
            });
        }
    }

    function deleteOperation() {
        $.SmartMessageBox({
            title: "删除提示",
            content: "确认删除该条记录吗",
            buttons: '[取消][确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../DicCardServlet',
                    dataType: 'json',
                    data: {
                        type: "delete",
                        domain_id: $('#domain_id').val(),
                        item_id: $(treeSecondSelect).prop('id')
                    },
                    error: function (msg) {
                        errMessage("请求DicCardServlet失败");
                    },
                    success: function (json) {
                        if (json.success == "fail") {
                            switch (json.error) {
                                case 1:
                                    errMessage("删除失败");
                                    break;
                                case 2:
                                    errMessage("服务器错误");
                                    break;
                                default:
                                    break;
                            }
                        } else {
                            //successMessage("删除成功");
                            $('#dt_basic').DataTable().row(dom).remove().draw();
                            ;
                        }
                    }
                });
            }

        });
    }

    function newOperation() {
        var item_id = $(treeSecondSelect).prop('id');
        if (item_id === undefined) {
            errMessage("请先选择桥梁卡片项")
            return false;
        }

        $("#domain_id").val("");
        $("#item_value").val("");
        $("#domain_id").prop('readonly', false);

        $('#opera').dialog({
            buttons: [
                {
                    html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                    "class": "btn btn-default",
                    click: function () {

                        var info = {
                            domain_id: $('#domain_id').val(),
                            item_id: item_id,
                            item_value: $('#item_value').val(),
                        }
                        if (info.item_value == "" || info.domain_id == "") {
                            errMessage("不可为空");
                        } else {
                            $.ajax({
                                type: 'POST',
                                url: '../DicCardServlet',
                                dataType: 'json',
                                data: {
                                    type: "new",
                                    info: JSON.stringify(info)
                                },
                                error: function (msg) {
                                    errMessage("请求DicCardServlet失败");
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
                                            default:
                                                break;
                                        }
                                    } else {
                                        //successMessage("保存成功");
                                        $('#dt_basic').DataTable().row.add(info).draw(true);
                                        $('#opera').dialog("close");
                                    }
                                }
                            });
                        }

                    }
                },
                {
                    html: "<i class='fa fa-trash-o'></i>&nbsp; 重置",
                    "class": "btn btn-default",
                    click: function () {
                        $("#domain_id").val("");
                        $("#item_value").val("");
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
        $('#opera').dialog({
            title: "新增卡片"
        });
        $('#opera').dialog("open");
    }


    var editDel = "<div class='text-align-center'><button class='edit btn-circle' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
    function releaseAdmin() {//管理员
        editDel = "<div class='text-align-center'><button class='edit btn-circle'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle'><span class='glyphicon glyphicon-trash'></span></button></div>";
        $('.widget-body-toolbar a').removeClass('disabled');
    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户
    }
	function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
    	 editDel = "<div class='text-align-center'><button class='edit btn-circle'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle'><span class='glyphicon glyphicon-trash'></span></button></div>";
         $('.widget-body-toolbar a').removeClass('disabled');
		}
	
	}

</script>


</body>
</html>