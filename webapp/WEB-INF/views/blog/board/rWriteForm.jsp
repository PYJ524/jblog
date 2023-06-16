<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
	//enter => <br>
	var text = document.getElementById("textarea").value;
	text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');

	//<br> => enter
	var text = document.getElementById("textarea").value;
	text = text.replaceAll("<br>", "\r\n");
</script>
</head>

<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- //header -->
		
		<c:import url="/WEB-INF/views/include/nav.jsp"></c:import>
		<!-- //nav -->

		<c:import url="/WEB-INF/views/include/aside.jsp"></c:import>
		<!-- //aside -->


		<div id="content">
			<div id="content-head">
				<h3>댓글 게시판</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>게시판</li>
						<li class="last">댓글 게시판</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->
			<div id="board">
				<div id="writeForm">
					<form action="${pageContext.request.contextPath}/rBoard/write" method="get">
						<!-- 제목 -->
						<div class="form-group">
							<label class="form-text" for="txt-title">제목</label>
							<input type="text" id="txt-title" name="title" value="" placeholder="제목을 입력해 주세요">
						</div>
					
						<!-- 내용 -->
						<div class="form-group">
							<textarea id="txt-content" name="content" placeholder="내용을 입력해 주세요"></textarea>
						</div>
						
						<a id="btn_cancel" href="${pageContext.request.contextPath}/rBoard/list">취소</a>
						<button id="btn_add" type="submit" >등록</button>
					</form>
	                <!-- //form -->
				</div>
				<!-- //writeForm -->
			</div>
			<!-- //board -->
		</div>
		<!-- //content  -->
		<div class="clear"></div>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- //footer -->
	</div>
	<!-- //wrap -->
</body>
</html>