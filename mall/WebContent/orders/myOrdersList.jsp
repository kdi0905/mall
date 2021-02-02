<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.*" %>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
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
 .categoryId { font-size: 40px}
 .categroyIdColor { color: #5E5E5E}
 body{
	background-color: #FAFFFA;
}
</style>	
</head>
<body>
	<div class="container">
		<div style="margin-top: 20px;">
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
<%	//회원 이메일을 찾아서  이메일에 주문된 정보를 찾는다.
	String memberEmail = (String)session.getAttribute("loginMemberEmail");
	Orders orders = new Orders();
	orders.setMemberEmail(memberEmail);
	//ordersDao 객체를 생성후 주문을 찾고 배열에다 넣기
	OrdersDao ordersDao = new OrdersDao();
	ArrayList<OrdersAndProduct> oapList = new ArrayList<OrdersAndProduct>();
	oapList = ordersDao.selectOrdersList(orders);
%>

	<h1 class="text-secondary" style="text-align: center;">주문 정보</h1>	
	<!-- 왼쪽 상품 번호, 왼쪽 이름 ,상품가격 *개수 , 가운데 사진 , 오른쪽 수량,오른쪽가격,오른쪽밑 주문날짜 ,맨오른쪽 주문상태 및 취소  -->
		<table class="table " style="text-align: center;">
				<%
					for(OrdersAndProduct oap : oapList){
						%>
						<tr><!-- 위아래 정렬 :class="align-middle" -->
							<td class="align-middle"><span class="categoryId categroyIdColor" ><%=oap.orders.getProductId()%></span><%=oap.product.getProductName()%>(<%=oap.product.getProductPrice() %>원*<%=oap.orders.getOrdersAmount() %>개)		
							</td>
							<td class="align-middle">
								<div style="text-align: center;"><img src="/mall-admin/images/<%=oap.product.getProductPic() %>" width="100" height="100"></div>
							</td>
							<td class="align-middle"> 
								<span>수량:<%=oap.orders.getOrdersAmount() %>개</span><br>
								<span>가격:<%=oap.orders.getOrdersPrice() %>원</span><br>
								<span>주문 날짜 : <%=oap.orders.getOrdersDate() %></span>
							</td>
							<td class="align-middle">
								<span>주소<br><%=oap.orders.getOrdersAddr() %></span><br>
								
							</td>
							<td class="align-middle">
							<span><%=oap.orders.getOrdersState() %></span>
							</td>
							<td class="align-middle">
							<a class ="text-danger" href="<%=request.getContextPath()%>/orders/updateOrdersByDelete.jsp?ordersId=<%=oap.orders.getOrdersId()%>">상품 취소</a>
						<tr>						
						<%
					}								
				%>		
		</table>
	</div>
</body>
</html>