<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="index-elements/index_top.jsp"></jsp:include>
<div id="container">
	<jsp:include page="index-elements/index_sidebar.jsp" />
	<div class="main">
		<div class="class_type">
			<img src="Images/class_type.gif" alt="新闻中心" />
		</div>
		<div class="content">
			<ul class="class_date" >
				<!--遍历 显示topic list -->
				<li id='class_month' style="float: left;"><a href="NewsServlet"><b>全部</b> </a>
					<c:forEach var="listtopic" items="${listtopic }">
					<li id='class_month' style="float: left;"><a href="NewsServlet?action=shousou&tid=${listtopic.tid }"><b>${listtopic.tname }</b> </a> <!--遍历 显示topic list -->
				</c:forEach>
			</ul>

			<ul class="classlist">
			
				<!-- 遍历显示 news list  -->
				<c:forEach var="news" items="${newslist}">
				<li><a href="NewsServlet?action=danews&nid=${news.nid}">${news.ntitle } </a> <span>${news.ncreatedate}</span></li>
				</c:forEach>
				<!-- 遍历显示 news list  -->

				<!-- 分页显示 -->
				<p align="right">
					当前页数:[ ${pageno }  /${mwei}  ]&nbsp;&nbsp; <a
						href="NewsServlet?action=${actn }&pageno=1">首页</a><a
						href="NewsServlet?action=${actn }&pageno=${peve}">&nbsp;&nbsp;上一页</a><a
						href="NewsServlet?action=${actn }&pageno=${nest}">&nbsp;&nbsp;下一页</a> <a
						href="NewsServlet?action=${actn }&pageno=${mwei}">&nbsp;&nbsp;末页</a>
				</p>

			</ul>
		</div>
		<jsp:include page="index-elements/index_rightbar.html" />
	</div>
</div>

<jsp:include page="index-elements/index_bottom.html" />
