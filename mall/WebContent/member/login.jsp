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
	<style >
		body{
			background-color: #FAFFFA;
		}
	</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#btn").click(function(){
				//유효성 검사 코드 구현
				if($("#memberEmail").val().length<4){
					alert("이메일확인");
					return;
				}else if($("#memberPw").val().length<4){
					alert("비밀번호 확인");
					return;
				}
				$("#loginForm").submit();
			});
			
		});
	
	</script>
</head>
<body>
	<%
		if (session.getAttribute("loginMemberEmail") != null) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	%>
<div class="container">
	<div style="margin-top: 20px;">
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	
		<div style="margin-top: 30px;" class="text-center">
			<h1  class="text-dark">로그인</h1>
		</div>
		<div style="margin: auto;" class="col-4">
			<form method="post" action="<%=request.getContextPath()%>/member/loginAction.jsp" id="loginForm">
						<div style="margin-top: 50px; "class="text-center">
							<span style=" font-size: 20px;"><strong>이메일</strong></span>
							<input type="text" width="100" style="margin-top: 10px;" class="form-control" name="memberEmail" value ="1234@goodee.com" id="memberEmail">
						</div>
						<div style="margin-top: 20px;margin-bottom: 5px;" class="text-center">
							<span style=" font-size: 20px;"><strong>비밀번호</strong></span>
							<input type="password"  style="margin-top: 10px;"   class="form-control" name="memberPw" value ="1234" id="memberPw">					
						</div>
				<div class="text-center" style="margin-top: 30px;">
					<button class="btn btn-secondary "  type="button" id="btn">로그인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>