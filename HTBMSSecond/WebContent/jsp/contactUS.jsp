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

</head>
<body class="">

<!-- #MAIN PANEL -->
<div id="main" role="main">

    <!-- RIBBON -->
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content" style="margin-top: 200px;margin-left: 160px">
        <section id="widget-grid">
            <div class="row">

                <!-- NEW WIDGET START -->
                <article class="col-sm-8 col-md-8 col-lg-8">

                    <!-- Widget ID (each widget will need unique ID)-->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-colorbutton="false"
                         data-widget-editbutton="false"
                         data-widget-togglebutton="false"
                         data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">

                        <header>
                            <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                            <h2>请留下您的信息</h2>

                        </header>

                        <!-- widget div-->
                        <div>

                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox">
                                <!-- This area used as dropdown edit box -->

                            </div>
                            <!-- end widget edit box -->

                            <!-- widget content -->
                            <div class="widget-body">

                                <form class="form-horizontal" action="../ChangePassServlet" method="post">
                                    <!-- <legend>修改密码</legend> -->
                                    <fieldset class="demo-switcher-1">


                                        <div class="form-group">
                                            <label class="col-md-2 control-label">地址</label>
                                            <div class="col-md-10">
                                                <input class="form-control" placeholder="请输入您的地址" id="add" name="add">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label">公司名称</label>
                                            <div class="col-md-10">
                                                <input class="form-control" placeholder="请输入您的公司名称" id="company_name"
                                                       name="company_name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label">联系人</label>
                                            <div class="col-md-10">
                                                <input class="form-control" placeholder="请输入您的姓名" id="name" name="name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label">手机号码</label>
                                            <div class="col-md-10">
                                                <input class="form-control" placeholder="请输入您的手机号码" id="phone"
                                                       name="phone_mail">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-md-2 control-label">QQ号码</label>
                                            <div class="col-md-10">
                                                <input class="form-control" placeholder="请输入您的QQ号码" id="qq_number"
                                                       name="qq_number">
                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <a class="btn btn-primary" type="submit" onclick="saveMessage()">
                                                    提交
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                </form>

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

<script type="text/javascript">
    function test() {
        var pw =
        <%=session.getAttribute("password") %>
        var oldpassword = $("input[name='oldpassword']").val();
        if (pw != oldpassword) {
            errMessage("密码错误");
        }

    }
    function changePass() {
        var pw =
        <%=session.getAttribute("password") %>
        var oldpassword = $("input[name='oldpassword']").val();
        var password1 = $("input[name='password1']").val();
        var password2 = $("input[name='password2']").val();

        if (password1 == "" || password1 == "") {
            errMessage("不可为空");
        } else if (pw != oldpassword) {
            errMessage("密码错误");
        } else if (password1 != password2) {
            errMessage("密码不一致");
        } else {
            $.ajax({
                type: 'POST',
                url: '../ChangePassServlet',
                dataType: 'json',
                data: {
                    oldpassword: oldpassword,
                    password1: password1,
                    password2: password2
                },
                error: function (msg) {
                    if (json.error == "1") {
                        errMessage("请求UserMgrServlet失败");
                    } else if (json.error == "2") {
                        errMessage("请求UserMgrServlet失败");
                    }
                },
                success: function (json) {
                    if (json.success == "fail") {
                        errMessage("修改失败");
                    } else {
                        window.location.reload();
                    }
                }
            });
        }
    }

    $(document).ready(function () {
        pageSetUp();
    });

    function saveMessage() {
        var name = $("#name").val();
        var add = $("#add").val();
        var company = $("#company_name").val();
        var phone = $("#phone").val();
        var qq_number = $("#qq_number").val();
        if (name == null || name == undefined || name == "") {
            errMessage("请填写联系人信息");
            return false;
        }
        if (add == null || add == undefined || add == "") {
            errMessage("请填写地址信息");
            return false;
        }
        if (company == null || company == undefined || company == "") {
            errMessage("请填写公司名称信息");
            return false;
        }
        if (phone == null || phone == undefined || phone == "") {
            errMessage("请填写手机号码信息");
            return false;
        }
        if (qq_number == null || qq_number == undefined || qq_number == "") {
            errMessage("请填写QQ号码信息");
            return false;
        }
        if (!(/^1[34578]\d{9}$/.test(phone))) {
            errMessage("手机号码格式有误，请重填");
            return false;
        }
        if (!(/^\d{5,12}$/.test(qq_number))) {
            errMessage("QQ号码格式有误，请重填");
            return false;
        }
        $.ajax({
            type: 'POST',
            url: '../ContactUsServlet',
            dataType: 'json',
            data: {
                choice: "save",
                name: name,
                add: add,
                company: company,
                phone: phone,
                qq_number: qq_number
            },
            error: function (msg) {

            },
            success: function (json) {
                if (json.success == "success") {
                    successMessage("提交成功");
                    $("#name").val("");
                    $("#add").val("");
                    $("#company_name").val("");
                    $("#phone").val("");
                    $("#qq_number").val("");
                    window.location.href = "index.jsp";
                } else {
                    errMessage("提交失败，请检查数据");
                }

            }
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

    function errMessage(info) {
        $.smallBox({
            title: "处理信息",
            content: "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 3000
        });
    }
    /**
     function sleep(numberMillis) {
				var now = new Date();
				var exitTime = now.getTime() + numberMillis;
				while (true) {
				now = new Date();
				if (now.getTime() > exitTime)
				return;
				}
			}
     */
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