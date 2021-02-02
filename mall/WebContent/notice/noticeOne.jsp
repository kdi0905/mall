<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import =" dao.*" %>
 <%@ page import ="vo.*" %>
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
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		Notice notice = new Notice();
		notice.setNoticeId(noticeId);
		NoticeDao noticeDao = new NoticeDao();
		//조회수 구하기
		noticeDao.noticeOneCount(notice);
		
		//하나의 공지사항 검색
		noticeDao.selectNoticeOne(notice);
	%>
		<table class="table "  style="text-align: center;">
			<tr>	
				<td class ="px" colspan="2"><%=notice.getNoticeId()%>&nbsp;.&nbsp;<%=notice.getNoticeTitle()%> </td>
			</tr>
			<tr>
				<td colspan="2"><span style="font-size: 13px; float: left; margin-left: 100px;" class="badge badge-info"> <%=notice.getNoticeDate()%></span> <span class="badge badge-success" style="float: right; margin-right: 100px;" >조회수<%=notice.getNoticeCount() %></span></td>
				
			</tr>
			<tr>
				<td colspan="2" style="margin-top: 50px;"><textarea rows="5px" cols="100px" readonly="readonly" > <%=notice.getNoticeContent()%></textarea></td>
			</tr>
		</table>
		<a  class="btn btn-secondary" href="<%=request.getContextPath()%>/notice/noticeList.jsp">목록</a>
		
</div>
</body>
</html>