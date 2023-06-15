<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<!-- jquery -->	
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<!-- 부트스트랩 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

</head>

<body>
	<div id="wrap">
		
		<!-- 개인블로그 해더 -->
		<c:import url="/WEB-INF/views/includes/blog-header.jsp"></c:import>

		<div id="content">
			<ul id="admin-menu" class="clearfix">
				<li class="tabbtn"><a href="${pageContext.request.contextPath}/${sessionScope.uInfo.id}/admin/basic">기본설정</a></li>
				<li class="tabbtn selected"><a href="${pageContext.request.contextPath}/${sessionScope.uInfo.id}/admin/category">카테고리</a></li>
				<li class="tabbtn"><a href="${pageContext.request.contextPath}/${sessionScope.uInfo.id}/admin/writeForm">글작성</a></li>
			</ul>
			
			<!-- //admin-menu -->
			
			<div id="admin-content">
			
				<table id="admin-cate-list">
					<colgroup>
						<col style="width: 50px;">
						<col style="width: 200px;">
						<col style="width: 100px;">
						<col>
						<col style="width: 50px;">
					</colgroup>
		      		<thead>
			      		<tr>
			      			<th>번호</th>
			      			<th>카테고리명</th>
			      			<th>포스트 수</th>
			      			<th>설명</th>
			      			<th>삭제</th>      			
			      		</tr>
		      		</thead>
		      		<tbody id="cateList">
		      			<!-- 리스트 영역 -->
	      				<c:forEach items="${cateList}" var="cateVo">
		      				<tr>
								<td id="c-${cateVo.cateNo}">${cateVo.cateNo}</td>
								<td>${cateVo.cateName}</td>
								<td>${cateVo.postCount}</td>
								<td>${cateVo.description}</td>
							    <td class='text-center'>
							    	<a href="" class="delete"><img class="btnCateDel" data-del="${cateVo.cateNo}" data-cnt="${cateVo.postCount}" src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a>
							    </td>
							</tr>
					    </c:forEach>
						<!-- 리스트 영역 -->
					</tbody>
				</table>
      	
		      	<table id="admin-cate-add" >
		      		<colgroup>
						<col style="width: 100px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td class="t">카테고리명</td>
		      			<td><input type="text" name="name" value=""></td>
		      		</tr>
		      		<tr>
		      			<td class="t">설명</td>
		      			<td><input type="text" name="desc"><input type="hidden" name="id" value="${sessionScope.uInfo.id}"></td>
		      		</tr>
		      	</table>
			
				<div id="btnArea">
		      		<button id="btnAddCate" class="btn_l" type="submit" >카테고리추가</button>
		      	</div>
			
			</div>
			<!-- //admin-content -->
		</div>	
		<!-- //content -->
		
		
		<!-- 개인블로그 푸터 -->
		
	
	
	</div>
	<!-- //wrap -->
</body>


<script type="text/javascript">
//삭제 버튼

$("#cateList").on("click", ".btnCateDel", function(){
	console.log("삭제버튼 클릭");
	
	var cateNo = $(this).data("del");
	var postCount = $(this).data("cnt");
	var categoryVo = {
		cateNo : cateNo,
		postCount : postCount
	}
	
	// 삭제 작업 수행
/* 	var cateNo = $deleteButton.closest("tr").find("td[id^='c-']").attr("id").split("-")[1];
    console.log(cateNo);
 */    
    $.ajax({
		url : "${pageContext.request.contextPath}/category/delete",
		type : "post",
		// contentType : "application/json",
		data : categoryVo,
				
		// 데이터 받은 후 
		dataType : "json",
		success : function(jsonResult){
			console.log(jsonResult);
			// 성공시 ㅊㅓㄹㅣㅎㅐㅇㅑ할 코드
			if(jsonResult > 0 ){
				console.log($("#c-"+categoryVo.cateNo).remove());
			}else{
				alert("삭제실패 ㅋ ㅋ")
			}
		},
		error : function(XHR, status, error){
			// 실패
		}
	});
});

$("#btnAddCate").on("click",function(){
	console.log("클릭");
	var id = $("[name = id]").val();
	var cateName = $("[name = name]").val();
	var description = $("[name = desc]").val();
	
	var CategoryVo = {
		id : id,
		cateName: cateName,
		description: description
	};
	console.log(CategoryVo);
	
	var str = JSON.stringify(CategoryVo);

	console.log(str);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/category/add",
		type : "post",
		contentType : "application/json",
		data : str,
				
		// 데이터 받은 후 
		dataType : "json",
		success : function(jsonResult){
			console.log("들어왔니?");
			console.log(jsonResult);
			// 성공시 ㅊㅓㄹㅣㅎㅐㅇㅑ할 코드
			
			if(jsonResult.result == "success"){
				console.log(jsonResult.data);
				
				// 정상 처리
				render(jsonResult.data, "up");	// 리스트에 추가
				
				//등록폼 비우기
				$("[name = 'name' ]").val("");
				$("[name = 'desc' ]").val("");
				
			}else{
				// 오류 처리
				
			} 
		},
		error : function(XHR, status, error){
			// 실패
		}
	}); 
});

// 카테고리 리스트 그리기
function render (CategoryVo, dir){
	var str = "";
	str += '<tr>';
	str += '	<td id="c-'+CategoryVo.cateNo+'">'+ CategoryVo.cateNo +'</td>';
	str += '	<td>'+ CategoryVo.cateName +'</td>';
	str += '	<td>'+ CategoryVo.postCount+'</td>'; 
	str += '	<td>'+ CategoryVo.description+'</td>'; 
	str += '	<td class="text-center">';
	str += '		<a href=""><img class="btnCateDel" src="${pageContext.request.contextPath}/assets/images/delete.jpg"></a>';
	str += '	</td>';
	str += '</tr>';

	
	if(dir == 'up'){
		$("#cateList").prepend(str);
	/* }else if(dir == 'down'){
		$("#cateList").append(str);
	}else{
		console.log("에러요");  */
	} 
}

</script>


</html>