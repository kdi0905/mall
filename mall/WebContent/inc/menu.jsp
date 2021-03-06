<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.*"%>
<%@page import="vo.*"%>
<%@page import="java.util.*"%>
<%
	CategoryDao categoryDao = new CategoryDao();
//전체 category 이름 리스트 
ArrayList<Category> categoryList1 = categoryDao.selectCategoryList();
%>
<!-- request.getContextPacth()//파일 위치를 자동으로 설정한다 -->

<div class="row" style="margin-bottom: 10px;">
	<div class="col-sm-1"></div>
	<div class="col-sm-3">
		<h2>
			<a class="text-secondary"
				href="<%=request.getContextPath()%>/index.jsp">Goodee Shop</a>
		</h2>
	</div>

	<div class="col-sm-6">
		<form method="post" action="<%=request.getContextPath()%>/product/productList.jsp">
			
			<div class="input-group" > 
				 <input class="col-sm-8 form-control" type="text" width="100px " name="categoryName"  >
	
				<div class="input-group-append">
					<button class="btn btn-secondary " type="submit">검색</button>
				</div>
			</div>
		</form>
	</div>
	<div class="col-sm-2">
		<a class="text-dark" href="<%=request.getContextPath()%>/member/selectMemberOne.jsp"><i class='far fa-user col-sm-4' style='font-size: 36px'></i></a> 
		<a class="text-dark" href="<%=request.getContextPath()%>/orders/myOrdersList.jsp"><i class='fas fa-shopping-cart col-sm-4' style='font-size: 36px;'></i></a>
	</div>
	
</div>



<!-- 로그인/회원가입 메뉴바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">



	<%
		for (Category c : categoryList1) {
	%>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>"><%=c.getCategoryName()%></a>
		</li>
	</ul>
	<%
		}
	%>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/notice/noticeList.jsp">공지사항</a></li>
	</ul>
	<ul class="navbar-nav mr-auto"></ul>
	<ul class="navbar-nav mr-right">
		<%
			if (session.getAttribute("loginMemberEmail") == null) {
		%>
		<!-- 로그아웃상태  -->


		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/member/signup.jsp">회원가입</a></li>

		<%
			} else {
		%>
		<!-- 로그인 상태 -->
		<%
			MemberDao memberDao = new MemberDao();
		Member member = new Member();
		member =memberDao.selectMemberOne(session.getAttribute("loginMemberEmail"));	
		
		%>
		<li class="nav-item"><font color="white"><%=member.getMemberName()%></font><font
			color="gray">님 환영합니다.</font></li>

		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/member/logoutAction.jsp">로그아웃</a></li>

		<%
			}
		%>
	</ul>
</nav>
