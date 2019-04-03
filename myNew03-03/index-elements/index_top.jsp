<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<title>新闻中国</title>
	
	<link href="CSS/main.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	
	.vf{
	display: none;
	
	}
	</style>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

	<script language="javascript">
		function check(){
			var login_username = document.getElementById("uname");
			var login_password = document.getElementById("upwd");
			if(login_username.value == ""){
				alert("用户名不能为空！请重新填入！");
				login_username.focus();	
				return false;
			}else if(login_password.value == ""){
				alert("密码不能为空！请重新填入！");
				login_password.focus();
				return false
			}
			return true;
		}
		
		function focusOnLogin(){
			var login_username = document.getElementById("uname");
			if( login_username != null )
				login_username.focus();	
		}
		
		
	</script>

</head>
<body onload="focusOnLogin()">
<div id="header">
	<div id="top_login">
	<div id="div1">
	
	<!-- 判断是否登录   session  -->
	<c:if test="${user==null}">
		<form action="UsernameServlet?action=dologin" method="post" onsubmit="return check()" id="from"  >
		账号：	<input type="text" id="uname"  name="uname" value="" class="login_input" "/>
			<label> 密&#160;&#160;码 </label>
			<input type="password" id="upwd" name="upwd" value="" class="login_input" />
			<input type="submit" class="login_sub" value="登录"  />
			<label id="error"> </label>
			<img src="Images/friend_logo.gif" alt="Google" id="friend_logo" />
			<span style="margin-left: 20px"><a href="">游客登录</a></span>
		</form>
		</c:if>
	<!-- 判断是否登录   session  -->
	
	</div>
	<!-- 已经登录 --><c:if test="${user!=null}">
		欢迎您：${user.uname}  &nbsp; &nbsp; &nbsp;<a href="${pageContext.request.contextPath}/AdminSerlet?action=doAdmin">登录控制台</a> &nbsp; <a href="UsernameServlet?action=login">退出</a>
	<!-- 已经登录 --></c:if>
  </div>
  <div id="nav">
    <div id="logo"> <a href="NewsServlet"><img src="Images/logo.jpg" alt="新闻中国" />  </a></div>
    <div id="a_b01"> <img src="Images/a_b01.gif" alt="" /> </div>
    <!--mainnav end-->
  </div>
</div>
</body>
</html>
