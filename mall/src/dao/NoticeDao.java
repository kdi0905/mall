package dao;
import vo.*;
import commons.*;
import java.util.*;
import java.sql.*;
public class NoticeDao {
	//최근 공지사항 리스트 2개보기
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbutil = new DBUtil();
		Connection conn =dbutil.getConnection();
		
		String sql ="select notice_id, notice_title from notice order by notice_date desc limit 0,2";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice notice = new Notice();
			//notice.noticeId = rs.getInt("notice_id");
			notice.setNoticeId(rs.getInt("notice_id"));
			//notice.noticeTitle = rs.getString("notice_title");
			notice.setNoticeTitle(rs.getString("notice_title"));
			list.add(notice);
		}
		conn.close();
		return list;
	}
	//공지사항 전체보기
	public ArrayList<Notice> selectNoticeListAll() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbutil = new DBUtil();
		Connection conn =dbutil.getConnection();
		
		String sql ="select notice_id, notice_title, notice_count from notice order by notice_date desc ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Notice notice = new Notice();
			//notice.noticeId = rs.getInt("notice_id");
			notice.setNoticeId(rs.getInt("notice_id"));
			//notice.noticeTitle = rs.getString("notice_title");
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeCount(rs.getInt("notice_count"));
			list.add(notice);
		}
		conn.close();
		return list;
	}
	//공지사항 상세보기
	public Notice selectNoticeOne(Notice notice) throws Exception{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		
		String sql ="select notice_id, notice_title, notice_content, notice_date, notice_count from notice where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, notice.getNoticeId());
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			
			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeContent(rs.getNString("notice_content"));
			notice.setNoticeDate(rs. getString("notice_date"));
			notice.setNoticeCount(rs.getInt("notice_count"));
		}
		conn.close();
		return notice;
	}
	//조회수
	public void noticeOneCount(Notice notice) throws Exception{
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql ="update notice set notice_count =notice_count+1 where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);	
		stmt.setInt(1, notice.getNoticeId());
		stmt.executeUpdate();
		
	}
}
