<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
	<style>
	body{
		background-color: #FAFFFA;
	}
	</style>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#btn").click(function(){
				if($("#memberEmail").val()==""){
					alert("이메일을 확인하세요");
					return;
				}else if($("#memberPw").val()==""){
					alert("비밀번호를 확인하세요");
					return;
			}else if($("#memberName").val()==""){
				alert("이름을 확인하세요");
				return;
			}
			$("#signupForm").submit();
			});
		});
	
	</script>
</head>
<body>
<div class="container">
	<%
			//로그인 중임에도 이 파일을 접근했을때
		if(session.getAttribute("loginMemberEmail")!=null){
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
	%>
	<div style="margin-top: 20px;">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div style="margin-top: 30px;" class="text-center">
		<h1 class="text-dark">회원가입</h1>
	</div>
	<div style="margin: auto;" class="col-4">
		<form method="post" action="<%=request.getContextPath()%>/member/signupAction.jsp" id="signupForm">
			
			<div style="margin-top: 50px; "class="text-center">
				<span style=" font-size: 20px;"><strong>이메일</strong></span>
				<input type="text" style="margin-top: 10px;" class="form-control" name="memberEmail" id="memberEmail"> 
			</div>
			<div style="margin-top: 20px;margin-bottom: 5px;" class="text-center">
				<span style=" font-size: 20px;"><strong>비밀번호</strong></span>
				<input type="password" style="margin-top: 10px;"   class="form-control" name="memberPw" id="memberPw"> 					
			</div>
			<div style="margin-top: 20px;margin-bottom: 5px;" class="text-center">
				<span style=" font-size: 20px;"><strong>이름</strong></span>
				<input type="text" style="margin-top: 10px;" class="form-control" name="memberName" id="memberName"> 
			</div>
			<div class="text-center" style="margin-top: 30px;">
					<button class="btn btn-secondary" type="button" id="btn" >회원가입</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>