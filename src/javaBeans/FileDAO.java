package javaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileDAO {
	
	private ConnectionPool pool = null;
	
	public FileDAO() {
		try {
			pool = ConnectionPool.getInstance();
		} catch (Exception e) {
			System.out.println("Error : Connection load failed!");
		}
	}
	
	public boolean insertFile(FileVO fo) {
		boolean bool = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into \"FILE\" values (\"SEQ_FILE\".nextval,?,?,?,?,0)";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fo.getTitle());
			pstmt.setString(2, fo.getFile_Name());
			pstmt.setString(3, fo.getId());
			pstmt.setString(4, fo.getContext());
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
	
	public void upCount(long number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update \"FILE\" set \"COUNT\" = \"COUNT\"+1 where \"NUMBER\" = '"+number+"' ";
		
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			int res = pstmt.executeUpdate();		 
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
	}
		
	public List<FileVO> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		List<FileVO> ls = new ArrayList<>();	
		String sql = "select \"NUMBER\", \"TITLE\", \"FILE_NAME\", \"ID\", \"COUNT\" from \"FILE\"";	
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FileVO tmp = new FileVO(
						rs.getLong("NUMBER"),
						rs.getString("TITLE"),
						rs.getString("FILE_NAME"),
						rs.getString("ID"),
						rs.getLong("COUNT")
						);
				ls.add(tmp);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return (ls.size() == 0) ? null : ls;
	}
	
	public FileVO selectIn(long number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		FileVO fv = new FileVO();	
		String sql = "select * from \"FILE\" where \"NUMBER\" ='"+number+"'";	
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				fv = new FileVO(
						rs.getLong("NUMBER"),
						rs.getString("TITLE"),
						rs.getString("FILE_NAME"),
						rs.getString("ID"),
						rs.getString("CONTEXT"),
						rs.getLong("COUNT")
						);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return fv;
	}
}
