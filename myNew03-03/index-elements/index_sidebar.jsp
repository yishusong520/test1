<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="sidebar">
    <h1> <img src="Images/title_1.gif" alt="国内新闻" /> </h1>
    <div class="side_list">
      <ul>
      <c:forEach var="dom" items="${Domestic}">
        <!-- 国内新闻 -->
     		<li> <a href='NewsServlet?action=danews&nid=${dom.nid}'><b>
 		${fn:substring(dom.ntitle,0,12)}...
     		 </b></a> </li>
      	<!-- 国内新闻 -->
      	</c:forEach>
      </ul>
    </div>
    <h1> <img src="Images/title_2.gif" alt="国际新闻" /> </h1>
    <div class="side_list">
<c:forEach var="foreign" items="${foreign }">
        <!-- 国际新闻 -->
     		<li> <a href='NewsServlet?action=danews&nid=${foreign.nid}'><b>
     		${fn:substring(foreign.ntitle,0,12)}...
     		</b></a> </li>
		<!-- 国际新闻 -->
		</c:forEach>
		
      </ul>
    </div>
    <h1> <img src="Images/title_3.gif" alt="娱乐新闻" /> </h1>
    <div class="side_list">
      <ul>
<c:forEach var="entertainment" items="${entertainment }">
         <!-- 娱乐新闻 -->
     		<li> <a href='NewsServlet?action=danews&nid=${entertainment.nid}'><b>
     		${fn:substring(entertainment.ntitle,0,12)}...
     		</b></a> </li>
      	 <!-- 娱乐新闻 -->
      	 </c:forEach>
      </ul>
    </div>
  </div>

