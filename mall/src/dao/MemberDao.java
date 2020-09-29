package dao;

import vo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import commons.*;

public class MemberDao {
	//중복 이메일 찾기
	public Member selectMemberEmailCk(String memberEmail) throws Exception {
		Member member = null;

		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		/*
		 * SELECT id from(SELECT member_email id FROM member UNION SELECT admin_id id
		 * FROM admin) t WHERE id= 'goodee@goodee.com';
		 */
		String sql = "select id from (select member_email id from member union select admin_id id from admin) t where id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			//지금 입력한 이메일은 이미 가입중이라 사용할수 없다.
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		return member;
	}
	
	//회원가입
	public void insertMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into member(member_email,member_pw,member_name,member_date) value (?,?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		
		stmt.executeUpdate();
	}
	
	//로그인
	public String login(Member member) throws Exception{
		String memberEmail =null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email from member where member_email=? and member_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			memberEmail = rs.getString("member_email");
		}
		conn.close();
		return memberEmail;
	}
	
	
	//회원 정보 보기
	public Member selectMemberOne(Object memberEmail) throws Exception{
		Member member = new Member();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="select member_email, member_pw, member_name,member_date from member where member_email=? ";
		PreparedStatement stmt = conn.prepareStatement(sql);		
		stmt.setObject(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberPw(rs.getString("member_pw"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
		}
		return member;
	}
	
	//회원 정보 수정
	public void updateMemberOne(Member member)throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn= dbUtil.getConnection();
		String sql ="Update member set member_pw =? where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,member.getMemberPw());
		stmt.setString(2,member.getMemberEmail());
		
		stmt.executeUpdate();
	}
}
