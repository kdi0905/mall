<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<%	
if(session.getAttribute("loginMemberEmail")==null){
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
}

	//주문 상태를 바꾸기 위해 주문 번호를 가져온다
	request.setCharacterEncoding("utf-8");
	int ordersId = Integer.parseInt(request.getParameter("ordersId"));
	
	//가져 온 주문 정보를 orders 객체 안에 넣는다
	Orders orders = new Orders();
	orders.setOrdersId(ordersId);
	// 주문상태를 주문 쉬소하는 명령어를 실행한다
	OrdersDao ordersDao = new OrdersDao();
	ordersDao.updateOrdersStateByDelete(orders);
	
	response.sendRedirect(request.getContextPath()+"/orders/myOrdersList.jsp");
%>