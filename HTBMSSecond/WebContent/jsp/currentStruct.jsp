<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="hs.bm.vo.OperationConstruct" %>
<article class="col-sm-12 col-md-12 col-lg-12">
    <div class="jarviswidget well" id="wid-id-100">

        <header>
            <span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
            <h2></h2>
        </header>

        <div class="padding-10" style="height:40px">

            <div class="jarviswidget-editbox">

            </div>

            <div class="widget-body">
				<span id="qq">
				
				<%
                    OperationConstruct oc = (OperationConstruct) session.getAttribute("OperationConstruct");

                    if (oc == null) {
                %>
					当前结构：无
					<%
                    } else if (oc.getSection_id() != null) {
                    %>
					当前结构 : <%=oc.getSection_name()%>  <%=oc.getNo() + "-" + oc.getName()%>
					<%
                        if (oc.getPrj_id() != null) {
                            String state = "未完成";
							
                            if (oc.getPrj_state() != null && oc.getPrj_state().equals("1")) {
                                state = "已结束";
                            }
                            if (oc.getPrj_state() != null && oc.getPrj_state().equals("2")) {
                                state = "已过期";
                            }
                    %>
					<label class="label label-info">当前项目：<%=oc.getPrj_desc() %>-<%=state%></label>
					<%} else {%>
					<label class="label label-danger">当前项目：无</label>
					<%} %>
					<%
                    } else {
                    %>
					当前结构 : <%=oc.getLine_name()%>> <%=oc.getName()%>
					<%
                        }
                    %>
				</span>
                <div class="pull-right" id="qqq">
                    <%
                        if (oc == null) {
                        } else {
                    %><a class="btn btn-primary btn-xs" onclick="gotoCard()">查看卡片</a>
                    <a class="btn btn-primary btn-xs" onclick="gotoMem()">查看构件</a>
                    <%} %>
                </div>
            </div>

        </div>

    </div>
</article>
<script>
    //打开卡片信息
    function gotoCard() {
        <%if(oc==null){}else if(oc.getMode().equals("bridge")){
        %>window.location.href = ("brgCard.jsp#add=false");
        <%}else if(oc.getMode().equals("pass")){
        %>window.location.href = ("passCard.jsp#add=false");
        <%}else if(oc.getMode().equals("culvert")){
        %>window.location.href = ("culCard.jsp#add=false");
        <%}%>
    }
    //打开桥梁结构
    function gotoMem() {
        <%if(oc==null){}else if(oc.getMode().equals("bridge")){
            %>window.location.href = ("brgMember.jsp");
        <%}else if(oc.getMode().equals("pass")){
        %>window.location.href = ("passMember.jsp");
        <%}else if(oc.getMode().equals("culvert")){
        %>window.location.href = ("culMember.jsp");
        <%}%>
    }
</script>
