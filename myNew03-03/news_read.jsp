<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="index-elements/index_top.jsp" />

<link href="CSS/read.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
function checkComment() {
	var cauthor = document.getElementById("cauthor");
	var content = document.getElementById("ccontent");
	if (cauthor.value == "") {
		alert("用户名不能为空！！");
		return false;
	} else if (content.value == "") {
		alert("评论内容不能为空！！");
		return false;
	}
	return true;
}



</script>

<div id="container">
	<jsp:include page="index-elements/index_sidebar.jsp"></jsp:include>
	<div class="main">
		<div class="class_type">
			<img src="Images/class_type.gif" alt="新闻中心" />
		</div>
		<div class="content">
			<ul class="classlist">
				<table width="80%" align="center">
					<tr width="100%">
						<td colspan="2" align="center">
							<!-- news title -->
							${newsutil.ntitle }
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<hr />
						</td>
					</tr>
					<tr>
						<td align="center">
							作者:${newsutil.nauthor } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							类型：
							<a href="NewsServlet?action=shousou&tid=${newsutil.ntid }">${newsutil.tname }<!-- tname -->
							</a>
						</td>
						<td align="left">
							发布时间:${newsutil.ncreatedate } <!-- ncreatedate -->
						</td>
					</tr>
					<tr>
						<td align="right">
							<strong>摘要：${newsutil.nsummary }<!-- nsummary --></strong>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"></td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- ncontent -->
							${newsutil.ncontent }
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<hr />
						</td>
					</tr>
				</table>
			</ul>
			<ul class="classlist">
				<table width="80%" align="center" id="tab01">
					<c:if test="${fn:length(commentlist)==0}">
					<!--  暂无评论！ -->
						<td colspan="6">
							暂无评论！
						</td>
						<tr>
							<td colspan="6">
								<hr />
							</td>
						</tr>
						</c:if>
						<!--  -->
					<!-- 有评论 -->
						<c:if test="${fn:length(commentlist)!=0}">
						<!-- 遍历评论列表 --><c:forEach var="comment" items="${commentlist}">
							<tr>
								<td>
									留言人：	
								</td>
								<td>
								${comment.cauthor}
									
								</td>
								<td>
									IP地址：	${comment.cip}
								</td>
								<td>
									
								</td>
								<td>
									留言时间：
								</td>
								<td>
									${comment.cdate}
								
								</td>
							</tr>
							<tr>
								<td colspan="6">
								留言内容：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									${comment.ccontent}
								
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<hr />
								</td>
							</tr>
							</c:forEach>
						<!-- 遍历评论列表 -->
						</c:if>
					<!-- 有评论 -->
				</table>
			</ul>
			<ul class="classlist">
				<form>
				<input type="hidden" id="nid" name="nid" value="${newsutil.nid }">
					<table width="80%" align="center">
						<tr>
							<td>
								评 论
							</td>
						</tr>
						<tr>
							<td>
								用户名：
							</td>
							<td>
								<input id="cauthor" name="cauthor" value="这家伙很懒什么也没留下" />
								IP：
								<input id="cip" name="cip" value="${ip }" readonly="readonly"  />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea id="ccontent" name="ccontent" cols="70" rows="10"></textarea>
							</td>
						</tr>
						<td>
							<input name="submit" id="submit" onclick="clicksubmit()"  value="发  表" type="button" />
						</td>
					</table>
				</form>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">

function clicksubmit(){
	$.ajax({
		url:'NewsServlet?action=action03',
		type:'post',
		data:{
			nid:$('#nid').val(),
			cauthor:$('#cauthor').val(),
			cip:$('#cip').val(),
			ccontent:$('#ccontent').val(),
		},
		dataType:'json',
		success:function(result){
			
			$("#tab01").empty();
			$.each(result,function(i,comments){
				var row=$("<tr><td>留言人：</td><td>"+comments.cauthor+"</td><td>IP：</td><td>"+comments.cip+"</td><td>留言时间：</td><td>"+comments.cdate+"</td></tr><tr><td colspan='6'>"+comments.ccontent+"</td></tr><tr><td colspan='6'><hr/></td></tr>");
				$("#tab01").append($(row));
			});
		}
	});

}
</script>
<%
	request.removeAttribute("news_view");
	request.removeAttribute("comments_view");
%>

<jsp:include page="index-elements/index_bottom.html" />

