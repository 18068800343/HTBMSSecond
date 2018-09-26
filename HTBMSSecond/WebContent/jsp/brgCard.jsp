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
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/font.css">
    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="../css/smartadmin-skins.min.css">
    <link rel="stylesheet" href="check/jquery.datetimepicker.css"/>
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


    <link rel="stylesheet" href="../jstree/themes/default/style.min.css"/>
    <style>
        .treess:hover {
            background-color: #ccc;
            cursor: pointer;
        }

        .no-close .ui-dialog-titlebar-close {
            display: none;
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
    <link rel="stylesheet" href="../js/ms/magicsuggest-min.css"
          type="text/css"></link>
    <link rel="stylesheet"
          href="../js/plugin/bscombobox/bootstrap-combobox.css" type="text/css"></link>
    <link rel="stylesheet"
          href="../js/plugin/bootstrap-timepicker/bootstrap-datetimepicker.min.css"
          type="text/css"></link>
<body class="">
<%@ include file="header.jsp" %>
<%@ include file="menu.jsp" %>

<!-- #MAIN PANEL -->
<div id="main">
    <!-- RIBBON -->
    <div id="ribbon">

			<span class="ribbon-button-alignment"> <span id="refresh"
                                                         class="btn btn-ribbon" data-action="resetWidgets"
                                                         data-title="refresh" data-placement="bottom"
                                                         data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
                                                         data-html="true"> <i class="fa fa-refresh"></i> </span> </span>

        <ol class="breadcrumb">
            <li>检查评定</li>
            <li>结构</li>
            <li>桥梁卡片</li>
        </ol>

    </div>
    <!-- END RIBBON -->

    <!-- #MAIN CONTENT -->
    <div id="content">
        <section id="widget-grid">
            <!-- widget grid -->
            <!-- row -->
            <div class="row">
                <%@include file="currentStruct.jsp" %>
                <!-- SINGLE GRID -->
                <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <!-- new widget -->
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-1"
                         data-widget-colorbutton="false" data-widget-editbutton="false"
                         data-widget-togglebutton="false" data-widget-deletebutton="false"
                         data-widget-fullscreenbutton="false"
                         data-widget-custombutton="false">
                        <header>
                            <span class="widget-icon"> <i class="fa fa-road"></i> </span>
                            <h2 id="bpc">桥梁卡片</h2>
                        </header>

                        <!-- widget div-->
                        <div class="no-padding">
                            <!-- widget edit box -->
                            <div class="jarviswidget-editbox"></div>
                            <!-- end widget edit box -->
                            <!-- <div class="widget-body no-padding-bottom"> -->
                            <div class="widget-body-toolbar bg-color-white">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12 text-align-right">
                                        <!-- <a class="btn btn-primary disabled" id="showDia"
												onclick="showDia()">修改卡片信息</a> -->
                                        <a class="btn btn-primary " id="rePDF" onclick="rePDF()">生成PDF</a>
                                    </div>
                                </div>
                            </div>
                            <!-- </div> -->
                            <div id="opera" hidden="hidden">
                                <div class="widget-body no-padding" id="pdf">
                                    <embed id="pdf1" name="pdf" width="100%" height="600px"
                                           type="application/pdf" >
                                </div>
                            </div>

                        </div>
                        <div>
                            <ul class="nav nav-tabs bordered" id="myTab1">
                                <li class="active"><a data-toggle="tab" href="#s1">行政识别数据</a>
                                </li>
                                <li><a data-toggle="tab" href="#s2">结构技术数据</a></li>
                                <li><a data-toggle="tab" href="#s3">档案资料</a></li>
                                <li><a data-toggle="tab" href="#s4">最近技术状况评定</a></li>
                                <li><a data-toggle="tab" href="#s5">修建工程记录</a></li>
                                <li><a data-toggle="tab" href="#s6">桥梁照片</a></li>
                                <!-- <li><a data-toggle="tab" href="#s7">其他</a></li> -->
                            </ul>

                            <div id="myTabContent1" class="tab-content">
                                <div
                                        class="tab-pane fade active in padding-10 no-padding-bottom"
                                        id="s1" style="overflow-y:scroll;">
                                    <table id="table1" class="table table-bordered table-striped">
                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <div class="widget-body-toolbar bg-color-white">
                                                <button onclick="changebcai()" type="submit"
                                                        class="btn btn-primary " disabled="disabled">修改
                                                </button>
                                            </div>
                                        </div>
                                    </table>
                                </div>
                                <!-- end s1 tab pane -->

                                <div class="tab-pane fade padding-10 no-padding-bottom" id="s2"
                                     style="height:400px; overflow-y:scroll;">
                                    <table id="table2" class="table table-bordered table-striped">
                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <div class="widget-body-toolbar bg-color-white">
                                            <button id="addDown" onclick="quickMen()" class="btn btn-primary">构建下部结构</button>
                                                <button onclick="changebcst()" type="submit"
                                                        class="btn btn-primary " disabled="disabled">修改
                                                </button>
                                            </div>
                                        </div>
                                    </table>
                                </div>
                                <!-- end s2 tab pane -->

                                <div class="tab-pane fade padding-10 no-padding-bottom" id="s3"
                                     style="overflow-y:scroll;">
                                    <table id="table3" class="table table-bordered table-striped">
                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <div class="widget-body-toolbar bg-color-white">
                                                <button onclick="changebcd()" type="submit"
                                                        class="btn btn-primary " disabled="disabled">修改
                                                </button>
                                            </div>
                                        </div>
                                    </table>
                                </div>
                                <!-- end s3 tab pane -->

                                <div class="tab-pane fade padding-10 no-padding-bottom" id="s4"
                                     style=" height:400px; overflow-y:scroll;">
                                    <table id="table4" class="table table-bordered table-striped">
                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <div class="widget-body-toolbar bg-color-white">
                                                <button onclick="new_nearly_eva()" type="submit"
                                                        class="btn btn-primary" disabled="disabled">增加
                                                </button>
                                            </div>
                                        </div>
                                        <tr>
                                            <th>53</th>
                                            <th>54</th>
                                            <th>55</th>
                                            <th>56</th>
                                            <th>57</th>
                                            <th>58</th>
                                            <th>59</th>
                                            <th>60</th>
                                            <th>61</th>
                                            <th>62</th>
                                            <th>63</th>
                                            <th style="text-align: center;" colspan="2">64</th>
                                        </tr>
                                        <tr>
                                            <th>检查年月</th>
                                            <th>定期或特殊检查</th>
                                            <th>全桥评定等级</th>
                                            <th>桥台与基础</th>
                                            <th>桥墩与基础</th>
                                            <th>地基冲刷</th>
                                            <th>上部结构</th>
                                            <th>支座</th>
                                            <th>经常保养小修</th>
                                            <th>处治对策</th>
                                            <th>下次检查年份</th>
                                            <th style="text-align: center;" colspan="2">操作</th>
                                        </tr>
                                    </table>
                                </div>
                                <!-- end s3 tab pane -->

                                <div class="tab-pane fade padding-10 no-padding-bottom" id="s5"
                                     style=" height:400px; overflow-y:scroll;">
                                    <table id="table5" class="table table-bordered table-striped">
                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <div class="widget-body-toolbar bg-color-white">
                                                <button onclick="newbccp()" type="submit"
                                                        class="btn btn-primary " disabled="disabled">增加
                                                </button>
                                            </div>
                                        </div>
                                        <tr>
                                            <th>65</th>
                                            <th>施工日期</th>
                                            <th>66</th>
                                            <th>67</th>
                                            <th>68</th>
                                            <th>69</th>
                                            <th>70</th>
                                            <th>71</th>
                                            <th>72</th>
                                            <th>73</th>
                                            <th>74</th>
                                            <th>75</th>
                                            <th style="text-align: center;" colspan="2">76</th>
                                        </tr>
                                        <tr>
                                            <th>开工</th>
                                            <th>竣工</th>
                                            <th>修建类别</th>
                                            <th>修建原因</th>
                                            <th>工程范围</th>
                                            <th>工程费用（万元）</th>
                                            <th>经费来源</th>
                                            <th>质量评定</th>
                                            <th>建设单位</th>
                                            <th>设计单位</th>
                                            <th>施工单位</th>
                                            <th>监理单位</th>
                                            <th style="text-align: center;" colspan="2">操作</th>
                                        </tr>
                                    </table>
                                </div>

                                <div class="tab-pane fade padding-10 no-padding-bottom" id="s6"
                                     style=" height:500px; overflow-y:scroll;">
                                    <!-- widget content -->
                                    <!-- <div class="widget-body-toolbar bg-color-white"> -->

                                    <table id='table6' class="table table-bordered table-striped">
                                        <div class="col-sm-12 col-md-12 text-align-right">
                                            <div class="widget-body-toolbar bg-color-white">
                                                <button onclick="changeMan()" type="submit"
                                                        class="btn btn-primary" disabled="disabled">修改
                                                </button>
                                                <!-- </div> -->
                                            </div>
                                        </div>
                                    </table>
                                    <table id="table7" class="table table-bordered table-striped"></table>

                                    <!-- end s7 tab pane -->
                                    <!-- 	</div> -->

                                    <!-- end widget div -->
                                </div>
                                <!-- end widget -->
                                <!--
									<div class="tab-pane fade padding-10 no-padding-bottom" id="s7"
										style="overflow-y:scroll;">
										<table id="div1" class="table table-bordered table-striped">
											<div class="col-sm-12 col-md-12 text-align-right">
												<button onclick="changePri()" type="submit"
													class="btn btn-primary">修改</button>
											</div>
										</table>
									</div>
									 -->
                            </div>
                        </div>
                    </div>
                </article>
                <!-- END GRID -->
            </div>
            <!-- end row -->
        </section>
        <!-- end widget grid -->
    </div>
    <!-- END #MAIN CONTENT -->
    <!-- 		</div> -->

    <div id="cover" class="cover">
        <div id="loading" class="loading">正在生成PDF！</div>
    </div>
    <!-- END #MAIN PANEL -->
    <div id="up">
        <!-- <form> -->
        <!-- id="form1" action="../BrgCardServlet" method="post" -->
        <!--
			<div class="col-sm-12 col-md-10">
				<div class="form-group">
					<label class="sr-only">桥梁照片</label> <select
						class="form-control input-sm" id="britype" name="britype">
						<option>立面照</option>
						<option>桥面正面照</option>
					</select>
				</div>
				<div class="form-group">
					<label class="sr-only">File input</label>
					<div class="col-md-10">
						<input type="file" name="f1" id="f1">
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-md-2 text-align-right">
				<button id="upload1" type="submit" class="btn btn-primary">
					确定</button>
			</div>-->
        <!-- </form> -->
    </div>
    <!--
		<div id="opera">

			<fieldset>
				<div class="form-group">
					<div class="form-group">
						<label>桥梁编号</label> <input class="form-control" id="bridge_no"
							value="" placeholder="" type="text">
					</div>
					<div class="form-group">
						<label>桥梁名称</label> <input class="form-control" id="bridge_name"
							value="" placeholder="" type="text">
					</div>
					<div class="form-group">
						<label>所属路线等级</label> <input class="form-control"
							id="roadline_level" value="" placeholder="" type="text">
					</div>
			</fieldset>
		</div>
 -->

    <div id="tb1" hidden="hidden">
        <form class="smart-form">
            <fieldset>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>1</th>
                        <td><label>路线编号</label>
                        </td>
                        <td style="width: 230px "><input class="form-control"
                                                         id="roadline_no" value="" placeholder="" type="text"
                                                         readonly="readonly">
                        </td>
                        <th>2</th>
                        <td><label>路线名称</label>
                        </td>
                        <td style="width: 230px"><select style="width: 100%" class="form-control"
                                                         id="roadline_name"></select>
                        </td>
                        <th>3</th>
                        <td><label>路线等级</label>
                        </td>
                        <td style="width: 230px"><input class="form-control"
                                                        id="roadline_level" readonly="readonly" value="" placeholder=""
                                                        type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td><label>桥梁编号</label>
                        </td>
                        <td><input class="form-control" id="bridge_no" value=""
                                   placeholder="" type="text">
                        </td>
                        <th>5</th>
                        <td><label>桥梁名称</label>
                        </td>
                        <td><input class="form-control" id="bridge_name" value=""
                                   placeholder="" type="text">
                        </td>
                        <th>6</th>
                        <td><label>桥位桩号</label><font style="color: red">*</font>
                        </td>
                        <td><input class="form-control" id="bridge_pile_no" value=""
                                   placeholder="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>7</th>
                        <td><label>功能类型</label>
                        </td>
                        <td><select class="combobox form-control" id="function_type">
                            <option value="" selected="selected">请选择</option>
                        </select></td>
                        <th>8</th>
                        <td><label>下穿通道名</label>
                        </td>
                        <td><input class="form-control" id="beneath_path_name"
                                   value="" placeholder="" type="text">
                        </td>
                        <th>9</th>
                        <td><label>下穿通道号</label>
                        </td>
                        <td><input class="form-control" id="beneath_path_pile_no"
                                   value="" placeholder="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>10</th>
                        <td><label>设计载荷</label>
                        </td>
                        <td><select class="combobox form-control" id="design_load">
                            <option value="" selected="selected">请选择</option>
                        </select></td>
                        <th>11</th>
                        <td><label>通行载重</label>
                        </td>
                        <td>
                            <select class="combobox form-control" id="pass_load">
                                <option value="" selected="selected">请选择</option>
                            </select>
                            <!--
							<input class="form-control" id="pass_load" value=""
								placeholder="" type="text">
								 -->
                        </td>
                        <th>12</th>
                        <td><label>弯斜坡度</label>
                        </td>
                        <td><input class="form-control" id="skew_slope" value=""
                                   placeholder="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>13</th>
                        <td><label>桥面铺装</label>
                        </td>
                        <td><select class="combobox form-control" id="deck_pavement">
                            <option value="" selected="selected">请选择</option>
                        </select></td>
                        <th>14</th>
                        <td><label>管养单位</label><font style="color: red">*</font>
                        </td>
                        <td>
                            <select class="form-control" id="maintain_org" style="width: 100%">
                            </select>
                        </td>
                        <th>15</th>
                        <td><label>建成年限</label><font style="color: red">*</font>
                        </td>
                        <td><input class="form-control" id="build_year" value=""
                                   placeholder="" type="text">
                        </td>
                    </tr>
                    <tr>
                        <th>16</th>
                        <td><label>所属路段</label><font style="color: red">*</font></td>
                        <td><select class="form-control" id="edit_section" style="width: 100%"></select>
                        </td>
                        <th>17</th>
                        <td><label>所属分区</label><font style="color: red">*</font></td>
                        <td><select class="form-control" id="edit_zone" style="width: 100%"></select>
                        </td>
                        <th>18</th>
                        <td><label>跨径组成</label></td>
                        <td><input type="text" class="form-control" id="edit_span_built">
                        </td>
                        
                    </tr>

                    <tr>
                        <th>19</th>
                        <td><label>桥梁分类</label></td>
                        <td><select class="form-control select2" id="edit_brg_type" style="width: 100%">
                            <option value="特大桥">特大桥</option>
                            <option value="大桥">大桥</option>
                            <option value="中桥">中桥</option>
                            <option value="小桥">小桥</option>
                        </select>
                        </td>
                        <th>20</th>
                        <td><label>经纬度坐标</label></td>
                        <td><input type="text" class="form-control" id="edit_location" title="双击拾取坐标">
                        </td>
                        <th></th>
                        <td></td>
                        <td></td>
                    </tr>

                </table>
            </fieldset>
        </form>
    </div>
    <div id="tb2" hidden="hidden" style="overflow-y:scroll">
        <!-- <button id="addTop" onclick="addTop()" class="btn btn-primary" style="margin-left: 1000px">增加上部结构</button>
        <button id="TopFromMbr" onclick="TopFromMbr()" class="btn btn-primary" >来自构件信息</button>
         -->
        <fieldset style="margin-top: 30px">
            <table id="tb22" class="table table-bordered table-striped ">
            </table>
        </fieldset>
    </div>

    <div id="tb3" hidden="hidden">
        <form class="smart-form">
            <fieldset>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>42</th>
                        <th>
                        <td><label>设计图纸</label>
                        </td>
                        <td style="width: 200px"><select
                                class="combobox form-control"
                                onchange="this.parentNode.nextSibling.value=this.value"
                                id="blueprint_state">
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                        <th>43</th>
                        <td><label>设计文件</label>
                        </td>
                        <td style="width: 200px"><select
                                class="combobox form-control"
                                onchange="this.parentNode.nextSibling.value=this.value"
                                id="design_file_state">
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                        <th>44</th>
                        <th>
                        <td><label>施工文件</label>
                        </td>
                        <td style="width: 200px"><select
                                class="combobox form-control"
                                onchange="this.parentNode.nextSibling.value=this.value"
                                id="construct_file_state">
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th>45</th>
                        <th>
                        <td><label>竣工图纸</label>
                        </td>
                        <td><select class="combobox form-control"
                                    onchange="this.parentNode.nextSibling.value=this.value"
                                    id="complete_file_state">
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                        <th>46</th>
                        <td><label>验收文件</label>
                        </td>
                        <td><select class="combobox form-control"
                                    onchange="this.parentNode.nextSibling.value=this.value"
                                    id="acceptance_file_state">
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                        <th>47</th>
                        <th>
                        <td><label>行政文件</label>
                        </td>
                        <td><select class="combobox form-control"
                                    onchange="this.parentNode.nextSibling.value=this.value"
                                    id=administrate_file_state>
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                    </tr>

                    <tr>
                        <th>48</th>
                        <th>
                        <td><label>定期检查报告</label>
                        </td>
                        <td><select class="combobox form-control"
                                    onchange="this.parentNode.nextSibling.value=this.value"
                                    id="regular_report_state">
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                        <th>49</th>
                        <td><label>特殊检查报告</label>
                        </td>
                        <td><select class="combobox form-control"
                                    onchange="this.parentNode.nextSibling.value=this.value"
                                    id="special_report_state">
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                        <th>50</th>
                        <th>
                        <td><label>历次维修资料</label>
                        </td>
                        <td><select class="combobox form-control"
                                    onchange="this.parentNode.nextSibling.value=this.value"
                                    id=history_maintain_state>
                            <option value="" selected="selected">请选择</option>
                            <option value="无">无</option>
                            <option value="全">全</option>
                            <option value="不全">不全</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th>51</th>
                        <th>
                        <td><label>档案号</label>
                        </td>
                        <td><input class="form-control" id="document_no" value=""
                                   placeholder="" type="text">
                        </td>
                        <th>52</th>
                        <td><label>存档案</label>
                        </td>
                        <td><input class="form-control" id="document" value=""
                                   placeholder="" type="text">
                        </td>
                        <th>52</th>
                        <th>
                        <td><label>建档年/月</label>
                        </td>
                        <td><input class="form-control" id="document_time" value=""
                                   placeholder="" type="text">
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>

    <div id="tb4" hidden="hidden">
    <input type="hidden" autofocus/>
        <form class="smart-form">
            <fieldset>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>54</th>
                        <th>55</th>
                        <th>56</th>
                        <th>57</th>
                        <th>58</th>
                        <th>59</th>
                        <th>60</th>
                        <th>61</th>
                        <th>62</th>
                        <th>63</th>
                        <th>64</th>
                    </tr>
                    <tr>
                        <td><label>检查年月<font style="color: red">*</font></label>
                        </td>
                        <td><label>定期或特殊检查</label>
                        </td>
                        <td><label>全桥评定等级</label></td>
                        <td><label>桥台与基础</label>
                        </td>
                        <td><label>桥墩与基础</label>
                        </td>
                        <td><label>地基冲刷</label>
                        </td>
                        <td><label>上部结构</label>
                        </td>
                        <td><label>支座</label></td>
                        <td><label>经常保养小修</label>
                        </td>
                        <td><label>处治对策</label>
                        </td>
                        <td><label>下次检查年份<font style="color: red">*</font></label>
                        </td>
                    </tr>
                    <tr>
                        <td><input class="form-control" id="chk_date"
                                    type="text" data-id="54"/>
                        </td>
                        <td>
                          <select class="combobox form-control" style="width:100%;z-index:99;"
                                id="chk_type" data-id="55">
                              <option value="" selected="selected">请选择</option>
                          </select>
                        </td>
                        <td><!-- <input class="form-control" id="brg_level" value=""
                                   placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="brg_level" data-id="56">
                              <option value="" selected="selected">请选择</option>
                            </select>
                        </td>
                        <td><!-- <input class="form-control" id="abutment_base" value=""
                                   placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="abutment_base" data-id="57">
                              <option value="" selected="selected">请选择</option>
                            </select>
                        </td>
                        <td><!-- <input class="form-control" id="pier_base" value=""
                                   placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="pier_base" data-id="58">
                              <option value="" selected="selected">请选择</option>
                            </select>
                        </td>
                        <td><!-- <input class="form-control" id="foundation_erosion"
                                   value="" placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="foundation_erosion" data-id="59">
                              <option value="" selected="selected">请选择</option>
                            </select>       
                        </td>
                        <td><!-- <input class="form-control" id="top_struts" value=""
                                   placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="top_struts" data-id="60">
                              <option value="" selected="selected">请选择</option>
                            </select>        
                        </td>
                        <td><!-- <input class="form-control" id="support" value=""
                                   placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="support" data-id="61">
                              <option value="" selected="selected">请选择</option>
                            </select>       
                        </td>
                        <td><!-- <input class="form-control" id="always_repairs" value=""
                                   placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="always_repairs" data-id="62">
                              <option value="" selected="selected">请选择</option>
                            </select>       
                        </td>
                        <td><!-- <input class="form-control" id="disposal_strategy"
                                   value="" placeholder="" type="text"> -->
                            <select class="form-control combobox" style="width:100%;z-index:99;"
                                id="disposal_strategy" data-id="63">
                              <option value="" selected="selected">请选择</option>
                            </select>       
                        </td>
                        <td><input class="form-control" id="next_date" value=""
                                   placeholder="" type="text">
                        </td>
                    </tr>

                </table>
            </fieldset>
        </form>
    </div>

    <div id="tb5" hidden="hidden">
        <form class="smart-form">
            <fieldset>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>66</th>
                        <th>施工日期</th>
                        <th>67</th>
                        <th>68</th>
                        <th>69</th>
                        <th>70</th>
                        <th>71</th>
                        <th>72</th>
                        <th>73</th>
                        <th>74</th>
                        <th>75</th>
                        <th>76</th>
                    </tr>
                    <tr>
                        <td><label>施工日期（开工）<font style="color: red">*</font></label>
                        </td>
                        <td><label>施工日期（竣工）<font style="color: red">*</font></label>
                        </td>
                        <td><label>修建类别</label>
                        </td>
                        <td><label>修建原因</label>
                        </td>
                        <td><label>工程范围</label>
                        </td>
                        <td><label>工程费用（万元）</label>
                        </td>
                        <td><label>经费来源</label>
                        </td>
                        <td><label>质量评定</label>
                        </td>
                        <td><label>建设单位</label>
                        </td>
                        <td><label>设计单位</label>
                        </td>
                        <td><label>施工单位</label>
                        </td>
                        <td><label>监理单位</label>
                        </td>
                    </tr>
                    <tr>
                        <td><input class="form-control" id="start_date" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="finish_date" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="type" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="reason" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="scope" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="cost" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="cost_source" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="evaluate_level" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="build_org" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="design_org" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="construct_org" value=""
                                   placeholder="" type="text">
                        </td>
                        <td><input class="form-control" id="supervise_org" value=""
                                   placeholder="" type="text">
                        </td>

                    </tr>
                    <tr>
                        <td><label>备注 : </label>
                        </td>
                        <td colspan="12"><input class="form-control"
                                                style="width: 100%" id="memo" value="" placeholder=""
                                                type="text">
                        </td>
                    </tr>
                </table>

            </fieldset>
        </form>
    </div>
    <div id="tb7" hidden="hidden">
        <fieldset>
            <div class="form-group">
                <label>主管负责人</label> <input class="form-control" id="charge_man"
                                            value="" placeholder="" type="text">
                <!-- <select class="form-control select2" style="width:100%"
						id="charge_man">
						<option value="" selected="selected">请选择</option>
					</select> -->
            </div>
            <div class="form-group">
                <label>填卡人</label>
                <!-- <input class="form-control" id="fill_man"
						value="" placeholder="填卡人" type="text"> -->
                <select class="form-control combobox" style="width:100%"
                        id="fill_man">
                    <option value="" selected="selected">请选择</option>
                </select>
            </div>
            <div class="form-group">
                <label>填卡日期</label> <input class="form-control" id="fill_date"
                                           value="" placeholder="" type="text">
            </div>
            <!--
				<div class="form-group">
					<label>立面照</label> <input name="lmz" id="lmz" type="file">
				</div>
				<div class="form-group">
					<label>桥面正面照</label> <input name="zmz" id="zmz" type="file">
				</div>
				-->
        </fieldset>
    </div>
    <div id="new_brg" hidden="hidden">
        <fieldset>
            <div class="form-group">
                <label>桥梁编号</label><font style="color: red">*</font>
                <input class="form-control" id="new_brg_no" value="" placeholder="编号" type="text">
            </div>
            <div class="form-group">
                <label>桥梁名称</label>
                <input class="form-control" id="new_brg_name" value="" placeholder="名称" type="text">
            </div>
            <div class="form-group">
                <label>路线名称</label><font style="color: red">*</font>
                <!-- <input class="form-control" id="new_highway_name" value=""
						placeholder="类型" type="text">
						 -->
                <select class="form-control " id="new_highway_name">
                    <option></option>
                </select>
            </div>
            <div class="form-group">
                <label>中心桩号</label>
                <!-- <select class="form-control " id="new_pier_no"></select> -->
                <input class="form-control" id="new_pier_no" value="" placeholder="中心桩号" type="text">
            </div>
            <div class="form-group">
                <label>管养单位</label><font style="color: red">*</font>
                <select class=" form-control " id="new_maintain_org">
                    <option></option>
                </select>
            </div>
            <div class="form-group">
                <label>所属路段</label><font style="color: red">*</font><select class="form-control "
                                                                            id="new_section_id">
                <option></option>
            </select>
            </div>
            <div class="form-group">
                <label>所属分区</label><font style="color: red">*</font><select class="form-control "
                                                                            id="new_zone_id">
                <option></option>
            </select>
            </div>
            <div class="form-group">
                <label>跨径组成</label>
                <!-- <select class="form-control " id="new_span_build"> -->
                <input class="form-control" id="new_span_build">
            </div>
            <div class="form-group">
                <label>主跨组成</label>
                <select class="form-control select2" style="width: 100%" id="new_main_span">
                </select>
            </div>
            <div class="form-group">
                <label>桥梁分类</label>
                <select class="form-control" id="new_bridge_mode">
                    <option value="" selected="selected">请选择</option>
                    <option value="特大桥">特大桥</option>
                    <option value="大桥">大桥</option>
                    <option value="中桥">中桥</option>
                    <option value="小桥">小桥</option>
                </select>
            </div>
            <div class="form-inline">
                <div class="form-group">
                    <label>经纬坐标</label><font style="color: red">*</font> <input style="width: 610px"
                                                                                class="form-control" id="new_location"
                                                                                value="" placeholder="坐标" type="text">
                </div>
                <div class="form-group">
                    <div id="point">
                        <a class="btn btn-default" onclick="getBridgePoint()">定位桥梁</a>
                    </div>
                </div>
            </div>
            <div style="width: 750px;height: 300px;margin-top: 10px" id="map"
            ></div>
        </fieldset>
    </div>


    <div id="e_map">
        <div style="width: 750px;height: 300px;margin-top: 10px" id="edit_map"></div>
    </div>

<!-- 快速构件 -->
<div id="quickMen" hidden="hidden">
    <form>
        <fieldset>
            <div class="form-group">
                <label>墩台号</label>
                <input class="form-control" id="quick_span_number" value="" placeholder="墩台号(填写格式  : 1-1,2-4,5-8,...)"
                       type="text">
            </div>
            <div class="form-group">
                <label>形式</label>
                <select class="form-control" id="quick_span_type" onchange="hideOrShowDiv()" style="width: 100%">
                    <option value="1">分离式</option>
                    <option value="2">整体式</option>
                </select>
            </div>
            <div id="span_direction">
                <label>
                    <input type="checkbox" name="direction" id="span_top" value="上行">上行
                </label>
                &nbsp;
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
                    <th hidden='hidden'>序号</th> 
                    <th>方向</th>
                    <th>墩台号</th>
                    <th>墩台形式</th>
                    <th>材料</th>
                    <th>基础形式</th>
                    <th>涉水</th>
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
    <div id="showtip" hidden="hidden">
        <table class="table table-bordered table-striped">
            <tr>
                <th>跨径组成</th>
                <td id="showspan_build"></td>
            </tr>
        </table>
    </div>

</div>
<%-- 	<%@ include file="footer.jsp" %> --%>

<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }'
        src="../js/plugin/pace/pace.min.js"></script>

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="../js/libs/jquery-2.1.1.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
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

