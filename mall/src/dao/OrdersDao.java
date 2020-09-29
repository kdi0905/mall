package dao;
import vo.*;
import commons.*;
import java.sql.*;
import java.util.*;
public class OrdersDao {
	//주문 추가
	public void insertOrders(Orders orders)throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn= dbUtil.getConnection();
		String sql = "insert into orders(product_id, orders_amount, orders_price, member_email, orders_addr, orders_state, orders_date) values(?,?,?,?,?,'결제완료',now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2,orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMemberEmail());
		stmt.setString(5, orders.getOrdersAddr());
		stmt.executeUpdate();
		conn.close();
	}
	
	//주문 목록보기
	public ArrayList<Orders> selectOrdersList() throws Exception{
		
		return null;
	}
}
