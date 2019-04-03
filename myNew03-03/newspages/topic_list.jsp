<%@ page language="java" import="java.util.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="console_element/top.jsp" />

<script language="javascript">
	function clickdel() {
		return confirm("删除后，主题下的文章也会删除，确认删除吗？");
	}
</script>


<div id="main">
	<jsp:include page="console_element/left.jsp" />
	<div id="opt_area">
		<ul class="classlist">
			<!-- 遍历  topic list -->
			
			<c:forEach var="top" items="${alltopics }">
			<li>&#160;&#160;&#160;&#160;${top.tname} &#160;&#160;&#160;&#160; <a
				href='${pageContext.request.contextPath}/AdminSerlet?action=upde&tid=${top.tid }&tname=${top.tname }'>修改</a>
				&#160;&#160;&#160;&#160; <a
				href='${pageContext.request.contextPath}/AdminSerlet?action=delecttopic&tid=${top.tid }'
				onclick='return clickdel()'>删除</a>
			</li>
			</c:forEach>
			<!-- 遍历  topic list -->
			
			<!-- 显示分页 -->
			<p align="right">
				当前页数:[${bn.pageno}/${bn.count }]&nbsp;&nbsp; <a
					href="AdminSerlet?action=uptopic&pageno=1">首页</a><a
					href="AdminSerlet?action=uptopic&pageno=${bn.prec}">&nbsp;&nbsp;上一页</a><a
					href="AdminSerlet?action=uptopic&pageno=${bn.next}">&nbsp;&nbsp;下一页</a> <a
					href="AdminSerlet?action=uptopic&pageno=${wei }">&nbsp;&nbsp;末页</a>
			</p>
		</ul>
	</div>
</div>


<jsp:include page="console_element/bottom.html" />
