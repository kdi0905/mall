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

	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	<div class="container">
		<h1>로그인</h1>
		<form method="post"
			action="<%=request.getContextPath()%>/member/loginAction.jsp" id="loginForm">
			<table class="table " style="text-align: center;">
				<tr>
					<td>이메일</td>
					<td><input type="text" name="memberEmail" value ="1234@goodee.com" id="memberEmail"></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="memberPw" value ="1234" id="memberPw"></td>
				</tr>

			</table>
			<button class="btn btn-secondary " type="button" id="btn">로그인</button>

		</form>
	</div>
</body>
</html>