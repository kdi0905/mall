<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="dao.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.*"%>
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
			NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeListAll();
		
		%>
		<table class="table" style="text-align: center;">
			<thead class="thead-light">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<% for(Notice n : noticeList){ %>
						<tr>
							<td class="text-secondary"><%=n.getNoticeId() %></td>
							<td><a class="text-secondary" href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle() %></a></td>
							<td class="text-secondary"><%=n.getNoticeCount()%></td>
						</tr>
			
			<%} %>
			</tbody>
		</table>
		
		
</div>
</body>
</html>