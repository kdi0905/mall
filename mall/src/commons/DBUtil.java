package commons;
import  java.sql.*;
public class DBUtil {
	
	public Connection getConnection() throws Exception{
		String Driver = "org.mariadb.jdbc.Driver";
		String dbadr = "jdbc:mariadb://kdi0905.kro.kr/mall";
		String dbid = "root";
		String dbpw = "java1004";
		Class.forName(Driver);
		Connection conn = DriverManager.getConnection(dbadr,dbid,dbpw);
		return conn;
	}
}
