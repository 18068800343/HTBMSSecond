<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.alibaba.fastjson.JSON"%>
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
    <link rel="stylesheet" href="../css/bootstrap-switch.css"
          type="text/css"></link>
<link rel="stylesheet" href="../jstree/themes/default/style.min.css" />
<!--@author xianing-->
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
		<!--  -->
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
	filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70 );
}

.cover {
	position: fixed;
	top: 0px;
	right: 0px;
	bottom: 0px;
	filter: alpha(opacity =     60);
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
	<%@ include file="header.jsp"%>
	<%@ include file="menu.jsp"%>

	<!-- #MAIN PANEL -->
	<div id="main" role="main">

		<!-- RIBBON -->
		<div id="ribbon">

			<span class="ribbon-button-alignment"> <span id="refresh"
				class="btn btn-ribbon" data-action="resetWidgets"
				data-title="refresh" data-placement="bottom"
				data-original-title="<i class='text-warning fa fa-warning'></i> 清除缓存"
				data-html="true"> <i class="fa fa-refresh"></i> </span> </span>

			<!-- breadcrumb -->
			<ol class="breadcrumb">
				<li>系统管理</li>
				<li>单位管理</li>
			</ol>
			<!-- end breadcrumb -->
		</div>
		<!-- END RIBBON -->
		<!-- #MAIN CONTENT -->
		<div id="content">

			<section id="widget-grid">
				<!-- widget grid -->
				<!-- row -->
				<div class="row">

					<!-- NEW WIDGET START -->

					<article class="col-sm-3 col-md-3 col-lg-3">

						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-0"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

							<header>
								<span class="widget-icon"> <i class="fa fa-sitemap"></i>
								</span>
								<h2>管养单位管理</h2>

							</header>

							<!-- widget div-->

							<div>

								<!-- widget edit box -->
								<div class="jarviswidget-editbox">
									<!-- This area used as dropdown edit box -->

								</div>

								<!-- widget content -->
									<div class="well col-sm-12 col-md-12 col-lg-12" style="height: 120px;" >
										<!-- <div style="position:absolute;top: 0px;left: 0px;"><font size="4px"><b>单位</b></font></div> -->
										<div class="col-sm-12 col-md-12 col-lg-12" style="position:absolute;top: 30px;">
											<select class=" pull-left select2 col-sm-12 col-md-12 col-lg-12" id="company" style="width:90%;">
											</select>
										</div>	
										<div  class="company col-sm-12 col-md-12 col-lg-12 " style="position:absolute;top: 80px;left: 18px;padding-right: 20px;padding-left: 0px;" id="companyStyle" >
										<a id="add_company" onclick="addCompany()" class="btn btn-primary  btn-xs disabled" > <i class="fa fa-plus" id="addz"> 增加单位</i> </a> &nbsp;&nbsp; 
										<a id="edit_company" onclick="editCompany()" class="btn btn-primary  btn-xs disabled" > <i class="fa fa-edit" id="delz"> 修改单位</i> </a> &nbsp;&nbsp; 
										<a  id="del_company" onclick="delCompany()" class="btn btn-primary  btn-xs disabled"> <i class="fa fa-minus"> 删除单位</i> </a>
										</div>
									</div>
									<!-- 
									<div class="widget-body-toolbar bg-color-white text-align-left">
										
									</div>
									 -->
									<div class="col-sm-12 col-md-12 col-lg-12 custom-scroll table-responsive well" style="height:450px; overflow-y: scroll;">
										<div class="col-sm-11 col-md-11 col-lg-11"  style="position:absolute;padding-left: 0px;padding-right:0px;">
										
											<div class="col-sm-12 col-md-12 col-lg-12" style="padding-left:0px;padding-right:0px;">
												<div class="zone" >
												<a  onclick="add_zone()" class="col-sm-3.7 col-md-3.7 col-lg-3.7 btn btn-primary  btn-xs disabled">  <i class="fa fa-plus" >增加分区</i> </a> &nbsp;&nbsp; 
												<a onclick="edit_zone()" class="btn btn-primary  btn-xs disabled"> <i class="fa fa-edit" > 修改分区</i></a> &nbsp;&nbsp;
												<a  onclick="del_zone()" class="btn btn-primary  btn-xs disabled"> <i class="fa fa-minus"> 删除分区</i></a>
												</div>
											</div>
											<div class="tree" style="padding-top: 15px;">
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
					<article class="col-xs-9 col-sm-9 col-md-9 col-lg-9"> 

						<!-- Widget ID (each widget will need unique ID)-->
						<div class="jarviswidget jarviswidget-color-darken" id="wid-id-1"
							data-widget-colorbutton="false" data-widget-editbutton="false"
							data-widget-togglebutton="false" data-widget-deletebutton="false"
							data-widget-fullscreenbutton="false"
							data-widget-custombutton="false">

						
							<header>
								<span class="widget-icon"> <i class="fa fa-user"></i> </span>
								<h2>人员管理</h2>

							</header>
								<!-- widget content -->
									<div class="col-sm-12 col-md-12 ">
										<div class="pull-left col-xs-3"   style="padding-bottom: 5px; padding-left: 5px;">
										 <input class="form-control" id="searchData" value="" placeholder="搜索" type="text"></div>
										<button class="btn btn-primary pull-right" onclick="addUserByCompany()">
											增加
										</button>
									</div>
									<table id="dt_basic" class="table table-striped table-bordered table-hover" >
										<thead>			                
											<tr>
												<th class="col-sm-1 col-md-1">序号</th>
												<th>账户</th>
												<th>密码</th>
												<th>角色</th>
												 <th>姓名</th>
												<th>QQ</th>
												<th>电话</th>
												<th>邮箱</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody id="share"></tbody>
									</table>
								</div>
								<!-- end widget content -->
			
							<!-- end widget div -->
			
						<!-- end widget -->
					
					
				
		<div id="opera" hidden="hidden">
			<form>
				<fieldset>
					<div class="form-group">
						<label>用户编号</label>
						<input class="form-control" id="domain_id" value="" placeholder="用户编号" type="text">
					</div>

					<div class="form-group">
						<label>账号</label>
						<input class="form-control" id="domain_name" value="" placeholder="账号" type="text">
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
		<div id="testingCompanyAddUser" hidden="hidden">
			<form>
				<fieldset>
				    <div class="form-group" hidden="hidden">
						<label>用户编号</label>
						<input class="form-control" id="tcauId" value="" placeholder="用户编号" type="text">
					</div>
					<div class="form-group">
						<label>账号</label><font style="color: red">*</font>
						<input class="form-control" id="tcauName" value="" placeholder="账号" type="text">
					</div>
					<div class="form-group">
						<label>密码</label><font style="color: red">*</font>
						<input class="form-control" id="tcauPass" value="" placeholder="密码" type="text">
					</div>
					<div id="cdiv" style="position:relative;width: 172;height: 50"  class="form-group">
						<label>角色</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="tcauRole" style="width:100%">   
	                    </select>  
	                </div>
	            <div class="form-group">
				     <label>姓名</label><font style="color: red">*</font>
					 <input class="form-control" id="add_usr_name" value="" placeholder="姓名" type="text">
				</div>
				<div class="form-group">
					<label>电话</label>
					 <input class="form-control" id="phone_no" value="" placeholder="电话" type="text" ">
				</div>
				<div class="form-group">
					<label>QQ</label>
					 <input class="form-control" id="qq_no" value="" placeholder="QQ" type="text" ">
				</div>
				<div class="form-group">
					<label>邮箱</label>
					 <input class="form-control" id="email_no" value="" placeholder="邮箱" type="text"">
				</div>
	                <label>签名图片</label>
	                	<div id="tcau_sign_img" hidden="hidden">
	                	<img id="preview_t" width="100" height="100">
	                	</div>
	                	<a href="javascript:;" class="file">上传签名图片
	               	 	<input id="tcau_sign_imgfile" class="file" name="tcau_sign_imgfile" type="file">
						</a>
	                <div>
	                </div>
				</fieldset>
			</form>
		</div>
		<div id="keepingCompanyAddUser" hidden="hidden">
			<form>
				<fieldset>
				    <div class="form-group" hidden="hidden">
						<label>用户编号</label>
						<input class="form-control" id="kcauId" value="" placeholder="用户编号" type="text">
					</div>
					<div class="form-group">
						<label>账号</label><font style="color: red">*</font>
						<input class="form-control" id="kcauName" value="" placeholder="账号" type="text">
					</div>
					<div class="form-group">
						<label>密码</label><font style="color: red">*</font>
						<input class="form-control" id="kcauPass" value="" placeholder="密码" type="text">
					</div>
					<!--@author xianing-->
				<div class="form-group">
				     <label>姓名</label><font style="color: red">*</font>
					 <input class="form-control" id="unit_name" value="" placeholder="姓名" type="text">
				</div>
				<div class="form-group">
					 <label>电话</label>
					 <input class="form-control" id="unit_phone_no" value="" placeholder="电话" type="text">
				</div>
				<div class="form-group">
					<label>QQ</label>
					 <input class="form-control" id="unit_qq_no" value="" placeholder="QQ" type="text">
				</div>
				<div class="form-group">
					<label>邮箱</label>
					 <input class="form-control" id="unit_email_no" value="" placeholder="邮箱" type="text">
				</div>
				   <!--end-->
					
					<div id="krdiv" style="position:relative;width: 172;height: 50"  class="form-group">
						<label>角色</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauRole" style="width:100%">
	                    <option value="orgAdmin">管养公司管理员</option>
	                     <option value="orgCharge">管养公司桥梁主管</option>
	                      <option value="orgDuty">管养公司桥梁分管</option> 
	                      <option value="orgEngineer">管养公司分区工程师</option> 
	                    </select>  
	                </div>
					<div id="kpdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden" >
						<label>部门</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauPart" style="width:100%">   
	                    </select>  
	                </div>
	                <div id="kzdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden">
						<label>分区</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauZone" style="width:100%">   
	                    </select>  
	                </div>
					<div id="kjdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden">
						<label>角色</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauJob" style="width:100%">   
	                    </select>  
	                </div>
	                <!--<div id="kperdiv" style="position:relative;width: 172;height: 50"  class="form-group" hidden="hidden">
						<label>姓名</label>
	                    <select class="form-control"  onchange="this.parentNode.nextSibling.value=this.value"  id="kcauPerson" style="width:100%">   
	                    </select>  
	                </div> -->
	                <label>签名图片</label>
	                	<div id="kcau_sign_img" hidden="hidden">
	                	<img id="preview_k" width="100" height="100">
	                	</div>
	                	<a href="javascript:;" class="file">上传签名图片
	               	 	<input id="kcau_sign_imgfile" class="file" name="kcau_sign_imgfile" type="file">
						</a>
	                <div>
	                </div>
				</fieldset>
			</form>
		</div>
<!-- end -->

						<!-- end widget -->

					</article>
					<!-- END GRID -->
				</div>
				<!-- end row -->
			</section>
			<!-- end widget grid -->
		</div>
		<!-- END #MAIN CONTENT -->
	</div>
	<!-- END #MAIN PANEL -->

	<div id="operaTest" hidden="hidden">
		<form id="operaForm">
			<fieldset>
				<div class="form-group">
					<label>管养单位名称</label><font style="color: red">*</font>
					 <input class="form-control" id="org_name_add" value="" placeholder="组织结构名称" type="text">
				</div>
				<div class="form-group">
					<label>管养单位简称</label><font style="color: red">*</font>
					 <input class="form-control" id="org_name_short" value="" placeholder="组织结构短名" type="text">
				</div>
				<label>下辖路段名称<font style="color: red">*</font><a title="添加数据" onclick="add_add_line(this)"><i title="添加数据" class="fa fa-plus pull-right"></i></a></label>
				<table class="table  table-striped" id="section_table">
				<tr><th>名称</th><th>操作</th></tr>
				<tr>
				<td>
				<input style="width: 100%" type="text" id="section_name" class="form-control">
				</td>
				<td>
				<a onclick="add_del_line(this)" >删除</a>
				</td>
				</tr>
				</table>
					<!--  <input class="form-control tagsinput" id="section_name"
						value="" placeholder="下辖路段名称" type="text" >-->
			</fieldset>
		</form>
	</div>

	<div id="org_edit" hidden="hidden">
		<form id="org_editForm">
			<fieldset>
				<div class="form-group">
					<label>管养单位名称</label><font style="color: red">*</font>
					 <input class="form-control" id="org_name_edit" value="" placeholder="组织结构名称" type="text">
				</div>
				<div class="form-group">
					<label>管养单位简称</label><font style="color: red">*</font>
					 <input class="form-control" id="org_name_short_edit" value="" placeholder="组织结构别名" type="text">
				</div>
				<div class="form-group">
					<label>工程技术部名称</label><font style="color: red">*</font>
					 <input class="form-control" id="tech_section_edit" value="" placeholder="工程技术部名称" type="text">
				</div>
				<div class="form-group">
					<label>下辖路段名称<font style="color: red">*</font><a title="添加数据" onclick="add_add_line_edit(this)"><i title="添加数据" class="fa fa-plus pull-right"></i></a></label>
				<table class="table  table-striped" id="section_table_edit">
				<tr><th>名称</th><th>操作</th></tr>
				<tr>
				<td>
				<input class="form-control" id="section_name_eidt"
						value="" placeholder="下辖路段名称" type="text" class="form-control"> 
				</td>
				<td>
				<a onclick="add_del_line_edit(this)" >删除</a>
				</td>
				</tr>
				</table>
					<!-- <input class="form-control" id="section_name_eidt"
						value="" placeholder="下辖路段名称" type="text"> -->
				</div>
			</fieldset>
		</form>
	</div>
	
	<div id="job_edit_part1" hidden="hidden">
		<form>
			<fieldset>
				<div class="form-group">
					<label>桥梁主管</label><font style="color: red">*</font>
					 <input class="form-control" id="job_charge_edit" value="" placeholder="桥梁主管" type="text">
				</div>
			</fieldset>
		</form>
	</div>
	
	<div id="job_edit_part2" hidden="hidden">
		<form>
			<fieldset>
				<div class="form-group">
					<label>负责人</label> <input class="form-control" id="job_duty_edit"
						value="" placeholder="负责人" type="text">
				</div>
				<div class="form-group">
					<label>工程师</label> <input class="form-control" id="job_engineer_edit"
						value="" placeholder="工程师" type="text">
				</div>
			</fieldset>
		</form>
	</div>
	
	<div id="add_zone" hidden="hidden">
		<form id="addZoneForm">
			<fieldset>
				<div class="form-group">
					<label>分区名称</label><font style="color: red">*</font>
					 <input class="form-control" id="zone_name" value="" placeholder="分区名称" type="text">
				</div>
				
			</fieldset>
		</form>
	</div>

	<div id="edit_zone" hidden="hidden">
		<form>
			<fieldset>
				<div class="form-group">
					<label>分区名称</label><font style="color: red">*</font>
					 <input class="form-control" id="zone_name_edit" value="" placeholder="分区名称" type="text">
				</div>
			</fieldset>
		</form>
	</div>
	
		
	<!-- <div id="add_usr" hidden="hidden">
		<form id="add_usrForm">
			<fieldset>
			@author xianing
			    <div class="form-group" hidden="hidden">
						<label>用户编号</label>
						<input class="form-control" id="kcauId" value="" placeholder="用户编号" type="text">
					</div>
					<div class="form-group">
						<label>用户名</label><font style="color: red">*</font>
						<input class="form-control" id="kcauName" value="" placeholder="用户名" type="text">
					</div>
					<div class="form-group">
						<label>密码</label><font style="color: red">*</font>
						<input class="form-control" id="kcauPass" value="" placeholder="密码" type="text">
					</div>
				<div class="form-group">
					<label>姓名</label><font style="color: red">*</font>
					 <input class="form-control" id="add_usr_name" value="" placeholder="名称" type="text">
				</div>
				<div class="form-group">
					<label>电话</label>
					 <input class="form-control" id="phone_no" value="" placeholder="电话" type="text" ">
				</div>
				<div class="form-group">
					<label>QQ</label>
					 <input class="form-control" id="qq_no" value="" placeholder="QQ" type="text" ">
				</div>
				<div class="form-group">
					<label>e-mail</label>
					 <input class="form-control" id="email_no" value="" placeholder="邮箱" type="text"">
				</div>
				<div class="form-group">
					<label>角色</label>
					 <select class="form-control select2" id="add_usr_position" style="width: 100%">
					 </select>
					 <input class="form-control" id="zone_no" value="" placeholder="邮箱" type="text">
				</div>
				 <label>签名图片</label>
	                	<div id="kcau_sign_img" hidden="hidden">
	                	<img id="preview_k" width="100" height="100">
	                	</div>
	                	<a href="javascript:;" class="file">上传签名图片
	               	 	<input id="kcau_sign_imgfile" class="file" name="kcau_sign_imgfile" type="file">
						</a>
			</fieldset>
		</form>
	</div>	 -->
	
	<div id="edit_usr" hidden="hidden">
		<form>
			<fieldset>
				<div class="form-group">
					<label>名称</label><font style="color: red">*</font>
					 <input class="form-control" id="edit_usr_name" value="" placeholder="名称" type="text">
				</div>
				<div class="form-group">
					<label>电话</label>
					 <input class="form-control" id="edit_phone" value="" placeholder="电话" type="text" >
				</div>
				<div class="form-group">
					<label>QQ</label>
					 <input class="form-control" id="edit_qq" value="" placeholder="QQ" type="text" >
				</div>
				<div class="form-group">
					<label>e-mail</label>
					 <input class="form-control" id="edit_e" value="" placeholder="邮箱" type="text" >
				</div>
				<div class="form-group">
					<label>角色</label>
					 <select class="form-control select2" id="edit_usr_position" style="width: 100%">
					 </select>
				</div>
			</fieldset>
		</form>
	</div>	
	
	<!-- <div id="add_count" hidden="hidden">
		<form>
				<fieldset>
				    <div class="form-group" hidden="hidden">
						<label>用户编号</label>
						<input class="form-control" id="kcauId" value="" placeholder="用户编号" type="text">
					</div>
					<div class="form-group">
						<label>账号</label><font style="color: red">*</font>
						<input class="form-control" id="kcauName" value="" placeholder="用户名" type="text">
					</div>
					<div class="form-group">
						<label>密码</label><font style="color: red">*</font>
						<input class="form-control" id="kcauPass" value="" placeholder="密码" type="text">
					</div>
					<div id="kjdiv" style="position:relative;width: 172;height: 50"  class="form-group" >
						<label>角色</label>
	                    <select class="form-control"   id="kcauJob" style="width:100%">   
	                    </select>  
	                </div>
	                    <label>签名图片</label>
	                	<div id="kcau_sign_img" >
	                	<img id="preview_k" width="100" height="100">
	                	</div>
	                	<a href="javascript:;" class="file">上传签名图片
	               	 	<input id="kcau_sign_imgfile" class="file" name="kcau_sign_imgfile" type="file">
						</a> 
	                <div>
	                </div>
				</fieldset>
			</form>
	</div>	 -->
	
	<div id="addChekPeople" hidden="hidden">
		<form>
			 <table id="checkPeopleTable"
					class="table table-striped table-bordered table-hover" style="width: 100%">
							<thead>
								    <tr>
										<th>是否添加</th>
										<th>人员姓名</th>
									</tr>
							</thead>
			    <tbody>

			    </tbody>
			</table>
			</form>
	</div>	
		
	<div id="cover" class="cover">
		<div id="loading" class="loading">处理中</div>
	</div>
	<%@ include file="footer.jsp"%>

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
	<script type="text/javascript"
        src="../js/bootstrap/bootstrap-switch.min.js"></script>
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
	<script
		src="../js/plugin/datatable-responsive/datatables.responsive.min.js"></script>

	<script src="../jstree/jstree.min.js"></script>
    <script src="../js/ajaxfileupload.js"></script>
	<script type="text/javascript">
	/**************************************定义全局变量*************************************************************/
		var $li1=undefined;/*上行标签*/
		var $lli=undefined;
		var $ul=$("#tree-ul");
		var $tree=$("#tree-ul");/*树形图父节点*/
		var $groundTree=$("#tree-ul-ground");/*树形图爷爷节点*/
		var $ll=undefined;/*被选定的方向节点*/
		var table=undefined;/**右边表格的节点*/
		var point=undefined;
		var sectionObject=undefined;
		var selectZoneID  = undefined;
		var selectZoneName = undefined;
		var maintainOrg_id = '<%=(String)request.getSession().getAttribute("orgid")%>';
		var role_control = undefined;
		var holeLength=undefined;
		$.fn.bootstrapSwitch.defaults.onColor = 'primary';
	    $.fn.bootstrapSwitch.defaults.offColor = 'danger';
	    $.fn.bootstrapSwitch.defaults.onText = '是';
	    $.fn.bootstrapSwitch.defaults.offText = '否';
	    $.fn.bootstrapSwitch.defaults.size = 'mini';
		$("#prj_build").bootstrapSwitch("disabled", true);
		$("#prj_build").on('switchChange.bootstrapSwitch', function (e, state) {
		var zone_id=selectZoneID;
	if(holeLength==undefined){
		errMessage("结构物尚未加载完毕请稍后");
		build_prj=0;
		$('#prj_build').bootstrapSwitch('state',false, true);
		
	}
	else if(holeLength==0){
		errMessage("该公司没有结构物，无法建立日常项目");
		build_prj=0;
		$('#prj_build').bootstrapSwitch('state',false, true);
	}		
		
			//判断是否有负责人和工程师
			else{
				$.ajax({
					type: 'POST',
					url: '../OrgManagerServlet',
					dataType: 'json',
					data: {
						zone_id:zone_id,
						type: "checkMember",
					},
					error : function(msg) {
						errMessage("请求checkMember失败");
				    },
					success : function(json) {
						if(json.success=='0'){
							var build_prj=-1;
							if(state){
								build_prj=1;
							}else{
								build_prj=0;
							}
							
					        setZoneBuild_prj(build_prj,zone_id);
						}else{
							errMessage(json.success);
							$('#prj_build').bootstrapSwitch('state',false, true);
						}
						
						}
							
						
						
				
	
					});
			}	
			
					
			//alert(state);
		/* 	var build_prj=-1;
			if(state){
				build_prj=1;
			}else{
				build_prj=0;
			}
			
	        setZoneBuild_prj(build_prj,zone_id); */
	});
							
		 $(document.body).css({
		   "overflow-x":"hidden",
		   "overflow-y":"hidden"
		 });
		
		
		
		
		//初始化方法
		$(document).ready(function() {
			pageSetUp();
			initTable();
			initCompanySelect();
			//initTree();
			//initMember_type();
			//querySpan();
			//getAllBridge();
			
		});
		/***********************************************弹窗div的初始化*************************************************/
		    $('#add_count').dialog({
			    autoOpen: false,
			    width : 600,
			    resizable : false,
			    modal : true
		     	});
			$('#opera').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
			
			$('#org_edit').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});
				
			$('#addChekPeople').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
			});
			
			$('#job_edit_part2').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});	
			$('#job_edit_part1').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});		
			$('#add_zone').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
				});	
			$('#edit_zone').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
			});		
			$('#add_usr').dialog({
				autoOpen: false,
				width : 400,
				height:600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
			});		
			
			$('#edit_usr').dialog({
				autoOpen: false,
				width : 600,
				resizable : false,
				modal : true,
				show :'drop',
				hide: 'drop'
			});			
			/*********************************************/
			//组织机构下拉框改变事件
			$('#company').on("select2:select", function (e) {
					$('#datatable_fixed_column').dataTable().fnClearTable();
					var company = e.params.data.id;
					$.ajax({
						type: 'POST',
						url: '../OrgManagerServlet',
						dataType: 'json',
						data: {
							org_id:company,
							type: "selectTech",
						},
						error : function(msg) {
							errMessage("加载公司技术部信息失败");
					    },
						success : function(json) {
							if(json.success=='success'){
								selectTechdata = json.obj;
								console.log(selectTechdata);
								$("#tree-ul li").remove();
								if(selectTechdata.length>0){
									queryPartment(company);
									initOrgTree(selectTechdata[0].tech_section_id,selectTechdata[0].tech_section);
									judgeHideOrshow(company);
									
									
							}else{
								judgeHideOrshow(company);
							}
							
							}
								
							
							
						}
							
						});
					
					
					
			});
			//标志位改变事件
			function setZoneBuild_prj(build_prj,zone_id){
				 $.ajax({
			  			type: 'POST',
			  			url: '../OrgManagerServlet',
			  			dataType: 'json',
			  			data: {
			  				build_prj:build_prj,
			  				zone_id:zone_id,
			  				type: "setZoneBuild_prj",
			  			},
			  			error : function(msg) {
			  				errMessage("请求setZoneBuild_prj失败");
			  		    },
			  			success : function(json) { 
			  				if(json.success=='success'){
			  					 successMessage("设置成功");
			  				}else{
			  					errMessage("设置失败");
			  				}
			  			 
                    
			  			
			  			
			  			
			  			}
			  				
			  			});
			}
			/**************下辖路段表格**********************************************/
			function deleteFirst(obj){
				var objt=$(obj).parent().prev().children();
				if($(objt).val()==''||$(objt).val()==null){
					errMessage('此行不可删除')
				}
				else{
					$(objt).val('');	
				}
			}
			function deleteFirstEdit(obj){
				var objt=$(obj).parent().prev().children();
				if($(objt).val()==''||$(objt).val()==null){
					errMessage('此行不可删除')
				}
				else{
					$(objt).val('');	
				}
			}
			function add_add_line(){
				var table = $("#section_table");
				var i=$("#section_table tr").length;
			
				table.append("<tr><td><input style='width: 100%' type='text' id='section_name"+i+"' class='form-control'></td>"
				+"<td><a onclick='add_del_line(this)' >删除</a></td></tr>");
			}
			function add_add_line_edit(){
				var table = $("#section_table_edit");
				var i=$("#section_table_edit tr").length;
			
				table.append("<tr><td><input style='width: 100%' type='text' id='section_name_edit"+i+"' class='form-control'></td>"
				+"<td><a onclick='add_del_line_edit(this)' >删除</a></td></tr>");	
			}
			function add_del_line(obj){
				var objt=$(obj).parent().prev().children();
				var len=$("#section_table tr").length;
				if(len==2){
					//alert(objt.val())
					if(objt.val()==null||objt.val()==''){
						errMessage("此行不可删除");
					}
					else{objt.val('');}
					return false;
				}
				var a = $(obj).parent().parent();
				a.remove();
				console.log(a);
				//将id重新赋值
			var lengthtable=$("#section_table tr").length;
				for(var i=1;i<lengthtable;i++){
					if(i==1){
						var tableTRinput="#"+"section_table tr:eq("+i+") td:eq(0)";
						var id="section_name";
		    			 $(tableTRinput).children().attr("id",id);
					}else{
						var tableTRinput="#"+"section_table tr:eq("+i+") td:eq(0)";
						var id="section_name"+i;
		    			 $(tableTRinput).children().attr("id",id);
					}
					
				}
			}	
			function add_del_line_edit(obj){
				var objt=$(obj).parent().prev().children();
				var len=$("#section_table_edit tr").length;
				if(len==2){
					if(objt.val()==null||objt.val()==''){
						errMessage("此行不可删除");
					}
					else{objt.val('');}
					return false;
				}
			
				
				//alert($(objt).attr("data-id"));
				if(typeof($(objt).attr("data-id"))=="undefined"){
					var a = $(obj).parent().parent();
					a.remove();
					console.log(a);
					//将id重新赋值
					var lengthtable=$("#section_table_edit tr").length;
						for(var i=1;i<lengthtable;i++){
							if(i==1){
								var tableTRinput="#"+"section_table_edit tr:eq("+i+") td:eq(0)";
								var id="section_name_edit";
				    			 $(tableTRinput).children().attr("id",id);
							}else{
								var tableTRinput="#"+"section_table_edit tr:eq("+i+") td:eq(0)";
								var id="section_name_edit"+i;
				    			 $(tableTRinput).children().attr("id",id);
							}
						}
				}
				else{
					$.SmartMessageBox({
						title : "删除下辖路段信息",
						content : "您是否确认删除此公司的这条下辖路段？",
						buttons : '[取消][确定]'
					}, function(ButtonPressed) {
						if (ButtonPressed === "确定") {
							var sectionId=$(objt).attr("data-id");
							//alert(sectionId);
							 $.ajax({
						  			type: 'POST',
						  			url: '../OrgManagerServlet',
						  			dataType: 'json',
						  			data: {
						  				
						  				sectionId:sectionId,
						  				type: "deleteSectionBySectionId",
						  			},
						  			error : function(msg) {
						  				errMessage("请求deleteSection失败");
						  		    },
						  			success : function(json) { 
						  				if(json.success=='success'){
						  					successMessage("删除下辖路段成功");
							  				
						  				}else{
						  					errMessage("删除下辖路段失败");
						  				}
						  				
						  			
						  			
						  			}
						  				
						  			});
						
							 var a = $(obj).parent().parent();
								a.remove();
								console.log(a);
								//将id重新赋值
								var lengthtable=$("#section_table_edit tr").length;
									for(var i=1;i<lengthtable;i++){
										if(i==1){
											var tableTRinput="#"+"section_table_edit tr:eq("+i+") td:eq(0)";
											var id="section_name_edit";
							    			 $(tableTRinput).children().attr("id",id);
										}else{
											var tableTRinput="#"+"section_table_edit tr:eq("+i+") td:eq(0)";
											var id="section_name_edit"+i;
							    			 $(tableTRinput).children().attr("id",id);
										}
										
									}
						}
						if (ButtonPressed === "取消") {
						}
					});	
				}
				
			}	

	// 验证重复元素，有重复返回true；否则返回false
	function isReapet(a)
	{
	   return /(\x0f[^\x0f]+)\x0f[\s\S]*\1/.test("\x0f"+a.join("\x0f\x0f") +"\x0f");
	}

			/*************************************************************/
			//表格搜索框
		 	$('#searchData').on('change', function(){
				var d = $(this).val();
				
				tablePerson.search(d).draw(true);
			}); 
			/********************************************************/
			//增加机构
			function addCompany(){
				   var length=$("#section_table tr").length;
				for(var g=3;g<=length;g++){
					//alert(g);
					var rmovetr="#section_table tr:eq(2)";
              $(rmovetr).remove();
             
				}
				
				$('#operaTest').dialog({
					title:"增加管养单位"
				});
				
				$("#operaForm input").val("");
					
				$('#operaTest').dialog( "open" );
		
				$('#operaTest').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var org_name_add=$("#org_name_add").val();
					    	  var org_name_short=$("#org_name_short").val();
					    	  var section_name=$("#section_name").val();
					    	  var flagSection_name=true;
					    	  if(org_name_add!=''&&org_name_short!=''&&section_name!=''&&org_name_add!=null&&org_name_short!=null&&section_name!=null){
					    		  var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
							         if (regular.test(section_name)) {
							        	 errMessage("下辖路段名称不可包含特殊字符");
						                    return false;
						                }
							         var length2=$("#section_table tr").length;
					    	   var sectionIdName="section_name";
					    	for(var i=2;i<length2;i++){
					    		var sectionIdChanged="#"+sectionIdName+i;
					    		var sectionChangedName=$(sectionIdChanged).val();
					    		//alert(sectionChangedName);
					    		if (regular.test(sectionChangedName)) {
						        	 errMessage("下辖路段名称不可包含特殊字符");
						        	 flagSection_name=false;
						        	 break;
					                }
					    		if(sectionChangedName==''||sectionChangedName==null){
					    			 errMessage("下辖路段名称不可为空");
					    			flagSection_name=false;
					    			 break;
					    		}
					    		section_name=section_name+","+sectionChangedName;
					    	}
					    	var arrAdd=new Array();
					    	arrAdd=section_name.split(",");
					    	var indexFlag=true;
					    	for(var index=0;index<arrAdd.length;index++){
					    		if(indexFlag==false) {break;}
					    		for(var index1=index+1;index1<arrAdd.length;index1++){
					    			if(arrAdd[index]==arrAdd[index1]){
					    				indexFlag=false;
					    				break;
					    			}
					    		}
					    	}
					    		if(indexFlag==false){
					    			errMessage("下辖路段名称不可重复");
					    			return false;
					    		}
					    	if(!flagSection_name){return false;}
					    	  $.ajax({
					  			type: 'POST',
					  			url: '../OrgManagerServlet',
					  			dataType: 'json',
					  			data: {
					  				org_name:org_name_add,
					  				org_name_short:org_name_short,
					  				section_name:section_name,
					  				type: "addCompany",
					  			},
					  			error : function(msg) {
					  				errMessage("增加组织机构失败");
					  		    },
					  			success : function(json) { 
					  				if(json.success=='success'){
					  					 successMessage("添加组织机构成功");
								  			initCompanySelectChange(json.obj);
								  			//alert(json.obj);
								  			$( "#operaTest" ).dialog( "close" );
								  			window.location.reload();
					  				}else{
					  					errMessage("增加组织机构失败");
					  				}
					  			 
                               
					  			
					  			
					  			
					  			}
					  				
					  			});
					    
					    	  }
					    	  else{
					    		  errMessage("必填字段不能为空！");
					    	  }
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
			}
		
			//编辑组织机构
			function editCompany(){
				  var length=$("#section_table_edit tr").length;
					for(var g=3;g<=length;g++){
						//alert("删除次数："+g);
						var rmovetr="#section_table_edit tr:eq(2)";
	              $(rmovetr).remove();
	             
					}
				var org_id=$("#company").val();
			
				 $.ajax({
			  			type: 'POST',
			  			url: '../OrgManagerServlet',
			  			dataType: 'json',
			  			data: {
			  				org_id:org_id,
			  				type: "getEditCompany",
			  			},
			  			error : function(msg) {
			  				errMessage("获取要修改的组织机构信息失败");
			  		    },
			  			success : function(json) { 
			  				//successMessage("成功获取要修改的组织机构信息");
			  				if(json.success=='success'){
			  					var org_name_old=json.obj[0].org_name;
				  				var org_name_short_old=json.obj[0].org_name_short;
				  				var tech_section_old=json.obj[0].tech_section;
				  				var section_name_old=json.obj[0].section_name;
				  				var section_id_old=json.obj[0].section_id;
				  				/* alert(section_name_old);
				  				alert(section_id_old); */
				  				var arr=new Array();
				  				var brr=new Array();
				  				arr=section_name_old.split(",");
				  				brr=section_id_old.split(",");
				  				//console.log(arr);
				  				$("#section_name_eidt").val(arr[0]);
				  				$("#section_name_eidt").attr("data-id",brr[0]);
				  				for(var ei=2,ej=1;ej<arr.length;ei++,ej++){
				  					//lalal
				  					$("#section_table_edit").append("<tr><td><input style='width: 100%' type='text' id='section_name_edit"+ei+"' class='form-control'></td>"
				  							+"<td><a onclick='add_del_line_edit(this)' >删除</a></td></tr>");
				  				var editSection="#section_name_edit"+ei;
				  				$(editSection).val(arr[ej]);
				  				$(editSection).attr("data-id",brr[ej]);
				  				}
				  			$("#org_name_edit").val(org_name_old);
							$("#tech_section_edit").val(tech_section_old);
							$("#org_name_short_edit").val(org_name_short_old);
							
				  			toEditCompany(org_id,org_name_old,org_name_short_old,tech_section_old,section_name_old,section_id_old);
			  				}else{
			  					errMessage("获取要修改的组织机构信息失败");
			  				}
			  				
			  			}
			  				
			  			});
				
			
			
			}
			/************************************************************/
			//编辑职位名称
			function job_edit(){
				if(point=="root"){
					job_edit_part1();
				}else if(point=="level"){
					job_edit_part2();
				}
				else{
					errMessage("请先选择一个部门或分区");
				}
			}
			
			function job_edit_part1(){
				var job_edit_part1_old= $('#table1 tr:eq(1) td:eq(1)').text();
				$("#job_charge_edit").val(job_edit_part1_old);
				//alert(job_edit_part1_old);
				$('#job_edit_part1').dialog({
					title:"修改角色"
				});
				$('#job_edit_part1').dialog( "open" );
		
				$('#job_edit_part1').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var job_edit_part1_new=$("#job_charge_edit").val();
					    	  var id=$("#job_edit_b").attr("data-id");
					    	  //alert(id);
					    	  if(job_edit_part1_new!=''&&job_edit_part1_new!=null){
					    		  if(job_edit_part1_new!=job_edit_part1_old){
						    		  $.ajax({
								  			type: 'POST',
								  			url: '../OrgManagerServlet',
								  			dataType: 'json',
								  			data: {
								  				id:id,
								  				tech_section:job_edit_part1_new,
								  				type: "editTechJob",
								  			},
								  			error : function(msg) {
								  				errMessage("修改失败");
								  		    },
								  			success : function(json) {
								  				if(json.success=='success'){
								  					$('#add_usr_position').empty();
													$('#edit_usr_position').empty();
												$( '#job_edit_part1').dialog( "close" );
												$('#table1 tr:eq(1) td:eq(1)').text(job_edit_part1_new);
											//修改人员表
											 var tr = $("#table2").find("tr");
				                            for ( var i = 2; i < tr.length; i++) {
				        	                        var a = "table2 tr:eq("+i+") td:eq(1)";
				        	                         $("#"+a).text(job_edit_part1_new);
				                                        }
												$('#add_usr_position').append("<option value="+job_edit_part1_new+">"+job_edit_part1_new+"</option>");
												$('#add_usr_position').select2();
												$('#edit_usr_position').append("<option value="+job_edit_part1_new+">"+job_edit_part1_new+"</option>");
												$('#edit_usr_position').select2();
												successMessage("修改成功");
								  				}else{
								  					errMessage("修改失败");
								  				}
								  				
								  			}
								  				
								  			});
						    	  }
					    		  else{
					    			  errMessage("数据没有改变！");
					    		  }
					    	  }
					    	  else{
					    		  errMessage("必填字段不能为空！");
					    	  }
					    	 
					      		
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
			}
			
				function job_edit_part2(){
					var JEdutyman_name= $('#table1 tr:eq(1) td:eq(1)').text();
					var JEengineer_name= $('#table1 tr:eq(2) td:eq(1)').text();
					//alert(JEdutyman_name);
					$("#job_duty_edit").val(JEdutyman_name);
					$("#job_engineer_edit").val(JEengineer_name);
				$('#job_edit_part2').dialog({
					title:"修改角色"
				});
				$('#job_edit_part2').dialog( "open" );
		
				$('#job_edit_part2').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var duty_new=$("#job_duty_edit").val();
					    	  var engineer_new=$("#job_engineer_edit").val();
					    	  var id=$("#job_edit_b").attr("data-id");
					    	  //alert(id);
					    	  if(duty_new!=''&&duty_new!=null&&engineer_new!=''&&engineer_new!=null){
					    		  if(engineer_new!=JEengineer_name||duty_new!=JEdutyman_name){
					    			  if(engineer_new!=duty_new){
						    		  $.ajax({
								  			type: 'POST',
								  			url: '../OrgManagerServlet',
								  			dataType: 'json',
								  			data: {
								  				duty_new:duty_new,
								  				duty_old:JEdutyman_name,
								  				engineer_new:engineer_new,
								  				engineer_old:JEengineer_name,
								  				id:id,
								  				type: "editSectionJob",
								  			},
								  			error : function(msg) {
								  				errMessage("修改失败");
								  		    },
								  			success : function(json) { 
								  				console.log(json);
								  				if(json.success=='success'){
								  					
								  					$( '#job_edit_part2').dialog( "close" );
													successMessage("修改成功");
													$('#add_usr_position').empty();
													$('#edit_usr_position').empty();
													$('#table1 tr:eq(1) td:eq(1)').text(duty_new);
													$('#table1 tr:eq(2) td:eq(1)').text(engineer_new);
													//修改人员表
													 var tr = $("#table2").find("tr");
						                            for ( var i = 2; i < tr.length; i++) {
						        	                        var a = "table2 tr:eq("+i+") td:eq(1)";
						        	                        var table2Job=$("#"+a).text();
						        	                        if(table2Job==JEdutyman_name){
						        	                        	$("#"+a).text(duty_new);
						        	                        }
						        	                        else{
						        	                        	$("#"+a).text(engineer_new);
						        	                        }
						                                        }
						                            $('#add_usr_position').append("<option value="+duty_new+">"+duty_new+"</option>");
													$('#add_usr_position').append("<option value="+engineer_new+">"+engineer_new+"</option>");
													$('#add_usr_position').select2();
													$('#edit_usr_position').append("<option value="+duty_new+">"+duty_new+"</option>");
													$('#edit_usr_position').append("<option value="+engineer_new+">"+engineer_new+"</option>");
													$('#edit_usr_position').select2();
								  				}else{
								  					//alert('有毛病');
								  					errMessage("修改失败");
								  				}
											
								  			}
								  				
								  			});
					    			  }
					    			  else{
					    				  errMessage("负责人与工程师的角色名称不能相同！"); 
					    			  }
						    	  }
					    		  else{
					    			  errMessage("数据没有改变！");
					    		  }
					    	  }
					    	  else{
					    		  errMessage("必填字段不能为空！");
					    	  }
					      		
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
				
			}
			/*****************************************************************/
			//增加分区
			function add_zone(){
				var company=$("#company").val();
				$('#add_zone').dialog({
					title:"增加分区"
				});
	
			$("#addZoneForm input").val("");
				$('#add_zone').dialog( "open" );
		
				$('#add_zone').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var zone_name=$("#zone_name").val();
					    	  var zone_id=$($("#tree-ul li")[1]).attr("data-id");
					    	  //判断是否同名
					    	  var flag=true;
					    	  $('#tree-ul').find('li').each(function(index) {
					    		    //alert(index + ': ' + $(this).text());
					    		    if($(this).text()==zone_name){
					    		    	flag=false;
					    		    	return false;
					    		    }
					    		  });
					    	 // alert(zone_id);
					    	 if(flag){
					    	  if(zone_name!=''&&zone_name!=null){
					    		  
					    	  $.ajax({
					  			type: 'POST',
					  			url: '../OrgManagerServlet',
					  			dataType: 'json',
					  			data: {
					  				zone_name:zone_name,
					  				org_id:company,
					  				zone_id:zone_id,
					  				type: "addZone",
					  			},
					  			error : function(msg) {
					  				errMessage("增加分区失败");
					  		    },
					  			success : function(json) { 
					  				if(json.success=='success'){
					  					 successMessage("添加分区成功");
								  			//树状增加
								  			$( "#add_zone" ).dialog( "close" );
								  			var $lia=$("<li></li>")
											$lia.attr("data-id",json.obj);
											$lia.attr("data-name",zone_name);
											$lia.append("<span class='kh' onclick='choicePart(this)'  >"+zone_name+"</span>");
											$li1.children("ul").append($lia)
					  				}else{
					  					errMessage("增加分区失败");
					  				}
					  			 
					  			}
					  				
					  			});
					    
					    	  }
					    	  else{
					    		  errMessage("必填字段不能为空！");
					    	  }
					    	 }
					    	 else{
					    		  errMessage("分区名字已存在！");
					    	  }	
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
				
			}
			//修改分区
			function edit_zone(){
				//alert(zone_name);
				var zone_id = selectZoneID;
				var zone_name = selectZoneName;
				$("#zone_name_edit").val(zone_name);
				$('#edit_zone').dialog({
					title:"修改分区"
				});
					if(point==undefined||point=="root"){
					      		errMessage("请选择一个分区");
								return false;
							}else{
								$('#edit_zone').dialog( "open" );
							}
				
		
				$('#edit_zone').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var zone_name_new=$("#zone_name_edit").val();
					    	 // alert(zone_name_new);
					    	  var flag=true;
					    	  $('#tree-ul').find('li').each(function(index) {
					    		    //alert(index + ': ' + $(this).text());
					    		    if($(this).text()==zone_name_new){
					    		    	flag=false;
					    		    	return false;
					    		    }
					    		  });
					    	  if(flag){
					    	  if(zone_name_new!=''&&zone_name_new!=null){
					    		  if(zone_name_new!=zone_name){
						    		  $.ajax({
								  			type: 'POST',
								  			url: '../OrgManagerServlet',
								  			dataType: 'json',
								  			data: {
								  				zone_name_new:zone_name_new,
								  				zone_id:zone_id,
								  				type: "editSection",
								  			},
								  			error : function(msg) {
								  				errMessage("修改失败");
								  		    },
								  			success : function(json) { 
								  				if(json.success=='success'){
								  					$( '#edit_zone').dialog( "close" );
													successMessage("修改成功");
													//树状修改
													//$(obj).parent().attr("data-name");
													
													$("#title_usr").text(zone_name_new)
													$(sectionObject).text(zone_name_new);
													$(sectionObject).parent().attr("data-name",zone_name_new);
													//alert($(sectionObject).parent().attr("data-name"))
								  				}else{
								  					errMessage("修改失败");
								  				}
											
								  			}
								  				
								  			});
						    	  }
					    		  else{
					    			  errMessage("数据没有改变！");
					    		  }
					    	  }
					    	  else{
					    		  errMessage("必填字段不能为空！");
					    	  }
					    	  }	
					    	  else{
					    		  errMessage("分区名字已存在！");
					    	  } 
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
				
			}
			//删除分区
			function del_zone(){
				if(point==undefined||point=="root"){
					      		errMessage("请选择一个分区");
								return false;
							}else{
								$.SmartMessageBox({
					title : "删除分区信息",
					content : "您是否确认删除此分区？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						var zone_id = selectZoneID;
						//alert(org_id);
						 $.ajax({
					  			type: 'POST',
					  			url: '../OrgManagerServlet',
					  			dataType: 'json',
					  			data: {
					  				
					  				zone_id:zone_id,
					  				type: "deleteSection",
					  			},
					  			error : function(msg) {
					  				errMessage("删除分区失败");
					  		    },
					  			success : function(json) { 
					  				if(json.success=='success'){
					  					successMessage("删除分区成功");
					  					point=undefined;
					  					removetable1();
					  					removetable2();
							  			//树状删除
							  			if(json.obj!=1){
							  				$(sectionObject).parent().remove();
							  				$("#prj_build").bootstrapSwitch("disabled", true);
							  			}
							  			else{
							  				$(sectionObject).text("分区1");
											$(sectionObject).parent().attr("data-name",'分区1');
							  			}
					  				}else{
					  					errMessage("删除分区失败");
					  				}
					  			
					  			
					  			}
					  				
					  			});
					}
					if (ButtonPressed === "取消") {
					}
				});	
							}
				
			}
			//删除公司
			function delCompany(num){
				$.SmartMessageBox({
					title : "删除分区信息",
					content : "您是否确认删除此公司及其所有信息？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						var org_id=$("#company").val();
						//alert(org_id);
						 $.ajax({
					  			type: 'POST',
					  			url: '../OrgManagerServlet',
					  			dataType: 'json',
					  			data: {
					  				
					  				org_id:org_id,
					  				type: "deleteCompany",
					  			},
					  			error : function(msg) {
					  				errMessage("删除公司失败");
					  		    },
					  			success : function(json) { 
					  				if(json.success=='success'){
					  					successMessage("删除公司成功");
						  				initCompanySelect();
						  				removetable1();
						  				removetable2();
						  				point=undefined;
					  				}else{
					  					errMessage("删除公司失败");
					  				}
					  				
					  			
					  			
					  			}
					  				
					  			});
					
					}
					if (ButtonPressed === "取消") {
					}
				});	
			}
			
			//初始化树状结构	
			function initOrgTree(id,name){
				$("#tree-ul li").remove();
				
				//@author xianing
				
				var doms = $("#ground_li").children("ul");
				$("#ground_li").after(doms);
				$("#ground_li").prev().remove();
				$("#ground_li").remove(); 
				
				 var doms1 = $("#tree-ul-ground").children();
				$("#tree-ul-ground").prev().remove();
				$("#tree-ul-ground").after(doms1);
				$("#tree-ul-ground").remove();  
				//end
			
				$li1=$("<li></li>")
				$li1.attr("data-id",id);
				$li1.prop("id",name);
				$li1.prop("class","parent_li");
				$li1.append("<span title='展开'><i class='fa fa-lg fa-plus-circle'></i> "+name+"</span>");
				$ul.prepend($li1);
			    
			   
			    //@author xianing 
			    
			    var ofa1 = "<li data-id='' id='ground_li' class='ground_li' style='padding-top:35px;padding-left:0px;'>";
			    $ul.wrap(ofa1);
			    $("#ground_li").prepend("<span title='展开' class='kh' style='padding-top: 7px;padding-bottom: 7px;'><i class='fa fa-lg fa-plus-circle'></i></span>");
			    var ofa = "<ul id='tree-ul-ground' class='tree'></ul>";
			    $("#ground_li").wrap(ofa); 
			    //end
				
			    $li1.append("<ul hidden='hidden'></ul>");
			    
				animotion();
				
				//@author xianing
				groundAnimotion();
				//end 一级树控制
				
			}
			//添加控制
			function animotion(){
				$tree.find("span").on("click",function(){
					if($(this).parent().prop("class")=="parent_li"){ 
						if($(this).parent().children("ul").prop("hidden")==true){
							$(this).parent().children("ul").prop("hidden",false);
							$(this).parent().children("span").prop("title","折叠");
							$(this).parent().children("span").children("i").prop("class","fa fa-lg fa-minus-circle");
							point = "root";
							$("#prj_build").bootstrapSwitch("disabled", true);
							$("#addChkButton").attr("disabled",true);
							queryJob($(this).parent().attr("data-id"));
							queryUsr($(this).parent().attr("data-id"),$(this).text());
						}else{
							$(this).parent().children("ul").prop("hidden","hidden");
							$(this).parent().children("span").prop("title","展开");
							$(this).parent().children("span").children("i").prop("class","fa fa-lg fa-plus-circle");
							point = "root";
							$("#prj_build").bootstrapSwitch("disabled", true);
							$("#addChkButton").attr("disabled",true);
							queryJob($(this).parent().attr("data-id"));
							queryUsr($(this).parent().attr("data-id"),$(this).text());
				 	}
					if($ll==undefined){
							$ll=$(this).parent();
						}else if($(this).parent()[0]==$ll[0]){
							return false;
						}else{
							$ll.children("ul").prop("hidden",true);
							$ll.children("span").prop("title","展开");
							$ll.children("span").children("i").prop("class","fa fa-lg fa-plus-circle");
							$ll=$(this).parent();
						}
				 }else{
					choicePart($(this));
					}
				});
					
				}
			
			//@author xianing 三级树种的第一级树控制
			function groundAnimotion(){
				
				var firstDom = $("#ground_li").find("span").get(0);
				var flag=true;
				//$(firstDom).text(shortName);
				$("#tree-ul").hide();
				$(firstDom).on("click",function(){
					if(flag){
						$("#tree-ul").show();
						$(firstDom).find("i").prop("class","fa fa-lg fa-minus-circle");
						flag = false;
						
						var company=$('#company').val();
						
						 if(company==testingCompanyId){
							initTesTingCompanyTableData();
							initPartAndZone();
						}
						else{
							
							initKeepingCompanyTableData(company);
							initPartAndZone();
						} 
						
					}else{
						$("#tree-ul").hide();
						$(firstDom).find("i").attr("class","fa fa-lg fa-plus-circle");
						flag = true;
					 	var company=$('#company').val();
						
						if(company==testingCompanyId){
							initTesTingCompanyTableData();
							initPartAndZone();
						}
						else{
							
							initKeepingCompanyTableData(company);
							initPartAndZone();
						}
					}
				});
			}
			
			function queryUsr(id,name){
				removetable2();
				
			getPerson(id,name);
					
			//每次查询时给button加属性存值
			$("#addUserButton").attr("data-id",id);
			}
			
			function queryJob(id){
				//根节点
				removetable1();
				//console.log(id);
			
				getTheJob(id);
					
					

			}
			//清除表格1
			function removetable1(){
				var tr = $("#table1").find("tr");
				for ( var i = 1; i < tr.length; i++) {
					tr[i].remove();
				}
			}
			//清除表格2
			function removetable2(){
				var tr = $("#table2").find("tr");
				for ( var i = 2; i < tr.length; i++) {
					tr[i].remove();
				}
			}
			

			var flag=undefined;
			//查询部门
			function queryPartment(company){
				flag=false;
				$.ajax({
					type: 'POST',
					url: '../OrgManagerServlet',
					dataType: 'json',
					data: {
						org_id:company,
						type: "zoneinfo",
					},
					error : function(msg) {
						errMessage("加载公司技术分区信息失败");
				    },
					success : function(json) {
						if(json.success=='success'){
							shortName=undefined;
							console.log(json);
							zonedata = json.obj.zoneInfo;
							companyInfo=json.obj.companyInfo;
							shortName=companyInfo.org_name_short;
							//alert(shortName);
							var firstDom = $("#ground_li").find("span").get(0);
							$(firstDom).append(""+shortName);  
							for(var i = 0; i<zonedata.length; i++){
								var $lia=$("<li></li>")
								$lia.attr("data-id",zonedata[i].zone_id);
								$lia.attr("data-name",zonedata[i].zone_name);
								$lia.append("<span class='kh' onclick='choicePart(this)'  >"+zonedata[i].zone_name+"</span>");
								$li1.children("ul").append($lia);
							}
							flag=true;
						}else{
							errMessage("加载公司技术分区信息失败");
						}
						
						
						
					}
						
					});
			
				
			}
			//选择部门
			function choicePart(a){
				point="level";
				//todo
				$("#addChkButton").removeAttr("disabled");
				sectionObject = a;
				selectZoneID = $(a).parent().attr("data-id");
				selectZoneName = $(a).parent().attr("data-name");
				$(a).parent().children("span").css("background","#ccc");
				getBuild_prj(selectZoneID);
				if($lli==undefined){
					$lli=$(a).parent();
				}else{
					if($(a).parent()[0]==$lli[0]){}else{
					$lli.children("span").css("background","#fff");
					$lli=$(a).parent();
					}
				} 
				queryStruct($(a).parent().attr("data-id"));
				queryJob($(a).parent().attr("data-id"));
				queryUsr($(a).parent().attr("data-id"),$(a).text());
				
			}
			//获取分区日常项目标志位，并在界面显示
			function getBuild_prj(selectZoneID){
				$.ajax({
					type: 'POST',
					url: '../OrgManagerServlet',
					dataType: 'json',
					data: {
						zone_id:selectZoneID,
						type: "getBuild_prj",
					},
					error : function(msg) {
						errMessage("请求getBuild_prj失败");
				    },
					success : function(json) {
						if(json.success=='success'){
							var bsState=false;
							if(json.obj[0].build_prj==1){
								bsState=true;
							}
							$("#prj_build").bootstrapSwitch("disabled", false);
							$('#prj_build').bootstrapSwitch('state', bsState, true);
						}else{
							errMessage("获取分区日常项目标志位失败");
						}
						
					}
						
					});
			}
			function deal(obj){
				sectionObject=obj;
				var zone_id=$(obj).parent().attr("data-id");
				var zone_name=$(obj).parent().attr("data-name");
				$('#addz').attr("data-id",zone_id);
				$('#delz').attr("data-name",zone_name);
				
				$('#zone_edit').dialog({
					title:"分区操作"
				});
				$('#zone_edit').dialog( "open" );
		
				$('#zone_edit').dialog({
					  buttons: [
					    {
						   	  html : "<i class='fa fa-times'></i>&nbsp; 取消",
							  "class" : "btn btn-default",
							  click: function() {
							     $( this ).dialog( "close" );
								}
							}
					  ]
					});	
			}
			
			function queryStruct(id){
				$('#datatable_fixed_column').dataTable().fnClearTable();
				$.ajax({
					
					type: 'POST',
					url: '../OrgManagerServlet',
					dataType: 'json',
					data: {
						id:id,
						type: "getStructByid",
					},
					error : function(msg) {
						errMessage("加载结构物信息失败");
				    },
					success : function(json) {
						if(json.success=='success'){
							data = json.obj;
							//console.log(zonedata);
							if(data==''){
								holeLength=0;
							}
							else{
								holeLength=1;
							}
							table.rows.add(data).draw(false);
						}else{
							errMessage("加载结构物信息失败");
						}
						
					}
						
					});
				
			}
			
			/**********************************人员管理*********************************/
			//增加
			function add_usr(){
				if(point==undefined){
					errMessage("请先选择一个部门或分区！");
					return false;
				}
				//initAddUsrPosition();
				$('#add_usr').dialog({
					title:"增加人员"
				});
				$("#add_usrForm input").val("");
				$('#add_usr').dialog( "open" );
				
				$('#add_usr').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var add_usr_name=$("#add_usr_name").val();
					    	  var phone_no=$("#phone_no").val();
					    	  var qq_no=$("#qq_no").val();
					    	  var email_no=$("#email_no").val();
					    	  var add_usr_position=$("#add_usr_position").val();
					    	  var department_id=$("#addUserButton").attr("data-id");
					    	//验证格式
					    	 if ($("#phone_no").val()!=''&&!$("#phone_no").val().match(/^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/)) {
					         errMessage("手机号码格式不正确！");
					         // $("#phone_no").val('');
					        $("#phone_no").focus();
					         return false;
					           } 
					    	 if ($("#email_no").val()!=''&&!$("#email_no").val().match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
									errMessage("邮箱格式不正确！");
									// $("#edit_e").val('');
									$("#edit_e").focus();
									 return false;
									} 
					    	 if ($("#qq_no").val()!=''&&!$("#qq_no").val().match(/^\d{5,10}$/)) {
									errMessage("请输入你正确的QQ号！");
									// $("#qq_no").val('');
									$("#qq_no").focus();
									return false;
									} 
					    	 
					    	  if(add_usr_name!=''&&add_usr_name!=null){
					    		  
					    	  $.ajax({
					  			type: 'POST',
					  			url: '../OrgManagerServlet',
					  			dataType: 'json',
					  			data: {
					  				add_usr_name:add_usr_name,
					  				phone_no:phone_no,
					  				qq_no:qq_no,
					  				email_no:email_no,
					  				add_usr_position:add_usr_position,
					  				department_id:department_id,
					  				type: "addUser",
					  			},
					  			error : function(msg) {
					  				errMessage("增加人员失败");
					  		    },
					  			success : function(json) {
					  				if(json.success=='success'){
					  				  successMessage("添加人员成功");
							  			
							  			$( "#add_usr" ).dialog( "close" );
							  			//表格增加动态哈哈哈
							  			var table2=$("#table2");
							  			var tr = $("#table2").find("tr");
							  			var i=tr.length;
							  			table2.append("<tr><td>"+(i-1)+"</td><td >"+add_usr_position+"</td><td>"+add_usr_name+"</td><td ><a id='"+json.obj+"'  onclick='edit_usr(this)'  class='btn btn-primary btn-xs"+control+"' >详细</a> "+
												"<a id='"+json.obj+"d"+"' class='btn btn-primary btn-xs"+control+"'  onclick='del_usr(this)''>删除</a> </td></tr>");
					  				}else{
					  					errMessage("增加人员失败");
					  				}
					  			
					  			}
					  				
					  			});
					    	  }
					    	  else{
					    		  errMessage("必填字段不能为空！");
					    	  }
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
			}
			
			//编辑
			function edit_usr(obj){
				var usr_id=obj.id;
				var job = $(obj).parent().prev().prev().text();
				 $.ajax({
			  			type: 'POST',
			  			url: '../OrgManagerServlet',
			  			dataType: 'json',
			  			data: {
			  				usr_id:usr_id,
			  				type: "getEditUsr",
			  			},
			  			error : function(msg) {
			  				errMessage("获取要修改的人员信息失败");
			  		    },
			  			success : function(json) {
			  				if(json.success=='success'){
			  				//successMessage("成功获取要修改的人员信息");
				  				var usr_name_old=$(obj).parent().prev().text();
				  				var e_mail_old=json.obj[0].e_mail;
				  				var qq_old=json.obj[0].qq;
				  				var phone_no_old=json.obj[0].phone_no;
				  			$("#edit_usr_name").val(usr_name_old);
				  			$("#edit_phone").val(phone_no_old);
				  			$("#edit_qq").val(qq_old);
				  			$("#edit_e").val(e_mail_old);
							//$("#edit_usr_position").val(job);
							$("#edit_usr_position").val(job).trigger("change");
				  			toEditUsr(usr_id,usr_name_old,e_mail_old,qq_old,phone_no_old,job,obj);
			  				}else{
			  					errMessage("获取要修改的人员信息失败");
			  				}
			  				
			  			}
			  				
			  			});
			
				//initEditUsrPosition(job);
				
			}
			
			/*
			 * @author xianing 增加人员账号功能
			 */
			function addCount(obj){
				var job_new = $("#edit_usr_position").val();
				var usr_id=obj.id;
				var job = $(obj).parent().prev().prev().text();
				 $.ajax({
			  			type: 'POST',
			  			url: '../OrgManagerServlet',
			  			dataType: 'json',
			  			data: {
			  				usr_id:usr_id,
			  				type: "getEditUsrCount",
			  			},
			  			error : function(msg) {
			  				errMessage("获取要修改的人员信息失败");
			  		    },
			  			success : function(json) {
			  				if(json.success=='success'){
			  				//successMessage("成功获取要修改的人员信息");
			  				if(json.obj.length>0&&json.obj!=null){
				  				var usr_name_old=$(obj).parent().prev().text();
				  				var usr_count=json.obj[0].usr_name;
				  				var usr_pwd=json.obj[0].usr_pwd;
				  				var usr_role=json.obj[0].usr_role;
				  				var sign_path=json.obj[0].sign_path;
				  				var org_usr_id=json.obj[0].org_usr_id;
				  				$("#kcauName").val(usr_count);
				  				$("#kcauPass").val(usr_pwd);
				  				$("#kcauJob").val(usr_role);
			  				}else{
			  					$("#kcauName").val("");
				  				$("#kcauPass").val("");
				  				$("#kcauJob").val("");
			  				}	
				  				
							//$("#edit_usr_position").val(job);
							//$("#edit_usr_position").val(job).trigger("change");
							toAddCount(usr_id,usr_name_old,job,obj);
			  				}else{
			  					errMessage("获取要修改的人员信息失败");
			  				}
			  				
			  			}
			  				
			  			});
			
				//initEditUsrPosition(job);
				
			}
			
			//编辑人员表
			function toEditUsr(usr_id,usr_name_old,e_mail_old,qq_old,phone_no_old,job,obj){
				$('#edit_usr').dialog({
					title:"编辑人员信息"
				});
				$('#edit_usr').dialog( "open" );
				$('#edit_usr').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    		var usr_name_new=$("#edit_usr_name").val();
						    	  var e_mail_new= $("#edit_e").val()
						    	  var qq_new=$("#edit_qq").val();
						    	  var phone_no_new=$("#edit_phone").val();
						    	  var job_new=$("#edit_usr_position").val();
						    	  //验证格式
						    	  if ($("#edit_phone").val()!=''&&!$("#edit_phone").val().match(/^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/)) {
					                errMessage("手机号码格式不正确！");
					                // $("#edit_phone").val('');
					                $("#edit_phone").focus();
					                return false;
					                       } 
						    	  if ($("#edit_e").val()!=''&&!$("#edit_e").val().match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
										errMessage("邮箱格式不正确！");
										// $("#edit_e").val('');
										$("#edit_e").focus();
										 return false;
										} 
						    	  if ($("#edit_qq").val()!=''&&!$("#edit_qq").val().match(/^\d{5,10}$/)) {
										errMessage("请输入你正确的QQ号！");
										// $("#edit_qq").val('');
										$("#edit_qq").focus();
										return false;
										} 
						    	  if(usr_name_new!=''&&usr_name_new!=null&&job_new!=''&&job_new!=null){
						    		  if(usr_name_new!=usr_name_old||e_mail_new!=e_mail_old||qq_new!=qq_old||phone_no_old!=phone_no_new||job!=job_new){
						    			  $.ajax({
									  			type: 'POST',
									  			url: '../OrgManagerServlet',
									  			dataType: 'json',
									  			data: {
									  				usr_name_new:usr_name_new,
									  				usr_id:usr_id,
									  				e_mail_new:e_mail_new,
									  				qq_new:qq_new,
									  				phone_no_new:phone_no_new,
									  				job_new:job_new,
									  				type: "editUsr",
									  			},
									  			error : function(msg) {
									  				errMessage("修改人员信息失败");
									  		    },
									  			success : function(json) {
									  				if(json.success=='success'){
									  					successMessage("修改人员信息成功");
											  			
											  			$( "#edit_usr" ).dialog( "close" );
											  			//表格动态编辑
											  			$(obj).parent().prev().prev().text(job_new);
											  			$(obj).parent().prev().text(usr_name_new);
									  				}else{
									  					errMessage("修改人员信息失败");
									  				}
									  			  
									  			
									  			}
									  				
									  			});
						    		  }
						    		  else{
							    		  errMessage("更新内容与原数据一致！");
							    	  }
						    
						    	  }
						    	  else{
						    		  errMessage("必填字段不能为空！");
						    	  } 
					   
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
			}
			//删除
			function del_usr(obj){
				//alert($(obj).text());
				var usr_id=obj.id;
				usr_id=usr_id.substring(0,usr_id.length-1);
				$.SmartMessageBox({
					title : "删除人员",
					content : "删除人员将会 一同删除人员账号，您是否确认删除该人员？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						 $.ajax({
					  			type: 'POST',
					  			url: '../OrgManagerServlet',
					  			dataType: 'json',
					  			data: {
					  				
					  				usr_id:usr_id,
					  				type: "deleteUsr",
					  			},
					  			error : function(msg) {
					  				errMessage("删除人员失败");
					  		    },
					  			success : function(json) { 
					  				if(json.success=='success'){
					  					successMessage("删除人员成功");
							  			//表格动态删除
							  $(obj).parent('td').parent('tr').remove();
							  var tr = $("#table2").find("tr");
				           for ( var i = 2; i < tr.length; i++) {
				        	   var a = "table2 tr:eq("+i+") td:eq(0)"
				        	   $("#"+a).text(i-1);
				                             }
							  	
					  				}else{
					  					errMessage("删除人员失败");	
					  				}
					  				
					  			
					  			}
					  				
					  			});
					}
					if (ButtonPressed === "取消") {
					}
				});	
			}
			
			
			//初始化主管
			function initOrgCharge(){
				$("#kzdiv").hide();
				var tech = $('#kcauPart');
				tech.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
					break;
				}
				tech.select2();
				tech.trigger('change');
				//$("#kpdiv").show();
				//
				var job = $('#kcauJob');
				job.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					job.append('<option value="'+parAndZoneInfo[i].chargeman_name+'">'+parAndZoneInfo[i].chargeman_name+'</option>');
					break;
				}
				job.select2();
				job.trigger('change');
				//$("#kjdiv").show();
				//人员初始化
				getPersons(tech.val(),job.val());
				
				$("#kperdiv").show();
			}
			//初始化负责人
			function initOrgDuty(){
				var tech = $('#kcauPart');
				tech.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
					break;
				}
				tech.select2();
				tech.trigger('change');
				//$("#kpdiv").show();
				//
				var zone = $('#kcauZone');
				zone.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
					
				}
				zone.select2();
				zone.trigger('change');
				$("#kzdiv").show();
				//职位名字
				var job = $('#kcauJob');
				job.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==zone.val()){
						job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
						break;
					}
					
				}
				job.select2();
				job.trigger('change');
				//$("#kjdiv").show();
				getPersons(zone.val(),job.val());
				$("#kperdiv").show();
			}
			//初始化工程师
			function initOrgEngineer(){
				var tech = $('#kcauPart');
				tech.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
					break;
				}
				tech.select2();
				tech.trigger('change');
				//$("#kpdiv").show();
				//
				var zone = $('#kcauZone');
				zone.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
					
				}
				zone.select2();
				zone.trigger('change');
				$("#kzdiv").show();
				//职位名字
				var job = $('#kcauJob');
				job.empty();
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==zone.val()){
						job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
						break;
					}
				}
				job.select2();
				job.trigger('change');
				//$("#kjdiv").show();
				getPersons(zone.val(),job.val());
				$("#kperdiv").show();
			}
			//根据角色变化显示部门等信息
			function  tocorrespondingRole(){
				var role=$("#kcauRole").val();
				console.log(role);
				if(role=="orgAdmin"){
					
					$("#kpdiv").hide();
					$("#kzdiv").hide();
					$("#kjdiv").hide();
		            $("#kperdiv").hide();
					
				}
				if(role=="orgCharge"){
					initOrgCharge();
				}
				if(role=="orgDuty"){
					initOrgDuty();
				}
				if(role=="orgEngineer"){
					initOrgEngineer();
				}	
			}
			//根据编辑人员角色变化显示部门等信息
			function  tocorrespondingEditRole(usr_id){
				var role=$("#kcauRole").val();
				console.log(role);
				if(role=="orgAdmin"){
					
					$("#kpdiv").hide();
					$("#kzdiv").hide();
					$("#kjdiv").hide();
		            $("#kperdiv").hide();
					
				}
				if(role=="orgCharge"){
					initOrgCharge();
				}
				if(role=="orgDuty"){
					initOrgDuty();
					getZoneIdByUsr_id(usr_id,role);
					var job = $('#kcauJob');
					job.empty();
					
					for(var i = 0; i<parAndZoneInfo.length; i++){
						if(parAndZoneInfo[i].zone_id==$('#kcauPart').val()){
							job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
							break;
						}
						
					}
					job.select2();
					job.trigger('change');
					//$("#kjdiv").show();
					getPersons($('#kcauPart').val(),job.val());
				}
				if(role=="orgEngineer"){
					initOrgEngineer();
					getZoneIdByUsr_id(usr_id,role);
					var job = $('#kcauJob');
					job.empty();
					for(var i = 0; i<parAndZoneInfo.length; i++){
						if(parAndZoneInfo[i].zone_id==$('#kcauPart').val()){
							job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
							break;
						}
					}
					job.select2();
					job.trigger('change');
					//$("#kjdiv").show();
					getPersons($('#kcauPart').val(),job.val());
					
				}	
			}
			
			//部门下拉框改变时事件
			$('#kcauRole').select2();
			$('#kcauRole').on("select2:select", function (e) {
				//heihei
				tocorrespondingRole();
				
			});
			
			$("#kcau_sign_imgfile").change(function() {
				
	            var $file = $(this);
	            changeImgK($file);
	             
	});
			function changeImgK($file){
				 var fileObj = $file[0];
	             var windowURL = window.URL || window.webkitURL;
	             var dataURL;
	              var $img = $("#preview_k");

	                if(fileObj && fileObj.files && fileObj.files[0]){
	                   dataURL = windowURL.createObjectURL(fileObj.files[0]);
	                      $img.attr('src',dataURL);
	                                 }else{
	                             dataURL = $file.val();
	var imgObj = document.getElementById("preview_k");
	imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
	imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

	}
	                $("#kcau_sign_img").show();
			}
			
			/*
			 *@author xianing 
			 * 添加人员账号界面 
			 */
			function toAddCount(usr_id,usr_name_old,job,obj){
				
				var job_new=$("#edit_usr_position").val();
				
				$('#add_count').dialog({
					title:"添加人员账号"
				});
				$('#add_count').dialog( "open" );
			    
				
			    $("#kcauJob").empty();
				var doms =  $("#table1").find("tr");
				
				$("#kcauJob").append("<option value='"+job+"'>"+job+"</option>");
				
				
				$('#add_count').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    		var usr_Id=usr_id;
						    	  var user_count= $("#kcauName").val()
						    	  var user_password=$("#kcauPass").val();
						    	  var user_role_type = $("#kcauJob").val();
						    	  var user_role=$("#kcauJob").text();
						    	  var file_name=$("#kcau_sign_imgfile").val()
						    	  var job_new=$("#edit_usr_position").val();
						    	  //验证格式
						    	  if(usr_Id!=''&&user_count!=null&&user_password!=''&&user_role!=null){
						    			  $.ajax({
									  			type: 'POST',
									  			url: '../OrgManagerServlet',
									  			dataType: 'json',
									  			data: {
									  				usr_id:usr_id,
									  				user_count:user_count,
									  				user_password:user_password,
									  				user_role_type:user_role_type,
									  				user_role:user_role,
									  				file_name:file_name,
									  				job_new:job_new,
									  				type: "addUserCount"
									  			},
									  			error : function(msg) {
									  				errMessage("添加人员账号失败");
									  		    },
									  			success : function(json) {
									  				if(json.success=='success'){
									  					successMessage("添加人员账号成功");
											  			
											  			$( "#add_count" ).dialog( "close" );
											  			$(obj).attr("disabled","true");
											  			//表格动态编辑
											  			//$(obj).parent().prev().prev().text(job_new);
											  			//$(obj).parent().prev().text(user_count);
									  				}else{
									  					errMessage("添加人员账号失败");
									  				}
									  			  
									  			
									  			}
									  				
									  			});
						    
						    	  }
						    	  else{
						    		  errMessage("必填字段不能为空！");
						    	  } 
					   
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
			}
			
			//select2
			function initAddUsrPosition(){
				if(point=="root"){
					$('#add_usr_position').append("<option value='桥梁主管'>桥梁主管</option>");
				}else if(point=="level"){
					$('#add_usr_position').append("<option value='负责人'>负责人</option>");
					$('#add_usr_position').append("<option value='工程师'>工程师</option>");
				}
				$('#add_usr_position').select2();
			}
			//select2
			function initEditUsrPosition(str){
				if(point=="root"){
					$('#edit_usr_position').append("<option value='桥梁主管'>桥梁主管</option>");
				}else if(point=="level"){
					$('#edit_usr_position').append("<option value='负责人'>负责人</option>");
					$('#edit_usr_position').append("<option value='工程师'>工程师</option>");
				}
				$('#edit_usr_position').select2();
				$('#edit_usr_position').val(str).trigger("change");
			}
			
			/*********************************删除结构物**************************************/
			function delStruct(obj){
				var struct_id=$(obj).attr("data-id");
				var struct_mode=$(obj).attr("data-type");
				$.SmartMessageBox({
					title : "删除结构物",
					content : "您是否确认删除该结构物？",
					buttons : '[取消][确定]'
				}, function(ButtonPressed) {
					if (ButtonPressed === "确定") {
						 $.ajax({
					  			type: 'POST',
					  			url: '../OrgManagerServlet',
					  			dataType: 'json',
					  			data: {
					  				
					  				struct_id:struct_id,
					  				struct_mode:struct_mode,
					  				type: "delStruct",
					  			},
					  			error : function(msg) {
					  				errMessage("删除结构物失败");
					  		    },
					  			success : function(json) { 
					  				if(json.success=='success'){
					  				successMessage("删除结构物成功");
					  		        table.row($(obj).parents("tr")).remove().draw(false);
					  				}
					  				else{
					  					errMessage("删除结构物失败");
					  				}
					  			}
					  				
					  			});
						
					}
					if (ButtonPressed === "取消") {
					}
				});	
			}
			
			
			/***********************************************初始化左边树*******************************************************/
			
			function initTree(){
				$.ajax({
					type : 'POST',
					url : '../BrgMemberServlet',
					dataType : 'json',
					data : {
						choice : "initTree",
					},
					error : function(msg) {
					errMessage("请求BrgCardServlet失败");
					},
					success : function(json) {
						if(json.success=="success"){
						var data = json.obj;
						for ( var i = 0; i < data.length; i++) {
							if(data[i].direction=="上行"){
							$ul.prepend($li1);
							$li1.append("<ul hidden='hidden'></ul>");
							}
							if(data[i].direction=="下行")
							{
								$ul.append($li2);
								$li2.append("<ul hidden='hidden'></ul>");
							}
							else if(data[i].direction=="无"){
								$ul.append($li3);
								$li3.append("<ul hidden='hidden'></ul>");
								}
							}
							animotion();
							}
						}
					});
				
				}
				
				
				
			
			/***************************************初始化右边表格***************************************************************/
			function initTable(){
				var responsiveHelper_dt_basic = undefined;
				var responsiveHelper_datatable_fixed_column = undefined;
				var responsiveHelper_datatable_col_reorder = undefined;
				var responsiveHelper_datatable_tabletools = undefined;
				
				var breakpointDefinition = {
					tablet : 1024,
					phone : 480
				};
	
				/* COLUMN FILTER  */
				var editAddDel = "<div class='text-align-center'><button onclick='delStruct(this)' class='del btn-circle'><span class='glyphicon glyphicon-trash'></span></button></div>";
				//var editAddDel2 = "<div class='text-align-center'><button class='del btn-circle' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";

				table = $('#datatable_fixed_column').DataTable( {
						 "deferRender": true,
						"processing": true,
						 "sDom":
								"t"+
								"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
						"dataSrc": "data",
						"autoWidth" : false,
						"columns": [
				            { "data": "struct_no" },
				            { "data": "struct_name" },
				            { "data": "highway_name" },
				            { "data": null }
				           /*  { "data": "finish" } */
				        ],
				        "columnDefs": [ {
						       "targets": 3,
				      "searchable": false,
				      "render": function(data, type, full) {
				    	  return "<div class='text-align-center'><button  data-id='"+data.struct_id+"' data-type='"+data.struct_mode+"'onclick='delStruct(this)' class='del btn-circle '"+structControl+"><span class='glyphicon glyphicon-trash'></span></button></div>";
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
			                "sZeroRecords" : "没有您要搜索的内容",    
			                "sInfo" : " _START_ ~  _END_ 条 共 _TOTAL_ 条",   
			                "sInfoEmpty" : "记录数为0",    
			                "sInfoFiltered" : "(全部记录数 _MAX_ 条)",    
			                "sInfoPostFix" : "",    
			                "sSearch" : "搜索",    
			                "sUrl" : "",    
			                "oPaginate": {    
			                    "sFirst" : "第一页",    
			                    "sPrevious" : "<",    
			                    "sNext" : ">",    
			                    "sLast" : "最后一页"    
							}  
						},
				        "order": [[1, 'asc']],
					
					"preDrawCallback" : function() {
						// Initialize the responsive datatables helper once.
						if (!responsiveHelper_datatable_fixed_column) {
							responsiveHelper_datatable_fixed_column = new ResponsiveDatatablesHelper($('#datatable_fixed_column'), breakpointDefinition);
						}
					},
					"rowCallback" : function(nRow) {
						responsiveHelper_datatable_fixed_column.createExpandIcon(nRow);
					},
					"drawCallback" : function(oSettings) {
						responsiveHelper_datatable_fixed_column.respond();
					}	
				
			    });

					$('#datatable_fixed_column tbody').on('click', 'td.details-control', function () {
				        var tr = $(this).closest('tr');
				        var row = table.row( tr );
				 
				        if ( row.child.isShown() ) {
				            // This row is already open - close it
				            row.child.hide();
				            tr.removeClass('shown');
				        }
				        else {
				            // Open this row
				            row.child( format(row.data()) ).show();
				            tr.addClass('shown');
				        }
				    });
			}
			
			/************************************检测公司人员账号弹出框表格************************************/
			
			var checkPeopleTable = $('#checkPeopleTable')
				.DataTable(
						{
							"deferRender" : true,
							"processing" : true,
							"sDom" : "t"
									+ "<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
							"bDestroy" : true,
							"iDisplayLength" : 7,
							"autoWidth" : false,
							
							"bScrollCollapse" : true,
							"sScrollY" : 400,
							"oLanguage" : {
								"sSearch" : '<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>'
							},
							"columns" : [ {
								"data" : "state",
								'orderable' : false
							}, {
								"data" : "usr_name"
							} ],
							"columnDefs" : [
									{
										"class" : "tcenter",
										"targets" : 0,
										"searchable" : true,
										"render" : function(data, type, full) {
										    console.log(type);
											if (data == false) {
												return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" id="checkPeopleCB" class="checkbox style-0 cbox"><span></span></label>';
											} else {
												return '<label class="checkbox-inline" style="width: 100%;height: 100%;"><input type="checkbox" id="checkPeopleCB" class="checkbox style-0 cbox" checked><span></span></label>';
											}
										}
									}],
							//"order" : [ [ 1, 'asc' ] ],
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
			
			/**********************************初始化下拉列表公司-超级管理员*********************************************************************/
			var shortName=undefined;
		
			function initCompanySelect(){
			$.ajax({
							type: 'POST',
							url: '../OrgManagerServlet',
							dataType: 'json',
							data: {
								type: "selectCompany",
								org_id : maintainOrg_id
							},
							error : function(msg) {
								errMessage("加载公司信息失败");
						    },
							success : function(json) {
								shortName=undefined;
								if(json.success=='success'){
									selectCompanydata = json.obj;
									//console.log(selectCompanydata);
									var d = $('#company');
									d.empty();
									d.append('<option value="0000#0000#0000">检测公司</option>')
									for(var i = 0; i<selectCompanydata.length; i++){
										d.append('<option value="'+selectCompanydata[i].org_id+'">'+selectCompanydata[i].org_name+'</option>');
									}
									//d.select2();
									if(maintainOrg_id==null||maintainOrg_id=='null'||maintainOrg_id==''){
										maintainOrg_id='0000#0000#0000';
										$('.zone a').hide();
									}
									d.val(maintainOrg_id);
									d.trigger('change');
									shortName=selectCompanydata[0].org_name_short;	
									queryPartment(selectCompanydata[0].org_id);
									initOrgTree(selectCompanydata[0].tech_section_id,selectCompanydata[0].tech_section);
									setTimeout("judgeHideOrshow('"+maintainOrg_id+"')",22);
									
								}else{
									errMessage("加载公司信息失败");
								}
							}
							});
			}
			//@author xianing
			function judgeHideOrshow(company){
				
				if(company=='0000#0000#0000'||company=="null"){
					
					$("#ground_li ul").hide();
					$("#ground_li span").text('检测公司')
					$("#ground_li span").find("i:first").hide();
					
					$("#tree-ul").hide();
					$(".parent_li").hide();
				}
			}
			
			
			
			/**********************************动态定位*********************************************************************/
			function initCompanySelectChange(id){
				$.ajax({
								type: 'POST',
								url: '../OrgManagerServlet',
								dataType: 'json',
								data: {
									
									type: "selectCompany",
								},
								error : function(msg) {
									errMessage("加载公司信息失败");
							    },
								success : function(json) { 
									
									if(json.success=='success'){
										var selectCompanydata = json.obj;
										//console.log(selectCompanydata);
										var d = $('#company');
										d.empty();
										var j=0;
										for(var i = 0; i<selectCompanydata.length; i++){
											d.append('<option value="'+selectCompanydata[i].org_id+'">'+selectCompanydata[i].org_name+'</option>');
											if(selectCompanydata[i].org_id==id){j=i;}
										}
										//d.select2();
										$("#company").val(id).trigger("change");//设置 value 为four的 option 为选中状态
										
										//shortName=selectCompanydata[j].org_name_short;
										//alert(shortName);
										initOrgTree(selectCompanydata[j].tech_section_id,selectCompanydata[j].tech_section);
										
										queryPartment(id);
										//alert(1);
										
										judgeHideOrshow(maintainOrg_id);
										
									}else{
										errMessage("加载公司信息失败");
									}
									
								}
									
								});
				}
			/**************************************获取职位表格*************************************************************/
			function getTheJob(id){
				//修改
				$("#job_edit_b").attr("data-id",id);
				removetable1();
				var table1=$("#table1");
				var id1=id.slice(10,14);
				if(id1!='0000'){
					$.ajax({
						type: 'POST',
						url: '../OrgManagerServlet',
						dataType: 'json',
						data: {
							department_id:id,
							type: "getJob",
						},
						error : function(msg) {
							errMessage("加载技术角色失败");
					    },
						success : function(json) {
							if(json.success=='success'){
								removetable1();
								jobdata = json.obj;
								//console.log(jobdata);
								$('#add_usr_position').empty();
								$('#edit_usr_position').empty();
								for(var i = 0; i<jobdata.length; i++){
									table1.append("<tr><td >"+(i+1)+"</td><td>"+jobdata[i].dutyman_name+"</td></tr>");
									table1.append("<tr><td >"+(i+2)+"</td><td>"+jobdata[i].engineer_name+"</td></tr>");
									//初始化增加中的下拉框
									
									$('#add_usr_position').append("<option value="+jobdata[i].engineer_name+">"+jobdata[i].engineer_name+"</option>");
									$('#add_usr_position').append("<option value="+jobdata[i].dutyman_name+">"+jobdata[i].dutyman_name+"</option>");
									$('#edit_usr_position').append("<option value="+jobdata[i].engineer_name+">"+jobdata[i].engineer_name+"</option>");
									$('#edit_usr_position').append("<option value="+jobdata[i].dutyman_name+">"+jobdata[i].dutyman_name+"</option>");
									
									
								}
								$('#add_usr_position').trigger('change');
								$('#edit_usr_position').trigger('change');
							}else{
								errMessage("加载技术角色失败");
							}
							
							
						}
							
						});
				}
				else{
					$.ajax({
						type: 'POST',
						url: '../OrgManagerServlet',
						dataType: 'json',
						data: {
							tech_section_id:id,
							type: "getTechJob",
						},
						error : function(msg) {
							errMessage("加载技术部门角色失败");
					    },
						success : function(json) {
							if(json.success=='success'){
								removetable1();
								jobdata = json.obj;
								//console.log(jobdata);
								$('#add_usr_position').empty();
								$('#edit_usr_position').empty();
								for(var i = 0; i<jobdata.length; i++){
									table1.append("<tr><td >"+(i+1)+"</td><td>"+jobdata[i].chargeman_name+"</td></tr>");
									$('#add_usr_position').append("<option value="+jobdata[i].chargeman_name+">"+jobdata[i].chargeman_name+"</option>");
									$('#edit_usr_position').append("<option value="+jobdata[i].chargeman_name+">"+jobdata[i].chargeman_name+"</option>");
								}
								
								$('#add_usr_position').trigger('change');
								$('#edit_usr_position').trigger('change');
							}else{
								errMessage("加载技术部门角色失败");
							}
							
						}
							
						});
				}
				
			}
			/**************************************获取职位人员表格*************************************************************/
			function getPerson(id,name){
				removetable2();
				var table2=$("#table2");
				$("#title_usr").text(name)
				$.ajax({
					type: 'POST',
					url: '../OrgManagerServlet',
					dataType: 'json',
					async : false,
					data: {
						department_id:id,
						type: "getPerson",
					},
					error : function(msg) {
						errMessage("加载技术角色人员失败");
				    },
					success : function(json) {
						if(json.success=='success'){
							jobdata = json.obj;
							$('#dt_basic').dataTable().fnClearTable();
							$('#dt_basic').DataTable().rows.add(jobdata).draw(false); 
						}else{
							errMessage("加载技术角色人员失败");
						}
						
						
						
					}
						
					});
			}
			
			//@author xianing 
			var counts = undefined;
			function checkCount(org_usr_id){
				counts = undefined;
				$.ajax({
					type: 'POST',
					url: '../OrgManagerServlet',
					dataType: 'json',
					async : false,
					data: {
						org_usr_id:org_usr_id,
						type: "getCount",
					},
					error : function(msg) {
						errMessage("加载人员账户失败");
				    },
					success : function(json) {
						if(json.success=='success'){
							counts = json.obj;
						}
					}
					});
				return counts;
			}
			
			/**********************************编辑公司*********************************************************************/
			function toEditCompany(org_id,org_name_old,org_name_short_old,tech_section_old,section_name_old,section_id_old){
				
				$('#org_edit').dialog({
					title:"修改管养单位"
				});
					
			$("#operaForm input").val("");
					
				
				
				$('#org_edit').dialog( "open" );
		
				$('#org_edit').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	 
								
								
							var section_name_edit=$("#section_name_eidt").val();
							var section_id_edit=$("#section_name_eidt").attr("data-id");
					    	  var org_name_edit= $("#org_name_edit").val();
					    	  var tech_section_eidt=$("#tech_section_edit").val();
					    	  var org_name_short_edit=$("#org_name_short_edit").val();
					 
					    	  var flagSection_nameE=true;
					    	  if(org_name_edit!=''&&org_name_edit!=null&&tech_section_eidt!=''&&tech_section_eidt!=null){
					    		  var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
					    		  if (regular.test(section_name_edit)) {
							        	 errMessage("下辖路段名称不可包含特殊字符");
						                    return false;
						                }   
					    		  var lengthE=$("#section_table_edit tr").length;
						    	   var sectionIdName="section_name_edit";
					    		  //比较下辖路段名称
					    		  for(var i=2;i<lengthE;i++){
							    		//alert(i);
							    		var sectionIdChangedEF="#"+"section_table_edit tr:eq("+i+") td:eq(0)";//mimimi
					    			  var sectionIdChangedE="#"+$(sectionIdChangedEF).children().attr("id");
					    			
							    		var sectionChangedNameE=$(sectionIdChangedE).val();
							    		
							    		//alert(sectionChangedNameE);
							    		if (regular.test(sectionChangedNameE)) {
								        	 errMessage("下辖路段名称不可包含特殊字符");
								        	 flagSection_nameE=false;
								        	 break;
							                }
							    		if(sectionChangedNameE==''||sectionChangedNameE==null){
							    			 errMessage("下辖路段名称不可为空");
							    			flagSection_nameE=false;
							    			 break;
							    		}
							    		section_name_edit=section_name_edit+","+sectionChangedNameE;
                                         if(typeof($(sectionIdChangedE).attr("data-id"))=="undefined"){
                                         }else{
                                        	 //alert(typeof($(sectionIdChangedE).attr("data-id"))+"id赋值次数");
                                        	 section_id_edit=section_id_edit+","+$(sectionIdChangedE).attr("data-id");
							    		}
							    	}
					    		 //alert(section_name_edit);
					    		 if(section_name_edit==null||section_name_edit==''){
					    			 errMessage("下辖路段名称不为空");
					    			 return false;
					    		 }
					    		 // alert(section_id_edit);
					    		  //删除后未修改保存动作判断||section_name_edit!=section_name_old
					    		  var sne=section_name_edit;
					    		  var sno=section_name_old;
					    		  //alert(sne.split(",").length);
					    		  var arrAdd=new Array();
							    	arrAdd=sne.split(",");
							    	var indexFlag=true;
							    	for(var index=0;index<arrAdd.length;index++){
							    		if(indexFlag==false) {break;}
							    		for(var index1=index+1;index1<arrAdd.length;index1++){
							    			if(arrAdd[index]==arrAdd[index1]){
							    				indexFlag=false;
							    				break;
							    			}
							    		}
							    	}
							    		if(indexFlag==false){
							    			errMessage("下辖路段名称不可重复");
							    			return false;
							    		}
					    		 
					    			  if(sne.split(",").length>sno.split(",").length){
					    				  
					    			  }else{
					    				  if(org_name_edit==org_name_old&&tech_section_eidt==tech_section_old&&org_name_short_edit==org_name_short_old&&section_name_edit==section_name_old){
					    					  errMessage("更新内容与原数据一致！");
					    					  return false;
					    				  }
					    			  }
					    			  $.ajax({
								  			type: 'POST',
								  			url: '../OrgManagerServlet',
								  			dataType: 'json',
								  			data: {
								  				org_name:org_name_edit,
								  				org_id:org_id,
								  				section_name:section_name_edit,
								  				tech_section:tech_section_eidt,
								  				org_name_short:org_name_short_edit,
								  				section_id:section_id_edit,
								  				type: "editCompany",
								  			},
								  			error : function(msg) {
								  				errMessage("修改组织机构失败");
								  		    },
								  			success : function(json) { 
								  				if(json.success=='success'){
								  					$("#title_usr").text(tech_section_eidt);
								  					 successMessage("修改组织机构成功");
								  					$("#company").find('option:selected').text(org_name_edit);
								  					$("#company").select2();
								  					//截取图标
								  					var addPre=$($("#tree-ul").children().children()[0]).html().substring(0,$($("#tree-ul").children().children()[0]).html().lastIndexOf('>'));
											  			$($("#tree-ul").children().children()[0]).html(addPre+"> "+tech_section_eidt);
											  			$( "#org_edit" ).dialog( "close" );
								  				}else{
								  					errMessage("修改组织机构失败");
								  				}
								  			}
							  			});
					    		 
					    		  
					    	  }
					    	  else{
					    		  errMessage("必填字段不能为空！");
					    	  }
					      		
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
			}
			
			
			/****************************************日常检查添加检测公司人员信息**********************************************/
         function toAddCheckPeople(){
				
				var job_new=$("#edit_usr_position").val();
				
				$('#addChekPeople').dialog({
					title:"添加检测公司人员账号"
				});
				
				$('#addChekPeople').dialog( "open" );
			
				
				$.ajax({
					type: 'POST',
		  			url: '../OrgManagerServlet',
		  			dataType: 'json',
		  			async:false,
		  			data: {
		  				zone_id:selectZoneID,
		  				type: "getCheckPeople"
		  			},
		  			error : function(msg) {
		  				errMessage("查找检测公司人员账号失败");
		  		    },
		  			success : function(json) {
		  				if(json.success=='success'){
		  					$('#checkPeopleTable').dataTable().fnClearTable();
		  					checkPeopleTable.rows.add(json.obj).draw(false);
		  				}else{
		  					errMessage("查找检测公司人员账号失败");
		  				}
		  			}
				});
				
				
				$('#addChekPeople').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() {
					    	  var dom = $("#checkPeopleCB:checked");
					    	  var s = '';
					    	  dom.each(function(){
					    		s=s+"#"+$(this).parent().parent().next().text();
					    	 });
					    	  var str = s.substring(1);
					    	  //alert(str);
						    	  //验证格式
						    	  if(str!=''&&str!=null){
						    			  $.ajax({
									  			type: 'POST',
									  			url: '../OrgManagerServlet',
									  			dataType: 'json',
									  			data: {
									  				zone_id:selectZoneID,
									  				checkPeople:str,
									  				type: "addCheckPeopleCount"
									  			},
									  			error : function(msg) {
									  				errMessage("添加检测公司人员失败");
									  		    },
									  			success : function(json) {
									  				if(json.success=='success'){
									  					successMessage("添加检测公司人员账号成功");
											  			
									  				}else{
									  					errMessage("添加检测公司人员账号失败");
									  				}
									  			}
									  			});
						    	  }
						    	  else{
						    		  errMessage("请勾选账号！");
						    	  } 
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
			}
			/**********************************提示信息*********************************************************************/
			function errMessage(info) {
				$.smallBox({
					title : "处理信息",
					content : "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
					color : "#C46A69",
					iconSmall : "fa fa-times fa-2x fadeInRight animated",
					timeout : 3000
				});
			}

			function successMessage(info) {
				$.smallBox({
					title : "处理信息",
					content : "<i class='fa fa-clock-o'></i> <i>" + info + "</i>",
					color : "#659265",
					iconSmall : "fa fa-times fa-2x fadeInRight animated",
					timeout : 3000
				});
				}
			
				function showMask(){
		        	$("#cover").show();		
		       	}
		       	function hidMask(){
		       		$("#cover").css('display','none');
		       	}
		       	/**********************************权限控制*********************************************************************/
		       	var structControl="disabled='disabled'";
				var control = "disabled";
				var superAdmin = false;
				function releaseAdmin(){//管理员
					$('.company a').removeClass('disabled');
					buildRole();
					var identity="admin";
					inintSpecifiedCompany(identity);
					initTesTingCompanyTable(editAddDel,editAddDel2);
					initTesTingCompanyTableData(); 
					initPartAndZone();
					//$("#company").attr("disabled","disabled");
					$("#edit_company").hide();
					$("#del_company").hide();
				}
				function releaseOrgAdmin(){//管养公司管理员
					$('.company a').removeClass('disabled');
					$('.zone a').removeClass('disabled');
					$('.tab-content a').removeClass('disabled');
					$("#company").attr("disabled",true);
					$("#companyStyle").attr("style","padding-left:0px;padding-top: 50px;")
					$("#add_company").hide();
					$("#del_company").hide();
					$("#switch_panel").show();
					control="";
					structControl="";
					role_control="orgAdmin";
					
					buildRole();
					var identity="orgAdmin";
					inintSpecifiedCompany(identity);
					initTesTingCompanyTable(editAddDel,editAddDel2);
					initKeepingCompanyTableData($("#company").val());
					initPartAndZone();
					$("#company").attr("disabled","disabled");
				}
				function releaseManage(){//项目负责人
				}
				function releaseMember(){//项目参与人
				}
				function releaseGuest(){//普通用户
					
				}
				function releaseGuest( e ){
					if(e=='superAdmin'){
						$('.company a').removeClass('disabled');
						$('.zone a').removeClass('disabled');
						$('.zone a').hide();
						$('.tab-content a').removeClass('disabled');
						releaseAdmin();
					}
					if(e=='superAdmin'){
						superAdmin = true;
						initAllCompanies();
						initTesTingCompanyTable(editAddDel,editAddDel2);
						initTesTingCompanyTableData();
						initPartAndZone();
					}else{
						location.href="index.jsp";
					}
					buildRole();
					
				}
				
		</script>
		
		<script type="text/javascript">	
		/**************************************定义全局变量*************************************************************/
		var testingCompanyId='0000#0000#0000';
		var tablePerson;
		var parAndZoneInfo=undefined;
		var editAddDel = "<div class='text-align-center'><button class='edit btn-circle'><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle'><span class='glyphicon glyphicon-trash'></span></button></div>";
		var editAddDel2 = "<div class='text-align-center'><button class='edit btn-circle' disabled><span class='glyphicon glyphicon-pencil'></span></button>&nbsp;&nbsp;&nbsp;<button class='del btn-circle' disabled><span class='glyphicon glyphicon-trash'></span></button></div>";
		$(document).ready(function() {
			// DO NOT REMOVE : GLOBAL FUNCTIONS!
			pageSetUp();
			$('#searchData').on('change', function(){
				var d = $(this).val();
				tablePerson.search(d).draw(true);
			});
			/* END TABLETOOLS */
			$(".theme-popover").hide();
			$('#login').click(function(){
				//alert(11);
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
			sign_img.append("<div><img id='sign' src='"+encodeURI("../ImageDownLoadServer?path=user\\"+encodeURI(name)+".jpg+")+"'  width='100px' height='100px'></div>");
			}
			else{
			$("#sign").prop("src",encodeURI("../ImageDownLoadServer?path=user\\"+encodeURI(name)+".jpg&a="+Math.random()));
			}
		}
		
		function initTablePerson(id){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				async:false,
				data: {
					type:"initTable",
					item_id:id
				},
				error : function(msg) {
					errMessage("请求initTable失败");
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
		//图片预览
		$("#tcau_sign_imgfile").change(function() {
			//alert("秀安");
               var $file = $(this);
               changeImgT($file);
               
});
		function changeImgT($file){
			  var fileObj = $file[0];
              var windowURL = window.URL || window.webkitURL;
              var dataURL;
               var $img = $("#preview_t");

                 if(fileObj && fileObj.files && fileObj.files[0]){
                    dataURL = windowURL.createObjectURL(fileObj.files[0]);
                       $img.attr('src',dataURL);
                                  }else{
                              dataURL = $file.val();
var imgObj = document.getElementById("preview_t");
imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

}
                 $("#tcau_sign_img").show();
		}
		$("#kcau_sign_imgfile").change(function() {
		
            var $file = $(this);
            changeImgK($file);
             
});
		function changeImgK($file){
			 var fileObj = $file[0];
             var windowURL = window.URL || window.webkitURL;
             var dataURL;
              var $img = $("#preview_k");

                if(fileObj && fileObj.files && fileObj.files[0]){
                   dataURL = windowURL.createObjectURL(fileObj.files[0]);
                      $img.attr('src',dataURL);
                                 }else{
                             dataURL = $file.val();
var imgObj = document.getElementById("preview_k");
imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

}
                $("#kcau_sign_img").show();
		}
		//初始化检测公司人员的dataTable的数据
		function initTesTingCompanyTableData(){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				async:false,
				data: {
					type:"initTesTingCompanyTable",
					
				},
				error : function(msg) {
					errMessage("请求initTesTingCompanyTable失败");
			    },
				success : function(json) {   
					 if(json.success=="fail"){
						 errMessage("没有数据或服务器错误==1");
						 $('#dt_basic').dataTable().fnClearTable();
					 }else{
						 $('#dt_basic').dataTable().fnClearTable(); 
						var data = json.obj;
						console.log(data);
						$('#dt_basic').DataTable().rows.add(data).draw(false);
						/* tablePerson.column(4).visible(false);
						tablePerson.column(5).visible(false);
						tablePerson.column(6).visible(false);
						tablePerson.column(7).visible(false); */
						//$('#dt_basic').dataTable().column(4).visible(true);
						
					 }
				}
			});
		}
		//初始化 初始化管养公司表格
	function initKeepingCompanyTableData(company){
		$.ajax({
			type: 'POST',
			url: '../UserMgrServlet',
			dataType: 'json',
			async:false,
			data: {
				type:"initKeepingCompanyTable",
				org_id:company,
			},
			error : function(msg) {
				errMessage("请求initKeepingCompanyTable失败");
		    },
			success : function(json) {   
				 if(json.success=="fail"){
					 errMessage("没有数据或服务器错误==");
					 $('#dt_basic').dataTable().fnClearTable();
				 }else{
					 $('#dt_basic').dataTable().fnClearTable(); 
					var data = json.obj;
					$('#dt_basic').DataTable().rows.add(data).draw(false); 
				 }
			}
		});
		}
		//初始化检测公司表格
		function initTesTingCompanyTable(editAddDel,editAddDel2){
			tablePerson = $('#dt_basic').DataTable({
				"sDom": 
					"t"+
					"<'dt-toolbar-footer'<'col-sm-6 col-xs-12 hidden-xs'i><'col-xs-12 col-sm-6'p>>",
				"autoWidth" : false,
				"bScrollCollapse" : true,
				"bRetrieve": true,
				"sScrollY" : 400, 
				 "columns": [
			            { "data": null },
			            { "data": "usr_name" },
			            { "data": "usr_pwd" },
			            { "data": "usr_role" },
			            {"data": "org_usr_name"},
			            {"data": "qq"},
			            {"data": "phone_no"},
			            {"data": "email"},
			            { "data": "usr_id" }
			        ],
				"columnDefs": [ {
				      "targets": 8,
				      "searchable": false,
				      "render": function(data, type, full) {
				    	  //console.log(data);
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
					    	  console.log(data);
					    	    if(data=="guest"){
					    	    	return "检测公司普通用户";
					    	    }
					    	    if(data=="admin"){
					    	    	return "检测公司管理员"
					    	    }
					    	    if(data=='orgAdmin'){
					    	    	return '管养公司管理员'
					    	    }
					    	    if(data=='orgCharge'){
					    	    	return '桥梁主管'
					    	    }
					    	    if(data=='orgDuty'){
					    	    	return '桥梁分管'
					    	    }
					    	    if(data=='orgEngineer'){
					    	    	return '工程师'
					    	    }
					          }
					    } ,{
						      "targets": 0,
						      "searchable": false,
						      "orderable":false,
						    },
						    {
							      "targets": 7,
							      "visible": false,
							      "orderable":false,
							    },
					    {	                          
	                          "defaultContent": "",
	                          "targets": "_all"
	                        }
					    ],
				 "order":[[1,'asc']],
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
		     	},
                  /*该段代码序号错误显示,序号会跳跃
                    "fnDrawCallback": function(){
                            var api = this.api();
                            var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                            api.column(0).nodes().each(function(cell, i) {
                            cell.innerHTML = startIndex + i + 1;
                       });
                    } */
                  //此处报错不管,可以正常显示,此处为datatables序号
		     	 "fnDrawCallback"  : function(){
		          　　this.api().column(0).nodes().each(function(cell, i) {
		          　　　　cell.innerHTML =  i + 1;
		          　  　});
		            },
			      });
		         }
		$('#opera').dialog({
			autoOpen: false,
			width : 600,
			resizable : false,
			modal : true
			});
		$('#operaTest').dialog({
			autoOpen: false,
			width : 600,
			resizable : false,
			modal : true
			});
		$('#testingCompanyAddUser').dialog({
			autoOpen: false,
			width : 400,
			height:600,
			resizable : false,
			modal : true
			});
		$('#keepingCompanyAddUser').dialog({
			autoOpen: false,
			width : 400,
			height:600,
			resizable : false,
			modal : true
			});
		var dom;
		function dialogOperation(op){
			var company=$("#company").val();
			var data = tablePerson.row(dom).data();
			var title;
			/* $('#opera').dialog({
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
				}); */
			if(op=="edit"){
				title="修改数据"
				if(company!=testingCompanyId){
					//$("#kcauId").val(data.usr_no);
					$("#kcauName").val(data.usr_name);
					$("#kcauPass").val(data.usr_pwd);
					$("#kcauRole").val(data.usr_role).trigger("change");
					//$("#kcauRole").find('option:selected').val();
					$("#kcauRole").select2();
					/*  {"data": "org_usr_name"},
			            {"data": "qq"},
			            {"data": "phone_no"},
			            {"data": "email"}, */
					$("#unit_name").val(data.org_usr_name);
					$("#unit_qq_no").val(data.qq);
					$("#unit_phone_no").val(data.phone_no);
					$("#unit_email_no").val(data.email);
					keepingComapnyUserEdit(data);
				}
				else{
					//alert(data.usr_no);
					//$("#tcauId").val(data.usr_no);
					$("#tcauName").val(data.usr_name);
					$("#tcauPass").val(data.usr_pwd);
					$("#tcauRole").val(data.usr_role).trigger("change");
					//$("#kcauRole").find('option:selected').val();
					$("#tcauRole").select2();
					$("#add_usr_name").val(data.org_usr_name);
					$("#qq_no").val(data.qq);
					$("#phone_no").val(data.phone_no);
					$("#email_no").val(data.email);
					testingComapnyUserEdit(data);
				}
				//$("#domain_id").prop('readonly','readonly');
			}
			if(op=="del"){
				/* title="删除数据"
				$("#domain_id").val(data.usr_id);
				$("#domain_name").val(data.usr_name);
				$("#domain_pass").val(data.usr_pwd);
				$("#domain_role").val(data.role_name);
				$("#domain_id").prop('readonly','readonly'); */
				deleteOperation(data.usr_id);
				return false;
			}
			//alert($('#dt_basic').DataTable().row(dom).data());
			//initSign_img();
		}
		//检测公司人员修改
		function testingComapnyUserEdit(data){
	    var toAddFile=$("#tcau_sign_imgfile").parent();
	    $("#tcau_sign_imgfile").remove();
		toAddFile.append("<input id='tcau_sign_imgfile' class='file' name='tcau_sign_imgfile' type='file'>"); 
		$("#tcau_sign_imgfile").change(function() {
               var $file = $(this);
               changeImgT($file);
        });
			var company=$("#company").val();
			var reg=/#/g;
			company=company.replace(reg,'@');
			var name=$(dom.children()[1]).text();
			$("#preview_t").prop("src",encodeURI("../ImageDownLoadServer?path=user\\"+company+"\\"+encodeURI(name)+".jpg&a="+Math.random()));
			$("#tcau_sign_img").show();
			$("#tcauRole").val(data.usr_role).trigger("change");
			$("#tcauRole").select2();
            $('#testingCompanyAddUser').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() {
				    	    var userName=$('#tcauName').val();
							var password=$('#tcauPass').val();
							var role=$('#tcauRole').val();
							//var id=$('#tcauId').val();
							var org_id=$("#company").val();
					        var flag=false;
					        var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
					        if (regular.test(userName)) {
					        	 errMessage("账号名不可包含特殊字符");
				                    return false;
				            }
					        var reg="[A-Za-z0-9]\+";
					        if (regular.test(password)) {
					        	 errMessage("密码只能为数字和字母");
				                    return false;
				            }
							        	 if(userName=="" || password==""){
									        	errMessage("必填字段不可为空");
									        }else{
									        	editOperationt(data.usr_id,data);
									        }
				      }
				    }
				    ,
				    {
					   	  html : "<i class='fa fa-times'></i>&nbsp; 取消",
						  "class" : "btn btn-default",
						  click: function() {
						     $( this ).dialog( "close" );
							}
						}
				  ]
				});
			$('#testingCompanyAddUser').dialog({
				title:"修改用户"
			});
			$('#testingCompanyAddUser').dialog( "open" )
		}
		function getOrg_usr_id(usr_id){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				async:false,
				data: {
					usr_id:usr_id,
					type: "getOrg_usr_id",
				},
				error : function(msg) {
					errMessage("请求getOrg_usr_id失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var id=json.obj[0].org_usr_id;
						//alert("绑定人员"+id);
						 $("#kcauPerson").val(id).trigger("change");
						 $("#kcauPerson").select2();
						// alert("现在的org_id:"+id);
					}else{
						errMessage("加载人员信息失败");
					}
				}
				});
		}
		//管养公司人员修改
		//@author xianing update
		function keepingComapnyUserEdit(data){
			//lulu
			//待改
			var toAddFile=$("#kcau_sign_imgfile").parent();
			$("#kcau_sign_imgfile").remove();
			toAddFile.append('<input id="kcau_sign_imgfile" class="file" name="kcau_sign_imgfile" type="file">');
			$("#kcau_sign_imgfile").change(function() {
	               var $file = $(this);
	               changeImgK($file);
	        });
			var company=$("#company").val();
			var reg=/#/g;
			company=company.replace(reg,'@');
			var name=$(dom.children()[1]).text();
			/* $("#preview_k").remove();
			$("#kcau_sign_img").append('<img id="preview_k" width="100" height="100">'); */
			$("#preview_k").prop("src",encodeURI("../ImageDownLoadServer?path=user\\"+company+"\\"+encodeURI(name)+".jpg&a="+Math.random()));
			$("#kcau_sign_img").show();
			$("#kpdiv").hide();
			$("#kzdiv").hide();
			$("#kjdiv").hide();
            $("#kperdiv").hide();
            $("#kcauRole").val(data.usr_role).trigger("change");
			$("#kcauRole").select2();
			initPartAndZoneKE(data.usr_id);
			//alert(data.usr_id);
			if(data.usr_role!="orgAdmin"){
				getOrg_usr_id(data.usr_id);
			}
	           $('#keepingCompanyAddUser').dialog({
					  buttons: [
					    {
					    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
					      "class" : "btn btn-default",
					      click: function() { 
					    	  var userName=$('#kcauName').val();
								var password=$('#kcauPass').val();
								var role=$('#kcauRole').val();
								//var id=$('#kcauId').val();
								var org_id=$("#company").val();
								var org_usr_id=$("#kcauPerson").val();
								var flag=false;
								 var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
						         if (regular.test(userName)) {
						        	 errMessage("账号名不可包含特殊字符");
					                    return false;
					                }
						         var reg="[A-Za-z0-9]\+";
						         if (regular.test(password)) {
						        	 errMessage("密码只能为数字和字母");
					                    return false;
					                }
								/*  if(data.usr_no!=id){
						          $.ajax({
										type: 'POST',
										url: '../UserMgrServlet',
										dataType: 'json',
										data: {
											id:id,
											org_id:org_id,
											type: "identifyId",
										},
										error : function(msg) {
											errMessage("请求identifyId失败");
									    },
										success : function(json) {  
											
											 if(json.success=="fail"&&json.error=="-1"){
												 errMessage("人员编号已存在，请重输");
												
											 }else{
												 //successMessage("插入成功");
												 //控制没有绑定人员时不执行
												 if($("#kcauRole").val()!="orgAdmin"&&$("#kcauPerson").val()==null){
													 errMessage("无绑定人员，请重选角色");
													 return false;
												 }
												   if(userName=="" || password==""||id==""){
											        	errMessage("必填字段不可为空");
											        }else{
											        	
											        	editOperationk(data.usr_id,data);
											        }
												 }
											 }
										
									});
								 }
								 else{ */
									/*  if($("#kcauRole").val()!="orgAdmin"&&$("#kcauPerson").val()==null){
										 errMessage("无绑定人员，请重选角色");
										 return false;
									 } */
									   if(userName=="" || password==""){
								        	errMessage("必填字段不可为空");
								        }else{
								        	editOperationk(data.usr_id,data);
								        }
								/*  } */
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
	           $('#keepingCompanyAddUser').dialog({
					title:"修改数据"
				});
				$('#keepingCompanyAddUser').dialog( "open" );
				
		}
		//打开检测公司人员添加的dialog及操作
		function tcauDialogOperation(){
			 $("#tcau_sign_img").hide();
			 $('#testingCompanyAddUser input').val("");
			 $("#tcauRole").find('option:selected').val("admin");
			 $("#tcauRole").select2();
             $('#testingCompanyAddUser').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() {
				    	  var userName=$('#tcauName').val();
							var password=$('#tcauPass').val();
							var role=$('#tcauRole').val();
							//var id=$('#tcauId').val();
							var org_id=$("#company").val();
							
							var user_name = $("#add_usr_name").val();
					        var phone_no = $("#phone_no").val();
					        var qq_no = $("#qq_no").val();
					        var email_no = $("#email_no").val();
					        
					        var data = {};
					        data.user_name = user_name;
					        data.phone_no = phone_no;
					        data.qq_no = qq_no;
					        data.email_no = email_no;
							
							var flag=false;
					        var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
					         if (regular.test(userName)) {
					        	 errMessage("账号名不可包含特殊字符");
				                    return false;
				                }
					         
					         var fiveChins = /^[\u4E00-\u9FA5]+$/;
					         if(fiveChins.test(userName)){
					        	 if(userName.length>15){
					        		 errMessage("中文账号长度只能小于等于五个字");
					                    return false; 
					        	 }
					         }
					         
					         if(len(userName)>15){
					        	 errMessage("账号长度过长,请重新输入");
				                    return false; 
					         }
					         
					         var reg=/^[A-Za-z0-9]+$/;
					         if (regular.test(password)) {
					        	 errMessage("密码只能为数字和字母");
				                    return false;
				                }
					   /*        $.ajax({
									type: 'POST',
									url: '../UserMgrServlet',
									dataType: 'json',
									data: {
										id:id,
										org_id:org_id,
										type: "identifyIdTesting",
									},
									error : function(msg) {
										errMessage("请求identifyId失败");
								    },
									success : function(json) {  
										
										 if(json.success=="fail"&&json.error=="-1"){
											 errMessage("人员编号已存在，请重输");
											
										 }else{
											 */
										        	 if(userName=="" || password==""){
												        	errMessage("必填字段不可为空");
												        }else{
												        	addTestAccount(userName,password,role,org_id,data);
												        }
									/* 		 }
										 }
								}); */
				      }
				    }
				    ,
				    {
					   	  html : "<i class='fa fa-times'></i>&nbsp; 取消",
						  "class" : "btn btn-default",
						  click: function() {
						     $( this ).dialog( "close" );
							}
						}
				  ]
				});
			$('#testingCompanyAddUser').dialog({
				title:"新增用户"
			});
			$('#testingCompanyAddUser').dialog( "open" )
		}
		function addTestAccount(userName,password,role,org_id,data){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				async:false,
				data: {
					type:"accountAdd",
					org_id:org_id,
					userName:userName,
					password:password,
					role:role,
				    user_name:data.user_name,
				    phone_no:data.phone_no,
				    qq_no:data.qq_no,
				    email_no:data.email_no,
					//id:id,
		        	file_name:$("#tcau_sign_imgfile").val()
				},
				error : function(msg) {
					errMessage("请求accountAdd失败");
			    },
				success : function(json) {  
					 if(json.success=="fail"&&json.error=="0"){
						 errMessage("账号重名，请重输");
					 }else if(json.success=="fail"&&json.error=="1"){
						 errMessage("账户添加失败");
						// $('#dt_basic').DataTable().row.add([id,userName,role]).draw(true); 
						// location.reload([true]);
					 }else{
						 //successMessage("插入成功");
						 var file_name = $("#tcau_sign_imgfile").val();
						 if(file_name != "")
						 {
						 imgupload('tcau_sign_imgfile');
						 }
						 else{
						// location.reload([true]);这句话意义啥？   @author xianing ：这句话为了刷新页面，但是下面调用了dataTable重新加载了数据，因此不需要了。
						 }
						 $('#testingCompanyAddUser').dialog( "close" );
						 //hahah
						 $('#dt_basic').DataTable().row.add(json.obj).draw();
					 }
				}
			});
		}
		//打开管养公司人员添加的dialog及操作
		function kcauDialogOperation(){
			//初始化部门分区
			$('#keepingCompanyAddUser input').val("");
			$("#kcau_sign_img").hide();
			$("#kpdiv").hide();
			$("#kzdiv").hide();
			$("#kjdiv").hide();
            $("#kperdiv").hide();
            $("#kcauRole").val("orgAdmin").trigger("change");
			$("#kcauRole").select2();
			//initPartAndZone();
            $('#keepingCompanyAddUser').dialog({
				  buttons: [
				    {
				    	html : "<i class='fa fa-plus'></i>&nbsp; 保存",
				      "class" : "btn btn-default",
				      click: function() { 
				    	    var userName=$('#kcauName').val();
							var password=$('#kcauPass').val();
							var role=$('#kcauRole').val();
							//var id=$('#kcauId').val();
							var org_id=$("#company").val();
							var org_usr_id=$("#kcauPerson").val();
							
							//@author xianing 
							var unit_name=$("#unit_name").val();
							var unit_phone_no=$("#unit_phone_no").val();
							var unit_qq_no=$("#unit_qq_no").val();
							var unit_email_no=$("#unit_email_no").val();
							
							var data={};
							data.unit_name=unit_name,
							data.unit_phone_no=unit_phone_no,
							data.unit_qq_no=unit_qq_no,
							data.unit_email_no=unit_email_no;
							
							 var flag=false;
							 var regular = /^([^\`\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\！\￥\……\（\）\——]*[\+\~\!\#\$\%\^\&\*\(\)\|\}\{\=\"\'\`\！\?\:\<\>\•\“\”\；\‘\‘\〈\ 〉\￥\……\（\）\——\｛\｝\【\】\\\/\;\：\？\《\》\。\，\、\[\]\,]+.*)$/;
					         if (regular.test(userName)) {
					        	 errMessage("账号名不可包含特殊字符");
				                    return false;
				                }
					         var reg="[A-Za-z0-9]\+";
					         if (regular.test(password)) {
					        	 errMessage("密码只能为数字和字母");
				                    return false;
				                }
					         if(len(userName)>15){
					        	 errMessage("账号长度过长,请重新输入");
				                    return false; 
					         }
					         if(len(unit_name)>15){
					        	 errMessage("姓名长度过长,请重新输入");
				                    return false; 
					         }
					    /*       $.ajax({
									type: 'POST',
									url: '../UserMgrServlet',
									dataType: 'json',
									data: {
										id:id,
										org_id:org_id,
										type: "identifyId",
									},
									error : function(msg) {
										errMessage("请求identifyId失败");
								    },
									success : function(json) {  
										
										 if(json.success=="fail"&&json.error=="-1"){
											 errMessage("人员编号已存在，请重输");
											
										 }else{ */
											 //successMessage("插入成功");
											 //控制没有绑定人员时不执行
											/*  if($("#kcauRole").val()!="orgAdmin"&&$("#kcauPerson").val()==null){
												 errMessage("无绑定人员，请重选角色");
												 return false;
											 } */
											   if(userName=="" || password==""||unit_name==""){
										        	errMessage("必填字段不可为空");
										        }else{
										        	addKeepAccount(userName,password,role,org_id,org_usr_id,data);
										        }
											 }
									/* 	 }
									
								}); */
				      
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
			$('#keepingCompanyAddUser').dialog({
				title:"新增数据"
			});
			$('#keepingCompanyAddUser').dialog( "open" )
		}
		function addKeepAccount(userName,password,role,org_id,org_usr_id,data){
			$.ajax({
				type: 'POST',
				url: '../UserMgrServlet',
				dataType: 'json',
				async:false,
				data: {
					type:"accountAdd",
					org_id:org_id,
					userName:userName,
					password:password,
					role:role,
					departmentId:$("#kcauZone").val(),
					unit_name:data.unit_name,
					unit_phone_no:data.unit_phone_no,
					unit_qq_no:data.unit_qq_no,
					unit_email_no:data.unit_email_no,
					roleName:$("#kcauRole option:selected").text(),
					org_usr_id:org_usr_id,
		        	file_name:$("#kcau_sign_imgfile").val()
				},
				error : function(msg) {
					errMessage("请求accountAdd-k失败");
			    },
				success : function(json) {  
					 if(json.success=="fail"&&json.error=="0"){
						 errMessage("账号重名，请重输");
					 }else if(json.success=="fail"&&json.error=="1"){
						 errMessage("账户添加失败");
						 /* $('#dt_basic').DataTable().row.add([info.domain_id,info.item_value,info.domain_memo]).draw(true);  */
						// location.reload([true]);
					     $('#keepingCompanyAddUser').dialog( "close" ); 
					 }else{
						successMessage("插入成功");
						  $('#keepingCompanyAddUser').dialog( "close" ); 
						 var file_name = $("#kcau_sign_imgfile").val();
						 if(file_name != "")
						 {
						 imgupload('kcau_sign_imgfile');
						 }
						 else{
						 }
				         json.obj.usr_name= userName;
				         json.obj.usr_pwd=password;
				         json.obj.usr_role=role;
						 json.obj.org_usr_name=data.unit_name;
				         json.obj.qq=data.unit_qq_no;
				         json.obj.phone_no=data.unit_phone_no;
				         json.obj.email=data.unit_email_no;
						 $('#dt_basic').DataTable().row.add(json.obj).draw();
					 }
				}
			});
		}
		//初始化部门分区
		function initPartAndZone(){
			var company=$("#company").val();
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				async:false,
				data: {
					company:company,
					type: "initPartAndZone",
				},
				error : function(msg) {
					errMessage("请求initPartAndZone失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						parAndZoneInfo = json.obj;
						//console.log(selectCompanydata);
					/*	var tech = $('#kcauPart');
						tech.empty();
						tech.append("<option value='' >不选择部门</option>");
						for(var i = 0; i<parAndZoneInfo.length; i++){
							tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
							break;
						}
						tech.select2();
						tech.trigger('change');
						var zone = $('#kcauZone');
						zone.empty();
						zone.append("<option value='' >不选择分区</option>");
						for(var i = 0; i<parAndZoneInfo.length; i++){
							zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
						}
						zone.select2();
						zone.trigger('change');
						$('#kcauRole').empty();
						$('#kcauRole').append("<option value='orgAdmin' >管养公司管理员</option>");
						$('#kcauRole').select2();
						$('#kcauRole').trigger('change');
						*/
					}else{
						errMessage("加载公司部门分区信息失败");
					}
				}
				});
		}
		//管养单位初始化部门分区    
		function initPartAndZoneKE(usr_id){
	        tocorrespondingRole();
	                    // alert('原来的分区'+$('#kcauZone').val());
	                    //alert('选择人的usr_id:'+usr_id);
	        var role=$("#kcauRole").val();
			if(role=="orgAdmin"){
				return false;
				}
						getZoneIdByUsr_id(usr_id,$("#kcauRole").val());
						//嘿嘿
						var zone = $('#kcauZone');
						var job = $('#kcauJob');
						job.empty();
						if(role=="orgDuty"){
						for(var i = 0; i<parAndZoneInfo.length; i++){
							if(parAndZoneInfo[i].zone_id==zone.val()){
								job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
								break;
							}
						}
						job.select2();
						job.trigger('change');
						//alert('现在的分区'+zone.val());
						getPersons(zone.val(),job.val());
					}
						else if(role=="orgEngineer"){
							for(var i = 0; i<parAndZoneInfo.length; i++){
								if(parAndZoneInfo[i].zone_id==zone.val()){
									job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
									break;
								}
							}
							job.select2();
							job.trigger('change');
							//alert('现在的分区'+zone.val());
							getPersons(zone.val(),job.val());
						}
						else if(role=="orgCharge"){
							for(var i = 0; i<parAndZoneInfo.length; i++){
								job.append('<option value="'+parAndZoneInfo[i].chargeman_name+'">'+parAndZoneInfo[i].chargeman_name+'</option>');
								break;
							}
							job.select2();
							job.trigger('change');
							getPersons($("#kcauPart").val(),job.val());
						}
		}
		//部门下拉框改变时事件
		$('#kcauRole').select2();
		$('#kcauRole').on("select2:select", function (e) {
			//heihei
			tocorrespondingRole();
		});
		//初始化主管
		function initOrgCharge(){
			$("#kzdiv").hide();
			var tech = $('#kcauPart');
			tech.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
				break;
			}
			tech.select2();
			tech.trigger('change');
			//$("#kpdiv").show();
			//
			var job = $('#kcauJob');
			job.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				job.append('<option value="'+parAndZoneInfo[i].chargeman_name+'">'+parAndZoneInfo[i].chargeman_name+'</option>');
				break;
			}
			job.select2();
			job.trigger('change');
			//$("#kjdiv").show();
			//人员初始化
			getPersons(tech.val(),job.val());
			$("#kperdiv").show();
		}
		//初始化负责人
		function initOrgDuty(){
			var tech = $('#kcauPart');
			tech.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
				break;
			}
			tech.select2();
			tech.trigger('change');
			//$("#kpdiv").show();
			//
			var zone = $('#kcauZone');
			zone.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
				
			}
			zone.select2();
			zone.trigger('change');
			$("#kzdiv").show();
			//职位名字
			var job = $('#kcauJob');
			job.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				if(parAndZoneInfo[i].zone_id==zone.val()){
					job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
					break;
				}
				
			}
			job.select2();
			job.trigger('change');
			//$("#kjdiv").show();
			getPersons(zone.val(),job.val());
			$("#kperdiv").show();
		}
		//初始化工程师
		function initOrgEngineer(){
			var tech = $('#kcauPart');
			tech.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				tech.append('<option value="'+parAndZoneInfo[i].tech_section_id+'">'+parAndZoneInfo[i].tech_section+'</option>');
				break;
			}
			tech.select2();
			tech.trigger('change');
			//$("#kpdiv").show();
			//
			var zone = $('#kcauZone');
			zone.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				zone.append('<option value="'+parAndZoneInfo[i].zone_id+'">'+parAndZoneInfo[i].zone_name+'</option>');
			}
			zone.select2();
			zone.trigger('change');
			$("#kzdiv").show();
			//职位名字
			var job = $('#kcauJob');
			job.empty();
			for(var i = 0; i<parAndZoneInfo.length; i++){
				if(parAndZoneInfo[i].zone_id==zone.val()){
					job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
					break;
				}
			}
			job.select2();
			job.trigger('change');
			//$("#kjdiv").show();
			getPersons(zone.val(),job.val());
			$("#kperdiv").show();
		}
		//根据角色变化显示部门等信息
		function  tocorrespondingRole(){
			var role=$("#kcauRole").val();
			console.log(role);
			if(role=="orgAdmin"){
				$("#kpdiv").hide();
				$("#kzdiv").hide();
				$("#kjdiv").hide();
	            $("#kperdiv").hide();
			}
			if(role=="orgCharge"){
				initOrgCharge();
			}
			if(role=="orgDuty"){
				initOrgDuty();
			}
			if(role=="orgEngineer"){
				initOrgEngineer();
			}	
		}
		//根据编辑人员角色变化显示部门等信息
		function  tocorrespondingEditRole(usr_id){
			var role=$("#kcauRole").val();
			console.log(role);
			if(role=="orgAdmin"){
				
				$("#kpdiv").hide();
				$("#kzdiv").hide();
				$("#kjdiv").hide();
	            $("#kperdiv").hide();
			}
			if(role=="orgCharge"){
				initOrgCharge();
			}
			if(role=="orgDuty"){
				initOrgDuty();
				getZoneIdByUsr_id(usr_id,role);
				var job = $('#kcauJob');
				job.empty();
				
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==$('#kcauPart').val()){
						job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
						break;
					}
					
				}
				job.select2();
				job.trigger('change');
				//$("#kjdiv").show();
				getPersons($('#kcauPart').val(),job.val());
			}
			if(role=="orgEngineer"){
				initOrgEngineer();
				getZoneIdByUsr_id(usr_id,role);
				var job = $('#kcauJob');
				job.empty();
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==$('#kcauPart').val()){
						job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
						break;
					}
				}
				job.select2();
				job.trigger('change');
				//$("#kjdiv").show();
				getPersons($('#kcauPart').val(),job.val());
				
			}	
		}
		//获取人员分区根据人员id
		function getZoneIdByUsr_id(id,role){
			//alert("enter");
			//alert("人员id:"+id);
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				async:false,
				data: {
					id:id,
					type: "getZoneIdByUsr_id",
				},
				error : function(msg) {
					errMessage("请求account_getPersons失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						if(role=="orgCharge"){
							//alert("重新改变分区id:"+json.obj[0].department_id);
							
						}
						else{
							//alert("人员id:"+id+"分区id:"+json.obj[0].department_id);
							$('#kcauZone').val(json.obj[0].department_id).trigger("change");
							 $('#kcauZone').select2();
						}
						
					}else{
						errMessage("加载人员信息失败");
					}
					
				}
					
				});
		}
		//人员初始化
		function getPersons(id,job){
			//alert(id+"haha"+job);
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				async:false,
				data: {
					id:id,
					job:job,
					type: "account_getPersons",
				},
				error : function(msg) {
					errMessage("请求account_getPersons失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var pesonInfo=json.obj;
						var person = $('#kcauPerson');
						person.empty();
						//alert(pesonInfo.length);
						for(var i = 0; i<pesonInfo.length; i++){
							person.append('<option value="'+pesonInfo[i].org_usr_id+'">'+pesonInfo[i].org_usr_name+'</option>');
							//break;
						}
						person.select2();
						person.trigger('change');
						//alert("原来的org_id:"+person.val());
					}else{
						errMessage("加载人员信息失败");
					}
					
				}
					
				});
		}
		/*$('#kcauPart').on("select2:select", function (e) {
			var part=$('#kcauPart').val();
			if(part==''){
				$('#kcauZone').empty();
				$('#kcauZone').append("<option value='' >不选择分区</option>");
				$('#kcauZone').select2();
				$('#kcauZone').trigger('change');
				//
				$('#kcauRole').empty();
				$('#kcauRole').append("<option value='orgAdmin' >管养公司管理员</option>");
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
			}
			else{
				//
				$('#kcauRole').empty();
				for(var i = 0; i<parAndZoneInfo.length; i++){
					$('#kcauRole').append('<option value="orgCharge">'+parAndZoneInfo[i].chargeman_name+'</option>');
					break;
				}
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
			}
			
		});
		//分区下拉列表改变事件
		$('#kcauZone').on("select2:select", function (e) {
			var zone=$('#kcauZone').val();
			if(zone==''){
				if($('#kcauPart').val()==''){
				$('#kcauRole').empty();
				$('#kcauRole').append("<option value='orgAdmin' >管养公司管理员</option>");
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
				}
				else{
					$('#kcauRole').empty();
					for(var i = 0; i<parAndZoneInfo.length; i++){
						$('#kcauRole').append('<option value="orgCharge">'+parAndZoneInfo[i].chargeman_name+'</option>');
						break;
					}
					$('#kcauRole').select2();
					$('#kcauRole').trigger('change');
				}
			}
			else{
				//
				$('#kcauRole').empty();
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(zone==parAndZoneInfo[i].zone_id){
						$('#kcauRole').append('<option value="orgDuty">'+parAndZoneInfo[i].dutyman_name+'</option>');
						$('#kcauRole').append('<option value="orgEngineer">'+parAndZoneInfo[i].engineer_name+'</option>');
						break;
					}
					
				}
				$('#kcauRole').select2();
				$('#kcauRole').trigger('change');
			}
			
		});*/
		$('#kcauZone').on("select2:select", function (e) {
			var role=$("#kcauRole").val();
			var zone = $('#kcauZone');
			var job = $('#kcauJob');
			job.empty();
			if(role=="orgDuty"){
			for(var i = 0; i<parAndZoneInfo.length; i++){
				if(parAndZoneInfo[i].zone_id==zone.val()){
					job.append('<option value="'+parAndZoneInfo[i].dutyman_name+'">'+parAndZoneInfo[i].dutyman_name+'</option>');
					break;
				}
				
			}
		}
			else{
				for(var i = 0; i<parAndZoneInfo.length; i++){
					if(parAndZoneInfo[i].zone_id==zone.val()){
						job.append('<option value="'+parAndZoneInfo[i].engineer_name+'">'+parAndZoneInfo[i].engineer_name+'</option>');
						break;
					}
					
				}
			}
			job.select2();
			job.trigger('change');
			getPersons(zone.val(),job.val());
			});
		//公司下拉列表改变事件
		$('#company').on("select2:select", function (e) {
			var company=$('#company').val();
			
			if(company==testingCompanyId){
				initTesTingCompanyTableData();
				
				initPartAndZone();
				$('.zone a').hide();
				$("#edit_company").hide();
				$("#del_company").hide();
				//initTesTingCompanyTable(editAddDel,editAddDel2);
			}
			else{
				initKeepingCompanyTableData(company);
				//initKeepingCompanyTable(editAddDel,editAddDel2);
				initPartAndZone();
				$('.zone a').show();
				$("#edit_company").show();
				$("#del_company").show();
			}
		});
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
		
		function editOperationk(usr_id,data){
			var oldNum=$(dom.children()[0]).text();
			var company=$("#company").val();
			
			//@author xianing 
			var unit_name=$("#unit_name").val();
			var unit_phone_no=$("#unit_phone_no").val();
			var unit_qq_no=$("#unit_qq_no").val();
			var unit_email_no=$("#unit_email_no").val();
		       
		        	$.ajax({
						type: 'POST',
						url: '../UserMgrServlet',
						dataType: 'json',
						async:false,
						data: {
							type:"edit",
							domain_id:usr_id,
				        	domain_role:$('#kcauRole').val(),
				        	domain_pass:$('#kcauPass').val(),
				        	domain_name:$('#kcauName').val(),
				        	//usr_no:$("#kcauId").val(),
				        	
				        	//@author xianing 
							unit_name:$("#unit_name").val(),
							unit_phone_no:$("#unit_phone_no").val(),
							unit_qq_no:$("#unit_qq_no").val(),
							unit_email_no:$("#unit_email_no").val(),
							departmentId:company,
							company:company,
						},
						error : function(msg) {
							errMessage("请求edit失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("修改失败");
							 }else{
								successMessage("修改成功");
								  var file_name = $("#kcau_sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload('kcau_sign_imgfile');
												 }
												 else{
												// location.reload([true]);
												 }
												 tablePerson.row(dom).data(json.obj);
												 $(dom.children()[0]).text(oldNum);
								// $('#opera').dialog( "close" );
								$("#keepingCompanyAddUser").dialog( "close" );
							 }
						}
					});
		       
		}
		function editOperationt(usr_id,data){
			var oldNum=$(dom.children()[0]).text();
			console.log(data);
			var company=$("#company").val();
		       
		        	$.ajax({
						type: 'POST',
						url: '../UserMgrServlet',
						dataType: 'json',
						async:false,
						data: {
							type:"edit",
							domain_id:usr_id,
				        	domain_role:$('#tcauRole').val(),
				        	domain_pass:$('#tcauPass').val(),
				        	domain_name:$('#tcauName').val(),
				        	
				        	user_name:$("#add_usr_name").val(),
				        	qq_no:$("#qq_no").val(),
				        	phone_no:$("#phone_no").val(),
				        	email_no:$("#email_no").val(),
							
				        	company:company,
						},
						error : function(msg) {
							errMessage("请求edit失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("修改失败");
							 }else{
								 successMessage("修改成功");
								  var file_name = $("#tcau_sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload('tcau_sign_imgfile');
												 }
												 else{
												// location.reload([true]);
												 }
								 
												 tablePerson.row(dom).data(json.obj);
												 $(dom.children()[0]).text(oldNum);
								// $('#opera').dialog( "close" );
								$("#testingCompanyAddUser").dialog( "close" );
							 }
							 
						}
					});
		       
		}
		function deleteOperation(usr_id){
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
						async:false,
						data: {
							type:"delete",
							domain_id:usr_id,
						},
						error : function(msg) {
							errMessage("请求delete失败");
					    },
						success : function(json) {   
							 if(json.success=="fail"){
								 errMessage("删除失败");
							 }else{
								 //successMessage("删除成功");
								
								 $('#dt_basic').DataTable().row(dom).remove().draw();
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
			$("#sign").prop("src",encodeURI("../ImageDownLoadServer?path=user\\no.jpg&a="+Math.random()));
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
										async:false,
										data: {
											type:"new",
											domain_id:$('#domain_id').val(),
								        	domain_name:$('#domain_name').val(),
								        	domain_pass:$('#domain_pass').val(),
								        	domain_role:$('#domain_role').val(),
								        	file_name:$("#tcau_sign_imgfile").val()
										},
										error : function(msg) {
											errMessage("请求new失败");
									    },
										success : function(json) {  
											
											 if(json.success=="fail"&&json.error=="0"){
												 errMessage("账户重名，请重输");
											 }else if(json.success=="fail"&&json.error=="1"){
												 errMessage("添加用户失败");
											 }else{
												 //successMessage("插入成功");
												 var file_name = $("#tcau_sign_imgfile").val();
												 if(file_name != "")
												 {
												 imgupload('tcau_sign_imgfile');
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
		function imgupload(str){
			 $.ajaxFileUpload({
					url:'../UserMgrServlet?type=img',
					secureuri : false,
					fileElementId : str,
					dataType:'text',
					success : function(data,status) {
					//successMessage("保存成功");	
					//location.reload([true]);
						}
											 });
		}
		//加载所有公司
		function initAllCompanies(){
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				async:false,
				data: {
					
					type: "selectCompany",
				},
				error : function(msg) {
					errMessage("加载公司信息失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var selectCompanydata = json.obj;
						//console.log(selectCompanydata);
						var d = $('#company');
						d.empty();
						d.append("<option value="+testingCompanyId+" >检测公司</option>");
						for(var i = 0; i<selectCompanydata.length; i++){
							d.append('<option value="'+selectCompanydata[i].org_id+'">'+selectCompanydata[i].org_name+'</option>');
						}
						d.select2();
						d.trigger('change');
						
					}else{
						errMessage("加载公司信息失败");
					}
					
				}
					
				});
		}
		//加载对应的公司
		function inintSpecifiedCompany(identity){
			var username = "<%=session.getAttribute("username") %>";
			$.ajax({
				type: 'POST',
				url: '../OrgManagerServlet',
				dataType: 'json',
				async:false,
				data: {
					username:username,
					identity:identity,
					type: "selectSpecifiedCompany",
				},
				error : function(msg) {
					errMessage("加载公司信息失败");
			    },
				success : function(json) {
					if(json.success=='success'){
						var selectCompanydata = json.obj;
						//console.log(selectCompanydata);
						var d = $('#company');
						d.empty();
						if(identity=='admin'){
							//d.append('<option value="0000#0000#0000">检测公司</option>');
						}
						
						for(var i = 0; i<selectCompanydata.length; i++){
							d.append('<option value="'+selectCompanydata[i].org_id+'">'+selectCompanydata[i].org_name+'</option>');
							break;
						}
						d.select2();
						d.trigger('change');
						
					}else{
						errMessage("加载公司信息失败");
					}
					
				}
					
				});
		}
		//针对下拉框选值弹出不同增加人员的弹出框
		function addUserByCompany(){
			var companyId=$('#company option:selected').val();
			if(companyId==testingCompanyId){
				tcauDialogOperation();
			}
			else{
				kcauDialogOperation();	
			}
		}
		
		function buildRole(){
			/* if(superAdmin){
				$('#domain_role').append("<option value='admin'>系统管理员</option><option value='guest'>普通用户 </option>");
			}else{
				$('#domain_role').append("<option value='guest'>普通用户 </option>");
			} */
			$('#tcauRole').empty();
			$('#tcauRole').append("<option value='admin'>系统管理员</option><option value='guest'>普通用户 </option>");
		}
		var superAdmin = false;
		/*
		 *@author xianing 
		 *输入字符串返回字符串的长度
		 */
		function len(s) {
			 var l = 0;
			 var a = s.split("");
			 for (var i=0;i<a.length;i++) {
			  if (a[i].charCodeAt(0)<299) {
			   l++;
			  } else {
			   l+=2;
			  }
			 }
			 return l;
			}
		
		</script>
</body>
</html>