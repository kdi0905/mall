<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import ="java.util.*" %>
<%
	if(session.getAttribute("loginMemberEmail")==null){
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
	}


%>
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
	.px {
		font-size : 40px;
	}
	</style>
</head>
<body>
	<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	
	<%
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		member = memberDao.selectMemberOne(session.getAttribute("loginMemberEmail"));
		//비밀번호 수정하기 초기값 0일때 수정버튼 1일때 비밀번호변경 페이지
		int pwCount = 0;
		if(request.getParameter("pwCount")!=null){
			pwCount = Integer.parseInt(request.getParameter("pwCount"));
		}
		//현재 비밀번호가 다를경우 초기값 Y 다를경우 N으로 값이 들어간다. 
		String failNowPw = "Y";
		if(request.getParameter("failNowPw")!=null){
			failNowPw = request.getParameter("failNowPw");
		}
		
		//변경할 비밀번호가 서로 다를경우
		String failNewPw="Y";
		if(request.getParameter("failNewPw")!=null){
			failNewPw = request.getParameter("failNewPw");
		}
	%>
	<h1 class="text-secondary" style="text-align: center;">회원 정보</h1>	
	<!-- 회원정보를 입력하고 수정을 누르면 데이터베이스를 수정을 한다. -->
	<form method="post" action="<%=request.getContextPath() %>/member/updateMemberOneAction.jsp">
		<table class ="table" style="text-align: center;">
			<tr>
				<td class="align-middle">이메일</td>
				<td><%=member.getMemberEmail() %></td>
			</tr>
			<tr>
				<td class="align-middle">이름</td>
				<td><%=member.getMemberName() %></td>
			</tr>
			
			<tr>
				<td class="align-middle">비밀번호</td>
				<td><%if(pwCount ==0){ %>
					<a class="btn btn-outline-secondary" href="<%=request.getContextPath()%>/member/selectMemberOne.jsp?pwCount=1" >수정</a>
					<%}else if(pwCount ==1){ %>
					<div> 현재 비밀번호를 입력해주세요.</div>
						<input type ="text" name="nowPw"><br>
						<!-- 현재 비밀번호랑 로그인된 이메일 비밀번호랑 다르면 다시입력 메시지 -->
						<%if(failNowPw.equals("N")){
							%>
							<div>현재 비밀번호를 다시 입력해주세요</div>
						<%}else{
							%><br>
							<%} %>
						
						
						<div> 새로운 비밀번호를 입력해주세요.</div>
						<input type ="text" name="newPw">
						<div></div>
						
						
								
						<div> 새로운 비밀번호를 한번 더 입력해주세요.</div>
						<input type ="text" name="newPw2"><br>
						<!-- 변경할 비밀번호가 서로 다르면 -->
						<%if(failNewPw.equals("N")){
							%>
							<div>새로운 비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>
						<%}else{
							%><br>
							<%} %>
						
						<div><button type ="submit" >확인</button></div>								
					<%} %>
				</td>
					
		</table>
	</form>
	 <!-- 주문정보 보기 -->
	 <%
	 Orders orders= new Orders();
	 orders.setMemberEmail(member.getMemberEmail());
	 OrdersDao ordersDao = new OrdersDao();
	 ArrayList<Orders> ordersList = ordersDao.selectOrdersList(orders);
	 
	 
	 
	 
	 %>
	</div>
</body>
</html>