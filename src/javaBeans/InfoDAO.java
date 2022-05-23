package javaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InfoDAO {

	private ConnectionPool pool = null;
	
	public InfoDAO() {
		try {
			pool = ConnectionPool.getInstance();
		} catch (Exception e) {
			System.out.println("Error : Connection load failed!");
		}
	}
	
	public boolean idCheck(String id) {
		boolean result =  true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from \"INFO\" where id= ?";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) result = false;
						
		} catch(Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				}catch(SQLException e) {				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				}catch (SQLException e) {}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
		}
		
		return result;
		
	}
	
	public boolean insert(InfoVO vo) {
		boolean bool = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into \"INFO\" values (?,?,?,?,?)";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getName());
			pstmt.setObject(4, vo.getBirth());
			pstmt.setString(5, vo.getEmail());
			int res = pstmt.executeUpdate();
			System.out.println("입력완료");
			bool = true;			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				}catch (SQLException e) {}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
		}
		return bool;
	}
}
