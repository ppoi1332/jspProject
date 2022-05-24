package javaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SoldierDAO {
	private ConnectionPool pool = null;
	
	public SoldierDAO() {
		try {
			pool = ConnectionPool.getInstance();
		} catch (Exception e) {
			System.out.println("Error : Connection load failed!");
		}
	}
	
	public boolean soldierInsert(SoldierVO sv) {
		boolean bool = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into \"SOLDIER\" values (\"SEQ_SOLDIER\".nextval,?,?,?,?,?,?)";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sv.getId());
			pstmt.setLong(2, sv.getDivision_code());
			pstmt.setLong(3, sv.getPosition_code());
			pstmt.setObject(4, sv.getIn_day());
			pstmt.setObject(5, sv.getOut_day());
			pstmt.setObject(6, sv.getYear_code());
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
