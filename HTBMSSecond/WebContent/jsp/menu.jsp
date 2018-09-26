<%@page import="hs.bm.control.ControlServices"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
String path = request.getRequestURI().toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>华通桥涵管理系统</title>
</head>
<body>
	<!-- Left panel : Navigation area -->
	<!-- Note: This width of the aside area can be adjusted through LESS variables -->
	<aside id="left-panel">
		
		<!-- User info -->
		<div class="login-info">
			<span> 
				
				<a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
					<img src="../img/userman1.png" alt="me" class="online" />
					<span title="${sessionScope.roleName}">
					${sessionScope.realUserName}<%-- (${sessionScope.roleName}) --%>
					</span>
					<!-- <i class="fa fa-angle-down"></i> -->
				</a> 
				<span> <a href="login.jsp" title="登出" data-action="userLogout" data-logout-msg="<h3>确认退出当前用户吗？</h3>"><span style="text-decoration:underline">登出</span><!-- <span class="glyphicon glyphicon-log-out"></span> --></a> </span>
			</span>
		</div>
		<!-- end user info -->

		<!-- NAVIGATION : This navigation is also responsive-->
		<nav>
			<!-- 
			NOTE: Notice the gaps after each icon usage <i></i>..
			Please note that these links work a bit different than
			traditional href="" links. See documentation for details.
			-->
		
			<ul>
				<%
				if(path.endsWith("indexV2.jsp")) {
				%>
				<li class="active">
				<%
				} else {
				%>
				<li>
				<%
				}
				%>
					<a href="indexV2.jsp"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">首页</span></a>
				</li>
				<%
				if(path.endsWith("structMgr.jsp")) {
				%>
				<li class="active">
				<%
				} else {
				%>
				<li>
				<%
				}
				%>
					<a href="structMgr.jsp"><i class="fa fa-lg fa-fw fa-reorder"></i> <span class="menu-item-parent">结构</span></a>
				</li>
				<li>
					<a href="#"><i class="fa fa-lg fa-fw fa-list-alt"></i> <span class="menu-item-parent">检查评定</span></a>
					<ul>
						<%
						if(path.endsWith("prjMgr.jsp")||path.endsWith("prjMgr2.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="prjMgr.jsp">项目</a>
						</li>
						<%
						if(path.endsWith("checkBridge.jsp")||path.endsWith("checkSpan.jsp")||path.endsWith("checkCulvert.jsp")||path.endsWith("checkPass.jsp")||path.endsWith("checkPassSpan.jsp")||path.endsWith("checkCulvertSpan.jsp")|| path.endsWith("imgMgr.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="checkBridge.jsp">检查</a>
						</li>
						<%
							String orgid = (String)session.getAttribute("orgid");
							if(orgid==null){
						%>
						<li>
							<a href="#">评定</a>
							<ul>								
								<%
								if(path.endsWith("eval04.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="eval04.jsp">04评定</a>
								</li>
								<%
								if(path.endsWith("eval11.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="eval11.jsp">11评定</a>
								</li>
							</ul>
						</li>
						<%
							}
						%>
						
						<li>
							<a href="#">审核</a>
							<ul>
								<%
								String username = (String)session.getAttribute("username");
								String role = ControlServices.getBaseRole(username);
								if(role.equals("admin")||role.equals("guest")||role.equals("superAdmin")){
									if(path.endsWith("chkAudit.jsp")) {
									%>
									<li class="active">
									<%
									} else {
									%>
									<li>
									<%
									}
									%>
										<a href="chkAudit.jsp">检查审核</a>
									</li>
									<%
									if(path.endsWith("evalAudit.jsp")) {
									%>
									<li class="active">
									<%
									} else {
									%>
									<li>
									<%
									}
								%>
									<a href="evalAudit.jsp">评定审核</a>
								</li>
									<%
									}else{
								if(path.endsWith("dailyChkAudit.jsp")) {
								%>
								<li class="active">
								<%
									} else {
									%>
								<li>
								<%
								}
								%>
									<a href="dailyChkAudit.jsp">日常检查审核</a>
									</li>
								<%	
								if(path.endsWith("chkAudit.jsp")) {
								%>
								<li class="active">
								<%
									} else {
									%>
								<li>
								<%
								}
								%>
									<a href="chkAudit.jsp">经常检查审核</a>
									</li>	
								<%
								}
								%>		
							</ul>
						</li>
						<%
						if(path.endsWith("reportMgrAll.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="reportMgrAll.jsp">报告</a>
						</li>
					</ul>
				</li>
				
				
				<li>
					<a href="#"><i class="fa fa-lg fa-fw fa-desktop"></i> <span class="menu-item-parent">实时监测</span></a>
					
					<ul>
							<%
								if(role.equals("admin")||role.equals("superAdmin")||role.equals("guest")){
							%>
					<li>
								<a href="#">数据管理</a>
								<ul>
									<%
									if(path.endsWith("dmWeight.jsp")) {
									%>
										<li class="active">
										<%
										} else {
										%>
										<li>
										<%
										}
										%>
										
											<a href="dmWeight.jsp">动态称重</a>
										</li>
										<%
										if(path.endsWith("dmHealth.jsp")) {
										%>
										<li class="active">
										<%
										} else {
										%>
										<li>
										<%
										}
										%>
											<a href="dmHealth.jsp">健康监测</a>
										</li>
										
										<%
										if(path.endsWith("dmWind.jsp")) {
										%>
										<li class="active">
										<%
										} else {
										%>
										<li>
										<%
										}
										%>
											<a href="dmWind.jsp">风速风向</a>
										</li>
										<%
										if(path.endsWith("dmGPS.jsp")) {
										%>
										<li class="active">
										<%
										} else {
										%>
										<li>
										<%
										}
										%>
											<a href="dmGPS.jsp">GPS</a>
										</li>
								</ul>
							</li>
							<% 
						}
							%>
							
						
						
							<%
							if(path.endsWith("monitoringData.jsp")) {
							%>
							<li class="active">
							<%
							} else {
							%>
							<li>
							<%
							}
							%>
								<a href="monitoringData.jsp">分析预警</a>
							</li>
						
					</ul>
				</li>
				
				
				
				<li>
					<a href="#"><i class="fa fa-lg fa-fw fa-pencil-square-o"></i> <span class="menu-item-parent">养护决策</span></a>
					<ul>
						<%
						if(path.endsWith("decStatistics.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="#">统计分析</a>
							<ul>
							<%
								if(path.endsWith("memberStatistics.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="memberStatistics.jsp">构件统计</a>
								</li>
								<%
								if(path.endsWith("defectStatistics.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="defectStatistics.jsp">病害统计</a>
								</li>
								<%
								if(path.endsWith("evalStatistics.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="evalStatistics.jsp">评定统计</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">可视化</a>
							<ul>
								<%
								if(path.endsWith("decVis.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="decVis.jsp">裂缝分布图</a>
								</li>
							</ul>
						</li>
					<!--	<%
							if(path.endsWith("reportMgrAll.jsp")) {
							%>
						 	<li class="active">
							<%
							} else {
							%>
							<li>
							<%
							}
							%>
								<a href="reportMgrAll.jsp">报告管理</a>
							</li>
						 <li>
							<a href="mdTrace.jsp">病害跟踪</a>
						</li>
						<li>
							<a href="mdWarn.jsp">病害预警</a>
						</li> -->
					</ul>
					</li>
				<%
					if(orgid==null){
				%>
				
				<li>
				<a href="#"><i class="fa fa-lg fa-fw fa-inbox"></i> <span class="menu-item-parent">文档管理</span></a>
				<ul>
				<%
				if(path.endsWith("docMgr.jsp")) {
				%>
				<li class="active">
				<%
				} else {
				%>
				<li>
				<%
				}
				%>
					<a href="docMgr.jsp"><span class="menu-item-parent">资料共享</span></a>
				</li>
				<li>
				<a href="#">报告归档</a>
				<ul>
				<%
				if(path.endsWith("reportFiling.jsp")) {
				%>
				<li class="active">
				<%
				} else {
				%>
				<li>
				<%
				}
				%>
					<a href="reportFiling.jsp"><span class="menu-item-parent">归档</span></a>
				</li>
				<%
				if(path.endsWith("reportSearch.jsp")) {
				%>
				<li class="active">
				<%
				} else {
				%>
				<li>
				<%
				}
				%>
					<a href="reportSearch.jsp"><span class="menu-item-parent">查档</span></a>
				</li>
				</ul>
				</li>
				</ul>
				</li>
				
				<%
					}
				%>
				
				<%
				if(role.equals("admin")||role.equals("superAdmin")||role.equals("orgAdmin")){ %>
				<li>
					<a href="#"><i class="fa fa-lg fa-fw fa-puzzle-piece"></i> <span class="menu-item-parent">基础数据</span></a>
					<ul>
						<%
						if(path.endsWith("dicCard.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="dicCard.jsp">卡片</a>
						</li>
												
						<li>
							<a href="#">结构</a>
							<ul>
								<%
								if(path.endsWith("dicBrgType.jsp")||path.endsWith("dicPassType.jsp")||path.endsWith("dicCulType.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicBrgType.jsp">结构类型</a>
									
								</li>
								
								<%
								if(path.endsWith("dicSubStruct.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicSubStruct.jsp">分部结构</a>
								</li>
								<%
								if(path.endsWith("dicComType.jsp")||path.endsWith("dicComType2.jsp")||path.endsWith("dicComType3.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicComType.jsp">部件类型</a>
								</li>
								<%
								if(path.endsWith("dicMember.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicMember.jsp">构件类型</a>
								</li>
								<%
								if(path.endsWith("dicMemberStandard.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicMemberStandard.jsp">标准构件</a>
								</li>
							</ul>
						</li>
							<%
							if(path.endsWith("dicDefect.jsp")) {
							%>
							<li class="active">
							<%
							} else {
							%>
							<li>
							<%
							}
							%>
								<a href="dicDefect.jsp">病害</a>
							</li>
						
						</li>
						<li>
							<a href="#">评定</a>
							<ul>
								<%
								if(path.endsWith("dicEval04.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicEval04.jsp">04评定</a>
								</li>
								<%
								if(path.endsWith("dicEval11.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicEval11.jsp">11评定</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">关联</a>
							<ul>
								<%
								if(path.endsWith("dicBrgStruct.jsp")||path.endsWith("dicBrgStruct04.jsp")||path.endsWith("dicBrgStructCk.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicBrgStruct.jsp">构件-部件</a>
								</li>
								<%
								if(path.endsWith("dicMemEval.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicMemEval.jsp">构件-指标</a>
								</li>
								<%
								if(path.endsWith("dicCommonDefect.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicCommonDefect.jsp">部件-病害</a>
								</li>
							</ul>
						</li>
						<li>
							<a href="#">其他</a>
							<ul>
								
																
								<%
								if(path.endsWith("lineMgr.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="lineMgr.jsp">路线字典</a>
								</li>
								<!-- 
								<%
								if(path.endsWith("manageOrgMgr.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="manageOrgMgr.jsp">管养单位</a>
								</li>
								<%
								if(path.endsWith("manageZoneMgr.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="manageZoneMgr.jsp">管养分区</a>
								</li>
								<%
								if(path.endsWith("manageSectionMgr.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="manageSectionMgr.jsp">下辖路段</a>
								</li>
								 -->
								<%
								if(path.endsWith("dicMemMemberType.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="dicMemMemberType.jsp">构件型号</a>
								</li>
								<%
								if(path.endsWith("defReference.jsp")) {
								%>
								<li class="active">
								<%
								} else {
								%>
								<li>
								<%
								}
								%>
									<a href="defReference.jsp">病害参照</a>
								</li>
							</ul>
						</li>
						
						<!-- <li>
							<a href="dicMaint.jsp">养护维修字典</a>
						</li> -->
					</ul>
				</li>
				<%} %>
				<li>
					<a href="#"><i class="fa fa-lg fa-fw fa-cog"></i> <span class="menu-item-parent">系统管理</span></a>
					<ul>
						<%
						if(role.equals("guest")||role.equals("orgCharge")||role.equals("orgDuty")||role.equals("orgEngineer")){
						if(path.endsWith("account.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="account.jsp">账号管理</a>
						</li>
						<%} %>
						<%
						if(role.equals("admin")||role.equals("superAdmin")||role.equals("orgAdmin")){
						if(path.endsWith("UserAccountManager.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<!-- <li> -->
						<%
						}
						%>
							<!-- <a href="UserAccountManager.jsp">账号管理</a>
						</li> -->
						<%} %>
						
						<%
						if(role.equals("admin")||role.equals("superAdmin")||role.equals("orgAdmin")){
						if(path.endsWith("orgMgr2.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="orgMgr2.jsp">单位管理</a>
						</li>
						<%} %>
						
						<%
						if(role.equals("admin")||role.equals("superAdmin")){
						if(path.endsWith("StaffNumber.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="StaffNumber.jsp">短信通知</a>
						</li>
						<%} %>
						
						<%
						if(role.equals("admin")||role.equals("superAdmin")){
						if(path.endsWith("dataBaseBackUp.jsp")) {
						%>
						<li class="active">
						<%
						} else {
						%>
						<li>
						<%
						}
						%>
							<a href="dataBaseBackUp.jsp">数据备份</a>
						</li>
						
						
						
						<%} %>
						
					</ul>
					<%
				if(path.endsWith("index.html")) {
				%>
				<li class="active">
				<%
				} else {
				%>
				<li>
				<%
				}
				%>
					<a href="index.html"><i class="fa fa-lg fa-fw fa-cube"></i> <span class="menu-item-parent">三维展示</span></a>
				</li>
				</li>
			</ul>
			
		</nav>
		

		<!-- <span class="minifyme" data-action="minifyMenu"> 
			<i class="fa fa-arrow-circle-left hit"></i> 
		</span> -->

	</aside>
	<!-- END NAVIGATION -->
	<script type="text/javascript">
    </script>
</body>
</html>