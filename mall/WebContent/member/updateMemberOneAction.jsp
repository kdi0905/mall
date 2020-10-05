<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="vo.*" %>
    <%@page import ="dao.*" %>
<%
	if(session.getAttribute("loginMemberEmail")==null){
		response.sendRedirect(request.getContextPath()+"/member/login.jsp");
	}
	request.setCharacterEncoding("utf-8");
	String nowPw = request.getParameter("nowPw");
	String newPw = request.getParameter("newPw");
	String newPw2 = request.getParameter("newPw2");
	
	//현재 로그인 이메일을 이용해서 비밀번호 값을 가져온다.
	MemberDao memberDao = new MemberDao();
	Member member = new Member();
	member= memberDao.selectMemberOne(session.getAttribute("loginMemberEmail"));
	
		//현재 비밀번호와 로그인된 이메일 비밀번호가  같고 변경비밀번호1과 2가 같으면 
	if(nowPw.equals(member.getMemberPw())&&newPw.equals(newPw2)){
		//둘다 같으면 데이터베이스 에서 비밀번호를 변경
		//session 값을 string으로 변환 해서 변수에 값넣기
		String memberEmail=(String)session.getAttribute("loginMemberEmail");
		//member메서드 에 값넣기
		member.setMemberEmail(memberEmail);
		member.setMemberPw(newPw);
		//수정 메서드 실행
		memberDao.updateMemberOne(member);
		
		response.sendRedirect(request.getContextPath()+"/member/selectMemberOne.jsp");
		
		//현재 비밀번호와 로그인된 이메일 비밀번호가 다르고  변경 비밀번호가 서로  같으면
	}else if(!nowPw.equals(member.getMemberPw())&&newPw.equals(newPw2)){
		response.sendRedirect(request.getContextPath()+"/member/selectMemberOne.jsp?pwCount=1&failNowPw=N");
		
		//현재 비밀번호와 로그인된 이메일 비밀번호가 같고  변경 비밀번호가 서로 다르면
	}else if(nowPw.equals(member.getMemberPw())&&!newPw.equals(newPw2)){
		response.sendRedirect(request.getContextPath()+"/member/selectMemberOne.jsp?pwCount=1&failNewPw=N");
		
		//현재 비밀번호와 로그인된 이메일 비밀번호가 다르고  변경 비밀번호가 서로 다르면
	}else{
		response.sendRedirect(request.getContextPath()+"/member/selectMemberOne.jsp?pwCount=1&failNewPw=N&failNowPw=N");
	}

%>