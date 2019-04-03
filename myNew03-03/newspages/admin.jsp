<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="console_element/top.jsp" />
<script language="javascript">
	function clickdel() {
		return confirm("删除请点击确认");
	}
</script>


<div id="main">
	<jsp:include page="console_element/left.jsp" />
	<div id="opt_area">
		<ul class="classlist">
	<c:forEach var="top" items="${topic}">
			<!-- 遍历   news list -->
			<li class='space'><strong>${top.tname}</strong></li>
			<c:forEach var="neww" items="${top.newsList}">
			<li>${neww.ntitle}<span> 作者：${neww.nauthor }&#160;&#160;&#160;&#160; 
			<a href='${pageContext.request.contextPath}/AdminSerlet?action=newupdate&nid=${neww.nid}'>修改</a> &#160;&#160;&#160;&#160; <a
					href='${pageContext.request.contextPath}/AdminSerlet?action=delect&nid=${neww.nid}'
					onclick='return clickdel()'>删除</a>
			</span>
			</li>
			</c:forEach>
			<!-- 遍历   news list -->
</c:forEach>
			<!-- 分页处理 -->
			<p align="right">
				当前页数:[${benn.pageno } /${benn.count} ]&nbsp;&nbsp;
				 <a href="${pageContext.request.contextPath}/AdminSerlet?action=doAdmin&pageno=1">首页</a>
				 <a href="${pageContext.request.contextPath}/AdminSerlet?action=doAdmin&pageno=${benn.prec} ">&nbsp;&nbsp;上一页</a>
				 <a href="${pageContext.request.contextPath}/AdminSerlet?action=doAdmin&pageno=${benn.next} ">&nbsp;&nbsp;下一页</a> 
				 <a href="${pageContext.request.contextPath}/AdminSerlet?action=doAdmin&pageno=${bn}">&nbsp;&nbsp;末页</a>
			</p>
		</ul>
	</div>
</div>

<jsp:include page="console_element/bottom.html" />
