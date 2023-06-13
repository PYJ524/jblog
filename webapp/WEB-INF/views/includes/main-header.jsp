<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<body>
	<div id="header">
		<h1>
			<a href="${pageContext.request.contextPath}/"><img class="logo" src="${pageContext.request.contextPath}/assets/images/logo.jpg"></a>
		</h1>
	</div>
	<br><br><br>
	<div id="login">
		<c:if test="${sessionScope.uInfo == null}">
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/user/loginForm">로그인</a> &nbsp; &nbsp; 
					<a href="${pageContext.request.contextPath}/user/joinForm">회원가입</a>
				</li>
			</ul>
		</c:if>
	
		<c:if test="${sessionScope.uInfo != null}">
			<ul>
				<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a> &nbsp; &nbsp; <a href="${pageContext.request.contextPath}/${sessionScope.uInfo.id}" target="_blank">내블로그</a></li>
			</ul>
		</c:if>
	</div>
	<!-- //header -->
</body>