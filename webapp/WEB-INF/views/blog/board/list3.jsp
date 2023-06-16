<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css"
	rel="stylesheet" type="text/css">

<style type="text/css">
.cell-space {
	white-space: pre-wrap;
}
</style>

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
				<h3>게시판</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>게시판</li>
						<li class="last">일반 게시판</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->

			<div id="board">
				<div id="list">
					<form action="${pageContext.request.contextPath}/board/list" method="get">
						<div class="form-group text-right">
							<input type="text" name="keyword" value="">
							<button type="submit" id=btn_search>검색</button>
						</div>
					</form>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>조회수</th>
								<th>작성일</th>
								<th>관리</th>
							</tr>
						</thead>
						<c:forEach items="${pMap.bList}" var="boardVo">
							<tbody>
								<tr>
									<td>${boardVo.no}</td>
									<td class="text-left"><a
										href="${pageContext.request.contextPath}/board/read?no=${boardVo.no}">${boardVo.title}</a></td>
									<td>${boardVo.name}</td>
									<td>${boardVo.hit}</td>
									<td>${boardVo.regDate}</td>
									<c:if test="${sessionScope.uInfo.no == boardVo.userNo}">
										<td><a href="${pageContext.request.contextPath}/board/delete?no=${boardVo.no}">[삭제]</a></td>
									</c:if>
								</tr>
							</tbody>
						</c:forEach>
					</table>

					<div id="paging">
						<ul>
							<c:if test="${pMap.prev == true}">
								<li><a href="${pageContext.request.contextPath}/board/list?crtPage=${pMap.startPageBtnNo-1}&keyword=${pMap.keyword}">◀</a></li>
							</c:if>
							<c:forEach begin="${pMap.startPageBtnNo}" end ="${pMap.endPageBtnNo}" step="1" var="page">
								<li><a href="${pageContext.request.contextPath}/board/list?crtPage=${page}&keyword=${pMap.keyword}">${page}</a></li>
							</c:forEach>
							<c:if test="${pMap.next == true}">
								<li><a href="${pageContext.request.contextPath}/board/list?crtPage=${pMap.endPageBtnNo+1}&keyword=${pMap.keyword}">▶</a></li>
							</c:if>
						</ul>


						<div class="clear"></div>
					</div>
					<c:if test="${sessionScope.uInfo.no != null}">
						<a id="btn_write"
							href="${pageContext.request.contextPath}/board/writeForm">글쓰기</a>
					</c:if>
					
					<c:if test="${sessionScope.uInfo.no == null}">
						<a>${sessionScope.no}</a>
						<a id="btn_write"
							href="${pageContext.request.contextPath}/user/loginForm">글쓰기</a>
					</c:if>
				</div>
				<!-- //list -->
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
