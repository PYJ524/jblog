<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>

</head>

<script type="text/javascript">
	// 아이디 중복체크 버튼 클릭했을 때
	$(window).load(function(){
		
		// 정보 입력 관련 에러
		$("#joinForm").on("submit", function(){
			console.log("전송버튼 클릭");
			
			// 아이디 체크
			var id = $("#txtId").val();
			if(id.length<1){		// 입력안했으면
				alert("ID를 입력해주세요.");			
				return false;
			}else if(id.length>30){
				alert("ID가 길이를 초과했습니다.(30자)");			
				return false;
			}
			
			// 패스워드 체크
			var pass = $("#txtPassword").val();
			console.log(pass)
			if(pass.length<1){
				alert("Password가 입력되지 않았습니다.");			
				return false;
			}else if(pass.length < 6 || pass.length > 30){
				alert("Password가 길이가 맞지 않습니다.(6~30자)");			
				return false;
			}
			
			// 이름 체크
			var name = $("#txtUserName").val();
			if(name.length<1){
				alert("이름을 입력해주세요.");			
				return false;
			}
			
			// 약관동의 체크
			var agree = $("#chkAgree").is(":checked");
			if(agree == false){
				alert("약관에 동의해 주세요.");
				return false;
			}
			
			return true;
		});
		
		$("#btnIdCheck").on("click",function(){
			console.log("버튼클릭");
			var id = $("[name=id]").val();
			console.log(id);
			$.ajax({
				url : "${pageContext.request.contextPath}/user/checkId" ,
				type : "post",
				/* contentType : "application/json", */
				data : {id : id} , 
				
				dataType : "json" ,
				success : function(jsonResult){
					console.log(jsonResult);
					if(jsonResult.result == 'success'){	
						if (jsonResult.data == true) {
						//성공시 처리해야될 코드 작성
							$("#resultId").html("<font size ='2' color = 'black' id='idcheckMsg'>사용할 수 있는 아이디입니다.</font>");
						} else {
							// 여기에 실패 메시지를 출력하는 코드를 추가할 수 있습니다.
							$("#resultId").html("<font size ='2' color = 'red' id='idcheckMsg'>다른 아이디로 가입해 주세요.</font>");
						}
					}else{
						var msg = jsonResult.failMsg;
						alert(msg);
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});  
			// html("<font size ='2' color = 'grey' id='idcheckMsg'>사용할 수 없는 아이디입니다.</font>")
		});
	});
</script>

<body>
	<div id="center-content">
		
		<!-- 메인 해더 -->
		<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
		
		<br><br>
		
		<div>		
			<form id="joinForm" method="post" action="${pageContext.request.contextPath}/user/join?fileName=spring-logo.jpg">
				<table>
			      	<colgroup>
						<col style="width: 100px;">
						<col style="width: 170px;">
						<col style="">
					</colgroup>
		      		<tr>
		      			<td><label for="txtId">아이디</label></td>
		      			<td><input id="txtId" type="text" name="id"></td>
		      			<td><button id="btnIdCheck" type="button">아이디체크</button></td>
		      		</tr>
		      		<tr>
		      			<td></td>
		      			<td id="resultId" colspan="2"></td>
		      		</tr> 
		      		<tr>
		      			<td><label for="txtPassword">패스워드</label> </td>
		      			<td><input id="txtPassword" type="password" name="password"  value=""></td>   
		      			<td></td>  			
		      		</tr> 
		      		<tr>
		      			<td><label for="txtUserName">이름</label> </td>
		      			<td><input id="txtUserName" type="text" name="userName" value=""></td>   
		      			<td></td>  			
		      		</tr>  
		      		<tr>
		      			<td><span>약관동의</span> </td>
		      			<td colspan="3">
		      				<input id="chkAgree" type="checkbox" name="agree" value="y">
		      				<label for="chkAgree">서비스 약관에 동의합니다.</label>
		      			</td>   
		      		</tr>   		
		      	</table>
	      		<div id="btnArea">
					<button id="btnJoin" class="btn" type="submit" >회원가입</button>
				</div>
			</form>
		</div>
		<!-- 메인 푸터  자리-->
		<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
	</div>
</body>
</html>