<script type="text/javascript"
        src="../js/plugin/jquery-form/jquery-form.min.js"></script>

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

<!-- Flot Chart Plugin: Flot Engine, Flot Resizer, Flot Tooltip -->
<script src="../js/plugin/flot/jquery.flot.cust.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.resize.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.time.min.js"></script>
<script src="../js/plugin/flot/jquery.flot.tooltip.min.js"></script>

<!-- Vector Maps Plugin: Vectormap engine, Vectormap language -->
<script src="../js/plugin/vectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../js/plugin/vectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- Full Calendar -->
<script src="../js/plugin/moment/moment.min.js"></script>
<script src="../js/plugin/fullcalendar/jquery.fullcalendar.min.js"></script>

<script src="../jstree/jstree.min.js"></script>

<script src="../js/plugin/superbox/superbox.min.js"></script>

<script src="../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="check/select2Fix.js"></script>

<!-- ms -->
<script type="text/javascript" src="../js/ms/magicsuggest-min.js"></script>
<!-- bscombobox -->
<script type="text/javascript"
        src="../js/plugin/bscombobox/bootstrap-combobox.js"></script>
<!-- pdfobjects -->
<script type="text/javascript"
        src="../js/plugin/PDFObjects/pdfobject.js"></script>
<script type="text/javascript" src="check/jquery.datetimepicker.full.js"></script>        
<!-- bs_timepicker -->
<!--  <script type="text/javascript" src="../js/plugin/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>-->
<!--  <script type="text/javascript" src="../js/plugin/bootstrap-timepicker/bootstrap-datetimepicker.min.js"></script>-->
<!-- baidu_map -->
<script src="../js/laydate/laydate.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=BmTwezCvWyGaH3KNYkc5P6uq"></script>

</head>
<script type="text/javascript">
    laydate.render({
	  elem: '#build_year',//指定元素
	  type: 'month'
    });
    laydate.render({
	  elem: '#chk_date', //指定元素
	  type: 'month'
	});
    laydate.render({
  	  elem: '#next_date', //指定元素
  	  type: 'year'
  	});
    laydate.render({
   	  elem: '#document_time', //指定元素
   	  type: 'month'
	});
    laydate.render({
   	  elem: '#start_date', //指定元素
   	  type: 'month',
      trigger: 'click'
  	});
    laydate.render({
   	  elem: '#finish_date', //指定元素
   	  type: 'month',
      trigger: 'click'
   	});
    laydate.render({
   	  elem: '#fill_date', //指定元素
   	  type: 'date',
      trigger: 'click'
   	});
    
    function hideOrShowDiv(){
        	if($("#quick_span_type").val()=='2'){
        		$("#span_direction").hide();
       		}else{
       			$("#span_direction").show();
       		}
    }
   
    
    var session =
        <%=JSON.toJSONString(oc)%>
    var check_val = [];
    var span_top = undefined;
    var span_down = undefined;
    var all_span = undefined;
    var arrs_format = undefined;
    var span_material = undefined;
    function creatQuickSpan(quickSpan_no, quickSpan_duntai_no, 
    		quick_down_struct_type, quick_down_struct_stuff,
    		quick_down_struct_base_type,ifWadeOrNo) {
        var o = {
            quickSpan_no: quickSpan_no,
            quickSpan_duntai_no: quickSpan_duntai_no,
            quick_down_struct_type: quick_down_struct_type,
            quick_down_struct_stuff: quick_down_struct_stuff,
            quick_down_struct_base_type: quick_down_struct_base_type,
            ifWadeOrNo : ifWadeOrNo
        }
        return o;
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
   	var maintainOrg_id = "<%=(String)request.getSession().getAttribute("orgid")%>";
    var hhhhh;
    var hhhhs;
    var hhhbs;
    var hyid;
    var inf;
    var struts;
    var table5_size;
    var root;
    var hw;
    var org;
    var zone;
    var section;
    var top_len;
    var down_len;
    var data_complete=false;
    //权限
	var role = undefined;
    //上部结构对象
    function creatTop_struct(top_struct_id, top_struct_hole_no, top_struct_type, top_struct_span, top_struct_stuff) {
        var o = {
            top_struct_id: top_struct_id,
            top_struct_hole_no: top_struct_hole_no,
            top_struct_type: top_struct_type,
            top_struct_span: top_struct_span,
            top_struct_stuff: top_struct_stuff
        };
        return o;
    }
    //下部结构对象
    function creatDown_struct(down_struct_id, down_struct_pier, down_struct_type, down_struct_stuff, down_struct_base_type) {
        var o = {
            down_struct_id: down_struct_id,
            down_struct_pier: down_struct_pier,
            down_struct_type: down_struct_type,
            down_struct_stuff: down_struct_stuff,
            down_struct_base_type: down_struct_base_type
        };
        return o;
    }
    /******************************************/
    /*地图*/
    var map = new BMap.Map("map");
    map.setMinZoom(5);
    map.centerAndZoom("江苏省", 8);
    map.enableScrollWheelZoom(true);
    map.addEventListener("click", function (e) {
        map.clearOverlays();
        $('#new_location').val(e.point.lng + "," + e.point.lat);
        var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
        map.addOverlay(marker);
    });

    /******************************************/


    $("#edit_location").dblclick(function () {
        init_edit_map();
        $('#e_map').dialog({
            buttons: [{
                html: "<i class='fa fa-times'></i>&nbsp; 取消",
                "class": "btn btn-default",
                click: function () {
                    $(this).dialog("close");
                }
            }]
        });
        $('#e_map').dialog({
            title: "拾取坐标"
        });
        $('#e_map').dialog("open");
    });

    $('#opera').dialog({
        autoOpen: false,
        minWidth: 1000,
        resizable: true,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    $('#e_map').dialog({
        autoOpen: false,
        minWidth: 800,
        resizable: true,
        modal: true,
        show: 'drop',
        hide: 'drop'
    });

    $('#showtip').dialog({
        autoOpen: false,
        minWidth: 1000,
        resizable: true,
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

    $('#opera').prop('hidden', false);
    $(document).ready(
        function () {
            // DO NOT REMOVE : GLOBAL FUNCTIONS!
            pageSetUp();
            
            var str = location.href;
            var ss = location.search;
            var arr = str.split("#");
            if (arr[1] == "add=true") {
                //初始化select选项
                init_maintain_org();
                init_line();
                //新增桥梁
                new_brg();
                initLX();
            } else {
                initBridgCard();
                initDirection();
                //$( document ).tooltip();
                //去掉默认的contextmenu事件，否则会和右键事件同时出现。
                document.oncontextmenu = function (e) {
                    e.preventDefault();
                };
                document.getElementById("tb2").onmousedown = function (e) {
                    if (e.button == 2) {
                        addStructs();
                        //$("#addStructs").dialog("open");
                    }
                };
            }
            /*判断当前结构物类型*/
            $('#jstree').jstree(
                {
                    "core": {
                        "animation": 0,
                        "check_callback": true,
                        "variant": "large"
                    },
                    "plugins": ["contextmenu", "dnd", "search",
                        "state", "types", "wholerow"]
                });
            //autoFromMbr();
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
	//快速创建下部构件
    function quickMen() {
        $("#quick_span_number").val("");
        $("#quick_span_type").select2();
        $("#span_top").attr("checked", false);
        $("#span_down").attr("checked", false);
        $('#quickMen').dialog({
            title: "构建下部结构"
        });
        $('#quickMen').dialog("open");
        var span_type =$.cookie("span_type"); 
        $("#quick_span_type").val(span_type);
        $("#quick_span_type").prop("disabled","disabled");
        $("#quick_span_type").trigger('change');
        
        if(span_type=='2'){
        	$("#span_direction").hide();
        }else{
        	$("#span_direction").show();
        }
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
                                choice: "quickBuildDownSpan",
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
                                    console.log(arrs);
                                    all_span = json.obj;
                                    var $table1 = $("#table_quickMen");
                                    removeTabel1();
                                    var str = '';
                                    $("#span_direction input").each(function(){
                                    	if($(this).is(':checked')){
                                    		str += $(this).val();
                                    	}
                                    });
                                    if(str==''||str==undefined){
                                    	str='无';
                                    }
                                    for (var i = 0; i < arrs.length; i++) {
                                        var arr = arrs[i];
                                        for (var j = 0; j < arr.length; j++) {
                                            $table1.append("<tr id='" + i + "'><td hidden='hidden' id='quickSpan_no" + arr[j] 
                                            + "' style='width:30px'>" + arr[j] 
                                            + "</td><td style='width:60px'>"+str+"</td><td style='width:200px'><input class='form-control' id='quickSpan_duntai_no"
                                            + arr[j] + "'onchange='quickSpan_duntai_no(this)' value='"+arr[j]+"'></td><td style='width:200px'><select class='select2 form-control' style='width:100%'  id='quick_down_struct_type" 
                                            + arr[j] + "'></select></td><td style='width:200px'><select class='select2 form-control' style='width:100%'  id='quick_down_struct_stuff" 
                                            + arr[j] + "'></select></td><td style='width:200px'><select class='select2 form-control' style='width:100%' id='quick_down_struct_base_type" 
                                            + arr[j] + "'></select></td>"
                                            +"<td style='width: 50px'><input type='checkbox' id='ifWadeOrNo"+arr[j]+"'></td>"
                                            +"</tr>");
                                            
                                            
                                            for (var k = 0; k < pageArrJson.length; k++) {
                                           	  /*下部结构形式*/
                                                 if (pageArrJson[k].item_id == 30) {
                                                     if (typeof (pageArrJson[k].item_value) != "undefined") {
                                                             var query = "quick_down_struct_type" + arr[j];
                                                             $("#" + query).append(
                                                                 "<option value='" + pageArrJson[k].item_value + "' >"
                                                                 + pageArrJson[k].item_value + "</option>");
                                                             $("#" + query).select2();
                                                             
                                                     }
                                                 }
                                                 /*下部结构材料*/
                                                 if (pageArrJson[k].item_id == 31) {
                                                     if (typeof (pageArrJson[k].item_value) != "undefined") {
                                                             var query = "quick_down_struct_stuff" + arr[j];
                                                             $("#" + query).append(
                                                                 "<option value='" + pageArrJson[k].item_value + "' >"
                                                                 + pageArrJson[k].item_value + "</option>");
                                                             $("#" + query).select2();
                                                     }
                                                 }
                             	                    /*下部结构基础形式*/
                          	                      if (pageArrJson[k].item_id == 32) {
                                                     if (typeof (pageArrJson[k].item_value) != "undefined") {
                                                             var query = "quick_down_struct_base_type" + arr[j];
                                                             $("#" + query).append(
                                                                 "<option value='" + pageArrJson[k].item_value + "' >"
                                                                 + pageArrJson[k].item_value + "</option>");
                                                             $("#" + query).select2();
                                                     }
                                                 }
                                               }  
                                        }
                                    }
                                    build_quickMem_table();
                                    onSelect2_quickSpan_material();
                                    onSelect2_quickSpan_location();
                                    onSelect2_quickSpanning_case();
                                } else {
                                	errMessage("系统错误");
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
    /**墩台号联动*/
    function quickSpan_duntai_no(obj) {
        var no = $("#" + obj.id).parent().parent().attr("id");
        var span_id = obj.id.replace("quickSpan_duntai_no", "");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                $("#quickSpan_duntai_no" + arr[i]).val($("#" + obj.id).val());
            }
        }
    }
    var arrPage=0;
    /**材料下拉选项联动*/
 /*    function quick_down_struct_type(obj) {
        var no = $("#" + obj.id).parent().parent().attr("id");
        var span_id = obj.id.replace("quick_down_struct_type", "");
        var arr = all_span[no];
        arrPage=arr.length;
        if(arr.length>=13){
        	arr.length=13;
        }
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
            	var text = $("#" + obj.id).val()
                 $("#quick_down_struct_type" + arr[i]).val($("#" + obj.id).val());
            	 $("#quick_down_struct_type" + arr[i]).trigger('change');
            }
        }
        arr.length=arrPage;
    } */
    /**材料选择事件*/
    function onSelect2_quickSpan_material() {
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quick_down_struct_type" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quick_down_struct_type", "");
                quick_down_struct_type(e.target.id, id, e.params.data.text);
            });
        }
    }
    /**材料选择控制*/
    function quick_down_struct_type(id, span_id, span_val) {
        var no = $("#" + id).parent().parent().attr("id");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                arrs_format = $("#quick_down_struct_type" + arr[i])[0].options;
                for (var j = 0; j < arrs_format.length; j++) {
                    if (arrs_format[j].value == span_val)
                        $("#quick_down_struct_type" + arr[i]).val(span_val).trigger("change");
                }
            }
        }
    }
    /**材料下拉选项联动*/
    
    /* function quick_down_struct_stuff(obj) {
        var no = $("#" + obj.id).parent().parent().attr("id");
        var span_id = obj.id.replace("quick_down_struct_stuff", "");
        var arr = all_span[no];
        arrPage=arr.length;
        if(arr.length>=13){
        	arr.length=13;
        }
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
            	var text = $("#" + obj.id).val()
                $("#quick_down_struct_stuff" + arr[i]).val($("#" + obj.id).val());
            	 $("#quick_down_struct_stuff" + arr[i]).trigger('change');
            }
        }
        arr.length=arrPage;
    } */
    /**材料下拉选项联动*/
    function onSelect2_quickSpan_location(){
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quick_down_struct_stuff" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quick_down_struct_stuff", "");
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
                arrs_format = $("#quick_down_struct_stuff" + arr[i])[0].options;
                for (var j = 0; j < arrs_format.length; j++) {
                    if (arrs_format[j].value == span_val)
                        $("#quick_down_struct_stuff" + arr[i]).val(span_val).trigger("change");
                }
            }
        }
    }
    /**基础形式下拉选项联动*/
