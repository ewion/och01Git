package och11;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	
	private Connection getConnection() throws NamingException {
		Connection conn = null;
		
		try {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	//1. DBCP이용
	//2. prepareStatement사용
	//3. member1의 진짜 Insert 
	
	public int insert (MemberDto member) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member1 values(?,?,?,sysdate)";
		
		try { //연결이 안될수도 있으니 try-catch문으로 예외처리
			//1. DBCP이용
			conn = getConnection();
			
			//2. prepareStatement사용, sql문을 sql에서 실행, 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			// 3. member1진짜 Insert
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		//1. DBCP이용
		//2. prepareStatement사용
		//3. member1의 진짜 Insert 
		
		return result;
	}

}
