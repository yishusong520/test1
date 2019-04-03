<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="console_element/top.jsp" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function check() {
		var ntitle = document.getElementById("ntitle");
		var nauthor = document.getElementById("nauthor");
		var nsummary = document.getElementById("nsummary");
		var ncontent = document.getElementById("ncontent");

		if (ntitle.value == "") {
			alert("标题不能为空！！");
			ntitle.focus();
			return false;
		} else if (nauthor.value == "") {
			alert("作者不能为空！！");
			nauthor.focus();
			return false;
		} else if (nsummary.value == "") {
			alert("摘要不能为空！！");
			nsummary.focus();
			return false;
		} else if (ncontent.value == "") {
			alert("内容不能为空！！");
			ncontent.focus();
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">

function delect(cid,cnid){
	
	$.ajax({
		url:'${pageContext.request.contextPath}/AdminSerlet?action=delectcomm2',
		data:{
			cid:cid,
			ctid:cnid
		},
		dataType:'json',
		success:function(result){
			
			$("#tab").empty();
			$.each(result,function(i,commlist){
				var row=$("<tr><td>留言人：</td><td>"+commlist.cauthor+"</td><td>IP：</td><td>"+commlist.cip+"</td><td>留言时间：</td><td>"+commlist.cdate+"</td><td><a ><span onclick='delect("+commlist.cid+","+commlist.cnid+")'>删除</span></a></td></tr><tr><td colspan='6'>"+commlist.ccontent+"</td></tr><tr><td colspan='6'><hr /></td></tr>");
			$("#tab").append($(row));
			});
		}
		
	});
	
}
</script>

<div id="main">
	<jsp:include page="console_element/left.jsp" />
	<div id="opt_area">
		<h1 id="opt_type">添加新闻：</h1>
		<form action="${pageContext.request.contextPath}/AdminSerlet?action=updatenews" method="post" enctype="multipart/form-data" onsubmit='return check()'>
			<p>
				<label> 主题 </label> 
				<select name="ntid">
					 <!-- 迭代输出主题 -->
						<!-- 当前项判断 -->
							<option value='${newsupdate.ntid }' selected="selected">${newsupdate.tname}</option>
						<!-- 当前项判断 -->
						<!-- 其余option -->
						<jsp:useBean id="top" class="cn.yss520.Dao.TopicDao"></jsp:useBean>
						<c:forEach var="topc" items="${top.allTopics }">
					<option value='${topc.tid }'>${topc.tname}</option>
					</c:forEach>
						<!-- 其余option -->
					 <!-- 迭代输出主题 -->
				</select> 
				<input type="hidden" name="nid" value="${newsupdate.nid }" />
			</p>
			<p>
				<label> 标题 </label> <input name="ntitle" type="text"
					class="opt_input" value="${newsupdate.ntitle}" />
			</p>
			<p>
				<label> 作者 </label> <input name="nauthor" type="text"
					class="opt_input" value="${newsupdate.nauthor}" />
			</p>
			<p>
				<label> 摘要 </label>
				<textarea name="nsummary" cols="40" rows="3">${newsupdate.nsummary}</textarea>
			</p>
			<p>
				<label> 内容 </label>
				<textarea name="ncontent" cols="70" rows="10">${newsupdate.ncontent}</textarea>
			</p>
			<p>
				<label> 上传图片 </label> <input name="file" type="file"
					class="opt_input" />
			</p>
			<input type="submit" value="提交" onsubmit='return check()' class="opt_sub" /> <input
				type="reset" value="重置" class="opt_sub" />
		</form>
		<h1 id="opt_type">修改新闻评论：</h1>
		<table width="80%" align="left" id="tab">
			<c:if test="${fn:length(commlist)==0}">
			<!-- 判断： 无评论 -->
				<td colspan="6">暂无评论！</td>
				<tr>
					<td colspan="6"><hr /></td>
				</tr>
			<!-- 判断： 无评论 -->
				</c:if>
			<!-- 判断： 有评论 -->
			<c:if test="${fn:length(commlist)!=0}">
				<!-- 循环输出评论 -->
				<c:forEach var="commlist" items="${commlist}">

					<tr>
						<td>留言人：</td>
						<td>${commlist.cauthor}</td>
						<td>IP：</td>
						<td>${commlist.cip}</td>
						<td>留言时间：</td>
						<td>${commlist.cdate}</td>
						
						<td><a ><span onclick="delect(${commlist.cid},${commlist.cnid}) ">删除</span>
						</a>
						
						</td>
					</tr>
					
					<tr>
						<td colspan="6">${commlist.ccontent}</td>
					</tr>
					
					<tr>
						<td colspan="6"><hr /></td>
					</tr>

					</c:forEach>
</c:if>
				<!-- 循环输出评论 -->
		   <!-- 判断： 有评论 -->
		</table>
	</div>
	
</div>

<jsp:include page="console_element/bottom.html" />
