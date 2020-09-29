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
</style>
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		<%
			request.setCharacterEncoding("utf-8");
		int productId = Integer.parseInt(request.getParameter("productId"));
		ProductDao productDao = new ProductDao();
		Product product = productDao.selectProductOne(productId);
		%>
		
		<h1 class="text-secondary" style="text-align: center;">상품 상세보기</h1>
		<!-- 주문하기 -->

		<!-- 상세보기 테이블 -->
		<table class="table"  style="text-align: center;">
			<tr>
				<td class="align-middle">product_id</td>
				<td><%=product.getProductId()%></td>
			</tr>
			<tr>
				<td class="align-middle">product_pic</td>
				<td class="align-middle"><img width=" 150" height=" 150"
					src="/mall-admin/images/<%=product.getProductPic()%>"></td>
			</tr>
			<tr>
				<td class="align-middle">product_name</td>
				<td class="align-middle"><%=product.getProductName()%></td>
			</tr>
			<tr>
				<td class="align-middle">product_content</td>
				<td class="align-middle"><%=product.getProductContent()%></td>
			</tr>
			<tr>
				<td class="align-middle">product_price</td>
				<td class="align-middle"><%=product.getProductPrice()%></td>
			</tr>
			<tr>
				<td class="align-middle">product_soldout</td>
				<td class="align-middle"><%=product.getProductSoldout()%></td>
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
					
					<td>상품 개수<select name="productAmount">
							<%
								for (int i = 1; i < 11; i = i + 1) {
							%>
							<option value="<%=i%>"><%=i%>
							</option>
								<%
									}
								%>
							
					</select>개</td>
				</tr>
				<tr>
					<td> 배송 주소: <input width="300" type="text" name="ordersAddr"></td>
				<tr>
			</table>
			<div style="text-align: right ;">
				<button class="btn btn-outline-secondary" type="submit">주문</button>
			</div>
		</form>
	</div>

</body>
</html>