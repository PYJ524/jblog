<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
</head>

<body>
	<div id="wrap">
		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>
		<div id="content" class="clearfix">
			<div id="profilecate_area">
				<div id="profile">
					<input type="hidden" id="bListid" value="${bOneList.id}" >
					<input type="hidden" id="lastCateNo" value="${lastCateNo}" >
					
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
					
					
					</ul>
				</div>
			</div>
			<!-- profilecate_area -->
			
			<div id="post_area">
				<!-- //post -->
				
				<!-- 글이 없는 경우 -->
				
				<!-- <div id="postBox" class="clearfix">
					<div id="postTitle" class="text-left"><strong>등록된 글이 없습니다.</strong></div>
					<div id="postDate" class="text-left"><strong></strong></div>
					<div id="postNick"></div>
				</div>
			    
				<div id="post" >
				</div> -->
				
				
				<div id="list">
					<div id="listTitle" class="text-left"><strong>카테고리의 글</strong></div>
					<!-- 포스트리스트 -->
					<table id = "postList">
					
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

<script type="text/javascript">


$(document).ready(function() {
	var id = $("#bListid").val()
	
	var UserVo = {
		id : id
	}
	
	// 카테고리 디폴트 리스트
	$.ajax({
		url : "${pageContext.request.contextPath}/category/list",
		type : "post",
		data : UserVo,
		
		dataType : "json",
		success : function(cateList) {
			for (var i = 0; i < cateList.data.length; i++) {
				render(cateList.data[i]);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	//좌측 카테고리 작성
	function render(CateVo) {
		var str = "";
		str += ' <li class="cListC" data-click="'+CateVo.cateNo +'"> <a href="">'+ CateVo.cateName + '</a> </li> ';

		$("#cateList").append(str);

	}
	
	//카테고리 라스트넘버
	var cateNo = $("#lastCateNo").val()
	var cateVo = {
		cateNo : cateNo
	}

	// 포스트 기본 리스트
	$.ajax({
		url : "${pageContext.request.contextPath}/post/list",
		type : "post",
		data : cateVo,
		
		dataType : "json",
		success : function(PostList) {
			console.log(PostList);
			for (var i = 0; i < PostList.data.length; i++) {
				postRender(PostList.data[i]);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	function postRender(PostList) {
		var str = "";
		str += ' <tr> ';
		str += ' 	<td class="text-left pListC" data-click="'+PostList.postoN+'"><a href="">'+PostList.postTitle+'</a></td> '
		str += ' 	<td class="text-right" style="text-align: right;">'+PostList.regDate+'</td> '
		str += ' </tr> '

		$("#postList").append(str);
	}
	
	
	// 기본 포스트 글
	$.ajax({
		url : "${pageContext.request.contextPath}/post/oneList",
		type : "post",
		data : UserVo,
		
		
		dataType : "json",
		success : function(PostVo) {
			console.log(PostVo);
			pLastRender(PostVo);
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
	function pLastRender(PostVo) {
		var str = "";
		
		str += '<div id="postBox" class="clearfix">'
		str += '	<div id="postTitle" class="text-left"><strong>'+PostVo.data.postNo+'.'+PostVo.data.postTitle+'</strong></div>'
		str += '	<div id="postDate" class="text-left"><strong>'+PostVo.data.regDate+'</strong></div>'
		str += '	<div id="postNick">'+ PostVo.data.userName +'('+PostVo.data.id+')님</div>'
		str += '</div>'
		<!-- //postBox -->
		
		str += '<div id="post"> '
		str += PostVo.data.postContent
		str += '</div>'
		//////////////

		$("#post_area").prepend(str);
	}
}); // 페이지 로딩시

//
$("")
</script>
</html>