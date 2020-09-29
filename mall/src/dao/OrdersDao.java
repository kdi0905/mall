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
	public ArrayList<OrdersAndProduct> selectOrdersList(Orders orders) throws Exception{
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	
		String sql ="select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name, p.product_price, p.product_pic from orders o inner join product p on o.product_id=p.product_id where o.member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,orders.getMemberEmail());
		ResultSet rs = stmt.executeQuery();
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		while (rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product= new Product();
			oap.orders.setOrdersId(rs.getInt("orders_id"));
			oap.orders.setProductId(rs.getInt("product_id"));		
			oap.orders.setOrdersAmount(rs.getInt("orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("orders_price"));
			oap.orders.setMemberEmail(rs.getString("member_email"));
			oap.orders.setOrdersAddr(rs.getString("orders_addr"));
			oap.orders.setOrdersState(rs.getString("orders_state"));
			oap.orders.setOrdersDate(rs.getString("orders_date"));
			oap.product.setProductName(rs.getString("product_name"));
			oap.product.setProductPrice(rs.getInt("product_price"));
			oap.product.setProductPic(rs.getString("product_pic"));
			list.add(oap);
		}	
		conn.close();
		return list;
	}
}
