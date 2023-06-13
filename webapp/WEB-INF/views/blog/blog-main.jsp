<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">
		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>
		<div id="content" class="clearfix">
			<div id="profilecate_area">
				<div id="profile">
					
					<!-- 기본이미지 -->
					<img id="proImg" src="${pageContext.request.contextPath}/img/${bOneList.logoFile}">
					
					<!-- 사용자업로드 이미지 -->
					<%-- <img id="proImg" src=""> --%>
					<div id="nick">${uOneList.userName}(${uOneList.id})님</div>
					
				</div>
				<div id="cate">
					<div class="text-left">
						<strong>카테고리</strong>
					</div>
					<ul id="cateList" class="text-left">
						<li><a href="$}">미분류</a></li>
						
					</ul>
				</div>
			</div>
			<!-- profilecate_area -->
			
			<div id="post_area">
				
				<!-- <div id="postBox" class="clearfix">
						<div id="postTitle" class="text-left"><strong>08.페이징</strong></div>
						<div id="postDate" class="text-left"><strong>2020/07/23</strong></div>
						<div id="postNick">정우성(hijava)님</div>
				</div> -->
				<!-- //postBox -->
			
				<!-- <div id="post" >
				
				</div> -->
				<!-- //post -->
				
				<!-- 글이 없는 경우 -->
				
				<div id="postBox" class="clearfix">
							<div id="postTitle" class="text-left"><strong>등록된 글이 없습니다.</strong></div>
							<div id="postDate" class="text-left"><strong></strong></div>
							<div id="postNick"></div>
				</div>
			    
				<div id="post" >
				</div>
				
				
				<div id="list">
					<div id="listTitle" class="text-left"><strong>카테고리의 글</strong></div>
					<table>
						<colgroup>
							<col style="">
							<col style="width: 20%;">
						</colgroup>
						
						<!-- <tr>
							<td class="text-left"><a href="">08.페이징</a></td>
							<td class="text-right">2020/07/23</td>
						</tr>
						<tr>
							<td class="text-left"><a href="">07.첨부파일_MultipartResolver</a></td>
							<td class="text-right">2020/07/23</td>
						</tr>
						<tr>
							<td class="text-left"><a href="">06.jquery_ajax</a></td>
							<td class="text-right">2020/07/23</td>
						</tr>
						<tr>
							<td class="text-left"><a href="">05.javaScript</a></td>
							<td class="text-right">2020/07/23</td>
						</tr>
						<tr>
							<td class="text-left"><a href="">04.spring_어플리케이션_아키텍쳐</a></td>
							<td class="text-right">2020/07/23</td>
						</tr> -->
						
						
					</table>
				</div>
				<!-- //list -->
			</div>
			<!-- //post_area -->
			
			
			
		</div>	
		<!-- //content -->
		<div class=></div>
		<c:import url="/WEB-INF/views/includes/blog-footer.jsp"></c:import>
		
	
	
	</div>
	<!-- //wrap -->
</body>
</html>