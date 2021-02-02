<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
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
	font-size: 40px;
}
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
		<%
			request.setCharacterEncoding("utf-8");
		int productId = Integer.parseInt(request.getParameter("productId"));
		ProductDao productDao = new ProductDao();
		Product product = productDao.selectProductOne(productId);
		%>
		<div style="margin-top: 30px;">
			<h1 class="text-secondary" style="text-align: center;">상품 상세보기</h1>
		</div>
		
		<!-- 주문하기 -->

		<!-- 상세보기 테이블 -->
		<table class="table"  style="text-align: center;">
			<tr>
				<td class="align-middle">상품번호</td>
				<td><%=product.getProductId()%></td>
			</tr>
			<tr>
				<td class="align-middle">상품사진</td>
				<td class="align-middle"><img width=" 150" height=" 150"
					src="/mall-admin/images/<%=product.getProductPic()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">상품이름</td>
				<td class="align-middle"><%=product.getProductName()%></td>
			</tr>
			<tr>
				<td class="align-middle">상품내용</td>
				<td class="align-middle"><%=product.getProductContent()%></td>
			</tr>
			<tr>
				<td class="align-middle">가격</td>
				<td class="align-middle"><%=product.getProductPrice()%>원</td>
			</tr>
			<tr>
				<td class="align-middle">품절여부</td>
				<% if(product.getProductSoldout().equals("Y")){
					%>
						<td class="align-middle "><span class="badge badge-danger" style="font-size: 15px;"><%=product.getProductSoldout()%></span></td>
					<%
				}
				%>
				<% if(product.getProductSoldout().equals("N")){
					%>
						<td  class="align-middle "><span class="badge badge-success" style="font-size: 15px;"><%=product.getProductSoldout()%></span></td>
					<%
				}
				%>
				
			</tr>
		</table>
		
		<!-- 주문하기 -->
		<form method="post"
			action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp">
			<input type="hidden" value="<%=product.getProductId()%>"
				name="productId"> <input type="hidden"
				value="<%=product.getProductPrice()%>" name="productPrice">
			<table class="table "  style="text-align: right; ">
				<tr>
					
					<td>
						<div class="input-group col-sm-5" style="float: right;" >
							<span style="font-size: 20px;">상품 개수 : &nbsp;</span>
								<select style="width: 150px;" class="form-control" name="productAmount">
									<%
										for (int i = 1; i < 11; i = i + 1) {
									%>
									<option value="<%=i%>"><%=i%>
									</option>
										<%
											}
										%>
								</select>
							<span style="font-size: 20px;" >개</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group col-6" style="float: right;">
						<span style="font-size: 20px;">배송 주소 : &nbsp;</span>
					  	<input width="300" class="form-control" type="text" name="ordersAddr">
					  	</div>
					 </td>
				<tr>
			</table>
			<div style="text-align: right ;">
				<button class="btn btn-outline-success" type="submit">주문</button>
			</div>
		</form>
	</div>

</body>
</html>