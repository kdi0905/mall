package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import commons.DBUtil;
import vo.*;
public class ProductDao {
	//상품 리스트 6개 보기
	public ArrayList<Product> selectProductList()throws Exception{
		
		ArrayList<Product> list = new ArrayList<Product>();
		//commons클래스 안에있는 db접속 명령어를 불러온다
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql="select  product_id, product_pic, product_name, product_price from product limit 0,6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Product p =new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			list.add(p);
		}
		conn.close();
		return list;
		
	}
	//페이지 상세보기
	public Product selectProductOne(int productId) throws Exception{
		Product product = new Product();
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql="select product_id, category_id, product_pic, product_name, product_price, product_content, product_soldout from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,productId);
		ResultSet rs= stmt.executeQuery();
				while (rs.next()) {
					product.setProductId(rs.getInt("product_id")); 
					product.setCategoryId(rs.getInt("category_id"));
					product.setProductName(rs.getString("product_name"));
					product.setProductPrice(rs.getInt("product_price"));
					product.setProductContent(rs.getString("product_content"));
					product.setProductSoldout(rs.getString("product_soldout"));
					product.setProductPic(rs.getString("product_pic"));
					
				}
				conn.close();
		return product;
	}
	//선택한 카테고리 제품만 보기
	public ArrayList<Product> selectProductbycategoryId(Product product) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil =new DBUtil();
		Connection conn= dbUtil.getConnection();
		String sql ="select product_id, product_name, product_price ,product_pic, product_soldout from product where category_id=? limit 0,6";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
	//선택한 카테고리 제품 전체 보기
	public ArrayList<Product> selectProductbycategoryIdAll(Product product) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		DBUtil dbUtil =new DBUtil();
		Connection conn= dbUtil.getConnection();
		String sql ="select product_id, product_name, product_price ,product_pic, product_soldout from product where category_id=? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, product.getCategoryId());
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product p = new Product();
			p.setProductId(rs.getInt("product_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductSoldout(rs.getString("product_soldout"));
			list.add(p);
		}
		conn.close();
		return list;
	}
}
