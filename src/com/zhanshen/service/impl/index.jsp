<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这是欢迎转发页面</title>
<%
	String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	request.setAttribute("path", path);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base href="<%=path%>" />
<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>
<link type="text/css" rel="stylesheet" href="static/css/style.css">
</head>
<body>
	<div id="header">
		<c:choose>
			<c:when test="${empty user}">
				<!-- 分发头部 -->
				<%@ include file="/WebContent/head.jsp"%>
				<!-- 分发头部 -->
			</c:when>
			<c:otherwise>
				<div id="login_success">
					<!-- 分发登录成功 -->
					<span>欢迎<span class="um_span">${user.username }
					</span>光临书城</span>
					<!-- 分发登录成功 -->
				</div>
			</c:otherwise>
		</c:choose>
		<a href="bookServlet?action=page">后台书籍管理</a> <a
			href="jspPage/cart.jsp">购物车</a>
	</div>
	<div id="body">
		<!-- 分发主体内容 -->
		<!--<%@ include file="/WebContent/body.jsp"%>-->
		<!-- 分发主体内容 -->
	</div>
	<div id="footer">
		<!-- 分发脚本 -->
		<%@ include file="/WebContent/footer.jsp"%>
		<!-- 分发脚本 -->
	</div>
</body>
</html>