/*     function quick_down_struct_base_type(obj) {
        var no = $("#" + obj.id).parent().parent().attr("id");
        var span_id = obj.id.replace("quick_down_struct_base_type", "");
        var arr = all_span[no];
        if(arr.length>=13){
        	arr.length=13;
        }
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
            	var text = $("#" + obj.id).val()
                $("#quick_down_struct_base_type" + arr[i]).val($("#" + obj.id).val());
            	 $("#quick_down_struct_base_type" + arr[i]).trigger('change');
            }
        }
        arr.length=arrPage;
    } */
    /**基础形式下拉选择事件*/
    function onSelect2_quickSpanning_case() {
        var tr = $("#table_quickMen").find("tr");
        for (var i = tr.length; i > 0; i--) {
            var no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
            $("#quick_down_struct_base_type" + no).on("select2:select", function (e) {
                var id = e.target.id;
                id = id.replace("quick_down_struct_base_type", "");
                quickSpanning_caseControl(e.target.id, id, e.params.data.text);
            });
        }
    }
    /**基础形式下拉选择控制*/
    function quickSpanning_caseControl(id, span_id, span_val) {
        var no = $("#" + id).parent().parent().attr("id");
        var arr = all_span[no];
        for (var i = 0; i < arr.length; i++) {
            if (parseInt(arr[i]) > parseInt(span_id)) {
                arrs_format = $("#quick_down_struct_base_type" + arr[i])[0].options;
                for (var j = 0; j < arrs_format.length; j++) {
                    if (arrs_format[j].value == span_val)
                        $("#quick_down_struct_base_type" + arr[i]).val(span_val).trigger("change");
                }
            }
        }
    }
