<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%@ page import="java.util.*"%>
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
<%
	CategoryDao categoryDao = new CategoryDao();
//전체 category 이름 리스트 
ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
//추천 category리스트 목록
ArrayList<Category> categoryListCk = categoryDao.selectCategoryCkList();


//카테고리 번호 넣어서 리스트 보여주기 초기값 0
ProductDao productDao = new ProductDao();
ArrayList<Product> productList = null;
Product product = new Product();
int categoryIdShow =0;
if(request.getParameter("categoryIdShow")!=null){
categoryIdShow = Integer.parseInt(request.getParameter("categoryIdShow"));
}
System.out.println(categoryIdShow);

product.setCategoryId(categoryIdShow);
if(categoryIdShow ==0){
productList = productDao.selectProductList();
}else {
	productList = productDao.selectProductbycategoryId(product);
}
%>

<body>
	<!-- 09-23일시작 -->
	<div class="container">
		<div>
			<jsp:include page="/inc/menu.jsp"></jsp:include>
		</div>




		<!-- 최근 공지 2개 -->
		<div>
			<%
				NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
			%>
			<table class="table table-bordered  " style="text-align: center;">
				<%
					for (Notice n : noticeList) {
				%>
				<tr>

					<td colspan="2"><a class="text-secondary"
						href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeId()%></a></td>
					<td><a class="text-secondary"
						href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle()%></a></td>

				</tr>
				<%
					}
				%>


			</table>
		</div>

		<div>
			<!-- 전체 카테고리2/ 이미지 배너8 / 빈공간 1,1 -->
			<div class="row">
				<div class="col-sm-1"></div>
				
				<div class="col-sm-10">
					<!-- 이미지 -->
					<img src="<%=request.getContextPath()%>/images/b1.jpg"
						width="900" height="300">
				</div>
					<div class="col-sm-1"></div>
			</div>
		</div>

		<!-- 추천 카테고리 이미지 링크 -->
		<div>
			<table class="table table-borderless" style="text-align: center;">
				<tr>
					<%
						for (Category c : categoryListCk) {
					%>
					<td><a href=""><img class="rounded-circle"
							alt="<%=c.getCategoryPic() %>"
							src="/mall-admin/images/<%=c.getCategoryPic()%>" width="150"
							height="150"></a>
					<td>
						<%
							}
						%>
					
					<td>
			</table>
		</div>
		<%
			Calendar today = Calendar.getInstance();
		%>
		<!-- 추천 상품 -->
		<div>
			<div>
				<h4>
					<!-- 현재 날짜 -->
					오늘의 추천상품<span class="badge badge-secondary"><%=today.get(Calendar.YEAR)%>.<%=today.get(Calendar.MARCH) + 1%>.<%=today.get(Calendar.DAY_OF_MONTH)%></span>
				</h4>
				<table class="table table-borderless" style="text-align: center;">
					<tr>
						<td><a class="btn btn-secondary" style="width: 100px;"
							href="<%=request.getContextPath()%>/index.jsp">전체</a></td>
						<%
							for (Category c : categoryList1) {
						%>

						<td><a class="btn btn-secondary" style="width: 100px;"
							href="<%=request.getContextPath()%>/index.jsp?categoryIdShow=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a></td>
						<%
							}
						%>
					</tr>
				</table>
			</div>
		</div>
	
			
		<!-- 상품 이미지 카드  -->
		<div>
			<table class="table table-borderless"  style="text-align: center;" >
				<tr>
					<%
						int i = 0;

					for (Product p : productList) {
						i = i + 1;
					%>
		<td>
			<div class="card" style="width: 350px">
				<img class="card-img-top"
					src="/mall-admin/images/<%=p.getProductPic() %>" alt="Card image" width="250" height="250">
				<div class="card-body">
					<h4 class="card-title">
						<a class="text-secondary"
							href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>"><%=p.getProductName()%></a>
					</h4>
					<p class="card-text"><%=p.getProductPrice()%></p>

				</div>
			</div>

		</td>
		<%
						if (i % 3 == 0) {
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