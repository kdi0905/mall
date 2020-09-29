<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="dao.*" %>
<%@ page import ="java.util.*" %>
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
.noticbg {
	background-color: #F6F6F6;
}
</style>
</head>
<body>
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>
		<%
			//카테고리 를 골라 제품을 보여준다
			//카테고리 번호를 페이지에서 받아온다. -> 받아온 카테고리 번호를 product메서드에 값을 넣는다 
			request.setCharacterEncoding("utf-8");
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			Product product = new Product();
			product.setCategoryId(categoryId);
			//리스트를 가져오기 위해서 array리스트 (배열)을 사용하고 dao에서 데이터베이스 값을 찾은뒤 배열안에 넣고 배열을 돌리면서 출력을한다.
			//제품 목록 가져와서 출력하기
			ProductDao productDao = new ProductDao();
			//ArrayList안에 Product변수 공간을 생성한다, 선택한 카테고리 제품 전체 출력 메서드를 찾아 넣는다
			ArrayList<Product> productList = productDao.selectProductbycategoryIdAll(product);
			
			//카테고리 끼리 출력 이름
			Category category =new Category();
			category.setCategoryId(categoryId);
			CategoryDao categoryDao = new CategoryDao();
		  categoryDao.selectCategoryOne(category);
		%>
		
		<h1><%=category.getCategoryName() %></h1>
		<div> <!-- 상품 카드로 출력 -->
			<table class="table table-borderless" style="text-align: center;">
				<tr>
					
					<%
						int i = 0;

					for (Product p : productList) {
						i = i + 1;
					%>
					<td>
						<div style="text-align: center;">
						<div class="card" style="width: 200px ;" >
							<img class="card-img-top"
								src="/mall-admin/images/<%=p.getProductPic()%>"
								alt="Card image" width="150" height="150">
							<div class="card-body">
								<h4 class="card-title">
									<a class="text-secondary"
										href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName()%></a>
								</h4>
								<p class="card-text"><%=p.getProductPrice()%></p>

							</div>
						</div>
					</div>
					</td>
					<%
						if (i % 4 == 0) {
					%>

				</tr>
				<tr>
					<%
						}

					}
					%>
				</tr>


			</table>
		</div>
	</div>
</body>
</html>