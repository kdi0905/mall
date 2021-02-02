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
.size{
	font-size: 50px;
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
		<%request.setCharacterEncoding("utf-8");
		Product product = new Product();
		ProductDao productDao = new ProductDao();
		Category categoryById =new Category();
		CategoryDao categoryDao = new CategoryDao();
			//검색을 이용한 카테고리 페이지 보기
			String categoryName = "";
			if(request.getParameter("categoryName")!=null){
				categoryName= request.getParameter("categoryName");
			}
			categoryById.setCategoryName(categoryName);
			//카테고리 검색결과가 없으면 상품이 없습니다가 뜨고 상품이 있으면 categoryId를 찾아서 기본값으로 넣어둔다
			//like를 사용해서 카테고리 이름을 찾는다
			categoryById =categoryDao.selectCategoryOneById(categoryById);
			
			int categoryId = categoryById.getCategoryId();
			
			//카테고리 를 골라 제품을 보여준다
			//카테고리 번호를 페이지에서 받아온다. -> 받아온 카테고리 번호를 product메서드에 값을 넣는다 
		
			
			if(request.getParameter("categoryId")!=null){
				categoryId =Integer.parseInt(request.getParameter("categoryId"));
			}
			
			product.setCategoryId(categoryId);
			//리스트를 가져오기 위해서 array리스트 (배열)을 사용하고 dao에서 데이터베이스 값을 찾은뒤 배열안에 넣고 배열을 돌리면서 출력을한다.
			//제품 목록 가져와서 출력하기
			
			//ArrayList안에 Product변수 공간을 생성한다, 선택한 카테고리 제품 전체 출력 메서드를 찾아 넣는다
			ArrayList<Product> productList = productDao.selectProductbycategoryIdAll(product);
			
			
			
			
			//카테고리 끼리 출력 이름
			Category category =new Category();
			category.setCategoryId(categoryId);
		  categoryDao.selectCategoryOne(category);
		  
		  
		 
		%>
		<%if(categoryId!=0){ %>
		<div style="margin-top: 30px;">
			<h1 style="text-align: center;"><%=category.getCategoryName() %></h1>
		</div>
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
							<a class="text-secondary"	href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>">
							<img class="card-img-top"
								src="/mall-admin/images/<%=p.getProductPic()%>"
								alt="Card image" width="150" height="150">
							<div class="card-body">
								<h4 class="card-title">
									<%=p.getProductName()%></a>
								</h4>
								<p class="card-text"><%=p.getProductPrice()%> 원</p>

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
			<% }else {
					%><br><br><br><br>
					<div class="size" style="text-align: center;">상품이 없습니다.</div>
					 <%
				}%>
				
	</div>
</body>
</html>