<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">


</head>
<body>
	<div id="center-content">
		
		<!-- 메인 해더 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
		<br><br>
		
		<div id="joinSucceess">		
			<p class="welcome-message">
				<span> 감사합니다.<br>
					   회원 가입 및 블로그가 성공적으로 만들어 졌습니다.
			    </span>
			<br><br>
			<a href="${pageContext.request.contextPath}/user/loginForm">[로그인 하기]</a>
			</p>
		</div>
		
		
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
		
	</div>
</body>
</html>
