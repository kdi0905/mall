<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="dao.*"%>
<%@ page import ="vo.*"%>
<%
	//로그인 중임에도 이 파일을 접근했을때
	if(session.getAttribute("loginMemberEmail")!=null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
  // signup.jsp에서 값 받아오기
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	String memberName = request.getParameter("memberName");
	
	//사용가능한 이메일 검사 
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail);
	
	if(member != null){

		response.sendRedirect(request.getContextPath()+"/member/signup.jsp");
		return;
	}
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberName(memberName);
	//회원가입 추가
	memberDao.insertMember(paramMember);
		
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>