/*     function ifWadeOrNo(obj){
    	 var no = $("#" + obj.id).parent().parent().attr("id");
    	 var checked = $("#" + obj.id).is(':checked');
         var span_id = obj.id.replace("ifWadeOrNo", "");
         var arr = all_span[no];
         for (var i = 0; i < arr.length; i++) {
             if (parseInt(arr[i]) > parseInt(span_id)) {
            	 if(checked){
            		 $("#ifWadeOrNo" + arr[i]).prop('checked','checked'); 
            	 }else{
            		 $("#ifWadeOrNo" + arr[i]).removeAttr('checked'); 
            	 }
                 
             }
         }
    } */

    /**提交表格*/
    function build_quickMem_table() {
        $('#quickMen_table').dialog({
            title: "构建下部结构"
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
                    	
                    	  $.SmartMessageBox({
                              title: "提示",
                              content: "确认快速创建当前所选择墩台么？该操作会清空以往的墩台数据！",
                              buttons: '[取消][确定]'
                          }, function (ButtonPressed) {
                              if (ButtonPressed === "确定") {
                            	    var tr = $("#table_quickMen").find("tr");
                                    var quickSpan_s = new Array();
                                    for (var i = 1; i < tr.length; i++) {
                                        var quickSpan_no = $("#table_quickMen tr:eq(" + i + ") td:eq(0)").text();
                                        var quickSpan_duntai_no = $("#quickSpan_duntai_no" + quickSpan_no).val();
                                        var quick_down_struct_type = $("#quick_down_struct_type" + quickSpan_no).val();
                                        var quick_down_struct_stuff = $("#quick_down_struct_stuff" + quickSpan_no).val();
                                        var quick_down_struct_base_type = $("#quick_down_struct_base_type" + quickSpan_no).val();
                                        var ifWadeOrNo = $("#ifWadeOrNo" + quickSpan_no).is(":checked");
                                        var quickSpan = creatQuickSpan(quickSpan_no, quickSpan_duntai_no, 
                                        		quick_down_struct_type, quick_down_struct_stuff,
                                        		quick_down_struct_base_type,ifWadeOrNo);
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
                                    $("#cover").text("正在创建下部构件！")
                                    $("#cover").show();
                                    $.ajax({
                                        type: 'POST',
                                        url: '../BrgMemberServlet',
                                        dataType: 'json',
                                        data: {
                                            choice: "quickDownSpan_s",
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
                                           	    $("#cover").text("正在生成PDF!");
                                                location.reload();
                                            }
                                            else {
                                                errMessage("创建失败");
                                                $("#cover").hide();
                                            }
                                        }
                                    });
                              }
                          });

                        // $( this ).dialog( "close" );
                    }
                }
            ]
        });
    }
	
    function init_edit_map() {
        var eidt_map = new BMap.Map("edit_map");
        eidt_map.setMinZoom(5);
        eidt_map.centerAndZoom("江苏省", 8);
        eidt_map.enableScrollWheelZoom(true);
        eidt_map.enableAutoResize(true);
        eidt_map.addEventListener("click", function (e) {
            eidt_map.clearOverlays();
            $('#edit_location').val(e.point.lng + "," + e.point.lat);
            var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
            eidt_map.addOverlay(marker);
            $('#e_map').dialog("close");
        });
    }
    
    function checkFromSpanInfo(){
		 $.ajax({
            type: 'GET',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
              type: "checkFromSpanInfo"
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
            	if(json.success == "success"){
            		console.log(json);
            		data_complete=true;
            	}
            }
         });
	}
    
    
    function init_maintain_org() {
        $.ajax({
            type: 'GET',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_maintain_org"
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#new_maintain_org').append(
                            "<option value='" + arr[i].org_id + "'>"
                            + arr[i].org_name + "</option>");
                    }
                    $('#new_maintain_org').select2();
                    if(maintainOrg_id != "null"&&maintainOrg_id!=undefined){
                     $('#new_maintain_org').val(maintainOrg_id).trigger("change");
                     	$('#new_maintain_org').attr("disabled","true");
                     	 init_section_id(maintainOrg_id);
                        init_zone_id(maintainOrg_id);
                    }
                    $('#new_zone_id').select2();
                    $('#new_section_id').select2();
                    $('#new_maintain_org').on("select2:select", function (e) {
                        init_section_id($('#new_maintain_org').val());
                        init_zone_id($('#new_maintain_org').val());
                    });
                }
                else {
                    errMessage("生成管养单位出错");
                }
            }
        });
    }

    function init_Edit_maintain_org() {
        $.ajax({
            type: 'GET',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_maintain_org"
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    org = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#maintain_org').append(
                            "<option value='" + arr[i].org_id + "'>"
                            + arr[i].org_name + "</option>");
                    }
                    $('#maintain_org').select2();
                    if(maintainOrg_id != "null"&&maintainOrg_id!=undefined){
                     $('#maintain_org').val(maintainOrg_id).trigger("change");
                     	$('#maintain_org').attr("disabled","true");
                     	 init_Edit_section_id(maintainOrg_id);
                        init_Edit_zone_id(maintainOrg_id);
                    }
                    $('#edit_brg_type').select2();
                    init_Edit_section_id($('#maintain_org').val());
                    init_Edit_zone_id($('#maintain_org').val());
                    $('#maintain_org').on("select2:select", function (e) {
                        init_Edit_section_id($('#maintain_org').val());
                        init_Edit_zone_id($('#maintain_org').val());
                    });
                }
                else {
                    errMessage("生成管养单位出错");
                }
            }
        });
    }

    function init_section_id(id) {
        $('#new_section_id').val(null).trigger("change");
        $('#new_section_id').empty();
        $.ajax({
            type: 'POST',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_section_id",
                id: id
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#new_section_id').append(
                            "<option value='" + arr[i].section_id + "'>"
                            + arr[i].section_name + "</option>");
                        $('#new_section_id').select2();
                    }
                }
                else {
                    errMessage("生成所属路线出错");
                }
            }
        });
    }
    function getSectiondata() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "getSectiondata",
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    section = json.obj;
                }
            }
        });
    }

    function getZonedata() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "getZonedata",
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    zone = json.obj;
                }
            }
        });
    }

    function init_Edit_section_id(id, section) {
        $('#edit_section').select2();
        $('#edit_section').val(null).trigger("change");
        $('#edit_section').empty();
        $.ajax({
            type: 'GET',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_section_id",
                id: id
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#edit_section').append(
                            "<option value='" + arr[i].section_id + "'>"
                            + arr[i].section_name + "</option>");
                        $('#edit_section').select2();
                    }
                    if (section != null) {
                        $('#edit_section').val(getManage_id(section, "section")).trigger("change");
                    }
                }
                else {
                    errMessage("生成所属路线出错");
                }
            }
        });
    }

    function init_Edit_zone_id(id, name) {
        $('#edit_zone').select2();
        $('#edit_zone').val(null).trigger("change");
        $('#edit_zone').empty();
        $.ajax({
            type: 'GET',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_zone_id",
                id: id
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#edit_zone').append(
                            "<option value='" + arr[i].zone_id + "'>"
                            + arr[i].zone_name + "</option>");
                        $('#edit_zone').select2();
                    }
                    if (name != null && name != "") {
                        $('#edit_zone').val(getManage_id(name, "zone")).trigger("change");
                    }
                }
                else {
                    errMessage("生成所属分区出错");
                }
            }
        });
    }
    var qx = $("#new_main_span");
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
                    var len1 = obj.qx.length;
                    gjlx = obj.gjlx;
                    
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
    
    function init_zone_id(id) {
        $('#new_zone_id').val(null).trigger("change");
        $('#new_zone_id').empty();
        $.ajax({
            type: 'GET',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_zone_id",
                id: id
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#new_zone_id').append(
                            "<option value='" + arr[i].zone_id + "'>"
                            + arr[i].zone_name + "</option>");
                        $('#new_zone_id').select2();
                    }
                }
                else {
                    errMessage("生成所属分区出错");
                }
            }
        });
    }


    function init_line() {
        $.ajax({
            type: 'GET',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_line"
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#new_highway_name').append(
                            "<option value='" + arr[i].highway_id + "'>"
                            + arr[i].highway_name + "</option>");
                    }
                    $('#new_highway_name').select2();
                }
                else {
                    errMessage("生成路线出错");
                }
            }
        });
    }

    function init_Edit_line() {
        $.ajax({
            type: 'GET',
            url: '../NewBrgServlet',
            dataType: 'json',
            data: {
                type: "init_line"
            },
            error: function (msg) {
                errMessage("系统错误！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    hw = json.obj;
                    for (var i = 0; i < arr.length; i++) {
                        $('#roadline_name').append(
                            "<option value='" + arr[i].highway_id + "'>"
                            + arr[i].highway_name + "</option>");
                    }
                    $('#roadline_name').select2();
                    $('#roadline_name').on("select2:select", function (e) {
                        $.ajax({
                            type: 'GET',
                            url: '../NewBrgServlet',
                            dataType: 'json',
                            data: {
                                type: "getHighway_no",
                                highway_id: $('#roadline_name').val()
                            },
                            error: function (msg) {
                                errMessage("系统错误！");
                            },
                            success: function (json) {
                                if (json.success == "success") {
                                    var data = json.obj[0];
                                    $("#roadline_no").val(data.highway_no);
                                    $("#roadline_level").val(data.highway_level);
                                }
                            }
                        });
                    });
                }
                else {
                    errMessage("生成路线出错");
                }
            }
        });
    }
    /**解析桥名，获得经纬度*/
    function getBridgePoint() {
        if ($('#new_brg_name').val() == "") {
            return;
        }
        map.clearOverlays();
        var myGeo = new BMap.Geocoder();
        myGeo.getPoint($('#new_brg_name').val(), function (point) {
            if (point) {
                $('#new_location').val(point.lng + "," + point.lat);
                var marker = new BMap.Marker(point);
                map.addOverlay(marker);
                map.centerAndZoom(point, 14);
            } else {
                errMessage("无法获取桥梁地址，请从地图上手动选取！");
            }
        }, "江苏省");
    }

    /**新建桥梁*/
    function new_brg() {
        //var maintain_org = $("#new_maintain_org").select2("data");
        var maintain_org = $("#new_maintain_org").text();
        $('#new_brg').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                "class": "btn btn-default",
                click: function () {
                    if ($("#new_brg_no").val() == "") {
                        errMessage("请输入桥梁编号!");
                        return false;
                    }
                    if ($("#new_highway_name").val() == "") {
                        errMessage("请选择路线名称!");
                        return false;
                    }
                    if ($("#new_manage_org").val() == "") {
                        errMessage("请选择管养单位!");
                        return false;
                    }
                    if ($("#new_section_id").val() == "") {
                        errMessage("请选择所属路段!");
                        return false;
                    }
                    if ($("#new_zone_id").val() == "") {
                        errMessage("请选择所属分区!");
                        return false;
                    }
                    else {
                        if ($("#new_zone_id").val() == null) {
                            errMessage("所属分区不能为空!");
                            return false;
                        }
                    }
                    if ($("#new_location").val() == "") {
                    	errMessage("请选择经纬度!");
                        return false;
                    } else {
                        var location = $("#new_location").val();
                        if (location.indexOf(",") != -1) {
                            var arr = location.split(",");
                            if (arr.length != 2) {
                                errMessage("桥梁经纬度格式错误!");
                                return false;
                            } else {
                                var patten = /^[0-9]+.?[0-9]*$/;
                                if (!patten.test(arr[0]) || !patten.test(arr[1])) {
                                    errMessage("桥梁经纬度格式错误!");
                                    return false;
                                }
                            }
                        } else {
                            errMessage("桥梁经纬度格式错误!");
                            return false;
                        }
                    }
                    $.ajax({
                        type: 'POST',
                        url: '../NewBrgServlet',
                        dataType: 'json',
                        data: {
                            type: "new_brg",
                            new_brg_no: $("#new_brg_no").val(),
                            new_brg_name: $("#new_brg_name").val(),
                            new_highway_name: $("#new_highway_name").val(),
                            new_pier_no: $("#new_pier_no").val(),
                            new_maintain_org: $("#new_maintain_org").val(),
                            new_section_id: $("#new_section_id").val(),
                            new_zone_id: $("#new_zone_id").val(),
                            new_span_build: $("#new_span_build").val(),
                            new_bridge_mode: $("#new_bridge_mode").val(),
                            new_location: $("#new_location").val(),
                            new_main_span:$("#new_main_span").val()
                        },
                        error: function (msg) {
                            errMessage("请求BrgCardServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "success") {
                                successMessage("添加桥梁成功");
                                $('#new_brg').dialog("close");
                                window.location.href = "structMgr.jsp";
                            } else {
                                errMessage("新建桥梁失败");
                            }
                        }
                    });
                }
            },
                {
                    html: "<i class='fa fa-times'></i>&nbsp; 取消",
                    "class": "btn btn-default",
                    click: function () {
                        window.location.href = "structMgr.jsp";
                        $(this).dialog("close");

                    }
                }]
        });
        $('#new_brg').dialog({
            title: "新增桥梁"
        });
        $('#new_brg').dialog("open");
    }

    /**初始化桥梁卡片*/
    /*to do*/
    function initBridgCard() {
        /**行政识别数据*/
        initBrgCardInfo();
        /**结构技术数据*/
        initBrgCardStructTech();
        /**档案资料*/
        initBrgCardDocument();
        /**最近技术状况评定*/
        initBrgCardEvaluation();
        /**修建工程记录*/
        initBrgCardConstructPrj();
        /**桥梁照片*/
        getBridge_id();
        initSelect_rang_A();
        init_Edit_line();
        init_Edit_maintain_org();
        getSectiondata();
        getZonedata();
        initStrcuctS();
        initSelect_rang_C();
        initSelect_rang_Picture();
        checkFromSpanInfo();
        
        $.datetimepicker.setLocale('ch');
        
        $('#document').datetimepicker({
            format: "Y-m-d",
            timepicker: false,
            todayButton: true,
        });
      /*   $('#chk_date').datetimepicker({
            format: "Y-m",
            timepicker: false,
            todayButton: true,
            validateOnBlur: false,
        }); */
        /* $('#next_date').datetimepicker({
            format: "Y-m-d",
            timepicker: false,
            todayButton: true,
            validateOnBlur: true,
            onSelectDate: function () {
                var date = $('#next_date').val();
                dates = date.split("-");
                var time = dates[0];
                $('#next_date').val(time);
            },
        }); */
      /*   $('#start_date').datetimepicker({
            format: "Y-m",
            timepicker: false,
            todayButton: true,
            validateOnBlur: true,
            onSelectDate: function () {
                var date = $('#document_time').val();
                dates = date.split("-");
                var time = dates[0] + "-" + dates[1];
                $('#document_time').val(time);
            },
        }); */
        $('#finish_date').datetimepicker({
            format: "Y-m",
            timepicker: false,
            todayButton: true,
            validateOnBlur: false,
            onSelectDate: function () {
                var date = $('#finish_date').val();
                dates = date.split("-");
                var time = dates[0] + "-" + dates[1];
                $('#finish_date').val(time);
            },
        });
    }


    function getExplorer() {
        var explorer = window.navigator.userAgent;
        var version = "";
        if (explorer.indexOf("MSIE") >= 0) {
            version = "ie";
        }
        //firefox
        else if (explorer.indexOf("Firefox") >= 0) {
            version = "Firefox";
        }
        //Chrome
        else if (explorer.indexOf("Chrome") >= 0) {
            version = "Chrome";
        }
        return version;
    }

    function initSelect_rang_A() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initA"
            },
            error: function (msg) {
                errMessage("请求失败");
            },
            success: function (json) {
                var arr = json.obj;
                /*插入select选项*/
                for (var i = 0; i < arr.length; i++) {
                    if (arr[i].item_id == 7) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#function_type').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#function_type').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    if (arr[i].item_id == 10) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#design_load').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#design_load').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    if (arr[i].item_id == 11) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#pass_load').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#pass_load').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    if (arr[i].item_id == 13) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#deck_pavement').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#deck_pavement').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                }
                $('#function_type').combobox();
                $('#design_load').combobox();
                $('#pass_load').combobox();
                $('#deck_pavement').combobox();
            }
        });
    }
    var pageArrJson = undefined;
    function initSelect_rang_B(top_length, down_length) {
        if (top_length < 1) {
            top_length = 1;
        }
        if (down_length < 1) {
            down_length = 1;
        }
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initB"
            },
            error: function (msg) {
                errMessage("请求失败");
            },
            success: function (json) {
                var arr = json.obj;
                pageArrJson = json.obj;
                /*插入select选项*/
                for (var i = 0; i < arr.length; i++) {

                    /*引道线形*/
                    if (arr[i].item_id == 24) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#approach_line_type').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#approach_line_type').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    /*上部结构材料*/
                    if (arr[i].item_id == 28) {
                        if (typeof (arr[i].item_value) != "undefined") {

                            for (var k = 1; k < top_length + 1; k++) {
                                var query = "top_struct_stuff" + k;
                                $("#" + query).append(
                                    "<option value='" + arr[i].item_value + "' >"
                                    + arr[i].item_value + "</option>");
                            }
                        }
                    }

                    /*下部结构形式*/
                    if (arr[i].item_id == 30) {
                        if (typeof (arr[i].item_value) != "undefined") {

                            for (var k = 1; k < down_length + 1; k++) {
                                var query = "down_struct_type" + k;
                                $("#" + query).append(
                                    "<option value='" + arr[i].item_value + "' >"
                                    + arr[i].item_value + "</option>");
                            }
                        }
                    }

                    /*下部结构材料*/
                    if (arr[i].item_id == 31) {
                        if (typeof (arr[i].item_value) != "undefined") {

                            for (var k = 1; k < down_length + 1; k++) {
                                var query = "down_struct_stuff" + k;
                                $("#" + query).append(
                                    "<option value='" + arr[i].item_value + "' >"
                                    + arr[i].item_value + "</option>");
                            }
                        }
                    }

	                    /*下部结构基础形式*/
	                    if (arr[i].item_id == 32) {
                        if (typeof (arr[i].item_value) != "undefined") {

                            for (var k = 1; k < down_length + 1; k++) {
                                var query = "down_struct_base_type" + k;
                                $("#" + query).append(
                                    "<option value='" + arr[i].item_value + "' >"
                                    + arr[i].item_value + "</option>");
                            }
                        }
                    }

                    /*伸缩缝类型*/
                    if (arr[i].item_id == 33) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#expansion_joint_type').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#expansion_joint_type').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    /*支座类型*/
                    if (arr[i].item_id == 34) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#support_type').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#support_type').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    /*地震系数*/
                    if (arr[i].item_id == 35) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#acceleration_factor').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#acceleration_factor').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    /*桥台护坡*/
                    if (arr[i].item_id == 36) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#abutment_slope').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#abutment_slope').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    /*护墩体*/
                    if (arr[i].item_id == 37) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#guard_pier_body').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#guard_pier_body').append(
                                "<option value=''>请输入</option>");
                        }
                    }
                    /*调治构造物*/
                    if (arr[i].item_id == 38) {
                        if (typeof (arr[i].item_value) != "undefined") {
                            $('#treatment_struct').append(
                                "<option value='" + arr[i].item_value + "' >"
                                + arr[i].item_value + "</option>");
                        } else {
                            $('#treatment_struct').append(
                                "<option value=''>请输入</option>");
                        }
                    }

                }
                /*引道线形*/
                $('#approach_line_type').combobox();

                for (var k = 1; k < top_length + 1; k++) {
                    var query = "top_struct_stuff" + k;
                    $("#" + query).select2();

                }

                /*下部结构*/
                for (var k = 1; k < down_length + 1; k++) {
                    var query = "down_struct_type" + k;
                    $("#" + query).select2();

                }
                for (var k = 1; k < down_length + 1; k++) {
                    var query = "down_struct_stuff" + k;
                    $("#" + query).select2();

                }
                for (var k = 1; k < down_length + 1; k++) {
                    var query = "down_struct_base_type" + k;
                    $("#" + query).select2();

                }
                /*伸缩缝类型*/
                $('#expansion_joint_type').combobox();
                /*支座类型*/
                $('#support_type').combobox();
                /*地震系数*/
                $('#acceleration_factor').combobox();
                /*桥台护坡*/
                $('#abutment_slope').combobox();
                /*护墩体*/
                $('#guard_pier_body').combobox();
                /*调治构造物*/
                $('#treatment_struct').combobox();
            }
        });
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initTopStructType"
            },
            error: function (msg) {
                errMessage("请求失败");
            },
            success: function (json) {
                if (json.success = "success") {
                    var arr = json.obj;
                    /*上部结构形式*/
                    for (var i = 0; i < arr.length; i++) {
                        for (var k = 1; k < top_length + 1; k++) {
                            var query = "top_struct_type" + k;
                            $("#" + query).append(
                                "<option value='" + arr[i].brg_type_name + "' >"
                                + arr[i].brg_type_name + "</option>");
                        }
                    }
                }
                /*上部结构*/
                for (var k = 1; k < top_length + 1; k++) {
                    var query = "top_struct_type" + k;
                    $("#" + query).select2();
                }
            }
        });
    }
    function initSelect_rang_C() {
        $('#blueprint_state').combobox();
        $('#design_file_state').combobox();
        $('#construct_file_state').combobox();
        $('#complete_file_state').combobox();
        $('#acceptance_file_state').combobox();
        $('#administrate_file_state').combobox();
        $('#regular_report_state').combobox();
        $('#special_report_state').combobox();
        $('#history_maintain_state').combobox();
    }

    function initSelect_rang_Picture() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initPicture"
            },
            success: function (json) {
                var arr = json.obj;
                for (var i = 0; i < arr.length; i++) {

                    $('#fill_man').append(
                        "<option value='" + arr[i].usr_name + "' >"
                        + arr[i].usr_name + "</option>");
                }
                $('#fill_man').combobox();
            }
        });

    }

    function initBrgCardInfo() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initTableBridge",
            },
            error: function (msg) {
                errMessage("请求BrgCardServlet失败");
            },
            success: function (json) {
                if (json.success == "empty") {
                    errMessage("请设置当前结构数据");
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                    	console.log(data[i]);
                        hhhbs = data[i].bridge_id;
                        $('#table1').append("<tr><th>1</th><th>路线编号</th><td>"
                            + data[i].highway_no
                            + "</td><th>2</th><th>路线名称</th><td>"
                            + data[i].highway_name
                            + "</td><th>3</th><th>路线等级</th><td>"
                            + data[i].highway_level
                            + "</td></tr>");
                        $('#table1').append("<tr><th>4</th><th>桥梁编号</th><td>"
                            + data[i].bridge_no
                            + "</td><th>5</th><th>桥梁名称</th><td>"
                            + data[i].bridge_name
                            + "</td><th>6</th><th>桥位桩号</th><td>"
                            + data[i].bridge_pile_no
                            + "</td></tr>");
                        $('#table1').append("<tr><th>7</th><th>功能类型</th><td>"
                            + data[i].function_type
                            + "</td><th>8</th><th>下穿通道名</th><td>"
                            + data[i].beneath_path_name
                            + "</td><th>9</th><th>下穿通道桩号</th><td>"
                            + data[i].beneath_path_pile_no
                            + "</td></tr>");
                        $('#table1').append("<tr><th>10</th><th>设计载荷</th><td>"
                            + data[i].design_load
                            + "</td><th>11</th><th>通行载重</th><td>"
                            + data[i].pass_load
                            + "</td><th>12</th><th>弯斜坡度</th><td>"
                            + data[i].skew_slope
                            + "</td></tr>");
                        $('#table1').append("<tr><th>13</th><th>桥面铺装</th><td>"
                            + data[i].deck_pavement
                            + "</td><th>14</th><th>管养单位</th><td>"
                            + data[i].manage_name
                            + "</td><th>15</th><th>建成年限</th><td>"
                            + data[i].build_year
                            + "</td></tr>");
                        if (data[i].span_build.length > 20) {
                            $('#table1').append("<tr><th>16</th><th>所属路段</th><td>"
                                + data[i].section_name
                                + "</td><th>17</th><th>所属分区</th><td>"
                                + data[i].zone_name
                                + "</td><th>18</th><th>跨径组成</th><td id='span_view' data-sp='" + data[i].span_build + "'>"
                                + data[i].span_build.substring(0, 20) + "<a href='#' onclick=showdata()> ...</a>"
                                + "</td></tr>");
                        } else {
                            $('#table1').append("<tr><th>16</th><th>所属路段</th><td>"
                                + data[i].section_name
                                + "</td><th>17</th><th>所属分区</th><td>"
                                + data[i].zone_name
                                + "</td><th>18</th><th>跨径组成</th><td id='span_view' data-sp='" + data[i].span_build + "'>"
                                + data[i].span_build
                                + "</td></tr>");
                        }
                        if (data[i].longitude == "" && data[i].latitude == "") {
                            $('#table1').append("<tr><th>19</th><th>桥梁分类</th><td>"
                                + data[i].bridge_mode
                                + "</td><th>20</th><th>经纬坐标</th><td>"
                                + "</td><th></th><th></th><td></td></tr>");
                        } else {
                            $('#table1').append("<tr><th>19</th><th>桥梁分类</th><td>"
                                + data[i].bridge_mode
                                + "</td><th>20</th><th>经纬坐标</th><td>"
                                + data[i].longitude + "," + data[i].latitude
                                + "</td><th></th><th></th><td></td></tr>");

                        }

                    }
                }
            }
        });
    }

    function addTop() {
        $.SmartMessageBox({
            title: "增加上部结构数据",
            content: "您是否确认增加？",
            buttons: '[取消]&nbsp;[确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {

                $.ajax({
                    type: 'POST',
                    url: '../BrgCardServlet',
                    dataType: 'json',
                    data: {
                        type: "addTop",
                    },
                    error: function (msg) {
                        errMessage("增加上部结构失败");
                    },
                    success: function (json) {
                        if (json.success == "success") {
                            removeTb22();
                            removeTable2();
                            reloadData();
                        }
                    }
                });
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
            	    removeTb22();
                    removeTable2();
                    reloadData();
            }
		});
	}
	
	
	
	
	function TopFromMbr(){
		if(!data_complete){
			errMessage("请在'查看构件'页面完善跨信息");
			return;
		}
		$.SmartMessageBox({
            title: "自动统计上部结构信息(来自构件信息)",
            content: "是否确认增加？",
            buttons: '[取消]&nbsp;[确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
            	$.ajax({
                    type: 'POST',
                    url: '../BrgCardServlet',
                    dataType: 'json',
                    data: {
                        type: "topFromSpanInfo",
                    },
                    error: function (msg) {
                        errMessage("增加上部结构失败");
                    },
                    success: function (json) {
                    	    removeTb22();
                            removeTable2();
                            reloadData();
                    }
				});
            }
        });
		  
	}
	
    function addDown() {
        $.SmartMessageBox({
            title: "增加下部结构数据",
            content: "您是否确认增加？",
            buttons: '[取消]&nbsp;[确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../BrgCardServlet',
                    dataType: 'json',
                    data: {
                        type: "addDown",
                    },
                    error: function (msg) {
                        errMessage("增加上部结构失败");
                    },
                    success: function (json) {
                        if (json.success == "success") {
                            removeTb22();
                            removeTable2();
                            reloadData();
                        }
                    }
                });
            }
        });
    }

    function initBrgCardStructTech() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "TableBridge2",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {
                if (json.success == "fail") {
                    successMessage("结构技术数据没有数据");
                    data_complete = false;
                } else {
                	data_complete = true;
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        var brg_top_len = data[i].brgCardTopStruct.length;
                        var brg_down_len = data[i].brgCardDownStruct.length;
                        $('#table2').append("<tr><th>21</th><th colspan='2'>桥长(m)</th><td colspan='2'>"
                            + data[i].bridge_len
                            + "</td><th>22</th><th colspan='2'>桥面总宽(m)</th><td colspan='2'>"
                            + data[i].bridge_width
                            + "</td><th>23</th><th colspan='2'>车行道宽(m)</th><td>"
                            + data[i].lane_width
                            + "</td></tr>");
                        $('#table2').append("<tr><th>24</th><th colspan='2'>桥面标高(m)</th><td colspan='2'>"
                            + data[i].bridge_t_s_height
                            + "</td><th>25</th><th colspan='2'>桥下净高(m)</th><td colspan='2'>"
                            + data[i].bridge_b_height
                            + "</td><th>26</th><th colspan='2'>桥上净高(m)</th><td>"
                            + data[i].bridge_t_height
                            + "</td></tr>");
                        $('#table2').append("<tr><th>27</th><th colspan='2'>引道总宽(m)</th><td colspan='2'>"
                            + data[i].approach_total_width
                            + "</td><th>28</th><th colspan='2'>引道路面宽(m)</th><td colspan='2'>"
                            + data[i].approach_width
                            + "</td><th>29</th><th colspan='2'>引道线形</th><td>"
                            + data[i].approach_line_type
                            + "</td></tr>");
                        if (brg_top_len == 0) {
                            $('#table2').append("<tr id='topS' ><th>30</th><th>上部结构</th><th>跨号1</th><td colspan='2'></td><th>桥型1</th><td colspan='2'>"
                                + "</td><th>跨径1(m)</th><td colspan='2'>"
                                + "</td><th>材料1</th><td colspan='2'>"
                                + "</tr>");
                        } else {
                            for (var k = 0; k < brg_top_len; k++) {
                                if (k == 0) {
                                    $('#table2').append("<tr id='topS'><th rowspan='" + brg_top_len + "'>30</th><th rowspan='" + brg_top_len + "'>上部结构</th><th>跨号1</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_hole_no
                                        + "</td><th>桥型1</th><td colspan='2'><font style='size'>"
                                        + data[i].brgCardTopStruct[k].top_struct_type
                                        + "</td><th>跨径1(m)</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_span
                                        + "</td><th>材料1</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_stuff
                                        + "</tr>");
                                } else {
                                    $('#table2').append("<tr><th>跨号" + parseInt(k + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_hole_no
                                        + "</td><th>桥型" + parseInt(k + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_type
                                        + "</td><th>跨径" + parseInt(k + 1) + "(m)</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_span
                                        + "</td><th>材料" + parseInt(k + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_stuff
                                        + "</tr>");
                                }
                            }
                            ;
                        }
                        ;
                        if (brg_down_len == 0) {
                            $('#table2').append("<tr><th>31</th><th>下部结构</th><th>墩台号1</th><td colspan='2'></td><th>墩台形式1</th><td colspan='2'>"
                                + "</td><th>材料1</th><td colspan='2'>"
                                + "</td><th>基础形式1</th><td colspan='2'>"
                                + "</td><th>涉水1</th><td colspan='2'>"
                                + "</td></tr>");

                        } else {
                            for (var j = 0; j < brg_down_len; j++) {
                                if (j == 0) {
                                	if( data[i].brgCardDownStruct[j].is_wade=='true'){
                                		data[i].brgCardDownStruct[j].is_wade='是';
                                	}else{
                                		data[i].brgCardDownStruct[j].is_wade='否';
                                	}
                                    $('#table2').append("<tr><th rowspan='" + brg_down_len + "'>31</th><th rowspan='"
                                        + brg_down_len + "'>下部结构</th><th>墩台号1</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_pier
                                        + "</td><th>墩台形式1</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_type
                                        + "</td><th>材料1</th><td >"
                                        + data[i].brgCardDownStruct[j].down_struct_stuff
                                        + "</td><th>基础形式1</th><td >"
                                        + data[i].brgCardDownStruct[j].down_struct_base_type
                                        + "</td><th>涉水1</th><td >"
                                        + data[i].brgCardDownStruct[j].is_wade
                                        + "</td></tr>");
                                } else {
                                	if( data[i].brgCardDownStruct[j].is_wade=='true'){
                                		data[i].brgCardDownStruct[j].is_wade='是';
                                	}else{
                                		data[i].brgCardDownStruct[j].is_wade='否';
                                	}
                                	
                                    $('#table2').append("<tr><th>墩台号" + parseInt(j + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_pier
                                        + "</td><th>墩台形式" + parseInt(j + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_type
                                        + "</td><th>材料" + parseInt(j + 1) + "</th><td>"
                                        + data[i].brgCardDownStruct[j].down_struct_stuff
                                        + "</td><th>基础形式" + parseInt(j + 1) + "</th><td>"
                                        + data[i].brgCardDownStruct[j].down_struct_base_type
                                        + "</td><th>涉水"+ parseInt(j + 1) +"</th><td >"
                                        + data[i].brgCardDownStruct[j].is_wade
                                        + "</td></tr>");
                                }
                            }
                            ;
                        }
                        ;
                        $('#table2').append("<tr><th>32</th><th colspan='2'>伸缩缝类型</th><td colspan='2'>"
                            + data[i].expansion_joint_type
                            + "</td><th>33</th><th colspan='2'>支座类型</th><td colspan='2'>"
                            + data[i].support_type
                            + "</td><th>34</th><th colspan='2'>地震动峰值加速度系数</th><td>"
                            + data[i].acceleration_factor
                            + "</td></tr>");
                        $('#table2').append("<tr><th>35</th><th colspan='2'>桥台护坡</th><td colspan='2'>"
                            + data[i].abutment_slope
                            + "</td><th>36</th><th colspan='2'>护墩体</th><td colspan='2'>"
                            + data[i].guard_pier_body
                            + "</td><th>37</th><th colspan='2'>调治构造物</th><td>"
                            + data[i].treatment_struct
                            + "</td></tr>");
                        $('#table2').append("<tr><th>38</th><th colspan='2'>常水位</th><td colspan='2'>"
                            + data[i].water_level
                            + "</td><th>39</th><th colspan='2'>设计水位</th><td colspan='2'>"
                            + data[i].design_level
                            + "</td><th>40</th><th colspan='2'>历史洪水位</th><td>"
                            + data[i].his_flood_level
                            + "</td></tr>");
                    }
                }
            }
        });
    }


    function initBrgCardDocument() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initBrgCardDocument",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {
                if (json.success == "fail") {
                    //successMessage("档案资料没有数据");
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        $('#table3').append("<tr><th>41</th><th>设计图纸</th><td>"
                            + data[i].blueprint_state
                            + "</td><th>42</th><th>设计文件</th><td>"
                            + data[i].design_file_state
                            + "</td><th>43</th><th>施工文件</th><td>"
                            + data[i].construct_file_state
                            + "</td></tr>");
                        $('#table3').append("<tr><th>44</th><th>竣工图纸</th><td>"
                            + data[i].complete_file_state
                            + "</td><th>45</th><th>验收文件</th><td>"
                            + data[i].acceptance_file_state
                            + "</td><th>46</th><th>行政文件</th><td>"
                            + data[i].administrate_file_state
                            + "</td></tr>");
                        $('#table3').append("<tr><th>47</th><th>定期检查报告</th><td>"
                            + data[i].regular_report_state
                            + "</td><th>48</th><th>特殊检查报告</th><td>"
                            + data[i].special_report_state
                            + "</td><th>49</th><th>历次维修资料</th><td>"
                            + data[i].history_maintain_state
                            + "</td></tr>");
                        $('#table3').append("<tr><th>50</th><th>档案号</th><td>"
                            + data[i].document_no
                            + "</td><th>51</th><th>存档案</th><td>"
                            + data[i].document
                            + "</td><th>52</th><th>建档年/月</th><td>"
                            + data[i].document_time
                            + "</td></tr>");
                    }
                }
            }
        });
    }

    /*todo*/
    function clear_nearly() {
        var len = $("#table4").find("tr").length - 1;

        $("#chk_date").val($("#table4 tr:eq(" + len + ") td:eq(0)").text());
        $("#chk_typeundefined").val($("#table4 tr:eq(" + len + ") td:eq(1)").text());
        $("#brg_levelundefined").val($("#table4 tr:eq(" + len + ") td:eq(2)").text());
        $("#abutment_baseundefined").val($("#table4 tr:eq(" + len + ") td:eq(3)").text());
        $("#pier_baseundefined").val($("#table4 tr:eq(" + len + ") td:eq(4)").text());
        $("#foundation_erosionundefined").val($("#table4 tr:eq(" + len + ") td:eq(5)").text());
        $("#top_strutsundefined").val($("#table4 tr:eq(" + len + ") td:eq(6)").text());
        $("#supportundefined").val($("#table4 tr:eq(" + len + ") td:eq(7)").text());
        $("#always_repairsundefined").val($("#table4 tr:eq(" + len + ") td:eq(8)").text());
        $("#disposal_strategyundefined").val($("#table4 tr:eq(" + len + ") td:eq(9)").text());
        $("#next_date").val($("#table4 tr:eq(" + len + ") td:eq(10)").text());


        /*
         $('#chk_date').val("");
         $('#chk_type').val("");
         $('#brg_level').val("");
         $('#abutment_base').val("");
         $('#pier_base').val("");
         $('#foundation_erosion').val("");
         $('#top_struts').val("");
         $('#support').val("");
         $('#always_repairs').val("");
         $('#disposal_strategy').val("");
         $('#next_date').val("");
         */
    }
    
    function getManage_id(name, type) {
        var id = "";
        if (type == "hw") {
            for (var i = 0; i < hw.length; i++) {
                if (name == hw[i].highway_name) {
                    id = hw[i].highway_id;
                }
            }
        }
        else if (type == "org") {
            for (var i = 0; i < org.length; i++) {
                if (name == org[i].org_name) {
                    id = org[i].org_id;
                    zone_id_page = org[i].org_id.substring(0,5);
                    
                }
            }
        }
        else if (type == "zone") {
            for (var i = 0; i < zone.length; i++) {
                if (name == zone[i].zone_name) {
                	var zone_id = zone[i].zone_id.substring(0,5);
                	if(zone_id==zone_id_page){
                    id = zone[i].zone_id;
                	}
                }
            }
        } else if (type == "section") {
            for (var i = 0; i < section.length; i++) {
                if (name == section[i].section_name) {
                    id = section[i].section_id;
                }
            }
        }
        return id;
    }

    function new_nearly_eva() {
        setTimeout('clear_nearly()', 200);
        $("#tb4 tr:eq(2) td").each(function(){
        	var domId = $(this).find("select").attr("id");
        	var id = $(this).find("select").attr("data-id");
        	$("#"+domId).empty();
        	getOptionsByDataId(domId,id);
        });  
        $("#chk_type").combobox();
        $("#brg_level").combobox();
        $("#abutment_base").combobox();
        $("#pier_base").combobox();
        $("#foundation_erosion").combobox();
        $("#top_struts").combobox();
        $("#support").combobox();
        $("#always_repairs").combobox();
        $("#disposal_strategy").combobox();
        
        $('#tb4').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                "class": "btn btn-default",
                click: function () {
                    if ($("#chk_date").val() == "") {
                        errMessage("请输入检查年月!");
                        return false;
                    } else if ($("#next_date").val() == "") {
                        errMessage("请输入下次检查年份!");
                        return false;
                    }
                    $.ajax({
                        type: 'POST',
                        url: '../BrgCardServlet',
                        dataType: 'json',
                        data: {
                            type: "new_nearly",
                            chk_date: $('#chk_date').val(),
                            chk_type: $('#chk_typeundefined').val(),
                            brg_level: $('#brg_levelundefined').val(),
                            abutment_base: $('#abutment_baseundefined').val(),
                            pier_base: $('#pier_baseundefined').val(),
                            foundation_erosion: $('#foundation_erosionundefined').val(),
                            top_struts: $('#top_strutsundefined').val(),
                            support: $('#supportundefined').val(),
                            always_repairs: $('#always_repairsundefined').val(),
                            disposal_strategy: $('#disposal_strategyundefined').val(),
                            next_date: $('#next_date').val()
                        },
                        error: function (msg) {
                            errMessage("请求BrgCardServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("添加失败");
                                        break;
                                    case 2:
                                        errMessage("服务器错误");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                                removeTabel4();
                                initBrgCardEvaluation();
                                
                                $('#tb4').dialog("close");
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
                }]
        });
        $('#tb4').dialog({
            title: "新增数据"
        });
        $('#tb4').dialog("open");
    }

    function getOptionsByDataId(domId,id){
    	$.ajax({
    		 type: 'POST',
             url: '../BrgCardServlet',
             dataType: 'json',
             async:false,
             data: {
                 type: "getOptionsByDataId",
                 id:id
             },
             error: function (msg) {
                 errMessage("请求BrgCardServlet失败");
             },
             success: function (json) {
            	 var data = json.obj;
            	 if(data!=undefined){
            		 console.log(data);
                	 $("#"+domId).append("<option value='' selected='selected'>请选择</option>");
                	 for(var i=0;i<data.length;i++){
                		 $("#"+domId).append("<option value="+data[i].item_value+">"+data[i].item_value+"</option>");
                     }
            	 }
             }
    	});
    }
    
    function clear_bccp() {
        $("#start_date")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(0)").text());
        //$('#start_date').val("");
        $("#finish_date")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(1)").text());
        $("#type")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(2)").text());
        $("#reason")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(3)").text());
        $("#scope")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(4)").text());
        $("#cost")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(5)").text());
        $("#cost_source")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(6)").text());
        $("#evaluate_level")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(7)").text());
        $("#build_org")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(8)").text());
        $("#design_org")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                    + ") td:eq(9)").text());
        $("#construct_org").val(
            $(
                "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                + ") td:eq(10)").text());
        $("#supervise_org").val(
            $(
                "#table5 tr:eq(" + (parseInt(table5_size) + 1)
                + ") td:eq(11)").text());
        $("#memo")
            .val(
                $(
                    "#table5 tr:eq(" + (parseInt(table5_size) + 2)
                    + ") td:eq(1)").text());

    }

    function newbccp() {
        clear_bccp();
        $('#tb5').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                "class": "btn btn-default",
                click: function () {
                    if ($("#start_date").val() == "") {
                        errMessage("请输入开工时间!");
                        return false;
                    } else if ($("#finish_date").val() == "") {
                        errMessage("请输入竣工时间!");
                        return false;
                    }

                    $.ajax({
                        type: 'POST',
                        url: '../BrgCardServlet',
                        dataType: 'json',
                        data: {
                            type: "newbccp",
                            start_date: $('#start_date').val(),
                            finish_date: $('#finish_date').val(),
                            type1: $('#type').val(),
                            reason: $('#reason').val(),
                            scope: $('#scope').val(),
                            cost: $('#cost').val(),
                            cost_source: $('#cost_source').val(),
                            evaluate_level: $('#evaluate_level').val(),
                            build_org: $('#build_org').val(),
                            design_org: $('#design_org').val(),
                            construct_org: $('#construct_org').val(),
                            supervise_org: $('#supervise_org').val(),
                            memo: $('#memo').val()
                        },
                        error: function (msg) {
                            errMessage("请求BrgCardServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("添加失败");
                                        break;
                                    case 2:
                                        errMessage("服务器错误");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                                //successMessage("添加成功");
                                removeTabel5();
                                initBrgCardConstructPrj();
                                $('#tb5').dialog("close");
                            }
                        }
                    });
                }
            }, {
                html: "<i class='fa fa-times'></i>&nbsp; 取消",
                "class": "btn btn-default",
                click: function () {
                    $(this).dialog("close");
                }
            }]
        });
        $('#tb5').dialog({
            title: "新增数据"
        });
        $('#tb5').dialog("open");
    }
    /*删除最近评定数据*/
    function del_nearly_eva(r_id, i) {
        $.SmartMessageBox({
            title: "删除最近评定数据",
            content: "您是否确认删除？",
            buttons: '[取消]&nbsp;[确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../BrgCardServlet',
                    dataType: 'json',
                    data: {
                        type: "delete_nearly",
                        r_id: r_id
                    },
                    error: function (msg) {
                        errMessage("删除最近评定数据失败！");
                    },
                    success: function (json) {
                        if (json.success == "success") {
                            removeTabel4();
                            initBrgCardEvaluation();
                        } else {
                            errMessage("删除最近评定数据失败！");
                        }
                    }
                });
            }
        });
    }
    function initStrcuctS() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "TableBridge2",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {
                if (json.success == "fail") {
                    successMessage("结构技术数据没有数据");
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        var brg_top_len = data[i].brgCardTopStruct.length;
                        top_len = data[i].brgCardTopStruct.length;
                        if (top_len < 1) {
                            top_len = 1;
                        }
                        var brg_down_len = data[i].brgCardDownStruct.length;
                        down_len = data[i].brgCardDownStruct.length;
                        if (down_len < 1) {
                            down_len = 1;
                        }
                        var tb2 = $("#tb22");
                        tb2.append("<tr><th style='width:35px'>21</th><td colspan='2' ><label>桥长(m)</label><font style='color: red'>*</font>"
                            + "</td><td><input class='form-control' id='bridge_len' value='' placeholder='' type='text'>"
                            + "</td><th style='width:65px'>22</th><td><label>桥面总宽(m)</label></td><td  colspan='2'><input class='form-control' id='bridge_width' value=''"
                            + "placeholder='' type='text'></td><th style='width:85px' >23</th><td><label>车行道宽(m)</label></td><td colspan='3'><input class='form-control' id='lane_width' value=''"
                            + "placeholder='' type='text'></td></tr>");
                        tb2.append("<tr><th>24</th><td colspan='2'><label>桥面标高(m)</label></td><td><input class='form-control' id='bridge_t_s_height'"
                            + "value='' placeholder='' type='text'></td><th>25</th><td><label>桥下净高(m)</label></td><td colspan='2'><input class='form-control' id='bridge_b_height'"
                            + "value='' placeholder='' type='text'></td><th>26</th><td><label>桥上净高(m)</label></td>"
                            + "<td colspan='3'><input class='form-control' id='bridge_t_height' value=''  type='text'></td>"
                            + "</tr>");
                        tb2.append("<tr><th>27</th>"
                            + "<td colspan='2'><label>引道总宽(m)</label></td>"
                            + "<td><input class='form-control' id='approach_total_width' value=''  type='text'></td>"
                            + "<th>28</th>"
                            + "<td><label>引道路面宽(m)</label></td>"
                            + "<td colspan='2'><input class='form-control' id='approach_width'  value='' ' type='text'></td>"
                            + "<th>29</th>"
                            + "<td><label>引道线形</label></td>"
                            + "<td colspan='3'><select class='combobox form-control' id='approach_line_type'><option value='' selected='selected'>请选择</option></select></td>"
                            + "</tr>");
                        if (brg_top_len == 0) {
                            tb2.append("<tr id='" + "topStruct" + parseInt(j + 1) + "'><th>30</th><th style='width:70px'>上部结构</th><td style='width:50px'><label>跨号1</label></td>"
                                + "<td style='width: 150px'><input class='form-control' id='top_struct_hole_no1' type='text'></td>"
                                + "<td>桥型1<font style='color: red'>*</font></td>"
                                + "<td style='width: 175px'><select class='select2 form-control' style='width:100%' id='top_struct_type1'><option value='' selected='selected'>请选择</option></select></td>"
                                + "<td style='width: 80px'><label>跨径1(m)</label><font style='color: red'>*</font></td>"
                                + "<td style='width: 160px'><input class='form-control' id='top_struct_span1'  type='text'></td>"
                                + "<td><label>材料1</label></td>"
                                + "<td colspan='3' style='width: 170px'><select class='select2 form-control' style='width:100%' id='top_struct_stuff1'><option value='' selected='selected'>请选择</option></select></td>"
                                + "</tr>");
                        } else {
                            for (var j = 0; j < brg_top_len; j++) {
                                if (j == 0) {
                                    tb2.append("<tr  id='" + "topStruct" + parseInt(j + 1) + "' value='" + data[i].brgCardTopStruct[j].top_struct_id + "'><th  rowspan='" + brg_top_len + "'>30</th><th rowspan='" + brg_top_len + "' style='width:50px'>上部结构</th><td style='width:50px'><label>跨号" + parseInt(i + 1) + "</label></td>"
                                        + "<td style='width: 160px'><input class='form-control' id='top_struct_hole_no" + parseInt(j + 1) + "' type='text' disabled='true'></td>"
                                        + "<td style='width:80px'>桥型" + parseInt(j + 1) + "<font style='color: red'>*</font></td>"
                                        + "<td style='width:215px'><select class='select2 form-control' disabled='true' style='width:100%' id='top_struct_type" + parseInt(j + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "<td style='width: 80px'><label>跨径" + parseInt(j + 1) + "(m)</label><font style='color: red'>*</font></td>"
                                        + "<td style='width: 160px'><input class='form-control' id='top_struct_span" + parseInt(j + 1) + "' disabled='true'  type='text'></td>"
                                        + "<td><label>材料" + parseInt(j + 1) + "</label></td>"
                                        + "<td colspan='3' style='width: 170px'><select class='select2 form-control' disabled='true' style='width:100%' id='top_struct_stuff" + parseInt(j + 1) + "'><option value='' selected='selected'>请选择</option></select></td><td style='width:30px'></td>"
                                        + "</tr>");
                                } else {
                                    tb2.append("<tr id='" + "topStruct" + parseInt(j + 1) + "' value='" + data[i].brgCardTopStruct[j].top_struct_id + "'><td ><label>跨号" + parseInt(j + 1) + "</label></td>"
                                        + "<td style='width: 150px'><input class='form-control' disabled='true' id='top_struct_hole_no" + parseInt(j + 1) + "' type='text'></td>"
                                        + "<td>桥型" + parseInt(j + 1) + "<font style='color: red'>*</font></td>"
                                        + "<td  style='width:175px'><select class='select2 form-control' disabled='true' style='width:100%' id='top_struct_type" + parseInt(j + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "<td style='width: 80px'><label>跨径" + parseInt(j + 1) + "(m)</label><font style='color: red'>*</font></td>"
                                        + "<td style='width: 160px'><input class='form-control' disabled='true' id='top_struct_span" + parseInt(j + 1) + "'  type='text'></td>"
                                        + "<td><label>材料" + parseInt(j + 1) + "</label></td>"
                                        + "<td colspan='3' style='width: 170px'><select class='select2 form-control' disabled='true' style='width:100%' id='top_struct_stuff" + parseInt(j + 1) + "'><option value='' selected='selected'>请选择</option></select></td><td style='width:30px'></td>"
                                        + "</tr>");
                                }
                            }
                        }
                        if (brg_down_len == 0) {
                            tb2.append("<tr id='" + "downStruct" + parseInt(k + 1) + "' ><th>31</th><th>下部结构</th><td><label>墩台号" + parseInt(i + 1) + "</label></td>"
                                + "<td><input class='form-control' disabled='true' id='down_struct_pier" + parseInt(i + 1) + "' type='text'></td>"
                                + "<td>墩台形式" + parseInt(i + 1) + "<font style='color: red'>*</font></td>"
                                + "<td><select class='select2 form-control' disabled='true' style='width:100%' id='down_struct_type" + parseInt(i + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                + "	<td style='width: 60px'><label>材料" + parseInt(i + 1) + "</label><font style='color: red'>*</font></td>"
                                + "<td><select class='select2 form-control' disabled='true' style='width:100%' id='down_struct_stuff" + parseInt(i + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                + "<td><label>基础形式" + parseInt(i + 1) + "</label></td>"
                                + "<td><select class='select2 form-control' style='width:100%' id='down_struct_base_type" + parseInt(i + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                + "<td><label>涉水" + parseInt(k + 1) + "</label></td>"
                                + "<td><input type='checkbox' disabled='true' id='is_wade"+ parseInt(k + 1) +"'></td>"
                                + "</tr>");
                        } else {
                            for (var k = 0; k < brg_down_len; k++) {
                                if (k == 0) {
                                    tb2.append("<tr id='" + "downStruct" + parseInt(k + 1) + "' value='" + data[i].brgCardDownStruct[k].down_struct_id + "'><th rowspan='" + brg_down_len + "'>31</th><th rowspan='" + brg_down_len + "'>下部结构</th><td><label>墩台号" + parseInt(k + 1) + "</label></td>"
                                        + "<td><input class='form-control' id='down_struct_pier" + parseInt(k + 1) + "' type='text'></td>"
                                        + "<td>墩台形式" + parseInt(k + 1) + "<font style='color: red'>*</font></td>"
                                        + "<td><select class='select2 form-control' style='width:100%' id='down_struct_type" + parseInt(k + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "	<td style='width: 60px'><label>材料" + parseInt(k + 1) + "</label><font style='color: red'>*</font></td>"
                                        + "<td><select class='select2 form-control' style='width:100%' id='down_struct_stuff" + parseInt(k + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "<td><label>基础形式" + parseInt(k + 1) + "</label></td>"
                                        + "<td style='width: 150px'><select class='select2 form-control' style='width:100%' id='down_struct_base_type" + parseInt(k + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "<td style='width: 50px'><label>涉水" + parseInt(k + 1) + "</label></td>"
                                        + "<td style='width: 50px'><input type='checkbox' id='is_wade"+ parseInt(k + 1) +"'></td>"
                                        +"<td></td>"
                                        + "</tr>");
                                    if(data[i].brgCardDownStruct[k].is_wade=='true'){
                                    	$('#is_wade'+ parseInt(k + 1)).prop('checked','checked');
                                    }else{
                                    	$('#is_wade'+ parseInt(k + 1)).removeAttr('checked');
                                    }
                                    
                                } else {
                                	console.log(data[i].brgCardDownStruct[k])
                                    tb2.append("<tr id='" + "downStruct" + parseInt(k + 1) + "' value='" + data[i].brgCardDownStruct[k].down_struct_id + "'><td><label>墩台号" + parseInt(k + 1) + "</label></td>"
                                        + "<td><input class='form-control' id='down_struct_pier" + parseInt(k + 1) + "' type='text'></td>"
                                        + "<td>墩台形式" + parseInt(k + 1) + "<font style='color: red'>*</font></td>"
                                        + "<td><select class='select2 form-control' style='width:100%' id='down_struct_type" + parseInt(k + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "<td style='width: 60px'><label>材料" + parseInt(k + 1) + "</label><font style='color: red'>*</font></td>"
                                        + "<td><select class='select2 form-control' style='width:100%' id='down_struct_stuff" + parseInt(k + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "<td><label>基础形式" + parseInt(k + 1) + "</label></td>"
                                        + "<td><select class='select2 form-control' style='width:100%' id='down_struct_base_type" + parseInt(k + 1) + "'><option value='' selected='selected'>请选择</option></select></td>"
                                        + "<td><label>涉水" + parseInt(k + 1) + "</label></td>"
                                        + "<td><input type='text'  id='is_wade"+ parseInt(k + 1) +"'></td>"
                                        +"<td></td>"
                                        + "</tr>");
                                	   if(data[i].brgCardDownStruct[k].is_wade=='true'){
                                       	$('#is_wade'+ parseInt(k + 1)).prop('checked','checked');
                                       }else{
                                       	$('#is_wade'+ parseInt(k + 1)).removeAttr('checked');
                                       }
                                }
                            }
                        }
                        tb2.append("<tr><th>32</th>"
                            + "<td colspan='2'><label>伸缩缝类型</label></td>"
                            + "<td><select class='combobox form-control' id='expansion_joint_type'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>33</th><td><label>支座类型</label></td>"
                            + "<td style='width: 150px' colspan='2'><select class='combobox form-control' id='support_type'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>34</th><td style='width: 60px'><label>地震动峰值加速度系数</label></td>"
                            + "<td colspan='3'><select class='combobox form-control' id='acceleration_factor'><option value='' selected='selected'>请选择</option></select></td>"
                            + "</tr>");
                        tb2.append("<tr><th>35</th>"
                            + "<td colspan='2'><label>桥台护坡</label></td>"
                            + "<td><select class='combobox form-control' id='abutment_slope'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>36</th><td><label>护墩体</label></td>"
                            + "<td colspan='2'><select class='combobox form-control' id='guard_pier_body'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>37</th><td><label>调治构造物</label></td>"
                            + "<td colspan='3'><select class='combobox form-control' id='treatment_struct'><option value='' selected='selected'>请选择</option></select></td>"
                            + "</tr>");
                        tb2.append("<tr><th>38</th>"
                            + "<td colspan='2'><label>常水位</label></td>"
                            + "<td><input class='form-control' id='water_level' value='' placeholder='' type='text'></td>"
                            + "<th>39</th><td><label>设计水位</label></td>"
                            + "<td colspan='2'><input class='form-control' id='design_level' value='' placeholder='' type='text'></td>"
                            + "<th>40</th><td><label>历史洪水位</label></td>"
                            + "<td colspan='3'><input class='form-control' id='his_flood_level' value='' placeholder='' type='text'></td>"
                            + "</tr>");
                        initSelect_rang_B(brg_top_len, brg_down_len);
                    }
                }
            },
        });
    }
    
    function initDirection() {
        $.ajax({
            type: 'POST',
            url: '../BrgMemberServlet',
            dataType: 'json',
            async:false,
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
                           $.cookie("direction","上行");
                           $.cookie("span_type","1");
                        }
                        if (data[i].direction == "下行") {
                        	 $.cookie("direction","下行");
                             $.cookie("span_type","1");
                        }
                        else if (data[i].direction == "无") {
                        	 $.cookie("direction","无");
                             $.cookie("span_type","2");
                        }
                    }
                }
            }
        });

    }
    //修改弹出框加载数据
    function reloadData() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "TableBridge2",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {
                if (json.success == "fail") {
                    successMessage("结构技术数据没有数据");
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        var brg_top_len = data[i].brgCardTopStruct.length;
                        top_len = data[i].brgCardTopStruct.length;
                        if (top_len < 1) {
                            top_len = 1;
                        }
                        var brg_down_len = data[i].brgCardDownStruct.length;
                        down_len = data[i].brgCardDownStruct.length;
                        if (down_len < 1) {
                            down_len = 1;
                        }
                        var tb2 = $("#tb22");
                        tb2.append("<tr><th style='width:35px'>21</th><td colspan='2'><label>桥长(m)</label><font style='color: red'>*</font>"
                            + "</td><td><input class='form-control' id='bridge_len' value='' placeholder='' type='text'>"
                            + "</td><th style='width:65px'>22</th><td><label>桥面总宽(m)</label></td><td><input class='form-control' id='bridge_width' value=''"
                            + "placeholder='' type='text'></td><th>23</th><td><label>车行道宽(m)</label></td><td colspan='2'><input class='form-control' id='lane_width' value=''"
                            + "placeholder='' type='text'></td></tr>");
                        tb2.append("<tr><th>24</th><td colspan='2'><label>桥面标高(m)</label></td><td><input class='form-control' id='bridge_t_s_height'"
                            + "value='' placeholder='' type='text'></td><th>25</th><td><label>桥下净高(m)</label></td><td><input class='form-control' id='bridge_b_height'"
                            + "value='' placeholder='' type='text'></td><th>26</th><td><label>桥上净高(m)</label></td>"
                            + "<td colspan='2'><input class='form-control' id='bridge_t_height' value=''  type='text'></td>"
                            + "</tr>");
                        tb2.append("<tr><th>27</th>"
                            + "<td colspan='2'><label>引道总宽(m)</label></td>"
                            + "<td><input class='form-control' id='approach_total_width' value=''  type='text'></td>"
                            + "<th>28</th>"
                            + "<td><label>引道路面宽(m)</label></td>"
                            + "<td><input class='form-control' id='approach_width'  value='' ' type='text'></td>"
                            + "<th>29</th>"
                            + "<td><label>引道线形</label></td>"
                            + "<td colspan='2'><select class='combobox form-control' id='approach_line_type'><option value='' selected='selected'>请选择</option></select></td>"
                            + "</tr>");
                        tb2.append("<tr><th>32</th>"
                            + "<td colspan='2'><label>伸缩缝类型</label></td>"
                            + "<td><select class='combobox form-control' id='expansion_joint_type'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>33</th><td><label>支座类型</label></td>"
                            + "<td style='width: 150px'><select class='combobox form-control' id='support_type'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>34</th><td style='width: 60px'><label>地震动峰值加速度系数</label></td>"
                            + "<td colspan='2'><select class='combobox form-control' id='acceleration_factor'><option value='' selected='selected'>请选择</option></select></td>"
                            + "</tr>");
                        tb2.append("<tr><th>35</th>"
                            + "<td colspan='2'><label>桥台护坡</label></td>"
                            + "<td><select class='combobox form-control' id='abutment_slope'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>36</th><td><label>护墩体</label></td>"
                            + "<td><select class='combobox form-control' id='guard_pier_body'><option value='' selected='selected'>请选择</option></select></td>"
                            + "<th>37</th><td><label>调治构造物</label></td>"
                            + "<td colspan='2'><select class='combobox form-control' id='treatment_struct'><option value='' selected='selected'>请选择</option></select></td>"
                            + "</tr>");
                        tb2.append("<tr><th>38</th>"
                            + "<td colspan='2'><label>常水位</label></td>"
                            + "<td><input class='form-control' id='water_level' value='' placeholder='' type='text'></td>"
                            + "<th>39</th><td><label>设计水位</label></td>"
                            + "<td><input class='form-control' id='design_level' value='' placeholder='' type='text'></td>"
                            + "<th>40</th><td><label>历史洪水位</label></td>"
                            + "<td colspan='2'><input class='form-control' id='his_flood_level' value='' placeholder='' type='text'></td>"
                            + "</tr>");
                        $('#table2').append("<tr><th>21</th><th colspan='2'>桥长(m)</th><td colspan='2'>"
                            + data[i].bridge_len
                            + "</td><th>22</th><th colspan='2'>桥面总宽(m)</th><td colspan='2'>"
                            + data[i].bridge_width
                            + "</td><th>23</th><th colspan='2'>车行道宽(m)</th><td>"
                            + data[i].lane_width
                            + "</td></tr>");
                        $('#table2').append("<tr><th>24</th><th colspan='2'>桥面标高(m)</th><td colspan='2'>"
                            + data[i].bridge_t_s_height
                            + "</td><th>25</th><th colspan='2'>桥下净高(m)</th><td colspan='2'>"
                            + data[i].bridge_b_height
                            + "</td><th>26</th><th colspan='2'>桥上净高(m)</th><td>"
                            + data[i].bridge_t_height
                            + "</td></tr>");
                        $('#table2').append("<tr><th>27</th><th colspan='2'>引道总宽(m)</th><td colspan='2'>"
                            + data[i].approach_total_width
                            + "</td><th>28</th><th colspan='2'>引道路面宽(m)</th><td colspan='2'>"
                            + data[i].approach_width
                            + "</td><th>29</th><th colspan='2'>引道线形</th><td>"
                            + data[i].approach_line_type
                            + "</td></tr>");
                        if (brg_top_len == 0) {
                            $('#table2').append("<tr id='topS' ><th>30</th><th>上部结构</th><th>跨号1</th><td colspan='2'></td><th>桥型1</th><td colspan='2'>"
                                + "</td><th>跨径1(m)</th><td colspan='2'>"
                                + "</td><th>材料1</th><td colspan='2'>"
                                + "</tr>");
                        } else {
                            for (var k = 0; k < brg_top_len; k++) {
                                if (k == 0) {
                                    $('#table2').append("<tr id='topS'><th rowspan='" + brg_top_len + "'>30</th><th rowspan='" + brg_top_len + "'>上部结构</th><th>跨号1</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_hole_no
                                        + "</td><th>桥型1</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_type
                                        + "</td><th>跨径1(m)</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_span
                                        + "</td><th>材料1</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_stuff
                                        + "</tr>");
                                } else {
                                    $('#table2').append("<tr><th>跨号" + parseInt(k + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_hole_no
                                        + "</td><th>桥型" + parseInt(k + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_type
                                        + "</td><th>跨径" + parseInt(k + 1) + "(m)</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_span
                                        + "</td><th>材料" + parseInt(k + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardTopStruct[k].top_struct_stuff
                                        + "</tr>");
                                }
                            }
                            ;
                        }
                        ;
                        if (brg_down_len == 0) {
                            $('#table2').append("<tr><th>31</th><th>下部结构</th><th>墩台号1</th><td colspan='2'></td><th>墩台形式1</th><td colspan='2'>"
                                + "</td><th>材料1</th><td colspan='2'>"
                                + "</td><th>基础形式1</th><td colspan='2'>"
                                + "</tr>");

                        } else {
                            for (var j = 0; j < brg_down_len; j++) {
                                if (j == 0) {
                                    $('#table2').append("<tr><th rowspan='" + brg_down_len + "'>31</th><th rowspan='"
                                        + brg_down_len + "'>下部结构</th><th>墩台号1</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_pier
                                        + "</td><th>墩台形式1</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_type
                                        + "</td><th>材料1</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_stuff
                                        + "</td><th>基础形式1</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_base_type
                                        + "</tr>");
                                } else {
                                    $('#table2').append("<tr><th>墩台号" + parseInt(j + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_pier
                                        + "</td><th>墩台形式" + parseInt(j + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_type
                                        + "</td><th>材料" + parseInt(j + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_stuff
                                        + "</td><th>基础形式" + parseInt(j + 1) + "</th><td colspan='2'>"
                                        + data[i].brgCardDownStruct[j].down_struct_base_type
                                        + "</tr>");
                                }
                            }
                            ;
                        }
                        ;
                        $('#table2').append("<tr><th>32</th><th colspan='2'>伸缩缝类型</th><td colspan='2'>"
                            + data[i].expansion_joint_type
                            + "</td><th>33</th><th colspan='2'>支座类型</th><td colspan='2'>"
                            + data[i].support_type
                            + "</td><th>34</th><th colspan='2'>地震动峰值加速度系数</th><td>"
                            + data[i].acceleration_factor
                            + "</td></tr>");
                        $('#table2').append("<tr><th>35</th><th colspan='2'>桥台护坡</th><td colspan='2'>"
                            + data[i].abutment_slope
                            + "</td><th>36</th><th colspan='2'>护墩体</th><td colspan='2'>"
                            + data[i].guard_pier_body
                            + "</td><th>37</th><th colspan='2'>调治构造物</th><td>"
                            + data[i].treatment_struct
                            + "</td></tr>");
                        $('#table2').append("<tr><th>38</th><th colspan='2'>常水位</th><td colspan='2'>"
                            + data[i].water_level
                            + "</td><th>39</th><th colspan='2'>设计水位</th><td colspan='2'>"
                            + data[i].design_level
                            + "</td><th>40</th><th colspan='2'>历史洪水位</th><td>"
                            + data[i].his_flood_level
                            + "</td></tr>");
                        $.ajax({
                            type: 'POST',
                            url: '../BrgCardServlet',
                            dataType: 'json',
                            data: {
                                type: "initB"
                            },
                            error: function (msg) {
                                errMessage("请求失败");
                            },
                            success: function (json) {
                                var arr = json.obj;
                                /*插入select选项*/
                                for (var i = 0; i < arr.length; i++) {

                                    /*引道线形*/
                                    if (arr[i].item_id == 24) {
                                        if (typeof (arr[i].item_value) != "undefined") {
                                            $('#approach_line_type').append(
                                                "<option value='" + arr[i].item_value + "' >"
                                                + arr[i].item_value + "</option>");
                                        } else {
                                            $('#approach_line_type').append(
                                                "<option value=''>请输入</option>");
                                        }
                                    }
                                    /*上部结构材料*/
                                    if (arr[i].item_id == 28) {
                                        if (typeof (arr[i].item_value) != "undefined") {

                                            for (var k = 1; k < top_len + 1; k++) {
                                                var query = "top_struct_stuff" + k;
                                                $("#" + query).append(
                                                    "<option value='" + arr[i].item_value + "' >"
                                                    + arr[i].item_value + "</option>");
                                            }
                                        }
                                    }

                                    /*下部结构形式*/
                                    if (arr[i].item_id == 30) {
                                        if (typeof (arr[i].item_value) != "undefined") {

                                            for (var k = 1; k < down_len + 1; k++) {
                                                var query = "down_struct_type" + k;
                                                $("#" + query).append(
                                                    "<option value='" + arr[i].item_value + "' >"
                                                    + arr[i].item_value + "</option>");
                                            }
                                        }
                                    }

                                    /*下部结构材料*/
                                    if (arr[i].item_id == 31) {
                                        if (typeof (arr[i].item_value) != "undefined") {

                                            for (var k = 1; k < down_len + 1; k++) {
                                                var query = "down_struct_stuff" + k;
                                                $("#" + query).append(
                                                    "<option value='" + arr[i].item_value + "' >"
                                                    + arr[i].item_value + "</option>");
                                            }
                                        }
                                    }

                                    /*下部结构基础形式*/
                                    if (arr[i].item_id == 32) {
                                        if (typeof (arr[i].item_value) != "undefined") {

                                            for (var k = 1; k < down_len + 1; k++) {
                                                var query = "down_struct_base_type" + k;
                                                $("#" + query).append(
                                                    "<option value='" + arr[i].item_value + "' >"
                                                    + arr[i].item_value + "</option>");
                                            }
                                        }
                                    }

                                    /*伸缩缝类型*/
                                    if (arr[i].item_id == 33) {
                                        if (typeof (arr[i].item_value) != "undefined") {
                                            $('#expansion_joint_type').append(
                                                "<option value='" + arr[i].item_value + "' >"
                                                + arr[i].item_value + "</option>");
                                        } else {
                                            $('#expansion_joint_type').append(
                                                "<option value=''>请输入</option>");
                                        }
                                    }
                                    /*支座类型*/
                                    if (arr[i].item_id == 34) {
                                        if (typeof (arr[i].item_value) != "undefined") {
                                            $('#support_type').append(
                                                "<option value='" + arr[i].item_value + "' >"
                                                + arr[i].item_value + "</option>");
                                        } else {
                                            $('#support_type').append(
                                                "<option value=''>请输入</option>");
                                        }
                                    }
                                    /*地震系数*/
                                    if (arr[i].item_id == 35) {
                                        if (typeof (arr[i].item_value) != "undefined") {
                                            $('#acceleration_factor').append(
                                                "<option value='" + arr[i].item_value + "' >"
                                                + arr[i].item_value + "</option>");
                                        } else {
                                            $('#acceleration_factor').append(
                                                "<option value=''>请输入</option>");
                                        }
                                    }
                                    /*桥台护坡*/
                                    if (arr[i].item_id == 36) {
                                        if (typeof (arr[i].item_value) != "undefined") {
                                            $('#abutment_slope').append(
                                                "<option value='" + arr[i].item_value + "' >"
                                                + arr[i].item_value + "</option>");
                                        } else {
                                            $('#abutment_slope').append(
                                                "<option value=''>请输入</option>");
                                        }
                                    }
                                    /*护墩体*/
                                    if (arr[i].item_id == 37) {
                                        if (typeof (arr[i].item_value) != "undefined") {
                                            $('#guard_pier_body').append(
                                                "<option value='" + arr[i].item_value + "' >"
                                                + arr[i].item_value + "</option>");
                                        } else {
                                            $('#guard_pier_body').append(
                                                "<option value=''>请输入</option>");
                                        }
                                    }
                                    /*调治构造物*/
                                    if (arr[i].item_id == 38) {
                                        if (typeof (arr[i].item_value) != "undefined") {
                                            $('#treatment_struct').append(
                                                "<option value='" + arr[i].item_value + "' >"
                                                + arr[i].item_value + "</option>");
                                        } else {
                                            $('#treatment_struct').append(
                                                "<option value=''>请输入</option>");
                                        }
                                    }

                                }
                                /*引道线形*/
                                $('#approach_line_type').combobox();

                                for (var k = 1; k < top_len + 1; k++) {
                                    var query = "top_struct_stuff" + k;
                                    $("#" + query).select2();

                                }

                                /*下部结构*/
                                for (var k = 1; k < down_len + 1; k++) {
                                    var query = "down_struct_type" + k;
                                    $("#" + query).select2();

                                }
                                for (var k = 1; k < down_len + 1; k++) {
                                    var query = "down_struct_stuff" + k;
                                    $("#" + query).select2();

                                }
                                for (var k = 1; k < down_len + 1; k++) {
                                    var query = "down_struct_base_type" + k;
                                    $("#" + query).select2();

                                }
                                /*伸缩缝类型*/
                                $('#expansion_joint_type').combobox();
                                /*支座类型*/
                                $('#support_type').combobox();
                                /*地震系数*/
                                $('#acceleration_factor').combobox();
                                /*桥台护坡*/
                                $('#abutment_slope').combobox();
                                /*护墩体*/
                                $('#guard_pier_body').combobox();
                                /*调治构造物*/
                                $('#treatment_struct').combobox();
                            }
                        });
                        $.ajax({
                            type: 'POST',
                            url: '../BrgCardServlet',
                            dataType: 'json',
                            data: {
                                type: "initTopStructType"
                            },
                            error: function (msg) {
                                errMessage("请求失败");
                            },
                            success: function (json) {
                                if (json.success = "success") {
                                    var arr = json.obj;
                                    /*上部结构形式*/
                                    for (var i = 0; i < arr.length; i++) {
                                        for (var k = 1; k < top_len + 1; k++) {
                                            var query = "top_struct_type" + k;
                                            $("#" + query).append(
                                                "<option value='" + arr[i].brg_type_name + "' >"
                                                + arr[i].brg_type_name + "</option>");
                                        }
                                    }
                                }
                                /*上部结构*/
                                for (var k = 1; k < top_len + 1; k++) {
                                    var query = "top_struct_type" + k;
                                    $("#" + query).select2();
                                }
                                tb2Data();
                            }
                        });

                    }
                }
            },
        });

    }


    function del_top(id) {
        $.SmartMessageBox({
            title: "删除上部结构数据",
            content: "您是否确认删除？",
            buttons: '[取消]&nbsp;[确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../BrgCardServlet',
                    dataType: 'json',
                    data: {
                        type: "delTop",
                        id: id
                    },
                    error: function (msg) {
                        errMessage("删除上部结构失败");
                    },
                    success: function (json) {
                        if (json.success == "success") {
                            removeTb22();
                            removeTable2();
                            reloadData();
                        }
                    }
                });
            }
        });
    }

    function del_down(id) {
        $.SmartMessageBox({
            title: "删除下部结构数据",
            content: "您是否确认删除？",
            buttons: '[取消]&nbsp;[确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../BrgCardServlet',
                    dataType: 'json',
                    data: {
                        type: "delDown",
                        id: id
                    },
                    error: function (msg) {
                        errMessage("删除下部结构失败");
                    },
                    success: function (json) {
                        if (json.success == "success") {
                            removeTb22();
                            removeTable2();
                            reloadData();
                        }
                    }
                });
            }
        });
    }

    /*修改最近评定数据*/
    function change_nearly_eva(r_id, i) {
    	setTimeout('clear_nearly()', 200);
        $("#tb4 tr:eq(2) td").each(function(){
        	var domId = $(this).find("select").attr("id");
        	var id = $(this).find("select").attr("data-id");
        	$("#"+domId).empty();
        	getOptionsByDataId(domId,id);
        });  
        $("#chk_date").val($("#table4 tr:eq(" + i + ") td:eq(0)").text());
        $("#chk_typeundefined").val($("#table4 tr:eq(" + i + ") td:eq(1)").text());
        $("#brg_levelundefined").val($("#table4 tr:eq(" + i + ") td:eq(2)").text());
        $("#abutment_baseundefined").val($("#table4 tr:eq(" + i + ") td:eq(3)").text());
        $("#pier_baseundefined").val($("#table4 tr:eq(" + i + ") td:eq(4)").text());
        $("#foundation_erosionundefined").val($("#table4 tr:eq(" + i + ") td:eq(5)").text());
        $("#top_strutsundefined").val($("#table4 tr:eq(" + i + ") td:eq(6)").text());
        $("#supportundefined").val($("#table4 tr:eq(" + i + ") td:eq(7)").text());
        $("#always_repairsundefined").val($("#table4 tr:eq(" + i + ") td:eq(8)").text());
        $("#disposal_strategyundefined").val($("#table4 tr:eq(" + i + ") td:eq(9)").text());
        $("#next_date").val($("#table4 tr:eq(" + i + ") td:eq(10)").text());
        $("#chk_type").combobox();
        $("#brg_level").combobox();
        $("#abutment_base").combobox();
        $("#pier_base").combobox();
        $("#foundation_erosion").combobox();
        $("#top_struts").combobox();
        $("#support").combobox();
        $("#always_repairs").combobox();
        $("#disposal_strategy").combobox();
        

        $('#tb4')
            .dialog(
                {
                    buttons: [
                        {
                            html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                            "class": "btn btn-default",
                            click: function () {
                            	
                            	
                                if ($("#chk_date").val() == "") {
                                    errMessage("请输入检查年月!");
                                    return false;
                                } else if ($("#next_date").val() == "") {
                                    errMessage("请输入下次检查年份!");
                                    return false;
                                }
                                $
                                    .ajax({
                                        type: 'POST',
                                        url: '../BrgCardServlet',
                                        dataType: 'json',
                                        data: {
                                            type: "change_nearly",
                                            inf: inf,
                                            id: r_id,
                                            chk_date: $(
                                                '#chk_date')
                                                .val(),
                                            chk_type: $(
                                                '#chk_typeundefined')
                                                .val(),
                                            brg_level: $(
                                                '#brg_levelundefined')
                                                .val(),
                                            abutment_base: $(
                                                '#abutment_baseundefined')
                                                .val(),
                                            pier_base: $(
                                                '#pier_baseundefined')
                                                .val(),
                                            foundation_erosion: $(
                                                '#foundation_erosionundefined')
                                                .val(),
                                            top_struts: $(
                                                '#top_strutsundefined')
                                                .val(),
                                            support: $(
                                                '#supportundefined')
                                                .val(),
                                            always_repairs: $(
                                                '#always_repairsundefined')
                                                .val(),
                                            disposal_strategy: $(
                                                '#disposal_strategyundefined')
                                                .val(),
                                            next_date: $(
                                                '#next_date')
                                                .val()
                                        },
                                        error: function (msg) {
                                            errMessage("请求BrgCardServlet失败");
                                        },
                                        success: function (json) {
                                            if (json.success == "fail") {
                                                switch (json.error) {
                                                    case 1:
                                                        errMessage("修改失败");
                                                        break;
                                                    case 2:
                                                        errMessage("服务器错误");
                                                        break;
                                                    default:
                                                        break;
                                                }
                                            } else {
                                                //successMessage("修改成功");
                                                var a = $(
                                                    "#table5")
                                                    .find(
                                                        "tr");
                                                var size = a.length;
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(0)")
                                                    .text(
                                                        $(
                                                            '#chk_date')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(1)")
                                                    .text(
                                                        $(
                                                            '#chk_type')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(2)")
                                                    .text(
                                                        $(
                                                            '#brg_level')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(3)")
                                                    .text(
                                                        $(
                                                            '#abutment_baseundefined')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(4)")
                                                    .text(
                                                        $(
                                                            '#pier_baseundefined')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(5)")
                                                    .text(
                                                        $(
                                                            '#foundation_erosionundefined')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(6)")
                                                    .text(
                                                        $(
                                                            '#top_strutsundefined')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(7)")
                                                    .text(
                                                        $(
                                                            '#supportundefined')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(8)")
                                                    .text(
                                                        $(
                                                            '#always_repairsundefined')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(9)")
                                                    .text(
                                                        $(
                                                            '#disposal_strategyundefined')
                                                            .val());
                                                $(
                                                    "#table4 tr:eq("
                                                    + i
                                                    + ") td:eq(10)")
                                                    .text(
                                                        $(
                                                            '#next_date')
                                                            .val());
                                                $('#tb4')
                                                    .dialog(
                                                        "close");
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
                        }]
                });
        $('#tb4').dialog({
            title: "新增数据"
            
        });
        $('#tb4').dialog("open");
    }

    function delbccp(r_id, i, size) {
        $.SmartMessageBox({
            title: "删除修建工程记录数据",
            content: "您是否确认删除？",
            buttons: '[取消]&nbsp;[确定]'
        }, function (ButtonPressed) {
            if (ButtonPressed === "确定") {
                $.ajax({
                    type: 'POST',
                    url: '../BrgCardServlet',
                    dataType: 'json',
                    data: {
                        type: "delbccp",
                        r_id: r_id
                    },
                    error: function (msg) {
                        errMessage("删除修建工程记录数据失败！");
                    },
                    success: function (json) {
                        if (json.success == "success") {
                            removeTabel5();
                            initBrgCardConstructPrj();
                        } else {
                            errMessage("删除修建工程记录数据失败！");
                        }
                    }
                });
            }
        });
    }

    function changebccp(id, i, size) {
        $("#start_date").val($("#table5 tr:eq(" + i + ") td:eq(0)").text());
        $("#finish_date").val($('#table5 tr:eq(' + i + ') td:eq(1)').text());
        $("#type").val($('#table5 tr:eq(' + i + ') td:eq(2)').text());
        $("#reason").val($('#table5 tr:eq(' + i + ') td:eq(3)').text());
        $("#scope").val($('#table5 tr:eq(' + i + ') td:eq(4)').text());
        $("#cost").val($('#table5 tr:eq(' + i + ') td:eq(5)').text());
        $("#cost_source").val($('#table5 tr:eq(' + i + ') td:eq(6)').text());
        $("#evaluate_level").val($('#table5 tr:eq(' + i + ') td:eq(7)').text());
        $("#build_org").val($('#table5 tr:eq(' + i + ') td:eq(8)').text());
        $("#design_org").val($('#table5 tr:eq(' + i + ') td:eq(9)').text());
        $("#construct_org").val($('#table5 tr:eq(' + i + ') td:eq(10)').text());
        $("#supervise_org").val($('#table5 tr:eq(' + i + ') td:eq(11)').text());
        $("#memo").val($('#table5 tr:eq(' + (parseInt(size) + 2) + ') td:eq(1)').text());
        $('#tb5')
            .dialog(
                {
                    buttons: [
                        {
                            html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                            "class": "btn btn-default",
                            click: function () {
                                if ($("#start_date").val() == "") {
                                    errMessage("请输入开工时间!");
                                    return false;
                                } else if ($("#finish_date").val() == "") {
                                    errMessage("请输入竣工时间!");
                                    return false;
                                }
                                $
                                    .ajax({
                                        type: 'POST',
                                        url: '../BrgCardServlet',
                                        dataType: 'json',
                                        data: {
                                            type: "changebccp",
                                            inf: inf,
                                            id: id,
                                            start_date: $(
                                                '#start_date')
                                                .val(),
                                            finish_date: $(
                                                '#finish_date')
                                                .val(),
                                            type1: $('#type')
                                                .val(),
                                            reason: $(
                                                '#reason')
                                                .val(),
                                            scope: $('#scope')
                                                .val(),
                                            cost: $('#cost')
                                                .val(),
                                            cost_source: $(
                                                '#cost_source')
                                                .val(),
                                            evaluate_level: $(
                                                '#evaluate_level')
                                                .val(),
                                            build_org: $(
                                                '#build_org')
                                                .val(),
                                            design_org: $(
                                                '#design_org')
                                                .val(),
                                            construct_org: $(
                                                '#construct_org')
                                                .val(),
                                            supervise_org: $(
                                                '#supervise_org')
                                                .val(),
                                            memo: $('#memo')
                                                .val()
                                        },
                                        error: function (msg) {
                                            errMessage("请求BrgCardServlet失败");
                                        },
                                        success: function (json) {
                                            if (json.success == "fail") {
                                                switch (json.error) {
                                                    case 1:
                                                        errMessage("修改失败");
                                                        break;
                                                    case 2:
                                                        errMessage("服务器错误");
                                                        break;
                                                    default:
                                                        break;
                                                }
                                            } else {
                                                //successMessage("修改成功");
                                                var a = $(
                                                    "#table5")
                                                    .find(
                                                        "tr");
                                                var size = a.length;

                                                $(
                                                    "#table5 tr:eq("
                                                    + i
                                                    + ") td:eq(0)")
                                                    .text(
                                                        $(
                                                            '#start_date')
                                                            .val());
                                                $(
                                                    "#table5 tr:eq("
                                                    + i
                                                    + ") td:eq(1)")
                                                    .text(
                                                        $(
                                                            '#finish_date')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(2)')
                                                    .text(
                                                        $(
                                                            '#type')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(3)')
                                                    .text(
                                                        $(
                                                            '#reason')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(4)')
                                                    .text(
                                                        $(
                                                            '#scope')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(5)')
                                                    .text(
                                                        $(
                                                            '#cost')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(6)')
                                                    .text(
                                                        $(
                                                            '#cost_source')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(7)')
                                                    .text(
                                                        $(
                                                            '#evaluate_level')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(8)')
                                                    .text(
                                                        $(
                                                            '#build_org')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(9)')
                                                    .text(
                                                        $(
                                                            '#design_org')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(10)')
                                                    .text(
                                                        $(
                                                            '#construct_org')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + i
                                                    + ') td:eq(11)')
                                                    .text(
                                                        $(
                                                            '#supervise_org')
                                                            .val());
                                                $(
                                                    '#table5 tr:eq('
                                                    + (parseInt(size) - 1)
                                                    + ') td:eq(1)')
                                                    .text(
                                                        $(
                                                            '#memo')
                                                            .val());
                                                $('#tb5')
                                                    .dialog(
                                                        "close");
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
                        }]
                });
        $('#tb5').dialog({
            title: "新增数据",
            open:function(event, ui){
                $(this).parent().focus();
            }//取消获取焦点
        });
        $('#tb5').dialog("open");
    }

    function rePDF() {
        //successMessage("正在生成PDF");
        showMask();
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "rePDF",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
                hidMask();
            },
            success: function (json) {
                if (json.success == "success") {
                    var arr = json.obj;
                    var path = arr[0].path;
                    if (getExplorer() == "Firefox") {
                        $("#pdf1").prop(
                            "src",
                            encodeURI("../PDFDownLoadServer?path="
                                + encodeURI(path)));
                    } else if (getExplorer() == "Chrome") {
                        var options = {
                            height: "600px",
                            pdfOpenParams: {
                                view: 'FitV',
                                page: '2'
                            }
                        };
                        PDFObject.embed(encodeURI("../PDFDownLoadServer?path="
                            + encodeURI(path)), "#pdf", options);
                    }
                    showDia();
                } else {
                    errMessage("PDF生成失败");
                }
                hidMask();
            }
        });
    }
    /**修改行政识别数据*/
    var zone_id_page ;
    function changebcai() {
        var edit_brg_type = $('#table1 tr:eq(6) td:eq(0)').text();
        if (edit_brg_type == "") {
            $('#edit_brg_type').val(null).trigger("change");
        }
        else {
            $('#edit_brg_type').val(edit_brg_type).trigger("change");
        }

        var highway_name = $('#table1 tr:eq(0) td:eq(1)').text();
        if (highway_name == "") {
            $('#roadline_name').val(null).trigger("change");
        }
        else {
            var id = getManage_id(highway_name, "hw");
            if (id == "") {
                $('#roadline_name').val(null).trigger("change");
            } else {
                $('#roadline_name').val(id).trigger("change");
            }
        }
        var maintain_org = $('#table1 tr:eq(4) td:eq(1)').text();
        if (maintain_org == "") {
            $('#maintain_org').val(null).trigger("change");
        }
        else {
            if (getManage_id(maintain_org, "org") == "") {
                $('#maintain_org').val(null).trigger("change");
            } else {
                $('#maintain_org').val(getManage_id(maintain_org, "org")).trigger("change");
            }

        }
        var zone_name = $('#table1 tr:eq(5) td:eq(1)').text();

        if (zone_name == "") {
            $('#edit_zone').empty();
            $('#edit_zone').val(null).trigger("change");
        }
        else {
            if (getManage_id(zone_name, "zone") == "") {
                $('#edit_zone').val(null).trigger("change");
            } else {
                init_Edit_zone_id(getManage_id(maintain_org, "org"), zone_name);
            }
        }
        var section_name = $('#table1 tr:eq(5) td:eq(0)').text();
        if (section_name == "") {
            $('#edit_section').val(null).trigger("change");
        }
        else {
            if (getManage_id(section_name, "section") == "") {
                $('#edit_section').val(null).trigger("change");
            } else {
                init_Edit_section_id(getManage_id(maintain_org, "org"), section_name);
            }
        }
        var highway_no = $('#table1 tr:eq(0) td:eq(0)').text();
        var highway_level = $('#table1 tr:eq(0) td:eq(2)').text();
        var bridge_no = $('#table1 tr:eq(1) td:eq(0)').text();
        var bridge_name = $('#table1 tr:eq(1) td:eq(1)').text();
        var bridge_pile_no = $('#table1 tr:eq(1) td:eq(2)').text();
        var function_type = $('#table1 tr:eq(2) td:eq(0)').text();
        var beneath_path_name = $('#table1 tr:eq(2) td:eq(1)').text();
        var beneath_path_pile_no = $('#table1 tr:eq(2) td:eq(2)').text();
        var design_load = $('#table1 tr:eq(3) td:eq(0)').text();
        var pass_load = $('#table1 tr:eq(3) td:eq(1)').text();
        var skew_slope = $('#table1 tr:eq(3) td:eq(2)').text();
        var deck_pavement = $('#table1 tr:eq(4) td:eq(0)').text();
        var build_year = $('#table1 tr:eq(4) td:eq(2)').text();
        var edit_span_built = $('#span_view').attr("data-sp");
        var edit_location = $('#table1 tr:eq(6) td:eq(1)').text();
        $("#roadline_no").val(highway_no);
        $("#roadline_level").val(highway_level);
        $("#bridge_no").val(bridge_no);
        $("#bridge_name").val(bridge_name);
        $("#bridge_pile_no").val(bridge_pile_no);
        $("#function_typeundefined").val(function_type);
        $("#beneath_path_name").val(beneath_path_name);
        $("#beneath_path_pile_no").val(beneath_path_pile_no);
        $("#design_loadundefined").val(design_load);
        $("#pass_loadundefined").val(pass_load);
        $("#skew_slope").val(skew_slope);
        $("#deck_pavementundefined").val(deck_pavement);
        $("#build_year").val(build_year);
        $("#edit_span_built").val(edit_span_built);
        $("#edit_location").val(edit_location);
        $('#tb1').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                "class": "btn btn-default",
                click: function () {
                    if ($("#bridge_pile_no").val() == "") {
                        errMessage("请输入桥位桩号!");
                        return false;
                    }
                    if ($("#edit_zone").val() == "") {
                        errMessage("请勾选分区!");
                        return false;
                    }
                    if ($("#build_year").val() == "") {
                        errMessage("请输入建成年月!");
                        return false;
                    }
                    if ($("#edit_location").val() == "") {
                    	errMessage("请选择经纬度!");
                        return false;
                    } else {
                        var location = $("#edit_location").val();
                        if (location.indexOf(",") != -1) {
                            var arr = location.split(",");
                            if (arr.length != 2) {
                                errMessage("桥梁经纬度格式错误!");
                                return false;
                            } else {
                                var patten = /^[0-9]+.?[0-9]*$/;
                                if (!patten.test(arr[0]) || !patten.test(arr[1])) {
                                    errMessage("桥梁经纬度格式错误!");
                                    return false;
                                }
                            }
                        } else {
                            errMessage("桥梁经纬度格式错误!");
                            return false;
                        }
                    }
                    $.ajax({
                        type: 'POST',
                        url: '../BrgCardServlet',
                        dataType: 'json',
                        data: {
                            type: "changebcai",
                            highway_id: $("#roadline_name").val(),
                            highway_name: $("#roadline_name").select2('data')[0].text,
                            bridge_no: $('#bridge_no').val(),
                            bridge_name: $('#bridge_name').val(),
                            bridge_pile_no: $('#bridge_pile_no').val(),
                            function_type: $('#function_typeundefined').val(),
                            beneath_path_name: $('#beneath_path_name').val(),
                            beneath_path_pile_no: $('#beneath_path_pile_no').val(),
                            design_load: $('#design_loadundefined').val(),
                            pass_load: $('#pass_loadundefined').val(),
                            skew_slope: $('#skew_slope').val(),
                            deck_pavement: $('#deck_pavementundefined').val(),
                            maintain_org: $('#maintain_org').val(),
                            org: $("#maintain_org").select2('data')[0].text,
                            build_year: $('#build_year').val(),
                            edit_section: $('#edit_section').val(),
                            section: $("#edit_section").select2('data')[0].text,
                            edit_zone: $('#edit_zone').val(),
                            edit_span_built: $('#edit_span_built').val(),
                            edit_brg_type: $('#edit_brg_type').val(),
                            edit_location: $('#edit_location').val()
                        },
                        error: function (msg) {
                            errMessage("请求BrgCardServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("修改失败");
                                        break;
                                    case 2:
                                        errMessage("服务器错误");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                                $('#table1 tr:eq(0) td:eq(0)').text($('#roadline_no').val());
                                $('#table1 tr:eq(0) td:eq(1)').text($('#roadline_name').select2("data")[0].text);
                                $('#table1 tr:eq(0) td:eq(2)').text($('#roadline_level').val());
                                $('#table1 tr:eq(1) td:eq(0)').text($('#bridge_no').val());
                                $('#table1 tr:eq(1) td:eq(1)').text($('#bridge_name').val());
                                $('#table1 tr:eq(1) td:eq(2)').text($('#bridge_pile_no').val());
                                $('#table1 tr:eq(2) td:eq(0)').text($('#function_typeundefined').val());
                                $('#table1 tr:eq(2) td:eq(1)').text($('#beneath_path_name').val());
                                $('#table1 tr:eq(2) td:eq(2)').text($('#beneath_path_pile_no').val());
                                $('#table1 tr:eq(3) td:eq(0)').text($('#design_loadundefined').val());
                                $('#table1 tr:eq(3) td:eq(1)').text($('#pass_loadundefined').val());
                                $('#table1 tr:eq(3) td:eq(2)').text($('#skew_slope').val());
                                $('#table1 tr:eq(4) td:eq(0)').text($('#deck_pavementundefined').val());
                                $('#table1 tr:eq(4) td:eq(1)').text($('#maintain_org').select2("data")[0].text);
                                $('#table1 tr:eq(4) td:eq(2)').text($('#build_year').val());
                                $('#table1 tr:eq(5) td:eq(0)').text($('#edit_section').select2("data")[0].text);
                                if ($('#edit_zone').select2("data")[0] != undefined) {
                                    $('#table1 tr:eq(5) td:eq(1)').text($('#edit_zone').select2("data")[0].text);
                                } else {
                                    $('#table1 tr:eq(5) td:eq(1)').text("");
                                }
                                if ($('#edit_span_built').val().length > 20) {
                                    $('#table1 tr:eq(5) td:eq(2)').html($('#edit_span_built').val().substring(0, 20) + "<a href='#' onclick='showdata()'> ...</a>");
                                    $('#span_view').attr("data-sp", $('#edit_span_built').val());
                                } else {
                                    $('#table1 tr:eq(5) td:eq(2)').html($('#edit_span_built').val());
                                    $('#span_view').attr("data-sp", $('#edit_span_built').val());
                                }


                                $('#table1 tr:eq(6) td:eq(0)').text($('#edit_brg_type').val());
                                $('#table1 tr:eq(6) td:eq(1)').text($('#edit_location').val());
                                changetips($('#bridge_name').val(), $('#edit_section').select2("data")[0].text, $('#bridge_no').val());
                                //changelinename($('#roadline_name').select2("data")[0].text);
                                //changezonename($('#edit_section').select2("data")[0].text);
                                $('#tb1').dialog("close");
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
                }]
        });
        $('#tb1').dialog({
            title: "修改行政识别数据"
        });
        $('#tb1').dialog("open");
    }

    function changelinename(line_name) {
        var tips = $("#qq").html();
        var arrs = tips.split("&gt;");
        arrs[0] = "当前结构 : " + line_name;
        tips = "";
        for (var i = 0; i < arrs.length; i++) {
            if (i == 0) {
                tips += arrs[i];
            } else {
                tips += "&gt;" + arrs[i];
            }
        }
        $("#qq").html(tips);
    }

    function changezonename(zone_name) {
        var tips = $("#qq").html();
        var arrs = tips.split("&gt;");
        arrs[1] = zone_name;
        tips = "";
        for (var i = 0; i < arrs.length; i++) {
            if (i == 0) {
                tips += arrs[i];
            } else {
                tips += " &gt; " + arrs[i];
            }
        }
        $("#qq").html(tips);
    }

    function changetips(bridge_name, line_name, bridge_no) {
        var tips = $("#qq").html();
        var cc = "<label";
        var arrs = tips.split(cc);
        var aa = "当前结构  : " + line_name + " &gt; " + bridge_no + "-" + bridge_name + " ";
        $("#qq").html(aa + cc + arrs[1]);
    }

    function tb2Data() {
        $("#bridge_len").val($('#table2 tr:eq(0) td:eq(0)').text());
        $("#bridge_width").val($('#table2 tr:eq(0) td:eq(1)').text());
        $("#lane_width").val($('#table2 tr:eq(0) td:eq(2)').text());
        $("#bridge_t_s_height").val($('#table2 tr:eq(1) td:eq(0)').text());
        $("#bridge_b_height").val($('#table2 tr:eq(1) td:eq(1)').text());
        $("#bridge_t_height").val($('#table2 tr:eq(1) td:eq(2)').text());
        $("#approach_total_width").val($('#table2 tr:eq(2) td:eq(0)').text());
        $("#approach_width").val($('#table2 tr:eq(2) td:eq(1)').text());
        $("#approach_line_typeundefined").val($('#table2 tr:eq(2) td:eq(2)').text());

        var a = "table2 tr:eq(" + parseInt(top_len + 3 + down_len) + ") td:eq(0)";
        $("#expansion_joint_typeundefined").val($("#" + a).text());

        var b = "table2 tr:eq(" + parseInt(top_len + 3 + down_len) + ") td:eq(1)";
        $("#support_typeundefined").val($("#" + b).text());

        var c = "table2 tr:eq(" + parseInt(top_len + 3 + down_len) + ") td:eq(2)";
        $("#acceleration_factorundefined").val($("#" + c).text());

        var d = "table2 tr:eq(" + parseInt(top_len + 4 + down_len) + ") td:eq(0)";
        $("#abutment_slopeundefined").val($("#" + d).text());

        var e = "table2 tr:eq(" + parseInt(top_len + 4 + down_len) + ") td:eq(1)";
        $("#guard_pier_bodyundefined").val($("#" + e).text());

        var f = "table2 tr:eq(" + parseInt(top_len + 4 + down_len) + ") td:eq(2)";
        $("#treatment_structundefined").val($("#" + f).text());

        var g = "table2 tr:eq(" + parseInt(top_len + 5 + down_len) + ") td:eq(0)";
        $("#water_level").val($("#" + g).text());

        var h = "table2 tr:eq(" + parseInt(top_len + 5 + down_len) + ") td:eq(1)";
        $("#design_level").val($("#" + h).text());

        var i = "table2 tr:eq(" + parseInt(top_len + 5 + down_len) + ") td:eq(2)";
        $("#his_flood_level").val($("#" + i).text());

        for (var i = 0; i < top_len; i++) {
            var top_struct_hole_no = "top_struct_hole_no" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3) + ") td:eq(0)";
            $("#" + top_struct_hole_no).val($("#" + a).text()).trigger("change");
        }
        for (var i = 0; i < top_len; i++) {
            var top_struct_type = "top_struct_type" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3) + ") td:eq(1)";
            $("#" + top_struct_type).val($("#" + a).text()).trigger("change");
        }
        for (var i = 0; i < top_len; i++) {
            var top_struct_span = "top_struct_span" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3) + ") td:eq(2)";
            $("#" + top_struct_span).val($("#" + a).text()).trigger("change");
        }
        for (var i = 0; i < top_len; i++) {
            var top_struct_stuff = "top_struct_stuff" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3) + ") td:eq(3)";
            $("#" + top_struct_stuff).val($("#" + a).text()).trigger("change");
        }

        for (var i = 0; i < down_len; i++) {
            var down_struct_pier = "down_struct_pier" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3 + top_len) + ") td:eq(0)";
            $("#" + down_struct_pier).val($("#" + a).text()).trigger("change");
        }
        for (var i = 0; i < down_len; i++) {
            var down_struct_type = "down_struct_type" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3 + top_len) + ") td:eq(1)";
            $("#" + down_struct_type).val($("#" + a).text()).trigger("change");
        }
        for (var i = 0; i < down_len; i++) {
            var down_struct_stuff = "down_struct_stuff" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3 + top_len) + ") td:eq(2)";
            $("#" + down_struct_stuff).val($("#" + a).text()).trigger("change");
        }
        for (var i = 0; i < down_len; i++) {
            var down_struct_base_type = "down_struct_base_type" + parseInt(i + 1);
            var a = "table2 tr:eq(" + parseInt(i + 3 + top_len) + ") td:eq(3)";
            $("#" + down_struct_base_type).val($("#" + a).text()).trigger("change");
        }
    }

    function changebcst() {
        tb2Data();
        $('#tb2').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                "class": "btn btn-default",
                click: function () {
                    if ($("#bridge_len").val() == "") {
                        errMessage("请输入桥长!");
                        return false;
                    }
                    $.ajax({
                        type: 'POST',
                        url: '../BrgCardServlet',
                        dataType: 'json',
                        data: {
                            type: "changebcst",
                            bridge_len: $('#bridge_len').val(),
                            bridge_width: $('#bridge_width').val(),
                            lane_width: $('#lane_width').val(),
                            bridge_t_s_height: $('#bridge_t_s_height').val(),
                            bridge_b_height: $('#bridge_b_height').val(),
                            bridge_t_height: $('#bridge_t_height').val(),
                            approach_total_width: $('#approach_total_width').val(),
                            approach_width: $('#approach_width').val(),
                            approach_line_type: $('#approach_line_typeundefined').val(),
                            expansion_joint_type: $('#expansion_joint_typeundefined').val(),
                            support_type: $('#support_typeundefined').val(),
                            acceleration_factor: $('#acceleration_factorundefined').val(),
                            abutment_slope: $('#abutment_slopeundefined').val(),
                            guard_pier_body: $('#guard_pier_bodyundefined').val(),
                            treatment_struct: $('#treatment_structundefined').val(),
                            water_level: $('#water_level').val(),
                            design_level: $('#design_level').val(),
                            his_flood_level: $('#his_flood_level').val(),
                        },
                        error: function (msg) {
                            errMessage("请求BrgCardServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("修改失败");
                                        break;
                                    case 2:
                                        errMessage("服务器错误");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                            	 removeTable2();
                                 removeTb22();
                                 reloadData();
                                 $('#tb2').dialog("close");
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
                }]
        });
        $('#tb2').dialog({
            title: "修改结构技术数据"
        });
        $('#tb2').dialog("open");
    }


    function changebcd() {
        var blueprint_state = $('#table3 tr:eq(0) td:eq(0)').text();
        var design_file_state = $('#table3 tr:eq(0) td:eq(1)').text();
        var construct_file_state = $('#table3 tr:eq(0) td:eq(2)').text();
        var complete_file_state = $('#table3 tr:eq(1) td:eq(0)').text();
        var acceptance_file_state = $('#table3 tr:eq(1) td:eq(1)').text();
        var administrate_file_state = $('#table3 tr:eq(1) td:eq(2)').text();
        var regular_report_state = $('#table3 tr:eq(2) td:eq(0)').text();
        var special_report_state = $('#table3 tr:eq(2) td:eq(1)').text();
        var history_maintain_state = $('#table3 tr:eq(2) td:eq(2)').text();
        var document_no = $('#table3 tr:eq(3) td:eq(0)').text();
        var document = $('#table3 tr:eq(3) td:eq(1)').text();
        var document_time = $('#table3 tr:eq(3) td:eq(2)').text();
        $("#blueprint_stateundefined").val(blueprint_state);
        $("#design_file_stateundefined").val(design_file_state);
        $("#construct_file_stateundefined").val(construct_file_state);
        $("#complete_file_stateundefined").val(complete_file_state);
        $("#acceptance_file_stateundefined").val(acceptance_file_state);
        $("#administrate_file_stateundefined").val(administrate_file_state);
        $("#regular_report_stateundefined").val(regular_report_state);
        $("#special_report_stateundefined").val(special_report_state);
        $("#history_maintain_stateundefined").val(history_maintain_state);
        $("#document_no").val(document_no);
        $("#document").val(document);
        $("#document_time").val(document_time);
        $('#tb3').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                "class": "btn btn-default",
                click: function () {
                    $.ajax({
                        type: 'POST',
                        url: '../BrgCardServlet',
                        dataType: 'json',
                        data: {
                            type: "changebcd",
                            blueprint_state: $('#blueprint_stateundefined').val(),
                            design_file_state: $('#design_file_stateundefined').val(),
                            construct_file_state: $('#construct_file_stateundefined').val(),
                            complete_file_state: $('#complete_file_stateundefined').val(),
                            acceptance_file_state: $('#acceptance_file_stateundefined').val(),
                            administrate_file_state: $('#administrate_file_stateundefined').val(),
                            regular_report_state: $('#regular_report_stateundefined').val(),
                            special_report_state: $('#special_report_stateundefined').val(),
                            history_maintain_state: $('#history_maintain_stateundefined').val(),
                            document_no: $('#document_no').val(),
                            document: $('#document').val(),
                            document_time: $('#document_time').val()
                        },
                        error: function (msg) {
                            errMessage("请求BrgCardServlet失败");
                        },
                        success: function (json) {
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("修改失败");
                                        break;
                                    case 2:
                                        errMessage("服务器错误");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                                //successMessage("修改成功");
                                $('#table3 tr:eq(0) td:eq(0)').text($('#blueprint_state').val());
                                $('#table3 tr:eq(0) td:eq(1)').text($('#design_file_state').val());
                                $('#table3 tr:eq(0) td:eq(2)').text($('#construct_file_state').val());
                                $('#table3 tr:eq(1) td:eq(0)').text($('#complete_file_state').val());
                                $('#table3 tr:eq(1) td:eq(1)').text($('#acceptance_file_state').val());
                                $('#table3 tr:eq(1) td:eq(2)').text($('#administrate_file_state').val());
                                $('#table3 tr:eq(2) td:eq(0)').text($('#regular_report_state').val());
                                $('#table3 tr:eq(2) td:eq(1)').text($('#special_report_state').val());
                                $('#table3 tr:eq(2) td:eq(2)').text($('#history_maintain_state').val());
                                $('#table3 tr:eq(3) td:eq(0)').text($('#document_no').val());
                                $('#table3 tr:eq(3) td:eq(1)').text($('#document').val());
                                $('#table3 tr:eq(3) td:eq(2)').text($('#document_time').val());
                                $('#tb3').dialog("close");
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
                }]
        });
        $('#tb3').dialog({
            title: "修改档案资料"
        });
        $('#tb3').dialog("open");
    }


    function removeTb22() {
        var tr = $("#tb22").find("tr");
        for (var i = 0; i < tr.length; i++) {
            tr[i].remove();
        }
    }

    function removeTable2() {
        var tr = $("#table2").find("tr");
        for (var i = 0; i < tr.length; i++) {
            tr[i].remove();
        }
    }

    function removeTabel5() {
        var tr = $("#table5").find("tr");
        for (var i = 2; i < tr.length; i++) {
            tr[i].remove();
        }
    }
    function removeTabel4() {
        var tr = $("#table4").find("tr");
        for (var i = 2; i < tr.length; i++) {
            tr[i].remove();
        }
    }
    /**最近评定数据*/
    function initBrgCardEvaluation() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initBrgCardEvaluation",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {
                if (json.success == "fail") {
                    //successMessage("最近技术状况评定没有数据");
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        $('#table4').append("<tr><td>" + data[i].check_ym + "</td><td>"
                            + data[i].eva_type + "</td><td>" + data[i].eva_level
                            + "</td><td>" + data[i].abutment + "</td><td>" + data[i].pier
                            + "</td><td>" + data[i].erosion + "</td><td>" + data[i].top_structure
                            + "</td><td>" + data[i].support + "</td><td>" + data[i].is_often_maintain
                            + "</td><td>" + data[i].treatment + "</td><td>" + data[i].next_time_year
                            + "</td><td><a class='btn btn-primary' id='" + data[i].r_id + "' onclick='change_nearly_eva(this.id,"
                            + (parseInt(i) + 2) + ")'>修改</a></td><td><a class='btn btn-primary' id='"
                            + data[i].r_id + "' onclick='del_nearly_eva(this.id," + (parseInt(i) + 2)
                            + ")'>删除</a></td> </tr>");
                    }
                    
                    
                }
            }
        });
    }

    function initBrgCardConstructPrj() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initBrgCardConstructPrj",
            },
            error: function (msg) {
                if (hyid == null) {
                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {
                if (json.success == "fail") {
                    //successMessage("修建工程记录没有数据");
                } else {
                    var data = json.obj[0];
                    var con_prj = json.obj[0].brgCardConstructPrj;
                    var memo = json.obj[0].brgCardConstructPrjMemo;
                    var size = con_prj.length;
                    table5_size = con_prj.length;
                    if (size != 0) {
                        for (var i = 0; i < con_prj.length; i++) {
                            $('#table5').append("<tr><td style='width:80px'>" + con_prj[i].start_date
                                + "</td><td style='width:80px'>" + con_prj[i].finish_date + "</td><td>"
                                + con_prj[i].type + "</td><td>" + con_prj[i].reason
                                + "</td><td>" + con_prj[i].scope + "</td><td>"
                                + con_prj[i].cost + "</td><td>" + con_prj[i].cost_source
                                + "</td><td>" + con_prj[i].evaluate_level + "</td><td>"
                                + con_prj[i].build_org + "</td><td>" + con_prj[i].design_org
                                + "</td><td>" + con_prj[i].construct_org + "</td><td>"
                                + con_prj[i].supervise_org + "</td><td><a class='btn btn-primary' id='"
                                + con_prj[i].r_id + "'onclick='changebccp(this.id," + (parseInt(i) + 2)
                                + "," + size + ")'>修改</a></td><td><a class='btn btn-primary' id='"
                                + con_prj[i].r_id + "'onclick='delbccp(this.id," + (parseInt(i) + 2)
                                + "," + size + ")'>删除</a></td></tr>");
                        }
                    }
                    if (memo.length == 0) {
                        $('#table5').append("<tr><td><b>备注：</b></td><td colspan='20'></td></tr>");
                    } else {
                        $('#table5').append("<tr><td><b>备注：</b></td><td colspan='20'>" + memo[0].memo + "</td></tr>");
                    }
                }
            }
        });
    }

    function initBrgPicture(hhhbs) {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initBrgPicture",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {

                if (json.success == "fail") {
                    //successMessage("桥梁照片没有数据");
                } else {
                    var data = json.obj;
                    for (var i = 0; i < data.length; i++) {
                        $('#table7')
                            .append(
                                "<tr><th>79</th><th>主管负责人</th><td>"
                                + data[i].charge_man
                                + "</td><th>80</th><th>填卡人</th><td>"
                                + data[i].fill_man
                                + "</td><th>81</th><th>填卡日期</th><td>"
                                + data[i].fill_date
                                + "</td></tr>");
                    }
                }
                initPhoto();
            }
        });
    }

    function initPhoto() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initPhoto",
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
            },
            success: function (json) {
                if (json.success == "success") {
                    var data = json.obj;
                    $('#table6').append("<tr><th>77</th><th>正面照</th><td colspan='3'><img id='img1' src='"
                        + encodeURI("../ImageDownLoadServer?path="
                            + data.face_path)
                        + "' width='450px' height='300px'></td><th>78</th><th>立面照</th><td colspan='3'><img id='img2' src='"
                        + encodeURI("../ImageDownLoadServer?path="
                            + data.facade_path)
                        + "' width='450px' height='300px'></td></tr>");
                } else {
                    $('#table6').append("<tr><th>77</th><th>正面照</th><td colspan='3'><img id='img1' src='"
                        + encodeURI("../ImageDownLoadServer?path="
                            + "nofile.jpg")
                        + "' width='450px' height='300px'></td><th>78</th><th>立面照</th><td colspan='3'><img id='img2' src='"
                        + encodeURI("../ImageDownLoadServer?path="
                            + "nofile.jpg")
                        + "' width='450px' height='300px'></td></tr>");
                }


            }
        });
    }

    function initPDF() {
        //	successMessage("正在生成PDF");
        showMask();
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "initPDF",
                inf: inf
            },
            error: function (msg) {
                if (hyid == null) {

                } else {
                    errMessage("请求BrgCardServlet失败");
                }
                hidMask();
            },
            success: function (json) {
                if (json.success == "filenotexists") {
                    errMessage("DPF文件不存在，请点击生成PDF");
                } else if (json.success == "fail") {
                    errMessage("DPF生成失败");
                } else {
                    var arr = json.obj;
                    var path = arr[0].path;
                    if (getExplorer() == "Firefox") {
                        $("#pdf1").prop(
                            "src",
                            encodeURI("../PDFDownLoadServer?path="
                                + encodeURI(path)));
                    } else if (getExplorer() == "Chrome") {
                        var options = {
                            height: "600px",
                            pdfOpenParams: {
                                view: 'FitV',
                                page: '2'
                            }
                        };
                        PDFObject.embed(encodeURI("../PDFDownLoadServer?path="
                            + encodeURI(path)), "#pdf", options);
                    }
                }
                hidMask();
            }
        });
    }

    function showdata() {
        $("#showspan_build").text($("#span_view").attr("data-sp"));
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

    function changeMan() {
        $("#charge_man").val($('#table7 tr:eq(0) td:eq(0)').text());
        $("#fill_manundefined").val($('#table7 tr:eq(0) td:eq(1)').text());
        $("#fill_date").val($('#table7 tr:eq(0) td:eq(2)').text());
    //    $("#zmz").val("");
    //    $("#lmz").val("");
        $('#tb7').dialog({
            buttons: [{
                html: "<i class='fa fa-plus'></i>&nbsp; 保存",
                "class": "btn btn-default",
                click: function () {
                    $.ajax({
                        type: 'POST',
                        url: '../BrgCardServlet',
                        dataType: 'json',
                        data: {
                            type: "changeMan",
                            charge_man: $('#charge_man').val(),
                            fill_man: $('#fill_man').val(),
                            fill_date: $('#fill_date').val()
                        },
                        error: function (msg) {
                            if (hyid == null) {
                            } else {
                                errMessage("请求BrgCardServlet失败");
                            }
                        },
                        success: function (json) {
                        //	initPhoto();
                            if (json.success == "fail") {
                                switch (json.error) {
                                    case 1:
                                        errMessage("修改失败");
                                        break;
                                    case 2:
                                        errMessage("服务器错误");
                                        break;
                                    default:
                                        break;
                                }
                            } else {
                                //successMessage("修改成功");
                                $('#table7 tr:eq(0) td:eq(0)').text($('#charge_man').val());
                                $('#table7 tr:eq(0) td:eq(1)').text($('#fill_manundefined').val());
                                $('#table7 tr:eq(0) td:eq(2)').text($('#fill_date').val());
                          //      var zmz = $("#zmz").val();
                          //      var lmz = $("#lmz").val();
                           //     if (zmz != "" && lmz == "") {
                           //         imageUpload_zmz();
                           //     }
                          //      if (lmz != "" && zmz == "") {
                           //         imageUpload_lmz();
                          //      }
                          //      if (lmz != "" && zmz != "") {
                          //          imageUpload_all();
                           //     }
                                $('#tb7').dialog("close");
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
                }]
        });
        $('#tb7').dialog({
            title: "修改数据"
        });
        $('#tb7').dialog("open");
    }

    $('#addStructs').dialog({
        autoOpen: false,
        width: 350,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        zIndex: 3999,
        stack: true,
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });

    $('#tb1').dialog({
        autoOpen: false,
        width: 1200,
        height: 490,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });
    $('#tb2').dialog({
        autoOpen: false,
        width: 1400,
        height: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });
    $('#tb3').dialog({
        autoOpen: false,
        width: 1100,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });
    $('#tb4').dialog({
        autoOpen: false,
        width:1300,
        zIndex:20,
        height:410,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });
    $('#tb5').dialog({
        autoOpen: false,
        width: 1100,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });
    $('#tb7').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });
    $('#new_brg').dialog({
        autoOpen: false,
        width: 800,
        height: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        dialogClass: "no-close",
        closeOnEscape: false,
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });
    $('#up').dialog({
        autoOpen: false,
        width: 600,
        resizable: false,
        modal: true,
        show: 'drop',
        hide: 'drop',
        open:function(event, ui){ 
        	$(this).parent().focus(); 
        	}//取消获取焦点 
    });


    function showDia() {
        /*桥梁*/
        $('#opera').dialog("open");
        $('#opera').dialog({
            title: "查看桥梁卡片PDF"
        });
    }
    function upload() {

        $('#up').dialog({
            title: "上传图片"
        });
        $('#up').dialog("open");
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

    function imageUpload_lmz() {
        var britype = "立面照";
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "select",
                britype: britype,
                hhhbs: hhhbs
            },
            error: function (msg) {
                errMessage("BrgCardServlet链接失败！");
            },
            success: function (json) {
                $.ajaxFileUpload({
                    url: '../BrgCardServlet?type=img',
                    secureuri: false,
                    fileElementId: 'lmz',
                    dataType: 'text',
                    success: function (data, status) {
                        $('#up').dialog("close");
                        $("#img1").prop("src", encodeURI("../ImageDownLoadServer?path="
                            + hhhbs
                            + "\\card\\"
                            + hhhbs
                            + "_lmz.jpg"
                            + "&a="
                            + Math.random()));
                        /*
                         $("#img2").prop("src",encodeURI("../ImageDownLoadServer?path=C:\\repository\\"
                         + hhhbs
                         + "\\card\\G2zmz.JPG"
                         + "&a="
                         + Math.random()));
                         */
                    },
                    error: function (data, status, e) {
                        errMessage("上传失败！");
                    }
                });
            }
        });
    }
    function imageUpload_zmz() {
        var britype = "正面照";
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "select",
                britype: britype,
                hhhbs: hhhbs
            },
            error: function (msg) {
                errMessage("BrgCardServlet链接失败！");
            },
            success: function (json) {
                $.ajaxFileUpload({
                    url: '../BrgCardServlet?type=img',
                    secureuri: false,
                    fileElementId: 'zmz',
                    dataType: 'text',
                    success: function (data, status) {
                        $('#up').dialog("close");
                        /*
                         $("#img1").prop("src",encodeURI("../ImageDownLoadServer?path=C:\\repository\\"
                         + hhhbs
                         + "\\card\\G2ltz.jpg"
                         + "&a="
                         + Math.random()));
                         */
                        $("#img2").prop("src", encodeURI("../ImageDownLoadServer?path="
                            + hhhbs
                            + "\\card\\"
                            + hhhbs
                            + "_zmz.jpg"
                            + "&a="
                            + Math.random()));
                    },
                    error: function (data, status, e) {
                        errMessage("上传失败！");
                    }
                });
            }
        });
    }

    function imageUpload_all() {
        var britype = "立面照";
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "select",
                britype: britype,
                hhhbs: hhhbs
            },
            error: function (msg) {
                errMessage("BrgCardServlet链接失败！");
            },
            success: function (json) {
                $.ajaxFileUpload({
                    url: '../BrgCardServlet?type=img',
                    secureuri: false,
                    fileElementId: 'lmz',
                    dataType: 'text',
                    success: function (data, status) {
                        $('#up').dialog("close");
                        $("#img1")
                            .prop(
                                "src",
                                encodeURI("../ImageDownLoadServer?path="
                                    + hhhbs
                                    + "\\card\\"
                                    + hhhbs
                                    + "_lmz.jpg"
                                    + "&a="
                                    + Math.random()));
                        imageUpload_zmz();
                        /*
                         $("#img2").prop("src",encodeURI("../ImageDownLoadServer?path=C:\\repository\\"
                         + hhhbs
                         + "\\card\\G2zmz.JPG"
                         + "&a="
                         + Math.random()));
                         */
                    },
                    error: function (data, status, e) {
                        errMessage("上传失败！");
                    }
                });
            }
        });

    }


    function getBridge_id() {
        $.ajax({
            type: 'POST',
            url: '../BrgCardServlet',
            dataType: 'json',
            data: {
                type: "getBridge_id",
            },
            error: function (msg) {
                errMessage("BrgCardServlet链接失败！");
            },
            success: function (json) {
                if (json.success == "success") {
                    var bridge_id = json.obj;
                    initBrgPicture(bridge_id);
                }
            }
        });
    }

    function getUrlParam(key) {
        var search = decodeURIComponent(location.search);
        var reg = new RegExp(".*" + key + "\\=" + "([^&]*)(&?.*|)", "g");
        return search.replace(reg, "$1");
    }
</script>
<script type="text/javascript">

    function releaseAdmin() {//管理员
        var buttons = $('.widget-body-toolbar :button');
        for (var i = 0; i < buttons.length; i++) {
            //$('.widget-body-toolbar :button').eq(i).removeAttr('disabled');
            buttons[i].disabled = false;
        }
    }
    function releaseOrgAdmin() {//管养公司管理员
        var buttons = $('.widget-body-toolbar :button');
        for (var i = 0; i < buttons.length; i++) {
            //$('.widget-body-toolbar :button').eq(i).removeAttr('disabled');
            buttons[i].disabled = false;
        }
        role = "org";
    }
    function releaseManage() {//项目负责人

    }
    function releaseMember() {//项目参与人

    }
    function releaseGuest() {//普通用户

    }
    function releaseGuest(e){//普通用户
		if(e=="superAdmin"){
		  releaseOrgAdmin();
		}
	
	}
    
    function showMask() {
        $("#cover").show();
    }
    function hidMask() {
        $("#cover").css('display', 'none');
    }
</script>
</body>
</html>